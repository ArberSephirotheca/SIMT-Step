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
  uint v4 = simt_subgroup_id(__simt_tid);
  int v5 = (int)(v4);
  int v6 = 0;
  int v7 = 0;
  int v8;
  int v9;
  v8 = v6;
  v9 = v7;
  while (true) {
    int v10 = 4;
    int v11 = v3 % v10;
    int v12 = 1;
    int v13 = v11 + v12;
    bool v14 = v9 < v13;
    v8 = v8;
    v9 = v9;
    if (!v14) break;
    int v15 = 0;
    int v16 = 0;
    int v17;
    int v18;
    v17 = v15;
    v18 = v16;
    while (true) {
      int v19 = 4;
      int v20 = v3 % v19;
      int v21 = 1;
      int v22 = v20 + v21;
      bool v23 = v18 < v22;
      v17 = v17;
      v18 = v18;
      if (!v23) break;
      uint v24 = simt_subgroup_id(__simt_tid);
      int v25 = (int)(v24);
      int v26 = 1;
      int v27 = v18 + v26;
      v17 = v25;
      v18 = v27;
    }
    int v28 = 2;
    int v29 = v0 + v28;
    int v30 = 1;
    int v31 = v9 + v30;
    v8 = v17;
    v9 = v31;
  }
  bool v32 = true;
  int v33 = simt_wave_count_bits(v32);
  int v34 = 0;
  int v35 = v34 + v0;
  v1[v35] = v33;
  int v36 = 0;
  bool v37 = v2 != v36;
  int v38 = v37 ? v5 : v8;
  int v39 = 0;
  bool v40 = v2 != v39;
  int v41;
  if (v40) {
    int v42 = 0;
    int v43 = 0;
    int v44;
    int v45;
    v44 = v42;
    v45 = v43;
    while (true) {
      int v46 = 4;
      int v47 = v3 % v46;
      int v48 = 1;
      int v49 = v47 + v48;
      bool v50 = v45 < v49;
      v44 = v44;
      v45 = v45;
      if (!v50) break;
      int v51 = 4;
      int v52 = v0 + v51;
      int v53;
      v53 = v52;
      switch (v3) {
        default:
          {
          int v54 = 0;
          v53 = v54;
        }
        case 0:
          {
          int v55 = 1;
          v53 = v55;
          break;
        }
      }
      uint v56 = simt_subgroup_id(__simt_tid);
      int v57 = (int)(v56);
      int v58 = 1;
      int v59 = v45 + v58;
      v44 = v53;
      v45 = v59;
    }
    int v60 = 4;
    int v61 = v0 + v60;
    v41 = v44;
  } else {
    int v62 = 3;
    int v63 = v3 % v62;
    int v64 = 1;
    int v65 = v0 + v64;
    int v66;
    v66 = v65;
    switch (v63) {
      case 0:
        {
        int v67 = 3;
        int v68 = v3 % v67;
        int v69 = 0;
        int v70;
        v70 = v69;
        switch (v68) {
          default:
            {
            int v71 = 3;
            int v72 = v0 + v71;
            v70 = v72;
            break;
          }
          case 0:
            {
            int v73 = 4;
            v70 = v73;
            break;
          }
          case 1:
            {
            int v74 = 2;
            int v75 = v0 + v74;
            v70 = v75;
            break;
          }
        }
        v66 = v70;
        break;
      }
      default:
        {
        int v76 = 0;
        int v77 = 0;
        int v78;
        int v79;
        v78 = v76;
        v79 = v77;
        while (true) {
          int v80 = 4;
          int v81 = v3 % v80;
          int v82 = 1;
          int v83 = v81 + v82;
          bool v84 = v79 < v83;
          v78 = v78;
          v79 = v79;
          if (!v84) break;
          int v85 = 1;
          int v86 = v79 + v85;
          v78 = v0;
          v79 = v86;
        }
        v66 = v78;
        break;
      }
      case 1:
        {
        int v87 = 0;
        bool v88 = v2 != v87;
        int v89;
        if (v88) {
          v89 = v0;
        } else {
          int v90 = 4;
          int v91 = v0 + v90;
          v89 = v91;
        }
        int v92 = 4;
        int v93 = v0 + v92;
        v66 = v89;
        break;
      }
    }
    uint v94 = simt_subgroup_id(__simt_tid);
    int v95 = (int)(v94);
    v41 = v66;
  }
  bool v96 = true;
  int v97 = simt_wave_count_bits(v96);
  int v98 = 16;
  int v99 = v98 + v0;
  v1[v99] = v97;
  int v100 = 0;
  bool v101 = v2 != v100;
  int v102 = v101 ? v38 : v41;
  return;
}

kernel void kernel_main(device int* v103 [[buffer(0)]], device int* v104 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v105 = static_cast<int>(__simt_tid3.x);
  int v106 = 0;
  int v107 = v106 + v105;
  int v108 = v104[v107];
  int v109 = 4;
  int v110 = v109 + v105;
  int v111 = v104[v110];
  helper0(v105, v103, v108, v111, static_cast<int>(__simt_tid3.x));
  int v112 = 0;
  int v113 = v105 + v112;
  uint v114 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v115 = (int)(v114);
  int v116 = 8;
  int v117 = v116 + v105;
  int v118 = v104[v117];
  int v119 = 0;
  bool v120 = v118 != v119;
  int v121;
  if (v120) {
    int v122 = 12;
    int v123 = v122 + v105;
    int v124 = v104[v123];
    int v125 = 2;
    int v126 = v105 + v125;
    int v127;
    v127 = v126;
    switch (v124) {
      default:
        {
        int v128 = 2;
        int v129 = v105 + v128;
        v127 = v129;
        break;
      }
      case 0:
        {
        int v130 = 0;
        int v131 = 0;
        int v132;
        int v133;
        v132 = v130;
        v133 = v131;
        while (true) {
          int v134 = 4;
          int v135 = v133 * v134;
          int v136 = v135 + v105;
          int v137 = 16;
          int v138 = v137 + v136;
          int v139 = v104[v138];
          int v140 = 0;
          bool v141 = v139 != v140;
          v132 = v132;
          v133 = v133;
          if (!v141) break;
          int v142 = v132 + v133;
          int v143 = 1;
          int v144 = v133 + v143;
          v132 = v142;
          v133 = v144;
        }
        bool v145 = true;
        v127 = v132;
        break;
      }
      case 1:
        {
        int v146 = 36;
        int v147 = v146 + v105;
        int v148 = v104[v147];
        int v149 = 0;
        bool v150 = v148 != v149;
        int v151;
        if (v150) {
          v151 = v105;
        } else {
          int v152 = 4;
          int v153 = v105 + v152;
          v151 = v153;
        }
        v127 = v151;
        break;
      }
    }
    bool v154 = true;
    v121 = v127;
  } else {
    int v155 = 0;
    int v156 = 0;
    int v157;
    int v158;
    v157 = v155;
    v158 = v156;
    while (true) {
      int v159 = 4;
      int v160 = v158 * v159;
      int v161 = v160 + v105;
      int v162 = 40;
      int v163 = v162 + v161;
      int v164 = v104[v163];
      int v165 = 0;
      bool v166 = v164 != v165;
      v157 = v157;
      v158 = v158;
      if (!v166) break;
      int v167 = v157 + v158;
      int v168 = 1;
      int v169 = v158 + v168;
      v157 = v167;
      v158 = v169;
      continue;
      ;
    }
    bool v170 = true;
    v121 = v157;
  }
  int v171 = 32;
  int v172 = v171 + v105;
  bool v173 = true;
  int v174 = simt_wave_count_bits(v173);
  v103[v172] = v174;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 60; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
