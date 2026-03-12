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
    int v9 = 0;
    v8 = v9;
  } else {
    int v10 = 1;
    int v11 = v0 + v10;
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
  int v20 = 0;
  int v21;
  int v22;
  v21 = v19;
  v22 = v20;
  while (true) {
    int v23 = 4;
    int v24 = v3 % v23;
    int v25 = 1;
    int v26 = v24 + v25;
    bool v27 = v22 < v26;
    v21 = v21;
    v22 = v22;
    if (!v27) break;
    uint v28 = simt_subgroup_id(__simt_tid);
    int v29 = (int)(v28);
    int v30 = 1;
    int v31 = v22 + v30;
    v21 = v29;
    v22 = v31;
  }
  bool v32 = true;
  int v33 = simt_wave_count_bits(v32);
  int v34 = 16;
  int v35 = v34 + v0;
  v1[v35] = v33;
  int v36 = 0;
  bool v37 = v2 != v36;
  int v38 = v37 ? v18 : v21;
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
      int v45 = 2;
      int v46 = v3 % v45;
      uint v47 = simt_subgroup_id(__simt_tid);
      int v48 = (int)(v47);
      int v49;
      v49 = v48;
      switch (v46) {
        default:
          {
          v49 = v0;
          break;
        }
        case 0:
          {
          v49 = v0;
          break;
        }
      }
      uint v50 = simt_lane_id(__simt_tid);
      int v51 = (int)(v50);
      v44 = v49;
    }
    int v52 = 3;
    int v53 = v0 + v52;
    v41 = v44;
  } else {
    int v54 = 2;
    int v55 = v3 % v54;
    uint v56 = simt_lane_id(__simt_tid);
    int v57 = (int)(v56);
    int v58;
    v58 = v57;
    switch (v55) {
      case 0:
        {
        int v59 = 3;
        int v60 = v3 % v59;
        int v61 = 3;
        int v62 = v0 + v61;
        int v63;
        v63 = v62;
        switch (v60) {
          case 0:
            {
            int v64 = 1;
            v63 = v64;
            break;
          }
          case 1:
            {
            int v65 = 0;
            int v66 = v0 + v65;
            v63 = v66;
          }
          default:
            {
            int v67 = 1;
            int v68 = v0 + v67;
            v63 = v68;
          }
          case 2:
            {
            v63 = v0;
            break;
          }
        }
        int v69 = 4;
        v58 = v63;
        break;
      }
      case 1:
        {
        int v70 = 1;
        v58 = v70;
        break;
      }
      default:
        {
        int v71 = 0;
        int v72 = 0;
        int v73;
        int v74;
        v73 = v71;
        v74 = v72;
        while (true) {
          int v75 = 4;
          int v76 = v3 % v75;
          int v77 = 1;
          int v78 = v76 + v77;
          bool v79 = v74 < v78;
          v73 = v73;
          v74 = v74;
          if (!v79) break;
          int v80 = 1;
          int v81 = v0 + v80;
          int v82 = 1;
          int v83 = v74 + v82;
          v73 = v81;
          v74 = v83;
          break;
          ;
        }
        int v84 = 3;
        v58 = v73;
        break;
      }
    }
    int v85 = 2;
    int v86 = v0 + v85;
    v41 = v58;
  }
  bool v87 = true;
  int v88 = simt_wave_count_bits(v87);
  int v89 = 32;
  int v90 = v89 + v0;
  v1[v90] = v88;
  int v91 = 0;
  bool v92 = v2 != v91;
  int v93 = v92 ? v38 : v41;
  return;
}

kernel void kernel_main(device int* v94 [[buffer(0)]], device int* v95 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v96 = static_cast<int>(__simt_tid3.x);
  int v97 = 0;
  int v98 = v97 + v96;
  int v99 = v95[v98];
  int v100 = 4;
  int v101 = v100 + v96;
  int v102 = v95[v101];
  helper0(v96, v94, v99, v102, static_cast<int>(__simt_tid3.x));
  uint v103 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v104 = (int)(v103);
  int v105 = 8;
  int v106 = v105 + v96;
  int v107 = v95[v106];
  int v108 = 0;
  bool v109 = v107 != v108;
  int v110;
  if (v109) {
    int v111 = 0;
    int v112 = 0;
    int v113;
    int v114;
    v113 = v111;
    v114 = v112;
    while (true) {
      int v115 = 4;
      int v116 = v114 * v115;
      int v117 = v116 + v96;
      int v118 = 12;
      int v119 = v118 + v117;
      int v120 = v95[v119];
      int v121 = 0;
      bool v122 = v120 != v121;
      v113 = v113;
      v114 = v114;
      if (!v122) break;
      int v123 = v113 + v114;
      int v124 = 1;
      int v125 = v114 + v124;
      v113 = v123;
      v114 = v125;
    }
    bool v126 = true;
    v110 = v113;
  } else {
    int v127 = 0;
    int v128 = 0;
    int v129;
    int v130;
    v129 = v127;
    v130 = v128;
    while (true) {
      int v131 = 4;
      int v132 = v130 * v131;
      int v133 = v132 + v96;
      int v134 = 32;
      int v135 = v134 + v133;
      int v136 = v95[v135];
      int v137 = 0;
      bool v138 = v136 != v137;
      v129 = v129;
      v130 = v130;
      if (!v138) break;
      int v139 = v129 + v130;
      int v140 = 1;
      int v141 = v130 + v140;
      v129 = v139;
      v130 = v141;
      break;
      ;
    }
    bool v142 = true;
    v110 = v129;
  }
  int v143 = 48;
  int v144 = v143 + v96;
  bool v145 = true;
  int v146 = simt_wave_count_bits(v145);
  v94[v144] = v146;
  int v147 = 0;
  int v148 = 0;
  int v149;
  int v150;
  v149 = v147;
  v150 = v148;
  while (true) {
    int v151 = 4;
    int v152 = v150 * v151;
    int v153 = v152 + v96;
    int v154 = 52;
    int v155 = v154 + v153;
    int v156 = v95[v155];
    int v157 = 0;
    bool v158 = v156 != v157;
    v149 = v149;
    v150 = v150;
    if (!v158) break;
    int v159 = v149 + v150;
    int v160 = 1;
    int v161 = v150 + v160;
    v149 = v159;
    v150 = v161;
  }
  bool v162 = true;
  int v163 = 64;
  int v164 = v163 + v96;
  bool v165 = true;
  int v166 = simt_wave_count_bits(v165);
  v94[v164] = v166;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 72; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
