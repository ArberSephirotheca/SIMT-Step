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
    uint v7 = simt_subgroup_id(__simt_tid);
    int v8 = (int)(v7);
    int v9;
    v9 = v8;
    switch (v3) {
      default:
        {
        int v10 = 2;
        int v11 = v3 % v10;
        int v12 = 2;
        int v13 = v0 + v12;
        int v14;
        v14 = v13;
        switch (v11) {
          case 0:
            {
            int v15 = 2;
            v14 = v15;
            break;
          }
          default:
            {
            int v16 = 0;
            int v17 = v0 + v16;
            v14 = v17;
            break;
          }
        }
        int v18 = 1;
        int v19 = v0 + v18;
        v9 = v14;
        break;
      }
      case 0:
        {
        int v20 = 4;
        int v21 = v0 + v20;
        v9 = v21;
        break;
      }
    }
    uint v22 = simt_subgroup_id(__simt_tid);
    int v23 = (int)(v22);
    v6 = v9;
  } else {
    int v24 = 3;
    int v25 = v3 % v24;
    int v26;
    v26 = v0;
    switch (v25) {
      case 0:
        {
        int v27 = 3;
        int v28 = v3 % v27;
        int v29 = 2;
        int v30 = v0 + v29;
        int v31;
        v31 = v30;
        switch (v28) {
          default:
            {
            int v32 = 2;
            int v33 = v0 + v32;
            v31 = v33;
            break;
          }
          case 0:
            {
            int v34 = 4;
            int v35 = v0 + v34;
            v31 = v35;
            break;
          }
          case 1:
            {
            int v36 = 0;
            int v37 = v0 + v36;
            v31 = v37;
            break;
          }
        }
        int v38 = 1;
        v26 = v31;
        break;
      }
      case 1:
        {
        v26 = v0;
        break;
      }
      default:
        {
        v26 = v0;
        break;
      }
    }
    uint v39 = simt_lane_id(__simt_tid);
    int v40 = (int)(v39);
    v6 = v26;
  }
  bool v41 = true;
  int v42 = simt_wave_count_bits(v41);
  int v43 = 0;
  int v44 = v43 + v0;
  v1[v44] = v42;
  return;
}

kernel void kernel_main(device int* v45 [[buffer(0)]], device int* v46 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v47 = static_cast<int>(__simt_tid3.x);
  int v48 = 0;
  int v49 = v48 + v47;
  int v50 = v46[v49];
  int v51 = 4;
  int v52 = v51 + v47;
  int v53 = v46[v52];
  helper0(v47, v45, v50, v53, static_cast<int>(__simt_tid3.x));
  uint v54 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v55 = (int)(v54);
  int v56 = 8;
  int v57 = v56 + v47;
  int v58 = v46[v57];
  int v59 = 0;
  bool v60 = v58 != v59;
  int v61;
  if (v60) {
    int v62 = 12;
    int v63 = v62 + v47;
    int v64 = v46[v63];
    int v65 = 0;
    bool v66 = v64 != v65;
    int v67;
    if (v66) {
      int v68 = 16;
      int v69 = v68 + v47;
      int v70 = v46[v69];
      int v71 = 4;
      int v72;
      v72 = v71;
      switch (v70) {
        case 0:
          {
          int v73 = 0;
          v72 = v73;
          break;
        }
        case 1:
          {
          v72 = v47;
          break;
        }
        default:
          {
          v72 = v47;
          break;
        }
      }
      bool v74 = true;
      v67 = v72;
    } else {
      int v75 = 20;
      int v76 = v75 + v47;
      int v77 = v46[v76];
      int v78 = 0;
      bool v79 = v77 != v78;
      int v80;
      if (v79) {
        int v81 = 1;
        int v82 = v47 + v81;
        v80 = v82;
      } else {
        uint v83 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v84 = (int)(v83);
        v80 = v84;
      }
      v67 = v80;
    }
    v61 = v67;
  } else {
    int v85 = 24;
    int v86 = v85 + v47;
    int v87 = v46[v86];
    int v88 = 0;
    bool v89 = v87 != v88;
    int v90;
    if (v89) {
      int v91 = 28;
      int v92 = v91 + v47;
      int v93 = v46[v92];
      int v94 = 0;
      bool v95 = v93 != v94;
      int v96;
      if (v95) {
        int v97 = 2;
        v96 = v97;
      } else {
        uint v98 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v99 = (int)(v98);
        v96 = v99;
      }
      v90 = v96;
    } else {
      uint v100 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v101 = (int)(v100);
      v90 = v101;
    }
    v61 = v90;
  }
  int v102 = 16;
  int v103 = v102 + v47;
  bool v104 = true;
  int v105 = simt_wave_count_bits(v104);
  v45[v103] = v105;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 32; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
