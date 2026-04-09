#pragma once

#include <string>
#include <vector>

#include "llvm/ADT/StringRef.h"

#include "simt-step/Frontends/Common/Result.h"

#include "mlir/IR/BuiltinOps.h"
#include "mlir/IR/OwningOpRef.h"

namespace mlir {
class MLIRContext;
} // namespace mlir

namespace simt_cuda_import {

using ::simt::frontend::Result;

struct TranslationOptions {
  std::string gpuArch = "sm_80";
  std::string resourceDir;
  std::vector<std::string> extraClangArgs;
};

Result<mlir::OwningOpRef<mlir::ModuleOp>>
translateCudaModule(mlir::MLIRContext &context, llvm::StringRef fileName,
                    llvm::StringRef source, const TranslationOptions &options);

} // namespace simt_cuda_import
