#include "RaiseCUDA_HIP.h"
#include "BaseRaiser.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/IR/BuiltinTypes.h"
#include "simt-step/Dialect/SimtStep/SimtStepDialect.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/Support/Casting.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/LogicalResult.h"
#include <cstddef>
#include <cstdio>
#include <ctime>
#include <random>
#include <string>
#include <unordered_map>
#include <vector>


using namespace simt::test_raiser;
using namespace llvm;
using namespace mlir;

enum RaiserType {
    CUDA,
    HIP
};

struct ResourceInfo {
    Value value;
    simt::dialect::ResourceType type;
};

static func::FuncOp getMainFunc(Operation *op) {
    auto mod = dyn_cast<ModuleOp>(op);
    assert(mod && "expected module op");
    auto func = mod.lookupSymbol<func::FuncOp>("main");
    assert(func && "expected main function");
    return func;
}

static SmallVector<ResourceInfo, 4> getMainResourceInfos(Operation *op) {
    SmallVector<ResourceInfo, 4> infos;
    for (Value arg : getMainFunc(op).getArguments()) {
        if (auto type = dyn_cast<simt::dialect::ResourceType>(arg.getType()))
            infos.push_back({arg, type});
    }
    return infos;
}

template<RaiserType RT>
class CudaHipRaiser : public BaseRaiser {

public:

unsigned subgroupWidth = 32;

using BaseRaiser::BaseRaiser;

LogicalResult emitHarness(Operation *op, HarnessProps props) override {
    const std::string runtime = RT == RaiserType::CUDA ? "cuda" : "hip";

    if (!props.noWrapper) {
        os << "import subprocess\nimport os\n";
        os << "PROGRAM = r\"\"\"\\\n";
    }

    std::vector<int64_t> bufferIndices;
    if (failed(getMainInfo(op, ntx, nty, ntz, bufferIndices)))
        return failure();

    auto mainFunc = getMainFunc(op);
    auto resourceInfos = getMainResourceInfos(op);
    std::vector<std::vector<int64_t>> expectedBuffers = props.expected;
    std::vector<std::vector<int64_t>> inputBuffers = props.input;
    const size_t bufferCount = std::max(resourceInfos.size(),
                                        std::max(expectedBuffers.size(), inputBuffers.size()));
    expectedBuffers.resize(bufferCount);
    inputBuffers.resize(bufferCount);
    if (bufferCount != resourceInfos.size()) {
        return op->emitOpError(
            "wrapper buffer metadata does not match main resource arguments");
    }

    argBufferSizes.assign(mainFunc.getNumArguments(), 1);
    for (auto [i, info] : llvm::enumerate(resourceInfos)) {
        const size_t argIndex = cast<BlockArgument>(info.value).getArgNumber();
        argBufferSizes[argIndex] =
            std::max<size_t>(1, std::max(expectedBuffers[i].size(), inputBuffers[i].size()));
    }

    os << "#include <assert.h>\n"
          "#include <cmath>\n"
          "#include <cstddef>\n"
          "#include <cstdint>\n"
          "#include <cstdio>\n";
    if constexpr (RT == RaiserType::CUDA) {
        os << "#include <cuda_fp16.h>\n"
              "#include <cuda_runtime.h>\n"
              "#include <mma.h>\n";
    } else {
        os << "#include <hip/hip_fp16.h>\n"
              "#include <hip/hip_runtime.h>\n"
              "#include <rocwmma/rocwmma.hpp>\n";
    }
    emitRuntimeHelpers();

    if (failed(emitOp(op)))
        return failure();

    os << "int main(){\n";
    os.indent();

    for (auto [i, info] : llvm::enumerate(resourceInfos)) {
        if (info.type.getMemorySpace() != simt::dialect::MemorySpace::Global)
            continue;
        std::vector<int64_t> expected = expectedBuffers[i];
        expected.resize(getResourceSize(info.value), 0);
        if (failed(emitTypedArray("expected" + std::to_string(i),
                                  info.type.getElementType(), expected))) {
            return failure();
        }
    }

    for (auto [i, info] : llvm::enumerate(resourceInfos)) {
        std::vector<int64_t> initial = inputBuffers[i];
        initial.resize(getResourceSize(info.value), 0);
        const bool isShared =
            info.type.getMemorySpace() == simt::dialect::MemorySpace::Shared;
        const std::string hostName =
            (isShared ? "host_init" : "host_actual") + std::to_string(i);
        const std::string devName =
            (isShared ? "dev_init" : "dev_actual") + std::to_string(i);

        if (failed(emitTypedArray(hostName, info.type.getElementType(), initial)))
            return failure();
        if (failed(emitType(info.type.getElementType())))
            return failure();
        os << " *" << devName << " = nullptr;\n";
        os << runtime << "Malloc(&" << devName << ", sizeof(" << hostName << "));\n";
        os << runtime << "Memcpy(" << devName << ", " << hostName
           << ", sizeof(" << hostName << "), " << runtime
           << "MemcpyHostToDevice);\n";
    }

    os << "dim3 thread_dim(" << ntx << ", " << nty << ", " << ntz << ");\n";
    os << "kernel_main<<<1, thread_dim>>>(";
    for (auto [i, info] : llvm::enumerate(resourceInfos)) {
        const bool isShared =
            info.type.getMemorySpace() == simt::dialect::MemorySpace::Shared;
        os << (isShared ? "dev_init" : "dev_actual") << i;
        if (i + 1 < resourceInfos.size())
            os << ", ";
    }
    os << ");\n";
    os << runtime << "DeviceSynchronize();\n";

    for (auto [i, info] : llvm::enumerate(resourceInfos)) {
        const bool isShared =
            info.type.getMemorySpace() == simt::dialect::MemorySpace::Shared;
        const std::string devName =
            (isShared ? "dev_init" : "dev_actual") + std::to_string(i);
        if (isShared) {
            os << runtime << "Free(" << devName << ");\n";
            continue;
        }

        std::vector<int64_t> expected = expectedBuffers[i];
        expected.resize(getResourceSize(info.value), 0);
        os << runtime << "Memcpy(host_actual" << i << ", " << devName
           << ", sizeof(host_actual" << i << "), " << runtime
           << "MemcpyDeviceToHost);\n";
        os << "for (size_t idx = 0; idx < " << expected.size() << "; ++idx){\n";
        os.indent();
        os << "if (!simtBufferEqual(host_actual" << i << "[idx], expected" << i
           << "[idx])){\n";
        os.indent();
        os << "fprintf(stderr, \"[%zu]: expected=%g actual=%g\\n\", idx, "
           << "simtToDouble(expected" << i << "[idx]), "
           << "simtToDouble(host_actual" << i << "[idx]));\n";
        os << "assert(simtBufferEqual(host_actual" << i << "[idx], expected" << i
           << "[idx]));\n";
        os.unindent();
        os << "}\n";
        os.unindent();
        os << "}\n";
        os << runtime << "Free(" << devName << ");\n";
    }

    os << "return 0;\n";
    os.unindent() << "}";

    if (!props.noWrapper) {
        const std::string ext = RT == RaiserType::CUDA ? "cu" : "hip";

        std::random_device dev;
        std::mt19937 rng(dev());
        std::uniform_int_distribution<std::mt19937::result_type> dist6(10000000, 99999999);
        std::string fname = "testout" + std::to_string(dist6(rng));

        os << "\"\"\"\n";
        os << "if __name__ == \"__main__\":\n";
        os.indent();
        os << "with open(\"" << fname << "." << ext << "\", \"w\") as f: f.write(PROGRAM)\n";
        os << "try:\n";
        os.indent();
        os << "cmd = [\"" << (RT == RaiserType::CUDA ? "nvcc" : "hipcc")
           << "\", \"-w\", \"" << fname << "." << ext
           << "\", \"-o\", \"" << fname << ".out\"]\n";
        os << "subprocess.run(cmd, check=True, env=os.environ)\n";
        os << "subprocess.run([\"./" << fname << ".out\"], check=True, env=os.environ)\n";
        os.unindent();
        os << "finally:\n";
        os.indent();
        os << "if os.path.exists(\"" << fname << "." << ext
           << "\"): os.remove(\"" << fname << "." << ext << "\")\n";
        os << "if os.path.exists(\"" << fname << ".out\"): os.remove(\""
           << fname << ".out\")\n";
        os.unindent();
        os.unindent();
    }

    return success();
}

protected:

    std::vector<size_t> argBufferSizes;

    size_t getResourceSize(Value value) const {
        auto arg = cast<BlockArgument>(value);
        if (arg.getArgNumber() >= argBufferSizes.size())
            return 1;
        return std::max<size_t>(1, argBufferSizes[arg.getArgNumber()]);
    }

    LogicalResult emitMainSharedSetup(func::FuncOp &f) {
        bool hasShared = false;
        for (Value v : f.getArguments()) {
            auto resourceType = dyn_cast<simt::dialect::ResourceType>(v.getType());
            if (!resourceType ||
                resourceType.getMemorySpace() != simt::dialect::MemorySpace::Shared) {
                continue;
            }

            if (!hasShared) {
                os << "const size_t __simt_local_linear = static_cast<size_t>(threadIdx.x) +\n"
                      "    static_cast<size_t>(blockDim.x) *\n"
                      "        (static_cast<size_t>(threadIdx.y) +\n"
                      "         static_cast<size_t>(blockDim.y) * static_cast<size_t>(threadIdx.z));\n";
                os << "const size_t __simt_local_size = static_cast<size_t>(blockDim.x) *\n"
                      "    static_cast<size_t>(blockDim.y) * static_cast<size_t>(blockDim.z);\n";
                hasShared = true;
            }

            const std::string name = getValueName(v);
            const size_t size = getResourceSize(v);
            os << "__shared__ ";
            if (failed(emitType(resourceType.getElementType())))
                return failure();
            os << " " << name << "[" << size << "];\n";
            os << "for (size_t __simt_init_" << getValueNumber(v)
               << " = __simt_local_linear; __simt_init_" << getValueNumber(v)
               << " < " << size << "; __simt_init_" << getValueNumber(v)
               << " += __simt_local_size) {\n";
            os.indent();
            os << name << "[__simt_init_" << getValueNumber(v) << "] = "
               << name << "_init[__simt_init_" << getValueNumber(v) << "];\n";
            os.unindent();
            os << "}\n";
        }

        if (hasShared)
            os << "__syncthreads();\n";
        return success();
    }

    void emitRuntimeHelpers() {
        os << R"CPP(
template <typename T>
static inline double simtToDouble(T value) {
    return static_cast<double>(value);
}

static inline double simtToDouble(half value) {
    return static_cast<double>(__half2float(value));
}

template <typename T>
static inline bool simtBufferEqual(T actual, T expected) {
    return actual == expected;
}

static inline bool simtBufferEqual(float actual, float expected) {
    return std::fabs(actual - expected) <= 1.0e-5f;
}

static inline bool simtBufferEqual(double actual, double expected) {
    return std::fabs(actual - expected) <= 1.0e-9;
}

static inline bool simtBufferEqual(half actual, half expected) {
    return std::fabs(__half2float(actual) - __half2float(expected)) <= 1.0e-3f;
}

)CPP";
    }

    StringRef wmmaNamespace() const {
        return RT == RaiserType::CUDA ? "nvcuda::wmma" : "rocwmma";
    }

    StringRef wmmaRoleName(simt::dialect::WmmaRole role) const {
        switch (role) {
        case simt::dialect::WmmaRole::MatrixA:
            return "matrix_a";
        case simt::dialect::WmmaRole::MatrixB:
            return "matrix_b";
        case simt::dialect::WmmaRole::Accumulator:
            return "accumulator";
        }
        llvm_unreachable("unsupported WMMA role");
    }

    StringRef wmmaLayoutName(simt::dialect::WmmaLayout layout) const {
        switch (layout) {
        case simt::dialect::WmmaLayout::RowMajor:
            return "row_major";
        case simt::dialect::WmmaLayout::ColMajor:
            return "col_major";
        case simt::dialect::WmmaLayout::None:
            return "none";
        }
        llvm_unreachable("unsupported WMMA layout");
    }

    StringRef wmmaMemLayoutName(simt::dialect::WmmaLayout layout) const {
        switch (layout) {
        case simt::dialect::WmmaLayout::RowMajor:
            return "mem_row_major";
        case simt::dialect::WmmaLayout::ColMajor:
            return "mem_col_major";
        case simt::dialect::WmmaLayout::None:
            break;
        }
        llvm_unreachable("unsupported WMMA memory layout");
    }

    LogicalResult emitTypedLiteral(Type type, int64_t value) {
        if (type.isInteger())
            return BaseRaiser::emitConst(type, value);
        if (type.isF16()) {
            os << "__float2half(static_cast<float>(" << value << "))";
            return success();
        }
        if (type.isF32()) {
            os << "static_cast<float>(" << value << ")";
            return success();
        }
        if (type.isF64()) {
            os << "static_cast<double>(" << value << ")";
            return success();
        }
        return failure();
    }

    LogicalResult emitTypedArray(const std::string &name, Type elementType,
                                 ArrayRef<int64_t> values) {
        const size_t count = values.empty() ? 1 : values.size();
        int64_t fillValue = 0;
        if (!values.empty()) {
            std::unordered_map<int64_t, size_t> counts;
            size_t bestCount = 0;
            for (int64_t value : values) {
                size_t current = ++counts[value];
                if (current > bestCount) {
                    bestCount = current;
                    fillValue = value;
                }
            }
        }

        if (failed(emitType(elementType)))
            return failure();
        os << " " << name << "[" << count << "];\n";
        os << "for (size_t " << name << "_idx = 0; " << name << "_idx < " << count
           << "; ++" << name << "_idx) " << name << "[" << name << "_idx] = ";
        if (failed(emitTypedLiteral(elementType, fillValue)))
            return failure();
        os << ";\n";

        for (size_t i = 0; i < count; ++i) {
            const int64_t value = values.empty() ? 0 : values[i];
            if (value == fillValue)
                continue;
            os << name << "[" << i << "] = ";
            if (failed(emitTypedLiteral(elementType, value)))
                return failure();
            os << ";\n";
        }
        return success();
    }

    LogicalResult emitConst(Type t, APFloat v) override {
        switch (t.getIntOrFloatBitWidth()) {
        case 16:
            os << "__float2half(" << static_cast<float>(v.convertToDouble()) << "f)";
            break;
        case 32:
            os << "static_cast<float>(" << v.convertToDouble() << ")";
            break;
        case 64:
            os << "static_cast<double>(" << v.convertToDouble() << ")";
            break;
        default:
            llvm_unreachable("Unable to emit constant");
        }
        return success();
    }

    LogicalResult emitMainFuncTop(func::FuncOp &f) override {
        os << "__global__ void kernel_main(";
        bool first = true;
        for (Value v : f.getArguments()) {
            auto resourceType = dyn_cast<simt::dialect::ResourceType>(v.getType());
            if (!resourceType)
                continue;

            const std::string name = addValueName(v);
            if (!first)
                os << ", ";
            first = false;

            switch (resourceType.getMemorySpace()) {
            case simt::dialect::MemorySpace::Global:
                if (failed(emitType(resourceType.getElementType())))
                    return failure();
                os << "* " << name;
                break;
            case simt::dialect::MemorySpace::Shared:
                os << "const ";
                if (failed(emitType(resourceType.getElementType())))
                    return failure();
                os << "* " << name << "_init";
                break;
            default:
                return f.emitOpError(
                    "CUDA/HIP raiser only supports Global and Shared resources");
            }
        }
        os << ")";
        return success();
    }

    LogicalResult emitType(Type type) override {
        if (auto rtype = dyn_cast<simt::dialect::ResourceType>(type)) {
            if (failed(emitType(rtype.getElementType())))
                return failure();
            os << "*";
            return success();
        }

        if (auto fragmentType = dyn_cast<simt::dialect::WmmaFragmentType>(type)) {
            os << wmmaNamespace() << "::fragment<" << wmmaNamespace() << "::"
               << wmmaRoleName(fragmentType.getRole()) << ", "
               << fragmentType.getM() << ", " << fragmentType.getN() << ", "
               << fragmentType.getK() << ", ";
            if (failed(emitType(fragmentType.getElementType())))
                return failure();
            if (fragmentType.getRole() == simt::dialect::WmmaRole::Accumulator) {
                os << ">";
            } else {
                os << ", " << wmmaNamespace() << "::"
                   << wmmaLayoutName(fragmentType.getLayout()) << ">";
            }
            return success();
        }

        if (type.isInteger()) {
            switch (type.getIntOrFloatBitWidth()) {
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
            }
            return success();
        }

        if (type.isFloat()) {
            switch (type.getIntOrFloatBitWidth()) {
            case 16:
                os << "half";
                break;
            case 32:
                os << "float";
                break;
            case 64:
                os << "double";
                break;
            default:
                llvm_unreachable("Unsupported float type");
            }
            return success();
        }

        if (auto vectorType = dyn_cast<mlir::VectorType>(type)) {
            long len = vectorType.getShape().front();
            if (vectorType.getShape().size() != 1 || len > 4 || len < 2)
                llvm_unreachable("Unsupported vector shape");
            if (failed(emitType(vectorType.getElementType())))
                return failure();
            os << len;
            return success();
        }

        if (isa<mlir::IndexType>(type)) {
            os << "size_t";
            return success();
        }

        llvm_unreachable("Unsupported type");
    }

    LogicalResult emitCast(Value in, Value out) override {
        if (failed(emitValueDefine(out)))
            return failure();
        if (isa<mlir::VectorType>(out.getType())) {
            os << "make_";
            if (failed(emitType(out.getType())))
                return failure();
            os << "(" << getValueName(in) << ")";
            return success();
        }
        if (out.getType().isF16()) {
            os << "__float2half(static_cast<float>(" << getValueName(in) << "))";
            return success();
        }
        if (in.getType().isF16() && out.getType().isF32()) {
            os << "__half2float(" << getValueName(in) << ")";
            return success();
        }
        os << "(";
        if (failed(emitType(out.getType())))
            return failure();
        os << ")" << getValueName(in);
        return success();
    }

    LogicalResult printOp(arith::RemFOp &op) override {
        return emitFuncCall(op.getResult(), "fmod", {op->getOperand(0), op->getOperand(1)});
    }

    LogicalResult printOp(func::FuncOp &op) override {
        if (op.getSymName() != "main") {
            os << "__device__ ";
            return BaseRaiser::printOp(op);
        }

        if (failed(emitMainFuncTop(op)))
            return failure();
        os << "{\n";
        os.indent();
        if (failed(emitMainSharedSetup(op)))
            return failure();
        if (failed(emitRegion(op.getRegion())))
            return failure();
        os.unindent();
        os << "}\n\n";
        return success();
    }

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
    if (RT == CUDA){
        os << "__popc(__ballot_sync(__activemask(), " << getValueName(op.getOperand()) << "))";
    } else {
        os << "__popc(__ballot(" << getValueName(op.getOperand()) << "))";
    }
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
    if (RT == HIP){
        return emitFuncCall(op.getResult(), "__all", {op.getOperand()});
    } else {
        os << "__all_sync(__activemask(), " << getValueName(op.getOperand()) << ")";
        return success();
    }
}

LogicalResult printOp(WaveAnyOp& op) override {
    if (RT == HIP){
        return emitFuncCall(op.getResult(), "__any", {op.getOperand()});
    } else {
        os << "__any_sync(__activemask(), " << getValueName(op.getOperand()) << ")";
        return success();
    }
}

LogicalResult printOp(GroupIdOp& op) override {
    return emitConstVec(op.getResult(), "make_int3(blockDim.x, blockDim.y, blockDim.x)");
}

LogicalResult printOp(GroupThreadIdOp& op) override {
    return emitConstVec(op.getResult(), "make_int3(threadIdx.x, threadIdx.y, threadIdx.x)");
}

LogicalResult printOp(GroupIndexOp& op) override {
    return emitConstVec(op.getResult(), "make_int3(blockIdx.x, blockIdx.y, blockIdx.z)");
}

LogicalResult printOp(WmmaFillOp &op) override {
    if (failed(emitType(op.getResult().getType())))
        return failure();
    os << " " << addValueName(op.getResult()) << ";\n";
    os << wmmaNamespace() << "::fill_fragment(" << getValueName(op.getResult())
       << ", " << getValueName(op.getOperand()) << ")";
    return success();
}

LogicalResult printOp(WmmaPoisonOp &op) override {
    if (failed(emitType(op.getResult().getType())))
        return failure();
    os << " " << addValueName(op.getResult());
    return success();
}

LogicalResult printOp(WmmaLoadMatrixOp &op) override {
    if (failed(emitType(op.getResult().getType())))
        return failure();
    os << " " << addValueName(op.getResult()) << ";\n";
    os << wmmaNamespace() << "::load_matrix_sync(" << getValueName(op.getResult())
       << ", " << getValueName(op.getResource()) << " + "
       << getValueName(op.getBaseIndex()) << ", " << getValueName(op.getStride())
       << ")";
    return success();
}

LogicalResult printOp(WmmaMmaOp &op) override {
    if (failed(emitType(op.getResult().getType())))
        return failure();
    os << " " << addValueName(op.getResult()) << ";\n";
    os << wmmaNamespace() << "::mma_sync(" << getValueName(op.getResult())
       << ", " << getValueName(op.getA()) << ", " << getValueName(op.getB())
       << ", " << getValueName(op.getAcc()) << ")";
    return success();
}

LogicalResult printOp(WmmaStoreMatrixOp &op) override {
    os << wmmaNamespace() << "::store_matrix_sync(" << getValueName(op.getResource())
       << " + " << getValueName(op.getBaseIndex()) << ", "
       << getValueName(op.getFragment()) << ", " << getValueName(op.getStride())
       << ", " << wmmaNamespace() << "::" << wmmaMemLayoutName(op.getLayout())
       << ")";
    return success();
}

};

namespace simt::test_raiser {

LogicalResult emitRaisedCUDA(
    Operation *op, 
    raw_ostream &o, 
    HarnessProps props){

    CudaHipRaiser<RaiserType::CUDA> cuda(o);
    cuda.subgroupWidth = props.subgroupWidth;

    return cuda.emitHarness(op, props);
}

LogicalResult emitRaisedHIP(
    Operation *op, 
    raw_ostream &o, 
    HarnessProps props){

    CudaHipRaiser<RaiserType::HIP> hip(o);
    hip.subgroupWidth = props.subgroupWidth;

    return hip.emitHarness(op, props);
}

}
