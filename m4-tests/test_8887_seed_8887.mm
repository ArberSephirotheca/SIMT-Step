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
  uint v8 = simt_lane_id(__simt_tid);
  int v9 = (int)(v8);
  int v10;
  v10 = v9;
  switch (v3) {
    default:
      {
      int v11 = 0;
      bool v12 = v2 != v11;
      int v13;
      if (v12) {
        int v14 = 1;
        v13 = v14;
      } else {
        int v15 = 0;
        int v16 = v0 + v15;
        int v17;
        v17 = v16;
        switch (v3) {
          default:
            {
            int v18 = 0;
            v17 = v18;
            break;
          }
          case 0:
            {
            v17 = v0;
            break;
          }
        }
        v13 = v17;
      }
      v10 = v13;
    }
    case 0:
      {
      int v19 = 3;
      int v20 = v3 % v19;
      int v21 = 4;
      int v22;
      v22 = v21;
      switch (v20) {
        case 0:
          {
          int v23 = 3;
          int v24 = v3 % v23;
          int v25 = 1;
          int v26;
          v26 = v25;
          switch (v24) {
            case 0:
              {
              v26 = v0;
              break;
            }
            case 1:
              {
              int v27 = 3;
              int v28 = v0 + v27;
              v26 = v28;
              break;
            }
            default:
              {
              int v29 = 4;
              v26 = v29;
              break;
            }
            case 2:
              {
              int v30 = 3;
              int v31 = v0 + v30;
              v26 = v31;
              break;
            }
          }
          v22 = v26;
        }
        case 1:
          {
          int v32 = 0;
          bool v33 = v2 != v32;
          int v34;
          if (v33) {
            v34 = v0;
          } else {
            int v35 = 1;
            int v36 = v0 + v35;
            v34 = v36;
          }
          v22 = v34;
          break;
        }
        default:
          {
          int v37 = 4;
          int v38 = v3 % v37;
          int v39;
          v39 = v0;
          switch (v38) {
            default:
              {
              int v40 = 4;
              int v41 = v0 + v40;
              v39 = v41;
              break;
            }
            case 0:
              {
              v39 = v0;
              break;
            }
            case 1:
              {
              int v42 = 3;
              int v43 = v0 + v42;
              v39 = v43;
              break;
            }
            case 2:
              {
              int v44 = 1;
              int v45 = v0 + v44;
              v39 = v45;
              break;
            }
          }
          v22 = v39;
          break;
        }
      }
      v10 = v22;
      break;
    }
  }
  int v46 = 0;
  bool v47 = v2 != v46;
  int v48 = v47 ? v5 : v10;
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
  int v58 = 4;
  int v59 = v51 + v58;
  int v60 = 8;
  int v61 = v60 + v51;
  int v62 = v50[v61];
  int v63 = 0;
  int v64 = v51 + v63;
  int v65;
  v65 = v64;
  switch (v62) {
    case 0:
      {
      v65 = v51;
    }
    case 1:
      {
      int v66 = 12;
      int v67 = v66 + v51;
      int v68 = v50[v67];
      int v69 = 0;
      bool v70 = v68 != v69;
      int v71;
      if (v70) {
        int v72 = 16;
        int v73 = v72 + v51;
        int v74 = v50[v73];
        int v75 = 0;
        bool v76 = v74 != v75;
        int v77;
        if (v76) {
          v77 = v51;
        } else {
          v77 = v51;
        }
        v71 = v77;
      } else {
        int v78 = 20;
        int v79 = v78 + v51;
        int v80 = v50[v79];
        int v81 = 0;
        bool v82 = v80 != v81;
        int v83;
        if (v82) {
          v83 = v51;
        } else {
          int v84 = 3;
          v83 = v84;
        }
        v71 = v83;
      }
      v65 = v71;
      break;
    }
    default:
      {
      int v85 = 24;
      int v86 = v85 + v51;
      int v87 = v50[v86];
      int v88 = 0;
      bool v89 = v87 != v88;
      int v90;
      if (v89) {
        v90 = v51;
      } else {
        int v91 = 4;
        v90 = v91;
      }
      v65 = v90;
      break;
    }
  }
  bool v92 = true;
  int v93 = 16;
  int v94 = v93 + v51;
  bool v95 = true;
  int v96 = simt_wave_count_bits(v95);
  v49[v94] = v96;
  uint v97 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v98 = (int)(v97);
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 28; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
