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
  int v4 = 3;
  int v5 = v3 % v4;
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 0;
      int v10 = v0 + v9;
      int v11;
      v11 = v10;
      switch (v3) {
        default:
          {
          int v12 = 2;
          int v13 = v3 % v12;
          int v14 = 4;
          int v15 = v0 + v14;
          int v16;
          v16 = v15;
          switch (v13) {
            default:
              {
              int v17 = 0;
              v16 = v17;
              break;
            }
            case 0:
              {
              v16 = v0;
              break;
            }
            case 1:
              {
              int v18 = 2;
              int v19 = v0 + v18;
              v16 = v19;
              break;
            }
          }
          int v20 = 0;
          v11 = v16;
          break;
        }
        case 0:
          {
          int v21 = 2;
          int v22 = v0 + v21;
          v11 = v22;
          break;
        }
      }
      v8 = v11;
      break;
    }
    case 1:
      {
      int v23 = 1;
      v8 = v23;
      break;
    }
    default:
      {
      int v24 = 2;
      int v25 = v3 % v24;
      int v26;
      v26 = v0;
      switch (v25) {
        case 0:
          {
          int v27 = 1;
          int v28;
          v28 = v27;
          switch (v3) {
            case 0:
              {
              int v29 = 4;
              v28 = v29;
              break;
            }
            default:
              {
              v28 = v0;
              break;
            }
          }
          int v30 = 2;
          v26 = v28;
        }
        case 1:
          {
          int v31 = 3;
          int v32 = v3 % v31;
          int v33;
          v33 = v0;
          switch (v32) {
            default:
              {
              int v34 = 2;
              int v35 = v0 + v34;
              v33 = v35;
              break;
            }
            case 0:
              {
              int v36 = 3;
              int v37 = v0 + v36;
              v33 = v37;
              break;
            }
            case 1:
              {
              int v38 = 1;
              v33 = v38;
              break;
            }
          }
          int v39 = 0;
          int v40 = v0 + v39;
          v26 = v33;
        }
        default:
          {
          int v41 = 0;
          bool v42 = v2 != v41;
          int v43;
          if (v42) {
            int v44 = 4;
            v43 = v44;
          } else {
            int v45 = 2;
            v43 = v45;
          }
          v26 = v43;
          break;
        }
      }
      int v46 = 4;
      v8 = v26;
      break;
    }
  }
  bool v47 = true;
  int v48 = simt_wave_count_bits(v47);
  int v49 = 0;
  int v50 = v49 + v0;
  v1[v50] = v48;
  return;
}

kernel void kernel_main(device int* v51 [[buffer(0)]], device int* v52 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v53 = static_cast<int>(__simt_tid3.x);
  int v54 = 0;
  int v55 = v54 + v53;
  int v56 = v52[v55];
  int v57 = 4;
  int v58 = v57 + v53;
  int v59 = v52[v58];
  helper0(v53, v51, v56, v59, static_cast<int>(__simt_tid3.x));
  int v60 = 8;
  int v61 = v60 + v53;
  int v62 = v52[v61];
  int v63 = 0;
  bool v64 = v62 != v63;
  int v65;
  if (v64) {
    int v66 = 0;
    int v67 = 0;
    int v68;
    int v69;
    v68 = v66;
    v69 = v67;
    while (true) {
      int v70 = 4;
      int v71 = v69 * v70;
      int v72 = v71 + v53;
      int v73 = 12;
      int v74 = v73 + v72;
      int v75 = v52[v74];
      int v76 = 0;
      bool v77 = v75 != v76;
      v68 = v68;
      v69 = v69;
      if (!v77) break;
      int v78 = 32;
      int v79 = v78 + v53;
      int v80 = v52[v79];
      int v81;
      v81 = v53;
      switch (v80) {
        case 0:
          {
          int v82 = 4;
          v81 = v82;
          break;
        }
        default:
          {
          int v83 = 0;
          v81 = v83;
          break;
        }
      }
      bool v84 = true;
      int v85 = v68 + v81;
      int v86 = 1;
      int v87 = v69 + v86;
      v68 = v85;
      v69 = v87;
    }
    bool v88 = true;
    v65 = v68;
  } else {
    int v89 = 4;
    int v90 = v53 + v89;
    v65 = v90;
  }
  int v91 = 16;
  int v92 = v91 + v53;
  bool v93 = true;
  int v94 = simt_wave_count_bits(v93);
  v51[v92] = v94;
  int v95 = 4;
  int v96 = 36;
  int v97 = v96 + v53;
  int v98 = v52[v97];
  int v99 = 0;
  bool v100 = v98 != v99;
  int v101;
  if (v100) {
    v101 = v53;
  } else {
    int v102 = 40;
    int v103 = v102 + v53;
    int v104 = v52[v103];
    int v105 = 0;
    bool v106 = v104 != v105;
    int v107;
    if (v106) {
      int v108 = 44;
      int v109 = v108 + v53;
      int v110 = v52[v109];
      int v111 = 0;
      bool v112 = v110 != v111;
      int v113;
      if (v112) {
        int v114 = 1;
        v113 = v114;
      } else {
        uint v115 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v116 = (int)(v115);
        v113 = v116;
      }
      v107 = v113;
    } else {
      int v117 = 48;
      int v118 = v117 + v53;
      int v119 = v52[v118];
      int v120 = 4;
      int v121;
      v121 = v120;
      switch (v119) {
        case 0:
          {
          v121 = v53;
        }
        default:
          {
          int v122 = 3;
          int v123 = v53 + v122;
          v121 = v123;
        }
        case 1:
          {
          int v124 = 4;
          v121 = v124;
          break;
        }
        case 2:
          {
          int v125 = 2;
          v121 = v125;
          break;
        }
      }
      bool v126 = true;
      v107 = v121;
    }
    v101 = v107;
  }
  int v127 = 32;
  int v128 = v127 + v53;
  bool v129 = true;
  int v130 = simt_wave_count_bits(v129);
  v51[v128] = v130;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 52; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
