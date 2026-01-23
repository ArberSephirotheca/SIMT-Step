#pragma once

#include "mlir/IR/Operation.h"
#include "llvm/Support/LogicalResult.h"
#include "llvm/Support/raw_ostream.h"
#include <vector>

using namespace llvm;
using namespace mlir;

namespace simt::test_raiser {

LogicalResult emitRaisedCUDA(
    Operation *op, 
    raw_ostream &o, 
    std::vector<std::vector<int64_t>> expected, 
    std::vector<std::vector<int64_t>> inputs,
    unsigned subgroupWidth);
    
}