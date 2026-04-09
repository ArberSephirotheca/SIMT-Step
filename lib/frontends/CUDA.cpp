#include "simt-step/Frontends/Common/LoopScopeSupport.h"
#include "simt-step/Frontends/Common/LoweringAlgebra.h"
#include "simt-step/Frontends/Common/Result.h"
#include "simt-step/Dialect/SimtStep/SimtStepDialect.h"

#include "clang/AST/ASTConsumer.h"
#include "clang/AST/Attr.h"
#include "clang/AST/Decl.h"
#include "clang/AST/Expr.h"
#include "clang/AST/RecursiveASTVisitor.h"
#include "clang/AST/Stmt.h"
#include "clang/AST/Type.h"
#include "clang/Basic/SourceManager.h"
#include "clang/Frontend/CompilerInstance.h"
#include "clang/Frontend/FrontendActions.h"
#include "clang/Tooling/Tooling.h"
#include "llvm/ADT/APInt.h"
#include "llvm/ADT/ArrayRef.h"
#include "llvm/ADT/StringRef.h"
#include "llvm/ADT/StringSwitch.h"
#include "mlir/Dialect/Arith/IR/Arith.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/BuiltinDialect.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/IR/BuiltinTypes.h"
#include "mlir/IR/MLIRContext.h"
#include "mlir/IR/OwningOpRef.h"

#include <cassert>
#include <memory>
#include <optional>
#include <string>
#include <vector>

namespace simt::frontend {

namespace {

constexpr int64_t kPhase6CudaWorkgroupX = 32;
constexpr int64_t kPhase6CudaWorkgroupY = 1;
constexpr int64_t kPhase6CudaWorkgroupZ = 1;
constexpr int64_t kPhase6CudaFirstSiteId = 70;

mlir::Location canonicalizeLineStartLoc(mlir::Location loc) {
  if (auto fileLoc = llvm::dyn_cast<mlir::FileLineColLoc>(loc))
    return mlir::FileLineColLoc::get(fileLoc.getContext(),
                                     fileLoc.getFilename(), fileLoc.getLine(),
                                     1);
  return loc;
}

mlir::Location resolveLoc(const SourceLoc &src, LoweringContext &ctx) {
  (void)ctx;
  return canonicalizeLineStartLoc(src.mlirLoc);
}

SourceLoc makeEndSourceLoc(const clang::Stmt *stmt, LoweringContext &ctx) {
  if (!stmt)
    return SourceLoc{nullptr, ctx.defaultLoc};

  if (!ctx.sourceManager)
    return SourceLoc{stmt, ctx.defaultLoc};

  const clang::SourceManager &sm = *ctx.sourceManager;
  clang::SourceLocation loc = stmt->getEndLoc();
  if (loc.isInvalid())
    loc = stmt->getBeginLoc();
  if (loc.isInvalid())
    return SourceLoc{stmt, ctx.defaultLoc};

  loc = sm.getExpansionLoc(loc);
  clang::PresumedLoc presumed = sm.getPresumedLoc(loc);
  if (!presumed.isValid())
    return SourceLoc{stmt, ctx.defaultLoc};

  mlir::MLIRContext *mlirCtx = ctx.builder.getContext();
  mlir::StringAttr fileAttr =
      mlir::StringAttr::get(mlirCtx, presumed.getFilename());
  mlir::Location mlirLoc =
      mlir::FileLineColLoc::get(fileAttr, presumed.getLine(),
                                presumed.getColumn());
  return SourceLoc{stmt, mlirLoc};
}

void signalError(LoweringContext &ctx, SourceLoc loc, llvm::StringRef message) {
  ctx.diagnostics().report(loc, message);
  ctx.failed = true;
}

void signalError(LoweringContext &ctx, const clang::Stmt *stmt,
                 llvm::StringRef message) {
  signalError(ctx, makeSourceLoc(stmt, ctx), message);
}

std::string buildIntegerTag(mlir::Type type) {
  if (auto intType = llvm::dyn_cast<mlir::IntegerType>(type))
    return (llvm::Twine("i") + llvm::Twine(intType.getWidth())).str();
  if (mlir::isa<mlir::IndexType>(type))
    return "index";
  return {};
}

mlir::Type parseTypeTag(llvm::StringRef tag, LoweringContext &ctx) {
  if (tag.empty())
    return {};
  if (tag == "index")
    return ctx.builder.getIndexType();
  if (!tag.consume_front("i"))
    return {};

  unsigned width = 0;
  if (tag.getAsInteger(10, width))
    return {};
  return ctx.builder.getIntegerType(width);
}

mlir::Type convertType(const clang::QualType &qt, LoweringContext &ctx) {
  const clang::Type *type = qt.getCanonicalType().getTypePtrOrNull();
  if (!type)
    return {};

  while (auto *elab = llvm::dyn_cast<clang::ElaboratedType>(type))
    type = elab->getNamedType().getTypePtr();
  type = type->getUnqualifiedDesugaredType();

  if (type->isVoidType())
    return ctx.builder.getNoneType();
  if (type->isBooleanType())
    return ctx.builder.getI1Type();
  if (type->isIntegerType()) {
    unsigned width = 32;
    if (ctx.astContext)
      width = static_cast<unsigned>(ctx.astContext->getTypeSize(qt));
    return ctx.builder.getIntegerType(width);
  }

  return {};
}

mlir::Value buildZeroValue(LoweringContext &ctx, mlir::Type type,
                           SourceLoc loc) {
  auto intType = llvm::dyn_cast<mlir::IntegerType>(type);
  if (!intType)
    return {};
  return ctx.builder.create<mlir::arith::ConstantOp>(
      resolveLoc(loc, ctx), ctx.builder.getIntegerAttr(intType, 0));
}

mlir::Value castIntegerValue(LoweringContext &ctx, mlir::Value value,
                             mlir::Type targetType, SourceLoc loc) {
  if (!value)
    return {};
  if (value.getType() == targetType)
    return value;

  auto sourceInt = llvm::dyn_cast<mlir::IntegerType>(value.getType());
  auto targetInt = llvm::dyn_cast<mlir::IntegerType>(targetType);
  if (!sourceInt || !targetInt) {
    signalError(ctx, loc, "unsupported integer cast in CUDA importer");
    return {};
  }

  mlir::Location mlirLoc = resolveLoc(loc, ctx);
  if (targetInt.getWidth() == 1) {
    mlir::Value zero = buildZeroValue(ctx, value.getType(), loc);
    if (!zero) {
      signalError(ctx, loc, "failed to materialize boolean cast zero value");
      return {};
    }
    return ctx.builder
        .create<mlir::arith::CmpIOp>(mlirLoc, mlir::arith::CmpIPredicate::ne,
                                     value, zero)
        .getResult();
  }

  if (sourceInt.getWidth() == 1)
    return ctx.builder
        .create<mlir::arith::ExtUIOp>(mlirLoc, targetType, value)
        .getResult();
  if (sourceInt.getWidth() < targetInt.getWidth())
    return ctx.builder
        .create<mlir::arith::ExtUIOp>(mlirLoc, targetType, value)
        .getResult();
  if (sourceInt.getWidth() > targetInt.getWidth())
    return ctx.builder
        .create<mlir::arith::TruncIOp>(mlirLoc, targetType, value)
        .getResult();
  return value;
}

mlir::Value ensureBooleanValue(LoweringContext &ctx, mlir::Value value,
                               SourceLoc loc) {
  if (!value)
    return {};

  auto intType = llvm::dyn_cast<mlir::IntegerType>(value.getType());
  if (!intType) {
    signalError(ctx, loc, "CUDA importer expects scalar integer conditions");
    return {};
  }
  if (intType.getWidth() == 1)
    return value;

  mlir::Value zero = buildZeroValue(ctx, value.getType(), loc);
  if (!zero) {
    signalError(ctx, loc, "failed to materialize comparison zero value");
    return {};
  }

  return ctx.builder
      .create<mlir::arith::CmpIOp>(resolveLoc(loc, ctx),
                                   mlir::arith::CmpIPredicate::ne, value, zero)
      .getResult();
}

bool isThreadIdxXAccess(const clang::MemberExpr *member) {
  if (!member)
    return false;

  const auto *field = member->getMemberDecl();
  if (!field || field->getName() != "x")
    return false;

  const clang::Expr *base = member->getBase()->IgnoreParenImpCasts();
  const auto *baseRef = llvm::dyn_cast<clang::DeclRefExpr>(base);
  if (!baseRef)
    return false;

  return baseRef->getNameInfo().getAsString() == "threadIdx";
}

bool isFullWarpMask(const clang::Expr *expr, const clang::ASTContext &astCtx) {
  if (!expr)
    return false;

  clang::Expr::EvalResult eval;
  if (!expr->EvaluateAsInt(eval, astCtx))
    return false;

  llvm::APInt mask = eval.Val.getInt();
  if (mask.getBitWidth() < 32)
    mask = mask.zext(32);
  else if (mask.getBitWidth() > 32)
    mask = mask.trunc(32);
  return mask.isAllOnes();
}

std::string wrapCudaSource(llvm::StringRef fileName, llvm::StringRef source) {
  std::string wrapped;
  wrapped.reserve(source.size() + 512);
  wrapped += "#line 1 \"simt-cuda-import-prelude\"\n";
  wrapped += "#ifndef __global__\n#define __global__ __attribute__((global))\n#endif\n";
  wrapped += "#ifndef __device__\n#define __device__ __attribute__((device))\n#endif\n";
  wrapped += "struct dim3 { unsigned x; unsigned y; unsigned z; };\n";
  wrapped += "extern const __device__ dim3 threadIdx;\n";
  wrapped += "extern \"C\" __device__ int __any_sync(unsigned mask, int pred);\n";
  wrapped += "extern \"C\" __device__ unsigned __ballot_sync(unsigned mask, int pred);\n";
  wrapped += "#line 1 \"";
  wrapped += fileName.str();
  wrapped += "\"\n";
  wrapped += source.str();
  return wrapped;
}

class CudaEmitInterpreter
    : public LoweringAlgebra<CudaEmitInterpreter, mlir::Value> {
public:
  struct IfScope {
    IfScope(LoweringContext &parentCtx, simt::dialect::IfOp op,
            mlir::Location loc)
        : parent(parentCtx), ifOp(op), loc(loc) {}

    LoweringContext &thenContext() {
      if (!thenCtxStorage) {
        mlir::Region &region = ifOp.getThenRegion();
        if (region.empty())
          region.emplaceBlock();
        mlir::Block &block = region.front();
        block.clear();
        thenBuilder.emplace(parent.builder.getContext());
        thenBuilder->setInsertionPointToEnd(&block);
        thenCtxStorage = std::make_unique<LoweringContext>(
            *thenBuilder, loc, parent.returnType, parent.errorMessage,
            parent.sourceManager, parent.astContext);
        cloneContextState(parent, *thenCtxStorage);
      }
      return *thenCtxStorage;
    }

    bool done() {
      if (!finalizeRegion(&thenCtxStorage, ifOp.getThenRegion()))
        return false;
      if (!finalizeRegion(nullptr, ifOp.getElseRegion()))
        return false;
      return !parent.failed;
    }

  private:
    bool finalizeRegion(std::unique_ptr<LoweringContext> *branchCtx,
                        mlir::Region &region) {
      if (region.empty())
        region.emplaceBlock();
      mlir::Block &block = region.front();
      if (!branchCtx || !*branchCtx) {
        if (block.empty())
          mlir::OpBuilder::atBlockEnd(&block).create<simt::dialect::YieldOp>(
              loc);
        else if (!block.back().hasTrait<mlir::OpTrait::IsTerminator>())
          mlir::OpBuilder::atBlockEnd(&block).create<simt::dialect::YieldOp>(
              loc);
        return true;
      }

      if ((*branchCtx)->emittedTerminator)
        return true;

      if (block.empty() || !block.back().hasTrait<mlir::OpTrait::IsTerminator>())
        mlir::OpBuilder::atBlockEnd(&block).create<simt::dialect::YieldOp>(loc);
      return true;
    }

    LoweringContext &parent;
    simt::dialect::IfOp ifOp;
    mlir::Location loc;
    std::optional<mlir::OpBuilder> thenBuilder;
    std::unique_ptr<LoweringContext> thenCtxStorage;
  };

  CudaEmitInterpreter(LoweringContext &ctx, unsigned &collectiveCount,
                      int64_t &nextSiteId)
      : ctx(ctx), collectiveCount(collectiveCount), nextSiteId(nextSiteId) {
    assert(ctx.builder.getInsertionBlock() &&
           ctx.builder.getInsertionBlock()->getParentOp() &&
           "CudaEmitInterpreter requires anchored builder");
  }

  CudaEmitInterpreter fork(LoweringContext &childCtx) {
    return CudaEmitInterpreter(childCtx, collectiveCount, nextSiteId);
  }

  IfScope beginIf(mlir::Value cond, mlir::Location loc) {
    auto ifOp = ctx.builder.create<simt::dialect::IfOp>(
        loc, mlir::TypeRange{}, cond, /*withElseRegion=*/true);
    return IfScope(ctx, ifOp, loc);
  }

  mlir::Value emitConstantInt(int64_t value, const char *tag, SourceLoc loc) {
    mlir::Type type = parseTypeTag(tag ? llvm::StringRef(tag) : llvm::StringRef(),
                                   ctx);
    auto intType = llvm::dyn_cast_or_null<mlir::IntegerType>(type);
    if (!intType) {
      reportError(loc, "unsupported integer literal type in CUDA importer");
      return {};
    }

    return ctx.builder.create<mlir::arith::ConstantOp>(
        resolveLoc(loc, ctx), ctx.builder.getIntegerAttr(intType, value));
  }

  mlir::Value emitCompare(CmpOp op, mlir::Value lhs, mlir::Value rhs,
                          SourceLoc loc) {
    if (!lhs || !rhs)
      return {};

    auto lhsType = llvm::dyn_cast<mlir::IntegerType>(lhs.getType());
    auto rhsType = llvm::dyn_cast<mlir::IntegerType>(rhs.getType());
    if (!lhsType || !rhsType || lhs.getType() != rhs.getType()) {
      reportError(loc, "CUDA importer only supports integer comparisons");
      return {};
    }

    mlir::arith::CmpIPredicate predicate = mlir::arith::CmpIPredicate::eq;
    switch (op) {
    case CmpOp::EQ:
      predicate = mlir::arith::CmpIPredicate::eq;
      break;
    case CmpOp::NE:
      predicate = mlir::arith::CmpIPredicate::ne;
      break;
    case CmpOp::LT:
      predicate = mlir::arith::CmpIPredicate::slt;
      break;
    case CmpOp::LE:
      predicate = mlir::arith::CmpIPredicate::sle;
      break;
    case CmpOp::GT:
      predicate = mlir::arith::CmpIPredicate::sgt;
      break;
    case CmpOp::GE:
      predicate = mlir::arith::CmpIPredicate::sge;
      break;
    }

    return ctx.builder
        .create<mlir::arith::CmpIOp>(resolveLoc(loc, ctx), predicate, lhs, rhs)
        .getResult();
  }

  mlir::Value emitWaveIntrinsic(WaveIntrinsic op,
                                llvm::ArrayRef<mlir::Value> operands,
                                mlir::Type resultType, SourceLoc loc) {
    (void)resultType;
    if (op != WaveIntrinsic::ActiveAnyTrue) {
      reportError(loc,
                  "CUDA importer only supports __any_sync for the first slice");
      return {};
    }
    if (operands.size() != 1) {
      reportError(loc, "__any_sync lowering expects one predicate operand");
      return {};
    }

    mlir::Value predicate = ensureBooleanValue(ctx, operands.front(), loc);
    if (!predicate)
      return {};

    ++collectiveCount;
    if (collectiveCount > 1) {
      reportError(loc,
                  "CUDA importer supports exactly one top-level vote intrinsic per kernel");
      return {};
    }

    auto anyOp = ctx.builder.create<simt::dialect::WaveAnyOp>(
        resolveLoc(loc, ctx), ctx.builder.getI1Type(), predicate);
    anyOp->setAttr("site_id", ctx.builder.getI64IntegerAttr(nextSiteId++));
    return anyOp.getResult();
  }

  mlir::Value lookupVariable(const clang::ValueDecl *decl) {
    auto it = ctx.valueMap.find(decl);
    return it != ctx.valueMap.end() ? it->second : mlir::Value();
  }

  void bindVariable(const clang::ValueDecl *decl, mlir::Value value) {
    ctx.valueMap[decl] = value;
    ctx.symValueMap[decl] = makeSymValue(decl);
  }

  void noteMutation(const clang::ValueDecl *decl) { ctx.mutatedVars.insert(decl); }

  void emitReturn(std::optional<mlir::Value> value, SourceLoc loc) {
    if (value) {
      reportError(loc, "CUDA kernels in the first slice must return void");
      return;
    }
    ctx.builder.create<mlir::func::ReturnOp>(resolveLoc(loc, ctx));
    ctx.emittedTerminator = true;
  }

  void trace(const char *, SourceLoc) {}

  void reportError(SourceLoc loc, llvm::StringRef message) {
    signalError(ctx, loc, message);
  }

private:
  LoweringContext &ctx;
  unsigned &collectiveCount;
  int64_t &nextSiteId;
};

mlir::Value lowerExpr(const clang::Expr *expr, LoweringContext &ctx,
                      CudaEmitInterpreter &interp, unsigned controlDepth);

mlir::Value lowerCastExpr(const clang::ImplicitCastExpr *castExpr,
                          LoweringContext &ctx, CudaEmitInterpreter &interp,
                          unsigned controlDepth) {
  mlir::Value value = lowerExpr(castExpr->getSubExpr(), ctx, interp, controlDepth);
  if (!value)
    return {};

  SourceLoc loc = makeSourceLoc(castExpr, ctx);
  switch (castExpr->getCastKind()) {
  case clang::CK_LValueToRValue:
  case clang::CK_NoOp:
    return value;
  case clang::CK_IntegralCast:
  case clang::CK_IntegralToBoolean: {
    mlir::Type targetType = convertType(castExpr->getType(), ctx);
    if (!targetType) {
      signalError(ctx, castExpr, "unsupported cast target in CUDA importer");
      return {};
    }
    return castIntegerValue(ctx, value, targetType, loc);
  }
  default:
    signalError(ctx, castExpr, "unsupported implicit cast in CUDA importer");
    return {};
  }
}

mlir::Value lowerMemberExpr(const clang::MemberExpr *member, LoweringContext &ctx,
                            CudaEmitInterpreter &interp) {
  if (!isThreadIdxXAccess(member)) {
    signalError(ctx, member,
                "CUDA importer only supports the threadIdx.x builtin in the first slice");
    return {};
  }

  mlir::Type resultType = convertType(member->getType(), ctx);
  if (!resultType) {
    signalError(ctx, member, "unsupported threadIdx.x result type");
    return {};
  }

  return ctx.builder
      .create<simt::dialect::GroupThreadIdOp>(resolveLoc(makeSourceLoc(member, ctx), ctx),
                                              resultType)
      .getResult();
}

mlir::Value lowerCallExpr(const clang::CallExpr *call, LoweringContext &ctx,
                          CudaEmitInterpreter &interp, unsigned controlDepth) {
  const auto *callee = call->getDirectCallee();
  if (!callee) {
    signalError(ctx, call, "unsupported indirect call in CUDA importer");
    return {};
  }

  llvm::StringRef name = callee->getName();
  SourceLoc loc = makeSourceLoc(call, ctx);

  if (name == "__ballot_sync") {
    signalError(ctx, call,
                "CUDA importer first slice supports __any_sync only; __ballot_sync remains future work");
    return {};
  }

  if (name != "__any_sync") {
    signalError(ctx, call, "unsupported CUDA call in first importer slice");
    return {};
  }

  if (controlDepth != 0) {
    signalError(ctx, call,
                "CUDA vote intrinsics are only supported at top level; nested or reconverged collectives remain unsupported");
    return {};
  }
  if (call->getNumArgs() != 2) {
    signalError(ctx, call, "__any_sync expects exactly two arguments");
    return {};
  }
  if (!ctx.astContext || !isFullWarpMask(call->getArg(0), *ctx.astContext)) {
    signalError(ctx, call,
                "CUDA importer only supports full-mask __any_sync(0xffffffffu, predicate); masked collectives remain unsupported");
    return {};
  }

  mlir::Value predicate =
      lowerExpr(call->getArg(1)->IgnoreParenImpCasts(), ctx, interp, controlDepth);
  if (!predicate)
    return {};

  mlir::Type resultType = convertType(call->getType(), ctx);
  if (!resultType) {
    signalError(ctx, call, "unsupported __any_sync result type");
    return {};
  }

  return interp.emitWaveIntrinsic(WaveIntrinsic::ActiveAnyTrue, {predicate},
                                  resultType, loc);
}

mlir::Value lowerBinaryExpr(const clang::BinaryOperator *binOp,
                            LoweringContext &ctx, CudaEmitInterpreter &interp,
                            unsigned controlDepth) {
  mlir::Value lhs = lowerExpr(binOp->getLHS(), ctx, interp, controlDepth);
  mlir::Value rhs = lowerExpr(binOp->getRHS(), ctx, interp, controlDepth);
  if (!lhs || !rhs)
    return {};

  switch (binOp->getOpcode()) {
  case clang::BO_EQ:
    return interp.emitCompare(CmpOp::EQ, lhs, rhs, makeSourceLoc(binOp, ctx));
  case clang::BO_NE:
    return interp.emitCompare(CmpOp::NE, lhs, rhs, makeSourceLoc(binOp, ctx));
  case clang::BO_LT:
    return interp.emitCompare(CmpOp::LT, lhs, rhs, makeSourceLoc(binOp, ctx));
  case clang::BO_LE:
    return interp.emitCompare(CmpOp::LE, lhs, rhs, makeSourceLoc(binOp, ctx));
  case clang::BO_GT:
    return interp.emitCompare(CmpOp::GT, lhs, rhs, makeSourceLoc(binOp, ctx));
  case clang::BO_GE:
    return interp.emitCompare(CmpOp::GE, lhs, rhs, makeSourceLoc(binOp, ctx));
  default:
    signalError(ctx, binOp,
                "CUDA importer first slice only supports integer comparisons");
    return {};
  }
}

mlir::Value lowerExpr(const clang::Expr *expr, LoweringContext &ctx,
                      CudaEmitInterpreter &interp, unsigned controlDepth) {
  if (!expr)
    return {};

  if (const auto *paren = llvm::dyn_cast<clang::ParenExpr>(expr))
    return lowerExpr(paren->getSubExpr(), ctx, interp, controlDepth);

  if (const auto *castExpr = llvm::dyn_cast<clang::ImplicitCastExpr>(expr))
    return lowerCastExpr(castExpr, ctx, interp, controlDepth);

  if (const auto *boolLiteral = llvm::dyn_cast<clang::CXXBoolLiteralExpr>(expr))
    return interp.emitConstantInt(boolLiteral->getValue() ? 1 : 0, "i1",
                                  makeSourceLoc(expr, ctx));

  if (const auto *intLiteral = llvm::dyn_cast<clang::IntegerLiteral>(expr)) {
    mlir::Type type = convertType(expr->getType(), ctx);
    std::string tag = buildIntegerTag(type);
    if (tag.empty()) {
      signalError(ctx, expr, "unsupported integer literal type");
      return {};
    }
    return interp.emitConstantInt(
        static_cast<int64_t>(intLiteral->getValue().getLimitedValue()),
        tag.c_str(), makeSourceLoc(expr, ctx));
  }

  if (const auto *declRef = llvm::dyn_cast<clang::DeclRefExpr>(expr)) {
    mlir::Value value = interp.lookupVariable(declRef->getDecl());
    if (!value)
      signalError(ctx, expr, "reference to unknown value in CUDA importer");
    return value;
  }

  if (const auto *member = llvm::dyn_cast<clang::MemberExpr>(expr))
    return lowerMemberExpr(member, ctx, interp);

  if (const auto *call = llvm::dyn_cast<clang::CallExpr>(expr))
    return lowerCallExpr(call, ctx, interp, controlDepth);

  if (const auto *binOp = llvm::dyn_cast<clang::BinaryOperator>(expr))
    return lowerBinaryExpr(binOp, ctx, interp, controlDepth);

  signalError(ctx, expr, "unsupported expression in CUDA importer first slice");
  return {};
}

bool lowerStatement(const clang::Stmt *stmt, LoweringContext &ctx,
                    CudaEmitInterpreter &interp, unsigned controlDepth);

bool lowerCompoundStmt(const clang::CompoundStmt *compound, LoweringContext &ctx,
                       CudaEmitInterpreter &interp, unsigned controlDepth) {
  for (const clang::Stmt *child : compound->body()) {
    if (ctx.failed || ctx.emittedTerminator)
      break;
    if (!lowerStatement(child, ctx, interp, controlDepth))
      return false;
  }
  return !ctx.failed;
}

bool lowerDeclStmt(const clang::DeclStmt *declStmt, LoweringContext &ctx,
                   CudaEmitInterpreter &interp, unsigned controlDepth) {
  (void)controlDepth;
  if (declStmt->isSingleDecl()) {
    const auto *var = llvm::dyn_cast<clang::VarDecl>(declStmt->getSingleDecl());
    if (!var) {
      signalError(ctx, declStmt, "unsupported declaration in CUDA importer");
      return false;
    }
    if (!var->hasInit()) {
      signalError(ctx, declStmt,
                  "CUDA importer first slice requires initialized local variables");
      return false;
    }

    mlir::Type type = convertType(var->getType(), ctx);
    if (!type || mlir::isa<mlir::NoneType>(type)) {
      signalError(ctx, declStmt, "unsupported local variable type in CUDA importer");
      return false;
    }

    mlir::Value init = lowerExpr(var->getInit(), ctx, interp, controlDepth);
    if (!init)
      return false;
    if (init.getType() != type) {
      signalError(ctx, declStmt,
                  "local initializer type mismatch in CUDA importer");
      return false;
    }

    interp.bindVariable(var, init);
    return true;
  }

  signalError(ctx, declStmt,
              "CUDA importer first slice only supports single local declarations");
  return false;
}

bool lowerIfStmt(const clang::IfStmt *ifStmt, LoweringContext &ctx,
                 CudaEmitInterpreter &interp, unsigned controlDepth) {
  if (ifStmt->getInit() || ifStmt->getConditionVariable()) {
    signalError(ctx, ifStmt,
                "CUDA importer first slice does not support if-init or condition variables");
    return false;
  }
  if (ifStmt->getElse()) {
    signalError(ctx, ifStmt,
                "CUDA importer first slice does not support else branches");
    return false;
  }

  mlir::Value cond = lowerExpr(ifStmt->getCond(), ctx, interp, controlDepth);
  if (!cond)
    return false;
  cond = ensureBooleanValue(ctx, cond, makeSourceLoc(ifStmt->getCond(), ctx));
  if (!cond)
    return false;

  auto scope = interp.beginIf(cond, resolveLoc(makeSourceLoc(ifStmt, ctx), ctx));
  LoweringContext &thenCtx = scope.thenContext();
  CudaEmitInterpreter thenInterp = interp.fork(thenCtx);
  if (!lowerStatement(ifStmt->getThen(), thenCtx, thenInterp, controlDepth + 1))
    return false;
  return scope.done();
}

bool lowerReturnStmt(const clang::ReturnStmt *retStmt, LoweringContext &ctx,
                     CudaEmitInterpreter &interp) {
  if (retStmt->getRetValue()) {
    signalError(ctx, retStmt,
                "CUDA kernels in the first slice must not return a value");
    return false;
  }
  interp.emitReturn(std::nullopt, makeSourceLoc(retStmt, ctx));
  return !ctx.failed;
}

bool lowerStatement(const clang::Stmt *stmt, LoweringContext &ctx,
                    CudaEmitInterpreter &interp, unsigned controlDepth) {
  if (!stmt)
    return true;

  if (const auto *compound = llvm::dyn_cast<clang::CompoundStmt>(stmt))
    return lowerCompoundStmt(compound, ctx, interp, controlDepth);
  if (const auto *declStmt = llvm::dyn_cast<clang::DeclStmt>(stmt))
    return lowerDeclStmt(declStmt, ctx, interp, controlDepth);
  if (const auto *ifStmt = llvm::dyn_cast<clang::IfStmt>(stmt))
    return lowerIfStmt(ifStmt, ctx, interp, controlDepth);
  if (const auto *retStmt = llvm::dyn_cast<clang::ReturnStmt>(stmt))
    return lowerReturnStmt(retStmt, ctx, interp);
  if (const auto *exprStmt = llvm::dyn_cast<clang::Expr>(stmt)) {
    (void)lowerExpr(exprStmt, ctx, interp, controlDepth);
    return !ctx.failed;
  }

  signalError(ctx, stmt, "unsupported statement in CUDA importer first slice");
  return false;
}

class KernelLoweringVisitor
    : public clang::RecursiveASTVisitor<KernelLoweringVisitor> {
public:
  KernelLoweringVisitor(mlir::OwningOpRef<mlir::ModuleOp> &module,
                        mlir::OpBuilder &builder)
      : module(module), moduleBuilder(builder) {}

  bool VisitFunctionDecl(const clang::FunctionDecl *decl) {
    if (!decl || !decl->hasBody() || !decl->hasAttr<clang::CUDAGlobalAttr>())
      return true;

    if (foundKernel) {
      recordError(
          "CUDA importer first slice supports exactly one __global__ kernel per translation unit");
      return false;
    }
    foundKernel = true;

    if (!decl->getReturnType()->isVoidType()) {
      recordError("CUDA importer first slice requires a void __global__ kernel");
      return false;
    }
    if (decl->getNumParams() != 0) {
      recordError(
          "CUDA importer first slice currently supports __global__ kernels without parameters");
      return false;
    }

    mlir::OpBuilder::InsertionGuard guard(moduleBuilder);
    moduleBuilder.setInsertionPointToEnd(module->getBody());

    mlir::Location loc = moduleBuilder.getUnknownLoc();
    auto funcType = moduleBuilder.getFunctionType({}, {});
    auto func =
        moduleBuilder.create<mlir::func::FuncOp>(loc, decl->getNameAsString(), funcType);
    func->setAttr(
        "simt.num_threads",
        moduleBuilder.getI64ArrayAttr({kPhase6CudaWorkgroupX,
                                       kPhase6CudaWorkgroupY,
                                       kPhase6CudaWorkgroupZ}));

    mlir::Block *entry = func.addEntryBlock();
    mlir::OpBuilder funcBuilder(entry, entry->begin());

    const clang::ASTContext &astContext = decl->getASTContext();
    const clang::SourceManager &sourceManager = astContext.getSourceManager();
    LoweringContext ctx(funcBuilder, loc, mlir::Type(), errorMessage,
                        &sourceManager, &astContext);
    mlir::Location funcLoc = canonicalizeLineStartLoc(makeSourceLoc(decl, ctx).mlirLoc);
    func->setLoc(funcLoc);
    ctx.defaultLoc = funcLoc;
    unsigned collectiveCount = 0;
    int64_t nextSiteId = kPhase6CudaFirstSiteId;
    CudaEmitInterpreter interp(ctx, collectiveCount, nextSiteId);

    const clang::Stmt *body = decl->getBody();
    if (const auto *compound = llvm::dyn_cast<clang::CompoundStmt>(body)) {
      if (!lowerCompoundStmt(compound, ctx, interp, 0))
        return false;
    } else if (!lowerStatement(body, ctx, interp, 0)) {
      return false;
    }

    if (ctx.failed)
      return false;

    if (collectiveCount != 1) {
      recordError(
          "CUDA importer first slice requires exactly one top-level full-mask __any_sync occurrence");
      return false;
    }

    if (!ctx.emittedTerminator)
      ctx.builder.create<mlir::func::ReturnOp>(
          resolveLoc(makeEndSourceLoc(body, ctx), ctx));

    return true;
  }

  bool encounteredError() const { return !errorMessage.empty(); }
  const std::string &error() const { return errorMessage; }
  bool hasKernel() const { return foundKernel; }

private:
  void recordError(llvm::StringRef message) {
    if (errorMessage.empty())
      errorMessage = message.str();
  }

  mlir::OwningOpRef<mlir::ModuleOp> &module;
  mlir::OpBuilder &moduleBuilder;
  std::string errorMessage;
  bool foundKernel = false;
};

class TranslationASTConsumer : public clang::ASTConsumer {
public:
  explicit TranslationASTConsumer(KernelLoweringVisitor &visitor)
      : visitor(visitor) {}

  void HandleTranslationUnit(clang::ASTContext &context) override {
    visitor.TraverseDecl(context.getTranslationUnitDecl());
  }

private:
  KernelLoweringVisitor &visitor;
};

class TranslationFrontendAction : public clang::ASTFrontendAction {
public:
  explicit TranslationFrontendAction(KernelLoweringVisitor &visitor)
      : visitor(visitor) {}

  std::unique_ptr<clang::ASTConsumer>
  CreateASTConsumer(clang::CompilerInstance &, llvm::StringRef) override {
    return std::make_unique<TranslationASTConsumer>(visitor);
  }

private:
  KernelLoweringVisitor &visitor;
};

} // namespace

Result<mlir::OwningOpRef<mlir::ModuleOp>>
translateCudaTranslationUnit(mlir::MLIRContext &context,
                             llvm::StringRef fileName, llvm::StringRef source,
                             llvm::StringRef gpuArch,
                             llvm::StringRef resourceDir,
                             llvm::ArrayRef<std::string> extraClangArgs) {
  if (fileName.empty())
    return Result<mlir::OwningOpRef<mlir::ModuleOp>>::err(
        "CUDA importer requires a non-empty input path");
  if (source.trim().empty())
    return Result<mlir::OwningOpRef<mlir::ModuleOp>>::err(
        "CUDA importer requires a non-empty source file");
  if (gpuArch.empty())
    return Result<mlir::OwningOpRef<mlir::ModuleOp>>::err(
        "CUDA importer requires a non-empty GPU architecture");

  context.loadDialect<mlir::BuiltinDialect, mlir::func::FuncDialect,
                      mlir::arith::ArithDialect,
                      simt::dialect::SimtStepDialect>();

  mlir::OpBuilder builder(&context);
  mlir::OwningOpRef<mlir::ModuleOp> module =
      mlir::ModuleOp::create(builder.getUnknownLoc());
  builder.setInsertionPointToStart(module->getBody());

  KernelLoweringVisitor visitor(module, builder);
  std::vector<std::string> clangArgs = {
      "-x",
      "cuda",
      "--cuda-device-only",
      (llvm::Twine("--cuda-gpu-arch=") + gpuArch).str(),
      "-nocudainc",
      "-nocudalib",
      "-std=c++17",
      "-D__CUDACC__",
  };

  if (!resourceDir.empty()) {
    clangArgs.emplace_back("-resource-dir");
    clangArgs.emplace_back(resourceDir.str());
  }

  clangArgs.insert(clangArgs.end(), extraClangArgs.begin(), extraClangArgs.end());

  std::unique_ptr<clang::FrontendAction> action =
      std::make_unique<TranslationFrontendAction>(visitor);
  std::string wrappedSource = wrapCudaSource(fileName, source);
  if (!clang::tooling::runToolOnCodeWithArgs(std::move(action), wrappedSource,
                                             clangArgs, fileName.str())) {
    return Result<mlir::OwningOpRef<mlir::ModuleOp>>::err(
        "failed to translate CUDA input");
  }

  if (visitor.encounteredError())
    return Result<mlir::OwningOpRef<mlir::ModuleOp>>::err(visitor.error());
  if (!visitor.hasKernel())
    return Result<mlir::OwningOpRef<mlir::ModuleOp>>::err(
        "no supported __global__ kernel found");

  return Result<mlir::OwningOpRef<mlir::ModuleOp>>::ok(std::move(module));
}

} // namespace simt::frontend
