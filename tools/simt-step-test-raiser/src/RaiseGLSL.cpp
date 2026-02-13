#include "RaiseGLSL.h"
#include "BaseRaiser.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/IR/BuiltinTypes.h"
#include "mlir/Support/WalkResult.h"
#include "simt-step/Dialect/SimtStep/SimtStepDialect.h"
#include "llvm/ADT/BitVector.h"
#include "llvm/ADT/DenseMap.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/Support/Casting.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/LogicalResult.h"
#include <random>


using namespace simt::test_raiser;
using namespace llvm;
using namespace mlir;

class GlslRaiser : public BaseRaiser {

public:

using BaseRaiser::BaseRaiser;

std::map<std::string, std::vector<int>> funcBufferMaps;

LogicalResult emitHarness(Operation* op, HarnessProps props) override {
    if (!props.noWrapper){
        os << "import subprocess\nimport os\n";
        os << "PROGRAM = \"\"\"\\\n";
    }
    if (failed(emitAmberHarness(*this, op, "GLSL", props))) return failure();
    if (!props.noWrapper){

        std::random_device dev;
        std::mt19937 rng(dev());
        std::uniform_int_distribution<std::mt19937::result_type> dist6(10000000,99999999);
        std::string fname = "testout" + std::to_string(dist6(rng));

        os << "\"\"\"\n";
        os << "if __name__ == \"__main__\":\n";
        os.indent();
        os << "with open(\"" << fname << ".amber\", \"w\") as f: f.write(PROGRAM)\n";
        // os << "assert os.environ[\"AMBERPATH\"], \"Please specify a path to amber in $AMBERPATH\"\n";
        os << "try:\n";
        os.indent();
        os << "subprocess.run([\"amber\", \"" << fname << ".amber\"], shell=True)\n";
        os.unindent();
        os << "finally:\n";
        os.indent();
        os << "os.remove(\"" << fname << ".amber\")";
        os.unindent();
        os.unindent();
    }
    return success();
}

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

LogicalResult emitShaderPrologue(Operation* op) override {
    os << 
        "#version 430\n"
        "#extension GL_KHR_shader_subgroup_ballot  : enable\n"
        "#extension GL_KHR_shader_subgroup_vote    : enable\n"
        "#extension GL_KHR_shader_subgroup_basic   : enable\n"
        "#extension GL_KHR_memory_scope_semantics  : enable\n"
        "#extension GL_ARB_gpu_shader_int64        : enable\n";
    os  << "layout(local_size_x = " << std::to_string(ntx)
        << ", local_size_y = " << std::to_string(nty) 
        << ", local_size_z = " << std::to_string(ntz) << ") in;\n";

    
    // Declare all buffers at top of program
    int locs = 0;
    auto m = dyn_cast<ModuleOp>(op);
    assert(m);
    auto f = m.lookupSymbol<func::FuncOp>("main");
    for (Value v : f.getArguments()){
        if (auto t = dyn_cast<simt::dialect::ResourceType>(v.getType())){
            assert(t.getMemorySpace() == simt::dialect::MemorySpace::Global);

            os << "layout(set = 0, binding = " << locs << ") buffer Buf" << std::to_string(locs) <<  " { ";
            if (failed(emitType(t.getElementType()))) return failure();
            os << " " << addValueName(v) << "[" << buffer_sizes[locs] << "];};\n";

            locs++;
        }
    }

    // GLSL doesn't really support passing arrays without explicit lengths,
    // but SIMT Step does and passes them as arguments. We need to figure out
    // which arguments corrispond to which buffers and remove the buffer parameters
    // in the function call.
    f->walk([&](Operation* op) -> WalkResult {
        auto call = dyn_cast<func::CallOp>(op);
        if (!call) return WalkResult::advance();
        std::string fname = call.getCallee().str();
        

        std::vector<int> bufmap;
        llvm::BitVector bv {false};
        for (auto arg : call.getArgOperands()){
            bv.push_back(isa<simt::dialect::ResourceType>(arg.getType()));
            if (isa<simt::dialect::ResourceType>(arg.getType())){
                bufmap.push_back(getValueNumber(arg));
            }
        }

        if (funcBufferMaps.contains(fname) && funcBufferMaps[fname] != bufmap){
            llvm_unreachable("Cannot support multiple mapping from buffers to function arguments");
        }
        funcBufferMaps[fname] = bufmap;

        call->eraseOperands(bv);

        return WalkResult::advance();
    });

    return success();
}

LogicalResult emitCast(Value in, Value out) override {
    if(failed(emitValueDefine(out))) return failure();
    if(failed(emitType(out.getType()))) return failure();
    os << "(" << getValueName(in) << ")";
    return success();
}

/////////////// 'arith' dialect ///////////////
LogicalResult printOp(arith::RemFOp &op) override {
    return emitFuncCall(op.getResult(), "mod", {op->getOperand(0), op->getOperand(1)});
}

/////////////// 'func' dialect ///////////////
LogicalResult printOp(func::FuncOp &op) override {
    if (op.getSymName() == "main"){
        if (failed(emitMainFuncTop(op))) return failure();
    } else {
        // This portion handles replacing the buffer arguments with the buffers
        // themselves, and removing them from the function signature before running
        // the normal function printer.
        assert(op.getFunctionType().getNumResults() <= 1);
        if (op.getFunctionType().getNumResults() == 0){
            os << "void";
        } else {
            if (failed(emitType(op.getFunctionType().getResult(0)))) return failure();
        }
        os << " " << op.getSymName() << "(";
        int seen = 0;
        for (auto arg : op.getArguments()){
            if (!isa<simt::dialect::ResourceType>(arg.getType())){
                if (failed(emitType(arg.getType()))) return failure();
                os << " " << addValueName(arg);
                if (arg.getArgNumber() < op.getNumArguments() - 1){
                    os << ", ";
                }
            } else {
                value_map[arg] = funcBufferMaps[op.getSymName().str()][seen];
                seen++;
            }
        }
        os << ")";
    }
    os << "{\n";
    os.indent();
    if (failed(emitRegion(op.getRegion()))) return failure();
    os.unindent();
    os << "}\n\n";
    return success();
}

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
        << "atomicAdd(" << getValueName(op->getOperand(0)) 
        << "[" << getValueName(op->getOperand(1)) << "], "
        << getValueName(op->getOperand(2)) << ")";
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

LogicalResult printOp(GroupThreadIdOp& op) override {
    return emitConstVec(op.getResult(), "gl_LocalInvocationID");
}

LogicalResult printOp(GroupIndexOp& op) override {
    return emitConstVec(op.getResult(), "gl_SubgroupInvocationID");
}

};

namespace simt::test_raiser {

LogicalResult emitRaisedGLSL(Operation *op, raw_ostream &o, HarnessProps props){
    GlslRaiser glsl(o);
    return glsl.emitHarness(op, props);
}

}