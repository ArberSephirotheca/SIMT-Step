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
  int v5 = v0 + v4;
  int v6 = 3;
  int v7 = v3 % v6;
  uint v8 = simt_subgroup_id(__simt_tid);
  int v9 = (int)(v8);
  int v10;
  v10 = v9;
  switch (v7) {
    case 0:
      {
      int v11 = 2;
      int v12 = v3 % v11;
      int v13 = 1;
      int v14;
      v14 = v13;
      switch (v12) {
        case 0:
          {
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
            int v24 = 0;
            int v25 = v0 + v24;
            int v26 = 1;
            int v27 = v18 + v26;
            v17 = v25;
            v18 = v27;
          }
          int v28 = 4;
          v14 = v17;
          break;
        }
        default:
          {
          int v29 = 4;
          v14 = v29;
          break;
        }
      }
      int v30 = 1;
      v10 = v14;
    }
    case 1:
      {
      int v31 = 4;
      int v32 = v3 % v31;
      int v33;
      v33 = v0;
      switch (v32) {
        case 0:
          {
          int v34 = 0;
          bool v35 = v2 != v34;
          int v36;
          if (v35) {
            int v37 = 3;
            int v38 = v0 + v37;
            v36 = v38;
          } else {
            v36 = v0;
          }
          int v39 = 4;
          v33 = v36;
          break;
        }
        case 1:
          {
          int v40 = 3;
          int v41 = v3 % v40;
          int v42 = 1;
          int v43;
          v43 = v42;
          switch (v41) {
            case 0:
              {
              int v44 = 2;
              v43 = v44;
              break;
            }
            default:
              {
              v43 = v0;
              break;
            }
            case 1:
              {
              int v45 = 1;
              v43 = v45;
            }
            case 2:
              {
              v43 = v0;
              break;
            }
          }
          v33 = v43;
          break;
        }
        case 2:
          {
          int v46 = 0;
          bool v47 = v2 != v46;
          int v48;
          if (v47) {
            int v49 = 3;
            v48 = v49;
          } else {
            v48 = v0;
          }
          int v50 = 4;
          int v51 = v0 + v50;
          v33 = v48;
          break;
        }
        default:
          {
          int v52 = 0;
          bool v53 = v2 != v52;
          int v54;
          if (v53) {
            int v55 = 0;
            v54 = v55;
          } else {
            v54 = v0;
          }
          int v56 = 0;
          int v57 = v0 + v56;
          v33 = v54;
          break;
        }
      }
      int v58 = 0;
      int v59 = v0 + v58;
      v10 = v33;
    }
    default:
      {
      int v60 = 0;
      bool v61 = v2 != v60;
      int v62;
      if (v61) {
        int v63 = 0;
        bool v64 = v2 != v63;
        int v65;
        if (v64) {
          int v66 = 2;
          int v67 = v0 + v66;
          v65 = v67;
        } else {
          int v68 = 0;
          int v69 = v0 + v68;
          v65 = v69;
        }
        v62 = v65;
      } else {
        int v70 = 0;
        int v71 = 0;
        int v72;
        int v73;
        v72 = v70;
        v73 = v71;
        while (true) {
          int v74 = 4;
          int v75 = v3 % v74;
          int v76 = 1;
          int v77 = v75 + v76;
          bool v78 = v73 < v77;
          v72 = v72;
          v73 = v73;
          if (!v78) break;
          int v79 = 0;
          int v80 = 1;
          int v81 = v73 + v80;
          v72 = v79;
          v73 = v81;
        }
        v62 = v72;
      }
      v10 = v62;
      break;
    }
    case 2:
      {
      int v82 = 0;
      int v83;
      v83 = v82;
      switch (v3) {
        default:
          {
          int v84 = 3;
          int v85 = v3 % v84;
          int v86 = 2;
          int v87;
          v87 = v86;
          switch (v85) {
            case 0:
              {
              int v88 = 4;
              v87 = v88;
              break;
            }
            default:
              {
              int v89 = 2;
              v87 = v89;
            }
            case 1:
              {
              int v90 = 3;
              v87 = v90;
              break;
            }
          }
          v83 = v87;
          break;
        }
        case 0:
          {
          int v91 = 2;
          int v92 = v3 % v91;
          int v93 = 4;
          int v94;
          v94 = v93;
          switch (v92) {
            default:
              {
              int v95 = 2;
              v94 = v95;
              break;
            }
            case 0:
              {
              int v96 = 3;
              v94 = v96;
            }
            case 1:
              {
              v94 = v0;
              break;
            }
          }
          int v97 = 4;
          v83 = v94;
          break;
        }
      }
      int v98 = 2;
      int v99 = v0 + v98;
      v10 = v83;
      break;
    }
  }
  bool v100 = true;
  int v101 = simt_wave_count_bits(v100);
  int v102 = 0;
  int v103 = v102 + v0;
  v1[v103] = v101;
  int v104 = 0;
  bool v105 = v2 != v104;
  int v106 = v105 ? v5 : v10;
  return;
}

kernel void kernel_main(device int* v107 [[buffer(0)]], device int* v108 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v109 = static_cast<int>(__simt_tid3.x);
  int v110 = 0;
  int v111 = v110 + v109;
  int v112 = v108[v111];
  int v113 = 4;
  int v114 = v113 + v109;
  int v115 = v108[v114];
  helper0(v109, v107, v112, v115, static_cast<int>(__simt_tid3.x));
  int v116 = 0;
  int v117 = 0;
  int v118;
  int v119;
  v118 = v116;
  v119 = v117;
  while (true) {
    int v120 = 4;
    int v121 = v119 * v120;
    int v122 = v121 + v109;
    int v123 = 8;
    int v124 = v123 + v122;
    int v125 = v108[v124];
    int v126 = 0;
    bool v127 = v125 != v126;
    v118 = v118;
    v119 = v119;
    if (!v127) break;
    uint v128 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v129 = (int)(v128);
    int v130 = v118 + v129;
    int v131 = 1;
    int v132 = v119 + v131;
    v118 = v130;
    v119 = v132;
    continue;
    ;
  }
  bool v133 = true;
  int v134 = 16;
  int v135 = v134 + v109;
  bool v136 = true;
  int v137 = simt_wave_count_bits(v136);
  v107[v135] = v137;
  int v138 = 28;
  int v139 = v138 + v109;
  int v140 = v108[v139];
  int v141 = 3;
  int v142 = v109 + v141;
  int v143;
  v143 = v142;
  switch (v140) {
    default:
      {
      int v144 = 32;
      int v145 = v144 + v109;
      int v146 = v108[v145];
      int v147 = 0;
      int v148;
      v148 = v147;
      switch (v146) {
        case 0:
          {
          int v149 = 0;
          int v150 = 0;
          int v151;
          int v152;
          v151 = v149;
          v152 = v150;
          while (true) {
            int v153 = 4;
            int v154 = v152 * v153;
            int v155 = v154 + v109;
            int v156 = 36;
            int v157 = v156 + v155;
            int v158 = v108[v157];
            int v159 = 0;
            bool v160 = v158 != v159;
            v151 = v151;
            v152 = v152;
            if (!v160) break;
            int v161 = v151 + v152;
            int v162 = 1;
            int v163 = v152 + v162;
            v151 = v161;
            v152 = v163;
          }
          bool v164 = true;
          v148 = v151;
        }
        case 1:
          {
          int v165 = 0;
          int v166 = 0;
          int v167;
          int v168;
          v167 = v165;
          v168 = v166;
          while (true) {
            int v169 = 4;
            int v170 = v168 * v169;
            int v171 = v170 + v109;
            int v172 = 56;
            int v173 = v172 + v171;
            int v174 = v108[v173];
            int v175 = 0;
            bool v176 = v174 != v175;
            v167 = v167;
            v168 = v168;
            if (!v176) break;
            int v177 = v167 + v168;
            int v178 = 1;
            int v179 = v168 + v178;
            v167 = v177;
            v168 = v179;
            break;
            ;
          }
          bool v180 = true;
          v148 = v167;
        }
        default:
          {
          int v181 = 76;
          int v182 = v181 + v109;
          int v183 = v108[v182];
          int v184 = 0;
          bool v185 = v183 != v184;
          int v186;
          if (v185) {
            v186 = v109;
          } else {
            int v187 = 2;
            v186 = v187;
          }
          v148 = v186;
          break;
        }
        case 2:
          {
          int v188 = 80;
          int v189 = v188 + v109;
          int v190 = v108[v189];
          int v191;
          v191 = v109;
          switch (v190) {
            case 0:
              {
              int v192 = 1;
              v191 = v192;
              break;
            }
            default:
              {
              v191 = v109;
              break;
            }
          }
          bool v193 = true;
          v148 = v191;
          break;
        }
      }
      bool v194 = true;
      v143 = v148;
    }
    case 0:
      {
      int v195 = 1;
      v143 = v195;
      break;
    }
  }
  bool v196 = true;
  int v197 = 32;
  int v198 = v197 + v109;
  bool v199 = true;
  int v200 = simt_wave_count_bits(v199);
  v107[v198] = v200;
  int v201 = 84;
  int v202 = v201 + v109;
  int v203 = v108[v202];
  int v204 = 0;
  bool v205 = v203 != v204;
  int v206;
  if (v205) {
    int v207 = 88;
    int v208 = v207 + v109;
    int v209 = v108[v208];
    int v210 = 2;
    int v211 = v109 + v210;
    int v212;
    v212 = v211;
    switch (v209) {
      case 0:
        {
        int v213 = 92;
        int v214 = v213 + v109;
        int v215 = v108[v214];
        int v216 = 0;
        bool v217 = v215 != v216;
        int v218;
        if (v217) {
          int v219 = 2;
          int v220 = v109 + v219;
          v218 = v220;
        } else {
          int v221 = 1;
          v218 = v221;
        }
        v212 = v218;
        break;
      }
      default:
        {
        int v222 = 96;
        int v223 = v222 + v109;
        int v224 = v108[v223];
        int v225 = 0;
        bool v226 = v224 != v225;
        int v227;
        if (v226) {
          int v228 = 2;
          v227 = v228;
        } else {
          int v229 = 2;
          v227 = v229;
        }
        v212 = v227;
        break;
      }
      case 1:
        {
        int v230 = 0;
        v212 = v230;
      }
      case 2:
        {
        int v231 = 100;
        int v232 = v231 + v109;
        int v233 = v108[v232];
        int v234 = 0;
        int v235;
        v235 = v234;
        switch (v233) {
          case 0:
            {
            int v236 = 1;
            v235 = v236;
            break;
          }
          case 1:
            {
            v235 = v109;
            break;
          }
          case 2:
            {
            int v237 = 4;
            int v238 = v109 + v237;
            v235 = v238;
            break;
          }
          default:
            {
            v235 = v109;
            break;
          }
        }
        bool v239 = true;
        v212 = v235;
        break;
      }
    }
    bool v240 = true;
    v206 = v212;
  } else {
    v206 = v109;
  }
  int v241 = 48;
  int v242 = v241 + v109;
  bool v243 = true;
  int v244 = simt_wave_count_bits(v243);
  v107[v242] = v244;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 104; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
