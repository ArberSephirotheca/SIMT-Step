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
    int v13 = 4;
    int v14 = 1;
    int v15 = v7 + v14;
    v6 = v13;
    v7 = v15;
    break;
    ;
  }
  bool v16 = true;
  int v17 = simt_wave_count_bits(v16);
  int v18 = 0;
  int v19 = v18 + v0;
  v1[v19] = v17;
  int v20 = 4;
  int v21 = v3 % v20;
  uint v22 = simt_lane_id(__simt_tid);
  int v23 = (int)(v22);
  int v24;
  v24 = v23;
  switch (v21) {
    case 0:
      {
      int v25 = 0;
      bool v26 = v2 != v25;
      int v27;
      if (v26) {
        int v28 = 1;
        v27 = v28;
      } else {
        int v29 = 1;
        int v30 = v0 + v29;
        v27 = v30;
      }
      v24 = v27;
      break;
    }
    case 1:
      {
      int v31 = 0;
      bool v32 = v2 != v31;
      int v33;
      if (v32) {
        int v34 = 2;
        int v35 = v3 % v34;
        int v36 = 2;
        int v37;
        v37 = v36;
        switch (v35) {
          default:
            {
            int v38 = 4;
            int v39 = v0 + v38;
            v37 = v39;
            break;
          }
          case 0:
            {
            int v40 = 1;
            v37 = v40;
            break;
          }
        }
        v33 = v37;
      } else {
        int v41 = 0;
        bool v42 = v2 != v41;
        int v43;
        if (v42) {
          v43 = v0;
        } else {
          int v44 = 2;
          int v45 = v0 + v44;
          v43 = v45;
        }
        v33 = v43;
      }
      int v46 = 3;
      int v47 = v0 + v46;
      v24 = v33;
      break;
    }
    default:
      {
      int v48 = 0;
      bool v49 = v2 != v48;
      int v50;
      if (v49) {
        int v51 = 2;
        int v52 = v3 % v51;
        int v53 = 3;
        int v54;
        v54 = v53;
        switch (v52) {
          default:
            {
            v54 = v0;
            break;
          }
          case 0:
            {
            int v55 = 2;
            v54 = v55;
            break;
          }
        }
        v50 = v54;
      } else {
        v50 = v0;
      }
      v24 = v50;
      break;
    }
    case 2:
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
        int v65 = 0;
        bool v66 = v2 != v65;
        int v67;
        if (v66) {
          v67 = v0;
        } else {
          int v68 = 3;
          v67 = v68;
        }
        int v69 = 1;
        int v70 = v59 + v69;
        v58 = v67;
        v59 = v70;
      }
      int v71 = 4;
      int v72 = v0 + v71;
      v24 = v58;
      break;
    }
  }
  bool v73 = true;
  int v74 = simt_wave_count_bits(v73);
  int v75 = 16;
  int v76 = v75 + v0;
  v1[v76] = v74;
  int v77 = 0;
  bool v78 = v2 != v77;
  int v79 = v78 ? v6 : v24;
  return;
}

kernel void kernel_main(device int* v80 [[buffer(0)]], device int* v81 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v82 = static_cast<int>(__simt_tid3.x);
  int v83 = 0;
  int v84 = v83 + v82;
  int v85 = v81[v84];
  int v86 = 4;
  int v87 = v86 + v82;
  int v88 = v81[v87];
  helper0(v82, v80, v85, v88, static_cast<int>(__simt_tid3.x));
  int v89 = 8;
  int v90 = v89 + v82;
  int v91 = v81[v90];
  int v92;
  v92 = v82;
  switch (v91) {
    case 0:
      {
      int v93 = 0;
      int v94 = 0;
      int v95;
      int v96;
      v95 = v93;
      v96 = v94;
      while (true) {
        int v97 = 4;
        int v98 = v96 * v97;
        int v99 = v98 + v82;
        int v100 = 12;
        int v101 = v100 + v99;
        int v102 = v81[v101];
        int v103 = 0;
        bool v104 = v102 != v103;
        v95 = v95;
        v96 = v96;
        if (!v104) break;
        int v105 = v95 + v96;
        int v106 = 1;
        int v107 = v96 + v106;
        v95 = v105;
        v96 = v107;
      }
      bool v108 = true;
      v92 = v95;
      break;
    }
    case 1:
      {
      int v109 = 32;
      int v110 = v109 + v82;
      int v111 = v81[v110];
      int v112 = 0;
      bool v113 = v111 != v112;
      int v114;
      if (v113) {
        v114 = v82;
      } else {
        int v115 = 0;
        int v116 = 0;
        int v117;
        int v118;
        v117 = v115;
        v118 = v116;
        while (true) {
          int v119 = 4;
          int v120 = v118 * v119;
          int v121 = v120 + v82;
          int v122 = 36;
          int v123 = v122 + v121;
          int v124 = v81[v123];
          int v125 = 0;
          bool v126 = v124 != v125;
          v117 = v117;
          v118 = v118;
          if (!v126) break;
          int v127 = v117 + v118;
          int v128 = 1;
          int v129 = v118 + v128;
          v117 = v127;
          v118 = v129;
        }
        bool v130 = true;
        v114 = v117;
      }
      v92 = v114;
      break;
    }
    case 2:
      {
      v92 = v82;
      break;
    }
    default:
      {
      int v131 = 56;
      int v132 = v131 + v82;
      int v133 = v81[v132];
      int v134 = 4;
      int v135 = v82 + v134;
      int v136;
      v136 = v135;
      switch (v133) {
        default:
          {
          int v137 = 60;
          int v138 = v137 + v82;
          int v139 = v81[v138];
          int v140 = 0;
          bool v141 = v139 != v140;
          int v142;
          if (v141) {
            int v143 = 0;
            v142 = v143;
          } else {
            int v144 = 3;
            v142 = v144;
          }
          v136 = v142;
          break;
        }
        case 0:
          {
          int v145 = 64;
          int v146 = v145 + v82;
          int v147 = v81[v146];
          int v148 = 0;
          int v149 = v82 + v148;
          int v150;
          v150 = v149;
          switch (v147) {
            case 0:
              {
              int v151 = 1;
              int v152 = v82 + v151;
              v150 = v152;
              break;
            }
            default:
              {
              v150 = v82;
              break;
            }
            case 1:
              {
              int v153 = 0;
              v150 = v153;
              break;
            }
            case 2:
              {
              int v154 = 0;
              int v155 = v82 + v154;
              v150 = v155;
              break;
            }
          }
          bool v156 = true;
          v136 = v150;
          break;
        }
      }
      bool v157 = true;
      v92 = v136;
      break;
    }
  }
  bool v158 = true;
  int v159 = 32;
  int v160 = v159 + v82;
  bool v161 = true;
  int v162 = simt_wave_count_bits(v161);
  v80[v160] = v162;
  int v163 = 0;
  int v164 = 0;
  int v165;
  int v166;
  v165 = v163;
  v166 = v164;
  while (true) {
    int v167 = 4;
    int v168 = v166 * v167;
    int v169 = v168 + v82;
    int v170 = 68;
    int v171 = v170 + v169;
    int v172 = v81[v171];
    int v173 = 0;
    bool v174 = v172 != v173;
    v165 = v165;
    v166 = v166;
    if (!v174) break;
    int v175 = 88;
    int v176 = v175 + v82;
    int v177 = v81[v176];
    int v178 = 0;
    bool v179 = v177 != v178;
    int v180;
    if (v179) {
      int v181 = 0;
      int v182 = 0;
      int v183;
      int v184;
      v183 = v181;
      v184 = v182;
      while (true) {
        int v185 = 4;
        int v186 = v184 * v185;
        int v187 = v186 + v82;
        int v188 = 92;
        int v189 = v188 + v187;
        int v190 = v81[v189];
        int v191 = 0;
        bool v192 = v190 != v191;
        v183 = v183;
        v184 = v184;
        if (!v192) break;
        int v193 = v183 + v184;
        int v194 = 1;
        int v195 = v184 + v194;
        v183 = v193;
        v184 = v195;
        break;
        ;
      }
      bool v196 = true;
      v180 = v183;
    } else {
      int v197 = 112;
      int v198 = v197 + v82;
      int v199 = v81[v198];
      uint v200 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v201 = (int)(v200);
      int v202;
      v202 = v201;
      switch (v199) {
        default:
          {
          int v203 = 2;
          v202 = v203;
          break;
        }
        case 0:
          {
          v202 = v82;
          break;
        }
        case 1:
          {
          v202 = v82;
          break;
        }
        case 2:
          {
          v202 = v82;
          break;
        }
      }
      bool v204 = true;
      v180 = v202;
    }
    int v205 = v165 + v180;
    int v206 = 1;
    int v207 = v166 + v206;
    v165 = v205;
    v166 = v207;
    break;
    ;
  }
  bool v208 = true;
  int v209 = 48;
  int v210 = v209 + v82;
  bool v211 = true;
  int v212 = simt_wave_count_bits(v211);
  v80[v210] = v212;
  int v213 = 116;
  int v214 = v213 + v82;
  int v215 = v81[v214];
  int v216 = 0;
  bool v217 = v215 != v216;
  int v218;
  if (v217) {
    int v219 = 120;
    int v220 = v219 + v82;
    int v221 = v81[v220];
    int v222 = 0;
    bool v223 = v221 != v222;
    int v224;
    if (v223) {
      int v225 = 0;
      int v226 = 0;
      int v227;
      int v228;
      v227 = v225;
      v228 = v226;
      while (true) {
        int v229 = 4;
        int v230 = v228 * v229;
        int v231 = v230 + v82;
        int v232 = 124;
        int v233 = v232 + v231;
        int v234 = v81[v233];
        int v235 = 0;
        bool v236 = v234 != v235;
        v227 = v227;
        v228 = v228;
        if (!v236) break;
        int v237 = v227 + v228;
        int v238 = 1;
        int v239 = v228 + v238;
        v227 = v237;
        v228 = v239;
      }
      bool v240 = true;
      v224 = v227;
    } else {
      int v241 = 0;
      int v242 = 0;
      int v243;
      int v244;
      v243 = v241;
      v244 = v242;
      while (true) {
        int v245 = 4;
        int v246 = v244 * v245;
        int v247 = v246 + v82;
        int v248 = 144;
        int v249 = v248 + v247;
        int v250 = v81[v249];
        int v251 = 0;
        bool v252 = v250 != v251;
        v243 = v243;
        v244 = v244;
        if (!v252) break;
        int v253 = v243 + v244;
        int v254 = 1;
        int v255 = v244 + v254;
        v243 = v253;
        v244 = v255;
      }
      bool v256 = true;
      v224 = v243;
    }
    v218 = v224;
  } else {
    v218 = v82;
  }
  int v257 = 64;
  int v258 = v257 + v82;
  bool v259 = true;
  int v260 = simt_wave_count_bits(v259);
  v80[v258] = v260;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 164; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
