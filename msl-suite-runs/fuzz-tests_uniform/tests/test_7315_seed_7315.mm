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
    int v7 = 3;
    int v8 = v3 % v7;
    int v9 = 1;
    int v10;
    v10 = v9;
    switch (v8) {
      default:
        {
        int v11 = 0;
        bool v12 = v2 != v11;
        int v13;
        if (v12) {
          int v14 = 1;
          int v15 = v0 + v14;
          v13 = v15;
        } else {
          v13 = v0;
        }
        int v16 = 0;
        v10 = v13;
      }
      case 0:
        {
        int v17 = 2;
        int v18 = v3 % v17;
        int v19;
        v19 = v0;
        switch (v18) {
          case 0:
            {
            v19 = v0;
            break;
          }
          default:
            {
            v19 = v0;
            break;
          }
          case 1:
            {
            int v20 = 2;
            int v21 = v0 + v20;
            v19 = v21;
            break;
          }
        }
        int v22 = 3;
        int v23 = v0 + v22;
        v10 = v19;
        break;
      }
      case 1:
        {
        int v24 = 0;
        int v25 = 0;
        int v26;
        int v27;
        v26 = v24;
        v27 = v25;
        while (true) {
          int v28 = 4;
          int v29 = v3 % v28;
          int v30 = 1;
          int v31 = v29 + v30;
          bool v32 = v27 < v31;
          v26 = v26;
          v27 = v27;
          if (!v32) break;
          int v33 = 0;
          int v34 = v0 + v33;
          int v35 = 1;
          int v36 = v27 + v35;
          v26 = v34;
          v27 = v36;
          continue;
          ;
        }
        int v37 = 1;
        int v38 = v0 + v37;
        v10 = v26;
        break;
      }
    }
    v6 = v10;
  } else {
    int v39 = 0;
    bool v40 = v2 != v39;
    int v41;
    if (v40) {
      int v42 = 0;
      bool v43 = v2 != v42;
      int v44;
      if (v43) {
        v44 = v0;
      } else {
        v44 = v0;
      }
      int v45 = 3;
      int v46 = v0 + v45;
      v41 = v44;
    } else {
      int v47 = 0;
      bool v48 = v2 != v47;
      int v49;
      if (v48) {
        v49 = v0;
      } else {
        int v50 = 1;
        v49 = v50;
      }
      uint v51 = simt_subgroup_id(__simt_tid);
      int v52 = (int)(v51);
      v41 = v49;
    }
    v6 = v41;
  }
  bool v53 = true;
  int v54 = simt_wave_count_bits(v53);
  int v55 = 0;
  int v56 = v55 + v0;
  v1[v56] = v54;
  return;
}

kernel void kernel_main(device int* v57 [[buffer(0)]], device int* v58 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v59 = static_cast<int>(__simt_tid3.x);
  int v60 = 0;
  int v61 = v60 + v59;
  int v62 = v58[v61];
  int v63 = 4;
  int v64 = v63 + v59;
  int v65 = v58[v64];
  helper0(v59, v57, v62, v65, static_cast<int>(__simt_tid3.x));
  int v66 = 8;
  int v67 = v66 + v59;
  int v68 = v58[v67];
  int v69 = 0;
  bool v70 = v68 != v69;
  int v71;
  if (v70) {
    int v72 = 12;
    int v73 = v72 + v59;
    int v74 = v58[v73];
    int v75 = 2;
    int v76 = v59 + v75;
    int v77;
    v77 = v76;
    switch (v74) {
      case 0:
        {
        int v78 = 2;
        int v79 = v59 + v78;
        v77 = v79;
        break;
      }
      case 1:
        {
        int v80 = 0;
        int v81 = v59 + v80;
        v77 = v81;
        break;
      }
      case 2:
        {
        int v82 = 16;
        int v83 = v82 + v59;
        int v84 = v58[v83];
        int v85 = 0;
        bool v86 = v84 != v85;
        int v87;
        if (v86) {
          int v88 = 0;
          int v89 = v59 + v88;
          v87 = v89;
        } else {
          int v90 = 2;
          int v91 = v59 + v90;
          v87 = v91;
        }
        v77 = v87;
        break;
      }
      default:
        {
        int v92 = 20;
        int v93 = v92 + v59;
        int v94 = v58[v93];
        int v95 = 0;
        bool v96 = v94 != v95;
        int v97;
        if (v96) {
          int v98 = 0;
          int v99 = v59 + v98;
          v97 = v99;
        } else {
          int v100 = 1;
          v97 = v100;
        }
        v77 = v97;
        break;
      }
    }
    bool v101 = true;
    v71 = v77;
  } else {
    uint v102 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v103 = (int)(v102);
    v71 = v103;
  }
  int v104 = 16;
  int v105 = v104 + v59;
  bool v106 = true;
  int v107 = simt_wave_count_bits(v106);
  v57[v105] = v107;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
