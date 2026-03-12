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
      int v9 = 0;
      int v10 = 0;
      int v11;
      int v12;
      v11 = v9;
      v12 = v10;
      while (true) {
        int v13 = 4;
        int v14 = v3 % v13;
        int v15 = 1;
        int v16 = v14 + v15;
        bool v17 = v12 < v16;
        v11 = v11;
        v12 = v12;
        if (!v17) break;
        int v18 = 0;
        int v19 = 0;
        int v20;
        int v21;
        v20 = v18;
        v21 = v19;
        while (true) {
          int v22 = 4;
          int v23 = v3 % v22;
          int v24 = 1;
          int v25 = v23 + v24;
          bool v26 = v21 < v25;
          v20 = v20;
          v21 = v21;
          if (!v26) break;
          int v27 = 1;
          int v28 = 1;
          int v29 = v21 + v28;
          v20 = v27;
          v21 = v29;
          continue;
          ;
        }
        int v30 = 1;
        int v31 = v12 + v30;
        v11 = v20;
        v12 = v31;
      }
      v8 = v11;
    }
    case 1:
      {
      int v32 = 2;
      v8 = v32;
      break;
    }
    default:
      {
      int v33 = 3;
      int v34 = v3 % v33;
      int v35 = 1;
      int v36 = v0 + v35;
      int v37;
      v37 = v36;
      switch (v34) {
        case 0:
          {
          int v38 = 3;
          int v39 = v3 % v38;
          int v40 = 3;
          int v41;
          v41 = v40;
          switch (v39) {
            case 0:
              {
              v41 = v0;
              break;
            }
            default:
              {
              v41 = v0;
              break;
            }
            case 1:
              {
              int v42 = 3;
              v41 = v42;
              break;
            }
            case 2:
              {
              int v43 = 3;
              v41 = v43;
              break;
            }
          }
          v37 = v41;
        }
        case 1:
          {
          int v44 = 0;
          int v45 = 0;
          int v46;
          int v47;
          v46 = v44;
          v47 = v45;
          while (true) {
            int v48 = 4;
            int v49 = v3 % v48;
            int v50 = 1;
            int v51 = v49 + v50;
            bool v52 = v47 < v51;
            v46 = v46;
            v47 = v47;
            if (!v52) break;
            int v53 = 4;
            int v54 = 1;
            int v55 = v47 + v54;
            v46 = v53;
            v47 = v55;
          }
          v37 = v46;
          break;
        }
        default:
          {
          int v56 = 0;
          bool v57 = v2 != v56;
          int v58;
          if (v57) {
            int v59 = 0;
            int v60 = v0 + v59;
            v58 = v60;
          } else {
            int v61 = 1;
            v58 = v61;
          }
          v37 = v58;
          break;
        }
      }
      v8 = v37;
      break;
    }
  }
  bool v62 = true;
  int v63 = simt_wave_count_bits(v62);
  int v64 = 0;
  int v65 = v64 + v0;
  v1[v65] = v63;
  return;
}

kernel void kernel_main(device int* v66 [[buffer(0)]], device int* v67 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v68 = static_cast<int>(__simt_tid3.x);
  int v69 = 0;
  int v70 = v69 + v68;
  int v71 = v67[v70];
  int v72 = 4;
  int v73 = v72 + v68;
  int v74 = v67[v73];
  helper0(v68, v66, v71, v74, static_cast<int>(__simt_tid3.x));
  int v75 = 8;
  int v76 = v75 + v68;
  int v77 = v67[v76];
  uint v78 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v79 = (int)(v78);
  int v80;
  v80 = v79;
  switch (v77) {
    default:
      {
      int v81 = 12;
      int v82 = v81 + v68;
      int v83 = v67[v82];
      int v84 = 0;
      bool v85 = v83 != v84;
      int v86;
      if (v85) {
        int v87 = 16;
        int v88 = v87 + v68;
        int v89 = v67[v88];
        int v90 = 0;
        int v91 = v68 + v90;
        int v92;
        v92 = v91;
        switch (v89) {
          case 0:
            {
            v92 = v68;
            break;
          }
          default:
            {
            int v93 = 3;
            int v94 = v68 + v93;
            v92 = v94;
            break;
          }
        }
        v86 = v92;
      } else {
        int v95 = 0;
        int v96 = 0;
        int v97;
        int v98;
        v97 = v95;
        v98 = v96;
        while (true) {
          int v99 = 4;
          int v100 = v98 * v99;
          int v101 = v100 + v68;
          int v102 = 20;
          int v103 = v102 + v101;
          int v104 = v67[v103];
          int v105 = 0;
          bool v106 = v104 != v105;
          v97 = v97;
          v98 = v98;
          if (!v106) break;
          int v107 = v97 + v98;
          int v108 = 1;
          int v109 = v98 + v108;
          bool v110 = true;
          v97 = v107;
          v98 = v109;
        }
        v86 = v97;
      }
      v80 = v86;
      break;
    }
    case 0:
      {
      int v111 = 40;
      int v112 = v111 + v68;
      int v113 = v67[v112];
      int v114;
      v114 = v68;
      switch (v113) {
        case 0:
          {
          int v115 = 0;
          int v116 = 0;
          int v117;
          int v118;
          v117 = v115;
          v118 = v116;
          while (true) {
            int v119 = 4;
            int v120 = v118 * v119;
            int v121 = v120 + v68;
            int v122 = 44;
            int v123 = v122 + v121;
            int v124 = v67[v123];
            int v125 = 0;
            bool v126 = v124 != v125;
            v117 = v117;
            v118 = v118;
            if (!v126) break;
            int v127 = v117 + v118;
            int v128 = 1;
            int v129 = v118 + v128;
            bool v130 = true;
            v117 = v127;
            v118 = v129;
            continue;
            ;
          }
          v114 = v117;
          break;
        }
        case 1:
          {
          int v131 = 0;
          int v132 = 0;
          int v133;
          int v134;
          v133 = v131;
          v134 = v132;
          while (true) {
            int v135 = 4;
            int v136 = v134 * v135;
            int v137 = v136 + v68;
            int v138 = 64;
            int v139 = v138 + v137;
            int v140 = v67[v139];
            int v141 = 0;
            bool v142 = v140 != v141;
            v133 = v133;
            v134 = v134;
            if (!v142) break;
            int v143 = v133 + v134;
            int v144 = 1;
            int v145 = v134 + v144;
            bool v146 = true;
            v133 = v143;
            v134 = v145;
            break;
            ;
          }
          v114 = v133;
          break;
        }
        default:
          {
          int v147 = 2;
          v114 = v147;
          break;
        }
      }
      v80 = v114;
      break;
    }
    case 1:
      {
      int v148 = 84;
      int v149 = v148 + v68;
      int v150 = v67[v149];
      int v151 = 4;
      int v152 = v68 + v151;
      int v153;
      v153 = v152;
      switch (v150) {
        case 0:
          {
          int v154 = 0;
          int v155 = 0;
          int v156;
          int v157;
          v156 = v154;
          v157 = v155;
          while (true) {
            int v158 = 4;
            int v159 = v157 * v158;
            int v160 = v159 + v68;
            int v161 = 88;
            int v162 = v161 + v160;
            int v163 = v67[v162];
            int v164 = 0;
            bool v165 = v163 != v164;
            v156 = v156;
            v157 = v157;
            if (!v165) break;
            int v166 = v156 + v157;
            int v167 = 1;
            int v168 = v157 + v167;
            bool v169 = true;
            v156 = v166;
            v157 = v168;
          }
          v153 = v156;
          break;
        }
        default:
          {
          int v170 = 0;
          int v171 = 0;
          int v172;
          int v173;
          v172 = v170;
          v173 = v171;
          while (true) {
            int v174 = 4;
            int v175 = v173 * v174;
            int v176 = v175 + v68;
            int v177 = 108;
            int v178 = v177 + v176;
            int v179 = v67[v178];
            int v180 = 0;
            bool v181 = v179 != v180;
            v172 = v172;
            v173 = v173;
            if (!v181) break;
            int v182 = v172 + v173;
            int v183 = 1;
            int v184 = v173 + v183;
            bool v185 = true;
            v172 = v182;
            v173 = v184;
          }
          v153 = v172;
          break;
        }
      }
      bool v186 = true;
      v80 = v153;
      break;
    }
  }
  int v187 = 128;
  int v188 = v187 + v68;
  int v189 = v67[v188];
  uint v190 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v191 = (int)(v190);
  int v192;
  v192 = v191;
  switch (v189) {
    case 0:
      {
      int v193 = 132;
      int v194 = v193 + v68;
      int v195 = v67[v194];
      int v196;
      v196 = v68;
      switch (v195) {
        default:
          {
          int v197 = 0;
          int v198 = 0;
          int v199;
          int v200;
          v199 = v197;
          v200 = v198;
          while (true) {
            int v201 = 4;
            int v202 = v200 * v201;
            int v203 = v202 + v68;
            int v204 = 136;
            int v205 = v204 + v203;
            int v206 = v67[v205];
            int v207 = 0;
            bool v208 = v206 != v207;
            v199 = v199;
            v200 = v200;
            if (!v208) break;
            int v209 = v199 + v200;
            int v210 = 1;
            int v211 = v200 + v210;
            bool v212 = true;
            v199 = v209;
            v200 = v211;
          }
          v196 = v199;
        }
        case 0:
          {
          int v213 = 156;
          int v214 = v213 + v68;
          int v215 = v67[v214];
          int v216 = 0;
          int v217 = v68 + v216;
          int v218;
          v218 = v217;
          switch (v215) {
            default:
              {
              int v219 = 3;
              int v220 = v68 + v219;
              v218 = v220;
            }
            case 0:
              {
              int v221 = 4;
              v218 = v221;
            }
            case 1:
              {
              int v222 = 1;
              v218 = v222;
              break;
            }
            case 2:
              {
              int v223 = 3;
              v218 = v223;
              break;
            }
          }
          bool v224 = true;
          v196 = v218;
          break;
        }
      }
      v192 = v196;
    }
    default:
      {
      int v225 = 160;
      int v226 = v225 + v68;
      int v227 = v67[v226];
      int v228 = 0;
      bool v229 = v227 != v228;
      int v230;
      if (v229) {
        int v231 = 0;
        int v232 = 0;
        int v233;
        int v234;
        v233 = v231;
        v234 = v232;
        while (true) {
          int v235 = 4;
          int v236 = v234 * v235;
          int v237 = v236 + v68;
          int v238 = 164;
          int v239 = v238 + v237;
          int v240 = v67[v239];
          int v241 = 0;
          bool v242 = v240 != v241;
          v233 = v233;
          v234 = v234;
          if (!v242) break;
          int v243 = v233 + v234;
          int v244 = 1;
          int v245 = v234 + v244;
          bool v246 = true;
          v233 = v243;
          v234 = v245;
          continue;
          ;
        }
        v230 = v233;
      } else {
        int v247 = 184;
        int v248 = v247 + v68;
        int v249 = v67[v248];
        int v250;
        v250 = v68;
        switch (v249) {
          case 0:
            {
            int v251 = 2;
            int v252 = v68 + v251;
            v250 = v252;
            break;
          }
          default:
            {
            v250 = v68;
            break;
          }
        }
        bool v253 = true;
        v230 = v250;
      }
      v192 = v230;
    }
    case 1:
      {
      int v254 = 188;
      int v255 = v254 + v68;
      int v256 = v67[v255];
      int v257;
      v257 = v68;
      switch (v256) {
        case 0:
          {
          int v258 = 192;
          int v259 = v258 + v68;
          int v260 = v67[v259];
          int v261 = 4;
          int v262 = v68 + v261;
          int v263;
          v263 = v262;
          switch (v260) {
            case 0:
              {
              int v264 = 2;
              int v265 = v68 + v264;
              v263 = v265;
              break;
            }
            default:
              {
              int v266 = 0;
              v263 = v266;
              break;
            }
            case 1:
              {
              v263 = v68;
              break;
            }
          }
          bool v267 = true;
          v257 = v263;
          break;
        }
        case 1:
          {
          v257 = v68;
          break;
        }
        default:
          {
          v257 = v68;
          break;
        }
      }
      v192 = v257;
    }
    case 2:
      {
      int v268 = 196;
      int v269 = v268 + v68;
      int v270 = v67[v269];
      int v271;
      v271 = v68;
      switch (v270) {
        default:
          {
          int v272 = 0;
          int v273 = 0;
          int v274;
          int v275;
          v274 = v272;
          v275 = v273;
          while (true) {
            int v276 = 4;
            int v277 = v275 * v276;
            int v278 = v277 + v68;
            int v279 = 200;
            int v280 = v279 + v278;
            int v281 = v67[v280];
            int v282 = 0;
            bool v283 = v281 != v282;
            v274 = v274;
            v275 = v275;
            if (!v283) break;
            int v284 = v274 + v275;
            int v285 = 1;
            int v286 = v275 + v285;
            bool v287 = true;
            v274 = v284;
            v275 = v286;
          }
          v271 = v274;
        }
        case 0:
          {
          int v288 = 220;
          int v289 = v288 + v68;
          int v290 = v67[v289];
          int v291 = 3;
          int v292;
          v292 = v291;
          switch (v290) {
            case 0:
              {
              int v293 = 3;
              v292 = v293;
              break;
            }
            case 1:
              {
              int v294 = 0;
              int v295 = v68 + v294;
              v292 = v295;
              break;
            }
            case 2:
              {
              v292 = v68;
              break;
            }
            default:
              {
              int v296 = 4;
              int v297 = v68 + v296;
              v292 = v297;
              break;
            }
          }
          bool v298 = true;
          v271 = v292;
        }
        case 1:
          {
          int v299 = 224;
          int v300 = v299 + v68;
          int v301 = v67[v300];
          int v302 = 0;
          bool v303 = v301 != v302;
          int v304;
          if (v303) {
            int v305 = 1;
            int v306 = v68 + v305;
            v304 = v306;
          } else {
            int v307 = 3;
            int v308 = v68 + v307;
            v304 = v308;
          }
          v271 = v304;
          break;
        }
      }
      v192 = v271;
      break;
    }
  }
  bool v309 = true;
  int v310 = 16;
  int v311 = v310 + v68;
  bool v312 = true;
  int v313 = simt_wave_count_bits(v312);
  v66[v311] = v313;
  int v314 = 228;
  int v315 = v314 + v68;
  int v316 = v67[v315];
  int v317;
  v317 = v68;
  switch (v316) {
    case 0:
      {
      int v318 = 232;
      int v319 = v318 + v68;
      int v320 = v67[v319];
      int v321;
      v321 = v68;
      switch (v320) {
        case 0:
          {
          int v322 = 236;
          int v323 = v322 + v68;
          int v324 = v67[v323];
          int v325 = 2;
          int v326 = v68 + v325;
          int v327;
          v327 = v326;
          switch (v324) {
            case 0:
              {
              int v328 = 3;
              int v329 = v68 + v328;
              v327 = v329;
              break;
            }
            case 1:
              {
              v327 = v68;
            }
            default:
              {
              int v330 = 1;
              v327 = v330;
              break;
            }
            case 2:
              {
              v327 = v68;
              break;
            }
          }
          v321 = v327;
          break;
        }
        case 1:
          {
          int v331 = 240;
          int v332 = v331 + v68;
          int v333 = v67[v332];
          int v334;
          v334 = v68;
          switch (v333) {
            default:
              {
              v334 = v68;
            }
            case 0:
              {
              int v335 = 1;
              int v336 = v68 + v335;
              v334 = v336;
              break;
            }
          }
          v321 = v334;
        }
        case 2:
          {
          int v337 = 1;
          int v338 = v68 + v337;
          v321 = v338;
        }
        default:
          {
          int v339 = 0;
          int v340 = 0;
          int v341;
          int v342;
          v341 = v339;
          v342 = v340;
          while (true) {
            int v343 = 4;
            int v344 = v342 * v343;
            int v345 = v344 + v68;
            int v346 = 244;
            int v347 = v346 + v345;
            int v348 = v67[v347];
            int v349 = 0;
            bool v350 = v348 != v349;
            v341 = v341;
            v342 = v342;
            if (!v350) break;
            int v351 = v341 + v342;
            int v352 = 1;
            int v353 = v342 + v352;
            bool v354 = true;
            v341 = v351;
            v342 = v353;
          }
          v321 = v341;
          break;
        }
      }
      bool v355 = true;
      v317 = v321;
      break;
    }
    default:
      {
      v317 = v68;
      break;
    }
    case 1:
      {
      int v356 = 264;
      int v357 = v356 + v68;
      int v358 = v67[v357];
      int v359 = 0;
      bool v360 = v358 != v359;
      int v361;
      if (v360) {
        int v362 = 0;
        int v363 = 0;
        int v364;
        int v365;
        v364 = v362;
        v365 = v363;
        while (true) {
          int v366 = 4;
          int v367 = v365 * v366;
          int v368 = v367 + v68;
          int v369 = 268;
          int v370 = v369 + v368;
          int v371 = v67[v370];
          int v372 = 0;
          bool v373 = v371 != v372;
          v364 = v364;
          v365 = v365;
          if (!v373) break;
          int v374 = v364 + v365;
          int v375 = 1;
          int v376 = v365 + v375;
          bool v377 = true;
          v364 = v374;
          v365 = v376;
        }
        v361 = v364;
      } else {
        int v378 = 0;
        int v379 = 0;
        int v380;
        int v381;
        v380 = v378;
        v381 = v379;
        while (true) {
          int v382 = 4;
          int v383 = v381 * v382;
          int v384 = v383 + v68;
          int v385 = 288;
          int v386 = v385 + v384;
          int v387 = v67[v386];
          int v388 = 0;
          bool v389 = v387 != v388;
          v380 = v380;
          v381 = v381;
          if (!v389) break;
          int v390 = v380 + v381;
          int v391 = 1;
          int v392 = v381 + v391;
          bool v393 = true;
          v380 = v390;
          v381 = v392;
        }
        v361 = v380;
      }
      v317 = v361;
      break;
    }
    case 2:
      {
      int v394 = 308;
      int v395 = v394 + v68;
      int v396 = v67[v395];
      int v397;
      v397 = v68;
      switch (v396) {
        case 0:
          {
          int v398 = 1;
          int v399 = v68 + v398;
          v397 = v399;
          break;
        }
        default:
          {
          int v400 = 4;
          int v401 = v68 + v400;
          v397 = v401;
          break;
        }
        case 1:
          {
          int v402 = 312;
          int v403 = v402 + v68;
          int v404 = v67[v403];
          int v405 = 1;
          int v406 = v68 + v405;
          int v407;
          v407 = v406;
          switch (v404) {
            case 0:
              {
              int v408 = 1;
              v407 = v408;
            }
            case 1:
              {
              int v409 = 0;
              int v410 = v68 + v409;
              v407 = v410;
            }
            default:
              {
              int v411 = 2;
              v407 = v411;
            }
            case 2:
              {
              int v412 = 4;
              v407 = v412;
              break;
            }
          }
          v397 = v407;
          break;
        }
        case 2:
          {
          int v413 = 316;
          int v414 = v413 + v68;
          int v415 = v67[v414];
          int v416 = 1;
          int v417;
          v417 = v416;
          switch (v415) {
            default:
              {
              int v418 = 3;
              int v419 = v68 + v418;
              v417 = v419;
              break;
            }
            case 0:
              {
              int v420 = 3;
              int v421 = v68 + v420;
              v417 = v421;
              break;
            }
            case 1:
              {
              int v422 = 0;
              int v423 = v68 + v422;
              v417 = v423;
              break;
            }
          }
          v397 = v417;
          break;
        }
      }
      v317 = v397;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 20; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 320; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
