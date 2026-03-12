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
  int v8 = 3;
  int v9 = v3 % v8;
  uint v10 = simt_subgroup_id(__simt_tid);
  int v11 = (int)(v10);
  int v12;
  v12 = v11;
  switch (v9) {
    case 0:
      {
      int v13 = 2;
      int v14 = v0 + v13;
      v12 = v14;
    }
    default:
      {
      int v15 = 3;
      int v16 = v3 % v15;
      int v17;
      v17 = v0;
      switch (v16) {
        default:
          {
          v17 = v0;
          break;
        }
        case 0:
          {
          int v18 = 1;
          v17 = v18;
          break;
        }
        case 1:
          {
          int v19 = 0;
          bool v20 = v2 != v19;
          int v21;
          if (v20) {
            int v22 = 4;
            int v23 = v0 + v22;
            v21 = v23;
          } else {
            int v24 = 4;
            int v25 = v0 + v24;
            v21 = v25;
          }
          v17 = v21;
          break;
        }
      }
      int v26 = 0;
      v12 = v17;
      break;
    }
    case 1:
      {
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
        int v36 = 3;
        int v37 = v3 % v36;
        int v38;
        v38 = v0;
        switch (v37) {
          case 0:
            {
            int v39 = 1;
            v38 = v39;
            break;
          }
          default:
            {
            int v40 = 1;
            int v41 = v0 + v40;
            v38 = v41;
            break;
          }
          case 1:
            {
            v38 = v0;
            break;
          }
          case 2:
            {
            int v42 = 4;
            int v43 = v0 + v42;
            v38 = v43;
            break;
          }
        }
        int v44 = 3;
        int v45 = v0 + v44;
        int v46 = 1;
        int v47 = v30 + v46;
        v29 = v38;
        v30 = v47;
      }
      v12 = v29;
      break;
    }
  }
  bool v48 = true;
  int v49 = simt_wave_count_bits(v48);
  int v50 = 16;
  int v51 = v50 + v0;
  v1[v51] = v49;
  int v52 = 0;
  bool v53 = v2 != v52;
  int v54 = v53 ? v5 : v12;
  return;
}

kernel void kernel_main(device int* v55 [[buffer(0)]], device int* v56 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v57 = static_cast<int>(__simt_tid3.x);
  int v58 = 0;
  int v59 = v58 + v57;
  int v60 = v56[v59];
  int v61 = 4;
  int v62 = v61 + v57;
  int v63 = v56[v62];
  int v64 = 0;
  bool v65 = v60 != v64;
  if (v65) {
    int v66 = 0;
    int v67 = 0;
    int v68;
    int v69;
    v68 = v66;
    v69 = v67;
    while (true) {
      int v70 = 1;
      bool v71 = v69 < v70;
      v68 = v68;
      v69 = v69;
      if (!v71) break;
      helper0(v57, v55, v60, v63, static_cast<int>(__simt_tid3.x));
      int v72 = 1;
      int v73 = v69 + v72;
      v68 = v68;
      v69 = v73;
    }
  } else {
  }
  int v74 = 8;
  int v75 = v74 + v57;
  int v76 = v56[v75];
  int v77 = 4;
  int v78 = v57 + v77;
  int v79;
  v79 = v78;
  switch (v76) {
    case 0:
      {
      int v80 = 0;
      int v81 = 0;
      int v82;
      int v83;
      v82 = v80;
      v83 = v81;
      while (true) {
        int v84 = 4;
        int v85 = v83 * v84;
        int v86 = v85 + v57;
        int v87 = 12;
        int v88 = v87 + v86;
        int v89 = v56[v88];
        int v90 = 0;
        bool v91 = v89 != v90;
        v82 = v82;
        v83 = v83;
        if (!v91) break;
        int v92 = 32;
        int v93 = v92 + v57;
        int v94 = v56[v93];
        int v95 = 3;
        int v96;
        v96 = v95;
        switch (v94) {
          default:
            {
            int v97 = 1;
            v96 = v97;
            break;
          }
          case 0:
            {
            int v98 = 1;
            int v99 = v57 + v98;
            v96 = v99;
          }
          case 1:
            {
            int v100 = 0;
            int v101 = v57 + v100;
            v96 = v101;
            break;
          }
        }
        int v102 = v82 + v96;
        int v103 = 1;
        int v104 = v83 + v103;
        bool v105 = true;
        v82 = v102;
        v83 = v104;
      }
      v79 = v82;
    }
    default:
      {
      int v106 = 36;
      int v107 = v106 + v57;
      int v108 = v56[v107];
      int v109 = 0;
      bool v110 = v108 != v109;
      int v111;
      if (v110) {
        int v112 = 2;
        int v113 = v57 + v112;
        v111 = v113;
      } else {
        int v114 = 0;
        int v115 = 0;
        int v116;
        int v117;
        v116 = v114;
        v117 = v115;
        while (true) {
          int v118 = 4;
          int v119 = v117 * v118;
          int v120 = v119 + v57;
          int v121 = 40;
          int v122 = v121 + v120;
          int v123 = v56[v122];
          int v124 = 0;
          bool v125 = v123 != v124;
          v116 = v116;
          v117 = v117;
          if (!v125) break;
          int v126 = v116 + v117;
          int v127 = 1;
          int v128 = v117 + v127;
          bool v129 = true;
          v116 = v126;
          v117 = v128;
        }
        v111 = v116;
      }
      v79 = v111;
      break;
    }
  }
  int v130 = 4;
  int v131 = v57 + v130;
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
    static int32_t expected0[] = {static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 19; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 60; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
