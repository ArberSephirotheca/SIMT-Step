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
    int v14 = v0 + v13;
    int v15 = 1;
    int v16 = v7 + v15;
    v6 = v14;
    v7 = v16;
  }
  bool v17 = true;
  int v18 = simt_wave_count_bits(v17);
  int v19 = 0;
  int v20 = v19 + v0;
  v1[v20] = v18;
  int v21 = 4;
  int v22 = v3 % v21;
  int v23 = 2;
  int v24 = v0 + v23;
  int v25;
  v25 = v24;
  switch (v22) {
    case 0:
      {
      int v26 = 3;
      int v27 = v3 % v26;
      int v28 = 1;
      int v29;
      v29 = v28;
      switch (v27) {
        case 0:
          {
          int v30 = 0;
          int v31 = 0;
          int v32;
          int v33;
          v32 = v30;
          v33 = v31;
          while (true) {
            int v34 = 4;
            int v35 = v3 % v34;
            int v36 = 1;
            int v37 = v35 + v36;
            bool v38 = v33 < v37;
            v32 = v32;
            v33 = v33;
            if (!v38) break;
            int v39 = 4;
            int v40 = v0 + v39;
            int v41 = 1;
            int v42 = v33 + v41;
            v32 = v40;
            v33 = v42;
          }
          v29 = v32;
          break;
        }
        default:
          {
          int v43 = 2;
          int v44 = v3 % v43;
          int v45;
          v45 = v0;
          switch (v44) {
            default:
              {
              v45 = v0;
              break;
            }
            case 0:
              {
              int v46 = 3;
              int v47 = v0 + v46;
              v45 = v47;
              break;
            }
            case 1:
              {
              int v48 = 4;
              v45 = v48;
              break;
            }
          }
          int v49 = 1;
          int v50 = v0 + v49;
          v29 = v45;
          break;
        }
        case 1:
          {
          int v51 = 0;
          int v52 = 0;
          int v53;
          int v54;
          v53 = v51;
          v54 = v52;
          while (true) {
            int v55 = 4;
            int v56 = v3 % v55;
            int v57 = 1;
            int v58 = v56 + v57;
            bool v59 = v54 < v58;
            v53 = v53;
            v54 = v54;
            if (!v59) break;
            int v60 = 1;
            int v61 = v54 + v60;
            v53 = v0;
            v54 = v61;
          }
          int v62 = 3;
          int v63 = v0 + v62;
          v29 = v53;
          break;
        }
      }
      int v64 = 1;
      int v65 = v0 + v64;
      v25 = v29;
      break;
    }
    case 1:
      {
      int v66 = 0;
      bool v67 = v2 != v66;
      int v68;
      if (v67) {
        int v69 = 1;
        v68 = v69;
      } else {
        int v70 = 0;
        bool v71 = v2 != v70;
        int v72;
        if (v71) {
          int v73 = 1;
          v72 = v73;
        } else {
          v72 = v0;
        }
        v68 = v72;
      }
      int v74 = 3;
      v25 = v68;
      break;
    }
    default:
      {
      int v75 = 4;
      v25 = v75;
      break;
    }
    case 2:
      {
      int v76 = 3;
      int v77 = v0 + v76;
      v25 = v77;
      break;
    }
  }
  bool v78 = true;
  int v79 = simt_wave_count_bits(v78);
  int v80 = 16;
  int v81 = v80 + v0;
  v1[v81] = v79;
  int v82 = 0;
  bool v83 = v2 != v82;
  int v84 = v83 ? v6 : v25;
  return;
}

kernel void kernel_main(device int* v85 [[buffer(0)]], device int* v86 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v87 = static_cast<int>(__simt_tid3.x);
  int v88 = 0;
  int v89 = v88 + v87;
  int v90 = v86[v89];
  int v91 = 4;
  int v92 = v91 + v87;
  int v93 = v86[v92];
  helper0(v87, v85, v90, v93, static_cast<int>(__simt_tid3.x));
  int v94 = 8;
  int v95 = v94 + v87;
  int v96 = v86[v95];
  uint v97 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v98 = (int)(v97);
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
        int v105 = v103 * v104;
        int v106 = v105 + v87;
        int v107 = 12;
        int v108 = v107 + v106;
        int v109 = v86[v108];
        int v110 = 0;
        bool v111 = v109 != v110;
        v102 = v102;
        v103 = v103;
        if (!v111) break;
        int v112 = 32;
        int v113 = v112 + v87;
        int v114 = v86[v113];
        int v115 = 4;
        int v116 = v87 + v115;
        int v117;
        v117 = v116;
        switch (v114) {
          case 0:
            {
            int v118 = 1;
            int v119 = v87 + v118;
            v117 = v119;
            break;
          }
          default:
            {
            v117 = v87;
            break;
          }
          case 1:
            {
            int v120 = 1;
            int v121 = v87 + v120;
            v117 = v121;
            break;
          }
          case 2:
            {
            int v122 = 1;
            v117 = v122;
            break;
          }
        }
        bool v123 = true;
        int v124 = v102 + v117;
        int v125 = 1;
        int v126 = v103 + v125;
        v102 = v124;
        v103 = v126;
      }
      bool v127 = true;
      v99 = v102;
      break;
    }
    default:
      {
      int v128 = 36;
      int v129 = v128 + v87;
      int v130 = v86[v129];
      int v131;
      v131 = v87;
      switch (v130) {
        case 0:
          {
          int v132 = 40;
          int v133 = v132 + v87;
          int v134 = v86[v133];
          int v135 = 1;
          int v136;
          v136 = v135;
          switch (v134) {
            default:
              {
              int v137 = 4;
              v136 = v137;
              break;
            }
            case 0:
              {
              int v138 = 0;
              v136 = v138;
              break;
            }
          }
          bool v139 = true;
          v131 = v136;
          break;
        }
        default:
          {
          int v140 = 0;
          int v141 = 0;
          int v142;
          int v143;
          v142 = v140;
          v143 = v141;
          while (true) {
            int v144 = 4;
            int v145 = v143 * v144;
            int v146 = v145 + v87;
            int v147 = 44;
            int v148 = v147 + v146;
            int v149 = v86[v148];
            int v150 = 0;
            bool v151 = v149 != v150;
            v142 = v142;
            v143 = v143;
            if (!v151) break;
            int v152 = v142 + v143;
            int v153 = 1;
            int v154 = v143 + v153;
            v142 = v152;
            v143 = v154;
            continue;
            ;
          }
          bool v155 = true;
          v131 = v142;
          break;
        }
        case 1:
          {
          int v156 = 64;
          int v157 = v156 + v87;
          int v158 = v86[v157];
          int v159 = 0;
          bool v160 = v158 != v159;
          int v161;
          if (v160) {
            int v162 = 1;
            int v163 = v87 + v162;
            v161 = v163;
          } else {
            v161 = v87;
          }
          v131 = v161;
          break;
        }
        case 2:
          {
          int v164 = 0;
          int v165 = 0;
          int v166;
          int v167;
          v166 = v164;
          v167 = v165;
          while (true) {
            int v168 = 4;
            int v169 = v167 * v168;
            int v170 = v169 + v87;
            int v171 = 68;
            int v172 = v171 + v170;
            int v173 = v86[v172];
            int v174 = 0;
            bool v175 = v173 != v174;
            v166 = v166;
            v167 = v167;
            if (!v175) break;
            int v176 = v166 + v167;
            int v177 = 1;
            int v178 = v167 + v177;
            v166 = v176;
            v167 = v178;
          }
          bool v179 = true;
          v131 = v166;
          break;
        }
      }
      bool v180 = true;
      v99 = v131;
      break;
    }
    case 1:
      {
      int v181 = 0;
      int v182 = 0;
      int v183;
      int v184;
      v183 = v181;
      v184 = v182;
      while (true) {
        int v185 = 4;
        int v186 = v184 * v185;
        int v187 = v186 + v87;
        int v188 = 88;
        int v189 = v188 + v187;
        int v190 = v86[v189];
        int v191 = 0;
        bool v192 = v190 != v191;
        v183 = v183;
        v184 = v184;
        if (!v192) break;
        int v193 = 0;
        int v194 = 0;
        int v195;
        int v196;
        v195 = v193;
        v196 = v194;
        while (true) {
          int v197 = 4;
          int v198 = v196 * v197;
          int v199 = v198 + v87;
          int v200 = 108;
          int v201 = v200 + v199;
          int v202 = v86[v201];
          int v203 = 0;
          bool v204 = v202 != v203;
          v195 = v195;
          v196 = v196;
          if (!v204) break;
          int v205 = v195 + v196;
          int v206 = 1;
          int v207 = v196 + v206;
          v195 = v205;
          v196 = v207;
        }
        bool v208 = true;
        int v209 = v183 + v195;
        int v210 = 1;
        int v211 = v184 + v210;
        v183 = v209;
        v184 = v211;
      }
      bool v212 = true;
      v99 = v183;
      break;
    }
  }
  bool v213 = true;
  int v214 = 32;
  int v215 = v214 + v87;
  bool v216 = true;
  int v217 = simt_wave_count_bits(v216);
  v85[v215] = v217;
  int v218 = 128;
  int v219 = v218 + v87;
  int v220 = v86[v219];
  int v221 = 1;
  int v222 = v87 + v221;
  int v223;
  v223 = v222;
  switch (v220) {
    case 0:
      {
      v223 = v87;
      break;
    }
    default:
      {
      int v224 = 132;
      int v225 = v224 + v87;
      int v226 = v86[v225];
      int v227 = 1;
      int v228 = v87 + v227;
      int v229;
      v229 = v228;
      switch (v226) {
        case 0:
          {
          int v230 = 136;
          int v231 = v230 + v87;
          int v232 = v86[v231];
          int v233 = 2;
          int v234 = v87 + v233;
          int v235;
          v235 = v234;
          switch (v232) {
            default:
              {
              int v236 = 4;
              int v237 = v87 + v236;
              v235 = v237;
              break;
            }
            case 0:
              {
              int v238 = 3;
              v235 = v238;
              break;
            }
            case 1:
              {
              v235 = v87;
              break;
            }
            case 2:
              {
              v235 = v87;
              break;
            }
          }
          bool v239 = true;
          v229 = v235;
          break;
        }
        case 1:
          {
          int v240 = 140;
          int v241 = v240 + v87;
          int v242 = v86[v241];
          int v243 = 1;
          int v244 = v87 + v243;
          int v245;
          v245 = v244;
          switch (v242) {
            case 0:
              {
              int v246 = 3;
              int v247 = v87 + v246;
              v245 = v247;
            }
            case 1:
              {
              int v248 = 1;
              int v249 = v87 + v248;
              v245 = v249;
              break;
            }
            default:
              {
              int v250 = 3;
              int v251 = v87 + v250;
              v245 = v251;
              break;
            }
          }
          bool v252 = true;
          v229 = v245;
          break;
        }
        default:
          {
          int v253 = 4;
          v229 = v253;
          break;
        }
        case 2:
          {
          int v254 = 144;
          int v255 = v254 + v87;
          int v256 = v86[v255];
          int v257 = 0;
          bool v258 = v256 != v257;
          int v259;
          if (v258) {
            int v260 = 2;
            v259 = v260;
          } else {
            int v261 = 2;
            v259 = v261;
          }
          v229 = v259;
          break;
        }
      }
      bool v262 = true;
      v223 = v229;
    }
    case 1:
      {
      int v263 = 148;
      int v264 = v263 + v87;
      int v265 = v86[v264];
      int v266 = 2;
      int v267 = v87 + v266;
      int v268;
      v268 = v267;
      switch (v265) {
        default:
          {
          int v269 = 152;
          int v270 = v269 + v87;
          int v271 = v86[v270];
          int v272 = 0;
          bool v273 = v271 != v272;
          int v274;
          if (v273) {
            v274 = v87;
          } else {
            v274 = v87;
          }
          v268 = v274;
          break;
        }
        case 0:
          {
          int v275 = 156;
          int v276 = v275 + v87;
          int v277 = v86[v276];
          int v278;
          v278 = v87;
          switch (v277) {
            default:
              {
              int v279 = 4;
              int v280 = v87 + v279;
              v278 = v280;
            }
            case 0:
              {
              int v281 = 3;
              int v282 = v87 + v281;
              v278 = v282;
              break;
            }
          }
          bool v283 = true;
          v268 = v278;
          break;
        }
        case 1:
          {
          int v284 = 160;
          int v285 = v284 + v87;
          int v286 = v86[v285];
          int v287 = 0;
          bool v288 = v286 != v287;
          int v289;
          if (v288) {
            int v290 = 2;
            v289 = v290;
          } else {
            int v291 = 0;
            v289 = v291;
          }
          v268 = v289;
          break;
        }
        case 2:
          {
          int v292 = 164;
          int v293 = v292 + v87;
          int v294 = v86[v293];
          int v295 = 4;
          int v296;
          v296 = v295;
          switch (v294) {
            default:
              {
              int v297 = 1;
              v296 = v297;
            }
            case 0:
              {
              int v298 = 4;
              v296 = v298;
            }
            case 1:
              {
              int v299 = 4;
              v296 = v299;
            }
            case 2:
              {
              int v300 = 0;
              v296 = v300;
              break;
            }
          }
          bool v301 = true;
          v268 = v296;
          break;
        }
      }
      bool v302 = true;
      v223 = v268;
      break;
    }
    case 2:
      {
      int v303 = 0;
      int v304 = v87 + v303;
      v223 = v304;
      break;
    }
  }
  bool v305 = true;
  int v306 = 48;
  int v307 = v306 + v87;
  bool v308 = true;
  int v309 = simt_wave_count_bits(v308);
  v85[v307] = v309;
  int v310 = 168;
  int v311 = v310 + v87;
  int v312 = v86[v311];
  uint v313 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v314 = (int)(v313);
  int v315;
  v315 = v314;
  switch (v312) {
    default:
      {
      int v316 = 172;
      int v317 = v316 + v87;
      int v318 = v86[v317];
      int v319 = 3;
      int v320 = v87 + v319;
      int v321;
      v321 = v320;
      switch (v318) {
        case 0:
          {
          int v322 = 0;
          int v323 = 0;
          int v324;
          int v325;
          v324 = v322;
          v325 = v323;
          while (true) {
            int v326 = 4;
            int v327 = v325 * v326;
            int v328 = v327 + v87;
            int v329 = 176;
            int v330 = v329 + v328;
            int v331 = v86[v330];
            int v332 = 0;
            bool v333 = v331 != v332;
            v324 = v324;
            v325 = v325;
            if (!v333) break;
            int v334 = v324 + v325;
            int v335 = 1;
            int v336 = v325 + v335;
            v324 = v334;
            v325 = v336;
          }
          bool v337 = true;
          v321 = v324;
          break;
        }
        case 1:
          {
          int v338 = 196;
          int v339 = v338 + v87;
          int v340 = v86[v339];
          int v341 = 0;
          bool v342 = v340 != v341;
          int v343;
          if (v342) {
            int v344 = 3;
            v343 = v344;
          } else {
            v343 = v87;
          }
          v321 = v343;
          break;
        }
        case 2:
          {
          int v345 = 200;
          int v346 = v345 + v87;
          int v347 = v86[v346];
          int v348 = 0;
          bool v349 = v347 != v348;
          int v350;
          if (v349) {
            v350 = v87;
          } else {
            int v351 = 0;
            int v352 = v87 + v351;
            v350 = v352;
          }
          v321 = v350;
          break;
        }
        default:
          {
          int v353 = 3;
          v321 = v353;
          break;
        }
      }
      bool v354 = true;
      v315 = v321;
      break;
    }
    case 0:
      {
      int v355 = 204;
      int v356 = v355 + v87;
      int v357 = v86[v356];
      int v358 = 0;
      bool v359 = v357 != v358;
      int v360;
      if (v359) {
        int v361 = 208;
        int v362 = v361 + v87;
        int v363 = v86[v362];
        int v364 = 1;
        int v365 = v87 + v364;
        int v366;
        v366 = v365;
        switch (v363) {
          case 0:
            {
            int v367 = 4;
            int v368 = v87 + v367;
            v366 = v368;
            break;
          }
          case 1:
            {
            v366 = v87;
            break;
          }
          case 2:
            {
            v366 = v87;
            break;
          }
          default:
            {
            int v369 = 3;
            v366 = v369;
            break;
          }
        }
        bool v370 = true;
        v360 = v366;
      } else {
        int v371 = 0;
        int v372 = 0;
        int v373;
        int v374;
        v373 = v371;
        v374 = v372;
        while (true) {
          int v375 = 4;
          int v376 = v374 * v375;
          int v377 = v376 + v87;
          int v378 = 212;
          int v379 = v378 + v377;
          int v380 = v86[v379];
          int v381 = 0;
          bool v382 = v380 != v381;
          v373 = v373;
          v374 = v374;
          if (!v382) break;
          int v383 = v373 + v374;
          int v384 = 1;
          int v385 = v374 + v384;
          v373 = v383;
          v374 = v385;
          continue;
          ;
        }
        bool v386 = true;
        v360 = v373;
      }
      v315 = v360;
      break;
    }
    case 1:
      {
      int v387 = 0;
      int v388 = 0;
      int v389;
      int v390;
      v389 = v387;
      v390 = v388;
      while (true) {
        int v391 = 4;
        int v392 = v390 * v391;
        int v393 = v392 + v87;
        int v394 = 232;
        int v395 = v394 + v393;
        int v396 = v86[v395];
        int v397 = 0;
        bool v398 = v396 != v397;
        v389 = v389;
        v390 = v390;
        if (!v398) break;
        int v399 = 252;
        int v400 = v399 + v87;
        int v401 = v86[v400];
        int v402 = 0;
        bool v403 = v401 != v402;
        int v404;
        if (v403) {
          v404 = v87;
        } else {
          int v405 = 3;
          v404 = v405;
        }
        int v406 = v389 + v404;
        int v407 = 1;
        int v408 = v390 + v407;
        v389 = v406;
        v390 = v408;
        break;
        ;
      }
      bool v409 = true;
      v315 = v389;
      break;
    }
  }
  bool v410 = true;
  int v411 = 64;
  int v412 = v411 + v87;
  bool v413 = true;
  int v414 = simt_wave_count_bits(v413);
  v85[v412] = v414;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 256; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
