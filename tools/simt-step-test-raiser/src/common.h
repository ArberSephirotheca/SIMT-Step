#pragma once

#include "mlir/IR/Operation.h"
#include "llvm/Support/LogicalResult.h"
#include <llvm/Support/raw_ostream.h>
#include <string>
#include "mlir/IR/Types.h"
#include "mlir/Support/LLVM.h"

namespace simt::test_raiser {
    class BaseRaiser {
        public:
            explicit BaseRaiser(llvm::raw_ostream &o);
            llvm::LogicalResult emitHarness(mlir::Operation* op);
        protected:
            llvm::raw_ostream& os;
            llvm::LogicalResult printOperation(mlir::Operation* op);
            llvm::LogicalResult emitType(mlir::Type op);
            llvm::LogicalResult emitBuiltin(mlir::Operation* op);
    };

    llvm::LogicalResult emitAmberHarnessPrologue(llvm::raw_ostream& o, std::string lang);
    llvm::LogicalResult emitAmberHarnessEpilogue(llvm::raw_ostream& o, int threadx, int thready, int threadz);

}