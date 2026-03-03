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
    int v13 = 0;
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
  int v20 = 3;
  int v21 = v3 % v20;
  int v22 = 3;
  int v23;
  v23 = v22;
  switch (v21) {
    case 0:
      {
      int v24 = 2;
      int v25 = v3 % v24;
      int v26 = 0;
      int v27;
      v27 = v26;
      switch (v25) {
        default:
          {
          int v28 = 0;
          int v29 = 0;
          int v30;
          int v31;
          v30 = v28;
          v31 = v29;
          while (true) {
            int v32 = 4;
            int v33 = v3 % v32;
            int v34 = 1;
            int v35 = v33 + v34;
            bool v36 = v31 < v35;
            v30 = v30;
            v31 = v31;
            if (!v36) break;
            int v37 = 1;
            int v38 = v31 + v37;
            v30 = v0;
            v31 = v38;
          }
          int v39 = 4;
          v27 = v30;
          break;
        }
        case 0:
          {
          int v40 = 3;
          int v41 = v3 % v40;
          int v42 = 4;
          int v43;
          v43 = v42;
          switch (v41) {
            case 0:
              {
              int v44 = 2;
              int v45 = v0 + v44;
              v43 = v45;
              break;
            }
            case 1:
              {
              int v46 = 0;
              int v47 = v0 + v46;
              v43 = v47;
              break;
            }
            case 2:
              {
              int v48 = 3;
              v43 = v48;
              break;
            }
            default:
              {
              v43 = v0;
              break;
            }
          }
          int v49 = 3;
          v27 = v43;
          break;
        }
        case 1:
          {
          int v50 = 0;
          bool v51 = v2 != v50;
          int v52;
          if (v51) {
            int v53 = 0;
            v52 = v53;
          } else {
            int v54 = 1;
            int v55 = v0 + v54;
            v52 = v55;
          }
          int v56 = 0;
          int v57 = v0 + v56;
          v27 = v52;
          break;
        }
      }
      int v58 = 1;
      v23 = v27;
      break;
    }
    case 1:
      {
      int v59 = 3;
      int v60 = v3 % v59;
      int v61 = 4;
      int v62;
      v62 = v61;
      switch (v60) {
        case 0:
          {
          int v63 = 2;
          int v64 = v0 + v63;
          v62 = v64;
          break;
        }
        case 1:
          {
          int v65 = 3;
          int v66 = v3 % v65;
          int v67;
          v67 = v0;
          switch (v66) {
            default:
              {
              int v68 = 1;
              int v69 = v0 + v68;
              v67 = v69;
              break;
            }
            case 0:
              {
              int v70 = 4;
              v67 = v70;
            }
            case 1:
              {
              v67 = v0;
              break;
            }
          }
          int v71 = 3;
          int v72 = v0 + v71;
          v62 = v67;
          break;
        }
        default:
          {
          int v73 = 0;
          bool v74 = v2 != v73;
          int v75;
          if (v74) {
            int v76 = 0;
            v75 = v76;
          } else {
            int v77 = 4;
            v75 = v77;
          }
          v62 = v75;
          break;
        }
      }
      v23 = v62;
      break;
    }
    case 2:
      {
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
        int v87 = 0;
        bool v88 = v2 != v87;
        int v89;
        if (v88) {
          int v90 = 4;
          int v91 = v0 + v90;
          v89 = v91;
        } else {
          int v92 = 2;
          int v93 = v0 + v92;
          v89 = v93;
        }
        int v94 = 0;
        int v95 = 1;
        int v96 = v81 + v95;
        v80 = v89;
        v81 = v96;
      }
      int v97 = 2;
      v23 = v80;
      break;
    }
    default:
      {
      int v98 = 0;
      int v99 = 0;
      int v100;
      int v101;
      v100 = v98;
      v101 = v99;
      while (true) {
        int v102 = 4;
        int v103 = v3 % v102;
        int v104 = 1;
        int v105 = v103 + v104;
        bool v106 = v101 < v105;
        v100 = v100;
        v101 = v101;
        if (!v106) break;
        int v107 = 0;
        bool v108 = v2 != v107;
        int v109;
        if (v108) {
          int v110 = 1;
          v109 = v110;
        } else {
          int v111 = 4;
          int v112 = v0 + v111;
          v109 = v112;
        }
        int v113 = 3;
        int v114 = 1;
        int v115 = v101 + v114;
        v100 = v109;
        v101 = v115;
      }
      int v116 = 1;
      v23 = v100;
      break;
    }
  }
  bool v117 = true;
  int v118 = simt_wave_count_bits(v117);
  int v119 = 16;
  int v120 = v119 + v0;
  v1[v120] = v118;
  int v121 = 0;
  bool v122 = v2 != v121;
  int v123 = v122 ? v6 : v23;
  return;
}

kernel void kernel_main(device int* v124 [[buffer(0)]], device int* v125 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v126 = static_cast<int>(__simt_tid3.x);
  int v127 = 0;
  int v128 = v127 + v126;
  int v129 = v125[v128];
  int v130 = 4;
  int v131 = v130 + v126;
  int v132 = v125[v131];
  helper0(v126, v124, v129, v132, static_cast<int>(__simt_tid3.x));
  int v133 = 0;
  int v134 = 0;
  int v135;
  int v136;
  v135 = v133;
  v136 = v134;
  while (true) {
    int v137 = 4;
    int v138 = v136 * v137;
    int v139 = v138 + v126;
    int v140 = 8;
    int v141 = v140 + v139;
    int v142 = v125[v141];
    int v143 = 0;
    bool v144 = v142 != v143;
    v135 = v135;
    v136 = v136;
    if (!v144) break;
    int v145 = 28;
    int v146 = v145 + v126;
    int v147 = v125[v146];
    int v148 = 0;
    bool v149 = v147 != v148;
    int v150;
    if (v149) {
      int v151 = 32;
      int v152 = v151 + v126;
      int v153 = v125[v152];
      int v154 = 0;
      bool v155 = v153 != v154;
      int v156;
      if (v155) {
        v156 = v126;
      } else {
        uint v157 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v158 = (int)(v157);
        v156 = v158;
      }
      v150 = v156;
    } else {
      int v159 = 36;
      int v160 = v159 + v126;
      int v161 = v125[v160];
      int v162 = 0;
      bool v163 = v161 != v162;
      int v164;
      if (v163) {
        uint v165 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v166 = (int)(v165);
        v164 = v166;
      } else {
        uint v167 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v168 = (int)(v167);
        v164 = v168;
      }
      v150 = v164;
    }
    int v169 = v135 + v150;
    int v170 = 1;
    int v171 = v136 + v170;
    v135 = v169;
    v136 = v171;
    break;
    ;
  }
  bool v172 = true;
  int v173 = 32;
  int v174 = v173 + v126;
  bool v175 = true;
  int v176 = simt_wave_count_bits(v175);
  v124[v174] = v176;
  int v177 = 40;
  int v178 = v177 + v126;
  int v179 = v125[v178];
  int v180 = 0;
  bool v181 = v179 != v180;
  int v182;
  if (v181) {
    int v183 = 44;
    int v184 = v183 + v126;
    int v185 = v125[v184];
    int v186 = 0;
    bool v187 = v185 != v186;
    int v188;
    if (v187) {
      int v189 = 0;
      int v190 = 0;
      int v191;
      int v192;
      v191 = v189;
      v192 = v190;
      while (true) {
        int v193 = 4;
        int v194 = v192 * v193;
        int v195 = v194 + v126;
        int v196 = 48;
        int v197 = v196 + v195;
        int v198 = v125[v197];
        int v199 = 0;
        bool v200 = v198 != v199;
        v191 = v191;
        v192 = v192;
        if (!v200) break;
        int v201 = v191 + v192;
        int v202 = 1;
        int v203 = v192 + v202;
        v191 = v201;
        v192 = v203;
      }
      bool v204 = true;
      v188 = v191;
    } else {
      v188 = v126;
    }
    v182 = v188;
  } else {
    int v205 = 68;
    int v206 = v205 + v126;
    int v207 = v125[v206];
    uint v208 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v209 = (int)(v208);
    int v210;
    v210 = v209;
    switch (v207) {
      case 0:
        {
        int v211 = 72;
        int v212 = v211 + v126;
        int v213 = v125[v212];
        int v214 = 0;
        bool v215 = v213 != v214;
        int v216;
        if (v215) {
          int v217 = 1;
          v216 = v217;
        } else {
          int v218 = 4;
          int v219 = v126 + v218;
          v216 = v219;
        }
        v210 = v216;
        break;
      }
      default:
        {
        int v220 = 76;
        int v221 = v220 + v126;
        int v222 = v125[v221];
        int v223 = 2;
        int v224;
        v224 = v223;
        switch (v222) {
          case 0:
            {
            v224 = v126;
            break;
          }
          case 1:
            {
            int v225 = 2;
            v224 = v225;
          }
          case 2:
            {
            int v226 = 2;
            int v227 = v126 + v226;
            v224 = v227;
          }
          default:
            {
            v224 = v126;
            break;
          }
        }
        bool v228 = true;
        v210 = v224;
        break;
      }
    }
    bool v229 = true;
    v182 = v210;
  }
  int v230 = 48;
  int v231 = v230 + v126;
  bool v232 = true;
  int v233 = simt_wave_count_bits(v232);
  v124[v231] = v233;
  int v234 = 0;
  int v235 = 0;
  int v236;
  int v237;
  v236 = v234;
  v237 = v235;
  while (true) {
    int v238 = 4;
    int v239 = v237 * v238;
    int v240 = v239 + v126;
    int v241 = 80;
    int v242 = v241 + v240;
    int v243 = v125[v242];
    int v244 = 0;
    bool v245 = v243 != v244;
    v236 = v236;
    v237 = v237;
    if (!v245) break;
    int v246 = 0;
    int v247 = 0;
    int v248;
    int v249;
    v248 = v246;
    v249 = v247;
    while (true) {
      int v250 = 4;
      int v251 = v249 * v250;
      int v252 = v251 + v126;
      int v253 = 100;
      int v254 = v253 + v252;
      int v255 = v125[v254];
      int v256 = 0;
      bool v257 = v255 != v256;
      v248 = v248;
      v249 = v249;
      if (!v257) break;
      int v258 = v248 + v249;
      int v259 = 1;
      int v260 = v249 + v259;
      v248 = v258;
      v249 = v260;
    }
    bool v261 = true;
    int v262 = v236 + v248;
    int v263 = 1;
    int v264 = v237 + v263;
    v236 = v262;
    v237 = v264;
  }
  bool v265 = true;
  int v266 = 64;
  int v267 = v266 + v126;
  bool v268 = true;
  int v269 = simt_wave_count_bits(v268);
  v124[v267] = v269;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 120; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
