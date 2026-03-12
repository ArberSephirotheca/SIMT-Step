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
  int v31;
  v31 = v0;
  switch (v30) {
    case 0:
      {
      int v32 = 3;
      int v33 = v3 % v32;
      int v34;
      v34 = v0;
      switch (v33) {
        case 0:
          {
          v34 = v0;
          break;
        }
        default:
          {
          int v35 = 2;
          int v36 = v3 % v35;
          int v37 = 3;
          int v38 = v0 + v37;
          int v39;
          v39 = v38;
          switch (v36) {
            default:
              {
              v39 = v0;
              break;
            }
            case 0:
              {
              int v40 = 2;
              int v41 = v0 + v40;
              v39 = v41;
              break;
            }
            case 1:
              {
              v39 = v0;
              break;
            }
          }
          int v42 = 2;
          v34 = v39;
          break;
        }
        case 1:
          {
          int v43 = 0;
          int v44 = 0;
          int v45;
          int v46;
          v45 = v43;
          v46 = v44;
          while (true) {
            int v47 = 4;
            int v48 = v3 % v47;
            int v49 = 1;
            int v50 = v48 + v49;
            bool v51 = v46 < v50;
            v45 = v45;
            v46 = v46;
            if (!v51) break;
            int v52 = 1;
            int v53 = v46 + v52;
            v45 = v0;
            v46 = v53;
            continue;
            ;
          }
          v34 = v45;
          break;
        }
        case 2:
          {
          int v54 = 0;
          int v55 = 0;
          int v56;
          int v57;
          v56 = v54;
          v57 = v55;
          while (true) {
            int v58 = 4;
            int v59 = v3 % v58;
            int v60 = 1;
            int v61 = v59 + v60;
            bool v62 = v57 < v61;
            v56 = v56;
            v57 = v57;
            if (!v62) break;
            int v63 = 1;
            int v64 = v57 + v63;
            v56 = v0;
            v57 = v64;
          }
          v34 = v56;
          break;
        }
      }
      int v65 = 2;
      int v66 = v0 + v65;
      v31 = v34;
      break;
    }
    case 1:
      {
      int v67 = 4;
      int v68 = v3 % v67;
      int v69;
      v69 = v0;
      switch (v68) {
        default:
          {
          int v70 = 4;
          int v71 = v3 % v70;
          int v72;
          v72 = v0;
          switch (v71) {
            case 0:
              {
              int v73 = 2;
              int v74 = v0 + v73;
              v72 = v74;
              break;
            }
            default:
              {
              int v75 = 0;
              int v76 = v0 + v75;
              v72 = v76;
              break;
            }
            case 1:
              {
              int v77 = 0;
              int v78 = v0 + v77;
              v72 = v78;
              break;
            }
            case 2:
              {
              int v79 = 2;
              int v80 = v0 + v79;
              v72 = v80;
              break;
            }
          }
          int v81 = 3;
          v69 = v72;
          break;
        }
        case 0:
          {
          int v82 = 0;
          bool v83 = v2 != v82;
          int v84;
          if (v83) {
            v84 = v0;
          } else {
            int v85 = 4;
            int v86 = v0 + v85;
            v84 = v86;
          }
          v69 = v84;
          break;
        }
        case 1:
          {
          int v87 = 0;
          bool v88 = v2 != v87;
          int v89;
          if (v88) {
            int v90 = 3;
            v89 = v90;
          } else {
            int v91 = 1;
            int v92 = v0 + v91;
            v89 = v92;
          }
          v69 = v89;
          break;
        }
        case 2:
          {
          int v93 = 0;
          int v94 = 0;
          int v95;
          int v96;
          v95 = v93;
          v96 = v94;
          while (true) {
            int v97 = 4;
            int v98 = v3 % v97;
            int v99 = 1;
            int v100 = v98 + v99;
            bool v101 = v96 < v100;
            v95 = v95;
            v96 = v96;
            if (!v101) break;
            int v102 = 0;
            int v103 = 1;
            int v104 = v96 + v103;
            v95 = v102;
            v96 = v104;
            continue;
            ;
          }
          v69 = v95;
          break;
        }
      }
      v31 = v69;
      break;
    }
    case 2:
      {
      int v105 = 0;
      int v106 = 0;
      int v107;
      int v108;
      v107 = v105;
      v108 = v106;
      while (true) {
        int v109 = 4;
        int v110 = v3 % v109;
        int v111 = 1;
        int v112 = v110 + v111;
        bool v113 = v108 < v112;
        v107 = v107;
        v108 = v108;
        if (!v113) break;
        int v114 = 0;
        int v115 = v0 + v114;
        int v116 = 1;
        int v117 = v108 + v116;
        v107 = v115;
        v108 = v117;
      }
      v31 = v107;
      break;
    }
    default:
      {
      int v118 = 0;
      bool v119 = v2 != v118;
      int v120;
      if (v119) {
        int v121 = 2;
        int v122 = v3 % v121;
        int v123;
        v123 = v0;
        switch (v122) {
          default:
            {
            int v124 = 0;
            int v125 = v0 + v124;
            v123 = v125;
            break;
          }
          case 0:
            {
            int v126 = 0;
            v123 = v126;
            break;
          }
        }
        v120 = v123;
      } else {
        int v127 = 2;
        int v128 = v3 % v127;
        int v129;
        v129 = v0;
        switch (v128) {
          case 0:
            {
            v129 = v0;
            break;
          }
          default:
            {
            v129 = v0;
            break;
          }
          case 1:
            {
            v129 = v0;
            break;
          }
        }
        int v130 = 4;
        int v131 = v0 + v130;
        v120 = v129;
      }
      v31 = v120;
      break;
    }
  }
  int v132 = 0;
  bool v133 = v2 != v132;
  int v134 = v133 ? v28 : v31;
  return;
}

kernel void kernel_main(device int* v135 [[buffer(0)]], device int* v136 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v137 = static_cast<int>(__simt_tid3.x);
  int v138 = 0;
  int v139 = v138 + v137;
  int v140 = v136[v139];
  int v141 = 4;
  int v142 = v141 + v137;
  int v143 = v136[v142];
  helper0(v137, v135, v140, v143, static_cast<int>(__simt_tid3.x));
  int v144 = 8;
  int v145 = v144 + v137;
  int v146 = v136[v145];
  int v147 = 2;
  int v148 = v137 + v147;
  int v149;
  v149 = v148;
  switch (v146) {
    default:
      {
      int v150 = 12;
      int v151 = v150 + v137;
      int v152 = v136[v151];
      int v153 = 4;
      int v154;
      v154 = v153;
      switch (v152) {
        case 0:
          {
          v154 = v137;
          break;
        }
        case 1:
          {
          int v155 = 16;
          int v156 = v155 + v137;
          int v157 = v136[v156];
          int v158;
          v158 = v137;
          switch (v157) {
            default:
              {
              int v159 = 2;
              int v160 = v137 + v159;
              v158 = v160;
            }
            case 0:
              {
              v158 = v137;
            }
            case 1:
              {
              int v161 = 3;
              v158 = v161;
              break;
            }
          }
          v154 = v158;
          break;
        }
        default:
          {
          int v162 = 20;
          int v163 = v162 + v137;
          int v164 = v136[v163];
          int v165 = 0;
          bool v166 = v164 != v165;
          int v167;
          if (v166) {
            int v168 = 2;
            v167 = v168;
          } else {
            int v169 = 1;
            v167 = v169;
          }
          v154 = v167;
          break;
        }
        case 2:
          {
          int v170 = 24;
          int v171 = v170 + v137;
          int v172 = v136[v171];
          int v173 = 4;
          int v174;
          v174 = v173;
          switch (v172) {
            default:
              {
              v174 = v137;
              break;
            }
            case 0:
              {
              int v175 = 4;
              v174 = v175;
              break;
            }
          }
          v154 = v174;
          break;
        }
      }
      v149 = v154;
      break;
    }
    case 0:
      {
      int v176 = 0;
      int v177 = 0;
      int v178;
      int v179;
      v178 = v176;
      v179 = v177;
      while (true) {
        int v180 = 4;
        int v181 = v179 * v180;
        int v182 = v181 + v137;
        int v183 = 28;
        int v184 = v183 + v182;
        int v185 = v136[v184];
        int v186 = 0;
        bool v187 = v185 != v186;
        v178 = v178;
        v179 = v179;
        if (!v187) break;
        int v188 = 3;
        int v189 = v178 + v188;
        int v190 = 1;
        int v191 = v179 + v190;
        bool v192 = true;
        v178 = v189;
        v179 = v191;
        break;
        ;
      }
      v149 = v178;
      break;
    }
    case 1:
      {
      int v193 = 48;
      int v194 = v193 + v137;
      int v195 = v136[v194];
      int v196;
      v196 = v137;
      switch (v195) {
        case 0:
          {
          int v197 = 52;
          int v198 = v197 + v137;
          int v199 = v136[v198];
          int v200 = 0;
          bool v201 = v199 != v200;
          int v202;
          if (v201) {
            v202 = v137;
          } else {
            v202 = v137;
          }
          v196 = v202;
        }
        default:
          {
          int v203 = 56;
          int v204 = v203 + v137;
          int v205 = v136[v204];
          int v206 = 0;
          bool v207 = v205 != v206;
          int v208;
          if (v207) {
            int v209 = 0;
            int v210 = v137 + v209;
            v208 = v210;
          } else {
            v208 = v137;
          }
          v196 = v208;
          break;
        }
        case 1:
          {
          int v211 = 0;
          v196 = v211;
          break;
        }
        case 2:
          {
          int v212 = 0;
          int v213 = 0;
          int v214;
          int v215;
          v214 = v212;
          v215 = v213;
          while (true) {
            int v216 = 4;
            int v217 = v215 * v216;
            int v218 = v217 + v137;
            int v219 = 60;
            int v220 = v219 + v218;
            int v221 = v136[v220];
            int v222 = 0;
            bool v223 = v221 != v222;
            v214 = v214;
            v215 = v215;
            if (!v223) break;
            int v224 = v214 + v215;
            int v225 = 1;
            int v226 = v215 + v225;
            bool v227 = true;
            v214 = v224;
            v215 = v226;
          }
          v196 = v214;
          break;
        }
      }
      bool v228 = true;
      v149 = v196;
      break;
    }
  }
  bool v229 = true;
  int v230 = 32;
  int v231 = v230 + v137;
  bool v232 = true;
  int v233 = simt_wave_count_bits(v232);
  v135[v231] = v233;
  int v234 = 80;
  int v235 = v234 + v137;
  int v236 = v136[v235];
  uint v237 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v238 = (int)(v237);
  int v239;
  v239 = v238;
  switch (v236) {
    case 0:
      {
      int v240 = 84;
      int v241 = v240 + v137;
      int v242 = v136[v241];
      int v243 = 0;
      bool v244 = v242 != v243;
      int v245;
      if (v244) {
        int v246 = 88;
        int v247 = v246 + v137;
        int v248 = v136[v247];
        int v249 = 0;
        bool v250 = v248 != v249;
        int v251;
        if (v250) {
          int v252 = 0;
          v251 = v252;
        } else {
          int v253 = 2;
          int v254 = v137 + v253;
          v251 = v254;
        }
        v245 = v251;
      } else {
        int v255 = 92;
        int v256 = v255 + v137;
        int v257 = v136[v256];
        int v258 = 1;
        int v259 = v137 + v258;
        int v260;
        v260 = v259;
        switch (v257) {
          case 0:
            {
            v260 = v137;
            break;
          }
          default:
            {
            int v261 = 3;
            int v262 = v137 + v261;
            v260 = v262;
            break;
          }
        }
        v245 = v260;
      }
      v239 = v245;
      break;
    }
    case 1:
      {
      int v263 = 0;
      int v264 = 0;
      int v265;
      int v266;
      v265 = v263;
      v266 = v264;
      while (true) {
        int v267 = 4;
        int v268 = v266 * v267;
        int v269 = v268 + v137;
        int v270 = 96;
        int v271 = v270 + v269;
        int v272 = v136[v271];
        int v273 = 0;
        bool v274 = v272 != v273;
        v265 = v265;
        v266 = v266;
        if (!v274) break;
        int v275 = v265 + v266;
        int v276 = 1;
        int v277 = v266 + v276;
        bool v278 = true;
        v265 = v275;
        v266 = v277;
      }
      v239 = v265;
      break;
    }
    default:
      {
      int v279 = 116;
      int v280 = v279 + v137;
      int v281 = v136[v280];
      int v282 = 0;
      bool v283 = v281 != v282;
      int v284;
      if (v283) {
        int v285 = 120;
        int v286 = v285 + v137;
        int v287 = v136[v286];
        int v288 = 0;
        bool v289 = v287 != v288;
        int v290;
        if (v289) {
          int v291 = 3;
          v290 = v291;
        } else {
          v290 = v137;
        }
        v284 = v290;
      } else {
        int v292 = 0;
        int v293 = v137 + v292;
        v284 = v293;
      }
      v239 = v284;
      break;
    }
    case 2:
      {
      int v294 = 124;
      int v295 = v294 + v137;
      int v296 = v136[v295];
      int v297 = 0;
      bool v298 = v296 != v297;
      int v299;
      if (v298) {
        int v300 = 128;
        int v301 = v300 + v137;
        int v302 = v136[v301];
        int v303 = 0;
        bool v304 = v302 != v303;
        int v305;
        if (v304) {
          int v306 = 1;
          v305 = v306;
        } else {
          v305 = v137;
        }
        v299 = v305;
      } else {
        int v307 = 132;
        int v308 = v307 + v137;
        int v309 = v136[v308];
        int v310 = 2;
        int v311 = v137 + v310;
        int v312;
        v312 = v311;
        switch (v309) {
          default:
            {
            int v313 = 3;
            v312 = v313;
            break;
          }
          case 0:
            {
            int v314 = 0;
            int v315 = v137 + v314;
            v312 = v315;
            break;
          }
          case 1:
            {
            int v316 = 3;
            int v317 = v137 + v316;
            v312 = v317;
            break;
          }
        }
        v299 = v312;
      }
      v239 = v299;
      break;
    }
  }
  bool v318 = true;
  int v319 = 48;
  int v320 = v319 + v137;
  bool v321 = true;
  int v322 = simt_wave_count_bits(v321);
  v135[v320] = v322;
  int v323 = 136;
  int v324 = v323 + v137;
  int v325 = v136[v324];
  int v326 = 0;
  bool v327 = v325 != v326;
  int v328;
  if (v327) {
    int v329 = 140;
    int v330 = v329 + v137;
    int v331 = v136[v330];
    uint v332 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v333 = (int)(v332);
    int v334;
    v334 = v333;
    switch (v331) {
      default:
        {
        int v335 = 0;
        int v336 = 0;
        int v337;
        int v338;
        v337 = v335;
        v338 = v336;
        while (true) {
          int v339 = 4;
          int v340 = v338 * v339;
          int v341 = v340 + v137;
          int v342 = 144;
          int v343 = v342 + v341;
          int v344 = v136[v343];
          int v345 = 0;
          bool v346 = v344 != v345;
          v337 = v337;
          v338 = v338;
          if (!v346) break;
          int v347 = v337 + v338;
          int v348 = 1;
          int v349 = v338 + v348;
          bool v350 = true;
          v337 = v347;
          v338 = v349;
          break;
          ;
        }
        v334 = v337;
        break;
      }
      case 0:
        {
        int v351 = 164;
        int v352 = v351 + v137;
        int v353 = v136[v352];
        int v354 = 0;
        bool v355 = v353 != v354;
        int v356;
        if (v355) {
          int v357 = 3;
          int v358 = v137 + v357;
          v356 = v358;
        } else {
          int v359 = 1;
          v356 = v359;
        }
        v334 = v356;
        break;
      }
      case 1:
        {
        v334 = v137;
        break;
      }
    }
    v328 = v334;
  } else {
    int v360 = 168;
    int v361 = v360 + v137;
    int v362 = v136[v361];
    int v363 = 3;
    int v364 = v137 + v363;
    int v365;
    v365 = v364;
    switch (v362) {
      default:
        {
        int v366 = 172;
        int v367 = v366 + v137;
        int v368 = v136[v367];
        int v369;
        v369 = v137;
        switch (v368) {
          case 0:
            {
            v369 = v137;
            break;
          }
          case 1:
            {
            v369 = v137;
            break;
          }
          default:
            {
            int v370 = 2;
            v369 = v370;
            break;
          }
          case 2:
            {
            int v371 = 3;
            v369 = v371;
            break;
          }
        }
        bool v372 = true;
        v365 = v369;
        break;
      }
      case 0:
        {
        int v373 = 176;
        int v374 = v373 + v137;
        int v375 = v136[v374];
        int v376 = 0;
        bool v377 = v375 != v376;
        int v378;
        if (v377) {
          int v379 = 0;
          v378 = v379;
        } else {
          int v380 = 1;
          v378 = v380;
        }
        v365 = v378;
        break;
      }
    }
    v328 = v365;
  }
  int v381 = 64;
  int v382 = v381 + v137;
  bool v383 = true;
  int v384 = simt_wave_count_bits(v383);
  v135[v382] = v384;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 180; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
