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
  bool v9 = v2 != v8;
  int v10;
  if (v9) {
    bool v11 = true;
    int v12 = simt_wave_count_bits(v11);
    int v13 = 16;
    int v14 = v13 + v0;
    v1[v14] = v12;
    v10 = v12;
  } else {
    int v15 = 0;
    int v16 = 0;
    int v17;
    int v18;
    v17 = v15;
    v18 = v16;
    while (true) {
      int v19 = 4;
      int v20 = v3 % v19;
      int v21 = 1;
      int v22 = v20 + v21;
      bool v23 = v18 < v22;
      v17 = v17;
      v18 = v18;
      if (!v23) break;
      int v24 = 4;
      int v25 = v3 % v24;
      int v26 = 2;
      int v27 = v0 + v26;
      int v28;
      v28 = v27;
      switch (v25) {
        case 0:
          {
          int v29 = 3;
          int v30 = v0 + v29;
          v28 = v30;
        }
        case 1:
          {
          int v31 = 2;
          v28 = v31;
          break;
        }
        case 2:
          {
          v28 = v0;
        }
        default:
          {
          int v32 = 0;
          v28 = v32;
          break;
        }
      }
      int v33 = 1;
      int v34 = v18 + v33;
      v17 = v28;
      v18 = v34;
    }
    v10 = v17;
  }
  int v35 = 0;
  bool v36 = v2 != v35;
  int v37 = v36 ? v5 : v10;
  return;
}

kernel void kernel_main(device int* v38 [[buffer(0)]], device int* v39 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v40 = static_cast<int>(__simt_tid3.x);
  int v41 = 0;
  int v42 = v41 + v40;
  int v43 = v39[v42];
  int v44 = 4;
  int v45 = v44 + v40;
  int v46 = v39[v45];
  int v47 = 0;
  bool v48 = v43 != v47;
  if (v48) {
    int v49 = 8;
    int v50 = v49 + v40;
    int v51 = v39[v50];
    int v52 = 0;
    bool v53 = v51 != v52;
    if (v53) {
      int v54 = 3;
      int v55 = v40 + v54;
      int v56;
      v56 = v55;
      switch (v40) {
        default:
          {
          int v57 = 4;
          int v58 = v56 + v57;
          v56 = v58;
          break;
        }
        case 0:
          {
          int v59 = 0;
          int v60 = v56 + v59;
          v56 = v60;
          break;
        }
      }
      helper0(v40, v38, v43, v46, static_cast<int>(__simt_tid3.x));
    } else {
    }
  } else {
  }
  int v61 = 12;
  int v62 = v61 + v40;
  int v63 = v39[v62];
  int v64 = 4;
  int v65;
  v65 = v64;
  switch (v63) {
    case 0:
      {
      int v66 = 0;
      int v67 = 0;
      int v68;
      int v69;
      v68 = v66;
      v69 = v67;
      while (true) {
        int v70 = 4;
        int v71 = v69 * v70;
        int v72 = v71 + v40;
        int v73 = 16;
        int v74 = v73 + v72;
        int v75 = v39[v74];
        int v76 = 0;
        bool v77 = v75 != v76;
        v68 = v68;
        v69 = v69;
        if (!v77) break;
        int v78 = 0;
        int v79 = 0;
        int v80;
        int v81;
        v80 = v78;
        v81 = v79;
        while (true) {
          int v82 = 4;
          int v83 = v81 * v82;
          int v84 = v83 + v40;
          int v85 = 36;
          int v86 = v85 + v84;
          int v87 = v39[v86];
          int v88 = 0;
          bool v89 = v87 != v88;
          v80 = v80;
          v81 = v81;
          if (!v89) break;
          int v90 = v80 + v81;
          int v91 = 1;
          int v92 = v81 + v91;
          bool v93 = true;
          v80 = v90;
          v81 = v92;
        }
        int v94 = v68 + v80;
        int v95 = 1;
        int v96 = v69 + v95;
        bool v97 = true;
        v68 = v94;
        v69 = v96;
      }
      v65 = v68;
      break;
    }
    case 1:
      {
      int v98 = 56;
      int v99 = v98 + v40;
      int v100 = v39[v99];
      int v101 = 0;
      bool v102 = v100 != v101;
      int v103;
      if (v102) {
        int v104 = 60;
        int v105 = v104 + v40;
        int v106 = v39[v105];
        int v107;
        v107 = v40;
        switch (v106) {
          case 0:
            {
            int v108 = 0;
            v107 = v108;
            break;
          }
          default:
            {
            int v109 = 1;
            v107 = v109;
            break;
          }
          case 1:
            {
            int v110 = 2;
            int v111 = v40 + v110;
            v107 = v111;
            break;
          }
        }
        v103 = v107;
      } else {
        int v112 = 0;
        int v113 = 0;
        int v114;
        int v115;
        v114 = v112;
        v115 = v113;
        while (true) {
          int v116 = 4;
          int v117 = v115 * v116;
          int v118 = v117 + v40;
          int v119 = 64;
          int v120 = v119 + v118;
          int v121 = v39[v120];
          int v122 = 0;
          bool v123 = v121 != v122;
          v114 = v114;
          v115 = v115;
          if (!v123) break;
          int v124 = v114 + v115;
          int v125 = 1;
          int v126 = v115 + v125;
          bool v127 = true;
          v114 = v124;
          v115 = v126;
        }
        v103 = v114;
      }
      v65 = v103;
      break;
    }
    default:
      {
      int v128 = 2;
      int v129 = v40 + v128;
      v65 = v129;
      break;
    }
    case 2:
      {
      int v130 = 84;
      int v131 = v130 + v40;
      int v132 = v39[v131];
      int v133;
      v133 = v40;
      switch (v132) {
        case 0:
          {
          int v134 = 0;
          int v135 = 0;
          int v136;
          int v137;
          v136 = v134;
          v137 = v135;
          while (true) {
            int v138 = 4;
            int v139 = v137 * v138;
            int v140 = v139 + v40;
            int v141 = 88;
            int v142 = v141 + v140;
            int v143 = v39[v142];
            int v144 = 0;
            bool v145 = v143 != v144;
            v136 = v136;
            v137 = v137;
            if (!v145) break;
            int v146 = v136 + v137;
            int v147 = 1;
            int v148 = v137 + v147;
            bool v149 = true;
            v136 = v146;
            v137 = v148;
          }
          v133 = v136;
        }
        default:
          {
          int v150 = 108;
          int v151 = v150 + v40;
          int v152 = v39[v151];
          int v153 = 3;
          int v154;
          v154 = v153;
          switch (v152) {
            case 0:
              {
              int v155 = 1;
              int v156 = v40 + v155;
              v154 = v156;
              break;
            }
            default:
              {
              int v157 = 1;
              v154 = v157;
              break;
            }
          }
          v133 = v154;
          break;
        }
        case 1:
          {
          int v158 = 112;
          int v159 = v158 + v40;
          int v160 = v39[v159];
          int v161;
          v161 = v40;
          switch (v160) {
            default:
              {
              int v162 = 2;
              v161 = v162;
              break;
            }
            case 0:
              {
              int v163 = 1;
              v161 = v163;
              break;
            }
            case 1:
              {
              int v164 = 2;
              int v165 = v40 + v164;
              v161 = v165;
              break;
            }
          }
          bool v166 = true;
          v133 = v161;
          break;
        }
      }
      bool v167 = true;
      v65 = v133;
      break;
    }
  }
  bool v168 = true;
  int v169 = 32;
  int v170 = v169 + v40;
  bool v171 = true;
  int v172 = simt_wave_count_bits(v171);
  v38[v170] = v172;
  int v173 = 116;
  int v174 = v173 + v40;
  int v175 = v39[v174];
  int v176 = 1;
  int v177 = v40 + v176;
  int v178;
  v178 = v177;
  switch (v175) {
    case 0:
      {
      int v179 = 0;
      int v180 = 0;
      int v181;
      int v182;
      v181 = v179;
      v182 = v180;
      while (true) {
        int v183 = 4;
        int v184 = v182 * v183;
        int v185 = v184 + v40;
        int v186 = 120;
        int v187 = v186 + v185;
        int v188 = v39[v187];
        int v189 = 0;
        bool v190 = v188 != v189;
        v181 = v181;
        v182 = v182;
        if (!v190) break;
        int v191 = v181 + v182;
        int v192 = 1;
        int v193 = v182 + v192;
        bool v194 = true;
        v181 = v191;
        v182 = v193;
      }
      v178 = v181;
      break;
    }
    case 1:
      {
      int v195 = 140;
      int v196 = v195 + v40;
      int v197 = v39[v196];
      int v198 = 1;
      int v199;
      v199 = v198;
      switch (v197) {
        case 0:
          {
          int v200 = 144;
          int v201 = v200 + v40;
          int v202 = v39[v201];
          int v203 = 0;
          bool v204 = v202 != v203;
          int v205;
          if (v204) {
            int v206 = 3;
            int v207 = v40 + v206;
            v205 = v207;
          } else {
            v205 = v40;
          }
          v199 = v205;
          break;
        }
        default:
          {
          int v208 = 4;
          v199 = v208;
          break;
        }
      }
      v178 = v199;
      break;
    }
    case 2:
      {
      int v209 = 148;
      int v210 = v209 + v40;
      int v211 = v39[v210];
      int v212 = 4;
      int v213 = v40 + v212;
      int v214;
      v214 = v213;
      switch (v211) {
        case 0:
          {
          int v215 = 152;
          int v216 = v215 + v40;
          int v217 = v39[v216];
          int v218 = 3;
          int v219 = v40 + v218;
          int v220;
          v220 = v219;
          switch (v217) {
            default:
              {
              v220 = v40;
            }
            case 0:
              {
              v220 = v40;
              break;
            }
            case 1:
              {
              v220 = v40;
              break;
            }
            case 2:
              {
              int v221 = 4;
              int v222 = v40 + v221;
              v220 = v222;
              break;
            }
          }
          v214 = v220;
          break;
        }
        case 1:
          {
          int v223 = 4;
          v214 = v223;
          break;
        }
        default:
          {
          int v224 = 156;
          int v225 = v224 + v40;
          int v226 = v39[v225];
          int v227 = 3;
          int v228;
          v228 = v227;
          switch (v226) {
            default:
              {
              int v229 = 2;
              v228 = v229;
              break;
            }
            case 0:
              {
              int v230 = 3;
              v228 = v230;
              break;
            }
          }
          bool v231 = true;
          v214 = v228;
          break;
        }
        case 2:
          {
          int v232 = 160;
          int v233 = v232 + v40;
          int v234 = v39[v233];
          int v235 = 0;
          int v236 = v40 + v235;
          int v237;
          v237 = v236;
          switch (v234) {
            case 0:
              {
              int v238 = 4;
              v237 = v238;
              break;
            }
            case 1:
              {
              v237 = v40;
              break;
            }
            default:
              {
              int v239 = 3;
              int v240 = v40 + v239;
              v237 = v240;
              break;
            }
            case 2:
              {
              int v241 = 1;
              v237 = v241;
              break;
            }
          }
          v214 = v237;
          break;
        }
      }
      v178 = v214;
      break;
    }
    default:
      {
      int v242 = 164;
      int v243 = v242 + v40;
      int v244 = v39[v243];
      int v245 = 1;
      int v246 = v40 + v245;
      int v247;
      v247 = v246;
      switch (v244) {
        default:
          {
          int v248 = 3;
          int v249 = v40 + v248;
          v247 = v249;
          break;
        }
        case 0:
          {
          int v250 = 168;
          int v251 = v250 + v40;
          int v252 = v39[v251];
          int v253 = 0;
          bool v254 = v252 != v253;
          int v255;
          if (v254) {
            v255 = v40;
          } else {
            v255 = v40;
          }
          v247 = v255;
          break;
        }
      }
      v178 = v247;
      break;
    }
  }
  int v256 = 172;
  int v257 = v256 + v40;
  int v258 = v39[v257];
  uint v259 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v260 = (int)(v259);
  int v261;
  v261 = v260;
  switch (v258) {
    case 0:
      {
      v261 = v40;
    }
    case 1:
      {
      int v262 = 176;
      int v263 = v262 + v40;
      int v264 = v39[v263];
      int v265 = 1;
      int v266 = v40 + v265;
      int v267;
      v267 = v266;
      switch (v264) {
        case 0:
          {
          int v268 = 180;
          int v269 = v268 + v40;
          int v270 = v39[v269];
          int v271;
          v271 = v40;
          switch (v270) {
            case 0:
              {
              v271 = v40;
              break;
            }
            default:
              {
              int v272 = 1;
              v271 = v272;
              break;
            }
            case 1:
              {
              int v273 = 0;
              v271 = v273;
              break;
            }
          }
          bool v274 = true;
          v267 = v271;
          break;
        }
        case 1:
          {
          int v275 = 184;
          int v276 = v275 + v40;
          int v277 = v39[v276];
          int v278;
          v278 = v40;
          switch (v277) {
            case 0:
              {
              int v279 = 3;
              v278 = v279;
            }
            default:
              {
              int v280 = 1;
              v278 = v280;
            }
            case 1:
              {
              int v281 = 0;
              v278 = v281;
            }
            case 2:
              {
              int v282 = 3;
              v278 = v282;
              break;
            }
          }
          bool v283 = true;
          v267 = v278;
          break;
        }
        default:
          {
          int v284 = 188;
          int v285 = v284 + v40;
          int v286 = v39[v285];
          int v287 = 0;
          bool v288 = v286 != v287;
          int v289;
          if (v288) {
            v289 = v40;
          } else {
            int v290 = 4;
            int v291 = v40 + v290;
            v289 = v291;
          }
          v267 = v289;
          break;
        }
        case 2:
          {
          int v292 = 192;
          int v293 = v292 + v40;
          int v294 = v39[v293];
          int v295 = 0;
          bool v296 = v294 != v295;
          int v297;
          if (v296) {
            int v298 = 0;
            v297 = v298;
          } else {
            int v299 = 0;
            int v300 = v40 + v299;
            v297 = v300;
          }
          v267 = v297;
          break;
        }
      }
      v261 = v267;
    }
    case 2:
      {
      int v301 = 0;
      int v302 = 0;
      int v303;
      int v304;
      v303 = v301;
      v304 = v302;
      while (true) {
        int v305 = 4;
        int v306 = v304 * v305;
        int v307 = v306 + v40;
        int v308 = 196;
        int v309 = v308 + v307;
        int v310 = v39[v309];
        int v311 = 0;
        bool v312 = v310 != v311;
        v303 = v303;
        v304 = v304;
        if (!v312) break;
        int v313 = 216;
        int v314 = v313 + v40;
        int v315 = v39[v314];
        int v316 = 3;
        int v317 = v40 + v316;
        int v318;
        v318 = v317;
        switch (v315) {
          case 0:
            {
            v318 = v40;
            break;
          }
          default:
            {
            int v319 = 4;
            v318 = v319;
            break;
          }
        }
        int v320 = v303 + v318;
        int v321 = 1;
        int v322 = v304 + v321;
        bool v323 = true;
        v303 = v320;
        v304 = v322;
      }
      v261 = v303;
      break;
    }
    default:
      {
      int v324 = 0;
      int v325 = 0;
      int v326;
      int v327;
      v326 = v324;
      v327 = v325;
      while (true) {
        int v328 = 4;
        int v329 = v327 * v328;
        int v330 = v329 + v40;
        int v331 = 220;
        int v332 = v331 + v330;
        int v333 = v39[v332];
        int v334 = 0;
        bool v335 = v333 != v334;
        v326 = v326;
        v327 = v327;
        if (!v335) break;
        int v336 = v326 + v327;
        int v337 = 1;
        int v338 = v327 + v337;
        bool v339 = true;
        v326 = v336;
        v327 = v338;
      }
      v261 = v326;
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 240; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
