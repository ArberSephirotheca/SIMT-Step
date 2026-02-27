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
    int v11 = 0;
    int v12 = 0;
    int v13;
    int v14;
    v13 = v11;
    v14 = v12;
    while (true) {
      int v15 = 4;
      int v16 = v3 % v15;
      int v17 = 1;
      int v18 = v16 + v17;
      bool v19 = v14 < v18;
      v13 = v13;
      v14 = v14;
      if (!v19) break;
      bool v20 = true;
      int v21 = simt_wave_count_bits(v20);
      int v22 = 16;
      int v23 = 4;
      int v24 = v14 * v23;
      int v25 = v22 + v24;
      int v26 = v25 + v0;
      v1[v26] = v21;
      int v27 = 1;
      int v28 = v14 + v27;
      v13 = v21;
      v14 = v28;
      continue;
      ;
    }
    v10 = v13;
  } else {
    bool v29 = true;
    int v30 = simt_wave_count_bits(v29);
    int v31 = 32;
    int v32 = v31 + v0;
    v1[v32] = v30;
    v10 = v30;
  }
  int v33 = 0;
  bool v34 = v2 != v33;
  int v35 = v34 ? v5 : v10;
  int v36 = 0;
  int v37 = 0;
  int v38;
  int v39;
  v38 = v36;
  v39 = v37;
  while (true) {
    int v40 = 4;
    int v41 = v3 % v40;
    int v42 = 1;
    int v43 = v41 + v42;
    bool v44 = v39 < v43;
    v38 = v38;
    v39 = v39;
    if (!v44) break;
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
      bool v54 = true;
      int v55 = simt_wave_count_bits(v54);
      int v56 = 48;
      int v57 = 4;
      int v58 = v48 * v57;
      int v59 = v56 + v58;
      int v60 = v59 + v0;
      v1[v60] = v55;
      int v61 = 1;
      int v62 = v48 + v61;
      v47 = v55;
      v48 = v62;
    }
    int v63 = 1;
    int v64 = v39 + v63;
    v38 = v47;
    v39 = v64;
  }
  int v65 = 0;
  bool v66 = v2 != v65;
  int v67 = v66 ? v35 : v38;
  return;
}

kernel void kernel_main(device int* v68 [[buffer(0)]], device int* v69 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v70 = static_cast<int>(__simt_tid3.x);
  int v71 = 0;
  int v72 = v71 + v70;
  int v73 = v69[v72];
  int v74 = 4;
  int v75 = v74 + v70;
  int v76 = v69[v75];
  helper0(v70, v68, v73, v76, static_cast<int>(__simt_tid3.x));
  int v77 = 8;
  int v78 = v77 + v70;
  int v79 = v69[v78];
  int v80 = 0;
  bool v81 = v79 != v80;
  int v82;
  if (v81) {
    int v83 = 0;
    int v84 = 0;
    int v85;
    int v86;
    v85 = v83;
    v86 = v84;
    while (true) {
      int v87 = 4;
      int v88 = v86 * v87;
      int v89 = v88 + v70;
      int v90 = 12;
      int v91 = v90 + v89;
      int v92 = v69[v91];
      int v93 = 0;
      bool v94 = v92 != v93;
      v85 = v85;
      v86 = v86;
      if (!v94) break;
      int v95 = v85 + v86;
      int v96 = 1;
      int v97 = v86 + v96;
      bool v98 = true;
      int v99 = 64;
      int v100 = 4;
      int v101 = v86 * v100;
      int v102 = v99 + v101;
      int v103 = v102 + v70;
      bool v104 = true;
      int v105 = simt_wave_count_bits(v104);
      v68[v103] = v105;
      v85 = v95;
      v86 = v97;
    }
    v82 = v85;
  } else {
    int v106 = 32;
    int v107 = v106 + v70;
    int v108 = v69[v107];
    uint v109 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v110 = (int)(v109);
    int v111;
    v111 = v110;
    switch (v108) {
      default:
        {
        int v112 = 36;
        int v113 = v112 + v70;
        int v114 = v69[v113];
        int v115 = 0;
        bool v116 = v114 != v115;
        int v117;
        if (v116) {
          int v118 = 0;
          v117 = v118;
        } else {
          int v119 = 3;
          int v120 = v70 + v119;
          v117 = v120;
        }
        v111 = v117;
      }
      case 0:
        {
        int v121 = 0;
        int v122 = 0;
        int v123;
        int v124;
        v123 = v121;
        v124 = v122;
        while (true) {
          int v125 = 4;
          int v126 = v124 * v125;
          int v127 = v126 + v70;
          int v128 = 40;
          int v129 = v128 + v127;
          int v130 = v69[v129];
          int v131 = 0;
          bool v132 = v130 != v131;
          v123 = v123;
          v124 = v124;
          if (!v132) break;
          int v133 = v123 + v124;
          int v134 = 1;
          int v135 = v124 + v134;
          bool v136 = true;
          v123 = v133;
          v124 = v135;
          break;
          ;
        }
        v111 = v123;
        break;
      }
      case 1:
        {
        int v137 = 3;
        int v138 = v70 + v137;
        v111 = v138;
        break;
      }
    }
    v82 = v111;
  }
  int v139 = 80;
  int v140 = v139 + v70;
  bool v141 = true;
  int v142 = simt_wave_count_bits(v141);
  v68[v140] = v142;
  int v143 = 60;
  int v144 = v143 + v70;
  int v145 = v69[v144];
  uint v146 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v147 = (int)(v146);
  int v148;
  v148 = v147;
  switch (v145) {
    default:
      {
      int v149 = 64;
      int v150 = v149 + v70;
      int v151 = v69[v150];
      int v152 = 0;
      int v153 = v70 + v152;
      int v154;
      v154 = v153;
      switch (v151) {
        case 0:
          {
          int v155 = 68;
          int v156 = v155 + v70;
          int v157 = v69[v156];
          int v158 = 0;
          bool v159 = v157 != v158;
          int v160;
          if (v159) {
            int v161 = 4;
            int v162 = v70 + v161;
            v160 = v162;
          } else {
            int v163 = 0;
            v160 = v163;
          }
          v154 = v160;
          break;
        }
        case 1:
          {
          int v164 = 72;
          int v165 = v164 + v70;
          int v166 = v69[v165];
          int v167 = 0;
          bool v168 = v166 != v167;
          int v169;
          if (v168) {
            v169 = v70;
          } else {
            v169 = v70;
          }
          v154 = v169;
          break;
        }
        default:
          {
          int v170 = 76;
          int v171 = v170 + v70;
          int v172 = v69[v171];
          int v173 = 0;
          int v174;
          v174 = v173;
          switch (v172) {
            case 0:
              {
              int v175 = 3;
              int v176 = v70 + v175;
              v174 = v176;
            }
            default:
              {
              int v177 = 1;
              int v178 = v70 + v177;
              v174 = v178;
              break;
            }
          }
          v154 = v174;
          break;
        }
        case 2:
          {
          int v179 = 80;
          int v180 = v179 + v70;
          int v181 = v69[v180];
          int v182 = 4;
          int v183;
          v183 = v182;
          switch (v181) {
            default:
              {
              int v184 = 0;
              v183 = v184;
              break;
            }
            case 0:
              {
              int v185 = 4;
              int v186 = v70 + v185;
              v183 = v186;
              break;
            }
          }
          v154 = v183;
          break;
        }
      }
      v148 = v154;
      break;
    }
    case 0:
      {
      int v187 = 84;
      int v188 = v187 + v70;
      int v189 = v69[v188];
      int v190;
      v190 = v70;
      switch (v189) {
        default:
          {
          int v191 = 0;
          int v192 = 0;
          int v193;
          int v194;
          v193 = v191;
          v194 = v192;
          while (true) {
            int v195 = 4;
            int v196 = v194 * v195;
            int v197 = v196 + v70;
            int v198 = 88;
            int v199 = v198 + v197;
            int v200 = v69[v199];
            int v201 = 0;
            bool v202 = v200 != v201;
            v193 = v193;
            v194 = v194;
            if (!v202) break;
            int v203 = v193 + v194;
            int v204 = 1;
            int v205 = v194 + v204;
            bool v206 = true;
            v193 = v203;
            v194 = v205;
          }
          v190 = v193;
          break;
        }
        case 0:
          {
          int v207 = 0;
          int v208 = 0;
          int v209;
          int v210;
          v209 = v207;
          v210 = v208;
          while (true) {
            int v211 = 4;
            int v212 = v210 * v211;
            int v213 = v212 + v70;
            int v214 = 108;
            int v215 = v214 + v213;
            int v216 = v69[v215];
            int v217 = 0;
            bool v218 = v216 != v217;
            v209 = v209;
            v210 = v210;
            if (!v218) break;
            int v219 = v209 + v210;
            int v220 = 1;
            int v221 = v210 + v220;
            bool v222 = true;
            v209 = v219;
            v210 = v221;
            break;
            ;
          }
          v190 = v209;
          break;
        }
      }
      v148 = v190;
      break;
    }
  }
  int v223 = 128;
  int v224 = v223 + v70;
  int v225 = v69[v224];
  uint v226 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v227 = (int)(v226);
  int v228;
  v228 = v227;
  switch (v225) {
    case 0:
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
        int v235 = v234 + v70;
        int v236 = 132;
        int v237 = v236 + v235;
        int v238 = v69[v237];
        int v239 = 0;
        bool v240 = v238 != v239;
        v231 = v231;
        v232 = v232;
        if (!v240) break;
        int v241 = 152;
        int v242 = v241 + v70;
        int v243 = v69[v242];
        int v244 = 0;
        bool v245 = v243 != v244;
        int v246;
        if (v245) {
          int v247 = 0;
          v246 = v247;
        } else {
          int v248 = 3;
          v246 = v248;
        }
        int v249 = v231 + v246;
        int v250 = 1;
        int v251 = v232 + v250;
        bool v252 = true;
        v231 = v249;
        v232 = v251;
      }
      v228 = v231;
      break;
    }
    case 1:
      {
      int v253 = 156;
      int v254 = v253 + v70;
      int v255 = v69[v254];
      int v256 = 1;
      int v257;
      v257 = v256;
      switch (v255) {
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
            int v264 = v263 + v70;
            int v265 = 160;
            int v266 = v265 + v264;
            int v267 = v69[v266];
            int v268 = 0;
            bool v269 = v267 != v268;
            v260 = v260;
            v261 = v261;
            if (!v269) break;
            int v270 = v260 + v261;
            int v271 = 1;
            int v272 = v261 + v271;
            bool v273 = true;
            v260 = v270;
            v261 = v272;
          }
          v257 = v260;
        }
        case 0:
          {
          int v274 = 180;
          int v275 = v274 + v70;
          int v276 = v69[v275];
          int v277 = 2;
          int v278;
          v278 = v277;
          switch (v276) {
            case 0:
              {
              int v279 = 4;
              v278 = v279;
            }
            case 1:
              {
              v278 = v70;
              break;
            }
            case 2:
              {
              int v280 = 1;
              int v281 = v70 + v280;
              v278 = v281;
              break;
            }
            default:
              {
              int v282 = 4;
              int v283 = v70 + v282;
              v278 = v283;
              break;
            }
          }
          v257 = v278;
          break;
        }
      }
      v228 = v257;
      break;
    }
    default:
      {
      int v284 = 184;
      int v285 = v284 + v70;
      int v286 = v69[v285];
      int v287;
      v287 = v70;
      switch (v286) {
        case 0:
          {
          int v288 = 188;
          int v289 = v288 + v70;
          int v290 = v69[v289];
          int v291 = 3;
          int v292 = v70 + v291;
          int v293;
          v293 = v292;
          switch (v290) {
            case 0:
              {
              v293 = v70;
              break;
            }
            default:
              {
              int v294 = 1;
              v293 = v294;
              break;
            }
          }
          bool v295 = true;
          v287 = v293;
        }
        default:
          {
          int v296 = 192;
          int v297 = v296 + v70;
          int v298 = v69[v297];
          int v299 = 0;
          int v300;
          v300 = v299;
          switch (v298) {
            default:
              {
              int v301 = 1;
              int v302 = v70 + v301;
              v300 = v302;
              break;
            }
            case 0:
              {
              v300 = v70;
              break;
            }
          }
          v287 = v300;
        }
        case 1:
          {
          int v303 = 4;
          int v304 = v70 + v303;
          v287 = v304;
          break;
        }
      }
      v228 = v287;
      break;
    }
    case 2:
      {
      int v305 = 196;
      int v306 = v305 + v70;
      int v307 = v69[v306];
      int v308 = 0;
      bool v309 = v307 != v308;
      int v310;
      if (v309) {
        int v311 = 0;
        int v312 = 0;
        int v313;
        int v314;
        v313 = v311;
        v314 = v312;
        while (true) {
          int v315 = 4;
          int v316 = v314 * v315;
          int v317 = v316 + v70;
          int v318 = 200;
          int v319 = v318 + v317;
          int v320 = v69[v319];
          int v321 = 0;
          bool v322 = v320 != v321;
          v313 = v313;
          v314 = v314;
          if (!v322) break;
          int v323 = v313 + v314;
          int v324 = 1;
          int v325 = v314 + v324;
          bool v326 = true;
          v313 = v323;
          v314 = v325;
        }
        v310 = v313;
      } else {
        int v327 = 220;
        int v328 = v327 + v70;
        int v329 = v69[v328];
        int v330;
        v330 = v70;
        switch (v329) {
          case 0:
            {
            int v331 = 1;
            int v332 = v70 + v331;
            v330 = v332;
            break;
          }
          default:
            {
            int v333 = 3;
            int v334 = v70 + v333;
            v330 = v334;
            break;
          }
        }
        v310 = v330;
      }
      v228 = v310;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 84; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 224; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
