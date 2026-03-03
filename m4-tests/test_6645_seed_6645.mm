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
    bool v13 = true;
    int v14 = simt_wave_count_bits(v13);
    int v15 = 0;
    int v16 = 4;
    int v17 = v7 * v16;
    int v18 = v15 + v17;
    int v19 = v18 + v0;
    v1[v19] = v14;
    int v20 = 1;
    int v21 = v7 + v20;
    v6 = v14;
    v7 = v21;
  }
  int v22 = 3;
  int v23 = v3 % v22;
  int v24;
  v24 = v0;
  switch (v23) {
    case 0:
      {
      int v25 = 0;
      bool v26 = v2 != v25;
      int v27;
      if (v26) {
        int v28 = 0;
        bool v29 = v2 != v28;
        int v30;
        if (v29) {
          int v31 = 4;
          int v32 = v0 + v31;
          v30 = v32;
        } else {
          int v33 = 4;
          v30 = v33;
        }
        v27 = v30;
      } else {
        int v34 = 3;
        int v35 = v3 % v34;
        int v36 = 3;
        int v37 = v0 + v36;
        int v38;
        v38 = v37;
        switch (v35) {
          case 0:
            {
            int v39 = 0;
            int v40 = v0 + v39;
            v38 = v40;
            break;
          }
          case 1:
            {
            int v41 = 4;
            v38 = v41;
            break;
          }
          case 2:
            {
            int v42 = 2;
            v38 = v42;
            break;
          }
          default:
            {
            v38 = v0;
            break;
          }
        }
        v27 = v38;
      }
      v24 = v27;
      break;
    }
    case 1:
      {
      int v43 = 2;
      int v44 = v3 % v43;
      int v45 = 2;
      int v46 = v0 + v45;
      int v47;
      v47 = v46;
      switch (v44) {
        case 0:
          {
          int v48 = 1;
          v47 = v48;
          break;
        }
        case 1:
          {
          int v49 = 4;
          int v50 = v3 % v49;
          int v51 = 2;
          int v52 = v0 + v51;
          int v53;
          v53 = v52;
          switch (v50) {
            case 0:
              {
              int v54 = 3;
              v53 = v54;
              break;
            }
            case 1:
              {
              int v55 = 4;
              int v56 = v0 + v55;
              v53 = v56;
              break;
            }
            case 2:
              {
              int v57 = 3;
              int v58 = v0 + v57;
              v53 = v58;
              break;
            }
            default:
              {
              v53 = v0;
              break;
            }
          }
          v47 = v53;
          break;
        }
        default:
          {
          int v59 = 4;
          int v60 = v3 % v59;
          int v61;
          v61 = v0;
          switch (v60) {
            case 0:
              {
              v61 = v0;
              break;
            }
            case 1:
              {
              int v62 = 0;
              int v63 = v0 + v62;
              v61 = v63;
              break;
            }
            case 2:
              {
              int v64 = 3;
              int v65 = v0 + v64;
              v61 = v65;
              break;
            }
            default:
              {
              int v66 = 1;
              v61 = v66;
              break;
            }
          }
          v47 = v61;
          break;
        }
      }
      v24 = v47;
      break;
    }
    case 2:
      {
      int v67 = 3;
      int v68 = v3 % v67;
      int v69 = 3;
      int v70;
      v70 = v69;
      switch (v68) {
        case 0:
          {
          v70 = v0;
          break;
        }
        default:
          {
          int v71 = 1;
          v70 = v71;
          break;
        }
        case 1:
          {
          int v72 = 0;
          int v73 = 0;
          int v74;
          int v75;
          v74 = v72;
          v75 = v73;
          while (true) {
            int v76 = 4;
            int v77 = v3 % v76;
            int v78 = 1;
            int v79 = v77 + v78;
            bool v80 = v75 < v79;
            v74 = v74;
            v75 = v75;
            if (!v80) break;
            int v81 = 1;
            int v82 = v0 + v81;
            int v83 = 1;
            int v84 = v75 + v83;
            v74 = v82;
            v75 = v84;
          }
          v70 = v74;
        }
        case 2:
          {
          int v85 = 4;
          int v86 = v3 % v85;
          int v87;
          v87 = v0;
          switch (v86) {
            default:
              {
              v87 = v0;
              break;
            }
            case 0:
              {
              v87 = v0;
              break;
            }
            case 1:
              {
              v87 = v0;
              break;
            }
            case 2:
              {
              int v88 = 0;
              v87 = v88;
              break;
            }
          }
          v70 = v87;
          break;
        }
      }
      int v89 = 0;
      int v90 = v0 + v89;
      v24 = v70;
      break;
    }
    default:
      {
      int v91 = 0;
      int v92 = v0 + v91;
      int v93;
      v93 = v92;
      switch (v3) {
        default:
          {
          int v94 = 0;
          int v95 = 0;
          int v96;
          int v97;
          v96 = v94;
          v97 = v95;
          while (true) {
            int v98 = 4;
            int v99 = v3 % v98;
            int v100 = 1;
            int v101 = v99 + v100;
            bool v102 = v97 < v101;
            v96 = v96;
            v97 = v97;
            if (!v102) break;
            int v103 = 3;
            int v104 = v0 + v103;
            int v105 = 1;
            int v106 = v97 + v105;
            v96 = v104;
            v97 = v106;
          }
          v93 = v96;
          break;
        }
        case 0:
          {
          int v107 = 0;
          bool v108 = v2 != v107;
          int v109;
          if (v108) {
            int v110 = 0;
            int v111 = v0 + v110;
            v109 = v111;
          } else {
            int v112 = 4;
            v109 = v112;
          }
          v93 = v109;
          break;
        }
      }
      v24 = v93;
      break;
    }
  }
  int v113 = 0;
  bool v114 = v2 != v113;
  int v115 = v114 ? v6 : v24;
  return;
}

kernel void kernel_main(device int* v116 [[buffer(0)]], device int* v117 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v118 = static_cast<int>(__simt_tid3.x);
  int v119 = 0;
  int v120 = v119 + v118;
  int v121 = v117[v120];
  int v122 = 4;
  int v123 = v122 + v118;
  int v124 = v117[v123];
  helper0(v118, v116, v121, v124, static_cast<int>(__simt_tid3.x));
  int v125 = 8;
  int v126 = v125 + v118;
  int v127 = v117[v126];
  int v128 = 0;
  bool v129 = v127 != v128;
  int v130;
  if (v129) {
    int v131 = 12;
    int v132 = v131 + v118;
    int v133 = v117[v132];
    int v134 = 3;
    int v135 = v118 + v134;
    int v136;
    v136 = v135;
    switch (v133) {
      case 0:
        {
        int v137 = 0;
        int v138 = 0;
        int v139;
        int v140;
        v139 = v137;
        v140 = v138;
        while (true) {
          int v141 = 4;
          int v142 = v140 * v141;
          int v143 = v142 + v118;
          int v144 = 16;
          int v145 = v144 + v143;
          int v146 = v117[v145];
          int v147 = 0;
          bool v148 = v146 != v147;
          v139 = v139;
          v140 = v140;
          if (!v148) break;
          int v149 = v139 + v140;
          int v150 = 1;
          int v151 = v140 + v150;
          bool v152 = true;
          v139 = v149;
          v140 = v151;
          continue;
          ;
        }
        v136 = v139;
      }
      default:
        {
        int v153 = 0;
        int v154 = 0;
        int v155;
        int v156;
        v155 = v153;
        v156 = v154;
        while (true) {
          int v157 = 4;
          int v158 = v156 * v157;
          int v159 = v158 + v118;
          int v160 = 36;
          int v161 = v160 + v159;
          int v162 = v117[v161];
          int v163 = 0;
          bool v164 = v162 != v163;
          v155 = v155;
          v156 = v156;
          if (!v164) break;
          int v165 = v155 + v156;
          int v166 = 1;
          int v167 = v156 + v166;
          bool v168 = true;
          v155 = v165;
          v156 = v167;
          continue;
          ;
        }
        v136 = v155;
        break;
      }
    }
    v130 = v136;
  } else {
    int v169 = 56;
    int v170 = v169 + v118;
    int v171 = v117[v170];
    int v172 = 0;
    bool v173 = v171 != v172;
    int v174;
    if (v173) {
      int v175 = 60;
      int v176 = v175 + v118;
      int v177 = v117[v176];
      int v178;
      v178 = v118;
      switch (v177) {
        case 0:
          {
          int v179 = 4;
          v178 = v179;
          break;
        }
        case 1:
          {
          v178 = v118;
          break;
        }
        default:
          {
          int v180 = 3;
          v178 = v180;
          break;
        }
      }
      v174 = v178;
    } else {
      int v181 = 64;
      int v182 = v181 + v118;
      int v183 = v117[v182];
      uint v184 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v185 = (int)(v184);
      int v186;
      v186 = v185;
      switch (v183) {
        case 0:
          {
          int v187 = 4;
          v186 = v187;
          break;
        }
        default:
          {
          v186 = v118;
          break;
        }
      }
      bool v188 = true;
      int v189 = 16;
      int v190 = v189 + v118;
      bool v191 = true;
      int v192 = simt_wave_count_bits(v191);
      v116[v190] = v192;
      v174 = v186;
    }
    int v193 = 32;
    int v194 = v193 + v118;
    bool v195 = true;
    int v196 = simt_wave_count_bits(v195);
    v116[v194] = v196;
    v130 = v174;
  }
  int v197 = 48;
  int v198 = v197 + v118;
  bool v199 = true;
  int v200 = simt_wave_count_bits(v199);
  v116[v198] = v200;
  int v201 = 68;
  int v202 = v201 + v118;
  int v203 = v117[v202];
  int v204 = 0;
  bool v205 = v203 != v204;
  int v206;
  if (v205) {
    int v207 = 72;
    int v208 = v207 + v118;
    int v209 = v117[v208];
    int v210 = 0;
    bool v211 = v209 != v210;
    int v212;
    if (v211) {
      uint v213 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v214 = (int)(v213);
      v212 = v214;
    } else {
      int v215 = 76;
      int v216 = v215 + v118;
      int v217 = v117[v216];
      int v218 = 3;
      int v219;
      v219 = v218;
      switch (v217) {
        case 0:
          {
          int v220 = 1;
          int v221 = v118 + v220;
          v219 = v221;
          break;
        }
        case 1:
          {
          v219 = v118;
          break;
        }
        case 2:
          {
          int v222 = 3;
          int v223 = v118 + v222;
          v219 = v223;
        }
        default:
          {
          v219 = v118;
          break;
        }
      }
      v212 = v219;
    }
    int v224 = 64;
    int v225 = v224 + v118;
    bool v226 = true;
    int v227 = simt_wave_count_bits(v226);
    v116[v225] = v227;
    v206 = v212;
  } else {
    v206 = v118;
  }
  int v228 = 80;
  int v229 = v228 + v118;
  bool v230 = true;
  int v231 = simt_wave_count_bits(v230);
  v116[v229] = v231;
  int v232 = 80;
  int v233 = v232 + v118;
  int v234 = v117[v233];
  int v235 = 2;
  int v236;
  v236 = v235;
  switch (v234) {
    case 0:
      {
      int v237 = 84;
      int v238 = v237 + v118;
      int v239 = v117[v238];
      int v240;
      v240 = v118;
      switch (v239) {
        case 0:
          {
          int v241 = 88;
          int v242 = v241 + v118;
          int v243 = v117[v242];
          int v244 = 2;
          int v245;
          v245 = v244;
          switch (v243) {
            case 0:
              {
              int v246 = 4;
              int v247 = v118 + v246;
              v245 = v247;
              break;
            }
            case 1:
              {
              int v248 = 1;
              int v249 = v118 + v248;
              v245 = v249;
              break;
            }
            default:
              {
              v245 = v118;
              break;
            }
            case 2:
              {
              v245 = v118;
              break;
            }
          }
          v240 = v245;
          break;
        }
        default:
          {
          int v250 = 0;
          int v251 = 0;
          int v252;
          int v253;
          v252 = v250;
          v253 = v251;
          while (true) {
            int v254 = 4;
            int v255 = v253 * v254;
            int v256 = v255 + v118;
            int v257 = 92;
            int v258 = v257 + v256;
            int v259 = v117[v258];
            int v260 = 0;
            bool v261 = v259 != v260;
            v252 = v252;
            v253 = v253;
            if (!v261) break;
            int v262 = v252 + v253;
            int v263 = 1;
            int v264 = v253 + v263;
            bool v265 = true;
            v252 = v262;
            v253 = v264;
          }
          v240 = v252;
          break;
        }
        case 1:
          {
          int v266 = 112;
          int v267 = v266 + v118;
          int v268 = v117[v267];
          int v269 = 1;
          int v270 = v118 + v269;
          int v271;
          v271 = v270;
          switch (v268) {
            default:
              {
              v271 = v118;
              break;
            }
            case 0:
              {
              int v272 = 0;
              v271 = v272;
              break;
            }
            case 1:
              {
              v271 = v118;
              break;
            }
          }
          v240 = v271;
        }
        case 2:
          {
          int v273 = 0;
          int v274 = 0;
          int v275;
          int v276;
          v275 = v273;
          v276 = v274;
          while (true) {
            int v277 = 4;
            int v278 = v276 * v277;
            int v279 = v278 + v118;
            int v280 = 116;
            int v281 = v280 + v279;
            int v282 = v117[v281];
            int v283 = 0;
            bool v284 = v282 != v283;
            v275 = v275;
            v276 = v276;
            if (!v284) break;
            int v285 = v275 + v276;
            int v286 = 1;
            int v287 = v276 + v286;
            bool v288 = true;
            v275 = v285;
            v276 = v287;
          }
          v240 = v275;
          break;
        }
      }
      v236 = v240;
    }
    case 1:
      {
      int v289 = 136;
      int v290 = v289 + v118;
      int v291 = v117[v290];
      int v292;
      v292 = v118;
      switch (v291) {
        case 0:
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
            int v299 = v298 + v118;
            int v300 = 140;
            int v301 = v300 + v299;
            int v302 = v117[v301];
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
          }
          v292 = v295;
          break;
        }
        case 1:
          {
          int v309 = 1;
          int v310 = v118 + v309;
          v292 = v310;
          break;
        }
        default:
          {
          v292 = v118;
          break;
        }
      }
      v236 = v292;
    }
    default:
      {
      int v311 = 160;
      int v312 = v311 + v118;
      int v313 = v117[v312];
      int v314 = 0;
      bool v315 = v313 != v314;
      int v316;
      if (v315) {
        int v317 = 0;
        int v318 = 0;
        int v319;
        int v320;
        v319 = v317;
        v320 = v318;
        while (true) {
          int v321 = 4;
          int v322 = v320 * v321;
          int v323 = v322 + v118;
          int v324 = 164;
          int v325 = v324 + v323;
          int v326 = v117[v325];
          int v327 = 0;
          bool v328 = v326 != v327;
          v319 = v319;
          v320 = v320;
          if (!v328) break;
          int v329 = v319 + v320;
          int v330 = 1;
          int v331 = v320 + v330;
          bool v332 = true;
          v319 = v329;
          v320 = v331;
          continue;
          ;
        }
        v316 = v319;
      } else {
        int v333 = 184;
        int v334 = v333 + v118;
        int v335 = v117[v334];
        int v336 = 0;
        bool v337 = v335 != v336;
        int v338;
        if (v337) {
          v338 = v118;
        } else {
          int v339 = 3;
          int v340 = v118 + v339;
          v338 = v340;
        }
        v316 = v338;
      }
      v236 = v316;
      break;
    }
    case 2:
      {
      int v341 = 188;
      int v342 = v341 + v118;
      int v343 = v117[v342];
      int v344 = 4;
      int v345 = v118 + v344;
      int v346;
      v346 = v345;
      switch (v343) {
        default:
          {
          int v347 = 192;
          int v348 = v347 + v118;
          int v349 = v117[v348];
          int v350;
          v350 = v118;
          switch (v349) {
            case 0:
              {
              int v351 = 0;
              int v352 = v118 + v351;
              v350 = v352;
              break;
            }
            default:
              {
              int v353 = 3;
              v350 = v353;
              break;
            }
            case 1:
              {
              int v354 = 2;
              int v355 = v118 + v354;
              v350 = v355;
              break;
            }
          }
          v346 = v350;
          break;
        }
        case 0:
          {
          int v356 = 0;
          int v357 = 0;
          int v358;
          int v359;
          v358 = v356;
          v359 = v357;
          while (true) {
            int v360 = 4;
            int v361 = v359 * v360;
            int v362 = v361 + v118;
            int v363 = 196;
            int v364 = v363 + v362;
            int v365 = v117[v364];
            int v366 = 0;
            bool v367 = v365 != v366;
            v358 = v358;
            v359 = v359;
            if (!v367) break;
            int v368 = v358 + v359;
            int v369 = 1;
            int v370 = v359 + v369;
            bool v371 = true;
            v358 = v368;
            v359 = v370;
            continue;
            ;
          }
          v346 = v358;
          break;
        }
        case 1:
          {
          int v372 = 0;
          int v373 = v118 + v372;
          v346 = v373;
          break;
        }
      }
      v236 = v346;
      break;
    }
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 84; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 216; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
