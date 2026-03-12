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
  int v5 = 2;
  int v6 = v3 % v5;
  int v7 = 3;
  int v8 = v0 + v7;
  int v9;
  v9 = v8;
  switch (v6) {
    default:
      {
      int v10 = 1;
      v9 = v10;
      break;
    }
    case 0:
      {
      int v11 = 0;
      bool v12 = v2 != v11;
      int v13;
      if (v12) {
        int v14 = 0;
        int v15 = 0;
        int v16;
        int v17;
        v16 = v14;
        v17 = v15;
        while (true) {
          int v18 = 4;
          int v19 = v3 % v18;
          int v20 = 1;
          int v21 = v19 + v20;
          bool v22 = v17 < v21;
          v16 = v16;
          v17 = v17;
          if (!v22) break;
          int v23 = 2;
          int v24 = 1;
          int v25 = v17 + v24;
          v16 = v23;
          v17 = v25;
        }
        int v26 = 0;
        int v27 = v0 + v26;
        v13 = v16;
      } else {
        int v28 = 2;
        v13 = v28;
      }
      v9 = v13;
      break;
    }
  }
  bool v29 = true;
  int v30 = simt_wave_count_bits(v29);
  int v31 = 0;
  int v32 = v31 + v0;
  v1[v32] = v30;
  int v33 = 0;
  bool v34 = v2 != v33;
  int v35 = v34 ? v4 : v9;
  return;
}

kernel void kernel_main(device int* v36 [[buffer(0)]], device int* v37 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v38 = static_cast<int>(__simt_tid3.x);
  int v39 = 0;
  int v40 = v39 + v38;
  int v41 = v37[v40];
  int v42 = 4;
  int v43 = v42 + v38;
  int v44 = v37[v43];
  helper0(v38, v36, v41, v44, static_cast<int>(__simt_tid3.x));
  int v45 = 8;
  int v46 = v45 + v38;
  int v47 = v37[v46];
  int v48 = 0;
  bool v49 = v47 != v48;
  int v50;
  if (v49) {
    int v51 = 3;
    v50 = v51;
  } else {
    int v52 = 12;
    int v53 = v52 + v38;
    int v54 = v37[v53];
    int v55 = 4;
    int v56 = v38 + v55;
    int v57;
    v57 = v56;
    switch (v54) {
      default:
        {
        int v58 = 16;
        int v59 = v58 + v38;
        int v60 = v37[v59];
        int v61 = 0;
        bool v62 = v60 != v61;
        int v63;
        if (v62) {
          int v64 = 3;
          v63 = v64;
        } else {
          int v65 = 1;
          int v66 = v38 + v65;
          v63 = v66;
        }
        v57 = v63;
      }
      case 0:
        {
        int v67 = 20;
        int v68 = v67 + v38;
        int v69 = v37[v68];
        int v70 = 0;
        bool v71 = v69 != v70;
        int v72;
        if (v71) {
          v72 = v38;
        } else {
          v72 = v38;
        }
        v57 = v72;
        break;
      }
      case 1:
        {
        int v73 = 0;
        int v74 = 0;
        int v75;
        int v76;
        v75 = v73;
        v76 = v74;
        while (true) {
          int v77 = 4;
          int v78 = v76 * v77;
          int v79 = v78 + v38;
          int v80 = 24;
          int v81 = v80 + v79;
          int v82 = v37[v81];
          int v83 = 0;
          bool v84 = v82 != v83;
          v75 = v75;
          v76 = v76;
          if (!v84) break;
          int v85 = v75 + v76;
          int v86 = 1;
          int v87 = v76 + v86;
          v75 = v85;
          v76 = v87;
        }
        bool v88 = true;
        v57 = v75;
        break;
      }
    }
    bool v89 = true;
    v50 = v57;
  }
  int v90 = 16;
  int v91 = v90 + v38;
  bool v92 = true;
  int v93 = simt_wave_count_bits(v92);
  v36[v91] = v93;
  int v94 = 44;
  int v95 = v94 + v38;
  int v96 = v37[v95];
  int v97 = 0;
  int v98;
  v98 = v97;
  switch (v96) {
    case 0:
      {
      v98 = v38;
      break;
    }
    default:
      {
      int v99 = 4;
      int v100 = v38 + v99;
      v98 = v100;
    }
    case 1:
      {
      v98 = v38;
      break;
    }
    case 2:
      {
      int v101 = 48;
      int v102 = v101 + v38;
      int v103 = v37[v102];
      int v104 = 0;
      bool v105 = v103 != v104;
      int v106;
      if (v105) {
        int v107 = 52;
        int v108 = v107 + v38;
        int v109 = v37[v108];
        int v110 = 0;
        int v111 = v38 + v110;
        int v112;
        v112 = v111;
        switch (v109) {
          case 0:
            {
            int v113 = 1;
            v112 = v113;
            break;
          }
          case 1:
            {
            int v114 = 4;
            v112 = v114;
            break;
          }
          default:
            {
            v112 = v38;
            break;
          }
          case 2:
            {
            v112 = v38;
            break;
          }
        }
        bool v115 = true;
        v106 = v112;
      } else {
        v106 = v38;
      }
      v98 = v106;
      break;
    }
  }
  bool v116 = true;
  int v117 = 32;
  int v118 = v117 + v38;
  bool v119 = true;
  int v120 = simt_wave_count_bits(v119);
  v36[v118] = v120;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 36; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 56; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
