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
      int v22 = 3;
      int v23 = v3 % v22;
      uint v24 = simt_subgroup_id(__simt_tid);
      int v25 = (int)(v24);
      int v26;
      v26 = v25;
      switch (v23) {
        case 0:
          {
          int v27 = 1;
          int v28 = v0 + v27;
          v26 = v28;
          break;
        }
        default:
          {
          int v29 = 3;
          int v30 = v0 + v29;
          v26 = v30;
          break;
        }
        case 1:
          {
          int v31 = 2;
          v26 = v31;
          break;
        }
        case 2:
          {
          v26 = v0;
          break;
        }
      }
      int v32 = 4;
      int v33 = v0 + v32;
      int v34 = 1;
      int v35 = v16 + v34;
      v15 = v26;
      v16 = v35;
    }
    int v36 = 1;
    int v37 = v7 + v36;
    v6 = v15;
    v7 = v37;
  }
  bool v38 = true;
  int v39 = simt_wave_count_bits(v38);
  int v40 = 0;
  int v41 = v40 + v0;
  v1[v41] = v39;
  return;
}

kernel void kernel_main(device int* v42 [[buffer(0)]], device int* v43 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v44 = static_cast<int>(__simt_tid3.x);
  int v45 = 0;
  int v46 = v45 + v44;
  int v47 = v43[v46];
  int v48 = 4;
  int v49 = v48 + v44;
  int v50 = v43[v49];
  helper0(v44, v42, v47, v50, static_cast<int>(__simt_tid3.x));
  int v51 = 0;
  int v52 = 8;
  int v53 = v52 + v44;
  int v54 = v43[v53];
  int v55 = 4;
  int v56;
  v56 = v55;
  switch (v54) {
    default:
      {
      int v57 = 12;
      int v58 = v57 + v44;
      int v59 = v43[v58];
      int v60 = 3;
      int v61;
      v61 = v60;
      switch (v59) {
        case 0:
          {
          int v62 = 0;
          int v63 = 0;
          int v64;
          int v65;
          v64 = v62;
          v65 = v63;
          while (true) {
            int v66 = 4;
            int v67 = v65 * v66;
            int v68 = v67 + v44;
            int v69 = 16;
            int v70 = v69 + v68;
            int v71 = v43[v70];
            int v72 = 0;
            bool v73 = v71 != v72;
            v64 = v64;
            v65 = v65;
            if (!v73) break;
            int v74 = v64 + v65;
            int v75 = 1;
            int v76 = v65 + v75;
            v64 = v74;
            v65 = v76;
          }
          bool v77 = true;
          v61 = v64;
          break;
        }
        default:
          {
          int v78 = 36;
          int v79 = v78 + v44;
          int v80 = v43[v79];
          int v81 = 1;
          int v82 = v44 + v81;
          int v83;
          v83 = v82;
          switch (v80) {
            case 0:
              {
              int v84 = 3;
              int v85 = v44 + v84;
              v83 = v85;
              break;
            }
            case 1:
              {
              int v86 = 4;
              int v87 = v44 + v86;
              v83 = v87;
              break;
            }
            default:
              {
              int v88 = 2;
              v83 = v88;
              break;
            }
          }
          bool v89 = true;
          v61 = v83;
          break;
        }
        case 1:
          {
          int v90 = 40;
          int v91 = v90 + v44;
          int v92 = v43[v91];
          int v93 = 0;
          int v94 = v44 + v93;
          int v95;
          v95 = v94;
          switch (v92) {
            case 0:
              {
              int v96 = 0;
              v95 = v96;
              break;
            }
            default:
              {
              int v97 = 0;
              int v98 = v44 + v97;
              v95 = v98;
              break;
            }
          }
          bool v99 = true;
          v61 = v95;
          break;
        }
        case 2:
          {
          int v100 = 44;
          int v101 = v100 + v44;
          int v102 = v43[v101];
          int v103 = 0;
          bool v104 = v102 != v103;
          int v105;
          if (v104) {
            v105 = v44;
          } else {
            int v106 = 3;
            v105 = v106;
          }
          v61 = v105;
          break;
        }
      }
      bool v107 = true;
      v56 = v61;
      break;
    }
    case 0:
      {
      int v108 = 2;
      int v109 = v44 + v108;
      v56 = v109;
      break;
    }
  }
  bool v110 = true;
  int v111 = 16;
  int v112 = v111 + v44;
  bool v113 = true;
  int v114 = simt_wave_count_bits(v113);
  v42[v112] = v114;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 20; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 48; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
