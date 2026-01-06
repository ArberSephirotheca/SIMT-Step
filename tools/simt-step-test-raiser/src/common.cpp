#include "common.h"

#include <cstdio>
#include <llvm/Support/CommandLine.h>
#include <mlir/Tools/mlir-translate/Translation.h>
#include <mlir/Tools/mlir-translate/MlirTranslateMain.h>

#include "mlir/IR/BuiltinAttributes.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/IR/Operation.h"
#include "simt-step/Dialect/SimtStep/SimtStepDialect.h"
#include "llvm/ADT/APFloat.h"
#include "llvm/ADT/TypeSwitch.h"
#include "llvm/Support/Casting.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/LogicalResult.h"
#include "llvm/Support/raw_ostream.h"
#include <mlir/Dialect/Arith/IR/Arith.h>
#include <mlir/Dialect/Func/IR/FuncOps.h>
#include <mlir/Dialect/Math/IR/Math.h>
#include <mlir/Dialect/Vector/IR/VectorOps.h>

#include <mlir/InitAllTranslations.h>
#include <string>
#include "mlir/Support/IndentedOstream.h"


using namespace simt::test_raiser;
using namespace llvm;
using namespace mlir;

namespace simt::test_raiser {

BaseRaiser::BaseRaiser(raw_ostream& o): os(o) {
}

BaseRaiser::~BaseRaiser(){}

int BaseRaiser::getOrAddValueNumber(Value v){
    if (value_map.contains(v)){
        return value_map[v];
    }
    return value_map[v] = value_counter++;
}


std::string BaseRaiser::getOrAddValueName(Value v){
    return "v" + std::to_string(getOrAddValueNumber(v));
}

LogicalResult BaseRaiser::emitConst(Type t, int64_t v){
    switch (t.getIntOrFloatBitWidth()){
        case 1:
            os << (v ? "true" : "false");
            break;
        case 32:
            os << v;
            if (t.isUnsignedInteger()) os << "u";
            break;
        case 64:
            os << v;
            if (t.isUnsignedInteger()) os << "u";
            os << "l";
            break;
        default:
            llvm_unreachable("Unable to emit conststant");
            break;
    }

    return success();
}

LogicalResult BaseRaiser::emitConst(Type t, APFloat v){
    switch (t.getIntOrFloatBitWidth()){
        case 32:
            os << v;
            break;
        case 64:
            os << v << "lf";
            break;
        default:
            llvm_unreachable("Unable to emit conststant");
            break;
    }

    return success();
}


LogicalResult BaseRaiser::emitValueDefine(Value v){
    std::string vname = getOrAddValueName(v);
    if (failed(emitType(v.getType()))) return failure();
    os << " " << vname << " = ";
    return success();
}

LogicalResult BaseRaiser::emitBinop(Value output, Value left, Value right, std::string op){
    if (failed(emitValueDefine(output))) return failure();
    os << getOrAddValueName(left) << " " << op << " " << getOrAddValueName(right);
    return success();
}

/**
Uses function overloading to choose the correct printing function for each
operation type.
*/
LogicalResult BaseRaiser::emitOp(mlir::Operation* op){

    // Creates the lambda for cases for binary operators
    auto makeBinop = [this](std::string opstr){
        return [opstr, this](auto op){return emitBinop(op.getResult(), op->getOperand(0), op->getOperand(1), opstr);};
    };

    LogicalResult res = llvm::TypeSwitch<Operation&, LogicalResult>(*op)
        .Case<
            // func Operations
            func::FuncOp, func::ReturnOp,
            // builtin Operations
            ModuleOp,
            // arith Operations
            arith::ConstantOp, arith::CmpIOp, arith::CmpFOp, arith::NegFOp, 
            arith::SelectOp>(
                [&](auto op){return printOp(op);})
        
        // Binary operations
        .Case<arith::AddFOp, arith::AddIOp>(makeBinop("+"))
        .Case<arith::SubFOp, arith::SubIOp>(makeBinop("-"))
        .Case<arith::MulFOp, arith::MulIOp>(makeBinop("*"))
        .Case<arith::DivFOp, arith::DivSIOp, arith::DivUIOp>(makeBinop("/"))
        .Case<arith::AndIOp>(makeBinop("&"))
        .Case<arith::OrIOp>(makeBinop("|"))
        .Case<arith::XOrIOp>(makeBinop("^"))
        .Case<arith::RemUIOp, arith::RemSIOp>(makeBinop("%"))

        .Default([&](Operation &) {
            return op->emitOpError("unsupported");
        });
    
    if (failed(res)){
        return failure();
    }
    
    if (!isa<func::FuncOp, ModuleOp>(op)){
        os << ";\n";
    }

    return success();
}


/////////////     Builtins     /////////////

//
LogicalResult BaseRaiser::printOp(ModuleOp& op){
    for (auto &subop : op.getBodyRegion().front()){
        if (failed(emitOp(&subop))) {
            return failure();
        }
    }

    return success();
}

///////////// 'func' dialect /////////////

//
LogicalResult BaseRaiser::printOp(func::FuncOp& op){
    if (op.getSymName() == "main" && failed(emitMainFuncTop(op))) return failure();
    os << "{\n";
    os.indent();
    for (auto &subop : op.getBody().front()){
        if (failed(emitOp(&subop))) {
            return failure();
        }
    }
    os.unindent();
    os << "}";
    return success();
}

LogicalResult BaseRaiser::printOp(func::ReturnOp& op){
    os << "return";
    return success();
}

///////////// 'arith' dialect /////////////

LogicalResult BaseRaiser::printOp(arith::ConstantOp& op){
    Value v = op.getResult();
    if (failed(emitValueDefine(v))) return failure();

    if((op.getValue().getType().isFloat() 
            && succeeded(emitConst(v.getType(), cast<FloatAttr>(op.getValue()).getValue()))) || 
       (op.getValue().getType().isInteger()
            && succeeded(emitConst(v.getType(), cast<IntegerAttr>(op.getValue()).getInt())))){
        return success();
    }

    return failure();
}

LogicalResult BaseRaiser::printOp(arith::CmpIOp& op){
    Value v = op.getResult();

    std::string opstr = "<unk>";
    switch (op.getPredicate()){
        case arith::CmpIPredicate::eq:
            opstr = "==";
            break;
        case arith::CmpIPredicate::ne:
            opstr = "!=";
            break;
        case arith::CmpIPredicate::sgt:
        case arith::CmpIPredicate::ugt:
            opstr = ">";
            break;
        case arith::CmpIPredicate::slt:
        case arith::CmpIPredicate::ult:
            opstr = "<";
            break;
        case arith::CmpIPredicate::sge:
        case arith::CmpIPredicate::uge:
            opstr = ">=";
            break;
        case arith::CmpIPredicate::sle:
        case arith::CmpIPredicate::ule:
            opstr = "<=";
            break;
    }

    return emitBinop(v, op->getOperand(0), op->getOperand(1), opstr);

}

LogicalResult BaseRaiser::printOp(arith::CmpFOp& op){
    Value v = op.getResult();
    Value left = op->getOperand(0);
    std::string lname = getOrAddValueName(left);
    Value right = op->getOperand(1);
    std::string rname = getOrAddValueName(right);
    if (failed(emitValueDefine(v))) return failure();

    // Unordered operations return true if either operand is NaN
    // which is the opposite behavior to most languages. We can
    // emulate unordered instructions by taking the logical complement
    // of the opposite intruction. (i.e. a == b -> !(a != b)).
    switch (op.getPredicate()){
        case arith::CmpFPredicate::OEQ:
            os << lname << " == " << rname;
            break;
        case arith::CmpFPredicate::UEQ:
            os << "!(" << lname << " != " << rname << ")";
            break;
        case arith::CmpFPredicate::ONE:
            os << lname << " != " << rname;
            break;
        case arith::CmpFPredicate::UNE:
            os << "!(" << lname << " == " << rname << ")";
            break;
        case arith::CmpFPredicate::OGT:
            os << lname << " > " << rname;
            break;
        case arith::CmpFPredicate::UGT:
            os << "!(" << lname << " <= " << rname << ")";
            break;
        case arith::CmpFPredicate::OLT:
            os << lname << " < " << rname;
            break;
        case arith::CmpFPredicate::ULT:
            os << "!(" << lname << " >= " << rname << ")";
            break;
        case arith::CmpFPredicate::OGE:
            os << lname << " >= " << rname;
            break;
        case arith::CmpFPredicate::UGE:
            os << "!(" << lname << " < " << rname << ")";
            break;
        case arith::CmpFPredicate::OLE:
            os << lname << " < " << rname;
            break;
        case arith::CmpFPredicate::ULE:
            os << "!(" << lname << " >= " << rname << ")";
            break;
        default:
            op->emitError("unsupported");
            break;
    }

    return success();
}

LogicalResult BaseRaiser::printOp(arith::NegFOp& op){
    Value v = op.getResult();
    if (failed(emitValueDefine(v))) return failure();
    os << "-" << getOrAddValueName(op->getOperand(0));
    return success();
}

LogicalResult BaseRaiser::printOp(arith::SelectOp& op){
    Value v = op.getResult();
    if (failed(emitValueDefine(v))) return failure();
    os  << getOrAddValueName(op->getOperand(0)) << " ? " 
        << getOrAddValueName(op->getOperand(1)) << " : "
        << getOrAddValueName(op->getOperand(2));
    return success();
}

//////////// Other helper functions ////////////

LogicalResult emitAmberHarness(BaseRaiser& b, Operation* op, std::string lang){
    b.os << "#!amber\n"
            "DEVICE_FEATURE SubgroupSizeControl.subgroupSizeControl\n"
            "DEVICE_FEATURE shaderInt64\n"
            "DEVICE_FEATURE shaderFloat64\n"
            "SET ENGINE_DATA fence_timeout_ms 10000\n"
            "SHADER compute compute_shader " << lang << " TARGET_ENV vulkan1.1\n";
    
    if (failed(b.emitShaderPrologue()) || failed(b.emitOp(op))) {
        return failure();
    }

    // Stolen from HlslEmitter.cpp
    int64_t ntx = 1, nty = 1, ntz = 1;
    if (auto mod = dyn_cast<ModuleOp>(op)){
        auto func = mod.lookupSymbol<func::FuncOp>("main");
        if (auto attr = func->getAttr("simt.num_threads")) {
            if (auto denseAttr = mlir::dyn_cast<DenseI64ArrayAttr>(attr)) {
                auto vals = denseAttr.asArrayRef();
                if (vals.size() == 3) {
                    ntx = vals[0];
                    nty = vals[1];
                    ntz = vals[2];
                }
            } else if (auto arrayAttr = mlir::dyn_cast<ArrayAttr>(attr)) {
                if (arrayAttr.size() == 3) {
                    auto x = mlir::dyn_cast<IntegerAttr>(arrayAttr[0]);
                    auto y = mlir::dyn_cast<IntegerAttr>(arrayAttr[1]);
                    auto z = mlir::dyn_cast<IntegerAttr>(arrayAttr[2]);
                    if (x && y && z) {
                        ntx = x.getInt();
                        nty = y.getInt();
                        ntz = z.getInt();
                    }
                }
            }
        }
    }
    
    b.os << "\nEND\n"
        "PIPELINE compute pipeline\n"
        "  ATTACH compute_shader\n"
        "END\n"
        << "RUN pipeline " << ntx << " " << nty << " " << ntz << "\n";
    return success();
}

}
