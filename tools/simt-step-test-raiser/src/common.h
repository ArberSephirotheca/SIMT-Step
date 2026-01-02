#pragma once

#include "mlir/Dialect/Arith/IR/Arith.h"
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

/*
mlir::arith::AddFOp
mlir::arith::AddIOp
mlir::arith::AndIOp
mlir::arith::CmpFOp
mlir::arith::CmpIOp
mlir::arith::ConstantIntOp
mlir::arith::ConstantOp
mlir::arith::DivFOp
mlir::arith::DivSIOp
mlir::arith::ExtUIOp
mlir::arith::IndexCastOp
mlir::arith::MulFOp
mlir::arith::MulIOp
mlir::arith::NegFOp
mlir::arith::OrIOp
mlir::arith::RemFOp
mlir::arith::RemSIOp
mlir::arith::SelectOp
mlir::arith::SubFOp
mlir::arith::SubIOp
mlir::arith::TruncIOp
mlir::arith::XOrIOp
mlir::func::FuncOp
mlir::func::ReturnOp
mlir::ModuleOp
mlir::OwningOp
mlir::vector::ExtractOp
mlir::vector::InsertOp
simt::dialect::ActiveMaskOp
simt::dialect::BarrierOp
simt::dialect::BreakOp
simt::dialect::BufferAtomicAddOp
simt::dialect::BufferAtomicAndOp
simt::dialect::BufferAtomicCompareExchangeOp
simt::dialect::BufferAtomicExchangeOp
simt::dialect::BufferAtomicMaxOp
simt::dialect::BufferAtomicMinOp
simt::dialect::BufferAtomicOrOp
simt::dialect::BufferAtomicXorOp
simt::dialect::BufferLoadOp
simt::dialect::BufferStoreOp
simt::dialect::ConditionOp
simt::dialect::ContinueOp
simt::dialect::DispatchThreadIdOp
simt::dialect::FenceOp
simt::dialect::GroupIdOp
simt::dialect::GroupIndexOp
simt::dialect::GroupThreadIdOp
simt::dialect::IfOp
simt::dialect::LaneIdOp
simt::dialect::SwitchOp
simt::dialect::WaveAllOp
simt::dialect::WaveAnyOp
simt::dialect::WaveCountBitsOp
simt::dialect::YieldOp
simt_hlsl_import::ArithOp
simt_hlsl_import::BufferAtomicOp
simt_hlsl_import::CmpOp
simt_hlsl_import::LogicalOp
*/

namespace simt::test_raiser {
    class BaseRaiser {
        public:
            explicit BaseRaiser(raw_ostream &o);
            virtual ~BaseRaiser();
            LogicalResult emitHarness(Operation* op);
        protected:
            raw_indented_ostream os;
            llvm::DenseMap<Value, int> value_map;
            int value_counter = 0;

            int getOrAddValueNumber(Value v);
            std::string getOrAddValueName(Value v);

            virtual LogicalResult emitType(Type type){return failure();}
            virtual LogicalResult emitShaderPrologue(){return failure();}
            // virtual LogicalResult emitBuiltin(Operation* op);
            virtual LogicalResult emitMainFuncTop(func::FuncOp& op){return failure();};

            LogicalResult emitOp(Operation* op);
            LogicalResult emitConst(Type t, int64_t v);

            LogicalResult printOp(func::FuncOp& op);
            LogicalResult printOp(func::ReturnOp& op);
            LogicalResult printOp(mlir::ModuleOp& op);
            LogicalResult printOp(arith::ConstantIntOp& op);




        
            friend LogicalResult emitAmberHarness(BaseRaiser& b, Operation* op, std::string lang, int threadx, int thready, int threadz);     
    };

    LogicalResult emitAmberHarness(BaseRaiser& b, Operation* op, std::string lang, int threadx, int thready, int threadz);
}