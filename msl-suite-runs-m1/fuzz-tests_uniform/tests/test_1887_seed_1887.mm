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
  int v5 = 0;
  bool v6 = v2 != v5;
  int v7;
  if (v6) {
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
        int v26 = 3;
        int v27 = v0 + v26;
        int v28 = 1;
        int v29 = v20 + v28;
        v19 = v27;
        v20 = v29;
      }
      uint v30 = simt_subgroup_id(__simt_tid);
      int v31 = (int)(v30);
      int v32 = 1;
      int v33 = v11 + v32;
      v10 = v19;
      v11 = v33;
    }
    uint v34 = simt_subgroup_id(__simt_tid);
    int v35 = (int)(v34);
    v7 = v10;
  } else {
    int v36 = 0;
    bool v37 = v2 != v36;
    int v38;
    if (v37) {
      uint v39 = simt_lane_id(__simt_tid);
      int v40 = (int)(v39);
      v38 = v40;
    } else {
      int v41 = 0;
      bool v42 = v2 != v41;
      int v43;
      if (v42) {
        int v44 = 4;
        v43 = v44;
      } else {
        uint v45 = simt_lane_id(__simt_tid);
        int v46 = (int)(v45);
        v43 = v46;
      }
      int v47 = 2;
      v38 = v43;
    }
    int v48 = 3;
    int v49 = v0 + v48;
    v7 = v38;
  }
  bool v50 = true;
  int v51 = simt_wave_count_bits(v50);
  int v52 = 0;
  int v53 = v52 + v0;
  v1[v53] = v51;
  int v54 = 0;
  bool v55 = v2 != v54;
  int v56 = v55 ? v4 : v7;
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
  int v69 = 0;
  bool v70 = v68 != v69;
  int v71;
  if (v70) {
    int v72 = 12;
    int v73 = v72 + v59;
    int v74 = v58[v73];
    int v75;
    v75 = v59;
    switch (v74) {
      default:
        {
        int v76 = 2;
        v75 = v76;
        break;
      }
      case 0:
        {
        int v77 = 16;
        int v78 = v77 + v59;
        int v79 = v58[v78];
        int v80;
        v80 = v59;
        switch (v79) {
          case 0:
            {
            int v81 = 1;
            int v82 = v59 + v81;
            v80 = v82;
            break;
          }
          default:
            {
            int v83 = 2;
            v80 = v83;
            break;
          }
          case 1:
            {
            int v84 = 0;
            v80 = v84;
            break;
          }
          case 2:
            {
            int v85 = 0;
            v80 = v85;
            break;
          }
        }
        bool v86 = true;
        v75 = v80;
        break;
      }
      case 1:
        {
        int v87 = 1;
        v75 = v87;
        break;
      }
    }
    bool v88 = true;
    v71 = v75;
  } else {
    int v89 = 20;
    int v90 = v89 + v59;
    int v91 = v58[v90];
    int v92 = 0;
    bool v93 = v91 != v92;
    int v94;
    if (v93) {
      int v95 = 24;
      int v96 = v95 + v59;
      int v97 = v58[v96];
      int v98 = 3;
      int v99 = v59 + v98;
      int v100;
      v100 = v99;
      switch (v97) {
        case 0:
          {
          int v101 = 4;
          int v102 = v59 + v101;
          v100 = v102;
          break;
        }
        default:
          {
          int v103 = 1;
          v100 = v103;
          break;
        }
        case 1:
          {
          int v104 = 0;
          int v105 = v59 + v104;
          v100 = v105;
          break;
        }
      }
      bool v106 = true;
      v94 = v100;
    } else {
      int v107 = 28;
      int v108 = v107 + v59;
      int v109 = v58[v108];
      int v110 = 0;
      bool v111 = v109 != v110;
      int v112;
      if (v111) {
        uint v113 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v114 = (int)(v113);
        v112 = v114;
      } else {
        v112 = v59;
      }
      v94 = v112;
    }
    v71 = v94;
  }
  int v115 = 16;
  int v116 = v115 + v59;
  bool v117 = true;
  int v118 = simt_wave_count_bits(v117);
  v57[v116] = v118;
  int v119 = 32;
  int v120 = v119 + v59;
  int v121 = v58[v120];
  int v122;
  v122 = v59;
  switch (v121) {
    case 0:
      {
      int v123 = 36;
      int v124 = v123 + v59;
      int v125 = v58[v124];
      int v126 = 0;
      bool v127 = v125 != v126;
      int v128;
      if (v127) {
        int v129 = 40;
        int v130 = v129 + v59;
        int v131 = v58[v130];
        int v132 = 3;
        int v133 = v59 + v132;
        int v134;
        v134 = v133;
        switch (v131) {
          default:
            {
            int v135 = 2;
            v134 = v135;
          }
          case 0:
            {
            v134 = v59;
          }
          case 1:
            {
            int v136 = 1;
            int v137 = v59 + v136;
            v134 = v137;
            break;
          }
        }
        bool v138 = true;
        v128 = v134;
      } else {
        int v139 = 44;
        int v140 = v139 + v59;
        int v141 = v58[v140];
        int v142 = 0;
        bool v143 = v141 != v142;
        int v144;
        if (v143) {
          v144 = v59;
        } else {
          int v145 = 0;
          int v146 = v59 + v145;
          v144 = v146;
        }
        v128 = v144;
      }
      v122 = v128;
      break;
    }
    case 1:
      {
      int v147 = 0;
      int v148 = 0;
      int v149;
      int v150;
      v149 = v147;
      v150 = v148;
      while (true) {
        int v151 = 4;
        int v152 = v150 * v151;
        int v153 = v152 + v59;
        int v154 = 48;
        int v155 = v154 + v153;
        int v156 = v58[v155];
        int v157 = 0;
        bool v158 = v156 != v157;
        v149 = v149;
        v150 = v150;
        if (!v158) break;
        int v159 = 68;
        int v160 = v159 + v59;
        int v161 = v58[v160];
        int v162 = 0;
        bool v163 = v161 != v162;
        int v164;
        if (v163) {
          v164 = v59;
        } else {
          int v165 = 1;
          v164 = v165;
        }
        int v166 = v149 + v164;
        int v167 = 1;
        int v168 = v150 + v167;
        v149 = v166;
        v150 = v168;
        continue;
        ;
      }
      bool v169 = true;
      v122 = v149;
    }
    case 2:
      {
      int v170 = 72;
      int v171 = v170 + v59;
      int v172 = v58[v171];
      int v173;
      v173 = v59;
      switch (v172) {
        case 0:
          {
          int v174 = 76;
          int v175 = v174 + v59;
          int v176 = v58[v175];
          int v177 = 0;
          bool v178 = v176 != v177;
          int v179;
          if (v178) {
            int v180 = 2;
            int v181 = v59 + v180;
            v179 = v181;
          } else {
            int v182 = 4;
            int v183 = v59 + v182;
            v179 = v183;
          }
          v173 = v179;
          break;
        }
        default:
          {
          int v184 = 0;
          int v185 = 0;
          int v186;
          int v187;
          v186 = v184;
          v187 = v185;
          while (true) {
            int v188 = 4;
            int v189 = v187 * v188;
            int v190 = v189 + v59;
            int v191 = 80;
            int v192 = v191 + v190;
            int v193 = v58[v192];
            int v194 = 0;
            bool v195 = v193 != v194;
            v186 = v186;
            v187 = v187;
            if (!v195) break;
            int v196 = v186 + v187;
            int v197 = 1;
            int v198 = v187 + v197;
            v186 = v196;
            v187 = v198;
            break;
            ;
          }
          bool v199 = true;
          v173 = v186;
          break;
        }
        case 1:
          {
          int v200 = 100;
          int v201 = v200 + v59;
          int v202 = v58[v201];
          int v203 = 0;
          bool v204 = v202 != v203;
          int v205;
          if (v204) {
            int v206 = 2;
            int v207 = v59 + v206;
            v205 = v207;
          } else {
            int v208 = 3;
            v205 = v208;
          }
          v173 = v205;
          break;
        }
      }
      bool v209 = true;
      v122 = v173;
    }
    default:
      {
      int v210 = 104;
      int v211 = v210 + v59;
      int v212 = v58[v211];
      int v213 = 2;
      int v214;
      v214 = v213;
      switch (v212) {
        case 0:
          {
          v214 = v59;
          break;
        }
        default:
          {
          int v215 = 108;
          int v216 = v215 + v59;
          int v217 = v58[v216];
          int v218 = 0;
          int v219;
          v219 = v218;
          switch (v217) {
            default:
              {
              v219 = v59;
              break;
            }
            case 0:
              {
              int v220 = 4;
              v219 = v220;
              break;
            }
          }
          bool v221 = true;
          v214 = v219;
          break;
        }
      }
      bool v222 = true;
      v122 = v214;
      break;
    }
  }
  bool v223 = true;
  int v224 = 32;
  int v225 = v224 + v59;
  bool v226 = true;
  int v227 = simt_wave_count_bits(v226);
  v57[v225] = v227;
  int v228 = 112;
  int v229 = v228 + v59;
  int v230 = v58[v229];
  int v231 = 2;
  int v232;
  v232 = v231;
  switch (v230) {
    case 0:
      {
      int v233 = 4;
      int v234 = v59 + v233;
      v232 = v234;
      break;
    }
    case 1:
      {
      int v235 = 116;
      int v236 = v235 + v59;
      int v237 = v58[v236];
      int v238 = 1;
      int v239 = v59 + v238;
      int v240;
      v240 = v239;
      switch (v237) {
        case 0:
          {
          int v241 = 120;
          int v242 = v241 + v59;
          int v243 = v58[v242];
          int v244 = 0;
          bool v245 = v243 != v244;
          int v246;
          if (v245) {
            int v247 = 4;
            int v248 = v59 + v247;
            v246 = v248;
          } else {
            v246 = v59;
          }
          v240 = v246;
        }
        case 1:
          {
          int v249 = 124;
          int v250 = v249 + v59;
          int v251 = v58[v250];
          int v252 = 2;
          int v253;
          v253 = v252;
          switch (v251) {
            default:
              {
              int v254 = 4;
              int v255 = v59 + v254;
              v253 = v255;
            }
            case 0:
              {
              int v256 = 1;
              int v257 = v59 + v256;
              v253 = v257;
            }
            case 1:
              {
              v253 = v59;
              break;
            }
          }
          bool v258 = true;
          v240 = v253;
          break;
        }
        default:
          {
          int v259 = 128;
          int v260 = v259 + v59;
          int v261 = v58[v260];
          int v262 = 0;
          bool v263 = v261 != v262;
          int v264;
          if (v263) {
            int v265 = 4;
            v264 = v265;
          } else {
            int v266 = 4;
            int v267 = v59 + v266;
            v264 = v267;
          }
          v240 = v264;
          break;
        }
      }
      bool v268 = true;
      v232 = v240;
      break;
    }
    default:
      {
      int v269 = 132;
      int v270 = v269 + v59;
      int v271 = v58[v270];
      int v272 = 0;
      int v273 = v59 + v272;
      int v274;
      v274 = v273;
      switch (v271) {
        case 0:
          {
          int v275 = 1;
          int v276 = v59 + v275;
          v274 = v276;
          break;
        }
        case 1:
          {
          int v277 = 136;
          int v278 = v277 + v59;
          int v279 = v58[v278];
          int v280 = 0;
          bool v281 = v279 != v280;
          int v282;
          if (v281) {
            int v283 = 1;
            v282 = v283;
          } else {
            v282 = v59;
          }
          v274 = v282;
          break;
        }
        default:
          {
          v274 = v59;
          break;
        }
        case 2:
          {
          int v284 = 140;
          int v285 = v284 + v59;
          int v286 = v58[v285];
          int v287 = 1;
          int v288;
          v288 = v287;
          switch (v286) {
            case 0:
              {
              int v289 = 0;
              v288 = v289;
              break;
            }
            default:
              {
              int v290 = 0;
              int v291 = v59 + v290;
              v288 = v291;
              break;
            }
            case 1:
              {
              int v292 = 0;
              int v293 = v59 + v292;
              v288 = v293;
              break;
            }
            case 2:
              {
              v288 = v59;
              break;
            }
          }
          bool v294 = true;
          v274 = v288;
          break;
        }
      }
      bool v295 = true;
      v232 = v274;
      break;
    }
  }
  bool v296 = true;
  int v297 = 48;
  int v298 = v297 + v59;
  bool v299 = true;
  int v300 = simt_wave_count_bits(v299);
  v57[v298] = v300;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 144; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
