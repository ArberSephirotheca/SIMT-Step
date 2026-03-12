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
  bool v5 = v2 != v4;
  int v6;
  if (v5) {
    int v7 = 2;
    int v8 = v3 % v7;
    int v9;
    v9 = v0;
    switch (v8) {
      default:
        {
        int v10 = 0;
        bool v11 = v2 != v10;
        int v12;
        if (v11) {
          v12 = v0;
        } else {
          int v13 = 3;
          v12 = v13;
        }
        int v14 = 1;
        v9 = v12;
      }
      case 0:
        {
        int v15 = 3;
        int v16 = v3 % v15;
        int v17 = 2;
        int v18;
        v18 = v17;
        switch (v16) {
          case 0:
            {
            int v19 = 0;
            v18 = v19;
            break;
          }
          case 1:
            {
            int v20 = 2;
            v18 = v20;
            break;
          }
          default:
            {
            int v21 = 3;
            v18 = v21;
            break;
          }
        }
        v9 = v18;
        break;
      }
    }
    int v22 = 1;
    v6 = v9;
  } else {
    v6 = v0;
  }
  bool v23 = true;
  int v24 = simt_wave_count_bits(v23);
  int v25 = 0;
  int v26 = v25 + v0;
  v1[v26] = v24;
  return;
}

kernel void kernel_main(device int* v27 [[buffer(0)]], device int* v28 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v29 = static_cast<int>(__simt_tid3.x);
  int v30 = 0;
  int v31 = v30 + v29;
  int v32 = v28[v31];
  int v33 = 4;
  int v34 = v33 + v29;
  int v35 = v28[v34];
  helper0(v29, v27, v32, v35, static_cast<int>(__simt_tid3.x));
  int v36 = 2;
  int v37 = 4;
  int v38 = 8;
  int v39 = v38 + v29;
  int v40 = v28[v39];
  int v41 = 0;
  bool v42 = v40 != v41;
  int v43;
  if (v42) {
    int v44 = 12;
    int v45 = v44 + v29;
    int v46 = v28[v45];
    uint v47 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v48 = (int)(v47);
    int v49;
    v49 = v48;
    switch (v46) {
      default:
        {
        int v50 = 16;
        int v51 = v50 + v29;
        int v52 = v28[v51];
        int v53 = 0;
        bool v54 = v52 != v53;
        int v55;
        if (v54) {
          int v56 = 1;
          int v57 = v29 + v56;
          v55 = v57;
        } else {
          v55 = v29;
        }
        v49 = v55;
        break;
      }
      case 0:
        {
        int v58 = 0;
        int v59 = 0;
        int v60;
        int v61;
        v60 = v58;
        v61 = v59;
        while (true) {
          int v62 = 4;
          int v63 = v61 * v62;
          int v64 = v63 + v29;
          int v65 = 20;
          int v66 = v65 + v64;
          int v67 = v28[v66];
          int v68 = 0;
          bool v69 = v67 != v68;
          v60 = v60;
          v61 = v61;
          if (!v69) break;
          int v70 = v60 + v61;
          int v71 = 1;
          int v72 = v61 + v71;
          v60 = v70;
          v61 = v72;
        }
        bool v73 = true;
        v49 = v60;
        break;
      }
      case 1:
        {
        v49 = v29;
        break;
      }
    }
    bool v74 = true;
    v43 = v49;
  } else {
    int v75 = 40;
    int v76 = v75 + v29;
    int v77 = v28[v76];
    uint v78 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v79 = (int)(v78);
    int v80;
    v80 = v79;
    switch (v77) {
      default:
        {
        int v81 = 0;
        int v82 = 0;
        int v83;
        int v84;
        v83 = v81;
        v84 = v82;
        while (true) {
          int v85 = 4;
          int v86 = v84 * v85;
          int v87 = v86 + v29;
          int v88 = 44;
          int v89 = v88 + v87;
          int v90 = v28[v89];
          int v91 = 0;
          bool v92 = v90 != v91;
          v83 = v83;
          v84 = v84;
          if (!v92) break;
          int v93 = v83 + v84;
          int v94 = 1;
          int v95 = v84 + v94;
          v83 = v93;
          v84 = v95;
        }
        bool v96 = true;
        v80 = v83;
        break;
      }
      case 0:
        {
        int v97 = 64;
        int v98 = v97 + v29;
        int v99 = v28[v98];
        int v100 = 0;
        bool v101 = v99 != v100;
        int v102;
        if (v101) {
          int v103 = 3;
          int v104 = v29 + v103;
          v102 = v104;
        } else {
          int v105 = 3;
          v102 = v105;
        }
        v80 = v102;
        break;
      }
    }
    bool v106 = true;
    v43 = v80;
  }
  int v107 = 16;
  int v108 = v107 + v29;
  bool v109 = true;
  int v110 = simt_wave_count_bits(v109);
  v27[v108] = v110;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
