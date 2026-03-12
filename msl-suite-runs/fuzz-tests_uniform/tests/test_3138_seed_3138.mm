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
  int v4 = 1;
  int v5 = 0;
  int v6 = 0;
  int v7;
  int v8;
  v7 = v5;
  v8 = v6;
  while (true) {
    int v9 = 4;
    int v10 = v3 % v9;
    int v11 = 1;
    int v12 = v10 + v11;
    bool v13 = v8 < v12;
    v7 = v7;
    v8 = v8;
    if (!v13) break;
    int v14 = 0;
    int v15 = 0;
    int v16;
    int v17;
    v16 = v14;
    v17 = v15;
    while (true) {
      int v18 = 4;
      int v19 = v3 % v18;
      int v20 = 1;
      int v21 = v19 + v20;
      bool v22 = v17 < v21;
      v16 = v16;
      v17 = v17;
      if (!v22) break;
      int v23 = 0;
      bool v24 = v2 != v23;
      int v25;
      if (v24) {
        uint v26 = simt_lane_id(__simt_tid);
        int v27 = (int)(v26);
        v25 = v27;
      } else {
        uint v28 = simt_lane_id(__simt_tid);
        int v29 = (int)(v28);
        v25 = v29;
      }
      uint v30 = simt_lane_id(__simt_tid);
      int v31 = (int)(v30);
      int v32 = 1;
      int v33 = v17 + v32;
      v16 = v25;
      v17 = v33;
    }
    int v34 = 2;
    int v35 = v0 + v34;
    int v36 = 1;
    int v37 = v8 + v36;
    v7 = v16;
    v8 = v37;
  }
  bool v38 = true;
  int v39 = simt_wave_count_bits(v38);
  int v40 = 0;
  int v41 = v40 + v0;
  v1[v41] = v39;
  int v42 = 0;
  bool v43 = v2 != v42;
  int v44 = v43 ? v4 : v7;
  return;
}

kernel void kernel_main(device int* v45 [[buffer(0)]], device int* v46 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v47 = static_cast<int>(__simt_tid3.x);
  int v48 = 0;
  int v49 = v48 + v47;
  int v50 = v46[v49];
  int v51 = 4;
  int v52 = v51 + v47;
  int v53 = v46[v52];
  helper0(v47, v45, v50, v53, static_cast<int>(__simt_tid3.x));
  int v54 = 8;
  int v55 = v54 + v47;
  int v56 = v46[v55];
  int v57 = 4;
  int v58 = v47 + v57;
  int v59;
  v59 = v58;
  switch (v56) {
    case 0:
      {
      int v60 = 4;
      v59 = v60;
      break;
    }
    case 1:
      {
      int v61 = 12;
      int v62 = v61 + v47;
      int v63 = v46[v62];
      int v64 = 0;
      bool v65 = v63 != v64;
      int v66;
      if (v65) {
        int v67 = 0;
        v66 = v67;
      } else {
        v66 = v47;
      }
      v59 = v66;
      break;
    }
    default:
      {
      v59 = v47;
      break;
    }
  }
  bool v68 = true;
  int v69 = 16;
  int v70 = v69 + v47;
  bool v71 = true;
  int v72 = simt_wave_count_bits(v71);
  v45[v70] = v72;
  int v73 = 16;
  int v74 = v73 + v47;
  int v75 = v46[v74];
  int v76 = 0;
  int v77;
  v77 = v76;
  switch (v75) {
    case 0:
      {
      int v78 = 0;
      int v79 = 0;
      int v80;
      int v81;
      v80 = v78;
      v81 = v79;
      while (true) {
        int v82 = 4;
        int v83 = v81 * v82;
        int v84 = v83 + v47;
        int v85 = 20;
        int v86 = v85 + v84;
        int v87 = v46[v86];
        int v88 = 0;
        bool v89 = v87 != v88;
        v80 = v80;
        v81 = v81;
        if (!v89) break;
        int v90 = v80 + v81;
        int v91 = 1;
        int v92 = v81 + v91;
        v80 = v90;
        v81 = v92;
      }
      bool v93 = true;
      v77 = v80;
    }
    default:
      {
      int v94 = 40;
      int v95 = v94 + v47;
      int v96 = v46[v95];
      int v97 = 0;
      int v98 = v47 + v97;
      int v99;
      v99 = v98;
      switch (v96) {
        case 0:
          {
          int v100 = 44;
          int v101 = v100 + v47;
          int v102 = v46[v101];
          int v103 = 3;
          int v104 = v47 + v103;
          int v105;
          v105 = v104;
          switch (v102) {
            case 0:
              {
              int v106 = 0;
              int v107 = v47 + v106;
              v105 = v107;
              break;
            }
            default:
              {
              int v108 = 3;
              int v109 = v47 + v108;
              v105 = v109;
              break;
            }
          }
          bool v110 = true;
          v99 = v105;
          break;
        }
        case 1:
          {
          int v111 = 0;
          int v112 = 0;
          int v113;
          int v114;
          v113 = v111;
          v114 = v112;
          while (true) {
            int v115 = 4;
            int v116 = v114 * v115;
            int v117 = v116 + v47;
            int v118 = 48;
            int v119 = v118 + v117;
            int v120 = v46[v119];
            int v121 = 0;
            bool v122 = v120 != v121;
            v113 = v113;
            v114 = v114;
            if (!v122) break;
            int v123 = v113 + v114;
            int v124 = 1;
            int v125 = v114 + v124;
            v113 = v123;
            v114 = v125;
          }
          bool v126 = true;
          v99 = v113;
          break;
        }
        case 2:
          {
          int v127 = 0;
          int v128 = 0;
          int v129;
          int v130;
          v129 = v127;
          v130 = v128;
          while (true) {
            int v131 = 4;
            int v132 = v130 * v131;
            int v133 = v132 + v47;
            int v134 = 68;
            int v135 = v134 + v133;
            int v136 = v46[v135];
            int v137 = 0;
            bool v138 = v136 != v137;
            v129 = v129;
            v130 = v130;
            if (!v138) break;
            int v139 = v129 + v130;
            int v140 = 1;
            int v141 = v130 + v140;
            v129 = v139;
            v130 = v141;
          }
          bool v142 = true;
          v99 = v129;
          break;
        }
        default:
          {
          int v143 = 88;
          int v144 = v143 + v47;
          int v145 = v46[v144];
          int v146 = 2;
          int v147;
          v147 = v146;
          switch (v145) {
            default:
              {
              int v148 = 1;
              v147 = v148;
              break;
            }
            case 0:
              {
              v147 = v47;
            }
            case 1:
              {
              int v149 = 4;
              v147 = v149;
              break;
            }
          }
          bool v150 = true;
          v99 = v147;
          break;
        }
      }
      bool v151 = true;
      v77 = v99;
      break;
    }
    case 1:
      {
      int v152 = 92;
      int v153 = v152 + v47;
      int v154 = v46[v153];
      int v155;
      v155 = v47;
      switch (v154) {
        case 0:
          {
          int v156 = 0;
          int v157 = 0;
          int v158;
          int v159;
          v158 = v156;
          v159 = v157;
          while (true) {
            int v160 = 4;
            int v161 = v159 * v160;
            int v162 = v161 + v47;
            int v163 = 96;
            int v164 = v163 + v162;
            int v165 = v46[v164];
            int v166 = 0;
            bool v167 = v165 != v166;
            v158 = v158;
            v159 = v159;
            if (!v167) break;
            int v168 = v158 + v159;
            int v169 = 1;
            int v170 = v159 + v169;
            v158 = v168;
            v159 = v170;
          }
          bool v171 = true;
          v155 = v158;
        }
        case 1:
          {
          int v172 = 116;
          int v173 = v172 + v47;
          int v174 = v46[v173];
          int v175 = 0;
          bool v176 = v174 != v175;
          int v177;
          if (v176) {
            v177 = v47;
          } else {
            v177 = v47;
          }
          v155 = v177;
        }
        case 2:
          {
          int v178 = 120;
          int v179 = v178 + v47;
          int v180 = v46[v179];
          int v181 = 0;
          int v182 = v47 + v181;
          int v183;
          v183 = v182;
          switch (v180) {
            case 0:
              {
              int v184 = 3;
              int v185 = v47 + v184;
              v183 = v185;
              break;
            }
            default:
              {
              int v186 = 0;
              int v187 = v47 + v186;
              v183 = v187;
            }
            case 1:
              {
              v183 = v47;
              break;
            }
          }
          bool v188 = true;
          v155 = v183;
          break;
        }
        default:
          {
          int v189 = 124;
          int v190 = v189 + v47;
          int v191 = v46[v190];
          int v192 = 0;
          bool v193 = v191 != v192;
          int v194;
          if (v193) {
            v194 = v47;
          } else {
            v194 = v47;
          }
          v155 = v194;
          break;
        }
      }
      bool v195 = true;
      v77 = v155;
      break;
    }
    case 2:
      {
      int v196 = 128;
      int v197 = v196 + v47;
      int v198 = v46[v197];
      int v199;
      v199 = v47;
      switch (v198) {
        case 0:
          {
          int v200 = 0;
          int v201 = 0;
          int v202;
          int v203;
          v202 = v200;
          v203 = v201;
          while (true) {
            int v204 = 4;
            int v205 = v203 * v204;
            int v206 = v205 + v47;
            int v207 = 132;
            int v208 = v207 + v206;
            int v209 = v46[v208];
            int v210 = 0;
            bool v211 = v209 != v210;
            v202 = v202;
            v203 = v203;
            if (!v211) break;
            int v212 = v202 + v203;
            int v213 = 1;
            int v214 = v203 + v213;
            v202 = v212;
            v203 = v214;
            break;
            ;
          }
          bool v215 = true;
          v199 = v202;
          break;
        }
        default:
          {
          int v216 = 152;
          int v217 = v216 + v47;
          int v218 = v46[v217];
          int v219 = 4;
          int v220 = v47 + v219;
          int v221;
          v221 = v220;
          switch (v218) {
            case 0:
              {
              v221 = v47;
              break;
            }
            case 1:
              {
              int v222 = 1;
              int v223 = v47 + v222;
              v221 = v223;
              break;
            }
            default:
              {
              int v224 = 2;
              int v225 = v47 + v224;
              v221 = v225;
              break;
            }
            case 2:
              {
              v221 = v47;
              break;
            }
          }
          bool v226 = true;
          v199 = v221;
          break;
        }
      }
      bool v227 = true;
      v77 = v199;
      break;
    }
  }
  bool v228 = true;
  int v229 = 32;
  int v230 = v229 + v47;
  bool v231 = true;
  int v232 = simt_wave_count_bits(v231);
  v45[v230] = v232;
  int v233 = 156;
  int v234 = v233 + v47;
  int v235 = v46[v234];
  uint v236 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v237 = (int)(v236);
  int v238;
  v238 = v237;
  switch (v235) {
    default:
      {
      int v239 = 160;
      int v240 = v239 + v47;
      int v241 = v46[v240];
      int v242;
      v242 = v47;
      switch (v241) {
        default:
          {
          int v243 = 164;
          int v244 = v243 + v47;
          int v245 = v46[v244];
          int v246 = 0;
          bool v247 = v245 != v246;
          int v248;
          if (v247) {
            int v249 = 2;
            int v250 = v47 + v249;
            v248 = v250;
          } else {
            int v251 = 4;
            v248 = v251;
          }
          v242 = v248;
          break;
        }
        case 0:
          {
          int v252 = 2;
          v242 = v252;
          break;
        }
        case 1:
          {
          int v253 = 0;
          int v254 = 0;
          int v255;
          int v256;
          v255 = v253;
          v256 = v254;
          while (true) {
            int v257 = 4;
            int v258 = v256 * v257;
            int v259 = v258 + v47;
            int v260 = 168;
            int v261 = v260 + v259;
            int v262 = v46[v261];
            int v263 = 0;
            bool v264 = v262 != v263;
            v255 = v255;
            v256 = v256;
            if (!v264) break;
            int v265 = v255 + v256;
            int v266 = 1;
            int v267 = v256 + v266;
            v255 = v265;
            v256 = v267;
          }
          bool v268 = true;
          v242 = v255;
          break;
        }
        case 2:
          {
          int v269 = 188;
          int v270 = v269 + v47;
          int v271 = v46[v270];
          int v272;
          v272 = v47;
          switch (v271) {
            case 0:
              {
              int v273 = 0;
              int v274 = v47 + v273;
              v272 = v274;
            }
            default:
              {
              int v275 = 0;
              v272 = v275;
            }
            case 1:
              {
              int v276 = 0;
              v272 = v276;
            }
            case 2:
              {
              int v277 = 4;
              int v278 = v47 + v277;
              v272 = v278;
              break;
            }
          }
          bool v279 = true;
          v242 = v272;
          break;
        }
      }
      bool v280 = true;
      v238 = v242;
      break;
    }
    case 0:
      {
      int v281 = 192;
      int v282 = v281 + v47;
      int v283 = v46[v282];
      int v284 = 4;
      int v285;
      v285 = v284;
      switch (v283) {
        case 0:
          {
          v285 = v47;
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
            int v292 = v291 + v47;
            int v293 = 196;
            int v294 = v293 + v292;
            int v295 = v46[v294];
            int v296 = 0;
            bool v297 = v295 != v296;
            v288 = v288;
            v289 = v289;
            if (!v297) break;
            int v298 = v288 + v289;
            int v299 = 1;
            int v300 = v289 + v299;
            v288 = v298;
            v289 = v300;
          }
          bool v301 = true;
          v285 = v288;
          break;
        }
        case 1:
          {
          int v302 = 0;
          int v303 = 0;
          int v304;
          int v305;
          v304 = v302;
          v305 = v303;
          while (true) {
            int v306 = 4;
            int v307 = v305 * v306;
            int v308 = v307 + v47;
            int v309 = 216;
            int v310 = v309 + v308;
            int v311 = v46[v310];
            int v312 = 0;
            bool v313 = v311 != v312;
            v304 = v304;
            v305 = v305;
            if (!v313) break;
            int v314 = v304 + v305;
            int v315 = 1;
            int v316 = v305 + v315;
            v304 = v314;
            v305 = v316;
            continue;
            ;
          }
          bool v317 = true;
          v285 = v304;
        }
        case 2:
          {
          int v318 = 236;
          int v319 = v318 + v47;
          int v320 = v46[v319];
          int v321 = 0;
          bool v322 = v320 != v321;
          int v323;
          if (v322) {
            int v324 = 2;
            v323 = v324;
          } else {
            int v325 = 3;
            int v326 = v47 + v325;
            v323 = v326;
          }
          v285 = v323;
          break;
        }
      }
      bool v327 = true;
      v238 = v285;
      break;
    }
    case 1:
      {
      int v328 = 240;
      int v329 = v328 + v47;
      int v330 = v46[v329];
      int v331 = 0;
      bool v332 = v330 != v331;
      int v333;
      if (v332) {
        int v334 = 244;
        int v335 = v334 + v47;
        int v336 = v46[v335];
        int v337;
        v337 = v47;
        switch (v336) {
          case 0:
            {
            int v338 = 0;
            v337 = v338;
          }
          case 1:
            {
            int v339 = 3;
            int v340 = v47 + v339;
            v337 = v340;
            break;
          }
          case 2:
            {
            int v341 = 1;
            int v342 = v47 + v341;
            v337 = v342;
            break;
          }
          default:
            {
            int v343 = 3;
            int v344 = v47 + v343;
            v337 = v344;
            break;
          }
        }
        bool v345 = true;
        v333 = v337;
      } else {
        int v346 = 248;
        int v347 = v346 + v47;
        int v348 = v46[v347];
        int v349 = 0;
        bool v350 = v348 != v349;
        int v351;
        if (v350) {
          int v352 = 3;
          int v353 = v47 + v352;
          v351 = v353;
        } else {
          int v354 = 4;
          v351 = v354;
        }
        v333 = v351;
      }
      v238 = v333;
      break;
    }
  }
  bool v355 = true;
  int v356 = 48;
  int v357 = v356 + v47;
  bool v358 = true;
  int v359 = simt_wave_count_bits(v358);
  v45[v357] = v359;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 52; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 252; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
