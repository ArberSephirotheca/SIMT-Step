#include "simt-cuda-import/Lowering.h"
#include "simt-step/Dialect/SimtStep/SimtStepDialect.h"
#include "simt-step/Dialect/SimtStep/Transforms.h"

#include "clang/Driver/Driver.h"
#include "clang/Frontend/CompilerInvocation.h"

#include "mlir/Dialect/Arith/IR/Arith.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/Math/IR/Math.h"
#include "mlir/Dialect/Vector/IR/VectorOps.h"
#include "mlir/IR/BuiltinDialect.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/IR/DialectRegistry.h"
#include "mlir/IR/MLIRContext.h"
#include "mlir/IR/OperationSupport.h"
#include "mlir/Pass/PassManager.h"

#include "llvm/Support/CommandLine.h"
#include "llvm/Support/InitLLVM.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/Path.h"
#include "llvm/Support/Program.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;
using namespace simt_cuda_import;

int main(int argc, char **argv) {
  llvm::InitLLVM initLLVM(argc, argv);

  llvm::cl::OptionCategory toolCategory("simt-cuda-import options");
  llvm::cl::opt<std::string> inputPath(
      llvm::cl::Positional, llvm::cl::desc("<input CUDA file>"),
      llvm::cl::Required, llvm::cl::cat(toolCategory));
  llvm::cl::opt<std::string> gpuArch(
      "gpu-arch",
      llvm::cl::desc("Target CUDA GPU architecture (default: sm_80)"),
      llvm::cl::init("sm_80"), llvm::cl::cat(toolCategory));
  llvm::cl::list<std::string> extraClangArgs(
      "clang-arg",
      llvm::cl::desc("Extra argument forwarded to the CUDA frontend"),
      llvm::cl::ZeroOrMore, llvm::cl::cat(toolCategory));
  llvm::cl::opt<bool> normalizeLoopTerminators(
      "normalize-loop-terminators",
      llvm::cl::desc(
          "Preserve simt.normalized.loop_terminators annotations (normalization is always applied)"),
      llvm::cl::init(false), llvm::cl::cat(toolCategory));

  llvm::cl::ParseCommandLineOptions(argc, argv,
                                    "SIMT-Step CUDA importer (bootstrap)\n");

  auto bufferOrErr = llvm::MemoryBuffer::getFile(inputPath);
  if (!bufferOrErr) {
    llvm::errs() << "simt-cuda-import: failed to read input '" << inputPath
                 << "': " << bufferOrErr.getError().message() << "\n";
    return 1;
  }
  llvm::StringRef source = bufferOrErr.get()->getBuffer();

  mlir::DialectRegistry registry;
  registry.insert<mlir::BuiltinDialect, mlir::arith::ArithDialect,
                  mlir::func::FuncDialect, mlir::math::MathDialect,
                  mlir::vector::VectorDialect, simt::dialect::SimtStepDialect>();
  mlir::MLIRContext context(registry);
  context.loadDialect<mlir::BuiltinDialect, mlir::arith::ArithDialect,
                      mlir::func::FuncDialect, mlir::math::MathDialect,
                      mlir::vector::VectorDialect,
                      simt::dialect::SimtStepDialect>();

  TranslationOptions options;
  options.gpuArch = gpuArch;
  options.extraClangArgs.assign(extraClangArgs.begin(), extraClangArgs.end());
  if (auto clangPath = llvm::sys::findProgramByName("clang"))
    options.resourceDir = clang::driver::Driver::GetResourcesPath(*clangPath);
  else
    options.resourceDir = clang::CompilerInvocation::GetResourcesPath(
        argv[0], reinterpret_cast<void *>(&main));

  auto result = translateCudaModule(context, llvm::sys::path::filename(inputPath),
                                    source, options);
  if (!result) {
    llvm::errs() << "simt-cuda-import: " << result.error() << "\n";
    return 1;
  }

  mlir::ModuleOp module = result.value().get();

  mlir::PassManager pm(&context);
  pm.enableVerifier(false);
  pm.addNestedPass<mlir::func::FuncOp>(
      simt::dialect::createNormalizeLoopTerminatorsPass());
  if (mlir::failed(pm.run(module))) {
    llvm::errs() << "simt-cuda-import: failed to normalize loop terminators\n";
    module.dump();
    return 1;
  }

  if (!normalizeLoopTerminators)
    module.walk([](mlir::Operation *op) {
      op->removeAttr("simt.normalized.loop_terminators");
    });

  if (failed(module.verify())) {
    llvm::errs() << "simt-cuda-import: generated IR failed to verify\n";
    module.dump();
    return 1;
  }

  bool hasDanglingBlock = false;
  module.walk([&](mlir::Operation *op) {
    if (mlir::Block *block = op->getBlock())
      if (!block->getParentOp())
        hasDanglingBlock = true;
  });
  if (hasDanglingBlock) {
    llvm::errs() << "simt-cuda-import: found operation in block without parent\n";
    module.dump();
    return 1;
  }

  module.print(llvm::outs(), mlir::OpPrintingFlags()
                                 .printGenericOpForm()
                                 .enableDebugInfo());
  return 0;
}
