#pragma once

#include "BaseRaiser.h"
#include "mlir/IR/Operation.h"
#include "llvm/Support/LogicalResult.h"
#include "llvm/Support/raw_ostream.h"

namespace simt::test_raiser {

    llvm::LogicalResult emitRaisedGLSL(mlir::Operation* op, llvm::raw_ostream& o, HarnessProps props);
    
}