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
  int v6 = 4;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 1;
      v8 = v9;
      break;
    }
    case 0:
      {
      int v10 = 0;
      int v11 = v0 + v10;
      v8 = v11;
      break;
    }
  }
  int v12 = 0;
  int v13 = 0;
  int v14;
  int v15;
  v14 = v12;
  v15 = v13;
  while (true) {
    int v16 = 4;
    int v17 = v3 % v16;
    int v18 = 1;
    int v19 = v17 + v18;
    bool v20 = v15 < v19;
    v14 = v14;
    v15 = v15;
    if (!v20) break;
    bool v21 = true;
    int v22 = simt_wave_count_bits(v21);
    int v23 = 0;
    int v24 = 4;
    int v25 = v15 * v24;
    int v26 = v23 + v25;
    int v27 = v26 + v0;
    v1[v27] = v22;
    int v28 = 1;
    int v29 = v15 + v28;
    v14 = v22;
    v15 = v29;
  }
  int v30 = 0;
  bool v31 = v2 != v30;
  int v32 = v31 ? v8 : v14;
  int v33 = 0;
  bool v34 = v2 != v33;
  int v35;
  if (v34) {
    int v36 = 0;
    bool v37 = v2 != v36;
    int v38;
    if (v37) {
      bool v39 = true;
      int v40 = simt_wave_count_bits(v39);
      int v41 = 16;
      int v42 = v41 + v0;
      v1[v42] = v40;
      v38 = v40;
    } else {
      int v43 = 2;
      int v44 = v3 % v43;
      int v45 = 0;
      int v46 = v0 + v45;
      int v47;
      v47 = v46;
      switch (v44) {
        case 0:
          {
          int v48 = 4;
          v47 = v48;
          break;
        }
        default:
          {
          int v49 = 4;
          int v50 = v0 + v49;
          v47 = v50;
          break;
        }
        case 1:
          {
          int v51 = 4;
          int v52 = v0 + v51;
          v47 = v52;
          break;
        }
      }
      v38 = v47;
    }
    v35 = v38;
  } else {
    int v53 = 0;
    int v54 = 0;
    int v55;
    int v56;
    v55 = v53;
    v56 = v54;
    while (true) {
      int v57 = 4;
      int v58 = v3 % v57;
      int v59 = 1;
      int v60 = v58 + v59;
      bool v61 = v56 < v60;
      v55 = v55;
      v56 = v56;
      if (!v61) break;
      bool v62 = true;
      int v63 = simt_wave_count_bits(v62);
      int v64 = 32;
      int v65 = 4;
      int v66 = v56 * v65;
      int v67 = v64 + v66;
      int v68 = v67 + v0;
      v1[v68] = v63;
      int v69 = 1;
      int v70 = v56 + v69;
      v55 = v63;
      v56 = v70;
    }
    v35 = v55;
  }
  int v71 = 0;
  bool v72 = v2 != v71;
  int v73 = v72 ? v32 : v35;
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
    int v85 = 8;
    int v86 = v85 + v76;
    int v87 = v75[v86];
    int v88 = 0;
    bool v89 = v87 != v88;
    if (v89) {
    } else {
      helper0(v76, v74, v79, v82, static_cast<int>(__simt_tid3.x));
    }
  } else {
  }
  int v90 = 12;
  int v91 = v90 + v76;
  int v92 = v75[v91];
  uint v93 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v94 = (int)(v93);
  int v95;
  v95 = v94;
  switch (v92) {
    default:
      {
      int v96 = 16;
      int v97 = v96 + v76;
      int v98 = v75[v97];
      int v99 = 1;
      int v100;
      v100 = v99;
      switch (v98) {
        case 0:
          {
          int v101 = 20;
          int v102 = v101 + v76;
          int v103 = v75[v102];
          int v104 = 1;
          int v105;
          v105 = v104;
          switch (v103) {
            default:
              {
              int v106 = 1;
              v105 = v106;
              break;
            }
            case 0:
              {
              v105 = v76;
              break;
            }
            case 1:
              {
              int v107 = 1;
              v105 = v107;
              break;
            }
          }
          v100 = v105;
          break;
        }
        case 1:
          {
          int v108 = 24;
          int v109 = v108 + v76;
          int v110 = v75[v109];
          int v111 = 0;
          bool v112 = v110 != v111;
          int v113;
          if (v112) {
            v113 = v76;
          } else {
            int v114 = 3;
            int v115 = v76 + v114;
            v113 = v115;
          }
          v100 = v113;
          break;
        }
        case 2:
          {
          int v116 = 0;
          int v117 = 0;
          int v118;
          int v119;
          v118 = v116;
          v119 = v117;
          while (true) {
            int v120 = 4;
            int v121 = v119 * v120;
            int v122 = v121 + v76;
            int v123 = 28;
            int v124 = v123 + v122;
            int v125 = v75[v124];
            int v126 = 0;
            bool v127 = v125 != v126;
            v118 = v118;
            v119 = v119;
            if (!v127) break;
            int v128 = v118 + v119;
            int v129 = 1;
            int v130 = v119 + v129;
            bool v131 = true;
            v118 = v128;
            v119 = v130;
            break;
            ;
          }
          v100 = v118;
          break;
        }
        default:
          {
          int v132 = 48;
          int v133 = v132 + v76;
          int v134 = v75[v133];
          int v135 = 0;
          bool v136 = v134 != v135;
          int v137;
          if (v136) {
            v137 = v76;
          } else {
            int v138 = 2;
            v137 = v138;
          }
          v100 = v137;
          break;
        }
      }
      v95 = v100;
      break;
    }
    case 0:
      {
      int v139 = 52;
      int v140 = v139 + v76;
      int v141 = v75[v140];
      int v142 = 0;
      bool v143 = v141 != v142;
      int v144;
      if (v143) {
        int v145 = 0;
        int v146 = 0;
        int v147;
        int v148;
        v147 = v145;
        v148 = v146;
        while (true) {
          int v149 = 4;
          int v150 = v148 * v149;
          int v151 = v150 + v76;
          int v152 = 56;
          int v153 = v152 + v151;
          int v154 = v75[v153];
          int v155 = 0;
          bool v156 = v154 != v155;
          v147 = v147;
          v148 = v148;
          if (!v156) break;
          int v157 = v147 + v148;
          int v158 = 1;
          int v159 = v148 + v158;
          bool v160 = true;
          v147 = v157;
          v148 = v159;
          continue;
          ;
        }
        v144 = v147;
      } else {
        int v161 = 76;
        int v162 = v161 + v76;
        int v163 = v75[v162];
        int v164;
        v164 = v76;
        switch (v163) {
          default:
            {
            int v165 = 3;
            int v166 = v76 + v165;
            v164 = v166;
            break;
          }
          case 0:
            {
            v164 = v76;
            break;
          }
          case 1:
            {
            int v167 = 4;
            int v168 = v76 + v167;
            v164 = v168;
            break;
          }
        }
        bool v169 = true;
        v144 = v164;
      }
      v95 = v144;
      break;
    }
    case 1:
      {
      int v170 = 0;
      int v171 = 0;
      int v172;
      int v173;
      v172 = v170;
      v173 = v171;
      while (true) {
        int v174 = 4;
        int v175 = v173 * v174;
        int v176 = v175 + v76;
        int v177 = 80;
        int v178 = v177 + v176;
        int v179 = v75[v178];
        int v180 = 0;
        bool v181 = v179 != v180;
        v172 = v172;
        v173 = v173;
        if (!v181) break;
        int v182 = 100;
        int v183 = v182 + v76;
        int v184 = v75[v183];
        int v185 = 0;
        bool v186 = v184 != v185;
        int v187;
        if (v186) {
          v187 = v76;
        } else {
          int v188 = 0;
          v187 = v188;
        }
        int v189 = v172 + v187;
        int v190 = 1;
        int v191 = v173 + v190;
        bool v192 = true;
        v172 = v189;
        v173 = v191;
        break;
        ;
      }
      v95 = v172;
      break;
    }
  }
  int v193 = 104;
  int v194 = v193 + v76;
  int v195 = v75[v194];
  int v196;
  v196 = v76;
  switch (v195) {
    case 0:
      {
      int v197 = 108;
      int v198 = v197 + v76;
      int v199 = v75[v198];
      int v200 = 4;
      int v201;
      v201 = v200;
      switch (v199) {
        default:
          {
          v201 = v76;
          break;
        }
        case 0:
          {
          int v202 = 112;
          int v203 = v202 + v76;
          int v204 = v75[v203];
          int v205;
          v205 = v76;
          switch (v204) {
            default:
              {
              int v206 = 0;
              int v207 = v76 + v206;
              v205 = v207;
              break;
            }
            case 0:
              {
              v205 = v76;
              break;
            }
          }
          v201 = v205;
          break;
        }
        case 1:
          {
          int v208 = 3;
          v201 = v208;
          break;
        }
        case 2:
          {
          int v209 = 4;
          int v210 = v76 + v209;
          v201 = v210;
          break;
        }
      }
      bool v211 = true;
      v196 = v201;
    }
    case 1:
      {
      int v212 = 4;
      v196 = v212;
    }
    default:
      {
      int v213 = 116;
      int v214 = v213 + v76;
      int v215 = v75[v214];
      int v216;
      v216 = v76;
      switch (v215) {
        case 0:
          {
          int v217 = 0;
          int v218 = 0;
          int v219;
          int v220;
          v219 = v217;
          v220 = v218;
          while (true) {
            int v221 = 4;
            int v222 = v220 * v221;
            int v223 = v222 + v76;
            int v224 = 120;
            int v225 = v224 + v223;
            int v226 = v75[v225];
            int v227 = 0;
            bool v228 = v226 != v227;
            v219 = v219;
            v220 = v220;
            if (!v228) break;
            int v229 = v219 + v220;
            int v230 = 1;
            int v231 = v220 + v230;
            bool v232 = true;
            v219 = v229;
            v220 = v231;
            continue;
            ;
          }
          v216 = v219;
          break;
        }
        default:
          {
          int v233 = 140;
          int v234 = v233 + v76;
          int v235 = v75[v234];
          int v236 = 0;
          bool v237 = v235 != v236;
          int v238;
          if (v237) {
            v238 = v76;
          } else {
            int v239 = 3;
            v238 = v239;
          }
          v216 = v238;
          break;
        }
      }
      v196 = v216;
      break;
    }
  }
  int v240 = 144;
  int v241 = v240 + v76;
  int v242 = v75[v241];
  uint v243 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v244 = (int)(v243);
  int v245;
  v245 = v244;
  switch (v242) {
    case 0:
      {
      v245 = v76;
    }
    case 1:
      {
      int v246 = 148;
      int v247 = v246 + v76;
      int v248 = v75[v247];
      int v249 = 0;
      bool v250 = v248 != v249;
      int v251;
      if (v250) {
        int v252 = 0;
        int v253 = 0;
        int v254;
        int v255;
        v254 = v252;
        v255 = v253;
        while (true) {
          int v256 = 4;
          int v257 = v255 * v256;
          int v258 = v257 + v76;
          int v259 = 152;
          int v260 = v259 + v258;
          int v261 = v75[v260];
          int v262 = 0;
          bool v263 = v261 != v262;
          v254 = v254;
          v255 = v255;
          if (!v263) break;
          int v264 = v254 + v255;
          int v265 = 1;
          int v266 = v255 + v265;
          bool v267 = true;
          v254 = v264;
          v255 = v266;
        }
        v251 = v254;
      } else {
        int v268 = 0;
        int v269 = 0;
        int v270;
        int v271;
        v270 = v268;
        v271 = v269;
        while (true) {
          int v272 = 4;
          int v273 = v271 * v272;
          int v274 = v273 + v76;
          int v275 = 172;
          int v276 = v275 + v274;
          int v277 = v75[v276];
          int v278 = 0;
          bool v279 = v277 != v278;
          v270 = v270;
          v271 = v271;
          if (!v279) break;
          int v280 = v270 + v271;
          int v281 = 1;
          int v282 = v271 + v281;
          bool v283 = true;
          v270 = v280;
          v271 = v282;
        }
        v251 = v270;
      }
      v245 = v251;
      break;
    }
    default:
      {
      int v284 = 192;
      int v285 = v284 + v76;
      int v286 = v75[v285];
      int v287 = 0;
      bool v288 = v286 != v287;
      int v289;
      if (v288) {
        int v290 = 0;
        int v291 = 0;
        int v292;
        int v293;
        v292 = v290;
        v293 = v291;
        while (true) {
          int v294 = 4;
          int v295 = v293 * v294;
          int v296 = v295 + v76;
          int v297 = 196;
          int v298 = v297 + v296;
          int v299 = v75[v298];
          int v300 = 0;
          bool v301 = v299 != v300;
          v292 = v292;
          v293 = v293;
          if (!v301) break;
          int v302 = v292 + v293;
          int v303 = 1;
          int v304 = v293 + v303;
          bool v305 = true;
          v292 = v302;
          v293 = v304;
        }
        v289 = v292;
      } else {
        int v306 = 4;
        v289 = v306;
      }
      v245 = v289;
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
    static int32_t expected0[] = {};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 0; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 216; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
