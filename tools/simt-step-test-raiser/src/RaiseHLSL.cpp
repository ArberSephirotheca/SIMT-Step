#include "RaiseHLSL.h"
#include "BaseRaiser.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/IR/BuiltinTypes.h"
#include "mlir/Support/WalkResult.h"
#include "simt-step/Dialect/SimtStep/SimtStepDialect.h"
#include "llvm/ADT/BitVector.h"
#include "llvm/ADT/DenseMap.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/Support/Casting.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/LogicalResult.h"
#include "llvm/Support/raw_ostream.h"
#include <cstddef>
#include <cstdio>
#include <fstream>
#include <random>
#include <string>
#include <system_error>
#include <vector>

#define HLSL_INIT_ARGS \
        "uint3 thread_id : SV_DispatchThreadID, "\
        "uint3 group_id : SV_GroupID, uint group_index : SV_GroupIndex, "\
        "uint3 group_thread_id : SV_GroupThreadID"

using namespace simt::test_raiser;
using namespace llvm;
using namespace mlir;

template<bool useAmber>
class HlslRaiser : public BaseRaiser {

public:

using BaseRaiser::BaseRaiser;

std::map<std::string, std::vector<int>> funcBufferMaps;

int subgroupSize;

template <typename T>
void emitCommaSep(std::vector<T> buf){
    for (size_t i = 0; i < buf.size(); i++){
        os << buf[i];
        if (i < buf.size() - 1) os << ", ";
    }
}

LogicalResult emitHarness(Operation* op, HarnessProps props) override {
    std::vector<int64_t> bufferIndicies;
    if (failed(getMainInfo(op, ntx, nty, ntz, bufferIndicies))) return failure();
    subgroupSize = props.subgroupWidth;
    if (useAmber){
        if (!props.noWrapper){
            os << "import subprocess\nimport os\n";
            os << "PROGRAM = \"\"\"\\\n";
        }
        if (failed(emitAmberHarness(*this, op, "HLSL", props))) return failure();
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
            os << "subprocess.run([\"amber\", \"" << fname << ".amber\"])\n";
            os.unindent();
            os << "finally:\n";
            os.indent();
            os << "os.remove(\"" << fname << ".amber\")";
            os.unindent();
            os.unindent();
        }
    } else {

        std::random_device dev;
        std::mt19937 rng(dev());
        std::uniform_int_distribution<std::mt19937::result_type> dist6(10000000,99999999);
        std::string fname = "testout" + std::to_string(dist6(rng));

        for (auto buffer : props.expected){
            buffer_sizes.push_back(buffer.size());
        }

        if (props.noWrapper){
            fprintf(stderr, "HLSL DirectX target requires Python wrapper.");
            return failure();
        }

        os << "import subprocess as sp\nimport os\n";
        os << "PROGRAM = r\"\"\"";
        if (failed(emitShaderPrologue(op))) return failure();
        if (failed(emitOp(op))) return failure();
        os << "\"\"\"\nDRIVER = r\"\"\"";

        os << "#include <vector>\n#define FNAME L\"" << fname << ".hlsl\"\n";

        os << "std::vector<std::vector<int>> inbuf = {\n";
        os.indent();
        for (auto buf : props.input){
            os << "{";
            if (buf.empty()){
                os << "0";    
            } else {
                emitCommaSep(buf);
            }
            os << "},\n";
        }
        os.unindent();
        os << "};\n";

        os << "std::vector<std::vector<int>> expected = {\n";
        os.indent();
        for (auto buf : props.expected){
            os << "{";
            if (buf.empty()){
                os << "0";    
            } else {
                emitCommaSep(buf);
            }
            os << "},\n";
        }
        os.unindent();
        os << "};\n";

        std::string s;
        std::ifstream driverFile(SIMT_RAISER_RESOURCE_PATH "/HLSLDriver.cpp");
        while (std::getline(driverFile, s, '\n')){
            os << s << "\n";
        }

        os << "\"\"\"\n\n";
        os << "if __name__ == \"__main__\":\n";
        os.indent();
        os << "with open('" << fname << ".cpp', 'w') as f: f.write(DRIVER)\n";
        os << "with open('" << fname << ".hlsl', 'w') as f: f.write(PROGRAM)\n";
        os << "try:\n";
        os.indent();
        os << "sp.run(['cl', '/EHsc', '" << fname << ".cpp'], check=True, env=os.environ.copy())\n";
        os << "sp.run(['" << fname << ".exe'], check=True, env=os.environ.copy())\n";
        os.unindent() << "finally:\n";
        os.indent();
        os << "os.remove('" << fname << ".cpp')\n"
              "if os.path.exists('" << fname << ".exe'): os.remove('" << fname << ".exe')\n"
              "if os.path.exists('" << fname << ".obj'): os.remove('" << fname << ".obj')\n"
              "if os.path.exists('" << fname << ".hlsl'): os.remove('" << fname << ".hlsl')\n";
        os.unindent();
        os.unindent();

    }
    return success();
}

private:
LogicalResult emitMainFuncTop(func::FuncOp& f) override {
    os << "[numthreads(" << ntx << "," << nty << "," << ntz << ")]\n";
    os << "void main(" HLSL_INIT_ARGS ")";
    return success();
}

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
        if(failed(emitType(vectype.getElementType()))) return failure();
        os << len;
    } else if (auto indextype = dyn_cast<mlir::IndexType>(type)){
        os << "uint";
    } else if (auto rsrctype = dyn_cast<simt::dialect::ResourceType>(type)){
        os << (useAmber ? "RWBuffer<" : "RWStructuredBuffer<");
        if(failed(emitType(rsrctype.getElementType()))) return failure();
        os << ">";
    } else {
        llvm_unreachable("Unsupported type");
    }

    return success();
}

LogicalResult emitShaderPrologue(Operation* op) override {
    // Declare all buffers at top of program
    int locs = 0;
    auto m = dyn_cast<ModuleOp>(op);
    assert(m);
    auto f = m.lookupSymbol<func::FuncOp>("main");
    for (Value v : f.getArguments()){
        if (auto t = dyn_cast<simt::dialect::ResourceType>(v.getType())){
            assert(t.getMemorySpace() == simt::dialect::MemorySpace::Global);

            os << (useAmber ? "RWBuffer<" : "RWStructuredBuffer<");
            if (failed(emitType(t.getElementType()))) return failure();
            os << "> " << addValueName(v) << " : register(u" << locs << ");\n";


            locs++;
        }
    }

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
    return emitFuncCall(op.getResult(), "fmod", {op->getOperand(0), op->getOperand(1)});
}

/////////////// 'func' dialect ///////////////
LogicalResult printOp(func::FuncOp& op) override{
    if (op.getSymName() == "main"){
        if (failed(emitMainFuncTop(op))) return failure();
    } else {
        assert(op.getFunctionType().getNumResults() <= 1);
        if (op.getFunctionType().getNumResults() == 0){
            os << "void";
        } else {
            if (failed(emitType(op.getFunctionType().getResult(0)))) return failure();
        }
        os << " " << op.getSymName() << "(" HLSL_INIT_ARGS;
        if (op.getNumArguments()) os << ", ";
        for (auto arg : op.getArguments()){
            if (failed(emitType(arg.getType()))) return failure();
            os << " " << addValueName(arg);
            if (arg.getArgNumber() < op.getNumArguments() - 1){
                os << ", ";
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

LogicalResult printOp(func::CallOp& op) override {
    if (op->getNumResults() > 0){
        assert(op->getNumResults() == 1);
        if(failed(emitValueDefine(op->getResult(0)))) return failure();
    }

    os << op.getCallee().str() << "(thread_id, group_id, group_index, group_thread_id";
    for (auto [i, arg] : llvm::enumerate(op.getArgOperands())){
        os << ", ";
        os << getValueName(arg);
    }
    os << ")";

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
    return emitConstVec(op.getResult(), "thread_id");
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
    os << "(WaveActiveCountBits(";
    os << getValueName(op.getOperand());
    os << "))";
    return success();
}

LogicalResult printOp(LaneIdOp& op) override {
    return emitConstVec(op.getResult(), "group_index % " + std::to_string(subgroupSize));
}

LogicalResult printOp(SubgroupIdOp& op) override {
    return emitConstVec(op.getResult(), "group_index / " + std::to_string(subgroupSize));
}

LogicalResult printOp(WaveAllOp& op) override {
    return emitFuncCall(op.getResult(), "WaveActiveAllTrue", {op.getOperand()});
}

LogicalResult printOp(WaveAnyOp& op) override {
    return emitFuncCall(op.getResult(), "WaveActiveAnyTrue", {op.getOperand()});
}

LogicalResult printOp(GroupIdOp& op) override {
    return emitConstVec(op.getResult(), "group_id");
}

LogicalResult printOp(GroupThreadIdOp& op) override {
    return emitConstVec(op.getResult(), "group_thread_id");
}

LogicalResult printOp(GroupIndexOp& op) override {
    return emitConstVec(op.getResult(), "group_index");
}

};

namespace simt::test_raiser {

LogicalResult emitRaisedHLSLAmber(Operation *op, raw_ostream &o, HarnessProps props){
    HlslRaiser<true> hlsl(o);
    return hlsl.emitHarness(op, props);
}

LogicalResult emitRaisedHLSL(Operation *op, raw_ostream &o, HarnessProps props){
    HlslRaiser<false> hlsl(o);
    return hlsl.emitHarness(op, props);
}

}