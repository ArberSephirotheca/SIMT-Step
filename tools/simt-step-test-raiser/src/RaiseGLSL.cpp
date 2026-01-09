#include "RaiseGLSL.h"
#include "BaseRaiser.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/Utils/StaticValueUtils.h"
#include "mlir/Dialect/Vector/IR/VectorOps.h"
#include "mlir/IR/BuiltinTypeInterfaces.h"
#include "mlir/IR/BuiltinTypes.h"
#include "simt-step/Dialect/SimtStep/SimtStepDialect.h"
#include "llvm/Support/Casting.h"
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
    int locs = 0;
    for (Value v : f.getArguments()){
        if (auto t = dyn_cast<simt::dialect::ResourceType>(v.getType())){
            os << "layout(set = 0, binding = " << locs++ << ") buffer Buf { ";
            if (failed(emitType(t.getElementType()))) return failure();
            os << " " << getOrAddValueName(v) << "[" << buffer_size << "];};\n";
        }
    }
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
    } else if (auto vectype = dyn_cast<mlir::VectorType>(type)) {
        long len = vectype.getShape().vec()[0];
        if (vectype.getShape().size() != 1 || len > 4 || len < 2){
            llvm_unreachable("Unsupported vector shape");
        }
        os << "vec" << len;
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

/////////////// 'arith' dialect ///////////////
LogicalResult printOp(arith::RemFOp &op) override {
    return emitFuncCall(op.getResult(), "mod", {op->getOperand(0), op->getOperand(1)});
}

/////////////// 'vector' dialect ///////////////

LogicalResult printOp(vector::ExtractOp &op) override {
    if (failed(emitValueDefine(op.getResult()))) return failure();
    os << op.getOperand(0) << "[";
    if (std::optional<int64_t> id = getConstantIntValue(op.getMixedPosition()[0])){
        if (id == vector::ExtractOp::kPoisonIndex) op->emitError("cannot handle poison indices");
        os << id;
    } else {
        Value v = op.getDynamicPosition()[0];
        os << getOrAddValueName(v);
    }
    os << "]";
    return success();
}

/////////////// 'simt_step' dialect ///////////////

LogicalResult printOp(DispatchThreadIdOp& op) override {
    if (failed(emitValueDefine(op.getResult()))) return failure();
    if (failed(emitType(op->getResultTypes()[0]))) return failure();
    os << "(gl_GlobalInvocationID.x)";
    return success();
}


};

namespace simt::test_raiser {

LogicalResult emitRaisedGLSL(Operation *op,raw_ostream &o){
    GlslRaiser glsl(o);
    return glsl.emitHarness(op);
}

}