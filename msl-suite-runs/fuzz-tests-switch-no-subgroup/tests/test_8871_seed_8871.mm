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
  int v4 = 0;
  int v5 = 0;
  int v6;
  int v7;
  v6 = v4;
  v7 = v5;
  while (true) {
    int v8 = 4;
    int v9 = v3 % v8;
    int v10 = 1;
    int v11 = v9 + v10;
    bool v12 = v7 < v11;
    v6 = v6;
    v7 = v7;
    if (!v12) break;
    int v13 = 2;
    int v14 = v3 % v13;
    int v15 = 1;
    int v16;
    v16 = v15;
    switch (v14) {
      default:
        {
        int v17 = 0;
        bool v18 = v2 != v17;
        int v19;
        if (v18) {
          int v20 = 1;
          v19 = v20;
        } else {
          int v21 = 4;
          int v22 = v0 + v21;
          v19 = v22;
        }
        v16 = v19;
      }
      case 0:
        {
        int v23 = 0;
        bool v24 = v2 != v23;
        int v25;
        if (v24) {
          v25 = v0;
        } else {
          int v26 = 2;
          int v27 = v0 + v26;
          v25 = v27;
        }
        v16 = v25;
        break;
      }
    }
    bool v28 = true;
    int v29 = simt_wave_count_bits(v28);
    int v30 = 0;
    int v31 = 4;
    int v32 = v7 * v31;
    int v33 = v30 + v32;
    int v34 = v33 + v0;
    v1[v34] = v29;
    int v35 = 1;
    int v36 = v7 + v35;
    v6 = v16;
    v7 = v36;
  }
  return;
}

kernel void kernel_main(device int* v37 [[buffer(0)]], device int* v38 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v39 = static_cast<int>(__simt_tid3.x);
  int v40 = 0;
  int v41 = v40 + v39;
  int v42 = v38[v41];
  int v43 = 4;
  int v44 = v43 + v39;
  int v45 = v38[v44];
  helper0(v39, v37, v42, v45, static_cast<int>(__simt_tid3.x));
  uint v46 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v47 = (int)(v46);
  int v48 = 8;
  int v49 = v48 + v39;
  int v50 = v38[v49];
  uint v51 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v52 = (int)(v51);
  int v53;
  v53 = v52;
  switch (v50) {
    default:
      {
      int v54 = 12;
      int v55 = v54 + v39;
      int v56 = v38[v55];
      int v57 = 3;
      int v58;
      v58 = v57;
      switch (v56) {
        case 0:
          {
          int v59 = 16;
          int v60 = v59 + v39;
          int v61 = v38[v60];
          int v62 = 0;
          int v63;
          v63 = v62;
          switch (v61) {
            case 0:
              {
              int v64 = 2;
              v63 = v64;
              break;
            }
            case 1:
              {
              v63 = v39;
              break;
            }
            case 2:
              {
              int v65 = 0;
              v63 = v65;
              break;
            }
            default:
              {
              int v66 = 0;
              int v67 = v39 + v66;
              v63 = v67;
              break;
            }
          }
          v58 = v63;
          break;
        }
        case 1:
          {
          int v68 = 20;
          int v69 = v68 + v39;
          int v70 = v38[v69];
          int v71 = 2;
          int v72;
          v72 = v71;
          switch (v70) {
            case 0:
              {
              int v73 = 3;
              int v74 = v39 + v73;
              v72 = v74;
              break;
            }
            default:
              {
              int v75 = 2;
              int v76 = v39 + v75;
              v72 = v76;
            }
            case 1:
              {
              int v77 = 4;
              v72 = v77;
              break;
            }
          }
          v58 = v72;
          break;
        }
        default:
          {
          int v78 = 3;
          int v79 = v39 + v78;
          v58 = v79;
          break;
        }
        case 2:
          {
          int v80 = 24;
          int v81 = v80 + v39;
          int v82 = v38[v81];
          int v83 = 0;
          bool v84 = v82 != v83;
          int v85;
          if (v84) {
            int v86 = 4;
            int v87 = v39 + v86;
            v85 = v87;
          } else {
            v85 = v39;
          }
          v58 = v85;
          break;
        }
      }
      v53 = v58;
      break;
    }
    case 0:
      {
      int v88 = 28;
      int v89 = v88 + v39;
      int v90 = v38[v89];
      int v91 = 3;
      int v92 = v39 + v91;
      int v93;
      v93 = v92;
      switch (v90) {
        case 0:
          {
          int v94 = 32;
          int v95 = v94 + v39;
          int v96 = v38[v95];
          int v97;
          v97 = v39;
          switch (v96) {
            default:
              {
              int v98 = 4;
              v97 = v98;
            }
            case 0:
              {
              int v99 = 1;
              int v100 = v39 + v99;
              v97 = v100;
              break;
            }
          }
          v93 = v97;
        }
        case 1:
          {
          int v101 = 36;
          int v102 = v101 + v39;
          int v103 = v38[v102];
          int v104 = 4;
          int v105;
          v105 = v104;
          switch (v103) {
            case 0:
              {
              int v106 = 0;
              v105 = v106;
              break;
            }
            case 1:
              {
              int v107 = 1;
              v105 = v107;
              break;
            }
            case 2:
              {
              int v108 = 3;
              int v109 = v39 + v108;
              v105 = v109;
              break;
            }
            default:
              {
              v105 = v39;
              break;
            }
          }
          v93 = v105;
          break;
        }
        default:
          {
          int v110 = 40;
          int v111 = v110 + v39;
          int v112 = v38[v111];
          int v113 = 1;
          int v114 = v39 + v113;
          int v115;
          v115 = v114;
          switch (v112) {
            case 0:
              {
              int v116 = 0;
              int v117 = v39 + v116;
              v115 = v117;
              break;
            }
            default:
              {
              int v118 = 1;
              int v119 = v39 + v118;
              v115 = v119;
              break;
            }
            case 1:
              {
              v115 = v39;
              break;
            }
          }
          v93 = v115;
          break;
        }
      }
      bool v120 = true;
      v53 = v93;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 16; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 44; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
