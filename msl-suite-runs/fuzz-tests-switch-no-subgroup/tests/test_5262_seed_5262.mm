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
      bool v16 = true;
      int v17 = simt_wave_count_bits(v16);
      int v18 = 0;
      int v19 = 4;
      int v20 = v10 * v19;
      int v21 = v18 + v20;
      int v22 = v21 + v0;
      v1[v22] = v17;
      int v23 = 1;
      int v24 = v10 + v23;
      v9 = v17;
      v10 = v24;
    }
    v6 = v9;
  } else {
    bool v25 = true;
    int v26 = simt_wave_count_bits(v25);
    int v27 = 16;
    int v28 = v27 + v0;
    v1[v28] = v26;
    v6 = v26;
  }
  int v29 = 0;
  int v30 = 0;
  int v31;
  int v32;
  v31 = v29;
  v32 = v30;
  while (true) {
    int v33 = 4;
    int v34 = v3 % v33;
    int v35 = 1;
    int v36 = v34 + v35;
    bool v37 = v32 < v36;
    v31 = v31;
    v32 = v32;
    if (!v37) break;
    int v38 = 0;
    int v39 = 0;
    int v40;
    int v41;
    v40 = v38;
    v41 = v39;
    while (true) {
      int v42 = 4;
      int v43 = v3 % v42;
      int v44 = 1;
      int v45 = v43 + v44;
      bool v46 = v41 < v45;
      v40 = v40;
      v41 = v41;
      if (!v46) break;
      int v47 = 0;
      int v48 = 0;
      int v49;
      int v50;
      v49 = v47;
      v50 = v48;
      while (true) {
        int v51 = 4;
        int v52 = v3 % v51;
        int v53 = 1;
        int v54 = v52 + v53;
        bool v55 = v50 < v54;
        v49 = v49;
        v50 = v50;
        if (!v55) break;
        bool v56 = true;
        int v57 = simt_wave_count_bits(v56);
        int v58 = 32;
        int v59 = 4;
        int v60 = v50 * v59;
        int v61 = v58 + v60;
        int v62 = v61 + v0;
        v1[v62] = v57;
        int v63 = 1;
        int v64 = v50 + v63;
        v49 = v57;
        v50 = v64;
        continue;
        ;
      }
      int v65 = 1;
      int v66 = v41 + v65;
      v40 = v49;
      v41 = v66;
    }
    int v67 = 1;
    int v68 = v32 + v67;
    v31 = v40;
    v32 = v68;
  }
  int v69 = 0;
  bool v70 = v2 != v69;
  int v71 = v70 ? v6 : v31;
  return;
}

kernel void kernel_main(device int* v72 [[buffer(0)]], device int* v73 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v74 = static_cast<int>(__simt_tid3.x);
  int v75 = 0;
  int v76 = v75 + v74;
  int v77 = v73[v76];
  int v78 = 4;
  int v79 = v78 + v74;
  int v80 = v73[v79];
  int v81 = 0;
  bool v82 = v77 != v81;
  if (v82) {
    int v83 = 0;
    int v84 = 0;
    int v85;
    int v86;
    v85 = v83;
    v86 = v84;
    while (true) {
      int v87 = 2;
      bool v88 = v86 < v87;
      v85 = v85;
      v86 = v86;
      if (!v88) break;
      int v89;
      v89 = v74;
      switch (v74) {
        case 0:
          {
          int v90 = 4;
          int v91 = v89 + v90;
          v89 = v91;
          break;
        }
        default:
          {
          int v92 = 3;
          int v93 = v89 + v92;
          v89 = v93;
          break;
        }
      }
      helper0(v74, v72, v77, v80, static_cast<int>(__simt_tid3.x));
      int v94 = 1;
      int v95 = v86 + v94;
      v85 = v85;
      v86 = v95;
    }
  } else {
  }
  int v96 = 8;
  int v97 = v96 + v74;
  int v98 = v73[v97];
  int v99 = 0;
  int v100 = v74 + v99;
  int v101;
  v101 = v100;
  switch (v98) {
    case 0:
      {
      v101 = v74;
      break;
    }
    case 1:
      {
      int v102 = 12;
      int v103 = v102 + v74;
      int v104 = v73[v103];
      int v105 = 4;
      int v106;
      v106 = v105;
      switch (v104) {
        case 0:
          {
          int v107 = 2;
          int v108 = v74 + v107;
          v106 = v108;
          break;
        }
        default:
          {
          int v109 = 3;
          v106 = v109;
          break;
        }
        case 1:
          {
          int v110 = 0;
          int v111 = 0;
          int v112;
          int v113;
          v112 = v110;
          v113 = v111;
          while (true) {
            int v114 = 4;
            int v115 = v113 * v114;
            int v116 = v115 + v74;
            int v117 = 16;
            int v118 = v117 + v116;
            int v119 = v73[v118];
            int v120 = 0;
            bool v121 = v119 != v120;
            v112 = v112;
            v113 = v113;
            if (!v121) break;
            int v122 = v112 + v113;
            int v123 = 1;
            int v124 = v113 + v123;
            bool v125 = true;
            v112 = v122;
            v113 = v124;
          }
          v106 = v112;
          break;
        }
        case 2:
          {
          int v126 = 36;
          int v127 = v126 + v74;
          int v128 = v73[v127];
          int v129 = 0;
          bool v130 = v128 != v129;
          int v131;
          if (v130) {
            v131 = v74;
          } else {
            int v132 = 4;
            int v133 = v74 + v132;
            v131 = v133;
          }
          v106 = v131;
          break;
        }
      }
      v101 = v106;
      break;
    }
    default:
      {
      int v134 = 40;
      int v135 = v134 + v74;
      int v136 = v73[v135];
      int v137 = 0;
      bool v138 = v136 != v137;
      int v139;
      if (v138) {
        v139 = v74;
      } else {
        v139 = v74;
      }
      v101 = v139;
      break;
    }
  }
  int v140 = 44;
  int v141 = v140 + v74;
  int v142 = v73[v141];
  uint v143 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v144 = (int)(v143);
  int v145;
  v145 = v144;
  switch (v142) {
    default:
      {
      int v146 = 48;
      int v147 = v146 + v74;
      int v148 = v73[v147];
      int v149;
      v149 = v74;
      switch (v148) {
        case 0:
          {
          int v150 = 2;
          v149 = v150;
          break;
        }
        case 1:
          {
          int v151 = 52;
          int v152 = v151 + v74;
          int v153 = v73[v152];
          int v154;
          v154 = v74;
          switch (v153) {
            default:
              {
              int v155 = 1;
              v154 = v155;
              break;
            }
            case 0:
              {
              int v156 = 3;
              int v157 = v74 + v156;
              v154 = v157;
              break;
            }
          }
          v149 = v154;
          break;
        }
        default:
          {
          int v158 = 2;
          v149 = v158;
          break;
        }
        case 2:
          {
          int v159 = 56;
          int v160 = v159 + v74;
          int v161 = v73[v160];
          int v162 = 0;
          bool v163 = v161 != v162;
          int v164;
          if (v163) {
            v164 = v74;
          } else {
            int v165 = 1;
            int v166 = v74 + v165;
            v164 = v166;
          }
          v149 = v164;
          break;
        }
      }
      v145 = v149;
      break;
    }
    case 0:
      {
      int v167 = 60;
      int v168 = v167 + v74;
      int v169 = v73[v168];
      int v170 = 4;
      int v171 = v74 + v170;
      int v172;
      v172 = v171;
      switch (v169) {
        case 0:
          {
          int v173 = 0;
          int v174 = 0;
          int v175;
          int v176;
          v175 = v173;
          v176 = v174;
          while (true) {
            int v177 = 4;
            int v178 = v176 * v177;
            int v179 = v178 + v74;
            int v180 = 64;
            int v181 = v180 + v179;
            int v182 = v73[v181];
            int v183 = 0;
            bool v184 = v182 != v183;
            v175 = v175;
            v176 = v176;
            if (!v184) break;
            int v185 = v175 + v176;
            int v186 = 1;
            int v187 = v176 + v186;
            bool v188 = true;
            v175 = v185;
            v176 = v187;
          }
          v172 = v175;
          break;
        }
        default:
          {
          int v189 = 84;
          int v190 = v189 + v74;
          int v191 = v73[v190];
          int v192 = 2;
          int v193 = v74 + v192;
          int v194;
          v194 = v193;
          switch (v191) {
            default:
              {
              int v195 = 4;
              v194 = v195;
              break;
            }
            case 0:
              {
              int v196 = 1;
              int v197 = v74 + v196;
              v194 = v197;
              break;
            }
          }
          v172 = v194;
          break;
        }
      }
      bool v198 = true;
      v145 = v172;
    }
    case 1:
      {
      int v199 = 88;
      int v200 = v199 + v74;
      int v201 = v73[v200];
      int v202 = 2;
      int v203;
      v203 = v202;
      switch (v201) {
        case 0:
          {
          int v204 = 92;
          int v205 = v204 + v74;
          int v206 = v73[v205];
          int v207 = 0;
          bool v208 = v206 != v207;
          int v209;
          if (v208) {
            int v210 = 0;
            int v211 = v74 + v210;
            v209 = v211;
          } else {
            int v212 = 2;
            int v213 = v74 + v212;
            v209 = v213;
          }
          v203 = v209;
          break;
        }
        case 1:
          {
          int v214 = 96;
          int v215 = v214 + v74;
          int v216 = v73[v215];
          int v217 = 3;
          int v218;
          v218 = v217;
          switch (v216) {
            default:
              {
              v218 = v74;
              break;
            }
            case 0:
              {
              int v219 = 3;
              int v220 = v74 + v219;
              v218 = v220;
              break;
            }
          }
          v203 = v218;
          break;
        }
        default:
          {
          int v221 = 100;
          int v222 = v221 + v74;
          int v223 = v73[v222];
          int v224 = 4;
          int v225 = v74 + v224;
          int v226;
          v226 = v225;
          switch (v223) {
            default:
              {
              v226 = v74;
              break;
            }
            case 0:
              {
              int v227 = 4;
              v226 = v227;
              break;
            }
            case 1:
              {
              int v228 = 1;
              int v229 = v74 + v228;
              v226 = v229;
              break;
            }
            case 2:
              {
              int v230 = 2;
              int v231 = v74 + v230;
              v226 = v231;
              break;
            }
          }
          bool v232 = true;
          v203 = v226;
          break;
        }
        case 2:
          {
          int v233 = 2;
          v203 = v233;
          break;
        }
      }
      v145 = v203;
      break;
    }
    case 2:
      {
      int v234 = 104;
      int v235 = v234 + v74;
      int v236 = v73[v235];
      int v237 = 2;
      int v238 = v74 + v237;
      int v239;
      v239 = v238;
      switch (v236) {
        case 0:
          {
          int v240 = 108;
          int v241 = v240 + v74;
          int v242 = v73[v241];
          int v243 = 3;
          int v244;
          v244 = v243;
          switch (v242) {
            default:
              {
              int v245 = 1;
              int v246 = v74 + v245;
              v244 = v246;
            }
            case 0:
              {
              int v247 = 0;
              v244 = v247;
            }
            case 1:
              {
              int v248 = 0;
              v244 = v248;
              break;
            }
          }
          bool v249 = true;
          v239 = v244;
          break;
        }
        default:
          {
          v239 = v74;
          break;
        }
        case 1:
          {
          int v250 = 112;
          int v251 = v250 + v74;
          int v252 = v73[v251];
          int v253 = 0;
          bool v254 = v252 != v253;
          int v255;
          if (v254) {
            int v256 = 1;
            int v257 = v74 + v256;
            v255 = v257;
          } else {
            int v258 = 4;
            int v259 = v74 + v258;
            v255 = v259;
          }
          v239 = v255;
          break;
        }
      }
      bool v260 = true;
      v145 = v239;
      break;
    }
  }
  bool v261 = true;
  int v262 = 48;
  int v263 = v262 + v74;
  bool v264 = true;
  int v265 = simt_wave_count_bits(v264);
  v72[v263] = v265;
  int v266 = 116;
  int v267 = v266 + v74;
  int v268 = v73[v267];
  uint v269 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v270 = (int)(v269);
  int v271;
  v271 = v270;
  switch (v268) {
    default:
      {
      int v272 = 4;
      int v273 = v74 + v272;
      v271 = v273;
      break;
    }
    case 0:
      {
      int v274 = 120;
      int v275 = v274 + v74;
      int v276 = v73[v275];
      int v277 = 2;
      int v278 = v74 + v277;
      int v279;
      v279 = v278;
      switch (v276) {
        case 0:
          {
          v279 = v74;
          break;
        }
        case 1:
          {
          int v280 = 124;
          int v281 = v280 + v74;
          int v282 = v73[v281];
          int v283 = 2;
          int v284;
          v284 = v283;
          switch (v282) {
            case 0:
              {
              v284 = v74;
              break;
            }
            default:
              {
              v284 = v74;
              break;
            }
          }
          bool v285 = true;
          v279 = v284;
          break;
        }
        default:
          {
          int v286 = 0;
          int v287 = 0;
          int v288;
          int v289;
          v288 = v286;
          v289 = v287;
          while (true) {
            int v290 = 4;
            int v291 = v289 * v290;
            int v292 = v291 + v74;
            int v293 = 128;
            int v294 = v293 + v292;
            int v295 = v73[v294];
            int v296 = 0;
            bool v297 = v295 != v296;
            v288 = v288;
            v289 = v289;
            if (!v297) break;
            int v298 = v288 + v289;
            int v299 = 1;
            int v300 = v289 + v299;
            bool v301 = true;
            v288 = v298;
            v289 = v300;
          }
          v279 = v288;
          break;
        }
      }
      bool v302 = true;
      v271 = v279;
      break;
    }
  }
  bool v303 = true;
  int v304 = 64;
  int v305 = v304 + v74;
  bool v306 = true;
  int v307 = simt_wave_count_bits(v306);
  v72[v305] = v307;
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
    static int32_t expected0[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 148; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
