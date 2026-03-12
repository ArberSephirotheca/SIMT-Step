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
    bool v17 = true;
    int v18 = simt_wave_count_bits(v17);
    int v19 = 16;
    int v20 = 4;
    int v21 = v11 * v20;
    int v22 = v19 + v21;
    int v23 = v22 + v0;
    v1[v23] = v18;
    int v24 = 1;
    int v25 = v11 + v24;
    v10 = v18;
    v11 = v25;
  }
  int v26 = 0;
  bool v27 = v2 != v26;
  int v28 = v27 ? v5 : v10;
  int v29 = 4;
  int v30 = v3 % v29;
  uint v31 = simt_lane_id(__simt_tid);
  int v32 = (int)(v31);
  int v33;
  v33 = v32;
  switch (v30) {
    case 0:
      {
      int v34 = 0;
      int v35 = 0;
      int v36;
      int v37;
      v36 = v34;
      v37 = v35;
      while (true) {
        int v38 = 4;
        int v39 = v3 % v38;
        int v40 = 1;
        int v41 = v39 + v40;
        bool v42 = v37 < v41;
        v36 = v36;
        v37 = v37;
        if (!v42) break;
        int v43 = 0;
        bool v44 = v2 != v43;
        int v45;
        if (v44) {
          v45 = v0;
        } else {
          v45 = v0;
        }
        int v46 = 1;
        int v47 = v37 + v46;
        v36 = v45;
        v37 = v47;
        break;
        ;
      }
      v33 = v36;
    }
    default:
      {
      int v48 = 3;
      int v49 = v3 % v48;
      int v50 = 1;
      int v51 = v0 + v50;
      int v52;
      v52 = v51;
      switch (v49) {
        default:
          {
          int v53 = 4;
          int v54 = v3 % v53;
          int v55 = 4;
          int v56 = v0 + v55;
          int v57;
          v57 = v56;
          switch (v54) {
            default:
              {
              int v58 = 3;
              int v59 = v0 + v58;
              v57 = v59;
              break;
            }
            case 0:
              {
              int v60 = 4;
              v57 = v60;
              break;
            }
            case 1:
              {
              int v61 = 3;
              int v62 = v0 + v61;
              v57 = v62;
              break;
            }
            case 2:
              {
              int v63 = 1;
              int v64 = v0 + v63;
              v57 = v64;
              break;
            }
          }
          v52 = v57;
          break;
        }
        case 0:
          {
          int v65 = 3;
          int v66 = v3 % v65;
          int v67 = 1;
          int v68;
          v68 = v67;
          switch (v66) {
            case 0:
              {
              int v69 = 0;
              int v70 = v0 + v69;
              v68 = v70;
              break;
            }
            default:
              {
              int v71 = 0;
              v68 = v71;
              break;
            }
            case 1:
              {
              v68 = v0;
              break;
            }
            case 2:
              {
              v68 = v0;
              break;
            }
          }
          v52 = v68;
        }
        case 1:
          {
          int v72 = 0;
          bool v73 = v2 != v72;
          int v74;
          if (v73) {
            int v75 = 1;
            v74 = v75;
          } else {
            v74 = v0;
          }
          v52 = v74;
          break;
        }
      }
      v33 = v52;
    }
    case 1:
      {
      int v76 = 0;
      bool v77 = v2 != v76;
      int v78;
      if (v77) {
        int v79 = 3;
        int v80 = v3 % v79;
        int v81 = 1;
        int v82;
        v82 = v81;
        switch (v80) {
          case 0:
            {
            int v83 = 1;
            v82 = v83;
            break;
          }
          default:
            {
            v82 = v0;
            break;
          }
          case 1:
            {
            int v84 = 2;
            v82 = v84;
            break;
          }
        }
        int v85 = 1;
        int v86 = v0 + v85;
        v78 = v82;
      } else {
        int v87 = 2;
        int v88 = v3 % v87;
        int v89 = 3;
        int v90 = v0 + v89;
        int v91;
        v91 = v90;
        switch (v88) {
          default:
            {
            int v92 = 3;
            int v93 = v0 + v92;
            v91 = v93;
            break;
          }
          case 0:
            {
            v91 = v0;
          }
          case 1:
            {
            int v94 = 0;
            v91 = v94;
            break;
          }
        }
        v78 = v91;
      }
      v33 = v78;
    }
    case 2:
      {
      int v95 = 4;
      int v96 = v3 % v95;
      int v97 = 0;
      int v98 = v0 + v97;
      int v99;
      v99 = v98;
      switch (v96) {
        case 0:
          {
          int v100 = 0;
          int v101 = 0;
          int v102;
          int v103;
          v102 = v100;
          v103 = v101;
          while (true) {
            int v104 = 4;
            int v105 = v3 % v104;
            int v106 = 1;
            int v107 = v105 + v106;
            bool v108 = v103 < v107;
            v102 = v102;
            v103 = v103;
            if (!v108) break;
            int v109 = 3;
            int v110 = v0 + v109;
            int v111 = 1;
            int v112 = v103 + v111;
            v102 = v110;
            v103 = v112;
          }
          v99 = v102;
          break;
        }
        default:
          {
          int v113 = 3;
          int v114 = v3 % v113;
          int v115;
          v115 = v0;
          switch (v114) {
            case 0:
              {
              int v116 = 3;
              int v117 = v0 + v116;
              v115 = v117;
              break;
            }
            default:
              {
              v115 = v0;
              break;
            }
            case 1:
              {
              int v118 = 2;
              int v119 = v0 + v118;
              v115 = v119;
              break;
            }
          }
          v99 = v115;
          break;
        }
        case 1:
          {
          int v120 = 0;
          bool v121 = v2 != v120;
          int v122;
          if (v121) {
            v122 = v0;
          } else {
            int v123 = 1;
            int v124 = v0 + v123;
            v122 = v124;
          }
          v99 = v122;
          break;
        }
        case 2:
          {
          int v125 = 0;
          int v126 = v0 + v125;
          int v127;
          v127 = v126;
          switch (v3) {
            default:
              {
              int v128 = 3;
              v127 = v128;
              break;
            }
            case 0:
              {
              int v129 = 1;
              v127 = v129;
              break;
            }
          }
          v99 = v127;
          break;
        }
      }
      v33 = v99;
      break;
    }
  }
  int v130 = 0;
  bool v131 = v2 != v130;
  int v132 = v131 ? v28 : v33;
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
  int v145 = 0;
  bool v146 = v144 != v145;
  int v147;
  if (v146) {
    int v148 = 0;
    int v149 = 0;
    int v150;
    int v151;
    v150 = v148;
    v151 = v149;
    while (true) {
      int v152 = 4;
      int v153 = v151 * v152;
      int v154 = v153 + v135;
      int v155 = 12;
      int v156 = v155 + v154;
      int v157 = v134[v156];
      int v158 = 0;
      bool v159 = v157 != v158;
      v150 = v150;
      v151 = v151;
      if (!v159) break;
      int v160 = 32;
      int v161 = v160 + v135;
      int v162 = v134[v161];
      int v163 = 0;
      int v164;
      v164 = v163;
      switch (v162) {
        case 0:
          {
          int v165 = 4;
          int v166 = v135 + v165;
          v164 = v166;
          break;
        }
        case 1:
          {
          v164 = v135;
          break;
        }
        case 2:
          {
          int v167 = 3;
          v164 = v167;
        }
        default:
          {
          int v168 = 2;
          int v169 = v135 + v168;
          v164 = v169;
          break;
        }
      }
      int v170 = v150 + v164;
      int v171 = 1;
      int v172 = v151 + v171;
      bool v173 = true;
      int v174 = 32;
      int v175 = 4;
      int v176 = v151 * v175;
      int v177 = v174 + v176;
      int v178 = v177 + v135;
      bool v179 = true;
      int v180 = simt_wave_count_bits(v179);
      v133[v178] = v180;
      v150 = v170;
      v151 = v172;
    }
    v147 = v150;
  } else {
    int v181 = 0;
    int v182 = 0;
    int v183;
    int v184;
    v183 = v181;
    v184 = v182;
    while (true) {
      int v185 = 4;
      int v186 = v184 * v185;
      int v187 = v186 + v135;
      int v188 = 36;
      int v189 = v188 + v187;
      int v190 = v134[v189];
      int v191 = 0;
      bool v192 = v190 != v191;
      v183 = v183;
      v184 = v184;
      if (!v192) break;
      int v193 = v183 + v184;
      int v194 = 1;
      int v195 = v184 + v194;
      bool v196 = true;
      int v197 = 48;
      int v198 = 4;
      int v199 = v184 * v198;
      int v200 = v197 + v199;
      int v201 = v200 + v135;
      bool v202 = true;
      int v203 = simt_wave_count_bits(v202);
      v133[v201] = v203;
      v183 = v193;
      v184 = v195;
      continue;
      ;
    }
    v147 = v183;
  }
  int v204 = 64;
  int v205 = v204 + v135;
  bool v206 = true;
  int v207 = simt_wave_count_bits(v206);
  v133[v205] = v207;
  int v208 = 56;
  int v209 = v208 + v135;
  int v210 = v134[v209];
  int v211 = 0;
  bool v212 = v210 != v211;
  int v213;
  if (v212) {
    int v214 = 60;
    int v215 = v214 + v135;
    int v216 = v134[v215];
    int v217 = 0;
    bool v218 = v216 != v217;
    int v219;
    if (v218) {
      int v220 = 64;
      int v221 = v220 + v135;
      int v222 = v134[v221];
      int v223 = 0;
      int v224;
      v224 = v223;
      switch (v222) {
        case 0:
          {
          v224 = v135;
          break;
        }
        case 1:
          {
          v224 = v135;
          break;
        }
        default:
          {
          int v225 = 1;
          v224 = v225;
          break;
        }
      }
      v219 = v224;
    } else {
      v219 = v135;
    }
    int v226 = 80;
    int v227 = v226 + v135;
    bool v228 = true;
    int v229 = simt_wave_count_bits(v228);
    v133[v227] = v229;
    v213 = v219;
  } else {
    int v230 = 68;
    int v231 = v230 + v135;
    int v232 = v134[v231];
    int v233 = 2;
    int v234;
    v234 = v233;
    switch (v232) {
      case 0:
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
          int v241 = v240 + v135;
          int v242 = 72;
          int v243 = v242 + v241;
          int v244 = v134[v243];
          int v245 = 0;
          bool v246 = v244 != v245;
          v237 = v237;
          v238 = v238;
          if (!v246) break;
          int v247 = v237 + v238;
          int v248 = 1;
          int v249 = v238 + v248;
          bool v250 = true;
          v237 = v247;
          v238 = v249;
        }
        v234 = v237;
      }
      default:
        {
        int v251 = 92;
        int v252 = v251 + v135;
        int v253 = v134[v252];
        int v254 = 0;
        bool v255 = v253 != v254;
        int v256;
        if (v255) {
          int v257 = 3;
          v256 = v257;
        } else {
          int v258 = 2;
          v256 = v258;
        }
        v234 = v256;
        break;
      }
    }
    v213 = v234;
  }
  int v259 = 96;
  int v260 = v259 + v135;
  bool v261 = true;
  int v262 = simt_wave_count_bits(v261);
  v133[v260] = v262;
  int v263 = 0;
  int v264 = 0;
  int v265;
  int v266;
  v265 = v263;
  v266 = v264;
  while (true) {
    int v267 = 4;
    int v268 = v266 * v267;
    int v269 = v268 + v135;
    int v270 = 96;
    int v271 = v270 + v269;
    int v272 = v134[v271];
    int v273 = 0;
    bool v274 = v272 != v273;
    v265 = v265;
    v266 = v266;
    if (!v274) break;
    int v275 = 116;
    int v276 = v275 + v135;
    int v277 = v134[v276];
    int v278;
    v278 = v135;
    switch (v277) {
      case 0:
        {
        int v279 = 120;
        int v280 = v279 + v135;
        int v281 = v134[v280];
        int v282 = 0;
        bool v283 = v281 != v282;
        int v284;
        if (v283) {
          v284 = v135;
        } else {
          int v285 = 0;
          int v286 = v135 + v285;
          v284 = v286;
        }
        v278 = v284;
        break;
      }
      case 1:
        {
        int v287 = 124;
        int v288 = v287 + v135;
        int v289 = v134[v288];
        int v290 = 0;
        bool v291 = v289 != v290;
        int v292;
        if (v291) {
          v292 = v135;
        } else {
          v292 = v135;
        }
        v278 = v292;
        break;
      }
      case 2:
        {
        int v293 = 0;
        int v294 = 0;
        int v295;
        int v296;
        v295 = v293;
        v296 = v294;
        while (true) {
          int v297 = 4;
          int v298 = v296 * v297;
          int v299 = v298 + v135;
          int v300 = 128;
          int v301 = v300 + v299;
          int v302 = v134[v301];
          int v303 = 0;
          bool v304 = v302 != v303;
          v295 = v295;
          v296 = v296;
          if (!v304) break;
          int v305 = v295 + v296;
          int v306 = 1;
          int v307 = v296 + v306;
          bool v308 = true;
          v295 = v305;
          v296 = v307;
          break;
          ;
        }
        v278 = v295;
        break;
      }
      default:
        {
        int v309 = 0;
        int v310 = 0;
        int v311;
        int v312;
        v311 = v309;
        v312 = v310;
        while (true) {
          int v313 = 4;
          int v314 = v312 * v313;
          int v315 = v314 + v135;
          int v316 = 148;
          int v317 = v316 + v315;
          int v318 = v134[v317];
          int v319 = 0;
          bool v320 = v318 != v319;
          v311 = v311;
          v312 = v312;
          if (!v320) break;
          int v321 = v311 + v312;
          int v322 = 1;
          int v323 = v312 + v322;
          bool v324 = true;
          v311 = v321;
          v312 = v323;
        }
        v278 = v311;
        break;
      }
    }
    int v325 = v265 + v278;
    int v326 = 1;
    int v327 = v266 + v326;
    bool v328 = true;
    int v329 = 112;
    int v330 = 4;
    int v331 = v266 * v330;
    int v332 = v329 + v331;
    int v333 = v332 + v135;
    bool v334 = true;
    int v335 = simt_wave_count_bits(v334);
    v133[v333] = v335;
    v265 = v325;
    v266 = v327;
    continue;
    ;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 120; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 168; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
