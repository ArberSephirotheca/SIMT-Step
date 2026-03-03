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
  int v4 = 4;
  int v5 = v3 % v4;
  int v6;
  v6 = v0;
  switch (v5) {
    case 0:
      {
      int v7 = 4;
      int v8 = v3 % v7;
      int v9 = 3;
      int v10 = v0 + v9;
      int v11;
      v11 = v10;
      switch (v8) {
        default:
          {
          int v12 = 2;
          int v13 = v3 % v12;
          int v14;
          v14 = v0;
          switch (v13) {
            case 0:
              {
              v14 = v0;
            }
            case 1:
              {
              v14 = v0;
              break;
            }
            default:
              {
              v14 = v0;
              break;
            }
          }
          int v15 = 4;
          v11 = v14;
          break;
        }
        case 0:
          {
          int v16 = 0;
          int v17 = 0;
          int v18;
          int v19;
          v18 = v16;
          v19 = v17;
          while (true) {
            int v20 = 4;
            int v21 = v3 % v20;
            int v22 = 1;
            int v23 = v21 + v22;
            bool v24 = v19 < v23;
            v18 = v18;
            v19 = v19;
            if (!v24) break;
            int v25 = 0;
            int v26 = 1;
            int v27 = v19 + v26;
            v18 = v25;
            v19 = v27;
          }
          v11 = v18;
        }
        case 1:
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
            int v37 = 3;
            int v38 = 1;
            int v39 = v31 + v38;
            v30 = v37;
            v31 = v39;
            break;
            ;
          }
          v11 = v30;
          break;
        }
        case 2:
          {
          int v40 = 0;
          int v41 = 0;
          int v42;
          int v43;
          v42 = v40;
          v43 = v41;
          while (true) {
            int v44 = 4;
            int v45 = v3 % v44;
            int v46 = 1;
            int v47 = v45 + v46;
            bool v48 = v43 < v47;
            v42 = v42;
            v43 = v43;
            if (!v48) break;
            int v49 = 1;
            int v50 = v43 + v49;
            v42 = v0;
            v43 = v50;
          }
          int v51 = 2;
          v11 = v42;
          break;
        }
      }
      int v52 = 1;
      v6 = v11;
      break;
    }
    default:
      {
      int v53 = 0;
      bool v54 = v2 != v53;
      int v55;
      if (v54) {
        int v56 = 2;
        int v57 = v3 % v56;
        int v58;
        v58 = v0;
        switch (v57) {
          case 0:
            {
            int v59 = 2;
            v58 = v59;
            break;
          }
          default:
            {
            int v60 = 3;
            v58 = v60;
            break;
          }
          case 1:
            {
            v58 = v0;
            break;
          }
        }
        int v61 = 1;
        int v62 = v0 + v61;
        v55 = v58;
      } else {
        int v63 = 0;
        int v64 = 0;
        int v65;
        int v66;
        v65 = v63;
        v66 = v64;
        while (true) {
          int v67 = 4;
          int v68 = v3 % v67;
          int v69 = 1;
          int v70 = v68 + v69;
          bool v71 = v66 < v70;
          v65 = v65;
          v66 = v66;
          if (!v71) break;
          int v72 = 1;
          int v73 = v66 + v72;
          v65 = v0;
          v66 = v73;
        }
        int v74 = 4;
        v55 = v65;
      }
      v6 = v55;
      break;
    }
    case 1:
      {
      int v75 = 0;
      bool v76 = v2 != v75;
      int v77;
      if (v76) {
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
          int v87 = 1;
          int v88 = v81 + v87;
          v80 = v0;
          v81 = v88;
        }
        v77 = v80;
      } else {
        int v89 = 0;
        int v90 = 0;
        int v91;
        int v92;
        v91 = v89;
        v92 = v90;
        while (true) {
          int v93 = 4;
          int v94 = v3 % v93;
          int v95 = 1;
          int v96 = v94 + v95;
          bool v97 = v92 < v96;
          v91 = v91;
          v92 = v92;
          if (!v97) break;
          int v98 = 1;
          int v99 = v0 + v98;
          int v100 = 1;
          int v101 = v92 + v100;
          v91 = v99;
          v92 = v101;
        }
        int v102 = 0;
        v77 = v91;
      }
      v6 = v77;
      break;
    }
    case 2:
      {
      int v103 = 3;
      int v104 = v3 % v103;
      int v105 = 4;
      int v106 = v0 + v105;
      int v107;
      v107 = v106;
      switch (v104) {
        case 0:
          {
          int v108 = 0;
          int v109 = 0;
          int v110;
          int v111;
          v110 = v108;
          v111 = v109;
          while (true) {
            int v112 = 4;
            int v113 = v3 % v112;
            int v114 = 1;
            int v115 = v113 + v114;
            bool v116 = v111 < v115;
            v110 = v110;
            v111 = v111;
            if (!v116) break;
            int v117 = 1;
            int v118 = v111 + v117;
            v110 = v0;
            v111 = v118;
          }
          int v119 = 1;
          int v120 = v0 + v119;
          v107 = v110;
          break;
        }
        case 1:
          {
          int v121 = 3;
          int v122 = v3 % v121;
          int v123 = 2;
          int v124 = v0 + v123;
          int v125;
          v125 = v124;
          switch (v122) {
            default:
              {
              int v126 = 0;
              int v127 = v0 + v126;
              v125 = v127;
              break;
            }
            case 0:
              {
              int v128 = 0;
              v125 = v128;
              break;
            }
            case 1:
              {
              int v129 = 1;
              v125 = v129;
              break;
            }
          }
          int v130 = 4;
          int v131 = v0 + v130;
          v107 = v125;
          break;
        }
        default:
          {
          int v132 = 0;
          bool v133 = v2 != v132;
          int v134;
          if (v133) {
            int v135 = 3;
            v134 = v135;
          } else {
            int v136 = 2;
            int v137 = v0 + v136;
            v134 = v137;
          }
          int v138 = 1;
          int v139 = v0 + v138;
          v107 = v134;
          break;
        }
      }
      v6 = v107;
      break;
    }
  }
  bool v140 = true;
  int v141 = simt_wave_count_bits(v140);
  int v142 = 0;
  int v143 = v142 + v0;
  v1[v143] = v141;
  return;
}

kernel void kernel_main(device int* v144 [[buffer(0)]], device int* v145 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v146 = static_cast<int>(__simt_tid3.x);
  int v147 = 0;
  int v148 = v147 + v146;
  int v149 = v145[v148];
  int v150 = 4;
  int v151 = v150 + v146;
  int v152 = v145[v151];
  helper0(v146, v144, v149, v152, static_cast<int>(__simt_tid3.x));
  int v153 = 8;
  int v154 = v153 + v146;
  int v155 = v145[v154];
  int v156;
  v156 = v146;
  switch (v155) {
    default:
      {
      int v157 = 12;
      int v158 = v157 + v146;
      int v159 = v145[v158];
      int v160 = 1;
      int v161 = v146 + v160;
      int v162;
      v162 = v161;
      switch (v159) {
        case 0:
          {
          int v163 = 4;
          v162 = v163;
        }
        default:
          {
          int v164 = 16;
          int v165 = v164 + v146;
          int v166 = v145[v165];
          int v167 = 0;
          bool v168 = v166 != v167;
          int v169;
          if (v168) {
            int v170 = 4;
            v169 = v170;
          } else {
            int v171 = 2;
            v169 = v171;
          }
          v162 = v169;
          break;
        }
        case 1:
          {
          int v172 = 4;
          v162 = v172;
          break;
        }
        case 2:
          {
          int v173 = 20;
          int v174 = v173 + v146;
          int v175 = v145[v174];
          int v176 = 0;
          bool v177 = v175 != v176;
          int v178;
          if (v177) {
            v178 = v146;
          } else {
            int v179 = 3;
            v178 = v179;
          }
          v162 = v178;
          break;
        }
      }
      bool v180 = true;
      v156 = v162;
    }
    case 0:
      {
      int v181 = 24;
      int v182 = v181 + v146;
      int v183 = v145[v182];
      int v184 = 0;
      bool v185 = v183 != v184;
      int v186;
      if (v185) {
        int v187 = 28;
        int v188 = v187 + v146;
        int v189 = v145[v188];
        int v190 = 0;
        bool v191 = v189 != v190;
        int v192;
        if (v191) {
          int v193 = 0;
          int v194 = v146 + v193;
          v192 = v194;
        } else {
          int v195 = 4;
          v192 = v195;
        }
        v186 = v192;
      } else {
        int v196 = 32;
        int v197 = v196 + v146;
        int v198 = v145[v197];
        int v199 = 0;
        bool v200 = v198 != v199;
        int v201;
        if (v200) {
          int v202 = 0;
          int v203 = v146 + v202;
          v201 = v203;
        } else {
          int v204 = 0;
          int v205 = v146 + v204;
          v201 = v205;
        }
        v186 = v201;
      }
      v156 = v186;
      break;
    }
  }
  bool v206 = true;
  int v207 = 16;
  int v208 = v207 + v146;
  bool v209 = true;
  int v210 = simt_wave_count_bits(v209);
  v144[v208] = v210;
  int v211 = 36;
  int v212 = v211 + v146;
  int v213 = v145[v212];
  uint v214 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v215 = (int)(v214);
  int v216;
  v216 = v215;
  switch (v213) {
    default:
      {
      int v217 = 40;
      int v218 = v217 + v146;
      int v219 = v145[v218];
      int v220 = 3;
      int v221 = v146 + v220;
      int v222;
      v222 = v221;
      switch (v219) {
        case 0:
          {
          int v223 = 44;
          int v224 = v223 + v146;
          int v225 = v145[v224];
          int v226 = 4;
          int v227;
          v227 = v226;
          switch (v225) {
            default:
              {
              int v228 = 4;
              v227 = v228;
              break;
            }
            case 0:
              {
              int v229 = 3;
              v227 = v229;
              break;
            }
            case 1:
              {
              int v230 = 1;
              v227 = v230;
              break;
            }
            case 2:
              {
              int v231 = 1;
              int v232 = v146 + v231;
              v227 = v232;
              break;
            }
          }
          bool v233 = true;
          v222 = v227;
          break;
        }
        default:
          {
          int v234 = 48;
          int v235 = v234 + v146;
          int v236 = v145[v235];
          int v237 = 0;
          bool v238 = v236 != v237;
          int v239;
          if (v238) {
            int v240 = 4;
            v239 = v240;
          } else {
            v239 = v146;
          }
          v222 = v239;
          break;
        }
        case 1:
          {
          int v241 = 0;
          int v242 = 0;
          int v243;
          int v244;
          v243 = v241;
          v244 = v242;
          while (true) {
            int v245 = 4;
            int v246 = v244 * v245;
            int v247 = v246 + v146;
            int v248 = 52;
            int v249 = v248 + v247;
            int v250 = v145[v249];
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
            continue;
            ;
          }
          bool v256 = true;
          v222 = v243;
          break;
        }
      }
      bool v257 = true;
      v216 = v222;
    }
    case 0:
      {
      int v258 = 0;
      int v259 = 0;
      int v260;
      int v261;
      v260 = v258;
      v261 = v259;
      while (true) {
        int v262 = 4;
        int v263 = v261 * v262;
        int v264 = v263 + v146;
        int v265 = 72;
        int v266 = v265 + v264;
        int v267 = v145[v266];
        int v268 = 0;
        bool v269 = v267 != v268;
        v260 = v260;
        v261 = v261;
        if (!v269) break;
        int v270 = 92;
        int v271 = v270 + v146;
        int v272 = v145[v271];
        int v273 = 0;
        bool v274 = v272 != v273;
        int v275;
        if (v274) {
          v275 = v146;
        } else {
          int v276 = 3;
          int v277 = v146 + v276;
          v275 = v277;
        }
        int v278 = v260 + v275;
        int v279 = 1;
        int v280 = v261 + v279;
        v260 = v278;
        v261 = v280;
      }
      bool v281 = true;
      v216 = v260;
    }
    case 1:
      {
      int v282 = 96;
      int v283 = v282 + v146;
      int v284 = v145[v283];
      int v285 = 0;
      bool v286 = v284 != v285;
      int v287;
      if (v286) {
        int v288 = 0;
        int v289 = 0;
        int v290;
        int v291;
        v290 = v288;
        v291 = v289;
        while (true) {
          int v292 = 4;
          int v293 = v291 * v292;
          int v294 = v293 + v146;
          int v295 = 100;
          int v296 = v295 + v294;
          int v297 = v145[v296];
          int v298 = 0;
          bool v299 = v297 != v298;
          v290 = v290;
          v291 = v291;
          if (!v299) break;
          int v300 = v290 + v291;
          int v301 = 1;
          int v302 = v291 + v301;
          v290 = v300;
          v291 = v302;
        }
        bool v303 = true;
        v287 = v290;
      } else {
        int v304 = 120;
        int v305 = v304 + v146;
        int v306 = v145[v305];
        int v307 = 4;
        int v308;
        v308 = v307;
        switch (v306) {
          default:
            {
            int v309 = 2;
            int v310 = v146 + v309;
            v308 = v310;
          }
          case 0:
            {
            int v311 = 0;
            int v312 = v146 + v311;
            v308 = v312;
          }
          case 1:
            {
            v308 = v146;
          }
          case 2:
            {
            int v313 = 1;
            v308 = v313;
            break;
          }
        }
        bool v314 = true;
        v287 = v308;
      }
      v216 = v287;
    }
    case 2:
      {
      int v315 = 124;
      int v316 = v315 + v146;
      int v317 = v145[v316];
      int v318 = 2;
      int v319 = v146 + v318;
      int v320;
      v320 = v319;
      switch (v317) {
        case 0:
          {
          int v321 = 2;
          int v322 = v146 + v321;
          v320 = v322;
          break;
        }
        default:
          {
          int v323 = 128;
          int v324 = v323 + v146;
          int v325 = v145[v324];
          int v326 = 1;
          int v327;
          v327 = v326;
          switch (v325) {
            case 0:
              {
              int v328 = 2;
              v327 = v328;
              break;
            }
            default:
              {
              v327 = v146;
              break;
            }
          }
          bool v329 = true;
          v320 = v327;
          break;
        }
        case 1:
          {
          int v330 = 132;
          int v331 = v330 + v146;
          int v332 = v145[v331];
          int v333 = 0;
          bool v334 = v332 != v333;
          int v335;
          if (v334) {
            int v336 = 1;
            int v337 = v146 + v336;
            v335 = v337;
          } else {
            int v338 = 1;
            v335 = v338;
          }
          v320 = v335;
          break;
        }
        case 2:
          {
          int v339 = 136;
          int v340 = v339 + v146;
          int v341 = v145[v340];
          int v342 = 0;
          bool v343 = v341 != v342;
          int v344;
          if (v343) {
            int v345 = 2;
            v344 = v345;
          } else {
            int v346 = 1;
            v344 = v346;
          }
          v320 = v344;
          break;
        }
      }
      bool v347 = true;
      v216 = v320;
      break;
    }
  }
  bool v348 = true;
  int v349 = 32;
  int v350 = v349 + v146;
  bool v351 = true;
  int v352 = simt_wave_count_bits(v351);
  v144[v350] = v352;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 36; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 140; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
