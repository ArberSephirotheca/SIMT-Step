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
    bool v13 = true;
    int v14 = simt_wave_count_bits(v13);
    int v15 = 0;
    int v16 = 4;
    int v17 = v7 * v16;
    int v18 = v15 + v17;
    int v19 = v18 + v0;
    v1[v19] = v14;
    int v20 = 1;
    int v21 = v7 + v20;
    v6 = v14;
    v7 = v21;
  }
  int v22 = 0;
  int v23 = 0;
  int v24;
  int v25;
  v24 = v22;
  v25 = v23;
  while (true) {
    int v26 = 4;
    int v27 = v3 % v26;
    int v28 = 1;
    int v29 = v27 + v28;
    bool v30 = v25 < v29;
    v24 = v24;
    v25 = v25;
    if (!v30) break;
    int v31 = 0;
    int v32 = 0;
    int v33;
    int v34;
    v33 = v31;
    v34 = v32;
    while (true) {
      int v35 = 4;
      int v36 = v3 % v35;
      int v37 = 1;
      int v38 = v36 + v37;
      bool v39 = v34 < v38;
      v33 = v33;
      v34 = v34;
      if (!v39) break;
      int v40 = 0;
      int v41 = 0;
      int v42;
      int v43;
      v42 = v40;
      v43 = v41;
      while (true) {
        int v44 = 4;
        int v45 = v3 % v44;
        int v46 = 1;
        int v47 = v45 + v46;
        bool v48 = v43 < v47;
        v42 = v42;
        v43 = v43;
        if (!v48) break;
        bool v49 = true;
        int v50 = simt_wave_count_bits(v49);
        int v51 = 16;
        int v52 = 4;
        int v53 = v43 * v52;
        int v54 = v51 + v53;
        int v55 = v54 + v0;
        v1[v55] = v50;
        int v56 = 1;
        int v57 = v43 + v56;
        v42 = v50;
        v43 = v57;
      }
      int v58 = 1;
      int v59 = v34 + v58;
      v33 = v42;
      v34 = v59;
      break;
      ;
    }
    int v60 = 1;
    int v61 = v25 + v60;
    v24 = v33;
    v25 = v61;
  }
  int v62 = 0;
  bool v63 = v2 != v62;
  int v64 = v63 ? v6 : v24;
  return;
}

kernel void kernel_main(device int* v65 [[buffer(0)]], device int* v66 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v67 = static_cast<int>(__simt_tid3.x);
  int v68 = 0;
  int v69 = v68 + v67;
  int v70 = v66[v69];
  int v71 = 4;
  int v72 = v71 + v67;
  int v73 = v66[v72];
  helper0(v67, v65, v70, v73, static_cast<int>(__simt_tid3.x));
  int v74 = 0;
  int v75 = 8;
  int v76 = v75 + v67;
  int v77 = v66[v76];
  int v78 = 0;
  int v79 = v67 + v78;
  int v80;
  v80 = v79;
  switch (v77) {
    default:
      {
      int v81 = 12;
      int v82 = v81 + v67;
      int v83 = v66[v82];
      int v84 = 0;
      bool v85 = v83 != v84;
      int v86;
      if (v85) {
        int v87 = 16;
        int v88 = v87 + v67;
        int v89 = v66[v88];
        int v90 = 1;
        int v91 = v67 + v90;
        int v92;
        v92 = v91;
        switch (v89) {
          default:
            {
            int v93 = 2;
            int v94 = v67 + v93;
            v92 = v94;
            break;
          }
          case 0:
            {
            int v95 = 2;
            v92 = v95;
            break;
          }
          case 1:
            {
            v92 = v67;
            break;
          }
        }
        v86 = v92;
      } else {
        int v96 = 0;
        int v97 = 0;
        int v98;
        int v99;
        v98 = v96;
        v99 = v97;
        while (true) {
          int v100 = 4;
          int v101 = v99 * v100;
          int v102 = v101 + v67;
          int v103 = 20;
          int v104 = v103 + v102;
          int v105 = v66[v104];
          int v106 = 0;
          bool v107 = v105 != v106;
          v98 = v98;
          v99 = v99;
          if (!v107) break;
          int v108 = v98 + v99;
          int v109 = 1;
          int v110 = v99 + v109;
          bool v111 = true;
          v98 = v108;
          v99 = v110;
        }
        v86 = v98;
      }
      v80 = v86;
    }
    case 0:
      {
      int v112 = 0;
      int v113 = 0;
      int v114;
      int v115;
      v114 = v112;
      v115 = v113;
      while (true) {
        int v116 = 4;
        int v117 = v115 * v116;
        int v118 = v117 + v67;
        int v119 = 40;
        int v120 = v119 + v118;
        int v121 = v66[v120];
        int v122 = 0;
        bool v123 = v121 != v122;
        v114 = v114;
        v115 = v115;
        if (!v123) break;
        int v124 = v114 + v67;
        int v125 = 1;
        int v126 = v115 + v125;
        bool v127 = true;
        v114 = v124;
        v115 = v126;
      }
      v80 = v114;
    }
    case 1:
      {
      int v128 = 60;
      int v129 = v128 + v67;
      int v130 = v66[v129];
      int v131 = 0;
      bool v132 = v130 != v131;
      int v133;
      if (v132) {
        int v134 = 1;
        int v135 = v67 + v134;
        v133 = v135;
      } else {
        int v136 = 64;
        int v137 = v136 + v67;
        int v138 = v66[v137];
        int v139 = 0;
        bool v140 = v138 != v139;
        int v141;
        if (v140) {
          int v142 = 1;
          v141 = v142;
        } else {
          int v143 = 0;
          v141 = v143;
        }
        v133 = v141;
      }
      v80 = v133;
      break;
    }
  }
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 30; ++idx) {
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
