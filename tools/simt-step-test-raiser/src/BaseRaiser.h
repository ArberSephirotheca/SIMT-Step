#pragma once

#include "mlir/Dialect/Arith/IR/Arith.h"
#include "mlir/Dialect/Vector/IR/VectorOps.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/IR/Operation.h"
#include "llvm/ADT/APFloat.h"
#include "llvm/Support/LogicalResult.h"
#include <llvm/Support/raw_ostream.h>

#include <string>
#include <vector>
#include "mlir/IR/Types.h"
#include "mlir/Support/LLVM.h"
#include "mlir/Support/IndentedOstream.h"
#include "simt-step/Dialect/SimtStep/SimtStepDialect.h"

using namespace llvm;
using namespace mlir;
using namespace simt::dialect;

/*
mlir::arith::IndexCastOp
mlir::func::FuncOp +
mlir::func::ReturnOp +
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

            // Emits the test harness and GPU code.
            LogicalResult emitHarness(Operation* op);
        protected:
            raw_indented_ostream os;
            llvm::DenseMap<Value, int> value_map;
            int value_counter = 0;
            int buffer_size = 0;

            /*
            Creates or gets a unique number for each value, which will be used to
            create a variable for it.
            */
            int getOrAddValueNumber(Value v);

            /*
            Same as `getOrAddValueNumber`, but returns string in the form
            `"v{value number}"`
            */
            std::string getOrAddValueName(Value v);

            // Emits the language-specific type name for a Type
            virtual LogicalResult emitType(Type type){return failure();}

            // Emits the language-specific prologue inside of the harness and before
            // any code is emitted.
            virtual LogicalResult emitShaderPrologue(){return failure();}

            // Emits the language-specific main function definition, excluding the
            // body, which is handled elsewhere.
            virtual LogicalResult emitMainFuncTop(func::FuncOp& op){return failure();}

            // Emits a declaration of `out`, defined as `in` being cast to the type 
            // of `out`
            virtual LogicalResult emitCast(Value in, Value out){return failure();}

            /*
            Emits an integer literal. Supports booleans, 64-bit 
            and 32-bit integers, signed or unsigned.
            */
            LogicalResult emitConst(Type t, int64_t v);

            /*
            Emits a floating point literal. Supports single and double precision.
            */
            LogicalResult emitConst(Type t, APFloat v);

            /*
            Helper function that emits the RHS of the variable declaration
            for the given value, in the form `type v{value number} =`
            */
            LogicalResult emitValueDefine(Value v);

            /*
            Helper function that emits a full binary operator statement in the form,
            `type v{out #} = v{left #} {op} v{right #}`
            */
            LogicalResult emitBinop(Value output, Value left, Value right, std::string op);

            /*
            Emits a function call to `fname` with args `args` and whose return value is stored in `output`
            */
            LogicalResult emitFuncCall(Value output, std::string fname, std::vector<Value> args);

            /*
            Takes an operation and chooses the correct op printer for it. Also handles added trailing
            semicolons for statements that require it.
            */
            LogicalResult emitOp(Operation* op);

            LogicalResult printOp(func::FuncOp& op);
            LogicalResult printOp(func::ReturnOp& op);
            LogicalResult printOp(mlir::ModuleOp& op);
            LogicalResult printOp(arith::ConstantOp& op);
            LogicalResult printOp(arith::CmpIOp& op);
            LogicalResult printOp(arith::CmpFOp& op);
            LogicalResult printOp(arith::NegFOp& op);
            LogicalResult printOp(arith::SelectOp& op);
            LogicalResult printOp(arith::ExtUIOp& op);
            LogicalResult printOp(BufferLoadOp& op);
            LogicalResult printOp(BufferStoreOp& op);

            virtual LogicalResult printOp(vector::ExtractOp& op){return failure();}
            virtual LogicalResult printOp(arith::RemFOp& op){return failure();}
            virtual LogicalResult printOp(DispatchThreadIdOp& op){return failure();}

            friend LogicalResult emitAmberHarness(BaseRaiser& b, Operation* op, std::string lang);     
    };

    /*
    Emits and Amber test harness that wraps the GPU code. Can be used as
    `emitHarness` for languages Amber supports.
    */
    LogicalResult emitAmberHarness(BaseRaiser& b, Operation* op, std::string lang);

    LogicalResult getExpectedBuffer(Operation& op, std::vector<int>& buffer, int buffersize = 100, std::vector<std::string> args = {});
}