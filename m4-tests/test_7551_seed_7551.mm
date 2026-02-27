#import <Foundation/Foundation.h>
#import <Metal/Metal.h>
#include <cstdint>
#include <cstdio>

static const char *kShaderSource = R"MSL(
#include <metal_stdlib>
using namespace metal;
#define SIMT_SUBGROUP_WIDTH 32
static inline int simt_lane_id(int tid) {
  return tid % SIMT_SUBGROUP_WIDTH;
}
static inline int simt_subgroup_id(int tid) {
  return tid / SIMT_SUBGROUP_WIDTH;
}
static inline int simt_wave_count_bits(bool pred) {
  return static_cast<int>(simd_sum(pred ? 1u : 0u));
}

inline void helper0(int v0, device int* v1, int v2, int v3, int __simt_tid){
  bool v4 = true;
  int v5 = simt_wave_count_bits(v4);
  int v6 = 0;
  int v7 = v6 + v0;
  v1[v7] = v5;
  int v8 = 4;
  int v9 = v3 % v8;
  int v10 = 1;
  int v11 = v0 + v10;
  int v12;
  v12 = v11;
  switch (v9) {
    case 0:
      {
      int v13 = 0;
      int v14 = 0;
      int v15;
      int v16;
      v15 = v13;
      v16 = v14;
      while (true) {
        int v17 = 4;
        int v18 = v3 % v17;
        int v19 = 1;
        int v20 = v18 + v19;
        bool v21 = v16 < v20;
        v15 = v15;
        v16 = v16;
        if (!v21) break;
        int v22 = 2;
        int v23 = 1;
        int v24 = v16 + v23;
        v15 = v22;
        v16 = v24;
      }
      v12 = v15;
      break;
    }
    default:
      {
      int v25 = 0;
      int v26 = 0;
      int v27;
      int v28;
      v27 = v25;
      v28 = v26;
      while (true) {
        int v29 = 4;
        int v30 = v3 % v29;
        int v31 = 1;
        int v32 = v30 + v31;
        bool v33 = v28 < v32;
        v27 = v27;
        v28 = v28;
        if (!v33) break;
        int v34 = 0;
        bool v35 = v2 != v34;
        int v36;
        if (v35) {
          int v37 = 3;
          v36 = v37;
        } else {
          v36 = v0;
        }
        int v38 = 1;
        int v39 = v28 + v38;
        v27 = v36;
        v28 = v39;
      }
      v12 = v27;
      break;
    }
    case 1:
      {
      int v40 = 3;
      int v41 = v3 % v40;
      int v42;
      v42 = v0;
      switch (v41) {
        case 0:
          {
          int v43 = 2;
          int v44 = v3 % v43;
          int v45;
          v45 = v0;
          switch (v44) {
            default:
              {
              int v46 = 2;
              int v47 = v0 + v46;
              v45 = v47;
              break;
            }
            case 0:
              {
              int v48 = 1;
              int v49 = v0 + v48;
              v45 = v49;
              break;
            }
            case 1:
              {
              v45 = v0;
              break;
            }
          }
          v42 = v45;
          break;
        }
        case 1:
          {
          int v50 = 0;
          int v51 = 0;
          int v52;
          int v53;
          v52 = v50;
          v53 = v51;
          while (true) {
            int v54 = 4;
            int v55 = v3 % v54;
            int v56 = 1;
            int v57 = v55 + v56;
            bool v58 = v53 < v57;
            v52 = v52;
            v53 = v53;
            if (!v58) break;
            int v59 = 1;
            int v60 = v53 + v59;
            v52 = v0;
            v53 = v60;
          }
          v42 = v52;
          break;
        }
        default:
          {
          int v61;
          v61 = v0;
          switch (v3) {
            case 0:
              {
              int v62 = 0;
              int v63 = v0 + v62;
              v61 = v63;
            }
            default:
              {
              int v64 = 1;
              v61 = v64;
              break;
            }
          }
          v42 = v61;
          break;
        }
      }
      v12 = v42;
      break;
    }
    case 2:
      {
      int v65 = 2;
      v12 = v65;
      break;
    }
  }
  int v66 = 0;
  bool v67 = v2 != v66;
  int v68 = v67 ? v5 : v12;
  return;
}

kernel void kernel_main(device int* v69 [[buffer(0)]], device int* v70 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v71 = static_cast<int>(__simt_tid3.x);
  int v72 = 0;
  int v73 = v72 + v71;
  int v74 = v70[v73];
  int v75 = 4;
  int v76 = v75 + v71;
  int v77 = v70[v76];
  helper0(v71, v69, v74, v77, static_cast<int>(__simt_tid3.x));
  uint v78 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v79 = (int)(v78);
  int v80 = 8;
  int v81 = v80 + v71;
  int v82 = v70[v81];
  uint v83 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v84 = (int)(v83);
  int v85;
  v85 = v84;
  switch (v82) {
    case 0:
      {
      int v86 = 3;
      int v87 = v71 + v86;
      v85 = v87;
    }
    case 1:
      {
      int v88 = 2;
      v85 = v88;
    }
    case 2:
      {
      int v89 = 4;
      int v90 = v71 + v89;
      v85 = v90;
      break;
    }
    default:
      {
      int v91 = 12;
      int v92 = v91 + v71;
      int v93 = v70[v92];
      int v94 = 4;
      int v95 = v71 + v94;
      int v96;
      v96 = v95;
      switch (v93) {
        case 0:
          {
          int v97 = 0;
          int v98 = 0;
          int v99;
          int v100;
          v99 = v97;
          v100 = v98;
          while (true) {
            int v101 = 4;
            int v102 = v100 * v101;
            int v103 = v102 + v71;
            int v104 = 16;
            int v105 = v104 + v103;
            int v106 = v70[v105];
            int v107 = 0;
            bool v108 = v106 != v107;
            v99 = v99;
            v100 = v100;
            if (!v108) break;
            int v109 = v99 + v100;
            int v110 = 1;
            int v111 = v100 + v110;
            bool v112 = true;
            v99 = v109;
            v100 = v111;
            break;
            ;
          }
          v96 = v99;
          break;
        }
        default:
          {
          int v113 = 36;
          int v114 = v113 + v71;
          int v115 = v70[v114];
          int v116;
          v116 = v71;
          switch (v115) {
            default:
              {
              v116 = v71;
              break;
            }
            case 0:
              {
              int v117 = 3;
              int v118 = v71 + v117;
              v116 = v118;
              break;
            }
            case 1:
              {
              v116 = v71;
              break;
            }
            case 2:
              {
              v116 = v71;
              break;
            }
          }
          v96 = v116;
          break;
        }
      }
      v85 = v96;
      break;
    }
  }
  return;
}

)MSL";

int main() {
  @autoreleasepool {
    id<MTLDevice> device = MTLCreateSystemDefaultDevice();
    if (!device) {
      fprintf(stderr, "No Metal device available\n");
      return 1;
    }
    NSError *error = nil;
    NSString *source = [NSString stringWithUTF8String:kShaderSource];
    id<MTLLibrary> library = [device newLibraryWithSource:source options:nil error:&error];
    if (!library) {
      const char *msg = error ? [[error localizedDescription] UTF8String] : "unknown";
      fprintf(stderr, "newLibraryWithSource failed: %s\n", msg);
      return 1;
    }
    id<MTLFunction> kernel = [library newFunctionWithName:@"kernel_main"];
    if (!kernel) {
      fprintf(stderr, "Unable to find kernel_main in generated MSL\n");
      return 1;
    }
    id<MTLComputePipelineState> pipeline = [device newComputePipelineStateWithFunction:kernel error:&error];
    if (!pipeline) {
      const char *msg = error ? [[error localizedDescription] UTF8String] : "unknown";
      fprintf(stderr, "newComputePipelineStateWithFunction failed: %s\n", msg);
      return 1;
    }
    id<MTLCommandQueue> queue = [device newCommandQueue];
    if (!queue) {
      fprintf(stderr, "Unable to create command queue\n");
      return 1;
    }
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    id<MTLBuffer> actual_buf1 = [device newBufferWithBytes:host_actual1 length:sizeof(host_actual1) options:MTLResourceStorageModeShared];
    if (!actual_buf1) {
      fprintf(stderr, "Unable to create input buffer 1\n");
      return 1;
    }
    id<MTLCommandBuffer> commandBuffer = [queue commandBuffer];
    id<MTLComputeCommandEncoder> encoder = [commandBuffer computeCommandEncoder];
    [encoder setComputePipelineState:pipeline];
    [encoder setBuffer:actual_buf0 offset:0 atIndex:0];
    [encoder setBuffer:actual_buf1 offset:0 atIndex:1];
    MTLSize threadgroups = MTLSizeMake(1, 1, 1);
    MTLSize threadsPerThreadgroup = MTLSizeMake(4, 1, 1);
    [encoder dispatchThreadgroups:threadgroups threadsPerThreadgroup:threadsPerThreadgroup];
    [encoder endEncoding];
    [commandBuffer commit];
    [commandBuffer waitUntilCompleted];
    if ([commandBuffer status] != MTLCommandBufferStatusCompleted) {
      fprintf(stderr, "Metal command buffer did not complete\n");
      return 1;
    }
    int32_t *actual0 = static_cast<int32_t *>([actual_buf0 contents]);
    for (size_t idx = 0; idx < 4; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 40; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
