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
  int v8 = 1;
  int v9;
  v9 = v8;
  switch (v3) {
    default:
      {
      v9 = v0;
      break;
    }
    case 0:
      {
      int v10 = 3;
      int v11 = v3 % v10;
      int v12;
      v12 = v0;
      switch (v11) {
        case 0:
          {
          int v13 = 0;
          bool v14 = v2 != v13;
          int v15;
          if (v14) {
            int v16 = 3;
            v15 = v16;
          } else {
            v15 = v0;
          }
          v12 = v15;
          break;
        }
        case 1:
          {
          int v17 = 0;
          bool v18 = v2 != v17;
          int v19;
          if (v18) {
            int v20 = 1;
            int v21 = v0 + v20;
            v19 = v21;
          } else {
            int v22 = 2;
            v19 = v22;
          }
          v12 = v19;
          break;
        }
        default:
          {
          v12 = v0;
          break;
        }
        case 2:
          {
          int v23 = 4;
          int v24 = v3 % v23;
          int v25 = 4;
          int v26;
          v26 = v25;
          switch (v24) {
            case 0:
              {
              int v27 = 2;
              v26 = v27;
              break;
            }
            case 1:
              {
              v26 = v0;
              break;
            }
            default:
              {
              int v28 = 3;
              int v29 = v0 + v28;
              v26 = v29;
              break;
            }
            case 2:
              {
              v26 = v0;
              break;
            }
          }
          v12 = v26;
          break;
        }
      }
      int v30 = 4;
      int v31 = v0 + v30;
      v9 = v12;
      break;
    }
  }
  int v32 = 0;
  bool v33 = v2 != v32;
  int v34 = v33 ? v5 : v9;
  return;
}

kernel void kernel_main(device int* v35 [[buffer(0)]], device int* v36 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v37 = static_cast<int>(__simt_tid3.x);
  int v38 = 0;
  int v39 = v38 + v37;
  int v40 = v36[v39];
  int v41 = 4;
  int v42 = v41 + v37;
  int v43 = v36[v42];
  int v44 = 0;
  bool v45 = v40 != v44;
  if (v45) {
  } else {
    int v46 = 8;
    int v47 = v46 + v37;
    int v48 = v36[v47];
    int v49 = 0;
    bool v50 = v48 != v49;
    if (v50) {
    } else {
      helper0(v37, v35, v40, v43, static_cast<int>(__simt_tid3.x));
    }
  }
  int v51 = 12;
  int v52 = v51 + v37;
  int v53 = v36[v52];
  int v54 = 4;
  int v55;
  v55 = v54;
  switch (v53) {
    case 0:
      {
      int v56 = 16;
      int v57 = v56 + v37;
      int v58 = v36[v57];
      int v59 = 3;
      int v60 = v37 + v59;
      int v61;
      v61 = v60;
      switch (v58) {
        default:
          {
          int v62 = 20;
          int v63 = v62 + v37;
          int v64 = v36[v63];
          int v65 = 0;
          bool v66 = v64 != v65;
          int v67;
          if (v66) {
            int v68 = 3;
            int v69 = v37 + v68;
            v67 = v69;
          } else {
            int v70 = 3;
            v67 = v70;
          }
          v61 = v67;
          break;
        }
        case 0:
          {
          int v71 = 24;
          int v72 = v71 + v37;
          int v73 = v36[v72];
          int v74 = 0;
          bool v75 = v73 != v74;
          int v76;
          if (v75) {
            int v77 = 3;
            int v78 = v37 + v77;
            v76 = v78;
          } else {
            int v79 = 1;
            int v80 = v37 + v79;
            v76 = v80;
          }
          v61 = v76;
          break;
        }
        case 1:
          {
          v61 = v37;
          break;
        }
        case 2:
          {
          int v81 = 28;
          int v82 = v81 + v37;
          int v83 = v36[v82];
          int v84 = 1;
          int v85;
          v85 = v84;
          switch (v83) {
            default:
              {
              v85 = v37;
              break;
            }
            case 0:
              {
              int v86 = 1;
              v85 = v86;
              break;
            }
          }
          v61 = v85;
          break;
        }
      }
      v55 = v61;
      break;
    }
    default:
      {
      int v87 = 0;
      v55 = v87;
      break;
    }
    case 1:
      {
      int v88 = 32;
      int v89 = v88 + v37;
      int v90 = v36[v89];
      int v91 = 2;
      int v92;
      v92 = v91;
      switch (v90) {
        case 0:
          {
          int v93 = 36;
          int v94 = v93 + v37;
          int v95 = v36[v94];
          int v96 = 2;
          int v97 = v37 + v96;
          int v98;
          v98 = v97;
          switch (v95) {
            case 0:
              {
              v98 = v37;
              break;
            }
            default:
              {
              v98 = v37;
              break;
            }
          }
          bool v99 = true;
          v92 = v98;
          break;
        }
        default:
          {
          v92 = v37;
          break;
        }
        case 1:
          {
          int v100 = 40;
          int v101 = v100 + v37;
          int v102 = v36[v101];
          int v103 = 0;
          bool v104 = v102 != v103;
          int v105;
          if (v104) {
            v105 = v37;
          } else {
            v105 = v37;
          }
          v92 = v105;
          break;
        }
      }
      bool v106 = true;
      v55 = v92;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 44; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
