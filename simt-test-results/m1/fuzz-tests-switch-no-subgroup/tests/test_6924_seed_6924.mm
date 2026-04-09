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
  int v8;
  v8 = v0;
  switch (v3) {
    default:
      {
      int v9 = 4;
      int v10 = v3 % v9;
      int v11 = 3;
      int v12;
      v12 = v11;
      switch (v10) {
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
          int v25 = 3;
          int v26 = v3 % v25;
          int v27;
          v27 = v0;
          switch (v26) {
            default:
              {
              v27 = v0;
              break;
            }
            case 0:
              {
              int v28 = 0;
              v27 = v28;
              break;
            }
            case 1:
              {
              int v29 = 3;
              v27 = v29;
              break;
            }
            case 2:
              {
              v27 = v0;
              break;
            }
          }
          v12 = v27;
          break;
        }
        case 1:
          {
          int v30 = 3;
          int v31 = v3 % v30;
          int v32 = 3;
          int v33 = v0 + v32;
          int v34;
          v34 = v33;
          switch (v31) {
            default:
              {
              int v35 = 1;
              int v36 = v0 + v35;
              v34 = v36;
              break;
            }
            case 0:
              {
              int v37 = 2;
              v34 = v37;
              break;
            }
            case 1:
              {
              int v38 = 3;
              v34 = v38;
              break;
            }
          }
          int v39 = 3;
          v12 = v34;
          break;
        }
        case 2:
          {
          int v40 = 0;
          int v41 = 0;
          int v42;
          int v43;
          v42 = v40;
          v43 = v41;
          while (true) {
            int v44 = 4;
            int v45 = v3 % v44;
            int v46 = 1;
            int v47 = v45 + v46;
            bool v48 = v43 < v47;
            v42 = v42;
            v43 = v43;
            if (!v48) break;
            int v49 = 1;
            int v50 = v43 + v49;
            v42 = v0;
            v43 = v50;
          }
          v12 = v42;
          break;
        }
      }
      v8 = v12;
      break;
    }
    case 0:
      {
      int v51 = 2;
      int v52 = v3 % v51;
      int v53 = 0;
      int v54;
      v54 = v53;
      switch (v52) {
        case 0:
          {
          int v55 = 0;
          bool v56 = v2 != v55;
          int v57;
          if (v56) {
            int v58 = 3;
            int v59 = v0 + v58;
            v57 = v59;
          } else {
            v57 = v0;
          }
          v54 = v57;
          break;
        }
        case 1:
          {
          int v60 = 3;
          int v61 = v3 % v60;
          int v62;
          v62 = v0;
          switch (v61) {
            case 0:
              {
              int v63 = 2;
              int v64 = v0 + v63;
              v62 = v64;
              break;
            }
            default:
              {
              v62 = v0;
              break;
            }
            case 1:
              {
              int v65 = 0;
              v62 = v65;
              break;
            }
          }
          v54 = v62;
          break;
        }
        default:
          {
          int v66 = 0;
          bool v67 = v2 != v66;
          int v68;
          if (v67) {
            int v69 = 1;
            v68 = v69;
          } else {
            int v70 = 3;
            int v71 = v0 + v70;
            v68 = v71;
          }
          v54 = v68;
          break;
        }
      }
      v8 = v54;
      break;
    }
  }
  int v72 = 0;
  bool v73 = v2 != v72;
  int v74 = v73 ? v5 : v8;
  return;
}

kernel void kernel_main(device int* v75 [[buffer(0)]], device int* v76 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v77 = static_cast<int>(__simt_tid3.x);
  int v78 = 0;
  int v79 = v78 + v77;
  int v80 = v76[v79];
  int v81 = 4;
  int v82 = v81 + v77;
  int v83 = v76[v82];
  helper0(v77, v75, v80, v83, static_cast<int>(__simt_tid3.x));
  int v84 = 2;
  int v85 = 8;
  int v86 = v85 + v77;
  int v87 = v76[v86];
  uint v88 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v89 = (int)(v88);
  int v90;
  v90 = v89;
  switch (v87) {
    default:
      {
      int v91 = 12;
      int v92 = v91 + v77;
      int v93 = v76[v92];
      int v94 = 4;
      int v95 = v77 + v94;
      int v96;
      v96 = v95;
      switch (v93) {
        default:
          {
          int v97 = 16;
          int v98 = v97 + v77;
          int v99 = v76[v98];
          int v100 = 0;
          bool v101 = v99 != v100;
          int v102;
          if (v101) {
            int v103 = 3;
            v102 = v103;
          } else {
            v102 = v77;
          }
          v96 = v102;
          break;
        }
        case 0:
          {
          int v104 = 20;
          int v105 = v104 + v77;
          int v106 = v76[v105];
          int v107 = 0;
          bool v108 = v106 != v107;
          int v109;
          if (v108) {
            v109 = v77;
          } else {
            v109 = v77;
          }
          v96 = v109;
          break;
        }
      }
      bool v110 = true;
      v90 = v96;
      break;
    }
    case 0:
      {
      int v111 = 4;
      v90 = v111;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 24; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
