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
    int v13 = 2;
    int v14 = 1;
    int v15 = v7 + v14;
    v6 = v13;
    v7 = v15;
  }
  bool v16 = true;
  int v17 = simt_wave_count_bits(v16);
  int v18 = 0;
  int v19 = v18 + v0;
  v1[v19] = v17;
  int v20 = 3;
  int v21 = v3 % v20;
  uint v22 = simt_lane_id(__simt_tid);
  int v23 = (int)(v22);
  int v24;
  v24 = v23;
  switch (v21) {
    case 0:
      {
      int v25 = 0;
      int v26 = 0;
      int v27;
      int v28;
      v27 = v25;
      v28 = v26;
      while (true) {
        int v29 = 4;
        int v30 = v3 % v29;
        int v31 = 1;
        int v32 = v30 + v31;
        bool v33 = v28 < v32;
        v27 = v27;
        v28 = v28;
        if (!v33) break;
        int v34 = 4;
        int v35 = v3 % v34;
        int v36 = 4;
        int v37 = v0 + v36;
        int v38;
        v38 = v37;
        switch (v35) {
          case 0:
            {
            int v39 = 3;
            v38 = v39;
            break;
          }
          case 1:
            {
            int v40 = 4;
            v38 = v40;
            break;
          }
          case 2:
            {
            int v41 = 3;
            v38 = v41;
            break;
          }
          default:
            {
            v38 = v0;
            break;
          }
        }
        int v42 = 1;
        int v43 = v0 + v42;
        int v44 = 1;
        int v45 = v28 + v44;
        v27 = v38;
        v28 = v45;
      }
      int v46 = 4;
      int v47 = v0 + v46;
      v24 = v27;
      break;
    }
    case 1:
      {
      int v48 = 3;
      int v49 = v3 % v48;
      int v50;
      v50 = v0;
      switch (v49) {
        case 0:
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
          int v62 = 0;
          v50 = v53;
          break;
        }
        case 1:
          {
          v50 = v0;
          break;
        }
        case 2:
          {
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
            int v72 = 2;
            int v73 = v0 + v72;
            int v74 = 1;
            int v75 = v66 + v74;
            v65 = v73;
            v66 = v75;
          }
          v50 = v65;
          break;
        }
        default:
          {
          int v76 = 0;
          int v77 = 0;
          int v78;
          int v79;
          v78 = v76;
          v79 = v77;
          while (true) {
            int v80 = 4;
            int v81 = v3 % v80;
            int v82 = 1;
            int v83 = v81 + v82;
            bool v84 = v79 < v83;
            v78 = v78;
            v79 = v79;
            if (!v84) break;
            int v85 = 1;
            int v86 = v79 + v85;
            v78 = v0;
            v79 = v86;
            continue;
            ;
          }
          v50 = v78;
          break;
        }
      }
      v24 = v50;
      break;
    }
    default:
      {
      int v87 = 4;
      int v88 = v3 % v87;
      int v89 = 4;
      int v90;
      v90 = v89;
      switch (v88) {
        case 0:
          {
          v90 = v0;
          break;
        }
        default:
          {
          int v91 = 3;
          int v92 = v3 % v91;
          int v93 = 2;
          int v94;
          v94 = v93;
          switch (v92) {
            case 0:
              {
              int v95 = 0;
              v94 = v95;
              break;
            }
            case 1:
              {
              int v96 = 1;
              v94 = v96;
              break;
            }
            default:
              {
              int v97 = 3;
              int v98 = v0 + v97;
              v94 = v98;
              break;
            }
          }
          v90 = v94;
          break;
        }
        case 1:
          {
          v90 = v0;
          break;
        }
        case 2:
          {
          int v99 = 0;
          int v100 = 0;
          int v101;
          int v102;
          v101 = v99;
          v102 = v100;
          while (true) {
            int v103 = 4;
            int v104 = v3 % v103;
            int v105 = 1;
            int v106 = v104 + v105;
            bool v107 = v102 < v106;
            v101 = v101;
            v102 = v102;
            if (!v107) break;
            int v108 = 1;
            int v109 = v102 + v108;
            v101 = v0;
            v102 = v109;
          }
          int v110 = 0;
          v90 = v101;
          break;
        }
      }
      v24 = v90;
      break;
    }
    case 2:
      {
      int v111 = 4;
      int v112 = v3 % v111;
      int v113 = 4;
      int v114 = v0 + v113;
      int v115;
      v115 = v114;
      switch (v112) {
        default:
          {
          int v116 = 0;
          int v117 = 0;
          int v118;
          int v119;
          v118 = v116;
          v119 = v117;
          while (true) {
            int v120 = 4;
            int v121 = v3 % v120;
            int v122 = 1;
            int v123 = v121 + v122;
            bool v124 = v119 < v123;
            v118 = v118;
            v119 = v119;
            if (!v124) break;
            int v125 = 4;
            int v126 = 1;
            int v127 = v119 + v126;
            v118 = v125;
            v119 = v127;
          }
          int v128 = 1;
          v115 = v118;
        }
        case 0:
          {
          int v129 = 0;
          int v130 = 0;
          int v131;
          int v132;
          v131 = v129;
          v132 = v130;
          while (true) {
            int v133 = 4;
            int v134 = v3 % v133;
            int v135 = 1;
            int v136 = v134 + v135;
            bool v137 = v132 < v136;
            v131 = v131;
            v132 = v132;
            if (!v137) break;
            int v138 = 2;
            int v139 = 1;
            int v140 = v132 + v139;
            v131 = v138;
            v132 = v140;
          }
          int v141 = 1;
          v115 = v131;
          break;
        }
        case 1:
          {
          int v142 = 3;
          int v143;
          v143 = v142;
          switch (v3) {
            default:
              {
              int v144 = 1;
              int v145 = v0 + v144;
              v143 = v145;
              break;
            }
            case 0:
              {
              int v146 = 1;
              int v147 = v0 + v146;
              v143 = v147;
              break;
            }
          }
          int v148 = 4;
          int v149 = v0 + v148;
          v115 = v143;
        }
        case 2:
          {
          int v150 = 0;
          bool v151 = v2 != v150;
          int v152;
          if (v151) {
            int v153 = 4;
            int v154 = v0 + v153;
            v152 = v154;
          } else {
            int v155 = 0;
            int v156 = v0 + v155;
            v152 = v156;
          }
          v115 = v152;
          break;
        }
      }
      v24 = v115;
      break;
    }
  }
  bool v157 = true;
  int v158 = simt_wave_count_bits(v157);
  int v159 = 16;
  int v160 = v159 + v0;
  v1[v160] = v158;
  int v161 = 0;
  bool v162 = v2 != v161;
  int v163 = v162 ? v6 : v24;
  return;
}

kernel void kernel_main(device int* v164 [[buffer(0)]], device int* v165 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v166 = static_cast<int>(__simt_tid3.x);
  int v167 = 0;
  int v168 = v167 + v166;
  int v169 = v165[v168];
  int v170 = 4;
  int v171 = v170 + v166;
  int v172 = v165[v171];
  helper0(v166, v164, v169, v172, static_cast<int>(__simt_tid3.x));
  int v173 = 8;
  int v174 = v173 + v166;
  int v175 = v165[v174];
  int v176 = 1;
  int v177 = v166 + v176;
  int v178;
  v178 = v177;
  switch (v175) {
    default:
      {
      int v179 = 12;
      int v180 = v179 + v166;
      int v181 = v165[v180];
      int v182 = 0;
      bool v183 = v181 != v182;
      int v184;
      if (v183) {
        int v185 = 0;
        int v186 = 0;
        int v187;
        int v188;
        v187 = v185;
        v188 = v186;
        while (true) {
          int v189 = 4;
          int v190 = v188 * v189;
          int v191 = v190 + v166;
          int v192 = 16;
          int v193 = v192 + v191;
          int v194 = v165[v193];
          int v195 = 0;
          bool v196 = v194 != v195;
          v187 = v187;
          v188 = v188;
          if (!v196) break;
          int v197 = v187 + v188;
          int v198 = 1;
          int v199 = v188 + v198;
          v187 = v197;
          v188 = v199;
        }
        bool v200 = true;
        v184 = v187;
      } else {
        v184 = v166;
      }
      v178 = v184;
      break;
    }
    case 0:
      {
      int v201 = 36;
      int v202 = v201 + v166;
      int v203 = v165[v202];
      int v204 = 0;
      bool v205 = v203 != v204;
      int v206;
      if (v205) {
        int v207 = 40;
        int v208 = v207 + v166;
        int v209 = v165[v208];
        int v210 = 0;
        bool v211 = v209 != v210;
        int v212;
        if (v211) {
          int v213 = 0;
          v212 = v213;
        } else {
          int v214 = 4;
          v212 = v214;
        }
        v206 = v212;
      } else {
        int v215 = 44;
        int v216 = v215 + v166;
        int v217 = v165[v216];
        int v218 = 1;
        int v219 = v166 + v218;
        int v220;
        v220 = v219;
        switch (v217) {
          case 0:
            {
            int v221 = 1;
            int v222 = v166 + v221;
            v220 = v222;
            break;
          }
          case 1:
            {
            int v223 = 3;
            int v224 = v166 + v223;
            v220 = v224;
            break;
          }
          case 2:
            {
            int v225 = 0;
            int v226 = v166 + v225;
            v220 = v226;
            break;
          }
          default:
            {
            int v227 = 3;
            v220 = v227;
            break;
          }
        }
        bool v228 = true;
        v206 = v220;
      }
      v178 = v206;
      break;
    }
    case 1:
      {
      int v229 = 0;
      int v230 = 0;
      int v231;
      int v232;
      v231 = v229;
      v232 = v230;
      while (true) {
        int v233 = 4;
        int v234 = v232 * v233;
        int v235 = v234 + v166;
        int v236 = 48;
        int v237 = v236 + v235;
        int v238 = v165[v237];
        int v239 = 0;
        bool v240 = v238 != v239;
        v231 = v231;
        v232 = v232;
        if (!v240) break;
        int v241 = 0;
        int v242 = 0;
        int v243;
        int v244;
        v243 = v241;
        v244 = v242;
        while (true) {
          int v245 = 4;
          int v246 = v244 * v245;
          int v247 = v246 + v166;
          int v248 = 68;
          int v249 = v248 + v247;
          int v250 = v165[v249];
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
        }
        bool v256 = true;
        int v257 = v231 + v243;
        int v258 = 1;
        int v259 = v232 + v258;
        v231 = v257;
        v232 = v259;
      }
      bool v260 = true;
      v178 = v231;
      break;
    }
  }
  bool v261 = true;
  int v262 = 32;
  int v263 = v262 + v166;
  bool v264 = true;
  int v265 = simt_wave_count_bits(v264);
  v164[v263] = v265;
  int v266 = 88;
  int v267 = v266 + v166;
  int v268 = v165[v267];
  uint v269 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v270 = (int)(v269);
  int v271;
  v271 = v270;
  switch (v268) {
    default:
      {
      int v272 = 92;
      int v273 = v272 + v166;
      int v274 = v165[v273];
      int v275 = 0;
      int v276;
      v276 = v275;
      switch (v274) {
        case 0:
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
            int v283 = v282 + v166;
            int v284 = 96;
            int v285 = v284 + v283;
            int v286 = v165[v285];
            int v287 = 0;
            bool v288 = v286 != v287;
            v279 = v279;
            v280 = v280;
            if (!v288) break;
            int v289 = v279 + v280;
            int v290 = 1;
            int v291 = v280 + v290;
            v279 = v289;
            v280 = v291;
          }
          bool v292 = true;
          v276 = v279;
          break;
        }
        default:
          {
          v276 = v166;
          break;
        }
        case 1:
          {
          int v293 = 116;
          int v294 = v293 + v166;
          int v295 = v165[v294];
          int v296;
          v296 = v166;
          switch (v295) {
            default:
              {
              int v297 = 2;
              int v298 = v166 + v297;
              v296 = v298;
            }
            case 0:
              {
              v296 = v166;
              break;
            }
          }
          bool v299 = true;
          v276 = v296;
          break;
        }
      }
      bool v300 = true;
      v271 = v276;
      break;
    }
    case 0:
      {
      int v301 = 120;
      int v302 = v301 + v166;
      int v303 = v165[v302];
      int v304 = 0;
      int v305 = v166 + v304;
      int v306;
      v306 = v305;
      switch (v303) {
        default:
          {
          int v307 = 0;
          int v308 = 0;
          int v309;
          int v310;
          v309 = v307;
          v310 = v308;
          while (true) {
            int v311 = 4;
            int v312 = v310 * v311;
            int v313 = v312 + v166;
            int v314 = 124;
            int v315 = v314 + v313;
            int v316 = v165[v315];
            int v317 = 0;
            bool v318 = v316 != v317;
            v309 = v309;
            v310 = v310;
            if (!v318) break;
            int v319 = v309 + v310;
            int v320 = 1;
            int v321 = v310 + v320;
            v309 = v319;
            v310 = v321;
          }
          bool v322 = true;
          v306 = v309;
          break;
        }
        case 0:
          {
          int v323 = 144;
          int v324 = v323 + v166;
          int v325 = v165[v324];
          int v326 = 1;
          int v327 = v166 + v326;
          int v328;
          v328 = v327;
          switch (v325) {
            default:
              {
              int v329 = 1;
              int v330 = v166 + v329;
              v328 = v330;
              break;
            }
            case 0:
              {
              int v331 = 3;
              int v332 = v166 + v331;
              v328 = v332;
            }
            case 1:
              {
              int v333 = 4;
              v328 = v333;
              break;
            }
          }
          bool v334 = true;
          v306 = v328;
          break;
        }
        case 1:
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
            int v341 = v340 + v166;
            int v342 = 148;
            int v343 = v342 + v341;
            int v344 = v165[v343];
            int v345 = 0;
            bool v346 = v344 != v345;
            v337 = v337;
            v338 = v338;
            if (!v346) break;
            int v347 = v337 + v338;
            int v348 = 1;
            int v349 = v338 + v348;
            v337 = v347;
            v338 = v349;
          }
          bool v350 = true;
          v306 = v337;
          break;
        }
      }
      bool v351 = true;
      v271 = v306;
      break;
    }
    case 1:
      {
      int v352 = 4;
      int v353 = v166 + v352;
      v271 = v353;
      break;
    }
  }
  bool v354 = true;
  int v355 = 48;
  int v356 = v355 + v166;
  bool v357 = true;
  int v358 = simt_wave_count_bits(v357);
  v164[v356] = v358;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 168; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
