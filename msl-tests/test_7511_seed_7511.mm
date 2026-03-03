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
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 0;
      bool v10 = v2 != v9;
      int v11;
      if (v10) {
        int v12 = 1;
        v11 = v12;
      } else {
        int v13 = 0;
        bool v14 = v2 != v13;
        int v15;
        if (v14) {
          v15 = v0;
        } else {
          int v16 = 2;
          v15 = v16;
        }
        v11 = v15;
      }
      int v17 = 3;
      int v18 = v0 + v17;
      v8 = v11;
      break;
    }
    case 1:
      {
      int v19 = 0;
      int v20 = 0;
      int v21;
      int v22;
      v21 = v19;
      v22 = v20;
      while (true) {
        int v23 = 4;
        int v24 = v3 % v23;
        int v25 = 1;
        int v26 = v24 + v25;
        bool v27 = v22 < v26;
        v21 = v21;
        v22 = v22;
        if (!v27) break;
        int v28 = 1;
        int v29 = v22 + v28;
        v21 = v0;
        v22 = v29;
      }
      int v30 = 3;
      int v31 = v0 + v30;
      v8 = v21;
      break;
    }
    default:
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
        int v41 = 0;
        int v42 = 0;
        int v43;
        int v44;
        v43 = v41;
        v44 = v42;
        while (true) {
          int v45 = 4;
          int v46 = v3 % v45;
          int v47 = 1;
          int v48 = v46 + v47;
          bool v49 = v44 < v48;
          v43 = v43;
          v44 = v44;
          if (!v49) break;
          int v50 = 1;
          int v51 = v44 + v50;
          v43 = v0;
          v44 = v51;
          continue;
          ;
        }
        int v52 = 1;
        int v53 = v35 + v52;
        v34 = v43;
        v35 = v53;
      }
      v8 = v34;
      break;
    }
  }
  bool v54 = true;
  int v55 = simt_wave_count_bits(v54);
  int v56 = 0;
  int v57 = v56 + v0;
  v1[v57] = v55;
  return;
}

kernel void kernel_main(device int* v58 [[buffer(0)]], device int* v59 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v60 = static_cast<int>(__simt_tid3.x);
  int v61 = 0;
  int v62 = v61 + v60;
  int v63 = v59[v62];
  int v64 = 4;
  int v65 = v64 + v60;
  int v66 = v59[v65];
  helper0(v60, v58, v63, v66, static_cast<int>(__simt_tid3.x));
  int v67 = 8;
  int v68 = v67 + v60;
  int v69 = v59[v68];
  int v70;
  v70 = v60;
  switch (v69) {
    case 0:
      {
      int v71 = 12;
      int v72 = v71 + v60;
      int v73 = v59[v72];
      int v74 = 0;
      bool v75 = v73 != v74;
      int v76;
      if (v75) {
        int v77 = 16;
        int v78 = v77 + v60;
        int v79 = v59[v78];
        int v80;
        v80 = v60;
        switch (v79) {
          case 0:
            {
            int v81 = 1;
            int v82 = v60 + v81;
            v80 = v82;
            break;
          }
          default:
            {
            int v83 = 3;
            int v84 = v60 + v83;
            v80 = v84;
            break;
          }
          case 1:
            {
            v80 = v60;
            break;
          }
        }
        bool v85 = true;
        v76 = v80;
      } else {
        int v86 = 20;
        int v87 = v86 + v60;
        int v88 = v59[v87];
        int v89 = 0;
        bool v90 = v88 != v89;
        int v91;
        if (v90) {
          v91 = v60;
        } else {
          v91 = v60;
        }
        v76 = v91;
      }
      v70 = v76;
      break;
    }
    case 1:
      {
      int v92 = 24;
      int v93 = v92 + v60;
      int v94 = v59[v93];
      int v95;
      v95 = v60;
      switch (v94) {
        case 0:
          {
          int v96 = 28;
          int v97 = v96 + v60;
          int v98 = v59[v97];
          int v99 = 0;
          bool v100 = v98 != v99;
          int v101;
          if (v100) {
            v101 = v60;
          } else {
            v101 = v60;
          }
          v95 = v101;
          break;
        }
        default:
          {
          int v102 = 0;
          int v103 = 0;
          int v104;
          int v105;
          v104 = v102;
          v105 = v103;
          while (true) {
            int v106 = 4;
            int v107 = v105 * v106;
            int v108 = v107 + v60;
            int v109 = 32;
            int v110 = v109 + v108;
            int v111 = v59[v110];
            int v112 = 0;
            bool v113 = v111 != v112;
            v104 = v104;
            v105 = v105;
            if (!v113) break;
            int v114 = v104 + v105;
            int v115 = 1;
            int v116 = v105 + v115;
            v104 = v114;
            v105 = v116;
            break;
            ;
          }
          bool v117 = true;
          v95 = v104;
          break;
        }
      }
      bool v118 = true;
      v70 = v95;
    }
    default:
      {
      int v119 = 52;
      int v120 = v119 + v60;
      int v121 = v59[v120];
      int v122 = 4;
      int v123 = v60 + v122;
      int v124;
      v124 = v123;
      switch (v121) {
        case 0:
          {
          int v125 = 56;
          int v126 = v125 + v60;
          int v127 = v59[v126];
          int v128;
          v128 = v60;
          switch (v127) {
            default:
              {
              int v129 = 2;
              int v130 = v60 + v129;
              v128 = v130;
              break;
            }
            case 0:
              {
              int v131 = 3;
              int v132 = v60 + v131;
              v128 = v132;
              break;
            }
            case 1:
              {
              v128 = v60;
              break;
            }
          }
          bool v133 = true;
          v124 = v128;
          break;
        }
        case 1:
          {
          int v134 = 60;
          int v135 = v134 + v60;
          int v136 = v59[v135];
          int v137 = 0;
          bool v138 = v136 != v137;
          int v139;
          if (v138) {
            int v140 = 4;
            int v141 = v60 + v140;
            v139 = v141;
          } else {
            v139 = v60;
          }
          v124 = v139;
          break;
        }
        default:
          {
          v124 = v60;
          break;
        }
        case 2:
          {
          int v142 = 64;
          int v143 = v142 + v60;
          int v144 = v59[v143];
          int v145 = 1;
          int v146;
          v146 = v145;
          switch (v144) {
            case 0:
              {
              int v147 = 4;
              int v148 = v60 + v147;
              v146 = v148;
            }
            case 1:
              {
              int v149 = 1;
              v146 = v149;
            }
            default:
              {
              int v150 = 1;
              v146 = v150;
            }
            case 2:
              {
              int v151 = 0;
              v146 = v151;
              break;
            }
          }
          bool v152 = true;
          v124 = v146;
          break;
        }
      }
      bool v153 = true;
      v70 = v124;
      break;
    }
    case 2:
      {
      int v154 = 68;
      int v155 = v154 + v60;
      int v156 = v59[v155];
      int v157 = 0;
      bool v158 = v156 != v157;
      int v159;
      if (v158) {
        v159 = v60;
      } else {
        v159 = v60;
      }
      v70 = v159;
      break;
    }
  }
  bool v160 = true;
  int v161 = 16;
  int v162 = v161 + v60;
  bool v163 = true;
  int v164 = simt_wave_count_bits(v163);
  v58[v162] = v164;
  int v165 = 72;
  int v166 = v165 + v60;
  int v167 = v59[v166];
  int v168 = 2;
  int v169 = v60 + v168;
  int v170;
  v170 = v169;
  switch (v167) {
    default:
      {
      int v171 = 76;
      int v172 = v171 + v60;
      int v173 = v59[v172];
      int v174 = 4;
      int v175;
      v175 = v174;
      switch (v173) {
        default:
          {
          v175 = v60;
          break;
        }
        case 0:
          {
          int v176 = 80;
          int v177 = v176 + v60;
          int v178 = v59[v177];
          int v179 = 2;
          int v180;
          v180 = v179;
          switch (v178) {
            default:
              {
              int v181 = 0;
              v180 = v181;
              break;
            }
            case 0:
              {
              v180 = v60;
              break;
            }
            case 1:
              {
              int v182 = 0;
              int v183 = v60 + v182;
              v180 = v183;
            }
            case 2:
              {
              int v184 = 2;
              v180 = v184;
              break;
            }
          }
          bool v185 = true;
          v175 = v180;
          break;
        }
        case 1:
          {
          int v186 = 0;
          int v187 = 0;
          int v188;
          int v189;
          v188 = v186;
          v189 = v187;
          while (true) {
            int v190 = 4;
            int v191 = v189 * v190;
            int v192 = v191 + v60;
            int v193 = 84;
            int v194 = v193 + v192;
            int v195 = v59[v194];
            int v196 = 0;
            bool v197 = v195 != v196;
            v188 = v188;
            v189 = v189;
            if (!v197) break;
            int v198 = v188 + v189;
            int v199 = 1;
            int v200 = v189 + v199;
            v188 = v198;
            v189 = v200;
          }
          bool v201 = true;
          v175 = v188;
          break;
        }
        case 2:
          {
          int v202 = 104;
          int v203 = v202 + v60;
          int v204 = v59[v203];
          int v205 = 0;
          bool v206 = v204 != v205;
          int v207;
          if (v206) {
            int v208 = 1;
            v207 = v208;
          } else {
            v207 = v60;
          }
          v175 = v207;
          break;
        }
      }
      bool v209 = true;
      v170 = v175;
    }
    case 0:
      {
      int v210 = 108;
      int v211 = v210 + v60;
      int v212 = v59[v211];
      int v213 = 0;
      bool v214 = v212 != v213;
      int v215;
      if (v214) {
        int v216 = 112;
        int v217 = v216 + v60;
        int v218 = v59[v217];
        int v219;
        v219 = v60;
        switch (v218) {
          case 0:
            {
            v219 = v60;
          }
          case 1:
            {
            int v220 = 1;
            int v221 = v60 + v220;
            v219 = v221;
          }
          case 2:
            {
            int v222 = 2;
            v219 = v222;
          }
          default:
            {
            int v223 = 3;
            v219 = v223;
            break;
          }
        }
        bool v224 = true;
        v215 = v219;
      } else {
        int v225 = 116;
        int v226 = v225 + v60;
        int v227 = v59[v226];
        int v228 = 0;
        bool v229 = v227 != v228;
        int v230;
        if (v229) {
          v230 = v60;
        } else {
          int v231 = 2;
          v230 = v231;
        }
        v215 = v230;
      }
      v170 = v215;
      break;
    }
    case 1:
      {
      int v232 = 120;
      int v233 = v232 + v60;
      int v234 = v59[v233];
      int v235 = 0;
      bool v236 = v234 != v235;
      int v237;
      if (v236) {
        int v238 = 124;
        int v239 = v238 + v60;
        int v240 = v59[v239];
        int v241 = 0;
        bool v242 = v240 != v241;
        int v243;
        if (v242) {
          int v244 = 4;
          v243 = v244;
        } else {
          int v245 = 3;
          v243 = v245;
        }
        v237 = v243;
      } else {
        int v246 = 128;
        int v247 = v246 + v60;
        int v248 = v59[v247];
        int v249;
        v249 = v60;
        switch (v248) {
          default:
            {
            v249 = v60;
            break;
          }
          case 0:
            {
            int v250 = 0;
            int v251 = v60 + v250;
            v249 = v251;
            break;
          }
          case 1:
            {
            int v252 = 0;
            v249 = v252;
            break;
          }
        }
        bool v253 = true;
        v237 = v249;
      }
      v170 = v237;
      break;
    }
    case 2:
      {
      int v254 = 0;
      int v255 = 0;
      int v256;
      int v257;
      v256 = v254;
      v257 = v255;
      while (true) {
        int v258 = 4;
        int v259 = v257 * v258;
        int v260 = v259 + v60;
        int v261 = 132;
        int v262 = v261 + v260;
        int v263 = v59[v262];
        int v264 = 0;
        bool v265 = v263 != v264;
        v256 = v256;
        v257 = v257;
        if (!v265) break;
        int v266 = v256 + v257;
        int v267 = 1;
        int v268 = v257 + v267;
        v256 = v266;
        v257 = v268;
      }
      bool v269 = true;
      v170 = v256;
      break;
    }
  }
  bool v270 = true;
  int v271 = 32;
  int v272 = v271 + v60;
  bool v273 = true;
  int v274 = simt_wave_count_bits(v273);
  v58[v272] = v274;
  int v275 = 152;
  int v276 = v275 + v60;
  int v277 = v59[v276];
  int v278 = 0;
  bool v279 = v277 != v278;
  int v280;
  if (v279) {
    int v281 = 156;
    int v282 = v281 + v60;
    int v283 = v59[v282];
    int v284 = 0;
    bool v285 = v283 != v284;
    int v286;
    if (v285) {
      int v287 = 160;
      int v288 = v287 + v60;
      int v289 = v59[v288];
      int v290 = 0;
      bool v291 = v289 != v290;
      int v292;
      if (v291) {
        int v293 = 3;
        int v294 = v60 + v293;
        v292 = v294;
      } else {
        v292 = v60;
      }
      v286 = v292;
    } else {
      uint v295 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v296 = (int)(v295);
      v286 = v296;
    }
    v280 = v286;
  } else {
    int v297 = 0;
    int v298 = 0;
    int v299;
    int v300;
    v299 = v297;
    v300 = v298;
    while (true) {
      int v301 = 4;
      int v302 = v300 * v301;
      int v303 = v302 + v60;
      int v304 = 164;
      int v305 = v304 + v303;
      int v306 = v59[v305];
      int v307 = 0;
      bool v308 = v306 != v307;
      v299 = v299;
      v300 = v300;
      if (!v308) break;
      int v309 = 184;
      int v310 = v309 + v60;
      int v311 = v59[v310];
      int v312 = 0;
      bool v313 = v311 != v312;
      int v314;
      if (v313) {
        int v315 = 1;
        v314 = v315;
      } else {
        uint v316 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v317 = (int)(v316);
        v314 = v317;
      }
      int v318 = v299 + v314;
      int v319 = 1;
      int v320 = v300 + v319;
      v299 = v318;
      v300 = v320;
    }
    bool v321 = true;
    v280 = v299;
  }
  int v322 = 48;
  int v323 = v322 + v60;
  bool v324 = true;
  int v325 = simt_wave_count_bits(v324);
  v58[v323] = v325;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 188; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
