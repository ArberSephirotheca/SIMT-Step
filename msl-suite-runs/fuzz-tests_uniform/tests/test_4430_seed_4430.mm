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
  int v4 = 2;
  uint v5 = simt_subgroup_id(__simt_tid);
  int v6 = (int)(v5);
  int v7;
  v7 = v6;
  switch (v3) {
    case 0:
      {
      int v8 = 3;
      int v9 = v3 % v8;
      int v10;
      v10 = v0;
      switch (v9) {
        case 0:
          {
          int v11 = 0;
          bool v12 = v2 != v11;
          int v13;
          if (v12) {
            v13 = v0;
          } else {
            int v14 = 2;
            int v15 = v0 + v14;
            v13 = v15;
          }
          v10 = v13;
          break;
        }
        case 1:
          {
          int v16 = 2;
          int v17 = v3 % v16;
          int v18 = 3;
          int v19;
          v19 = v18;
          switch (v17) {
            case 0:
              {
              int v20 = 1;
              int v21 = v0 + v20;
              v19 = v21;
              break;
            }
            default:
              {
              int v22 = 0;
              int v23 = v0 + v22;
              v19 = v23;
            }
            case 1:
              {
              int v24 = 4;
              int v25 = v0 + v24;
              v19 = v25;
              break;
            }
          }
          int v26 = 4;
          int v27 = v0 + v26;
          v10 = v19;
          break;
        }
        default:
          {
          int v28 = 0;
          v10 = v28;
          break;
        }
        case 2:
          {
          int v29 = 0;
          bool v30 = v2 != v29;
          int v31;
          if (v30) {
            v31 = v0;
          } else {
            int v32 = 3;
            v31 = v32;
          }
          int v33 = 1;
          v10 = v31;
          break;
        }
      }
      v7 = v10;
      break;
    }
    default:
      {
      int v34 = 0;
      bool v35 = v2 != v34;
      int v36;
      if (v35) {
        int v37 = 0;
        v36 = v37;
      } else {
        int v38;
        v38 = v0;
        switch (v3) {
          default:
            {
            int v39 = 3;
            v38 = v39;
            break;
          }
          case 0:
            {
            int v40 = 0;
            v38 = v40;
            break;
          }
        }
        int v41 = 4;
        v36 = v38;
      }
      v7 = v36;
      break;
    }
  }
  bool v42 = true;
  int v43 = simt_wave_count_bits(v42);
  int v44 = 0;
  int v45 = v44 + v0;
  v1[v45] = v43;
  int v46 = 0;
  bool v47 = v2 != v46;
  int v48 = v47 ? v4 : v7;
  return;
}

kernel void kernel_main(device int* v49 [[buffer(0)]], device int* v50 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v51 = static_cast<int>(__simt_tid3.x);
  int v52 = 0;
  int v53 = v52 + v51;
  int v54 = v50[v53];
  int v55 = 4;
  int v56 = v55 + v51;
  int v57 = v50[v56];
  helper0(v51, v49, v54, v57, static_cast<int>(__simt_tid3.x));
  uint v58 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v59 = (int)(v58);
  int v60 = 0;
  int v61 = 0;
  int v62;
  int v63;
  v62 = v60;
  v63 = v61;
  while (true) {
    int v64 = 4;
    int v65 = v63 * v64;
    int v66 = v65 + v51;
    int v67 = 8;
    int v68 = v67 + v66;
    int v69 = v50[v68];
    int v70 = 0;
    bool v71 = v69 != v70;
    v62 = v62;
    v63 = v63;
    if (!v71) break;
    int v72 = 1;
    int v73 = v62 + v72;
    int v74 = 1;
    int v75 = v63 + v74;
    v62 = v73;
    v63 = v75;
  }
  bool v76 = true;
  int v77 = 16;
  int v78 = v77 + v51;
  bool v79 = true;
  int v80 = simt_wave_count_bits(v79);
  v49[v78] = v80;
  int v81 = 28;
  int v82 = v81 + v51;
  int v83 = v50[v82];
  uint v84 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v85 = (int)(v84);
  int v86;
  v86 = v85;
  switch (v83) {
    case 0:
      {
      int v87 = 4;
      v86 = v87;
      break;
    }
    default:
      {
      int v88 = 32;
      int v89 = v88 + v51;
      int v90 = v50[v89];
      int v91 = 3;
      int v92 = v51 + v91;
      int v93;
      v93 = v92;
      switch (v90) {
        case 0:
          {
          int v94 = 0;
          int v95 = 0;
          int v96;
          int v97;
          v96 = v94;
          v97 = v95;
          while (true) {
            int v98 = 4;
            int v99 = v97 * v98;
            int v100 = v99 + v51;
            int v101 = 36;
            int v102 = v101 + v100;
            int v103 = v50[v102];
            int v104 = 0;
            bool v105 = v103 != v104;
            v96 = v96;
            v97 = v97;
            if (!v105) break;
            int v106 = v96 + v97;
            int v107 = 1;
            int v108 = v97 + v107;
            v96 = v106;
            v97 = v108;
          }
          bool v109 = true;
          v93 = v96;
          break;
        }
        default:
          {
          int v110 = 56;
          int v111 = v110 + v51;
          int v112 = v50[v111];
          int v113;
          v113 = v51;
          switch (v112) {
            default:
              {
              v113 = v51;
              break;
            }
            case 0:
              {
              int v114 = 4;
              int v115 = v51 + v114;
              v113 = v115;
              break;
            }
          }
          bool v116 = true;
          v93 = v113;
          break;
        }
      }
      bool v117 = true;
      v86 = v93;
      break;
    }
  }
  bool v118 = true;
  int v119 = 32;
  int v120 = v119 + v51;
  bool v121 = true;
  int v122 = simt_wave_count_bits(v121);
  v49[v120] = v122;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 36; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 60; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
