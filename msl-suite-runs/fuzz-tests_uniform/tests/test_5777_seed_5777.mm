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
  uint v4 = simt_lane_id(__simt_tid);
  int v5 = (int)(v4);
  int v6;
  v6 = v5;
  switch (v3) {
    default:
      {
      int v7 = 2;
      int v8 = v3 % v7;
      int v9 = 4;
      int v10 = v0 + v9;
      int v11;
      v11 = v10;
      switch (v8) {
        case 0:
          {
          int v12 = 2;
          int v13 = v3 % v12;
          int v14 = 0;
          int v15;
          v15 = v14;
          switch (v13) {
            default:
              {
              v15 = v0;
              break;
            }
            case 0:
              {
              int v16 = 3;
              v15 = v16;
              break;
            }
          }
          int v17 = 2;
          v11 = v15;
          break;
        }
        default:
          {
          int v18;
          v18 = v0;
          switch (v3) {
            default:
              {
              v18 = v0;
              break;
            }
            case 0:
              {
              int v19 = 1;
              v18 = v19;
              break;
            }
          }
          int v20 = 2;
          int v21 = v0 + v20;
          v11 = v18;
          break;
        }
      }
      int v22 = 0;
      v6 = v11;
      break;
    }
    case 0:
      {
      int v23 = 0;
      bool v24 = v2 != v23;
      int v25;
      if (v24) {
        int v26 = 0;
        int v27 = 0;
        int v28;
        int v29;
        v28 = v26;
        v29 = v27;
        while (true) {
          int v30 = 4;
          int v31 = v3 % v30;
          int v32 = 1;
          int v33 = v31 + v32;
          bool v34 = v29 < v33;
          v28 = v28;
          v29 = v29;
          if (!v34) break;
          int v35 = 0;
          int v36 = v0 + v35;
          int v37 = 1;
          int v38 = v29 + v37;
          v28 = v36;
          v29 = v38;
        }
        int v39 = 0;
        int v40 = v0 + v39;
        v25 = v28;
      } else {
        v25 = v0;
      }
      int v41 = 4;
      int v42 = v0 + v41;
      v6 = v25;
      break;
    }
  }
  bool v43 = true;
  int v44 = simt_wave_count_bits(v43);
  int v45 = 0;
  int v46 = v45 + v0;
  v1[v46] = v44;
  return;
}

kernel void kernel_main(device int* v47 [[buffer(0)]], device int* v48 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v49 = static_cast<int>(__simt_tid3.x);
  int v50 = 0;
  int v51 = v50 + v49;
  int v52 = v48[v51];
  int v53 = 4;
  int v54 = v53 + v49;
  int v55 = v48[v54];
  helper0(v49, v47, v52, v55, static_cast<int>(__simt_tid3.x));
  int v56 = 8;
  int v57 = v56 + v49;
  int v58 = v48[v57];
  int v59 = 0;
  bool v60 = v58 != v59;
  int v61;
  if (v60) {
    int v62 = 12;
    int v63 = v62 + v49;
    int v64 = v48[v63];
    int v65 = 2;
    int v66;
    v66 = v65;
    switch (v64) {
      default:
        {
        int v67 = 16;
        int v68 = v67 + v49;
        int v69 = v48[v68];
        int v70 = 0;
        bool v71 = v69 != v70;
        int v72;
        if (v71) {
          v72 = v49;
        } else {
          v72 = v49;
        }
        v66 = v72;
        break;
      }
      case 0:
        {
        v66 = v49;
        break;
      }
      case 1:
        {
        int v73 = 20;
        int v74 = v73 + v49;
        int v75 = v48[v74];
        int v76 = 0;
        bool v77 = v75 != v76;
        int v78;
        if (v77) {
          int v79 = 0;
          int v80 = v49 + v79;
          v78 = v80;
        } else {
          int v81 = 2;
          v78 = v81;
        }
        v66 = v78;
        break;
      }
    }
    bool v82 = true;
    v61 = v66;
  } else {
    uint v83 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v84 = (int)(v83);
    v61 = v84;
  }
  int v85 = 16;
  int v86 = v85 + v49;
  bool v87 = true;
  int v88 = simt_wave_count_bits(v87);
  v47[v86] = v88;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 24; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
