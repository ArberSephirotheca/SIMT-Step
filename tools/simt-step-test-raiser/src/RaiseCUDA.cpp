#include "RaiseCUDA.h"
#include "BaseRaiser.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/Utils/StaticValueUtils.h"
#include "mlir/Dialect/Vector/IR/VectorOps.h"
#include "mlir/IR/BuiltinTypes.h"
#include "simt-step/Dialect/SimtStep/SimtStepDialect.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/ADT/SmallVectorExtras.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/Support/Casting.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/FormatVariadicDetails.h"
#include "llvm/Support/LogicalResult.h"
#include <cstddef>
#include <cstdio>
#include <string>
#include <vector>


using namespace simt::test_raiser;
using namespace llvm;
using namespace mlir;

class CudaRaiser : public BaseRaiser {

public:

unsigned subgroupWidth = 32;

using BaseRaiser::BaseRaiser;

LogicalResult emitHarness(
    Operation* op, 
    HarnessProps props) override {

    std::vector<int64_t> bufferIndicies;
    if(failed(getMainInfo(op, ntx, nty, ntz, bufferIndicies))) return failure();

    os << "#include <assert.h>\n#include <cstdio>\n";
    os << "__device__ __forceinline__ int3 make_int3(uint3 v){ return make_int3(v.x, v.y, v.z); }\n";

    if (failed(emitOp(op))) return failure();

    os << "int main(){\n";
    os.indent();
    
    for (auto [i, ebuf] : llvm::enumerate(props.expected)){
        os << "int expected" << i << "[] = {";
        for (auto [j, v] : llvm::enumerate(ebuf)){
            os << v;
            if (j + 1 < ebuf.size()) os << ", ";
        }
        os << "};\n"; 
    }


    for (auto [i, abuf] : llvm::enumerate(props.input)){
        os << "int host_actual" << i << "[] = {";
        for (auto [j, v] : llvm::enumerate(abuf)){
            os << v;
            if (j + 1 < abuf.size()) os << ", ";
        }
        os << "};\n";
        os << "int *dev_actual" << i << ";\n";
        os << "cudaMalloc(&dev_actual" << i << ", sizeof(host_actual" << i << "));\n";
        os << "cudaMemcpy(dev_actual" << i << ", host_actual" << i << ", sizeof(host_actual" << i << "), cudaMemcpyHostToDevice);\n";
    }

    os << "dim3 thread_dim(" << ntx << ", " << nty << ", " << ntz << ");\n";
    os << "kernel_main<<<1, thread_dim>>>(";
    for (size_t i = 0; i < props.input.size(); i++){
        os << "dev_actual" << i;
        if (i < props.input.size() - 1) os << ", ";
    }
    os << ");\n";

    for (size_t i = 0; i < props.input.size(); i++){
        os << "cudaMemcpy(host_actual" << i << ", dev_actual" << i << ", sizeof(host_actual" << i << "), cudaMemcpyDeviceToHost);\n";
        os << "for (int i = 0; i < " << props.expected[i].size() << "; i++){\n";
        os.indent() << "if (expected" << i << "[i] != host_actual" << i << "[i]){\n";
        os.indent() << "printf(\"[%d]: expected=%d actual=%d\\n\", i, expected" << i << "[i], host_actual" << i << "[i]);\n";
        os << "assert(expected" << i << "[i] == host_actual" << i << "[i]);\n";
        os.unindent() << "}\n";
        os.unindent() << "}\n";
    }

    os.unindent() << "}";

    return success();
}

protected:

LogicalResult emitConst(Type t, APFloat v) override {
    switch (t.getIntOrFloatBitWidth()){
        case 32:
            os << v << "f";
            break;
        case 64:
            os << v;
            break;
        default:
            llvm_unreachable("Unable to emit conststant");
            break;
    }

    return success();
}

LogicalResult emitMainFuncTop(func::FuncOp& f) override {
    os << "__global__ void kernel_main(";
    for (auto [i, v] : llvm::enumerate(f.getArguments())){
        if (auto t = dyn_cast<simt::dialect::ResourceType>(v.getType())){
            assert(t.getMemorySpace() == simt::dialect::MemorySpace::Global);
            if (failed(emitType(t.getElementType()))) return failure();
            os << "* " << addValueName(v);
            if (i < f.getArguments().size() - 1) os << ", ";
        }
    }
    os << ")";
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
        if (failed(emitType(vectype.getElementType()))) return failure();
        os << len;
    } else if (auto indextype = dyn_cast<mlir::IndexType>(type)){
        os << "size_t";
    } else {
        llvm_unreachable("Unsupported type");
    }
    return success();
}

LogicalResult emitShaderPrologue() override {
    return success();
}


LogicalResult emitCast(Value in, Value out) override {
    if(failed(emitValueDefine(out))) return failure();
    if (isa<mlir::VectorType>(out.getType())){
        os << "make_";
        if(failed(emitType(out.getType()))) return failure();
        os << "(" << getValueName(in) << ")";
    } else {
        os << "(";
        if(failed(emitType(out.getType()))) return failure();
        os << ")" << getValueName(in);

    }
    return success();
}

/////////////// 'arith' dialect ///////////////
LogicalResult printOp(arith::RemFOp &op) override {
    return emitFuncCall(op.getResult(), "fmod", {op->getOperand(0), op->getOperand(1)});
}

/////////////// 'func' dialect ///////////////

LogicalResult printOp(func::FuncOp& op) override {
    if (op.getSymName() != "main")
        os << "__device__ ";
    return BaseRaiser::printOp(op);
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
    if (failed(emitValueDefine(op.getResult()))) return failure();
    if (isa<mlir::VectorType>(op.getResult().getType())){
        os << "make_int3(blockDim.x * blockIdx.x + threadIdx.x, blockDim.y * blockIdx.y + threadIdx.y, blockDim.z * blockIdx.z + threadIdx.z)";
    } else {
        os << "blockDim.x * blockIdx.x + threadIdx.x";
    }
    return success();
}

LogicalResult printOp(BufferAtomicAddOp& op) override {
    return failure();
}

LogicalResult printOp(WaveCountBitsOp& op) override {
    if (failed(emitValueDefine(op.getResult()))) return failure();
    os << "__popc(__ballot_sync(__activemask(), " << getValueName(op.getOperand()) << "))";
    return success();
}

LogicalResult printOp(LaneIdOp& op) override {
    if (failed(emitValueDefine(op.getResult()))) return failure();
    os << "(blockDim.x * blockIdx.x + threadIdx.x) % " << subgroupWidth;
    return success();
}

LogicalResult printOp(SubgroupIdOp& op) override {
    if (failed(emitValueDefine(op.getResult()))) return failure();
    os << "(blockDim.x * blockIdx.x + threadIdx.x) / " << subgroupWidth;
    return success();
}

LogicalResult printOp(WaveAllOp& op) override {
    return emitFuncCall(op.getResult(), "__all", {op.getOperand()});
}

LogicalResult printOp(WaveAnyOp& op) override {
    return emitFuncCall(op.getResult(), "__any", {op.getOperand()});
}

LogicalResult printOp(GroupIdOp& op) override {
    return emitConstVec(op.getResult(), "make_int3(blockDim)");
}

LogicalResult printOp(GroupThreadIdOp& op) override {
    return emitConstVec(op.getResult(), "make_int3(threadIdx)");
}

LogicalResult printOp(GroupIndexOp& op) override {
    return emitConstVec(op.getResult(), "make_int3(blockIdx)");
}

};

namespace simt::test_raiser {

LogicalResult emitRaisedCUDA(
    Operation *op, 
    raw_ostream &o, 
    HarnessProps props){

    CudaRaiser cuda(o);
    cuda.subgroupWidth = props.subgroupWidth;

    return cuda.emitHarness(op, props);
}

}