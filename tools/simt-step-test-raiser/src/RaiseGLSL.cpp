#include "RaiseGLSL.h"
#include "BaseRaiser.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/Utils/StaticValueUtils.h"
#include "mlir/Dialect/Vector/IR/VectorOps.h"
#include "mlir/IR/BuiltinTypes.h"
#include "simt-step/Dialect/SimtStep/SimtStepDialect.h"
#include "llvm/Support/Casting.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/LogicalResult.h"
#include <cstdio>
#include <string>
#include <vector>


using namespace simt::test_raiser;
using namespace llvm;
using namespace mlir;

class GlslRaiser : public BaseRaiser {

public:

using BaseRaiser::BaseRaiser;

LogicalResult emitHarness(Operation* op, std::vector<std::vector<int64_t>> expected, std::vector<std::vector<int64_t>> input) override {
    return emitAmberHarness(*this, op, "GLSL", expected, input);
}

~GlslRaiser(){}

private:
LogicalResult emitMainFuncTop(func::FuncOp& f) override {
    os  << "layout(local_size_x = " << std::to_string(ntx)
        << ", local_size_y = " << std::to_string(nty) 
        << ", local_size_z = " << std::to_string(ntz) << ") in;\n";

    // TODO: Buffer memory semantics
    int locs = 0;
    for (Value v : f.getArguments()){
        if (auto t = dyn_cast<simt::dialect::ResourceType>(v.getType())){
            assert(t.getMemorySpace() == simt::dialect::MemorySpace::Global);
            os << "layout(set = 0, binding = " << locs << ") buffer Buf { ";
            if (failed(emitType(t.getElementType()))) return failure();
            os << " " << addValueName(v) << "[" << buffer_sizes[locs] << "];};\n";
            locs++;
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
        if (vectype.getElementType().isInteger()) os << "i";
        os << "vec" << len;
    } else if (auto indextype = dyn_cast<mlir::IndexType>(type)){
        os << "uint";
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


/////////////// 'simt_step' dialect ///////////////

LogicalResult emitConstVec(Value v, std::string name){
    if (failed(emitValueDefine(v))) return failure();
    if (failed(emitType(v.getType()))) return failure();
    os << "(" << name;
    if (!dyn_cast<mlir::VectorType>(v.getType())){
        os << ".x";
    }
    os << ")";
    return success();
}

LogicalResult printOp(DispatchThreadIdOp& op) override {
    return emitConstVec(op.getResult(), "gl_GlobalInvocationID");
}

LogicalResult printOp(BufferAtomicAddOp& op) override {
    if (failed(emitValueDefine(op.getResult()))) return failure();
    os 
        << "atomicAdd(" << getOrAddValueName(op->getOperand(0)) 
        << "[" << getOrAddValueName(op->getOperand(1)) << "], "
        << getOrAddValueName(op->getOperand(2)) << ")";
    return success();
}

LogicalResult printOp(WaveCountBitsOp& op) override {
    if (failed(emitValueDefine(op.getResult()))) return failure();
    if (failed(emitType(op.getResult().getType()))) return failure();
    os << "(subgroupBallotBitCount(subgroupBallot(";
    os << getValueName(op.getOperand());
    os << ")))";
    return success();
}

LogicalResult printOp(LaneIdOp& op) override {
    return emitConstVec(op.getResult(), "gl_SubgroupInvocationID");
}

LogicalResult printOp(SubgroupIdOp& op) override {
    return emitConstVec(op.getResult(), "gl_SubgroupID");
}

LogicalResult printOp(WaveAllOp& op) override {
    return emitFuncCall(op.getResult(), "subgroupAll", {op.getOperand()});
}

LogicalResult printOp(WaveAnyOp& op) override {
    return emitFuncCall(op.getResult(), "subgroupAny", {op.getOperand()});
}

LogicalResult printOp(GroupIdOp& op) override {
    return emitConstVec(op.getResult(), "gl_WorkGroupID");
}

std::string Scope2Const(Scope s){
    switch (s){
        case Scope::Workgroup:
            return "gl_ScopeWorkgroup";
        case Scope::Subgroup:
            return "gl_ScopeSubgroup";
        case Scope::Thread:
            return "gl_ScopeInvocation";
    }
}

std::string Memsem2Const(MemorySemantics s){
    switch (s){
        case MemorySemantics::None:
            return "gl_SemanticsRelaxed"; // TODO: Double check this
        case MemorySemantics::Acquire:
            return "gl_SemanticsAquire";
        case MemorySemantics::Release:
            return "gl_SemanticsRelease";
        case MemorySemantics::AcqRel:
            return "gl_SemanticsAquireRelease";
    }
}

// LogicalResult printOp(BarrierOp& op) override {
//     os << "controlBarrier(";
//     os << Scope2Const(op.getScope().value_or(Scope::Workgroup));
//     os << ", ";
//     os << Scope2Const(op.getScope().value_or(Scope::Workgroup));
//     os << ", gl_StorageSemanticsNone, ";
//     os << Memsem2Const(op.getMemsem().value_or(MemorySemantics::None));
//     os << ")";
//     return success();
// }

// LogicalResult printOp(FenceOp& op) override {
//     os << "memoryBarrier(";
//     os << Scope2Const(op.getScope().value_or(Scope::Workgroup));
//     os << ", gl_StorageSemanticsNone, ";
//     os << Memsem2Const(op.getMemsem().value_or(MemorySemantics::None));
//     os << ")";
//     return success();
// }

};

namespace simt::test_raiser {

LogicalResult emitRaisedGLSL(Operation *op, raw_ostream &o, std::vector<std::vector<int64_t>> expected, std::vector<std::vector<int64_t>> input){
    GlslRaiser glsl(o);
    return glsl.emitHarness(op, expected, input);
}

}