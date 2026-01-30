#pragma once

#include "mlir/Dialect/Arith/IR/Arith.h"
#include "mlir/Dialect/Vector/IR/VectorOps.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/IR/Operation.h"
#include "llvm/ADT/APFloat.h"
#include "llvm/Support/LogicalResult.h"
#include <cstddef>
#include <deque>
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
// mlir::vector::InsertOp
// simt::dialect::BufferAtomicAddOp
// simt::dialect::BufferAtomicAndOp
// simt::dialect::BufferAtomicCompareExchangeOp
// simt::dialect::BufferAtomicExchangeOp
// simt::dialect::BufferAtomicMaxOp
// simt::dialect::BufferAtomicMinOp
// simt::dialect::BufferAtomicOrOp
// simt::dialect::BufferAtomicXorOp
// simt::dialect::GroupIdOp
// simt::dialect::GroupIndexOp
// simt::dialect::GroupThreadIdOp
*/

namespace simt::test_raiser {

    struct HarnessProps {
        std::vector<std::vector<int64_t>> expected;
        std::vector<std::vector<int64_t>> input;
        int subgroupWidth;
        bool noF64;
    };

    class BaseRaiser {
        public:
            explicit BaseRaiser(raw_ostream &o);
            virtual ~BaseRaiser();

            // Emits the test harness and GPU code.
            virtual LogicalResult emitHarness(Operation* op, HarnessProps props) = 0;
        protected:
            struct ScopeHandler {
                struct Scope {
                    std::vector<Value> results;
                    enum ScopeKinds {
                        IF_SCOPE,
                        LOOP_SCOPE,
                        SWITCH_SCOPE
                    } scopeKind;
                    LogicalResult emitGroupSet(BaseRaiser& b, std::vector<Value> lefts, std::vector<Value> rights);
                    LogicalResult emitGroupDeclare(BaseRaiser& b, std::vector<Value> values);
                    LogicalResult emitSetResults(BaseRaiser& b, std::vector<Value> rights);
                    LogicalResult emitDeclareResults(BaseRaiser& b);
                };
                std::deque<Scope> stack;
                
                Scope pop();
                Scope peek();
                void push(Scope);
                LogicalResult peekKind(Scope::ScopeKinds kind, Scope& out);
            };
            friend ScopeHandler;
            ScopeHandler scopeHandler;


            raw_indented_ostream os;
            llvm::DenseMap<Value, int> value_map;
            int value_counter = 0;

            std::vector<size_t> buffer_sizes;
            int64_t ntx, nty, ntz;

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
            virtual LogicalResult emitConst(Type t, APFloat v);

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
            LogicalResult emitFuncCall(std::string fname, std::vector<Value> args);

            /*
            Takes an operation and chooses the correct op printer for it. Also handles added trailing
            semicolons for statements that require it.
            */
            LogicalResult emitOp(Operation* op);

            LogicalResult emitRegion(Region& region);

            LogicalResult emitBlock(Block& block);

            LogicalResult printOp(func::ReturnOp& op);
            LogicalResult printOp(func::CallOp& op);
            LogicalResult printOp(mlir::ModuleOp& op);
            LogicalResult printOp(arith::ConstantOp& op);
            LogicalResult printOp(arith::CmpIOp& op);
            LogicalResult printOp(arith::CmpFOp& op);
            LogicalResult printOp(arith::NegFOp& op);
            LogicalResult printOp(arith::SelectOp& op);
            LogicalResult printOp(arith::ExtUIOp& op);
            LogicalResult printOp(arith::IndexCastOp& op);
            LogicalResult printOp(vector::ExtractOp& op);
            LogicalResult printOp(BufferLoadOp& op);
            LogicalResult printOp(BufferStoreOp& op);
            LogicalResult printOp(IfOp& op);
            LogicalResult printOp(YieldOp& op);
            LogicalResult printOp(LoopOp& op);
            LogicalResult printOp(ConditionOp& op);
            LogicalResult printOp(BreakOp& op);
            LogicalResult printOp(ContinueOp& op);
            LogicalResult printOp(SwitchOp& op);

            virtual LogicalResult printOp(func::FuncOp& op);
            
            virtual LogicalResult printOp(arith::RemFOp& op) = 0;
            virtual LogicalResult printOp(DispatchThreadIdOp& op) = 0;
            virtual LogicalResult printOp(BufferAtomicAddOp& op) = 0;
            virtual LogicalResult printOp(WaveCountBitsOp& op) = 0;
            virtual LogicalResult printOp(LaneIdOp& op) = 0;
            virtual LogicalResult printOp(SubgroupIdOp& op) = 0;
            virtual LogicalResult printOp(WaveAllOp& op) = 0;
            virtual LogicalResult printOp(WaveAnyOp& op) = 0;
            virtual LogicalResult printOp(GroupIdOp& op) = 0;
            // virtual LogicalResult printOp(FenceOp& op) = 0;
            // virtual LogicalResult printOp(BarrierOp& op) = 0;

            friend LogicalResult emitAmberHarness(BaseRaiser& b, Operation* op, std::string lang, HarnessProps props);

    };

    /*
    Emits and Amber test harness that wraps the GPU code. Can be used as
    `emitHarness` for languages Amber supports.
    */
    LogicalResult emitAmberHarness(BaseRaiser& b, Operation* op, std::string lang, HarnessProps props);

    /*
    Gets the thread dimensions from the main function and the argument index of the buffer 
    (or -1 if there is no buffer), and places them in the corrispoding referenced variables.
    */
    LogicalResult getMainInfo(Operation* op, int64_t& ntx, int64_t& nty, int64_t& ntz, std::vector<int64_t>& bufferIndex);

}