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
  int v4 = 1;
  int v5 = 0;
  bool v6 = v2 != v5;
  int v7;
  if (v6) {
    uint v8 = simt_subgroup_id(__simt_tid);
    int v9 = (int)(v8);
    v7 = v9;
  } else {
    int v10 = 2;
    int v11 = v3 % v10;
    int v12;
    v12 = v0;
    switch (v11) {
      case 0:
        {
        int v13 = 0;
        bool v14 = v2 != v13;
        int v15;
        if (v14) {
          int v16 = 1;
          int v17 = v0 + v16;
          v15 = v17;
        } else {
          int v18 = 0;
          int v19 = v0 + v18;
          v15 = v19;
        }
        v12 = v15;
      }
      default:
        {
        int v20 = 0;
        bool v21 = v2 != v20;
        int v22;
        if (v21) {
          v22 = v0;
        } else {
          int v23 = 2;
          int v24 = v0 + v23;
          v22 = v24;
        }
        int v25 = 1;
        int v26 = v0 + v25;
        v12 = v22;
        break;
      }
    }
    int v27 = 3;
    v7 = v12;
  }
  bool v28 = true;
  int v29 = simt_wave_count_bits(v28);
  int v30 = 0;
  int v31 = v30 + v0;
  v1[v31] = v29;
  int v32 = 0;
  bool v33 = v2 != v32;
  int v34 = v33 ? v4 : v7;
  return;
}

kernel void kernel_main(device int* v35 [[buffer(0)]], device int* v36 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v37 = static_cast<int>(__simt_tid3.x);
  int v38 = 0;
  int v39 = v38 + v37;
  int v40 = v36[v39];
  int v41 = 4;
  int v42 = v41 + v37;
  int v43 = v36[v42];
  helper0(v37, v35, v40, v43, static_cast<int>(__simt_tid3.x));
  int v44 = 8;
  int v45 = v44 + v37;
  int v46 = v36[v45];
  int v47 = 0;
  bool v48 = v46 != v47;
  int v49;
  if (v48) {
    int v50 = 12;
    int v51 = v50 + v37;
    int v52 = v36[v51];
    int v53 = 0;
    bool v54 = v52 != v53;
    int v55;
    if (v54) {
      int v56 = 16;
      int v57 = v56 + v37;
      int v58 = v36[v57];
      uint v59 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v60 = (int)(v59);
      int v61;
      v61 = v60;
      switch (v58) {
        case 0:
          {
          int v62 = 4;
          v61 = v62;
        }
        default:
          {
          int v63 = 2;
          v61 = v63;
          break;
        }
      }
      bool v64 = true;
      v55 = v61;
    } else {
      v55 = v37;
    }
    v49 = v55;
  } else {
    int v65 = 20;
    int v66 = v65 + v37;
    int v67 = v36[v66];
    int v68 = 1;
    int v69 = v37 + v68;
    int v70;
    v70 = v69;
    switch (v67) {
      case 0:
        {
        int v71 = 24;
        int v72 = v71 + v37;
        int v73 = v36[v72];
        int v74 = 0;
        int v75;
        v75 = v74;
        switch (v73) {
          default:
            {
            int v76 = 1;
            v75 = v76;
            break;
          }
          case 0:
            {
            int v77 = 3;
            int v78 = v37 + v77;
            v75 = v78;
            break;
          }
          case 1:
            {
            int v79 = 2;
            v75 = v79;
            break;
          }
          case 2:
            {
            int v80 = 2;
            v75 = v80;
            break;
          }
        }
        bool v81 = true;
        v70 = v75;
      }
      default:
        {
        int v82 = 28;
        int v83 = v82 + v37;
        int v84 = v36[v83];
        int v85 = 0;
        bool v86 = v84 != v85;
        int v87;
        if (v86) {
          int v88 = 2;
          v87 = v88;
        } else {
          v87 = v37;
        }
        v70 = v87;
        break;
      }
    }
    bool v89 = true;
    v49 = v70;
  }
  int v90 = 16;
  int v91 = v90 + v37;
  bool v92 = true;
  int v93 = simt_wave_count_bits(v92);
  v35[v91] = v93;
  int v94 = 32;
  int v95 = v94 + v37;
  int v96 = v36[v95];
  int v97 = 0;
  bool v98 = v96 != v97;
  int v99;
  if (v98) {
    int v100 = 36;
    int v101 = v100 + v37;
    int v102 = v36[v101];
    int v103 = 0;
    bool v104 = v102 != v103;
    int v105;
    if (v104) {
      uint v106 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v107 = (int)(v106);
      v105 = v107;
    } else {
      int v108 = 40;
      int v109 = v108 + v37;
      int v110 = v36[v109];
      int v111 = 0;
      bool v112 = v110 != v111;
      int v113;
      if (v112) {
        v113 = v37;
      } else {
        int v114 = 2;
        int v115 = v37 + v114;
        v113 = v115;
      }
      v105 = v113;
    }
    v99 = v105;
  } else {
    int v116 = 0;
    int v117 = 0;
    int v118;
    int v119;
    v118 = v116;
    v119 = v117;
    while (true) {
      int v120 = 4;
      int v121 = v119 * v120;
      int v122 = v121 + v37;
      int v123 = 44;
      int v124 = v123 + v122;
      int v125 = v36[v124];
      int v126 = 0;
      bool v127 = v125 != v126;
      v118 = v118;
      v119 = v119;
      if (!v127) break;
      int v128 = v118 + v119;
      int v129 = 1;
      int v130 = v119 + v129;
      v118 = v128;
      v119 = v130;
    }
    bool v131 = true;
    v99 = v118;
  }
  int v132 = 32;
  int v133 = v132 + v37;
  bool v134 = true;
  int v135 = simt_wave_count_bits(v134);
  v35[v133] = v135;
  int v136 = 64;
  int v137 = v136 + v37;
  int v138 = v36[v137];
  int v139;
  v139 = v37;
  switch (v138) {
    default:
      {
      v139 = v37;
      break;
    }
    case 0:
      {
      int v140 = 68;
      int v141 = v140 + v37;
      int v142 = v36[v141];
      int v143 = 0;
      int v144 = v37 + v143;
      int v145;
      v145 = v144;
      switch (v142) {
        case 0:
          {
          int v146 = 2;
          int v147 = v37 + v146;
          v145 = v147;
          break;
        }
        case 1:
          {
          int v148 = 72;
          int v149 = v148 + v37;
          int v150 = v36[v149];
          int v151 = 0;
          int v152;
          v152 = v151;
          switch (v150) {
            default:
              {
              int v153 = 0;
              int v154 = v37 + v153;
              v152 = v154;
              break;
            }
            case 0:
              {
              int v155 = 2;
              v152 = v155;
              break;
            }
            case 1:
              {
              int v156 = 1;
              v152 = v156;
              break;
            }
            case 2:
              {
              int v157 = 4;
              int v158 = v37 + v157;
              v152 = v158;
              break;
            }
          }
          bool v159 = true;
          v145 = v152;
        }
        default:
          {
          int v160 = 76;
          int v161 = v160 + v37;
          int v162 = v36[v161];
          int v163 = 4;
          int v164 = v37 + v163;
          int v165;
          v165 = v164;
          switch (v162) {
            default:
              {
              int v166 = 3;
              int v167 = v37 + v166;
              v165 = v167;
              break;
            }
            case 0:
              {
              int v168 = 4;
              int v169 = v37 + v168;
              v165 = v169;
              break;
            }
            case 1:
              {
              v165 = v37;
              break;
            }
          }
          bool v170 = true;
          v145 = v165;
        }
        case 2:
          {
          int v171 = 80;
          int v172 = v171 + v37;
          int v173 = v36[v172];
          int v174 = 0;
          bool v175 = v173 != v174;
          int v176;
          if (v175) {
            v176 = v37;
          } else {
            v176 = v37;
          }
          v145 = v176;
          break;
        }
      }
      bool v177 = true;
      v139 = v145;
      break;
    }
  }
  bool v178 = true;
  int v179 = 48;
  int v180 = v179 + v37;
  bool v181 = true;
  int v182 = simt_wave_count_bits(v181);
  v35[v180] = v182;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 52; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 84; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
