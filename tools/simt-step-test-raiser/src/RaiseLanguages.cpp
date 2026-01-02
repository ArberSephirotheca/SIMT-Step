#include "RaiseLanguages.h"
#include "common.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/LogicalResult.h"
#include <cstdio>


using namespace simt::test_raiser;
using namespace llvm;
using namespace mlir;

class GlslRaiser : public BaseRaiser {

public:

using BaseRaiser::BaseRaiser;

LogicalResult emitHarness(Operation* op) {
    return emitAmberHarness(*this, op, "GLSL", 1, 1, 1);
}

~GlslRaiser(){}

private:
LogicalResult emitMainFuncTop(func::FuncOp& f) override {
    os << "void main()";
    return success();
}

LogicalResult emitType(Type type) override {
    if (type.isInteger()){
        switch (type.getIntOrFloatBitWidth()){
            case 1:
                os << "bool";
                break;
            case 32: 
                os << (type.isUnsignedInteger() ? "uint" : "int");
                break;
            case 64:
                os << (type.isUnsignedInteger() ? "uint64" : "int64");
                break;
            default:
                llvm_unreachable("Unsupported type");
                break;
        }
    }
    return success();
}

LogicalResult emitShaderPrologue() override {
    os << 
        "#version 430\n"
        "#extension GL_KHR_shader_subgroup_ballot  : enable\n"
        "#extension GL_KHR_shader_subgroup_vote    : enable\n"
        "#extension GL_KHR_shader_subgroup_basic   : enable\n"
        "#extension GL_KHR_memory_scope_semantics  : enable\n"
        "#extension GL_ARB_gpu_shader_int64        : enable \n";
    return success();
}


// LogicalResult emitBuiltin(Operation type) override {
//     return success();
// }

};

namespace simt::test_raiser {

LogicalResult emitRaised(Operation *op,raw_ostream &o, RaiserTarget target){
    switch (target){
        case simt::test_raiser::GLSL:
            GlslRaiser glsl(o);
            return glsl.emitHarness(op);
    }
    llvm_unreachable("Target not implemented");
    return failure();
}

}