#include "RaiseMSL.h"

#include "BaseRaiser.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/IR/BuiltinTypes.h"
#include "simt-step/Dialect/SimtStep/SimtStepDialect.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/Support/Casting.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/LogicalResult.h"
#include "llvm/Support/raw_ostream.h"

#include <algorithm>
#include <cstdint>
#include <string>
#include <vector>

using namespace simt::test_raiser;
using namespace llvm;
using namespace mlir;

class MslRaiser : public BaseRaiser {
public:
    using BaseRaiser::BaseRaiser;

    unsigned subgroupWidth = 32;

    LogicalResult emitHarness(Operation *op, HarnessProps props) override {
        std::vector<int64_t> bufferIndices;
        if (failed(getMainInfo(op, ntx, nty, ntz, bufferIndices)))
            return failure();

        subgroupWidth = std::max(1, props.subgroupWidth);
        if (props.noWrapper)
            return emitShaderOnly(op);
        return emitWrappedHarness(op, props, bufferIndices);
    }

private:
    LogicalResult emitShaderOnly(Operation *op) {
        if (failed(emitShaderPrologue(op)))
            return failure();
        return emitOp(op);
    }

    void emitIntArray(StringRef name, ArrayRef<int64_t> values) {
        os << "static int32_t " << name << "[] = {";
        for (auto [i, value] : llvm::enumerate(values)) {
            os << "static_cast<int32_t>(" << value << ")";
            if (i + 1 < values.size())
                os << ", ";
        }
        os << "};\n";
    }

    LogicalResult emitWrappedHarness(Operation *op, HarnessProps props,
                                     ArrayRef<int64_t> bufferIndices) {
        std::string shaderText;
        raw_string_ostream shaderOS(shaderText);
        MslRaiser shader(shaderOS);
        shader.subgroupWidth = subgroupWidth;
        if (failed(shader.emitShaderOnly(op)))
            return failure();
        shaderOS.flush();

        os << "#import <Foundation/Foundation.h>\n";
        os << "#import <Metal/Metal.h>\n";
        os << "#include <cstdint>\n";
        os << "#include <cstdio>\n\n";

        os << "static const char *kShaderSource = R\"MSL(\n";
        os << shaderText;
        if (!shaderText.empty() && shaderText.back() != '\n')
            os << "\n";
        os << ")MSL\";\n\n";

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
        os << "id<MTLLibrary> library = [device newLibraryWithSource:source options:nil error:&error];\n";
        os << "if (!library) {\n";
        os.indent() << "const char *msg = error ? [[error localizedDescription] UTF8String] : \"unknown\";\n";
        os << "fprintf(stderr, \"newLibraryWithSource failed: %s\\n\", msg);\n";
        os << "return 1;\n";
        os.unindent() << "}\n";
        os << "id<MTLFunction> kernel = [library newFunctionWithName:@\"kernel_main\"];\n";
        os << "if (!kernel) {\n";
        os.indent() << "fprintf(stderr, \"Unable to find kernel_main in generated MSL\\n\");\n";
        os << "return 1;\n";
        os.unindent() << "}\n";
        os << "id<MTLComputePipelineState> pipeline = [device newComputePipelineStateWithFunction:kernel error:&error];\n";
        os << "if (!pipeline) {\n";
        os.indent() << "const char *msg = error ? [[error localizedDescription] UTF8String] : \"unknown\";\n";
        os << "fprintf(stderr, \"newComputePipelineStateWithFunction failed: %s\\n\", msg);\n";
        os << "return 1;\n";
        os.unindent() << "}\n";
        os << "id<MTLCommandQueue> queue = [device newCommandQueue];\n";
        os << "if (!queue) {\n";
        os.indent() << "fprintf(stderr, \"Unable to create command queue\\n\");\n";
        os << "return 1;\n";
        os.unindent() << "}\n";

        for (auto [i, expected] : llvm::enumerate(props.expected)) {
            emitIntArray("expected" + std::to_string(i), expected);
        }
        for (auto [i, input] : llvm::enumerate(props.input)) {
            emitIntArray("host_actual" + std::to_string(i), input);
            os << "id<MTLBuffer> actual_buf" << i
               << " = [device newBufferWithBytes:host_actual" << i
               << " length:sizeof(host_actual" << i
               << ") options:MTLResourceStorageModeShared];\n";
            os << "if (!actual_buf" << i << ") {\n";
            os.indent() << "fprintf(stderr, \"Unable to create input buffer "
                        << i << "\\n\");\n";
            os << "return 1;\n";
            os.unindent() << "}\n";
        }

        os << "id<MTLCommandBuffer> commandBuffer = [queue commandBuffer];\n";
        os << "id<MTLComputeCommandEncoder> encoder = [commandBuffer computeCommandEncoder];\n";
        os << "[encoder setComputePipelineState:pipeline];\n";
        for (auto i : llvm::seq<size_t>(0, props.input.size())) {
            int64_t bindingIndex = i;
            if (i < bufferIndices.size())
                bindingIndex = bufferIndices[i];
            os << "[encoder setBuffer:actual_buf" << i << " offset:0 atIndex:"
               << bindingIndex << "];\n";
        }
        os << "MTLSize threadgroups = MTLSizeMake(1, 1, 1);\n";
        os << "MTLSize threadsPerThreadgroup = MTLSizeMake(" << ntx << ", "
           << nty << ", " << ntz << ");\n";
        os << "[encoder dispatchThreadgroups:threadgroups threadsPerThreadgroup:threadsPerThreadgroup];\n";
        os << "[encoder endEncoding];\n";
        os << "[commandBuffer commit];\n";
        os << "[commandBuffer waitUntilCompleted];\n";
        os << "if ([commandBuffer status] != MTLCommandBufferStatusCompleted) {\n";
        os.indent() << "fprintf(stderr, \"Metal command buffer did not complete\\n\");\n";
        os << "return 1;\n";
        os.unindent() << "}\n";

        for (auto [i, expected] : llvm::enumerate(props.expected)) {
            os << "int32_t *actual" << i
               << " = static_cast<int32_t *>([actual_buf" << i
               << " contents]);\n";
            os << "for (size_t idx = 0; idx < " << expected.size()
               << "; ++idx) {\n";
            os.indent() << "if (actual" << i << "[idx] != expected" << i
                        << "[idx]) {\n";
            os.indent()
                << "fprintf(stderr, \"buffer " << i
                << " [%zu]: expected=%d actual=%d\\n\", idx, expected" << i
                << "[idx], actual" << i << "[idx]);\n";
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
                os << "* " << getOrAddValueName(v) << " [[buffer(" << i << ")]]";
            } else {
                if (failed(emitType(v.getType())))
                    return failure();
                os << " " << getOrAddValueName(v);
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
        os << "  uint mask = simd_ballot(pred);\n";
        os << "  return static_cast<int>(popcount(mask));\n";
        os << "}\n\n";
        return success();
    }

    LogicalResult emitCast(Value in, Value out) override {
        if (failed(emitValueDefine(out)))
            return failure();
        os << "(";
        if (failed(emitType(out.getType())))
            return failure();
        os << ")(" << getOrAddValueName(in) << ")";
        return success();
    }

    LogicalResult printOp(arith::RemFOp &op) override {
        return emitFuncCall(op.getResult(), "fmod",
                            {op->getOperand(0), op->getOperand(1)});
    }

    LogicalResult printOp(func::FuncOp &op) override {
        if (op.getSymName() != "main")
            os << "inline ";
        return BaseRaiser::printOp(op);
    }

    LogicalResult printOp(DispatchThreadIdOp &op) override {
        if (failed(emitValueDefine(op.getResult())))
            return failure();
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
        os << "simt_wave_count_bits(" << getOrAddValueName(op.getOperand()) << ")";
        return success();
    }

    LogicalResult printOp(LaneIdOp &op) override {
        if (failed(emitValueDefine(op.getResult())))
            return failure();
        os << "simt_lane_id(static_cast<int>(__simt_tid3.x))";
        return success();
    }

    LogicalResult printOp(SubgroupIdOp &op) override {
        if (failed(emitValueDefine(op.getResult())))
            return failure();
        os << "simt_subgroup_id(static_cast<int>(__simt_tid3.x))";
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
};

namespace simt::test_raiser {

LogicalResult emitRaisedMSL(Operation *op, raw_ostream &o, HarnessProps props) {
    MslRaiser msl(o);
    return msl.emitHarness(op, props);
}

} // namespace simt::test_raiser
