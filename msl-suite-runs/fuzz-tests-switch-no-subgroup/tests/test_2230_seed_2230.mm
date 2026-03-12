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
  int v5 = v3 % v4;
  int v6 = 4;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 4;
      int v10 = v3 % v9;
      int v11 = 4;
      int v12;
      v12 = v11;
      switch (v10) {
        default:
          {
          int v13 = 0;
          bool v14 = v2 != v13;
          int v15;
          if (v14) {
            v15 = v0;
          } else {
            int v16 = 0;
            int v17 = v0 + v16;
            v15 = v17;
          }
          v12 = v15;
          break;
        }
        case 0:
          {
          int v18 = 0;
          bool v19 = v2 != v18;
          int v20;
          if (v19) {
            int v21 = 4;
            int v22 = v0 + v21;
            v20 = v22;
          } else {
            v20 = v0;
          }
          v12 = v20;
          break;
        }
        case 1:
          {
          int v23 = 3;
          int v24 = v3 % v23;
          int v25 = 3;
          int v26;
          v26 = v25;
          switch (v24) {
            default:
              {
              int v27 = 0;
              int v28 = v0 + v27;
              v26 = v28;
              break;
            }
            case 0:
              {
              int v29 = 1;
              v26 = v29;
              break;
            }
            case 1:
              {
              int v30 = 3;
              int v31 = v0 + v30;
              v26 = v31;
              break;
            }
          }
          v12 = v26;
        }
        case 2:
          {
          int v32 = 3;
          int v33 = v3 % v32;
          int v34 = 3;
          int v35;
          v35 = v34;
          switch (v33) {
            case 0:
              {
              int v36 = 4;
              int v37 = v0 + v36;
              v35 = v37;
              break;
            }
            case 1:
              {
              int v38 = 1;
              int v39 = v0 + v38;
              v35 = v39;
              break;
            }
            case 2:
              {
              v35 = v0;
              break;
            }
            default:
              {
              v35 = v0;
              break;
            }
          }
          v12 = v35;
          break;
        }
      }
      int v40 = 3;
      v8 = v12;
      break;
    }
    default:
      {
      int v41 = 4;
      int v42 = v0 + v41;
      v8 = v42;
      break;
    }
    case 1:
      {
      int v43 = 0;
      bool v44 = v2 != v43;
      int v45;
      if (v44) {
        int v46 = 0;
        bool v47 = v2 != v46;
        int v48;
        if (v47) {
          v48 = v0;
        } else {
          int v49 = 4;
          v48 = v49;
        }
        v45 = v48;
      } else {
        int v50 = 3;
        v45 = v50;
      }
      v8 = v45;
      break;
    }
  }
  bool v51 = true;
  int v52 = simt_wave_count_bits(v51);
  int v53 = 0;
  int v54 = v53 + v0;
  v1[v54] = v52;
  return;
}

kernel void kernel_main(device int* v55 [[buffer(0)]], device int* v56 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v57 = static_cast<int>(__simt_tid3.x);
  int v58 = 0;
  int v59 = v58 + v57;
  int v60 = v56[v59];
  int v61 = 4;
  int v62 = v61 + v57;
  int v63 = v56[v62];
  helper0(v57, v55, v60, v63, static_cast<int>(__simt_tid3.x));
  uint v64 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v65 = (int)(v64);
  int v66 = 8;
  int v67 = v66 + v57;
  int v68 = v56[v67];
  uint v69 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v70 = (int)(v69);
  int v71;
  v71 = v70;
  switch (v68) {
    case 0:
      {
      int v72 = 12;
      int v73 = v72 + v57;
      int v74 = v56[v73];
      int v75;
      v75 = v57;
      switch (v74) {
        case 0:
          {
          v75 = v57;
          break;
        }
        case 1:
          {
          int v76 = 16;
          int v77 = v76 + v57;
          int v78 = v56[v77];
          int v79 = 0;
          bool v80 = v78 != v79;
          int v81;
          if (v80) {
            int v82 = 4;
            v81 = v82;
          } else {
            int v83 = 0;
            int v84 = v57 + v83;
            v81 = v84;
          }
          v75 = v81;
          break;
        }
        default:
          {
          int v85 = 20;
          int v86 = v85 + v57;
          int v87 = v56[v86];
          int v88 = 0;
          bool v89 = v87 != v88;
          int v90;
          if (v89) {
            v90 = v57;
          } else {
            v90 = v57;
          }
          v75 = v90;
          break;
        }
      }
      bool v91 = true;
      v71 = v75;
      break;
    }
    case 1:
      {
      int v92 = 24;
      int v93 = v92 + v57;
      int v94 = v56[v93];
      int v95 = 4;
      int v96;
      v96 = v95;
      switch (v94) {
        case 0:
          {
          int v97 = 28;
          int v98 = v97 + v57;
          int v99 = v56[v98];
          int v100 = 0;
          int v101 = v57 + v100;
          int v102;
          v102 = v101;
          switch (v99) {
            case 0:
              {
              v102 = v57;
            }
            case 1:
              {
              int v103 = 1;
              v102 = v103;
              break;
            }
            case 2:
              {
              int v104 = 2;
              v102 = v104;
            }
            default:
              {
              v102 = v57;
              break;
            }
          }
          v96 = v102;
          break;
        }
        case 1:
          {
          int v105 = 32;
          int v106 = v105 + v57;
          int v107 = v56[v106];
          int v108 = 0;
          bool v109 = v107 != v108;
          int v110;
          if (v109) {
            int v111 = 4;
            v110 = v111;
          } else {
            int v112 = 4;
            v110 = v112;
          }
          v96 = v110;
          break;
        }
        default:
          {
          int v113 = 36;
          int v114 = v113 + v57;
          int v115 = v56[v114];
          int v116 = 0;
          bool v117 = v115 != v116;
          int v118;
          if (v117) {
            int v119 = 0;
            v118 = v119;
          } else {
            int v120 = 1;
            v118 = v120;
          }
          v96 = v118;
          break;
        }
      }
      bool v121 = true;
      v71 = v96;
      break;
    }
    default:
      {
      int v122 = 1;
      v71 = v122;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
