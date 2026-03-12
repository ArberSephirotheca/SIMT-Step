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
  int v4 = 3;
  int v5 = v3 % v4;
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 3;
      int v10 = v3 % v9;
      int v11;
      v11 = v0;
      switch (v10) {
        default:
          {
          int v12 = 3;
          int v13 = v3 % v12;
          int v14 = 3;
          int v15;
          v15 = v14;
          switch (v13) {
            default:
              {
              v15 = v0;
            }
            case 0:
              {
              v15 = v0;
            }
            case 1:
              {
              v15 = v0;
              break;
            }
          }
          int v16 = 2;
          int v17 = v0 + v16;
          v11 = v15;
          break;
        }
        case 0:
          {
          int v18 = 0;
          bool v19 = v2 != v18;
          int v20;
          if (v19) {
            int v21 = 0;
            v20 = v21;
          } else {
            int v22 = 2;
            v20 = v22;
          }
          int v23 = 4;
          int v24 = v0 + v23;
          v11 = v20;
          break;
        }
        case 1:
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
          }
          int v36 = 2;
          v11 = v27;
          break;
        }
        case 2:
          {
          int v37 = 1;
          int v38;
          v38 = v37;
          switch (v3) {
            case 0:
              {
              v38 = v0;
            }
            default:
              {
              int v39 = 0;
              v38 = v39;
              break;
            }
          }
          v11 = v38;
          break;
        }
      }
      int v40 = 4;
      v8 = v11;
      break;
    }
    case 1:
      {
      int v41 = 2;
      int v42 = v3 % v41;
      int v43 = 3;
      int v44;
      v44 = v43;
      switch (v42) {
        case 0:
          {
          int v45 = 2;
          int v46 = v3 % v45;
          int v47 = 2;
          int v48;
          v48 = v47;
          switch (v46) {
            default:
              {
              int v49 = 2;
              int v50 = v0 + v49;
              v48 = v50;
              break;
            }
            case 0:
              {
              int v51 = 2;
              int v52 = v0 + v51;
              v48 = v52;
              break;
            }
          }
          int v53 = 0;
          v44 = v48;
          break;
        }
        case 1:
          {
          int v54 = 1;
          int v55 = v0 + v54;
          v44 = v55;
          break;
        }
        default:
          {
          v44 = v0;
          break;
        }
      }
      int v56 = 4;
      v8 = v44;
      break;
    }
    default:
      {
      int v57 = 3;
      int v58 = v3 % v57;
      int v59 = 3;
      int v60 = v0 + v59;
      int v61;
      v61 = v60;
      switch (v58) {
        case 0:
          {
          int v62 = 3;
          int v63 = v3 % v62;
          int v64 = 2;
          int v65 = v0 + v64;
          int v66;
          v66 = v65;
          switch (v63) {
            default:
              {
              v66 = v0;
              break;
            }
            case 0:
              {
              v66 = v0;
              break;
            }
            case 1:
              {
              v66 = v0;
              break;
            }
          }
          v61 = v66;
          break;
        }
        case 1:
          {
          int v67 = 4;
          int v68 = v3 % v67;
          int v69 = 1;
          int v70 = v0 + v69;
          int v71;
          v71 = v70;
          switch (v68) {
            case 0:
              {
              int v72 = 3;
              v71 = v72;
              break;
            }
            default:
              {
              int v73 = 0;
              int v74 = v0 + v73;
              v71 = v74;
              break;
            }
            case 1:
              {
              int v75 = 3;
              v71 = v75;
              break;
            }
            case 2:
              {
              int v76 = 3;
              int v77 = v0 + v76;
              v71 = v77;
              break;
            }
          }
          int v78 = 4;
          int v79 = v0 + v78;
          v61 = v71;
          break;
        }
        case 2:
          {
          int v80 = 1;
          int v81 = v0 + v80;
          int v82;
          v82 = v81;
          switch (v3) {
            case 0:
              {
              v82 = v0;
              break;
            }
            default:
              {
              v82 = v0;
              break;
            }
          }
          int v83 = 4;
          v61 = v82;
          break;
        }
        default:
          {
          int v84 = 3;
          int v85 = v3 % v84;
          int v86 = 1;
          int v87;
          v87 = v86;
          switch (v85) {
            default:
              {
              int v88 = 3;
              v87 = v88;
            }
            case 0:
              {
              v87 = v0;
              break;
            }
            case 1:
              {
              int v89 = 4;
              int v90 = v0 + v89;
              v87 = v90;
            }
            case 2:
              {
              int v91 = 0;
              int v92 = v0 + v91;
              v87 = v92;
              break;
            }
          }
          int v93 = 1;
          v61 = v87;
          break;
        }
      }
      int v94 = 3;
      v8 = v61;
      break;
    }
  }
  bool v95 = true;
  int v96 = simt_wave_count_bits(v95);
  int v97 = 0;
  int v98 = v97 + v0;
  v1[v98] = v96;
  return;
}

kernel void kernel_main(device int* v99 [[buffer(0)]], device int* v100 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v101 = static_cast<int>(__simt_tid3.x);
  int v102 = 0;
  int v103 = v102 + v101;
  int v104 = v100[v103];
  int v105 = 4;
  int v106 = v105 + v101;
  int v107 = v100[v106];
  helper0(v101, v99, v104, v107, static_cast<int>(__simt_tid3.x));
  int v108 = 8;
  int v109 = v108 + v101;
  int v110 = v100[v109];
  int v111 = 0;
  bool v112 = v110 != v111;
  int v113;
  if (v112) {
    int v114 = 0;
    int v115 = 0;
    int v116;
    int v117;
    v116 = v114;
    v117 = v115;
    while (true) {
      int v118 = 4;
      int v119 = v117 * v118;
      int v120 = v119 + v101;
      int v121 = 12;
      int v122 = v121 + v120;
      int v123 = v100[v122];
      int v124 = 0;
      bool v125 = v123 != v124;
      v116 = v116;
      v117 = v117;
      if (!v125) break;
      int v126 = v116 + v117;
      int v127 = 1;
      int v128 = v117 + v127;
      v116 = v126;
      v117 = v128;
      continue;
      ;
    }
    bool v129 = true;
    v113 = v116;
  } else {
    int v130 = 32;
    int v131 = v130 + v101;
    int v132 = v100[v131];
    int v133 = 0;
    bool v134 = v132 != v133;
    int v135;
    if (v134) {
      int v136 = 36;
      int v137 = v136 + v101;
      int v138 = v100[v137];
      int v139 = 0;
      bool v140 = v138 != v139;
      int v141;
      if (v140) {
        v141 = v101;
      } else {
        int v142 = 2;
        int v143 = v101 + v142;
        v141 = v143;
      }
      v135 = v141;
    } else {
      int v144 = 0;
      int v145 = 0;
      int v146;
      int v147;
      v146 = v144;
      v147 = v145;
      while (true) {
        int v148 = 4;
        int v149 = v147 * v148;
        int v150 = v149 + v101;
        int v151 = 40;
        int v152 = v151 + v150;
        int v153 = v100[v152];
        int v154 = 0;
        bool v155 = v153 != v154;
        v146 = v146;
        v147 = v147;
        if (!v155) break;
        int v156 = v146 + v147;
        int v157 = 1;
        int v158 = v147 + v157;
        v146 = v156;
        v147 = v158;
      }
      bool v159 = true;
      v135 = v146;
    }
    v113 = v135;
  }
  int v160 = 16;
  int v161 = v160 + v101;
  bool v162 = true;
  int v163 = simt_wave_count_bits(v162);
  v99[v161] = v163;
  int v164 = 60;
  int v165 = v164 + v101;
  int v166 = v100[v165];
  int v167 = 1;
  int v168;
  v168 = v167;
  switch (v166) {
    case 0:
      {
      int v169 = 64;
      int v170 = v169 + v101;
      int v171 = v100[v170];
      int v172 = 2;
      int v173 = v101 + v172;
      int v174;
      v174 = v173;
      switch (v171) {
        case 0:
          {
          int v175 = 0;
          int v176 = 0;
          int v177;
          int v178;
          v177 = v175;
          v178 = v176;
          while (true) {
            int v179 = 4;
            int v180 = v178 * v179;
            int v181 = v180 + v101;
            int v182 = 68;
            int v183 = v182 + v181;
            int v184 = v100[v183];
            int v185 = 0;
            bool v186 = v184 != v185;
            v177 = v177;
            v178 = v178;
            if (!v186) break;
            int v187 = v177 + v178;
            int v188 = 1;
            int v189 = v178 + v188;
            v177 = v187;
            v178 = v189;
          }
          bool v190 = true;
          v174 = v177;
          break;
        }
        default:
          {
          int v191 = 2;
          v174 = v191;
          break;
        }
      }
      bool v192 = true;
      v168 = v174;
      break;
    }
    default:
      {
      int v193 = 88;
      int v194 = v193 + v101;
      int v195 = v100[v194];
      int v196 = 2;
      int v197;
      v197 = v196;
      switch (v195) {
        case 0:
          {
          int v198 = 92;
          int v199 = v198 + v101;
          int v200 = v100[v199];
          int v201 = 4;
          int v202 = v101 + v201;
          int v203;
          v203 = v202;
          switch (v200) {
            case 0:
              {
              int v204 = 4;
              int v205 = v101 + v204;
              v203 = v205;
              break;
            }
            case 1:
              {
              v203 = v101;
              break;
            }
            default:
              {
              v203 = v101;
              break;
            }
          }
          bool v206 = true;
          v197 = v203;
          break;
        }
        case 1:
          {
          int v207 = 96;
          int v208 = v207 + v101;
          int v209 = v100[v208];
          int v210 = 0;
          bool v211 = v209 != v210;
          int v212;
          if (v211) {
            int v213 = 2;
            int v214 = v101 + v213;
            v212 = v214;
          } else {
            int v215 = 4;
            int v216 = v101 + v215;
            v212 = v216;
          }
          v197 = v212;
          break;
        }
        case 2:
          {
          int v217 = 100;
          int v218 = v217 + v101;
          int v219 = v100[v218];
          int v220;
          v220 = v101;
          switch (v219) {
            case 0:
              {
              int v221 = 1;
              int v222 = v101 + v221;
              v220 = v222;
              break;
            }
            default:
              {
              int v223 = 2;
              v220 = v223;
              break;
            }
          }
          bool v224 = true;
          v197 = v220;
          break;
        }
        default:
          {
          int v225 = 104;
          int v226 = v225 + v101;
          int v227 = v100[v226];
          int v228 = 2;
          int v229 = v101 + v228;
          int v230;
          v230 = v229;
          switch (v227) {
            case 0:
              {
              int v231 = 3;
              v230 = v231;
              break;
            }
            default:
              {
              int v232 = 1;
              v230 = v232;
            }
            case 1:
              {
              v230 = v101;
              break;
            }
          }
          bool v233 = true;
          v197 = v230;
          break;
        }
      }
      bool v234 = true;
      v168 = v197;
      break;
    }
    case 1:
      {
      int v235 = 0;
      int v236 = 0;
      int v237;
      int v238;
      v237 = v235;
      v238 = v236;
      while (true) {
        int v239 = 4;
        int v240 = v238 * v239;
        int v241 = v240 + v101;
        int v242 = 108;
        int v243 = v242 + v241;
        int v244 = v100[v243];
        int v245 = 0;
        bool v246 = v244 != v245;
        v237 = v237;
        v238 = v238;
        if (!v246) break;
        int v247 = 1;
        int v248 = v101 + v247;
        int v249 = v237 + v248;
        int v250 = 1;
        int v251 = v238 + v250;
        v237 = v249;
        v238 = v251;
        continue;
        ;
      }
      bool v252 = true;
      v168 = v237;
      break;
    }
  }
  bool v253 = true;
  int v254 = 32;
  int v255 = v254 + v101;
  bool v256 = true;
  int v257 = simt_wave_count_bits(v256);
  v99[v255] = v257;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 128; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
