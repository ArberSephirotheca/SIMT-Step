#pragma once

#include "BaseRaiser.h"
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
    HarnessProps props);
    
}