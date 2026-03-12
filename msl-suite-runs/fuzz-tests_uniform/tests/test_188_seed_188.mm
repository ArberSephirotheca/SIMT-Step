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
  int v6 = 0;
  bool v7 = v2 != v6;
  int v8;
  if (v7) {
    uint v9 = simt_subgroup_id(__simt_tid);
    int v10 = (int)(v9);
    v8 = v10;
  } else {
    int v11 = 2;
    v8 = v11;
  }
  bool v12 = true;
  int v13 = simt_wave_count_bits(v12);
  int v14 = 0;
  int v15 = v14 + v0;
  v1[v15] = v13;
  int v16 = 0;
  bool v17 = v2 != v16;
  int v18 = v17 ? v5 : v8;
  int v19 = 0;
  bool v20 = v2 != v19;
  int v21;
  if (v20) {
    int v22 = 2;
    int v23 = v3 % v22;
    int v24;
    v24 = v0;
    switch (v23) {
      case 0:
        {
        int v25 = 0;
        int v26 = 0;
        int v27;
        int v28;
        v27 = v25;
        v28 = v26;
        while (true) {
          int v29 = 4;
          int v30 = v3 % v29;
          int v31 = 1;
          int v32 = v30 + v31;
          bool v33 = v28 < v32;
          v27 = v27;
          v28 = v28;
          if (!v33) break;
          int v34 = 1;
          int v35 = v28 + v34;
          v27 = v0;
          v28 = v35;
          break;
          ;
        }
        int v36 = 0;
        int v37 = v0 + v36;
        v24 = v27;
        break;
      }
      default:
        {
        int v38 = 0;
        int v39 = 0;
        int v40;
        int v41;
        v40 = v38;
        v41 = v39;
        while (true) {
          int v42 = 4;
          int v43 = v3 % v42;
          int v44 = 1;
          int v45 = v43 + v44;
          bool v46 = v41 < v45;
          v40 = v40;
          v41 = v41;
          if (!v46) break;
          int v47 = 1;
          int v48 = v41 + v47;
          v40 = v0;
          v41 = v48;
          break;
          ;
        }
        int v49 = 4;
        v24 = v40;
        break;
      }
    }
    v21 = v24;
  } else {
    int v50 = 0;
    int v51 = 0;
    int v52;
    int v53;
    v52 = v50;
    v53 = v51;
    while (true) {
      int v54 = 4;
      int v55 = v3 % v54;
      int v56 = 1;
      int v57 = v55 + v56;
      bool v58 = v53 < v57;
      v52 = v52;
      v53 = v53;
      if (!v58) break;
      int v59 = 2;
      int v60 = v3 % v59;
      int v61 = 3;
      int v62 = v0 + v61;
      int v63;
      v63 = v62;
      switch (v60) {
        case 0:
          {
          v63 = v0;
          break;
        }
        default:
          {
          v63 = v0;
          break;
        }
      }
      int v64 = 2;
      int v65 = 1;
      int v66 = v53 + v65;
      v52 = v63;
      v53 = v66;
    }
    int v67 = 0;
    v21 = v52;
  }
  bool v68 = true;
  int v69 = simt_wave_count_bits(v68);
  int v70 = 16;
  int v71 = v70 + v0;
  v1[v71] = v69;
  int v72 = 0;
  bool v73 = v2 != v72;
  int v74 = v73 ? v18 : v21;
  return;
}

kernel void kernel_main(device int* v75 [[buffer(0)]], device int* v76 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v77 = static_cast<int>(__simt_tid3.x);
  int v78 = 0;
  int v79 = v78 + v77;
  int v80 = v76[v79];
  int v81 = 4;
  int v82 = v81 + v77;
  int v83 = v76[v82];
  helper0(v77, v75, v80, v83, static_cast<int>(__simt_tid3.x));
  int v84 = 1;
  int v85 = 8;
  int v86 = v85 + v77;
  int v87 = v76[v86];
  int v88 = 0;
  bool v89 = v87 != v88;
  int v90;
  if (v89) {
    int v91 = 0;
    int v92 = 0;
    int v93;
    int v94;
    v93 = v91;
    v94 = v92;
    while (true) {
      int v95 = 4;
      int v96 = v94 * v95;
      int v97 = v96 + v77;
      int v98 = 12;
      int v99 = v98 + v97;
      int v100 = v76[v99];
      int v101 = 0;
      bool v102 = v100 != v101;
      v93 = v93;
      v94 = v94;
      if (!v102) break;
      int v103 = v93 + v94;
      int v104 = 1;
      int v105 = v94 + v104;
      v93 = v103;
      v94 = v105;
    }
    bool v106 = true;
    v90 = v93;
  } else {
    int v107 = 32;
    int v108 = v107 + v77;
    int v109 = v76[v108];
    uint v110 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v111 = (int)(v110);
    int v112;
    v112 = v111;
    switch (v109) {
      case 0:
        {
        int v113 = 0;
        int v114 = 0;
        int v115;
        int v116;
        v115 = v113;
        v116 = v114;
        while (true) {
          int v117 = 4;
          int v118 = v116 * v117;
          int v119 = v118 + v77;
          int v120 = 36;
          int v121 = v120 + v119;
          int v122 = v76[v121];
          int v123 = 0;
          bool v124 = v122 != v123;
          v115 = v115;
          v116 = v116;
          if (!v124) break;
          int v125 = v115 + v116;
          int v126 = 1;
          int v127 = v116 + v126;
          v115 = v125;
          v116 = v127;
        }
        bool v128 = true;
        v112 = v115;
        break;
      }
      case 1:
        {
        int v129 = 0;
        int v130 = 0;
        int v131;
        int v132;
        v131 = v129;
        v132 = v130;
        while (true) {
          int v133 = 4;
          int v134 = v132 * v133;
          int v135 = v134 + v77;
          int v136 = 56;
          int v137 = v136 + v135;
          int v138 = v76[v137];
          int v139 = 0;
          bool v140 = v138 != v139;
          v131 = v131;
          v132 = v132;
          if (!v140) break;
          int v141 = v131 + v132;
          int v142 = 1;
          int v143 = v132 + v142;
          v131 = v141;
          v132 = v143;
        }
        bool v144 = true;
        v112 = v131;
      }
      default:
        {
        int v145 = 0;
        int v146 = 0;
        int v147;
        int v148;
        v147 = v145;
        v148 = v146;
        while (true) {
          int v149 = 4;
          int v150 = v148 * v149;
          int v151 = v150 + v77;
          int v152 = 76;
          int v153 = v152 + v151;
          int v154 = v76[v153];
          int v155 = 0;
          bool v156 = v154 != v155;
          v147 = v147;
          v148 = v148;
          if (!v156) break;
          int v157 = v147 + v148;
          int v158 = 1;
          int v159 = v148 + v158;
          v147 = v157;
          v148 = v159;
        }
        bool v160 = true;
        v112 = v147;
        break;
      }
    }
    bool v161 = true;
    v90 = v112;
  }
  int v162 = 32;
  int v163 = v162 + v77;
  bool v164 = true;
  int v165 = simt_wave_count_bits(v164);
  v75[v163] = v165;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 96; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
