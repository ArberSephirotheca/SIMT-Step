#pragma once

#include "common.h"
#include "mlir/IR/Operation.h"
#include "llvm/Support/LogicalResult.h"
#include "llvm/Support/raw_ostream.h"

namespace simt::test_raiser {

    enum RaiserTarget {
        GLSL
    };

    llvm::LogicalResult emitRaised(mlir::Operation* op, llvm::raw_ostream& o, RaiserTarget target);
    
}