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
  int v6;
  v6 = v0;
  switch (v5) {
    case 0:
      {
      int v7 = 3;
      v6 = v7;
      break;
    }
    default:
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
        int v17 = 3;
        int v18 = v3 % v17;
        int v19 = 2;
        int v20 = v0 + v19;
        int v21;
        v21 = v20;
        switch (v18) {
          case 0:
            {
            int v22 = 4;
            int v23 = v0 + v22;
            v21 = v23;
            break;
          }
          default:
            {
            int v24 = 1;
            int v25 = v0 + v24;
            v21 = v25;
            break;
          }
          case 1:
            {
            int v26 = 2;
            v21 = v26;
            break;
          }
        }
        int v27 = 1;
        int v28 = v0 + v27;
        int v29 = 1;
        int v30 = v11 + v29;
        v10 = v21;
        v11 = v30;
      }
      int v31 = 0;
      v6 = v10;
      break;
    }
    case 1:
      {
      int v32 = 0;
      bool v33 = v2 != v32;
      int v34;
      if (v33) {
        int v35 = 0;
        int v36 = 0;
        int v37;
        int v38;
        v37 = v35;
        v38 = v36;
        while (true) {
          int v39 = 4;
          int v40 = v3 % v39;
          int v41 = 1;
          int v42 = v40 + v41;
          bool v43 = v38 < v42;
          v37 = v37;
          v38 = v38;
          if (!v43) break;
          int v44 = 2;
          int v45 = v0 + v44;
          int v46 = 1;
          int v47 = v38 + v46;
          v37 = v45;
          v38 = v47;
          continue;
          ;
        }
        int v48 = 4;
        int v49 = v0 + v48;
        v34 = v37;
      } else {
        int v50 = 0;
        bool v51 = v2 != v50;
        int v52;
        if (v51) {
          v52 = v0;
        } else {
          v52 = v0;
        }
        v34 = v52;
      }
      v6 = v34;
      break;
    }
  }
  bool v53 = true;
  int v54 = simt_wave_count_bits(v53);
  int v55 = 0;
  int v56 = v55 + v0;
  v1[v56] = v54;
  return;
}

kernel void kernel_main(device int* v57 [[buffer(0)]], device int* v58 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v59 = static_cast<int>(__simt_tid3.x);
  int v60 = 0;
  int v61 = v60 + v59;
  int v62 = v58[v61];
  int v63 = 4;
  int v64 = v63 + v59;
  int v65 = v58[v64];
  helper0(v59, v57, v62, v65, static_cast<int>(__simt_tid3.x));
  int v66 = 8;
  int v67 = v66 + v59;
  int v68 = v58[v67];
  int v69 = 2;
  int v70;
  v70 = v69;
  switch (v68) {
    case 0:
      {
      v70 = v59;
      break;
    }
    default:
      {
      int v71 = 12;
      int v72 = v71 + v59;
      int v73 = v58[v72];
      int v74 = 0;
      int v75 = v59 + v74;
      int v76;
      v76 = v75;
      switch (v73) {
        case 0:
          {
          int v77 = 16;
          int v78 = v77 + v59;
          int v79 = v58[v78];
          int v80 = 0;
          bool v81 = v79 != v80;
          int v82;
          if (v81) {
            int v83 = 1;
            int v84 = v59 + v83;
            v82 = v84;
          } else {
            int v85 = 4;
            v82 = v85;
          }
          v76 = v82;
          break;
        }
        case 1:
          {
          int v86 = 20;
          int v87 = v86 + v59;
          int v88 = v58[v87];
          int v89 = 0;
          bool v90 = v88 != v89;
          int v91;
          if (v90) {
            v91 = v59;
          } else {
            v91 = v59;
          }
          v76 = v91;
          break;
        }
        default:
          {
          v76 = v59;
          break;
        }
      }
      bool v92 = true;
      v70 = v76;
      break;
    }
    case 1:
      {
      int v93 = 24;
      int v94 = v93 + v59;
      int v95 = v58[v94];
      int v96 = 0;
      bool v97 = v95 != v96;
      int v98;
      if (v97) {
        int v99 = 28;
        int v100 = v99 + v59;
        int v101 = v58[v100];
        int v102 = 1;
        int v103;
        v103 = v102;
        switch (v101) {
          case 0:
            {
            int v104 = 0;
            v103 = v104;
            break;
          }
          default:
            {
            int v105 = 3;
            v103 = v105;
            break;
          }
          case 1:
            {
            int v106 = 2;
            v103 = v106;
            break;
          }
        }
        bool v107 = true;
        v98 = v103;
      } else {
        int v108 = 32;
        int v109 = v108 + v59;
        int v110 = v58[v109];
        int v111 = 0;
        bool v112 = v110 != v111;
        int v113;
        if (v112) {
          int v114 = 3;
          v113 = v114;
        } else {
          v113 = v59;
        }
        v98 = v113;
      }
      v70 = v98;
      break;
    }
  }
  bool v115 = true;
  int v116 = 16;
  int v117 = v116 + v59;
  bool v118 = true;
  int v119 = simt_wave_count_bits(v118);
  v57[v117] = v119;
  int v120 = 36;
  int v121 = v120 + v59;
  int v122 = v58[v121];
  int v123 = 4;
  int v124;
  v124 = v123;
  switch (v122) {
    case 0:
      {
      int v125 = 40;
      int v126 = v125 + v59;
      int v127 = v58[v126];
      int v128;
      v128 = v59;
      switch (v127) {
        default:
          {
          int v129 = 44;
          int v130 = v129 + v59;
          int v131 = v58[v130];
          int v132 = 0;
          bool v133 = v131 != v132;
          int v134;
          if (v133) {
            int v135 = 4;
            int v136 = v59 + v135;
            v134 = v136;
          } else {
            int v137 = 3;
            v134 = v137;
          }
          v128 = v134;
          break;
        }
        case 0:
          {
          int v138 = 48;
          int v139 = v138 + v59;
          int v140 = v58[v139];
          int v141 = 0;
          bool v142 = v140 != v141;
          int v143;
          if (v142) {
            int v144 = 3;
            int v145 = v59 + v144;
            v143 = v145;
          } else {
            int v146 = 0;
            int v147 = v59 + v146;
            v143 = v147;
          }
          v128 = v143;
          break;
        }
        case 1:
          {
          int v148 = 0;
          int v149 = 0;
          int v150;
          int v151;
          v150 = v148;
          v151 = v149;
          while (true) {
            int v152 = 4;
            int v153 = v151 * v152;
            int v154 = v153 + v59;
            int v155 = 52;
            int v156 = v155 + v154;
            int v157 = v58[v156];
            int v158 = 0;
            bool v159 = v157 != v158;
            v150 = v150;
            v151 = v151;
            if (!v159) break;
            int v160 = v150 + v151;
            int v161 = 1;
            int v162 = v151 + v161;
            v150 = v160;
            v151 = v162;
            break;
            ;
          }
          bool v163 = true;
          v128 = v150;
          break;
        }
      }
      bool v164 = true;
      v124 = v128;
      break;
    }
    default:
      {
      int v165 = 72;
      int v166 = v165 + v59;
      int v167 = v58[v166];
      int v168;
      v168 = v59;
      switch (v167) {
        default:
          {
          int v169 = 0;
          int v170 = 0;
          int v171;
          int v172;
          v171 = v169;
          v172 = v170;
          while (true) {
            int v173 = 4;
            int v174 = v172 * v173;
            int v175 = v174 + v59;
            int v176 = 76;
            int v177 = v176 + v175;
            int v178 = v58[v177];
            int v179 = 0;
            bool v180 = v178 != v179;
            v171 = v171;
            v172 = v172;
            if (!v180) break;
            int v181 = v171 + v172;
            int v182 = 1;
            int v183 = v172 + v182;
            v171 = v181;
            v172 = v183;
            break;
            ;
          }
          bool v184 = true;
          v168 = v171;
          break;
        }
        case 0:
          {
          int v185 = 96;
          int v186 = v185 + v59;
          int v187 = v58[v186];
          int v188 = 4;
          int v189;
          v189 = v188;
          switch (v187) {
            case 0:
              {
              v189 = v59;
              break;
            }
            case 1:
              {
              int v190 = 3;
              int v191 = v59 + v190;
              v189 = v191;
              break;
            }
            default:
              {
              int v192 = 4;
              v189 = v192;
              break;
            }
          }
          bool v193 = true;
          v168 = v189;
        }
        case 1:
          {
          int v194 = 1;
          v168 = v194;
        }
        case 2:
          {
          int v195 = 100;
          int v196 = v195 + v59;
          int v197 = v58[v196];
          int v198 = 0;
          bool v199 = v197 != v198;
          int v200;
          if (v199) {
            int v201 = 4;
            v200 = v201;
          } else {
            v200 = v59;
          }
          v168 = v200;
          break;
        }
      }
      bool v202 = true;
      v124 = v168;
      break;
    }
    case 1:
      {
      int v203 = 0;
      int v204 = 0;
      int v205;
      int v206;
      v205 = v203;
      v206 = v204;
      while (true) {
        int v207 = 4;
        int v208 = v206 * v207;
        int v209 = v208 + v59;
        int v210 = 104;
        int v211 = v210 + v209;
        int v212 = v58[v211];
        int v213 = 0;
        bool v214 = v212 != v213;
        v205 = v205;
        v206 = v206;
        if (!v214) break;
        int v215 = v205 + v206;
        int v216 = 1;
        int v217 = v206 + v216;
        v205 = v215;
        v206 = v217;
      }
      bool v218 = true;
      v124 = v205;
      break;
    }
    case 2:
      {
      int v219 = 124;
      int v220 = v219 + v59;
      int v221 = v58[v220];
      int v222 = 2;
      int v223 = v59 + v222;
      int v224;
      v224 = v223;
      switch (v221) {
        default:
          {
          int v225 = 128;
          int v226 = v225 + v59;
          int v227 = v58[v226];
          int v228 = 0;
          bool v229 = v227 != v228;
          int v230;
          if (v229) {
            int v231 = 3;
            v230 = v231;
          } else {
            int v232 = 0;
            int v233 = v59 + v232;
            v230 = v233;
          }
          v224 = v230;
          break;
        }
        case 0:
          {
          int v234 = 0;
          v224 = v234;
          break;
        }
        case 1:
          {
          int v235 = 1;
          v224 = v235;
          break;
        }
        case 2:
          {
          int v236 = 132;
          int v237 = v236 + v59;
          int v238 = v58[v237];
          int v239 = 0;
          bool v240 = v238 != v239;
          int v241;
          if (v240) {
            int v242 = 3;
            int v243 = v59 + v242;
            v241 = v243;
          } else {
            int v244 = 2;
            int v245 = v59 + v244;
            v241 = v245;
          }
          v224 = v241;
          break;
        }
      }
      bool v246 = true;
      v124 = v224;
      break;
    }
  }
  bool v247 = true;
  int v248 = 32;
  int v249 = v248 + v59;
  bool v250 = true;
  int v251 = simt_wave_count_bits(v250);
  v57[v249] = v251;
  int v252 = 136;
  int v253 = v252 + v59;
  int v254 = v58[v253];
  uint v255 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v256 = (int)(v255);
  int v257;
  v257 = v256;
  switch (v254) {
    default:
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
        int v264 = v263 + v59;
        int v265 = 140;
        int v266 = v265 + v264;
        int v267 = v58[v266];
        int v268 = 0;
        bool v269 = v267 != v268;
        v260 = v260;
        v261 = v261;
        if (!v269) break;
        int v270 = v260 + v261;
        int v271 = 1;
        int v272 = v261 + v271;
        v260 = v270;
        v261 = v272;
      }
      bool v273 = true;
      v257 = v260;
      break;
    }
    case 0:
      {
      int v274 = 0;
      int v275 = 0;
      int v276;
      int v277;
      v276 = v274;
      v277 = v275;
      while (true) {
        int v278 = 4;
        int v279 = v277 * v278;
        int v280 = v279 + v59;
        int v281 = 160;
        int v282 = v281 + v280;
        int v283 = v58[v282];
        int v284 = 0;
        bool v285 = v283 != v284;
        v276 = v276;
        v277 = v277;
        if (!v285) break;
        int v286 = 4;
        int v287 = v276 + v286;
        int v288 = 1;
        int v289 = v277 + v288;
        v276 = v287;
        v277 = v289;
        continue;
        ;
      }
      bool v290 = true;
      v257 = v276;
    }
    case 1:
      {
      int v291 = 180;
      int v292 = v291 + v59;
      int v293 = v58[v292];
      int v294 = 0;
      bool v295 = v293 != v294;
      int v296;
      if (v295) {
        int v297 = 184;
        int v298 = v297 + v59;
        int v299 = v58[v298];
        int v300;
        v300 = v59;
        switch (v299) {
          case 0:
            {
            int v301 = 0;
            int v302 = v59 + v301;
            v300 = v302;
          }
          default:
            {
            int v303 = 2;
            v300 = v303;
            break;
          }
        }
        bool v304 = true;
        v296 = v300;
      } else {
        int v305 = 0;
        int v306 = 0;
        int v307;
        int v308;
        v307 = v305;
        v308 = v306;
        while (true) {
          int v309 = 4;
          int v310 = v308 * v309;
          int v311 = v310 + v59;
          int v312 = 188;
          int v313 = v312 + v311;
          int v314 = v58[v313];
          int v315 = 0;
          bool v316 = v314 != v315;
          v307 = v307;
          v308 = v308;
          if (!v316) break;
          int v317 = v307 + v308;
          int v318 = 1;
          int v319 = v308 + v318;
          v307 = v317;
          v308 = v319;
          break;
          ;
        }
        bool v320 = true;
        v296 = v307;
      }
      v257 = v296;
      break;
    }
    case 2:
      {
      int v321 = 208;
      int v322 = v321 + v59;
      int v323 = v58[v322];
      int v324;
      v324 = v59;
      switch (v323) {
        case 0:
          {
          int v325 = 212;
          int v326 = v325 + v59;
          int v327 = v58[v326];
          int v328 = 0;
          bool v329 = v327 != v328;
          int v330;
          if (v329) {
            int v331 = 1;
            int v332 = v59 + v331;
            v330 = v332;
          } else {
            v330 = v59;
          }
          v324 = v330;
          break;
        }
        default:
          {
          int v333 = 216;
          int v334 = v333 + v59;
          int v335 = v58[v334];
          int v336 = 1;
          int v337;
          v337 = v336;
          switch (v335) {
            case 0:
              {
              v337 = v59;
              break;
            }
            case 1:
              {
              int v338 = 1;
              v337 = v338;
            }
            case 2:
              {
              int v339 = 0;
              v337 = v339;
            }
            default:
              {
              int v340 = 0;
              v337 = v340;
              break;
            }
          }
          bool v341 = true;
          v324 = v337;
          break;
        }
      }
      bool v342 = true;
      v257 = v324;
      break;
    }
  }
  bool v343 = true;
  int v344 = 48;
  int v345 = v344 + v59;
  bool v346 = true;
  int v347 = simt_wave_count_bits(v346);
  v57[v345] = v347;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 220; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
