#include "RaiseGLSL.h"
#include "BaseRaiser.h"
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
    return emitAmberHarness(*this, op, "GLSL");
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
                os << (type.isUnsignedInteger() ? "uint64_t" : "int64_t");
                break;
            default:
                llvm_unreachable("Unsupported int type");
                break;
        }
    } else if (type.isFloat()){
        switch (type.getIntOrFloatBitWidth()) {
            case 32:
                os << "float";
                break;
            case 64:
                os << "double";
                break;
            default:
                llvm_unreachable("Unsupported float type");
                break;
        }
    } else {
        llvm_unreachable("Unsupported type");
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
        "#extension GL_ARB_gpu_shader_int64        : enable\n";
    return success();
}


LogicalResult emitCast(Value in, Value out) override {
    if(failed(emitValueDefine(out))) return failure();
    if(failed(emitType(out.getType()))) return failure();
    os << "(" << getOrAddValueName(in) << ")";
    return success();
}

};

namespace simt::test_raiser {

LogicalResult emitRaisedGLSL(Operation *op,raw_ostream &o){
    GlslRaiser glsl(o);
    return glsl.emitHarness(op);
}

}