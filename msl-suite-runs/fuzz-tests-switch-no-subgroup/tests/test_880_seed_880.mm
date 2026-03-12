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
      v12 = v0;
      break;
    }
    case 1:
      {
      int v13 = 4;
      int v14 = v3 % v13;
      int v15 = 3;
      int v16 = v0 + v15;
      int v17;
      v17 = v16;
      switch (v14) {
        default:
          {
          int v18 = 0;
          bool v19 = v2 != v18;
          int v20;
          if (v19) {
            int v21 = 1;
            int v22 = v0 + v21;
            v20 = v22;
          } else {
            int v23 = 1;
            v20 = v23;
          }
          v17 = v20;
          break;
        }
        case 0:
          {
          int v24 = 4;
          int v25 = v3 % v24;
          int v26;
          v26 = v0;
          switch (v25) {
            case 0:
              {
              v26 = v0;
              break;
            }
            case 1:
              {
              int v27 = 1;
              int v28 = v0 + v27;
              v26 = v28;
              break;
            }
            default:
              {
              int v29 = 3;
              v26 = v29;
              break;
            }
            case 2:
              {
              v26 = v0;
              break;
            }
          }
          v17 = v26;
          break;
        }
        case 1:
          {
          int v30 = 3;
          int v31 = v3 % v30;
          int v32 = 2;
          int v33 = v0 + v32;
          int v34;
          v34 = v33;
          switch (v31) {
            default:
              {
              int v35 = 4;
              int v36 = v0 + v35;
              v34 = v36;
              break;
            }
            case 0:
              {
              v34 = v0;
              break;
            }
            case 1:
              {
              int v37 = 3;
              v34 = v37;
              break;
            }
            case 2:
              {
              int v38 = 2;
              v34 = v38;
              break;
            }
          }
          v17 = v34;
          break;
        }
        case 2:
          {
          int v39 = 0;
          bool v40 = v2 != v39;
          int v41;
          if (v40) {
            int v42 = 4;
            v41 = v42;
          } else {
            int v43 = 4;
            int v44 = v0 + v43;
            v41 = v44;
          }
          v17 = v41;
          break;
        }
      }
      v12 = v17;
      break;
    }
    case 2:
      {
      int v45 = 4;
      v12 = v45;
      break;
    }
    default:
      {
      int v46 = 3;
      int v47 = v0 + v46;
      v12 = v47;
      break;
    }
  }
  int v48 = 0;
  bool v49 = v2 != v48;
  int v50 = v49 ? v5 : v12;
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
  int v60 = 0;
  bool v61 = v56 != v60;
  if (v61) {
  } else {
    int v62 = 8;
    int v63 = v62 + v53;
    int v64 = v52[v63];
    int v65 = 0;
    bool v66 = v64 != v65;
    if (v66) {
      int v67 = 3;
      int v68 = v53 % v67;
      int v69 = 4;
      int v70;
      v70 = v69;
      switch (v68) {
        default:
          {
          int v71 = 1;
          int v72 = v70 + v71;
          v70 = v72;
          break;
        }
        case 0:
          {
          int v73 = 2;
          int v74 = v70 + v73;
          v70 = v74;
          break;
        }
        case 1:
          {
          int v75 = 3;
          int v76 = v70 + v75;
          v70 = v76;
          break;
        }
      }
      helper0(v53, v51, v56, v59, static_cast<int>(__simt_tid3.x));
    } else {
    }
  }
  int v77 = 12;
  int v78 = v77 + v53;
  int v79 = v52[v78];
  int v80 = 0;
  bool v81 = v79 != v80;
  int v82;
  if (v81) {
    uint v83 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v84 = (int)(v83);
    v82 = v84;
  } else {
    uint v85 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v86 = (int)(v85);
    v82 = v86;
  }
  int v87 = 16;
  int v88 = v87 + v53;
  bool v89 = true;
  int v90 = simt_wave_count_bits(v89);
  v51[v88] = v90;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 16; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
