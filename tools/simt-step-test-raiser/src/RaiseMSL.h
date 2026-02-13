#pragma once

#include "BaseRaiser.h"
#include "mlir/IR/Operation.h"
#include "llvm/Support/LogicalResult.h"
#include "llvm/Support/raw_ostream.h"

namespace simt::test_raiser {

llvm::LogicalResult emitRaisedMSL(
    mlir::Operation *op,
    llvm::raw_ostream &o,
    HarnessProps props);

} // namespace simt::test_raiser
