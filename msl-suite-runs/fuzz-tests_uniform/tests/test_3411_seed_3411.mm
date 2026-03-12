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
    int v13 = 3;
    int v14 = v3 % v13;
    int v15 = 3;
    int v16;
    v16 = v15;
    switch (v14) {
      case 0:
        {
        int v17 = 3;
        int v18;
        v18 = v17;
        switch (v3) {
          default:
            {
            v18 = v0;
            break;
          }
          case 0:
            {
            int v19 = 2;
            v18 = v19;
            break;
          }
        }
        v16 = v18;
        break;
      }
      case 1:
        {
        int v20 = 3;
        int v21 = v3 % v20;
        int v22;
        v22 = v0;
        switch (v21) {
          case 0:
            {
            int v23 = 2;
            v22 = v23;
            break;
          }
          default:
            {
            v22 = v0;
            break;
          }
          case 1:
            {
            int v24 = 3;
            int v25 = v0 + v24;
            v22 = v25;
            break;
          }
          case 2:
            {
            int v26 = 1;
            v22 = v26;
            break;
          }
        }
        v16 = v22;
        break;
      }
      default:
        {
        int v27 = 4;
        int v28 = v3 % v27;
        int v29;
        v29 = v0;
        switch (v28) {
          default:
            {
            int v30 = 2;
            int v31 = v0 + v30;
            v29 = v31;
            break;
          }
          case 0:
            {
            int v32 = 3;
            int v33 = v0 + v32;
            v29 = v33;
            break;
          }
          case 1:
            {
            int v34 = 4;
            v29 = v34;
            break;
          }
          case 2:
            {
            int v35 = 3;
            v29 = v35;
            break;
          }
        }
        v16 = v29;
        break;
      }
      case 2:
        {
        int v36 = 2;
        int v37 = v3 % v36;
        int v38 = 0;
        int v39 = v0 + v38;
        int v40;
        v40 = v39;
        switch (v37) {
          case 0:
            {
            int v41 = 2;
            int v42 = v0 + v41;
            v40 = v42;
            break;
          }
          default:
            {
            int v43 = 2;
            int v44 = v0 + v43;
            v40 = v44;
          }
          case 1:
            {
            v40 = v0;
            break;
          }
        }
        int v45 = 1;
        v16 = v40;
        break;
      }
    }
    int v46 = 1;
    int v47 = v7 + v46;
    v6 = v16;
    v7 = v47;
  }
  bool v48 = true;
  int v49 = simt_wave_count_bits(v48);
  int v50 = 0;
  int v51 = v50 + v0;
  v1[v51] = v49;
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
    int v70;
    v70 = v54;
    switch (v69) {
      default:
        {
        int v71 = 16;
        int v72 = v71 + v54;
        int v73 = v53[v72];
        int v74 = 0;
        bool v75 = v73 != v74;
        int v76;
        if (v75) {
          int v77 = 0;
          int v78 = v54 + v77;
          v76 = v78;
        } else {
          int v79 = 0;
          v76 = v79;
        }
        v70 = v76;
        break;
      }
      case 0:
        {
        int v80 = 20;
        int v81 = v80 + v54;
        int v82 = v53[v81];
        int v83 = 0;
        bool v84 = v82 != v83;
        int v85;
        if (v84) {
          int v86 = 2;
          v85 = v86;
        } else {
          int v87 = 2;
          v85 = v87;
        }
        v70 = v85;
        break;
      }
    }
    bool v88 = true;
    v66 = v70;
  } else {
    int v89 = 24;
    int v90 = v89 + v54;
    int v91 = v53[v90];
    int v92 = 0;
    bool v93 = v91 != v92;
    int v94;
    if (v93) {
      int v95 = 28;
      int v96 = v95 + v54;
      int v97 = v53[v96];
      uint v98 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v99 = (int)(v98);
      int v100;
      v100 = v99;
      switch (v97) {
        default:
          {
          v100 = v54;
          break;
        }
        case 0:
          {
          v100 = v54;
          break;
        }
      }
      bool v101 = true;
      v94 = v100;
    } else {
      int v102 = 32;
      int v103 = v102 + v54;
      int v104 = v53[v103];
      int v105 = 0;
      bool v106 = v104 != v105;
      int v107;
      if (v106) {
        uint v108 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v109 = (int)(v108);
        v107 = v109;
      } else {
        int v110 = 0;
        v107 = v110;
      }
      v94 = v107;
    }
    v66 = v94;
  }
  int v111 = 16;
  int v112 = v111 + v54;
  bool v113 = true;
  int v114 = simt_wave_count_bits(v113);
  v52[v112] = v114;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 36; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
