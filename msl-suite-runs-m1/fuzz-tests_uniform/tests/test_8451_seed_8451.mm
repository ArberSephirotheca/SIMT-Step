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
    int v7 = 0;
    int v8 = 0;
    int v9;
    int v10;
    v9 = v7;
    v10 = v8;
    while (true) {
      int v11 = 4;
      int v12 = v3 % v11;
      int v13 = 1;
      int v14 = v12 + v13;
      bool v15 = v10 < v14;
      v9 = v9;
      v10 = v10;
      if (!v15) break;
      int v16 = 3;
      int v17 = 1;
      int v18 = v10 + v17;
      v9 = v16;
      v10 = v18;
      break;
      ;
    }
    uint v19 = simt_lane_id(__simt_tid);
    int v20 = (int)(v19);
    v6 = v9;
  } else {
    int v21 = 4;
    int v22 = v0 + v21;
    v6 = v22;
  }
  bool v23 = true;
  int v24 = simt_wave_count_bits(v23);
  int v25 = 0;
  int v26 = v25 + v0;
  v1[v26] = v24;
  int v27 = 3;
  int v28 = v3 % v27;
  int v29 = 2;
  int v30 = v0 + v29;
  int v31;
  v31 = v30;
  switch (v28) {
    default:
      {
      int v32 = 4;
      int v33 = v3 % v32;
      int v34;
      v34 = v0;
      switch (v33) {
        default:
          {
          int v35 = 0;
          bool v36 = v2 != v35;
          int v37;
          if (v36) {
            v37 = v0;
          } else {
            int v38 = 2;
            v37 = v38;
          }
          int v39 = 1;
          int v40 = v0 + v39;
          v34 = v37;
          break;
        }
        case 0:
          {
          int v41 = 4;
          v34 = v41;
          break;
        }
        case 1:
          {
          int v42 = 2;
          int v43 = v3 % v42;
          int v44;
          v44 = v0;
          switch (v43) {
            default:
              {
              int v45 = 2;
              v44 = v45;
              break;
            }
            case 0:
              {
              int v46 = 3;
              v44 = v46;
              break;
            }
          }
          int v47 = 0;
          v34 = v44;
          break;
        }
        case 2:
          {
          int v48 = 4;
          v34 = v48;
          break;
        }
      }
      int v49 = 2;
      v31 = v34;
    }
    case 0:
      {
      int v50 = 2;
      int v51 = v3 % v50;
      int v52 = 2;
      int v53 = v0 + v52;
      int v54;
      v54 = v53;
      switch (v51) {
        default:
          {
          int v55 = 4;
          v54 = v55;
          break;
        }
        case 0:
          {
          int v56 = 0;
          int v57 = 0;
          int v58;
          int v59;
          v58 = v56;
          v59 = v57;
          while (true) {
            int v60 = 4;
            int v61 = v3 % v60;
            int v62 = 1;
            int v63 = v61 + v62;
            bool v64 = v59 < v63;
            v58 = v58;
            v59 = v59;
            if (!v64) break;
            int v65 = 1;
            int v66 = v59 + v65;
            v58 = v0;
            v59 = v66;
          }
          int v67 = 0;
          v54 = v58;
          break;
        }
        case 1:
          {
          int v68 = 0;
          bool v69 = v2 != v68;
          int v70;
          if (v69) {
            int v71 = 2;
            v70 = v71;
          } else {
            int v72 = 1;
            v70 = v72;
          }
          int v73 = 4;
          v54 = v70;
          break;
        }
      }
      int v74 = 4;
      v31 = v54;
    }
    case 1:
      {
      int v75 = 0;
      bool v76 = v2 != v75;
      int v77;
      if (v76) {
        int v78 = 0;
        int v79 = 0;
        int v80;
        int v81;
        v80 = v78;
        v81 = v79;
        while (true) {
          int v82 = 4;
          int v83 = v3 % v82;
          int v84 = 1;
          int v85 = v83 + v84;
          bool v86 = v81 < v85;
          v80 = v80;
          v81 = v81;
          if (!v86) break;
          int v87 = 1;
          int v88 = v81 + v87;
          v80 = v0;
          v81 = v88;
        }
        int v89 = 1;
        int v90 = v0 + v89;
        v77 = v80;
      } else {
        int v91 = 1;
        v77 = v91;
      }
      v31 = v77;
    }
    case 2:
      {
      int v92 = 3;
      int v93 = v3 % v92;
      int v94 = 1;
      int v95;
      v95 = v94;
      switch (v93) {
        case 0:
          {
          int v96 = 0;
          int v97 = 0;
          int v98;
          int v99;
          v98 = v96;
          v99 = v97;
          while (true) {
            int v100 = 4;
            int v101 = v3 % v100;
            int v102 = 1;
            int v103 = v101 + v102;
            bool v104 = v99 < v103;
            v98 = v98;
            v99 = v99;
            if (!v104) break;
            int v105 = 1;
            int v106 = 1;
            int v107 = v99 + v106;
            v98 = v105;
            v99 = v107;
          }
          int v108 = 0;
          int v109 = v0 + v108;
          v95 = v98;
          break;
        }
        default:
          {
          int v110 = 3;
          int v111 = v3 % v110;
          int v112 = 1;
          int v113;
          v113 = v112;
          switch (v111) {
            default:
              {
              v113 = v0;
              break;
            }
            case 0:
              {
              v113 = v0;
            }
            case 1:
              {
              int v114 = 0;
              v113 = v114;
              break;
            }
            case 2:
              {
              v113 = v0;
              break;
            }
          }
          int v115 = 2;
          int v116 = v0 + v115;
          v95 = v113;
          break;
        }
        case 1:
          {
          int v117 = 0;
          bool v118 = v2 != v117;
          int v119;
          if (v118) {
            int v120 = 0;
            int v121 = v0 + v120;
            v119 = v121;
          } else {
            v119 = v0;
          }
          v95 = v119;
          break;
        }
        case 2:
          {
          int v122 = 3;
          int v123 = v0 + v122;
          v95 = v123;
          break;
        }
      }
      int v124 = 0;
      int v125 = v0 + v124;
      v31 = v95;
      break;
    }
  }
  bool v126 = true;
  int v127 = simt_wave_count_bits(v126);
  int v128 = 16;
  int v129 = v128 + v0;
  v1[v129] = v127;
  int v130 = 0;
  bool v131 = v2 != v130;
  int v132 = v131 ? v6 : v31;
  return;
}

kernel void kernel_main(device int* v133 [[buffer(0)]], device int* v134 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v135 = static_cast<int>(__simt_tid3.x);
  int v136 = 0;
  int v137 = v136 + v135;
  int v138 = v134[v137];
  int v139 = 4;
  int v140 = v139 + v135;
  int v141 = v134[v140];
  helper0(v135, v133, v138, v141, static_cast<int>(__simt_tid3.x));
  int v142 = 8;
  int v143 = v142 + v135;
  int v144 = v134[v143];
  uint v145 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v146 = (int)(v145);
  int v147;
  v147 = v146;
  switch (v144) {
    case 0:
      {
      int v148 = 12;
      int v149 = v148 + v135;
      int v150 = v134[v149];
      int v151 = 0;
      bool v152 = v150 != v151;
      int v153;
      if (v152) {
        int v154 = 0;
        v153 = v154;
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
          int v161 = v160 + v135;
          int v162 = 16;
          int v163 = v162 + v161;
          int v164 = v134[v163];
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
        v153 = v157;
      }
      v147 = v153;
      break;
    }
    default:
      {
      v147 = v135;
      break;
    }
  }
  bool v171 = true;
  int v172 = 32;
  int v173 = v172 + v135;
  bool v174 = true;
  int v175 = simt_wave_count_bits(v174);
  v133[v173] = v175;
  int v176 = 0;
  int v177 = 0;
  int v178;
  int v179;
  v178 = v176;
  v179 = v177;
  while (true) {
    int v180 = 4;
    int v181 = v179 * v180;
    int v182 = v181 + v135;
    int v183 = 36;
    int v184 = v183 + v182;
    int v185 = v134[v184];
    int v186 = 0;
    bool v187 = v185 != v186;
    v178 = v178;
    v179 = v179;
    if (!v187) break;
    uint v188 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v189 = (int)(v188);
    int v190 = v178 + v189;
    int v191 = 1;
    int v192 = v179 + v191;
    v178 = v190;
    v179 = v192;
    continue;
    ;
  }
  bool v193 = true;
  int v194 = 48;
  int v195 = v194 + v135;
  bool v196 = true;
  int v197 = simt_wave_count_bits(v196);
  v133[v195] = v197;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 56; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
