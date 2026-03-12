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
  int v5 = 0;
  bool v6 = v2 != v5;
  int v7;
  if (v6) {
    uint v8 = simt_subgroup_id(__simt_tid);
    int v9 = (int)(v8);
    int v10;
    v10 = v9;
    switch (v3) {
      default:
        {
        v10 = v0;
        break;
      }
      case 0:
        {
        int v11 = 4;
        int v12 = v3 % v11;
        int v13;
        v13 = v0;
        switch (v12) {
          case 0:
            {
            int v14 = 0;
            int v15 = v0 + v14;
            v13 = v15;
            break;
          }
          case 1:
            {
            v13 = v0;
          }
          case 2:
            {
            int v16 = 0;
            int v17 = v0 + v16;
            v13 = v17;
            break;
          }
          default:
            {
            v13 = v0;
            break;
          }
        }
        v10 = v13;
        break;
      }
    }
    v7 = v10;
  } else {
    int v18 = 0;
    int v19 = 0;
    int v20;
    int v21;
    v20 = v18;
    v21 = v19;
    while (true) {
      int v22 = 4;
      int v23 = v3 % v22;
      int v24 = 1;
      int v25 = v23 + v24;
      bool v26 = v21 < v25;
      v20 = v20;
      v21 = v21;
      if (!v26) break;
      int v27 = 0;
      int v28 = 0;
      int v29;
      int v30;
      v29 = v27;
      v30 = v28;
      while (true) {
        int v31 = 4;
        int v32 = v3 % v31;
        int v33 = 1;
        int v34 = v32 + v33;
        bool v35 = v30 < v34;
        v29 = v29;
        v30 = v30;
        if (!v35) break;
        uint v36 = simt_lane_id(__simt_tid);
        int v37 = (int)(v36);
        int v38 = 1;
        int v39 = v30 + v38;
        v29 = v37;
        v30 = v39;
      }
      uint v40 = simt_lane_id(__simt_tid);
      int v41 = (int)(v40);
      int v42 = 1;
      int v43 = v21 + v42;
      v20 = v29;
      v21 = v43;
    }
    int v44 = 4;
    v7 = v20;
  }
  bool v45 = true;
  int v46 = simt_wave_count_bits(v45);
  int v47 = 0;
  int v48 = v47 + v0;
  v1[v48] = v46;
  int v49 = 0;
  bool v50 = v2 != v49;
  int v51 = v50 ? v4 : v7;
  return;
}

kernel void kernel_main(device int* v52 [[buffer(0)]], device int* v53 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v54 = static_cast<int>(__simt_tid3.x);
  int v55 = 0;
  int v56 = v55 + v54;
  int v57 = v53[v56];
  int v58 = 4;
  int v59 = v58 + v54;
  int v60 = v53[v59];
  helper0(v54, v52, v57, v60, static_cast<int>(__simt_tid3.x));
  int v61 = 8;
  int v62 = v61 + v54;
  int v63 = v53[v62];
  int v64 = 0;
  bool v65 = v63 != v64;
  int v66;
  if (v65) {
    int v67 = 12;
    int v68 = v67 + v54;
    int v69 = v53[v68];
    int v70 = 0;
    bool v71 = v69 != v70;
    int v72;
    if (v71) {
      int v73 = 2;
      int v74 = v54 + v73;
      v72 = v74;
    } else {
      int v75 = 16;
      int v76 = v75 + v54;
      int v77 = v53[v76];
      int v78 = 0;
      bool v79 = v77 != v78;
      int v80;
      if (v79) {
        uint v81 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v82 = (int)(v81);
        v80 = v82;
      } else {
        v80 = v54;
      }
      v72 = v80;
    }
    v66 = v72;
  } else {
    int v83 = 20;
    int v84 = v83 + v54;
    int v85 = v53[v84];
    int v86 = 4;
    int v87 = v54 + v86;
    int v88;
    v88 = v87;
    switch (v85) {
      default:
        {
        int v89 = 0;
        v88 = v89;
        break;
      }
      case 0:
        {
        int v90 = 24;
        int v91 = v90 + v54;
        int v92 = v53[v91];
        int v93 = 0;
        bool v94 = v92 != v93;
        int v95;
        if (v94) {
          int v96 = 4;
          int v97 = v54 + v96;
          v95 = v97;
        } else {
          v95 = v54;
        }
        v88 = v95;
        break;
      }
    }
    bool v98 = true;
    v66 = v88;
  }
  int v99 = 16;
  int v100 = v99 + v54;
  bool v101 = true;
  int v102 = simt_wave_count_bits(v101);
  v52[v100] = v102;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
