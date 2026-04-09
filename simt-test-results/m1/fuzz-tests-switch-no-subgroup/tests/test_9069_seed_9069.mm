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
  int v8 = 2;
  int v9 = v3 % v8;
  uint v10 = simt_lane_id(__simt_tid);
  int v11 = (int)(v10);
  int v12;
  v12 = v11;
  switch (v9) {
    case 0:
      {
      int v13 = 4;
      int v14 = v3 % v13;
      int v15 = 2;
      int v16;
      v16 = v15;
      switch (v14) {
        default:
          {
          int v17 = 0;
          int v18 = 0;
          int v19;
          int v20;
          v19 = v17;
          v20 = v18;
          while (true) {
            int v21 = 4;
            int v22 = v3 % v21;
            int v23 = 1;
            int v24 = v22 + v23;
            bool v25 = v20 < v24;
            v19 = v19;
            v20 = v20;
            if (!v25) break;
            int v26 = 1;
            int v27 = v0 + v26;
            int v28 = 1;
            int v29 = v20 + v28;
            v19 = v27;
            v20 = v29;
          }
          v16 = v19;
          break;
        }
        case 0:
          {
          int v30 = 0;
          int v31 = 0;
          int v32;
          int v33;
          v32 = v30;
          v33 = v31;
          while (true) {
            int v34 = 4;
            int v35 = v3 % v34;
            int v36 = 1;
            int v37 = v35 + v36;
            bool v38 = v33 < v37;
            v32 = v32;
            v33 = v33;
            if (!v38) break;
            int v39 = 4;
            int v40 = 1;
            int v41 = v33 + v40;
            v32 = v39;
            v33 = v41;
          }
          v16 = v32;
          break;
        }
        case 1:
          {
          int v42 = 0;
          int v43 = 0;
          int v44;
          int v45;
          v44 = v42;
          v45 = v43;
          while (true) {
            int v46 = 4;
            int v47 = v3 % v46;
            int v48 = 1;
            int v49 = v47 + v48;
            bool v50 = v45 < v49;
            v44 = v44;
            v45 = v45;
            if (!v50) break;
            int v51 = 3;
            int v52 = 1;
            int v53 = v45 + v52;
            v44 = v51;
            v45 = v53;
          }
          v16 = v44;
          break;
        }
        case 2:
          {
          int v54 = 3;
          int v55 = v0 + v54;
          int v56;
          v56 = v55;
          switch (v3) {
            default:
              {
              v56 = v0;
              break;
            }
            case 0:
              {
              int v57 = 2;
              v56 = v57;
              break;
            }
          }
          v16 = v56;
          break;
        }
      }
      v12 = v16;
      break;
    }
    default:
      {
      int v58 = 0;
      int v59 = v0 + v58;
      int v60;
      v60 = v59;
      switch (v3) {
        default:
          {
          int v61 = 0;
          int v62 = 0;
          int v63;
          int v64;
          v63 = v61;
          v64 = v62;
          while (true) {
            int v65 = 4;
            int v66 = v3 % v65;
            int v67 = 1;
            int v68 = v66 + v67;
            bool v69 = v64 < v68;
            v63 = v63;
            v64 = v64;
            if (!v69) break;
            int v70 = 0;
            int v71 = v0 + v70;
            int v72 = 1;
            int v73 = v64 + v72;
            v63 = v71;
            v64 = v73;
          }
          v60 = v63;
          break;
        }
        case 0:
          {
          int v74 = 0;
          bool v75 = v2 != v74;
          int v76;
          if (v75) {
            v76 = v0;
          } else {
            int v77 = 0;
            int v78 = v0 + v77;
            v76 = v78;
          }
          v60 = v76;
          break;
        }
      }
      v12 = v60;
      break;
    }
  }
  int v79 = 0;
  bool v80 = v2 != v79;
  int v81 = v80 ? v5 : v12;
  return;
}

kernel void kernel_main(device int* v82 [[buffer(0)]], device int* v83 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v84 = static_cast<int>(__simt_tid3.x);
  int v85 = 0;
  int v86 = v85 + v84;
  int v87 = v83[v86];
  int v88 = 4;
  int v89 = v88 + v84;
  int v90 = v83[v89];
  int v91 = 0;
  bool v92 = v87 != v91;
  if (v92) {
  } else {
    int v93 = 8;
    int v94 = v93 + v84;
    int v95 = v83[v94];
    int v96 = 0;
    bool v97 = v95 != v96;
    if (v97) {
    } else {
      int v98 = 3;
      int v99 = v84 % v98;
      int v100 = 1;
      int v101;
      v101 = v100;
      switch (v99) {
        case 0:
          {
          int v102 = 4;
          int v103 = v101 + v102;
          v101 = v103;
          break;
        }
        case 1:
          {
          int v104 = 2;
          int v105 = v101 + v104;
          v101 = v105;
          break;
        }
        case 2:
          {
          int v106 = 0;
          int v107 = v101 + v106;
          v101 = v107;
          break;
        }
        default:
          {
          int v108 = 4;
          int v109 = v101 + v108;
          v101 = v109;
          break;
        }
      }
      helper0(v84, v82, v87, v90, static_cast<int>(__simt_tid3.x));
    }
  }
  int v110 = 12;
  int v111 = v110 + v84;
  int v112 = v83[v111];
  int v113;
  v113 = v84;
  switch (v112) {
    case 0:
      {
      int v114 = 16;
      int v115 = v114 + v84;
      int v116 = v83[v115];
      int v117 = 0;
      bool v118 = v116 != v117;
      int v119;
      if (v118) {
        int v120 = 20;
        int v121 = v120 + v84;
        int v122 = v83[v121];
        int v123 = 2;
        int v124 = v84 + v123;
        int v125;
        v125 = v124;
        switch (v122) {
          case 0:
            {
            v125 = v84;
            break;
          }
          case 1:
            {
            v125 = v84;
            break;
          }
          default:
            {
            int v126 = 1;
            int v127 = v84 + v126;
            v125 = v127;
            break;
          }
          case 2:
            {
            int v128 = 4;
            int v129 = v84 + v128;
            v125 = v129;
            break;
          }
        }
        v119 = v125;
      } else {
        int v130 = 3;
        v119 = v130;
      }
      v113 = v119;
      break;
    }
    default:
      {
      int v131 = 24;
      int v132 = v131 + v84;
      int v133 = v83[v132];
      int v134 = 0;
      bool v135 = v133 != v134;
      int v136;
      if (v135) {
        int v137 = 28;
        int v138 = v137 + v84;
        int v139 = v83[v138];
        int v140 = 2;
        int v141;
        v141 = v140;
        switch (v139) {
          case 0:
            {
            int v142 = 3;
            int v143 = v84 + v142;
            v141 = v143;
            break;
          }
          case 1:
            {
            v141 = v84;
            break;
          }
          case 2:
            {
            int v144 = 2;
            v141 = v144;
            break;
          }
          default:
            {
            int v145 = 4;
            v141 = v145;
            break;
          }
        }
        v136 = v141;
      } else {
        int v146 = 32;
        int v147 = v146 + v84;
        int v148 = v83[v147];
        int v149 = 0;
        bool v150 = v148 != v149;
        int v151;
        if (v150) {
          int v152 = 3;
          int v153 = v84 + v152;
          v151 = v153;
        } else {
          int v154 = 4;
          int v155 = v84 + v154;
          v151 = v155;
        }
        v136 = v151;
      }
      v113 = v136;
    }
    case 1:
      {
      int v156 = 4;
      v113 = v156;
      break;
    }
  }
  bool v157 = true;
  int v158 = 16;
  int v159 = v158 + v84;
  bool v160 = true;
  int v161 = simt_wave_count_bits(v160);
  v82[v159] = v161;
  int v162 = 36;
  int v163 = v162 + v84;
  int v164 = v83[v163];
  int v165 = 0;
  int v166 = v84 + v165;
  int v167;
  v167 = v166;
  switch (v164) {
    case 0:
      {
      int v168 = 0;
      int v169 = v84 + v168;
      v167 = v169;
    }
    default:
      {
      int v170 = 40;
      int v171 = v170 + v84;
      int v172 = v83[v171];
      int v173 = 3;
      int v174;
      v174 = v173;
      switch (v172) {
        case 0:
          {
          int v175 = 44;
          int v176 = v175 + v84;
          int v177 = v83[v176];
          int v178 = 0;
          bool v179 = v177 != v178;
          int v180;
          if (v179) {
            int v181 = 1;
            int v182 = v84 + v181;
            v180 = v182;
          } else {
            v180 = v84;
          }
          v174 = v180;
          break;
        }
        default:
          {
          int v183 = 0;
          int v184 = 0;
          int v185;
          int v186;
          v185 = v183;
          v186 = v184;
          while (true) {
            int v187 = 4;
            int v188 = v186 * v187;
            int v189 = v188 + v84;
            int v190 = 48;
            int v191 = v190 + v189;
            int v192 = v83[v191];
            int v193 = 0;
            bool v194 = v192 != v193;
            v185 = v185;
            v186 = v186;
            if (!v194) break;
            int v195 = v185 + v186;
            int v196 = 1;
            int v197 = v186 + v196;
            bool v198 = true;
            v185 = v195;
            v186 = v197;
          }
          v174 = v185;
          break;
        }
        case 1:
          {
          int v199 = 0;
          int v200 = 0;
          int v201;
          int v202;
          v201 = v199;
          v202 = v200;
          while (true) {
            int v203 = 4;
            int v204 = v202 * v203;
            int v205 = v204 + v84;
            int v206 = 68;
            int v207 = v206 + v205;
            int v208 = v83[v207];
            int v209 = 0;
            bool v210 = v208 != v209;
            v201 = v201;
            v202 = v202;
            if (!v210) break;
            int v211 = v201 + v202;
            int v212 = 1;
            int v213 = v202 + v212;
            bool v214 = true;
            v201 = v211;
            v202 = v213;
          }
          v174 = v201;
          break;
        }
      }
      v167 = v174;
      break;
    }
    case 1:
      {
      int v215 = 88;
      int v216 = v215 + v84;
      int v217 = v83[v216];
      int v218;
      v218 = v84;
      switch (v217) {
        default:
          {
          int v219 = 92;
          int v220 = v219 + v84;
          int v221 = v83[v220];
          int v222 = 2;
          int v223 = v84 + v222;
          int v224;
          v224 = v223;
          switch (v221) {
            case 0:
              {
              int v225 = 3;
              int v226 = v84 + v225;
              v224 = v226;
              break;
            }
            case 1:
              {
              v224 = v84;
              break;
            }
            default:
              {
              int v227 = 3;
              int v228 = v84 + v227;
              v224 = v228;
              break;
            }
          }
          v218 = v224;
        }
        case 0:
          {
          int v229 = 96;
          int v230 = v229 + v84;
          int v231 = v83[v230];
          int v232 = 0;
          int v233;
          v233 = v232;
          switch (v231) {
            default:
              {
              int v234 = 0;
              int v235 = v84 + v234;
              v233 = v235;
              break;
            }
            case 0:
              {
              v233 = v84;
              break;
            }
          }
          v218 = v233;
        }
        case 1:
          {
          int v236 = 100;
          int v237 = v236 + v84;
          int v238 = v83[v237];
          int v239 = 3;
          int v240 = v84 + v239;
          int v241;
          v241 = v240;
          switch (v238) {
            case 0:
              {
              int v242 = 1;
              v241 = v242;
              break;
            }
            case 1:
              {
              int v243 = 4;
              v241 = v243;
              break;
            }
            case 2:
              {
              int v244 = 0;
              v241 = v244;
              break;
            }
            default:
              {
              int v245 = 4;
              v241 = v245;
              break;
            }
          }
          v218 = v241;
          break;
        }
      }
      bool v246 = true;
      v167 = v218;
      break;
    }
    case 2:
      {
      int v247 = 4;
      int v248 = v84 + v247;
      v167 = v248;
      break;
    }
  }
  bool v249 = true;
  int v250 = 32;
  int v251 = v250 + v84;
  bool v252 = true;
  int v253 = simt_wave_count_bits(v252);
  v82[v251] = v253;
  int v254 = 104;
  int v255 = v254 + v84;
  int v256 = v83[v255];
  int v257 = 0;
  int v258;
  v258 = v257;
  switch (v256) {
    case 0:
      {
      int v259 = 108;
      int v260 = v259 + v84;
      int v261 = v83[v260];
      int v262 = 0;
      bool v263 = v261 != v262;
      int v264;
      if (v263) {
        int v265 = 112;
        int v266 = v265 + v84;
        int v267 = v83[v266];
        int v268 = 4;
        int v269 = v84 + v268;
        int v270;
        v270 = v269;
        switch (v267) {
          case 0:
            {
            int v271 = 0;
            v270 = v271;
            break;
          }
          case 1:
            {
            int v272 = 4;
            int v273 = v84 + v272;
            v270 = v273;
          }
          case 2:
            {
            int v274 = 1;
            int v275 = v84 + v274;
            v270 = v275;
          }
          default:
            {
            int v276 = 1;
            v270 = v276;
            break;
          }
        }
        v264 = v270;
      } else {
        int v277 = 116;
        int v278 = v277 + v84;
        int v279 = v83[v278];
        int v280 = 0;
        bool v281 = v279 != v280;
        int v282;
        if (v281) {
          int v283 = 2;
          int v284 = v84 + v283;
          v282 = v284;
        } else {
          int v285 = 3;
          int v286 = v84 + v285;
          v282 = v286;
        }
        v264 = v282;
      }
      v258 = v264;
      break;
    }
    case 1:
      {
      int v287 = 0;
      int v288 = 0;
      int v289;
      int v290;
      v289 = v287;
      v290 = v288;
      while (true) {
        int v291 = 4;
        int v292 = v290 * v291;
        int v293 = v292 + v84;
        int v294 = 120;
        int v295 = v294 + v293;
        int v296 = v83[v295];
        int v297 = 0;
        bool v298 = v296 != v297;
        v289 = v289;
        v290 = v290;
        if (!v298) break;
        int v299 = v289 + v290;
        int v300 = 1;
        int v301 = v290 + v300;
        bool v302 = true;
        v289 = v299;
        v290 = v301;
      }
      v258 = v289;
      break;
    }
    case 2:
      {
      v258 = v84;
      break;
    }
    default:
      {
      v258 = v84;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
