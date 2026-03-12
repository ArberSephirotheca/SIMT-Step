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
  int v8 = 0;
  int v9 = 0;
  int v10;
  int v11;
  v10 = v8;
  v11 = v9;
  while (true) {
    int v12 = 4;
    int v13 = v3 % v12;
    int v14 = 1;
    int v15 = v13 + v14;
    bool v16 = v11 < v15;
    v10 = v10;
    v11 = v11;
    if (!v16) break;
    int v17 = 3;
    int v18 = v3 % v17;
    uint v19 = simt_lane_id(__simt_tid);
    int v20 = (int)(v19);
    int v21;
    v21 = v20;
    switch (v18) {
      default:
        {
        int v22 = 0;
        bool v23 = v2 != v22;
        int v24;
        if (v23) {
          v24 = v0;
        } else {
          int v25 = 0;
          v24 = v25;
        }
        v21 = v24;
        break;
      }
      case 0:
        {
        int v26 = 4;
        int v27 = v0 + v26;
        v21 = v27;
      }
      case 1:
        {
        int v28 = 2;
        int v29 = v3 % v28;
        int v30;
        v30 = v0;
        switch (v29) {
          case 0:
            {
            v30 = v0;
            break;
          }
          default:
            {
            int v31 = 1;
            int v32 = v0 + v31;
            v30 = v32;
            break;
          }
        }
        v21 = v30;
        break;
      }
      case 2:
        {
        int v33 = 0;
        bool v34 = v2 != v33;
        int v35;
        if (v34) {
          int v36 = 1;
          int v37 = v0 + v36;
          v35 = v37;
        } else {
          int v38 = 2;
          v35 = v38;
        }
        v21 = v35;
        break;
      }
    }
    int v39 = 1;
    int v40 = v11 + v39;
    v10 = v21;
    v11 = v40;
    break;
    ;
  }
  int v41 = 0;
  bool v42 = v2 != v41;
  int v43 = v42 ? v5 : v10;
  return;
}

kernel void kernel_main(device int* v44 [[buffer(0)]], device int* v45 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v46 = static_cast<int>(__simt_tid3.x);
  int v47 = 0;
  int v48 = v47 + v46;
  int v49 = v45[v48];
  int v50 = 4;
  int v51 = v50 + v46;
  int v52 = v45[v51];
  int v53 = 0;
  bool v54 = v49 != v53;
  if (v54) {
    int v55 = 8;
    int v56 = v55 + v46;
    int v57 = v45[v56];
    int v58 = 0;
    bool v59 = v57 != v58;
    if (v59) {
      helper0(v46, v44, v49, v52, static_cast<int>(__simt_tid3.x));
    } else {
    }
  } else {
  }
  int v60 = 12;
  int v61 = v60 + v46;
  int v62 = v45[v61];
  int v63 = 2;
  int v64 = v46 + v63;
  int v65;
  v65 = v64;
  switch (v62) {
    case 0:
      {
      int v66 = 16;
      int v67 = v66 + v46;
      int v68 = v45[v67];
      int v69 = 0;
      bool v70 = v68 != v69;
      int v71;
      if (v70) {
        int v72 = 4;
        v71 = v72;
      } else {
        int v73 = 0;
        int v74 = 0;
        int v75;
        int v76;
        v75 = v73;
        v76 = v74;
        while (true) {
          int v77 = 4;
          int v78 = v76 * v77;
          int v79 = v78 + v46;
          int v80 = 20;
          int v81 = v80 + v79;
          int v82 = v45[v81];
          int v83 = 0;
          bool v84 = v82 != v83;
          v75 = v75;
          v76 = v76;
          if (!v84) break;
          int v85 = v75 + v76;
          int v86 = 1;
          int v87 = v76 + v86;
          bool v88 = true;
          v75 = v85;
          v76 = v87;
        }
        v71 = v75;
      }
      v65 = v71;
      break;
    }
    default:
      {
      int v89 = 0;
      v65 = v89;
      break;
    }
    case 1:
      {
      int v90 = 0;
      int v91 = 0;
      int v92;
      int v93;
      v92 = v90;
      v93 = v91;
      while (true) {
        int v94 = 4;
        int v95 = v93 * v94;
        int v96 = v95 + v46;
        int v97 = 40;
        int v98 = v97 + v96;
        int v99 = v45[v98];
        int v100 = 0;
        bool v101 = v99 != v100;
        v92 = v92;
        v93 = v93;
        if (!v101) break;
        int v102 = 0;
        int v103 = 0;
        int v104;
        int v105;
        v104 = v102;
        v105 = v103;
        while (true) {
          int v106 = 4;
          int v107 = v105 * v106;
          int v108 = v107 + v46;
          int v109 = 60;
          int v110 = v109 + v108;
          int v111 = v45[v110];
          int v112 = 0;
          bool v113 = v111 != v112;
          v104 = v104;
          v105 = v105;
          if (!v113) break;
          int v114 = v104 + v105;
          int v115 = 1;
          int v116 = v105 + v115;
          bool v117 = true;
          v104 = v114;
          v105 = v116;
        }
        int v118 = v92 + v104;
        int v119 = 1;
        int v120 = v93 + v119;
        bool v121 = true;
        v92 = v118;
        v93 = v120;
      }
      v65 = v92;
      break;
    }
  }
  int v122 = 80;
  int v123 = v122 + v46;
  int v124 = v45[v123];
  int v125 = 0;
  bool v126 = v124 != v125;
  int v127;
  if (v126) {
    int v128 = 84;
    int v129 = v128 + v46;
    int v130 = v45[v129];
    int v131 = 0;
    bool v132 = v130 != v131;
    int v133;
    if (v132) {
      int v134 = 3;
      int v135 = v46 + v134;
      v133 = v135;
    } else {
      int v136 = 88;
      int v137 = v136 + v46;
      int v138 = v45[v137];
      uint v139 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v140 = (int)(v139);
      int v141;
      v141 = v140;
      switch (v138) {
        case 0:
          {
          v141 = v46;
          break;
        }
        default:
          {
          int v142 = 1;
          v141 = v142;
          break;
        }
        case 1:
          {
          v141 = v46;
          break;
        }
      }
      v133 = v141;
    }
    int v143 = 16;
    int v144 = v143 + v46;
    bool v145 = true;
    int v146 = simt_wave_count_bits(v145);
    v44[v144] = v146;
    v127 = v133;
  } else {
    int v147 = 92;
    int v148 = v147 + v46;
    int v149 = v45[v148];
    int v150 = 0;
    bool v151 = v149 != v150;
    int v152;
    if (v151) {
      int v153 = 96;
      int v154 = v153 + v46;
      int v155 = v45[v154];
      int v156 = 0;
      bool v157 = v155 != v156;
      int v158;
      if (v157) {
        int v159 = 2;
        v158 = v159;
      } else {
        uint v160 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v161 = (int)(v160);
        v158 = v161;
      }
      int v162 = 32;
      int v163 = v162 + v46;
      bool v164 = true;
      int v165 = simt_wave_count_bits(v164);
      v44[v163] = v165;
      v152 = v158;
    } else {
      uint v166 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v167 = (int)(v166);
      v152 = v167;
    }
    int v168 = 48;
    int v169 = v168 + v46;
    bool v170 = true;
    int v171 = simt_wave_count_bits(v170);
    v44[v169] = v171;
    v127 = v152;
  }
  int v172 = 64;
  int v173 = v172 + v46;
  bool v174 = true;
  int v175 = simt_wave_count_bits(v174);
  v44[v173] = v175;
  int v176 = 3;
  int v177 = v46 + v176;
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 100; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
