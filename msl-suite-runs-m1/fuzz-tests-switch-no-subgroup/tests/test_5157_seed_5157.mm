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
  int v4 = 4;
  int v5 = v3 % v4;
  int v6 = 3;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 4;
      int v10 = v3 % v9;
      int v11 = 0;
      int v12;
      v12 = v11;
      switch (v10) {
        case 0:
          {
          int v13 = 3;
          int v14 = v3 % v13;
          int v15 = 1;
          int v16 = v0 + v15;
          int v17;
          v17 = v16;
          switch (v14) {
            case 0:
              {
              v17 = v0;
            }
            default:
              {
              v17 = v0;
              break;
            }
            case 1:
              {
              int v18 = 4;
              v17 = v18;
            }
            case 2:
              {
              int v19 = 4;
              int v20 = v0 + v19;
              v17 = v20;
              break;
            }
          }
          v12 = v17;
          break;
        }
        default:
          {
          int v21 = 0;
          int v22 = 0;
          int v23;
          int v24;
          v23 = v21;
          v24 = v22;
          while (true) {
            int v25 = 4;
            int v26 = v3 % v25;
            int v27 = 1;
            int v28 = v26 + v27;
            bool v29 = v24 < v28;
            v23 = v23;
            v24 = v24;
            if (!v29) break;
            int v30 = 1;
            int v31 = 1;
            int v32 = v24 + v31;
            v23 = v30;
            v24 = v32;
          }
          v12 = v23;
        }
        case 1:
          {
          int v33 = 0;
          int v34 = 0;
          int v35;
          int v36;
          v35 = v33;
          v36 = v34;
          while (true) {
            int v37 = 4;
            int v38 = v3 % v37;
            int v39 = 1;
            int v40 = v38 + v39;
            bool v41 = v36 < v40;
            v35 = v35;
            v36 = v36;
            if (!v41) break;
            int v42 = 0;
            int v43 = v0 + v42;
            int v44 = 1;
            int v45 = v36 + v44;
            v35 = v43;
            v36 = v45;
          }
          v12 = v35;
          break;
        }
        case 2:
          {
          int v46 = 3;
          int v47 = v3 % v46;
          int v48 = 2;
          int v49 = v0 + v48;
          int v50;
          v50 = v49;
          switch (v47) {
            case 0:
              {
              int v51 = 4;
              v50 = v51;
            }
            case 1:
              {
              int v52 = 0;
              int v53 = v0 + v52;
              v50 = v53;
              break;
            }
            case 2:
              {
              int v54 = 3;
              int v55 = v0 + v54;
              v50 = v55;
              break;
            }
            default:
              {
              v50 = v0;
              break;
            }
          }
          v12 = v50;
          break;
        }
      }
      v8 = v12;
    }
    case 0:
      {
      int v56 = 4;
      int v57 = v3 % v56;
      int v58;
      v58 = v0;
      switch (v57) {
        case 0:
          {
          int v59 = 4;
          int v60 = v3 % v59;
          int v61 = 4;
          int v62;
          v62 = v61;
          switch (v60) {
            case 0:
              {
              int v63 = 0;
              int v64 = v0 + v63;
              v62 = v64;
              break;
            }
            default:
              {
              int v65 = 3;
              int v66 = v0 + v65;
              v62 = v66;
              break;
            }
            case 1:
              {
              int v67 = 2;
              v62 = v67;
              break;
            }
            case 2:
              {
              int v68 = 3;
              int v69 = v0 + v68;
              v62 = v69;
              break;
            }
          }
          int v70 = 3;
          v58 = v62;
          break;
        }
        default:
          {
          int v71 = 4;
          int v72 = v3 % v71;
          int v73 = 4;
          int v74;
          v74 = v73;
          switch (v72) {
            case 0:
              {
              v74 = v0;
              break;
            }
            case 1:
              {
              int v75 = 1;
              v74 = v75;
              break;
            }
            case 2:
              {
              int v76 = 1;
              v74 = v76;
              break;
            }
            default:
              {
              int v77 = 1;
              int v78 = v0 + v77;
              v74 = v78;
              break;
            }
          }
          v58 = v74;
          break;
        }
        case 1:
          {
          int v79 = 4;
          int v80 = v3 % v79;
          int v81 = 3;
          int v82 = v0 + v81;
          int v83;
          v83 = v82;
          switch (v80) {
            case 0:
              {
              v83 = v0;
            }
            case 1:
              {
              int v84 = 1;
              int v85 = v0 + v84;
              v83 = v85;
              break;
            }
            case 2:
              {
              int v86 = 0;
              int v87 = v0 + v86;
              v83 = v87;
              break;
            }
            default:
              {
              int v88 = 2;
              int v89 = v0 + v88;
              v83 = v89;
              break;
            }
          }
          v58 = v83;
        }
        case 2:
          {
          int v90 = 0;
          bool v91 = v2 != v90;
          int v92;
          if (v91) {
            v92 = v0;
          } else {
            int v93 = 3;
            int v94 = v0 + v93;
            v92 = v94;
          }
          v58 = v92;
          break;
        }
      }
      v8 = v58;
      break;
    }
    case 1:
      {
      int v95 = 2;
      v8 = v95;
    }
    case 2:
      {
      int v96 = 0;
      bool v97 = v2 != v96;
      int v98;
      if (v97) {
        int v99 = 4;
        v98 = v99;
      } else {
        int v100 = 0;
        bool v101 = v2 != v100;
        int v102;
        if (v101) {
          int v103 = 1;
          v102 = v103;
        } else {
          v102 = v0;
        }
        v98 = v102;
      }
      v8 = v98;
      break;
    }
  }
  bool v104 = true;
  int v105 = simt_wave_count_bits(v104);
  int v106 = 0;
  int v107 = v106 + v0;
  v1[v107] = v105;
  return;
}

kernel void kernel_main(device int* v108 [[buffer(0)]], device int* v109 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v110 = static_cast<int>(__simt_tid3.x);
  int v111 = 0;
  int v112 = v111 + v110;
  int v113 = v109[v112];
  int v114 = 4;
  int v115 = v114 + v110;
  int v116 = v109[v115];
  helper0(v110, v108, v113, v116, static_cast<int>(__simt_tid3.x));
  int v117 = 8;
  int v118 = v117 + v110;
  int v119 = v109[v118];
  int v120 = 3;
  int v121 = v110 + v120;
  int v122;
  v122 = v121;
  switch (v119) {
    case 0:
      {
      int v123 = 0;
      int v124 = 0;
      int v125;
      int v126;
      v125 = v123;
      v126 = v124;
      while (true) {
        int v127 = 4;
        int v128 = v126 * v127;
        int v129 = v128 + v110;
        int v130 = 12;
        int v131 = v130 + v129;
        int v132 = v109[v131];
        int v133 = 0;
        bool v134 = v132 != v133;
        v125 = v125;
        v126 = v126;
        if (!v134) break;
        int v135 = v125 + v110;
        int v136 = 1;
        int v137 = v126 + v136;
        bool v138 = true;
        v125 = v135;
        v126 = v137;
      }
      v122 = v125;
      break;
    }
    case 1:
      {
      int v139 = 32;
      int v140 = v139 + v110;
      int v141 = v109[v140];
      int v142 = 0;
      bool v143 = v141 != v142;
      int v144;
      if (v143) {
        int v145 = 36;
        int v146 = v145 + v110;
        int v147 = v109[v146];
        int v148 = 0;
        bool v149 = v147 != v148;
        int v150;
        if (v149) {
          int v151 = 2;
          int v152 = v110 + v151;
          v150 = v152;
        } else {
          int v153 = 1;
          int v154 = v110 + v153;
          v150 = v154;
        }
        v144 = v150;
      } else {
        v144 = v110;
      }
      v122 = v144;
      break;
    }
    default:
      {
      int v155 = 40;
      int v156 = v155 + v110;
      int v157 = v109[v156];
      int v158 = 0;
      bool v159 = v157 != v158;
      int v160;
      if (v159) {
        int v161 = 44;
        int v162 = v161 + v110;
        int v163 = v109[v162];
        int v164 = 0;
        bool v165 = v163 != v164;
        int v166;
        if (v165) {
          int v167 = 2;
          v166 = v167;
        } else {
          int v168 = 4;
          int v169 = v110 + v168;
          v166 = v169;
        }
        v160 = v166;
      } else {
        int v170 = 48;
        int v171 = v170 + v110;
        int v172 = v109[v171];
        int v173 = 0;
        bool v174 = v172 != v173;
        int v175;
        if (v174) {
          v175 = v110;
        } else {
          int v176 = 4;
          int v177 = v110 + v176;
          v175 = v177;
        }
        v160 = v175;
      }
      v122 = v160;
      break;
    }
  }
  uint v178 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v179 = (int)(v178);
  int v180 = 0;
  int v181 = 0;
  int v182;
  int v183;
  v182 = v180;
  v183 = v181;
  while (true) {
    int v184 = 4;
    int v185 = v183 * v184;
    int v186 = v185 + v110;
    int v187 = 52;
    int v188 = v187 + v186;
    int v189 = v109[v188];
    int v190 = 0;
    bool v191 = v189 != v190;
    v182 = v182;
    v183 = v183;
    if (!v191) break;
    int v192 = v182 + v183;
    int v193 = 1;
    int v194 = v183 + v193;
    bool v195 = true;
    int v196 = 16;
    int v197 = 4;
    int v198 = v183 * v197;
    int v199 = v196 + v198;
    int v200 = v199 + v110;
    bool v201 = true;
    int v202 = simt_wave_count_bits(v201);
    v108[v200] = v202;
    v182 = v192;
    v183 = v194;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 32; ++idx) {
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
