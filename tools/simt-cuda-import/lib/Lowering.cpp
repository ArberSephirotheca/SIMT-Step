#include "simt-cuda-import/Lowering.h"

#include "llvm/ADT/ArrayRef.h"

namespace simt::frontend {

Result<mlir::OwningOpRef<mlir::ModuleOp>>
translateCudaTranslationUnit(mlir::MLIRContext &context,
                             llvm::StringRef fileName, llvm::StringRef source,
                             llvm::StringRef gpuArch,
                             llvm::StringRef resourceDir,
                             llvm::ArrayRef<std::string> extraClangArgs);

} // namespace simt::frontend

namespace simt_cuda_import {

Result<mlir::OwningOpRef<mlir::ModuleOp>>
translateCudaModule(mlir::MLIRContext &context, llvm::StringRef fileName,
                    llvm::StringRef source,
                    const TranslationOptions &options) {
  return ::simt::frontend::translateCudaTranslationUnit(
      context, fileName, source, options.gpuArch, options.resourceDir,
      llvm::ArrayRef<std::string>(options.extraClangArgs));
}

} // namespace simt_cuda_import
