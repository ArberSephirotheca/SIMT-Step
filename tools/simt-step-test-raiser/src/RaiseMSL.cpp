#include "RaiseMSL.h"

#include "BaseRaiser.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/IR/BuiltinTypes.h"
#include "simt-step/Dialect/SimtStep/SimtStepDialect.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/Support/Casting.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/LogicalResult.h"
#include "llvm/Support/raw_ostream.h"

#include <algorithm>
#include <cstdint>
#include <random>
#include <string>
#include <unordered_map>
#include <vector>

using namespace simt::test_raiser;
using namespace llvm;
using namespace mlir;

namespace {

static std::vector<simt::dialect::ResourceType>
getMainResourceTypes(Operation *op) {
  std::vector<simt::dialect::ResourceType> result;
  auto mod = dyn_cast<ModuleOp>(op);
  if (!mod)
    return result;
  auto func = mod.lookupSymbol<func::FuncOp>("main");
  if (!func)
    return result;
  for (auto arg : func.getArguments()) {
    if (auto resourceType =
            dyn_cast<simt::dialect::ResourceType>(arg.getType()))
      result.push_back(resourceType);
  }
  return result;
}

static bool hasWmmaOps(Operation *op) {
  bool found = false;
  op->walk([&](Operation *nested) {
    if (isa<WmmaFillOp, WmmaPoisonOp, WmmaLoadMatrixOp, WmmaMmaOp,
            WmmaStoreMatrixOp>(nested))
      found = true;
  });
  return found;
}

} // namespace

class MslRaiser : public BaseRaiser {
public:
  using BaseRaiser::BaseRaiser;

  unsigned subgroupWidth = 32;
  bool inMainFunction = false;
  bool hasWmma = false;

  LogicalResult emitHarness(Operation *op, HarnessProps props) override {
    std::vector<int64_t> bufferIndices;
    if (failed(getMainInfo(op, ntx, nty, ntz, bufferIndices)))
      return failure();

    subgroupWidth = std::max(1, props.subgroupWidth);
    hasWmma = hasWmmaOps(op);
    if (props.noWrapper)
      return emitObjectiveCHarness(op, props, bufferIndices);
    return emitPythonWrapper(op, props, bufferIndices);
  }

private:
  static constexpr unsigned kWmmaTileExtent = 8;

  LogicalResult emitShaderOnly(Operation *op) {
    if (failed(emitShaderPrologue(op)))
      return failure();
    return emitOp(op);
  }

  const char *wmmaRoleTag(simt::dialect::WmmaRole role) const {
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

  unsigned wmmaRows(simt::dialect::WmmaFragmentType fragmentType) const {
    switch (fragmentType.getRole()) {
    case simt::dialect::WmmaRole::MatrixA:
      return fragmentType.getM();
    case simt::dialect::WmmaRole::MatrixB:
      return fragmentType.getK();
    case simt::dialect::WmmaRole::Accumulator:
      return fragmentType.getM();
    }
    llvm_unreachable("unsupported WMMA role");
  }

  unsigned wmmaCols(simt::dialect::WmmaFragmentType fragmentType) const {
    switch (fragmentType.getRole()) {
    case simt::dialect::WmmaRole::MatrixA:
      return fragmentType.getK();
    case simt::dialect::WmmaRole::MatrixB:
      return fragmentType.getN();
    case simt::dialect::WmmaRole::Accumulator:
      return fragmentType.getN();
    }
    llvm_unreachable("unsupported WMMA role");
  }

  unsigned wmmaRowTiles(simt::dialect::WmmaFragmentType fragmentType) const {
    return wmmaRows(fragmentType) / kWmmaTileExtent;
  }

  unsigned wmmaColTiles(simt::dialect::WmmaFragmentType fragmentType) const {
    return wmmaCols(fragmentType) / kWmmaTileExtent;
  }

  std::string wmmaStructName(simt::dialect::WmmaFragmentType fragmentType) const {
    return std::string("simt_wmma_") + wmmaRoleTag(fragmentType.getRole()) + "_" +
           std::to_string(fragmentType.getM()) + "x" +
           std::to_string(fragmentType.getN()) + "x" +
           std::to_string(fragmentType.getK());
  }

  const char *wmmaTileTypeName(mlir::Type elementType) const {
    if (elementType.isF16())
      return "simdgroup_half8x8";
    if (elementType.isF32())
      return "simdgroup_float8x8";
    llvm_unreachable("unsupported WMMA element type");
  }

  const char *wmmaScalarTypeName(mlir::Type elementType) const {
    if (elementType.isF16())
      return "half";
    if (elementType.isF32())
      return "float";
    llvm_unreachable("unsupported WMMA scalar type");
  }

  bool isSupportedWmmaFragmentType(
      simt::dialect::WmmaFragmentType fragmentType) const {
    if (fragmentType.getM() == 0 || fragmentType.getN() == 0 ||
        fragmentType.getK() == 0)
      return false;
    if ((fragmentType.getM() % kWmmaTileExtent) != 0 ||
        (fragmentType.getN() % kWmmaTileExtent) != 0 ||
        (fragmentType.getK() % kWmmaTileExtent) != 0) {
      return false;
    }

    switch (fragmentType.getRole()) {
    case simt::dialect::WmmaRole::MatrixA:
      return fragmentType.getElementType().isF16() &&
             fragmentType.getLayout() == simt::dialect::WmmaLayout::ColMajor;
    case simt::dialect::WmmaRole::MatrixB:
      return fragmentType.getElementType().isF16() &&
             fragmentType.getLayout() == simt::dialect::WmmaLayout::RowMajor;
    case simt::dialect::WmmaRole::Accumulator:
      return fragmentType.getElementType().isF32() &&
             fragmentType.getLayout() == simt::dialect::WmmaLayout::None;
    }
    return false;
  }

  bool isSupportedWmmaResource(Value resource) const {
    auto resourceType =
        dyn_cast<simt::dialect::ResourceType>(resource.getType());
    return resourceType &&
           resourceType.getMemorySpace() == simt::dialect::MemorySpace::Global;
  }

  std::string wmmaTileRef(Value value, unsigned row, unsigned col) {
    return wmmaTileRef(getValueName(value), row, col);
  }

  std::string wmmaTileRef(const std::string &valueName, unsigned row,
                          unsigned col) const {
    return valueName + ".tiles[" + std::to_string(row) + "][" +
           std::to_string(col) + "]";
  }

  std::string wmmaTilePtrExpr(Value resource, Value baseIndex, Value stride,
                              unsigned rowTile, unsigned colTile) {
    std::string expr = getValueName(resource) + " + " + getValueName(baseIndex);
    const std::string strideName = getValueName(stride);
    const unsigned rowOffset = rowTile * kWmmaTileExtent;
    const unsigned colOffset = colTile * kWmmaTileExtent;
    if (rowOffset != 0 || colOffset != 0) {
      expr += " + ";
      if (rowOffset != 0 && colOffset != 0) {
        expr += "((" + std::to_string(rowOffset) + ") * " + strideName + " + " +
                std::to_string(colOffset) + ")";
      } else if (rowOffset != 0) {
        expr += "((" + std::to_string(rowOffset) + ") * " + strideName + ")";
      } else {
        expr += std::to_string(colOffset);
      }
    }
    return expr;
  }

  const char *wmmaTransposeFlag(simt::dialect::WmmaLayout layout) const {
    switch (layout) {
    case simt::dialect::WmmaLayout::RowMajor:
      return "false";
    case simt::dialect::WmmaLayout::ColMajor:
      return "true";
    case simt::dialect::WmmaLayout::None:
      break;
    }
    llvm_unreachable("unsupported WMMA layout for MSL transpose flag");
  }

  LogicalResult emitHostScalarType(Type type) {
    if (type.isInteger()) {
      switch (type.getIntOrFloatBitWidth()) {
      case 1:
        os << "bool";
        return success();
      case 32:
        os << (type.isUnsignedInteger() ? "uint32_t" : "int32_t");
        return success();
      case 64:
        os << (type.isUnsignedInteger() ? "uint64_t" : "int64_t");
        return success();
      default:
        llvm_unreachable("unsupported host integer type");
      }
    }
    if (type.isFloat()) {
      switch (type.getIntOrFloatBitWidth()) {
      case 16:
        os << "__fp16";
        return success();
      case 32:
        os << "float";
        return success();
      case 64:
        os << "double";
        return success();
      default:
        llvm_unreachable("unsupported host float type");
      }
    }
    return failure();
  }

  LogicalResult emitHostScalarLiteral(Type type, int64_t value) {
    if (type.isInteger()) {
      os << "static_cast<";
      if (failed(emitHostScalarType(type)))
        return failure();
      os << ">(" << value << ")";
      return success();
    }
    if (type.isF16()) {
      os << "static_cast<__fp16>(static_cast<float>(" << value << "))";
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

  LogicalResult emitHostArray(StringRef name, Type elementType,
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

    os << "static ";
    if (failed(emitHostScalarType(elementType)))
      return failure();
    os << " " << name << "[" << count << "];\n";
    os << "for (size_t " << name << "_idx = 0; " << name << "_idx < " << count
       << "; ++" << name << "_idx) " << name << "[" << name << "_idx] = ";
    if (failed(emitHostScalarLiteral(elementType, fillValue)))
      return failure();
    os << ";\n";

    for (size_t i = 0; i < count; ++i) {
      const int64_t value = values.empty() ? 0 : values[i];
      if (value == fillValue)
        continue;
      os << name << "[" << i << "] = ";
      if (failed(emitHostScalarLiteral(elementType, value)))
        return failure();
      os << ";\n";
    }
    return success();
  }

  void emitHostHelpers() {
    os << R"CPP(
template <typename T>
static inline double simtToDouble(T value) {
    return static_cast<double>(value);
}

static inline double simtToDouble(__fp16 value) {
    return static_cast<double>(static_cast<float>(value));
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

static inline bool simtBufferEqual(__fp16 actual, __fp16 expected) {
    return std::fabs(static_cast<float>(actual) - static_cast<float>(expected)) <= 1.0e-3f;
}

)CPP";
  }

  void emitWmmaStructDef(StringRef name, StringRef tileType,
                         unsigned rowTiles, unsigned colTiles) {
    os << "struct " << name << " {\n";
    os << "  " << tileType << " tiles[" << rowTiles << "][" << colTiles
       << "];\n";
    os << "};\n";
  }

  void emitWmmaSupportTypes(Operation *op) {
    std::vector<std::string> emittedNames;
    auto tryEmit = [&](Type type) {
      auto fragmentType = dyn_cast<simt::dialect::WmmaFragmentType>(type);
      if (!fragmentType || !isSupportedWmmaFragmentType(fragmentType))
        return;
      std::string name = wmmaStructName(fragmentType);
      if (std::find(emittedNames.begin(), emittedNames.end(), name) !=
          emittedNames.end()) {
        return;
      }
      emitWmmaStructDef(name, wmmaTileTypeName(fragmentType.getElementType()),
                        wmmaRowTiles(fragmentType), wmmaColTiles(fragmentType));
      emittedNames.push_back(std::move(name));
    };

    if (auto module = dyn_cast<ModuleOp>(op)) {
      for (func::FuncOp func : module.getOps<func::FuncOp>()) {
        for (Value arg : func.getArguments())
          tryEmit(arg.getType());
      }
    }

    op->walk([&](Operation *nested) {
      for (Value operand : nested->getOperands())
        tryEmit(operand.getType());
      for (Value result : nested->getResults())
        tryEmit(result.getType());
    });

    if (!emittedNames.empty())
      os << "\n";
  }

  LogicalResult emitPythonWrapper(Operation *op, HarnessProps props,
                                  ArrayRef<int64_t> bufferIndices) {
    std::string harnessText;
    raw_string_ostream harnessOS(harnessText);
    MslRaiser harness(harnessOS);
    harness.subgroupWidth = subgroupWidth;
    harness.hasWmma = hasWmma;
    if (failed(harness.emitObjectiveCHarness(op, props, bufferIndices)))
      return failure();
    harnessOS.flush();

    std::random_device dev;
    std::mt19937 rng(dev());
    std::uniform_int_distribution<std::mt19937::result_type> dist(10000000,
                                                                  99999999);
    const std::string fname = "testout" + std::to_string(dist(rng));

    os << "import os\n";
    os << "import subprocess\n\n";
    os << "PROGRAM = r\"\"\"\\\n";
    os << harnessText;
    if (!harnessText.empty() &&
        static_cast<unsigned char>(harnessText.back()) != 10)
      os << static_cast<char>(10);
    os << "\"\"\"\n";
    os << "if __name__ == \"__main__\":\n";
    os.indent();
    os << "with open(\"" << fname << ".mm\", \"w\") as f: f.write(PROGRAM)\n";
    os << "try:\n";
    os.indent();
    os << "cmd = [\"xcrun\", \"clang++\", \"-std=c++17\", "
          "\"-x\", \"objective-c++\", \""
       << fname
       << ".mm\", \"-framework\", \"Metal\", \"-framework\", \"Foundation\", "
          "\"-o\", \""
       << fname << ".out\"]\n";
    os << "subprocess.run(cmd, check=True, env=os.environ)\n";
    os << "subprocess.run([\"./" << fname
       << ".out\"], check=True, env=os.environ)\n";
    os.unindent();
    os << "finally:\n";
    os.indent();
    os << "if os.path.exists(\"" << fname << ".mm\"): os.remove(\"" << fname
       << ".mm\")\n";
    os << "if os.path.exists(\"" << fname << ".out\"): os.remove(\"" << fname
       << ".out\")\n";
    os.unindent();
    os.unindent();
    return success();
  }

  LogicalResult emitObjectiveCHarness(Operation *op, HarnessProps props,
                                      ArrayRef<int64_t> bufferIndices) {
    std::string shaderText;
    raw_string_ostream shaderOS(shaderText);
    MslRaiser shader(shaderOS);
    shader.subgroupWidth = subgroupWidth;
    shader.hasWmma = hasWmma;
    if (failed(shader.emitShaderOnly(op)))
      return failure();
    shaderOS.flush();

    os << "#import <Foundation/Foundation.h>\n";
    os << "#import <Metal/Metal.h>\n";
    os << "#include <cmath>\n";
    os << "#include <cstddef>\n";
    os << "#include <cstdint>\n";
    os << "#include <cstdio>\n\n";
    emitHostHelpers();

    os << "static const char *kShaderSource = R\"MSL(\n";
    os << shaderText;
    if (!shaderText.empty() && static_cast<unsigned char>(shaderText.back()) != 10)
      os << static_cast<char>(10);
    os << ")MSL\";\n\n";

    auto resourceTypes = getMainResourceTypes(op);

    os << "int main() {\n";
    os.indent();
    os << "@autoreleasepool {\n";
    os.indent();
    os << "id<MTLDevice> device = MTLCreateSystemDefaultDevice();\n";
    os << "if (!device) {\n";
    os.indent() << "fprintf(stderr, \"No Metal device available\\n\");\n";
    os << "return 1;\n";
    os.unindent() << "}\n";
    os << "NSError *error = nil;\n";
    os << "NSString *source = [NSString stringWithUTF8String:kShaderSource];\n";
    os << "id<MTLLibrary> library = [device newLibraryWithSource:source "
          "options:nil error:&error];\n";
    os << "if (!library) {\n";
    os.indent() << "const char *msg = error ? [[error localizedDescription] "
                   "UTF8String] : \"unknown\";\n";
    os << "fprintf(stderr, \"newLibraryWithSource failed: %s\\n\", msg);\n";
    os << "return 1;\n";
    os.unindent() << "}\n";
    os << "id<MTLFunction> kernel = [library "
          "newFunctionWithName:@\"kernel_main\"];\n";
    os << "if (!kernel) {\n";
    os.indent() << "fprintf(stderr, \"Unable to find kernel_main in generated "
                   "MSL\\n\");\n";
    os << "return 1;\n";
    os.unindent() << "}\n";
    os << "id<MTLComputePipelineState> pipeline = [device "
          "newComputePipelineStateWithFunction:kernel error:&error];\n";
    os << "if (!pipeline) {\n";
    os.indent() << "const char *msg = error ? [[error localizedDescription] "
                   "UTF8String] : \"unknown\";\n";
    os << "fprintf(stderr, \"newComputePipelineStateWithFunction failed: "
          "%s\\n\", msg);\n";
    os << "return 1;\n";
    os.unindent() << "}\n";
    os << "id<MTLCommandQueue> queue = [device newCommandQueue];\n";
    os << "if (!queue) {\n";
    os.indent() << "fprintf(stderr, \"Unable to create command queue\\n\");\n";
    os << "return 1;\n";
    os.unindent() << "}\n";

    for (auto [i, expected] : llvm::enumerate(props.expected)) {
      Type elementType = IntegerType::get(op->getContext(), 32);
      if (static_cast<size_t>(i) < resourceTypes.size())
        elementType = resourceTypes[i].getElementType();
      if (failed(emitHostArray("expected" + std::to_string(i), elementType,
                               expected)))
        return failure();
    }
    for (auto [i, input] : llvm::enumerate(props.input)) {
      Type elementType = IntegerType::get(op->getContext(), 32);
      if (static_cast<size_t>(i) < resourceTypes.size())
        elementType = resourceTypes[i].getElementType();
      if (failed(emitHostArray("host_actual" + std::to_string(i), elementType,
                               input)))
        return failure();
      os << "id<MTLBuffer> actual_buf" << i
         << " = [device newBufferWithBytes:host_actual" << i
         << " length:sizeof(host_actual" << i
         << ") options:MTLResourceStorageModeShared];\n";
      os << "if (!actual_buf" << i << ") {\n";
      os.indent() << "fprintf(stderr, \"Unable to create input buffer " << i
                  << "\\n\");\n";
      os << "return 1;\n";
      os.unindent() << "}\n";
    }

    os << "id<MTLCommandBuffer> commandBuffer = [queue commandBuffer];\n";
    os << "id<MTLComputeCommandEncoder> encoder = [commandBuffer "
          "computeCommandEncoder];\n";
    os << "[encoder setComputePipelineState:pipeline];\n";
    for (auto i : llvm::seq<size_t>(0, props.input.size())) {
      int64_t bindingIndex = i;
      if (i < bufferIndices.size())
        bindingIndex = bufferIndices[i];
      os << "[encoder setBuffer:actual_buf" << i
         << " offset:0 atIndex:" << bindingIndex << "];\n";
    }
    os << "MTLSize threadgroups = MTLSizeMake(1, 1, 1);\n";
    os << "MTLSize threadsPerThreadgroup = MTLSizeMake(" << ntx << ", " << nty
       << ", " << ntz << ");\n";
    os << "[encoder dispatchThreadgroups:threadgroups "
          "threadsPerThreadgroup:threadsPerThreadgroup];\n";
    os << "[encoder endEncoding];\n";
    os << "[commandBuffer commit];\n";
    os << "[commandBuffer waitUntilCompleted];\n";
    os << "if ([commandBuffer status] != MTLCommandBufferStatusCompleted) {\n";
    os.indent()
        << "fprintf(stderr, \"Metal command buffer did not complete\\n\");\n";
    os << "return 1;\n";
    os.unindent() << "}\n";

    for (auto [i, expected] : llvm::enumerate(props.expected)) {
      Type elementType = IntegerType::get(op->getContext(), 32);
      if (static_cast<size_t>(i) < resourceTypes.size())
        elementType = resourceTypes[i].getElementType();

      if (failed(emitHostScalarType(elementType)))
        return failure();
      os << " *actual" << i << " = static_cast<";
      if (failed(emitHostScalarType(elementType)))
        return failure();
      os << " *>([actual_buf" << i << " contents]);\n";
      os << "for (size_t idx = 0; idx < " << expected.size() << "; ++idx) {\n";
      os.indent() << "if (!simtBufferEqual(actual" << i << "[idx], expected"
                  << i << "[idx])) {\n";
      os.indent() << "fprintf(stderr, \"buffer " << i
                  << " [%zu]: expected=%g actual=%g\\n\", idx, "
                  << "simtToDouble(expected" << i << "[idx]), "
                  << "simtToDouble(actual" << i << "[idx]));\n";
      os << "return 1;\n";
      os.unindent() << "}\n";
      os.unindent() << "}\n";
    }

    os << "return 0;\n";
    os.unindent() << "}\n";
    os.unindent() << "}\n";
    return success();
  }

  LogicalResult emitMainFuncTop(func::FuncOp &f) override {
    os << "kernel void kernel_main(";
    bool first = true;
    for (auto [i, v] : llvm::enumerate(f.getArguments())) {
      if (!first)
        os << ", ";
      first = false;
      if (auto t = dyn_cast<simt::dialect::ResourceType>(v.getType())) {
        assert(t.getMemorySpace() == simt::dialect::MemorySpace::Global);
        os << "device ";
        if (failed(emitType(t.getElementType())))
          return failure();
        os << "* " << addValueName(v) << " [[buffer(" << i << ")]]";
      } else {
        if (failed(emitType(v.getType())))
          return failure();
        os << " " << addValueName(v);
      }
    }
    if (!first)
      os << ", ";
    os << "uint3 __simt_tid3 [[thread_position_in_grid]], "
          "uint3 __simt_group_id [[threadgroup_position_in_grid]], "
          "uint3 __simt_local_tid [[thread_position_in_threadgroup]])";
    return success();
  }

  LogicalResult emitType(Type type) override {
    if (auto rtype = dyn_cast<simt::dialect::ResourceType>(type)) {
      os << "device ";
      if (failed(emitType(rtype.getElementType())))
        return failure();
      os << "*";
      return success();
    }

    if (auto fragmentType = dyn_cast<simt::dialect::WmmaFragmentType>(type)) {
      if (!isSupportedWmmaFragmentType(fragmentType))
        return failure();
      os << wmmaStructName(fragmentType);
      return success();
    }

    if (type.isInteger()) {
      switch (type.getIntOrFloatBitWidth()) {
      case 1:
        os << "bool";
        return success();
      case 32:
        os << (type.isUnsignedInteger() ? "uint" : "int");
        return success();
      case 64:
        os << (type.isUnsignedInteger() ? "ulong" : "long");
        return success();
      default:
        llvm_unreachable("Unsupported int type");
      }
    }

    if (type.isFloat()) {
      switch (type.getIntOrFloatBitWidth()) {
      case 16:
        os << "half";
        return success();
      case 32:
        os << "float";
        return success();
      case 64:
        os << "double";
        return success();
      default:
        llvm_unreachable("Unsupported float type");
      }
    }

    if (auto vectype = dyn_cast<mlir::VectorType>(type)) {
      if (vectype.getShape().size() != 1)
        llvm_unreachable("Unsupported vector shape");
      long len = vectype.getShape().front();
      if (len < 2 || len > 4)
        llvm_unreachable("Unsupported vector width");
      Type elem = vectype.getElementType();
      if (elem.isInteger(32)) {
        os << (elem.isUnsignedInteger() ? "uint" : "int") << len;
        return success();
      }
      if (elem.isF16()) {
        os << "half" << len;
        return success();
      }
      if (elem.isF32()) {
        os << "float" << len;
        return success();
      }
      llvm_unreachable("Unsupported vector element type");
    }

    if (isa<mlir::IndexType>(type)) {
      os << "uint";
      return success();
    }

    llvm_unreachable("Unsupported type");
  }

  LogicalResult emitShaderPrologue(Operation *op) override {
    (void)op;
    os << "#include <metal_stdlib>\n";
    os << "using namespace metal;\n";
    os << "#define SIMT_SUBGROUP_WIDTH " << subgroupWidth << "\n";
    os << "static inline int simt_lane_id(int tid) {\n";
    os << "  return tid % SIMT_SUBGROUP_WIDTH;\n";
    os << "}\n";
    os << "static inline int simt_subgroup_id(int tid) {\n";
    os << "  return tid / SIMT_SUBGROUP_WIDTH;\n";
    os << "}\n";
    os << "static inline int simt_wave_count_bits(bool pred) {\n";
    os << "  return static_cast<int>(simd_sum(pred ? 1u : 0u));\n";
    os << "}\n";
    if (hasWmma)
      emitWmmaSupportTypes(op);
    os << "\n";
    return success();
  }

  LogicalResult emitConst(Type t, APFloat v) override {
    switch (t.getIntOrFloatBitWidth()) {
    case 16:
      os << "half(" << static_cast<float>(v.convertToDouble()) << ")";
      return success();
    case 32:
      os << "float(" << static_cast<float>(v.convertToDouble()) << ")";
      return success();
    case 64:
      os << "double(" << v.convertToDouble() << ")";
      return success();
    default:
      llvm_unreachable("Unable to emit floating-point constant");
    }
  }

  LogicalResult emitCast(Value in, Value out) override {
    if (failed(emitValueDefine(out)))
      return failure();
    os << "(";
    if (failed(emitType(out.getType())))
      return failure();
    os << ")(" << getValueName(in) << ")";
    return success();
  }

  LogicalResult printOp(arith::RemFOp &op) override {
    return emitFuncCall(op.getResult(), "fmod",
                        {op->getOperand(0), op->getOperand(1)});
  }

  LogicalResult printOp(func::FuncOp &op) override {
    bool prevInMain = inMainFunction;
    inMainFunction = (op.getSymName() == "main");

    if (inMainFunction) {
      LogicalResult mainRes = BaseRaiser::printOp(op);
      inMainFunction = prevInMain;
      return mainRes;
    }

    os << "inline ";
    assert(op.getFunctionType().getNumResults() <= 1);
    if (op.getFunctionType().getNumResults() == 0) {
      os << "void";
    } else {
      if (failed(emitType(op.getFunctionType().getResult(0)))) {
        inMainFunction = prevInMain;
        return failure();
      }
    }
    os << " " << op.getSymName() << "(";
    for (auto [i, arg] : llvm::enumerate(op.getArguments())) {
      if (failed(emitType(arg.getType()))) {
        inMainFunction = prevInMain;
        return failure();
      }
      os << " " << addValueName(arg);
      if (i + 1 < op.getNumArguments())
        os << ", ";
    }
    if (op.getNumArguments() > 0)
      os << ", ";
    os << "int __simt_tid";
    os << ")";
    os << "{\n";
    os.indent();
    if (failed(emitRegion(op.getRegion()))) {
      inMainFunction = prevInMain;
      return failure();
    }
    os.unindent();
    os << "}\n\n";

    inMainFunction = prevInMain;
    return success();
  }

  LogicalResult printOp(func::CallOp &op) override {
    assert(op->getNumResults() <= 1);

    if (op->getNumResults() == 1) {
      if (failed(emitValueDefine(op.getResult(0))))
        return failure();
    }
    os << op.getCallee() << "(";
    for (auto [i, arg] : llvm::enumerate(op.getArgOperands())) {
      os << getValueName(arg);
      if (i + 1 < op.getArgOperands().size())
        os << ", ";
    }
    if (op.getCallee() != "main") {
      if (!op.getArgOperands().empty())
        os << ", ";
      os << (inMainFunction ? "static_cast<int>(__simt_tid3.x)" : "__simt_tid");
    }
    os << ")";
    return success();
  }

  LogicalResult printOp(DispatchThreadIdOp &op) override {
    if (failed(emitValueDefine(op.getResult())))
      return failure();
    if (!inMainFunction) {
      if (isa<mlir::VectorType>(op.getResult().getType())) {
        os << "int3(__simt_tid, 0, 0)";
      } else {
        os << "__simt_tid";
      }
      return success();
    }
    if (isa<mlir::VectorType>(op.getResult().getType())) {
      os << "int3(static_cast<int>(__simt_tid3.x), "
            "static_cast<int>(__simt_tid3.y), "
            "static_cast<int>(__simt_tid3.z))";
    } else {
      os << "static_cast<int>(__simt_tid3.x)";
    }
    return success();
  }

  LogicalResult printOp(BufferAtomicAddOp &op) override {
    (void)op;
    return failure();
  }

  LogicalResult printOp(WaveCountBitsOp &op) override {
    if (failed(emitValueDefine(op.getResult())))
      return failure();
    os << "simt_wave_count_bits(" << getValueName(op.getOperand()) << ")";
    return success();
  }

  LogicalResult printOp(LaneIdOp &op) override {
    if (failed(emitValueDefine(op.getResult())))
      return failure();
    if (inMainFunction) {
      os << "simt_lane_id(static_cast<int>(__simt_tid3.x))";
    } else {
      os << "simt_lane_id(__simt_tid)";
    }
    return success();
  }

  LogicalResult printOp(SubgroupIdOp &op) override {
    if (failed(emitValueDefine(op.getResult())))
      return failure();
    if (inMainFunction) {
      os << "simt_subgroup_id(static_cast<int>(__simt_tid3.x))";
    } else {
      os << "simt_subgroup_id(__simt_tid)";
    }
    return success();
  }

  LogicalResult printOp(WaveAllOp &op) override {
    return emitFuncCall(op.getResult(), "simd_all", {op.getOperand()});
  }

  LogicalResult printOp(WaveAnyOp &op) override {
    return emitFuncCall(op.getResult(), "simd_any", {op.getOperand()});
  }

  LogicalResult printOp(GroupIdOp &op) override {
    if (failed(emitValueDefine(op.getResult())))
      return failure();
    if (isa<mlir::VectorType>(op.getResult().getType())) {
      os << "int3(static_cast<int>(__simt_group_id.x), "
            "static_cast<int>(__simt_group_id.y), "
            "static_cast<int>(__simt_group_id.z))";
    } else {
      os << "static_cast<int>(__simt_group_id.x)";
    }
    return success();
  }

  LogicalResult printOp(GroupThreadIdOp &op) override {
    if (failed(emitValueDefine(op.getResult())))
      return failure();
    if (isa<mlir::VectorType>(op.getResult().getType())) {
      os << "int3(static_cast<int>(__simt_local_tid.x), "
            "static_cast<int>(__simt_local_tid.y), "
            "static_cast<int>(__simt_local_tid.z))";
    } else {
      os << "static_cast<int>(__simt_local_tid.x)";
    }
    return success();
  }

  LogicalResult printOp(GroupIndexOp &op) override {
    if (failed(emitValueDefine(op.getResult())))
      return failure();
    if (isa<mlir::VectorType>(op.getResult().getType())) {
      os << "int3(static_cast<int>(__simt_group_id.x), "
            "static_cast<int>(__simt_group_id.y), "
            "static_cast<int>(__simt_group_id.z))";
    } else {
      os << "static_cast<int>(__simt_group_id.x)";
    }
    return success();
  }

  LogicalResult printOp(WmmaFillOp &op) override {
    auto fragmentType =
        cast<simt::dialect::WmmaFragmentType>(op.getResult().getType());
    if (!isSupportedWmmaFragmentType(fragmentType)) {
      return op.emitOpError(
          "MSL WMMA lowering currently supports only f16/f16/f32 fragments "
          "with extents that are multiples of 8");
    }

    const std::string resultName = addValueName(op.getResult());
    if (failed(emitType(fragmentType)))
      return failure();
    os << " " << resultName << ";\n";

    const unsigned rowTiles = wmmaRowTiles(fragmentType);
    const unsigned colTiles = wmmaColTiles(fragmentType);
    for (unsigned row = 0; row < rowTiles; ++row) {
      for (unsigned col = 0; col < colTiles; ++col) {
        os << wmmaTileRef(resultName, row, col)
           << " = make_filled_simdgroup_matrix<"
           << wmmaScalarTypeName(fragmentType.getElementType()) << ", 8, 8>("
           << getValueName(op.getOperand()) << ");\n";
      }
    }
    return success();
  }

  LogicalResult printOp(WmmaPoisonOp &op) override {
    auto fragmentType =
        cast<simt::dialect::WmmaFragmentType>(op.getResult().getType());
    if (!isSupportedWmmaFragmentType(fragmentType)) {
      return op.emitOpError(
          "MSL WMMA lowering currently supports only f16/f16/f32 fragments "
          "with extents that are multiples of 8");
    }

    const std::string resultName = addValueName(op.getResult());
    if (failed(emitType(fragmentType)))
      return failure();
    os << " " << resultName;
    return success();
  }

  LogicalResult printOp(WmmaLoadMatrixOp &op) override {
    auto fragmentType =
        cast<simt::dialect::WmmaFragmentType>(op.getResult().getType());
    if (!isSupportedWmmaFragmentType(fragmentType)) {
      return op.emitOpError(
          "MSL WMMA lowering currently supports only f16/f16/f32 fragments "
          "with extents that are multiples of 8");
    }
    if (!isSupportedWmmaResource(op.getResource())) {
      return op.emitOpError(
          "MSL WMMA lowering currently requires global memory resources");
    }

    const std::string resultName = addValueName(op.getResult());
    if (failed(emitType(fragmentType)))
      return failure();
    os << " " << resultName << ";\n";

    const unsigned rowTiles = wmmaRowTiles(fragmentType);
    const unsigned colTiles = wmmaColTiles(fragmentType);
    for (unsigned row = 0; row < rowTiles; ++row) {
      for (unsigned col = 0; col < colTiles; ++col) {
        os << "simdgroup_load(" << wmmaTileRef(resultName, row, col) << ", "
           << wmmaTilePtrExpr(op.getResource(), op.getBaseIndex(),
                              op.getStride(), row, col)
           << ", static_cast<ulong>(" << getValueName(op.getStride())
           << "), ulong2(0ul), " << wmmaTransposeFlag(fragmentType.getLayout())
           << ");\n";
      }
    }
    return success();
  }

  LogicalResult printOp(WmmaMmaOp &op) override {
    auto aType = cast<simt::dialect::WmmaFragmentType>(op.getA().getType());
    auto bType = cast<simt::dialect::WmmaFragmentType>(op.getB().getType());
    auto accType = cast<simt::dialect::WmmaFragmentType>(op.getAcc().getType());
    auto resultType =
        cast<simt::dialect::WmmaFragmentType>(op.getResult().getType());
    if (!isSupportedWmmaFragmentType(aType) ||
        !isSupportedWmmaFragmentType(bType) ||
        !isSupportedWmmaFragmentType(accType) ||
        !isSupportedWmmaFragmentType(resultType)) {
      return op.emitOpError(
          "MSL WMMA lowering currently supports only f16/f16/f32 fragments "
          "with extents that are multiples of 8");
    }

    const std::string resultName = addValueName(op.getResult());
    if (failed(emitType(resultType)))
      return failure();
    os << " " << resultName << ";\n";

    const unsigned rowTiles = wmmaRowTiles(resultType);
    const unsigned colTiles = wmmaColTiles(resultType);
    const unsigned kTiles = resultType.getK() / kWmmaTileExtent;
    for (unsigned row = 0; row < rowTiles; ++row) {
      for (unsigned col = 0; col < colTiles; ++col) {
        os << wmmaTileRef(resultName, row, col) << " = "
           << wmmaTileRef(op.getAcc(), row, col) << ";\n";
        for (unsigned kk = 0; kk < kTiles; ++kk) {
          os << "simdgroup_multiply_accumulate("
             << wmmaTileRef(resultName, row, col) << ", "
             << wmmaTileRef(op.getA(), row, kk) << ", "
             << wmmaTileRef(op.getB(), kk, col) << ", "
             << wmmaTileRef(resultName, row, col) << ");\n";
        }
      }
    }
    return success();
  }

  LogicalResult printOp(WmmaStoreMatrixOp &op) override {
    auto fragmentType =
        cast<simt::dialect::WmmaFragmentType>(op.getFragment().getType());
    if (!isSupportedWmmaFragmentType(fragmentType)) {
      return op.emitOpError(
          "MSL WMMA lowering currently supports only f16/f16/f32 fragments "
          "with extents that are multiples of 8");
    }
    if (!isSupportedWmmaResource(op.getResource())) {
      return op.emitOpError(
          "MSL WMMA lowering currently requires global memory resources");
    }

    const unsigned rowTiles = wmmaRowTiles(fragmentType);
    const unsigned colTiles = wmmaColTiles(fragmentType);
    for (unsigned row = 0; row < rowTiles; ++row) {
      for (unsigned col = 0; col < colTiles; ++col) {
        os << "simdgroup_store(" << wmmaTileRef(op.getFragment(), row, col)
           << ", "
           << wmmaTilePtrExpr(op.getResource(), op.getBaseIndex(),
                              op.getStride(), row, col)
           << ", static_cast<ulong>(" << getValueName(op.getStride())
           << "), ulong2(0ul), " << wmmaTransposeFlag(op.getLayout())
           << ");\n";
      }
    }
    return success();
  }
};

namespace simt::test_raiser {

LogicalResult emitRaisedMSL(Operation *op, raw_ostream &o, HarnessProps props) {
  MslRaiser msl(o);
  return msl.emitHarness(op, props);
}

} // namespace simt::test_raiser
