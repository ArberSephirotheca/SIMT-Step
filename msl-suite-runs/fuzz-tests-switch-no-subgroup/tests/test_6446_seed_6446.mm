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
  int v4 = 2;
  int v5 = v3 % v4;
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 0;
      bool v10 = v2 != v9;
      int v11;
      if (v10) {
        int v12 = 0;
        bool v13 = v2 != v12;
        int v14;
        if (v13) {
          int v15 = 2;
          int v16 = v0 + v15;
          v14 = v16;
        } else {
          int v17 = 3;
          int v18 = v0 + v17;
          v14 = v18;
        }
        v11 = v14;
      } else {
        int v19 = 2;
        int v20 = v3 % v19;
        int v21 = 2;
        int v22 = v0 + v21;
        int v23;
        v23 = v22;
        switch (v20) {
          case 0:
            {
            int v24 = 3;
            v23 = v24;
          }
          case 1:
            {
            v23 = v0;
            break;
          }
          default:
            {
            int v25 = 2;
            int v26 = v0 + v25;
            v23 = v26;
            break;
          }
        }
        int v27 = 0;
        int v28 = v0 + v27;
        v11 = v23;
      }
      v8 = v11;
    }
    case 0:
      {
      int v29 = 2;
      int v30 = v3 % v29;
      int v31;
      v31 = v0;
      switch (v30) {
        default:
          {
          v31 = v0;
          break;
        }
        case 0:
          {
          int v32 = 0;
          int v33 = 0;
          int v34;
          int v35;
          v34 = v32;
          v35 = v33;
          while (true) {
            int v36 = 4;
            int v37 = v3 % v36;
            int v38 = 1;
            int v39 = v37 + v38;
            bool v40 = v35 < v39;
            v34 = v34;
            v35 = v35;
            if (!v40) break;
            int v41 = 3;
            int v42 = v0 + v41;
            int v43 = 1;
            int v44 = v35 + v43;
            v34 = v42;
            v35 = v44;
          }
          v31 = v34;
          break;
        }
        case 1:
          {
          int v45 = 0;
          int v46 = 0;
          int v47;
          int v48;
          v47 = v45;
          v48 = v46;
          while (true) {
            int v49 = 4;
            int v50 = v3 % v49;
            int v51 = 1;
            int v52 = v50 + v51;
            bool v53 = v48 < v52;
            v47 = v47;
            v48 = v48;
            if (!v53) break;
            int v54 = 3;
            int v55 = 1;
            int v56 = v48 + v55;
            v47 = v54;
            v48 = v56;
          }
          v31 = v47;
          break;
        }
      }
      v8 = v31;
      break;
    }
    case 1:
      {
      int v57 = 2;
      int v58 = v3 % v57;
      int v59;
      v59 = v0;
      switch (v58) {
        case 0:
          {
          int v60 = 0;
          bool v61 = v2 != v60;
          int v62;
          if (v61) {
            int v63 = 3;
            int v64 = v0 + v63;
            v62 = v64;
          } else {
            v62 = v0;
          }
          v59 = v62;
          break;
        }
        default:
          {
          int v65 = 2;
          int v66 = v3 % v65;
          int v67;
          v67 = v0;
          switch (v66) {
            default:
              {
              v67 = v0;
              break;
            }
            case 0:
              {
              v67 = v0;
              break;
            }
          }
          v59 = v67;
          break;
        }
        case 1:
          {
          int v68 = 2;
          int v69 = v0 + v68;
          v59 = v69;
          break;
        }
      }
      v8 = v59;
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
  int v83 = 0;
  bool v84 = v79 != v83;
  if (v84) {
    int v85 = 0;
    int v86 = 0;
    int v87;
    int v88;
    v87 = v85;
    v88 = v86;
    while (true) {
      int v89 = 2;
      bool v90 = v88 < v89;
      v87 = v87;
      v88 = v88;
      if (!v90) break;
      int v91 = 4;
      int v92 = v76 % v91;
      uint v93 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v94 = (int)(v93);
      int v95;
      v95 = v94;
      switch (v92) {
        default:
          {
          int v96 = 0;
          int v97 = v95 + v96;
          v95 = v97;
          break;
        }
        case 0:
          {
          int v98 = 1;
          int v99 = v95 + v98;
          v95 = v99;
          break;
        }
        case 1:
          {
          int v100 = 1;
          int v101 = v95 + v100;
          v95 = v101;
          break;
        }
        case 2:
          {
          int v102 = 0;
          int v103 = v95 + v102;
          v95 = v103;
          break;
        }
      }
      helper0(v76, v74, v79, v82, static_cast<int>(__simt_tid3.x));
      int v104 = 1;
      int v105 = v88 + v104;
      v87 = v87;
      v88 = v105;
    }
  } else {
  }
  int v106 = 8;
  int v107 = v106 + v76;
  int v108 = v75[v107];
  uint v109 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v110 = (int)(v109);
  int v111;
  v111 = v110;
  switch (v108) {
    default:
      {
      int v112 = 0;
      int v113 = 0;
      int v114;
      int v115;
      v114 = v112;
      v115 = v113;
      while (true) {
        int v116 = 4;
        int v117 = v115 * v116;
        int v118 = v117 + v76;
        int v119 = 12;
        int v120 = v119 + v118;
        int v121 = v75[v120];
        int v122 = 0;
        bool v123 = v121 != v122;
        v114 = v114;
        v115 = v115;
        if (!v123) break;
        int v124 = 0;
        int v125 = 0;
        int v126;
        int v127;
        v126 = v124;
        v127 = v125;
        while (true) {
          int v128 = 4;
          int v129 = v127 * v128;
          int v130 = v129 + v76;
          int v131 = 32;
          int v132 = v131 + v130;
          int v133 = v75[v132];
          int v134 = 0;
          bool v135 = v133 != v134;
          v126 = v126;
          v127 = v127;
          if (!v135) break;
          int v136 = v126 + v127;
          int v137 = 1;
          int v138 = v127 + v137;
          bool v139 = true;
          v126 = v136;
          v127 = v138;
        }
        int v140 = v114 + v126;
        int v141 = 1;
        int v142 = v115 + v141;
        bool v143 = true;
        v114 = v140;
        v115 = v142;
      }
      v111 = v114;
      break;
    }
    case 0:
      {
      int v144 = 52;
      int v145 = v144 + v76;
      int v146 = v75[v145];
      int v147 = 2;
      int v148;
      v148 = v147;
      switch (v146) {
        default:
          {
          int v149 = 56;
          int v150 = v149 + v76;
          int v151 = v75[v150];
          int v152 = 0;
          bool v153 = v151 != v152;
          int v154;
          if (v153) {
            int v155 = 0;
            v154 = v155;
          } else {
            v154 = v76;
          }
          v148 = v154;
          break;
        }
        case 0:
          {
          int v156 = 4;
          v148 = v156;
          break;
        }
        case 1:
          {
          int v157 = 60;
          int v158 = v157 + v76;
          int v159 = v75[v158];
          int v160 = 0;
          bool v161 = v159 != v160;
          int v162;
          if (v161) {
            int v163 = 0;
            int v164 = v76 + v163;
            v162 = v164;
          } else {
            int v165 = 3;
            v162 = v165;
          }
          v148 = v162;
          break;
        }
      }
      v111 = v148;
      break;
    }
  }
  bool v166 = true;
  int v167 = 16;
  int v168 = v167 + v76;
  bool v169 = true;
  int v170 = simt_wave_count_bits(v169);
  v74[v168] = v170;
  int v171 = 64;
  int v172 = v171 + v76;
  int v173 = v75[v172];
  int v174 = 3;
  int v175 = v76 + v174;
  int v176;
  v176 = v175;
  switch (v173) {
    case 0:
      {
      int v177 = 0;
      int v178 = 0;
      int v179;
      int v180;
      v179 = v177;
      v180 = v178;
      while (true) {
        int v181 = 4;
        int v182 = v180 * v181;
        int v183 = v182 + v76;
        int v184 = 68;
        int v185 = v184 + v183;
        int v186 = v75[v185];
        int v187 = 0;
        bool v188 = v186 != v187;
        v179 = v179;
        v180 = v180;
        if (!v188) break;
        int v189 = v179 + v180;
        int v190 = 1;
        int v191 = v180 + v190;
        bool v192 = true;
        v179 = v189;
        v180 = v191;
        continue;
        ;
      }
      v176 = v179;
      break;
    }
    default:
      {
      int v193 = 88;
      int v194 = v193 + v76;
      int v195 = v75[v194];
      int v196;
      v196 = v76;
      switch (v195) {
        case 0:
          {
          int v197 = 92;
          int v198 = v197 + v76;
          int v199 = v75[v198];
          int v200 = 0;
          bool v201 = v199 != v200;
          int v202;
          if (v201) {
            v202 = v76;
          } else {
            int v203 = 2;
            v202 = v203;
          }
          v196 = v202;
          break;
        }
        case 1:
          {
          v196 = v76;
          break;
        }
        default:
          {
          int v204 = 96;
          int v205 = v204 + v76;
          int v206 = v75[v205];
          int v207 = 2;
          int v208 = v76 + v207;
          int v209;
          v209 = v208;
          switch (v206) {
            default:
              {
              int v210 = 0;
              v209 = v210;
              break;
            }
            case 0:
              {
              int v211 = 0;
              v209 = v211;
              break;
            }
            case 1:
              {
              int v212 = 0;
              int v213 = v76 + v212;
              v209 = v213;
              break;
            }
            case 2:
              {
              int v214 = 4;
              int v215 = v76 + v214;
              v209 = v215;
              break;
            }
          }
          v196 = v209;
        }
        case 2:
          {
          int v216 = 3;
          v196 = v216;
          break;
        }
      }
      v176 = v196;
      break;
    }
    case 1:
      {
      int v217 = 100;
      int v218 = v217 + v76;
      int v219 = v75[v218];
      int v220 = 0;
      bool v221 = v219 != v220;
      int v222;
      if (v221) {
        int v223 = 4;
        v222 = v223;
      } else {
        int v224 = 104;
        int v225 = v224 + v76;
        int v226 = v75[v225];
        int v227 = 0;
        bool v228 = v226 != v227;
        int v229;
        if (v228) {
          v229 = v76;
        } else {
          v229 = v76;
        }
        v222 = v229;
      }
      v176 = v222;
      break;
    }
  }
  int v230 = 108;
  int v231 = v230 + v76;
  int v232 = v75[v231];
  int v233;
  v233 = v76;
  switch (v232) {
    default:
      {
      int v234 = 112;
      int v235 = v234 + v76;
      int v236 = v75[v235];
      int v237;
      v237 = v76;
      switch (v236) {
        default:
          {
          int v238 = 116;
          int v239 = v238 + v76;
          int v240 = v75[v239];
          int v241 = 0;
          int v242 = v76 + v241;
          int v243;
          v243 = v242;
          switch (v240) {
            case 0:
              {
              int v244 = 0;
              v243 = v244;
              break;
            }
            default:
              {
              int v245 = 1;
              v243 = v245;
              break;
            }
          }
          v237 = v243;
          break;
        }
        case 0:
          {
          int v246 = 0;
          int v247 = 0;
          int v248;
          int v249;
          v248 = v246;
          v249 = v247;
          while (true) {
            int v250 = 4;
            int v251 = v249 * v250;
            int v252 = v251 + v76;
            int v253 = 120;
            int v254 = v253 + v252;
            int v255 = v75[v254];
            int v256 = 0;
            bool v257 = v255 != v256;
            v248 = v248;
            v249 = v249;
            if (!v257) break;
            int v258 = v248 + v249;
            int v259 = 1;
            int v260 = v249 + v259;
            bool v261 = true;
            v248 = v258;
            v249 = v260;
            continue;
            ;
          }
          v237 = v248;
          break;
        }
      }
      v233 = v237;
      break;
    }
    case 0:
      {
      int v262 = 140;
      int v263 = v262 + v76;
      int v264 = v75[v263];
      int v265 = 1;
      int v266 = v76 + v265;
      int v267;
      v267 = v266;
      switch (v264) {
        case 0:
          {
          v267 = v76;
          break;
        }
        default:
          {
          int v268 = 144;
          int v269 = v268 + v76;
          int v270 = v75[v269];
          int v271 = 0;
          bool v272 = v270 != v271;
          int v273;
          if (v272) {
            int v274 = 2;
            v273 = v274;
          } else {
            int v275 = 4;
            v273 = v275;
          }
          v267 = v273;
          break;
        }
      }
      v233 = v267;
      break;
    }
    case 1:
      {
      int v276 = 148;
      int v277 = v276 + v76;
      int v278 = v75[v277];
      int v279 = 4;
      int v280;
      v280 = v279;
      switch (v278) {
        case 0:
          {
          int v281 = 152;
          int v282 = v281 + v76;
          int v283 = v75[v282];
          int v284 = 2;
          int v285;
          v285 = v284;
          switch (v283) {
            default:
              {
              int v286 = 2;
              v285 = v286;
              break;
            }
            case 0:
              {
              int v287 = 4;
              int v288 = v76 + v287;
              v285 = v288;
              break;
            }
            case 1:
              {
              int v289 = 4;
              int v290 = v76 + v289;
              v285 = v290;
              break;
            }
            case 2:
              {
              v285 = v76;
              break;
            }
          }
          v280 = v285;
          break;
        }
        case 1:
          {
          int v291 = 0;
          int v292 = 0;
          int v293;
          int v294;
          v293 = v291;
          v294 = v292;
          while (true) {
            int v295 = 4;
            int v296 = v294 * v295;
            int v297 = v296 + v76;
            int v298 = 156;
            int v299 = v298 + v297;
            int v300 = v75[v299];
            int v301 = 0;
            bool v302 = v300 != v301;
            v293 = v293;
            v294 = v294;
            if (!v302) break;
            int v303 = v293 + v294;
            int v304 = 1;
            int v305 = v294 + v304;
            bool v306 = true;
            v293 = v303;
            v294 = v305;
          }
          v280 = v293;
          break;
        }
        default:
          {
          int v307 = 176;
          int v308 = v307 + v76;
          int v309 = v75[v308];
          int v310 = 0;
          bool v311 = v309 != v310;
          int v312;
          if (v311) {
            int v313 = 0;
            int v314 = v76 + v313;
            v312 = v314;
          } else {
            int v315 = 0;
            int v316 = v76 + v315;
            v312 = v316;
          }
          v280 = v312;
          break;
        }
      }
      v233 = v280;
      break;
    }
    case 2:
      {
      int v317 = 0;
      int v318 = 0;
      int v319;
      int v320;
      v319 = v317;
      v320 = v318;
      while (true) {
        int v321 = 4;
        int v322 = v320 * v321;
        int v323 = v322 + v76;
        int v324 = 180;
        int v325 = v324 + v323;
        int v326 = v75[v325];
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
      }
      v233 = v319;
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
    static int32_t expected0[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 200; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
