#pragma once

#include "mlir/IR/Operation.h"
#include "llvm/Support/LogicalResult.h"
#include "llvm/Support/raw_ostream.h"
#include <vector>

namespace simt::test_raiser {

    llvm::LogicalResult emitRaisedGLSL(mlir::Operation* op, llvm::raw_ostream& o, std::vector<std::vector<int64_t>> expected, std::vector<std::vector<int64_t>> input);
    
}