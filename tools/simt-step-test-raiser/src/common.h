#pragma once

#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/IR/Operation.h"
#include "llvm/Support/LogicalResult.h"
#include <llvm/Support/raw_ostream.h>

#include <string>
#include "mlir/IR/Types.h"
#include "mlir/Support/LLVM.h"
#include "mlir/Support/IndentedOstream.h"

using namespace llvm;
using namespace mlir;

namespace simt::test_raiser {
    class BaseRaiser {
        public:
            explicit BaseRaiser(raw_ostream &o);
            virtual ~BaseRaiser();
            LogicalResult emitHarness(Operation* op);
        protected:
            raw_indented_ostream& os;
            llvm::DenseMap<Value, int> value_map;
            int value_counter = 0;

            int getOrAddValueNumber(Value v);

            virtual LogicalResult emitType(Type type){return failure();};
            // virtual LogicalResult emitBuiltin(Operation* op);
            virtual LogicalResult emitMainFuncTop(func::FuncOp& op){return failure();};

            LogicalResult emitOp(Operation* op);
            LogicalResult printOp(func::FuncOp& op);
            LogicalResult printOp(func::ReturnOp& op);
            LogicalResult printOp(mlir::ModuleOp& op);


        
            friend LogicalResult emitAmberHarness(BaseRaiser& b, Operation* op, std::string lang, int threadx, int thready, int threadz);     
    };

    LogicalResult emitAmberHarness(BaseRaiser& b, Operation* op, std::string lang, int threadx, int thready, int threadz);
}