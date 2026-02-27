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
  int v6 = 3;
  int v7;
  v7 = v6;
  switch (v5) {
    case 0:
      {
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
        int v17;
        v17 = v0;
        switch (v3) {
          case 0:
            {
            int v18 = 3;
            int v19 = v0 + v18;
            v17 = v19;
            break;
          }
          default:
            {
            int v20 = 2;
            v17 = v20;
            break;
          }
        }
        int v21 = 2;
        int v22 = 1;
        int v23 = v11 + v22;
        v10 = v17;
        v11 = v23;
        break;
        ;
      }
      v7 = v10;
    }
    default:
      {
      int v24 = 0;
      bool v25 = v2 != v24;
      int v26;
      if (v25) {
        int v27 = 0;
        int v28 = 0;
        int v29;
        int v30;
        v29 = v27;
        v30 = v28;
        while (true) {
          int v31 = 4;
          int v32 = v3 % v31;
          int v33 = 1;
          int v34 = v32 + v33;
          bool v35 = v30 < v34;
          v29 = v29;
          v30 = v30;
          if (!v35) break;
          int v36 = 1;
          int v37 = v30 + v36;
          v29 = v0;
          v30 = v37;
        }
        v26 = v29;
      } else {
        int v38 = 4;
        int v39 = v3 % v38;
        int v40 = 0;
        int v41 = v0 + v40;
        int v42;
        v42 = v41;
        switch (v39) {
          case 0:
            {
            v42 = v0;
            break;
          }
          case 1:
            {
            int v43 = 2;
            int v44 = v0 + v43;
            v42 = v44;
          }
          default:
            {
            v42 = v0;
          }
          case 2:
            {
            int v45 = 2;
            v42 = v45;
            break;
          }
        }
        int v46 = 1;
        v26 = v42;
      }
      v7 = v26;
    }
    case 1:
      {
      v7 = v0;
    }
    case 2:
      {
      int v47 = 0;
      bool v48 = v2 != v47;
      int v49;
      if (v48) {
        int v50 = 0;
        int v51 = 0;
        int v52;
        int v53;
        v52 = v50;
        v53 = v51;
        while (true) {
          int v54 = 4;
          int v55 = v3 % v54;
          int v56 = 1;
          int v57 = v55 + v56;
          bool v58 = v53 < v57;
          v52 = v52;
          v53 = v53;
          if (!v58) break;
          int v59 = 1;
          int v60 = v53 + v59;
          v52 = v0;
          v53 = v60;
        }
        v49 = v52;
      } else {
        int v61 = 3;
        int v62 = v3 % v61;
        int v63 = 0;
        int v64 = v0 + v63;
        int v65;
        v65 = v64;
        switch (v62) {
          case 0:
            {
            int v66 = 2;
            int v67 = v0 + v66;
            v65 = v67;
            break;
          }
          case 1:
            {
            v65 = v0;
            break;
          }
          case 2:
            {
            v65 = v0;
            break;
          }
          default:
            {
            int v68 = 2;
            int v69 = v0 + v68;
            v65 = v69;
            break;
          }
        }
        v49 = v65;
      }
      v7 = v49;
      break;
    }
  }
  bool v70 = true;
  int v71 = simt_wave_count_bits(v70);
  int v72 = 0;
  int v73 = v72 + v0;
  v1[v73] = v71;
  return;
}

kernel void kernel_main(device int* v74 [[buffer(0)]], device int* v75 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v76 = static_cast<int>(__simt_tid3.x);
  int v77 = 0;
  int v78 = v77 + v76;
  int v79 = v75[v78];
  int v80 = 4;
  int v81 = v80 + v76;
  int v82 = v75[v81];
  helper0(v76, v74, v79, v82, static_cast<int>(__simt_tid3.x));
  int v83 = 8;
  int v84 = v83 + v76;
  int v85 = v75[v84];
  int v86;
  v86 = v76;
  switch (v85) {
    case 0:
      {
      int v87 = 12;
      int v88 = v87 + v76;
      int v89 = v75[v88];
      int v90;
      v90 = v76;
      switch (v89) {
        case 0:
          {
          int v91 = 16;
          int v92 = v91 + v76;
          int v93 = v75[v92];
          int v94 = 0;
          bool v95 = v93 != v94;
          int v96;
          if (v95) {
            int v97 = 2;
            v96 = v97;
          } else {
            int v98 = 4;
            int v99 = v76 + v98;
            v96 = v99;
          }
          v90 = v96;
        }
        default:
          {
          int v100 = 20;
          int v101 = v100 + v76;
          int v102 = v75[v101];
          int v103 = 4;
          int v104;
          v104 = v103;
          switch (v102) {
            case 0:
              {
              int v105 = 3;
              int v106 = v76 + v105;
              v104 = v106;
              break;
            }
            default:
              {
              int v107 = 0;
              v104 = v107;
              break;
            }
          }
          bool v108 = true;
          v90 = v104;
        }
        case 1:
          {
          int v109 = 0;
          int v110 = 0;
          int v111;
          int v112;
          v111 = v109;
          v112 = v110;
          while (true) {
            int v113 = 4;
            int v114 = v112 * v113;
            int v115 = v114 + v76;
            int v116 = 24;
            int v117 = v116 + v115;
            int v118 = v75[v117];
            int v119 = 0;
            bool v120 = v118 != v119;
            v111 = v111;
            v112 = v112;
            if (!v120) break;
            int v121 = v111 + v112;
            int v122 = 1;
            int v123 = v112 + v122;
            bool v124 = true;
            v111 = v121;
            v112 = v123;
          }
          v90 = v111;
          break;
        }
      }
      v86 = v90;
    }
    default:
      {
      int v125 = 44;
      int v126 = v125 + v76;
      int v127 = v75[v126];
      int v128 = 2;
      int v129;
      v129 = v128;
      switch (v127) {
        case 0:
          {
          int v130 = 48;
          int v131 = v130 + v76;
          int v132 = v75[v131];
          int v133 = 0;
          bool v134 = v132 != v133;
          int v135;
          if (v134) {
            v135 = v76;
          } else {
            int v136 = 4;
            int v137 = v76 + v136;
            v135 = v137;
          }
          v129 = v135;
          break;
        }
        case 1:
          {
          int v138 = 52;
          int v139 = v138 + v76;
          int v140 = v75[v139];
          int v141 = 0;
          bool v142 = v140 != v141;
          int v143;
          if (v142) {
            int v144 = 1;
            v143 = v144;
          } else {
            int v145 = 0;
            int v146 = v76 + v145;
            v143 = v146;
          }
          v129 = v143;
          break;
        }
        default:
          {
          v129 = v76;
          break;
        }
      }
      v86 = v129;
    }
    case 1:
      {
      int v147 = 56;
      int v148 = v147 + v76;
      int v149 = v75[v148];
      int v150 = 0;
      bool v151 = v149 != v150;
      int v152;
      if (v151) {
        int v153 = 60;
        int v154 = v153 + v76;
        int v155 = v75[v154];
        int v156 = 0;
        bool v157 = v155 != v156;
        int v158;
        if (v157) {
          int v159 = 3;
          v158 = v159;
        } else {
          int v160 = 2;
          int v161 = v76 + v160;
          v158 = v161;
        }
        v152 = v158;
      } else {
        int v162 = 64;
        int v163 = v162 + v76;
        int v164 = v75[v163];
        int v165 = 0;
        bool v166 = v164 != v165;
        int v167;
        if (v166) {
          v167 = v76;
        } else {
          int v168 = 0;
          int v169 = v76 + v168;
          v167 = v169;
        }
        v152 = v167;
      }
      v86 = v152;
      break;
    }
  }
  int v170 = 68;
  int v171 = v170 + v76;
  int v172 = v75[v171];
  int v173 = 3;
  int v174 = v76 + v173;
  int v175;
  v175 = v174;
  switch (v172) {
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
        int v182 = v181 + v76;
        int v183 = 72;
        int v184 = v183 + v182;
        int v185 = v75[v184];
        int v186 = 0;
        bool v187 = v185 != v186;
        v178 = v178;
        v179 = v179;
        if (!v187) break;
        int v188 = v178 + v179;
        int v189 = 1;
        int v190 = v179 + v189;
        bool v191 = true;
        v178 = v188;
        v179 = v190;
      }
      v175 = v178;
      break;
    }
    default:
      {
      int v192 = 92;
      int v193 = v192 + v76;
      int v194 = v75[v193];
      int v195 = 0;
      bool v196 = v194 != v195;
      int v197;
      if (v196) {
        int v198 = 96;
        int v199 = v198 + v76;
        int v200 = v75[v199];
        int v201;
        v201 = v76;
        switch (v200) {
          default:
            {
            v201 = v76;
          }
          case 0:
            {
            int v202 = 4;
            int v203 = v76 + v202;
            v201 = v203;
            break;
          }
        }
        v197 = v201;
      } else {
        int v204 = 100;
        int v205 = v204 + v76;
        int v206 = v75[v205];
        int v207 = 0;
        bool v208 = v206 != v207;
        int v209;
        if (v208) {
          int v210 = 1;
          int v211 = v76 + v210;
          v209 = v211;
        } else {
          v209 = v76;
        }
        v197 = v209;
      }
      v175 = v197;
    }
    case 1:
      {
      int v212 = 104;
      int v213 = v212 + v76;
      int v214 = v75[v213];
      int v215;
      v215 = v76;
      switch (v214) {
        default:
          {
          int v216 = 0;
          int v217 = 0;
          int v218;
          int v219;
          v218 = v216;
          v219 = v217;
          while (true) {
            int v220 = 4;
            int v221 = v219 * v220;
            int v222 = v221 + v76;
            int v223 = 108;
            int v224 = v223 + v222;
            int v225 = v75[v224];
            int v226 = 0;
            bool v227 = v225 != v226;
            v218 = v218;
            v219 = v219;
            if (!v227) break;
            int v228 = v218 + v219;
            int v229 = 1;
            int v230 = v219 + v229;
            bool v231 = true;
            v218 = v228;
            v219 = v230;
          }
          v215 = v218;
        }
        case 0:
          {
          int v232 = 128;
          int v233 = v232 + v76;
          int v234 = v75[v233];
          int v235 = 0;
          bool v236 = v234 != v235;
          int v237;
          if (v236) {
            int v238 = 3;
            int v239 = v76 + v238;
            v237 = v239;
          } else {
            int v240 = 3;
            v237 = v240;
          }
          v215 = v237;
          break;
        }
      }
      v175 = v215;
    }
    case 2:
      {
      int v241 = 132;
      int v242 = v241 + v76;
      int v243 = v75[v242];
      int v244 = 4;
      int v245 = v76 + v244;
      int v246;
      v246 = v245;
      switch (v243) {
        default:
          {
          int v247 = 136;
          int v248 = v247 + v76;
          int v249 = v75[v248];
          int v250 = 2;
          int v251 = v76 + v250;
          int v252;
          v252 = v251;
          switch (v249) {
            case 0:
              {
              int v253 = 1;
              v252 = v253;
              break;
            }
            default:
              {
              v252 = v76;
              break;
            }
            case 1:
              {
              int v254 = 1;
              int v255 = v76 + v254;
              v252 = v255;
              break;
            }
            case 2:
              {
              v252 = v76;
              break;
            }
          }
          v246 = v252;
        }
        case 0:
          {
          int v256 = 140;
          int v257 = v256 + v76;
          int v258 = v75[v257];
          int v259 = 0;
          bool v260 = v258 != v259;
          int v261;
          if (v260) {
            int v262 = 4;
            int v263 = v76 + v262;
            v261 = v263;
          } else {
            int v264 = 0;
            v261 = v264;
          }
          v246 = v261;
        }
        case 1:
          {
          v246 = v76;
          break;
        }
      }
      bool v265 = true;
      v175 = v246;
      break;
    }
  }
  int v266 = 144;
  int v267 = v266 + v76;
  int v268 = v75[v267];
  int v269 = 0;
  bool v270 = v268 != v269;
  int v271;
  if (v270) {
    int v272 = 148;
    int v273 = v272 + v76;
    int v274 = v75[v273];
    int v275 = 1;
    int v276;
    v276 = v275;
    switch (v274) {
      default:
        {
        int v277 = 0;
        int v278 = 0;
        int v279;
        int v280;
        v279 = v277;
        v280 = v278;
        while (true) {
          int v281 = 4;
          int v282 = v280 * v281;
          int v283 = v282 + v76;
          int v284 = 152;
          int v285 = v284 + v283;
          int v286 = v75[v285];
          int v287 = 0;
          bool v288 = v286 != v287;
          v279 = v279;
          v280 = v280;
          if (!v288) break;
          int v289 = v279 + v280;
          int v290 = 1;
          int v291 = v280 + v290;
          bool v292 = true;
          v279 = v289;
          v280 = v291;
          continue;
          ;
        }
        v276 = v279;
        break;
      }
      case 0:
        {
        int v293 = 0;
        v276 = v293;
        break;
      }
      case 1:
        {
        int v294 = 0;
        int v295 = 0;
        int v296;
        int v297;
        v296 = v294;
        v297 = v295;
        while (true) {
          int v298 = 4;
          int v299 = v297 * v298;
          int v300 = v299 + v76;
          int v301 = 172;
          int v302 = v301 + v300;
          int v303 = v75[v302];
          int v304 = 0;
          bool v305 = v303 != v304;
          v296 = v296;
          v297 = v297;
          if (!v305) break;
          int v306 = v296 + v297;
          int v307 = 1;
          int v308 = v297 + v307;
          bool v309 = true;
          v296 = v306;
          v297 = v308;
        }
        v276 = v296;
        break;
      }
      case 2:
        {
        v276 = v76;
        break;
      }
    }
    v271 = v276;
  } else {
    int v310 = 192;
    int v311 = v310 + v76;
    int v312 = v75[v311];
    int v313;
    v313 = v76;
    switch (v312) {
      case 0:
        {
        int v314 = 0;
        int v315 = 0;
        int v316;
        int v317;
        v316 = v314;
        v317 = v315;
        while (true) {
          int v318 = 4;
          int v319 = v317 * v318;
          int v320 = v319 + v76;
          int v321 = 196;
          int v322 = v321 + v320;
          int v323 = v75[v322];
          int v324 = 0;
          bool v325 = v323 != v324;
          v316 = v316;
          v317 = v317;
          if (!v325) break;
          int v326 = v316 + v317;
          int v327 = 1;
          int v328 = v317 + v327;
          bool v329 = true;
          v316 = v326;
          v317 = v328;
        }
        v313 = v316;
      }
      case 1:
        {
        int v330 = 216;
        int v331 = v330 + v76;
        int v332 = v75[v331];
        int v333 = 3;
        int v334;
        v334 = v333;
        switch (v332) {
          default:
            {
            int v335 = 2;
            int v336 = v76 + v335;
            v334 = v336;
            break;
          }
          case 0:
            {
            int v337 = 3;
            v334 = v337;
            break;
          }
          case 1:
            {
            v334 = v76;
            break;
          }
        }
        bool v338 = true;
        v313 = v334;
        break;
      }
      case 2:
        {
        int v339 = 220;
        int v340 = v339 + v76;
        int v341 = v75[v340];
        int v342 = 0;
        bool v343 = v341 != v342;
        int v344;
        if (v343) {
          int v345 = 4;
          int v346 = v76 + v345;
          v344 = v346;
        } else {
          v344 = v76;
        }
        v313 = v344;
      }
      default:
        {
        int v347 = 0;
        int v348 = 0;
        int v349;
        int v350;
        v349 = v347;
        v350 = v348;
        while (true) {
          int v351 = 4;
          int v352 = v350 * v351;
          int v353 = v352 + v76;
          int v354 = 224;
          int v355 = v354 + v353;
          int v356 = v75[v355];
          int v357 = 0;
          bool v358 = v356 != v357;
          v349 = v349;
          v350 = v350;
          if (!v358) break;
          int v359 = v349 + v350;
          int v360 = 1;
          int v361 = v350 + v360;
          bool v362 = true;
          v349 = v359;
          v350 = v361;
        }
        v313 = v349;
        break;
      }
    }
    v271 = v313;
  }
  int v363 = 16;
  int v364 = v363 + v76;
  bool v365 = true;
  int v366 = simt_wave_count_bits(v365);
  v74[v364] = v366;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 244; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
