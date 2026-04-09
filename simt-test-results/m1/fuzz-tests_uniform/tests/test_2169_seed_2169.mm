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
  bool v5 = v2 != v4;
  int v6;
  if (v5) {
    int v7 = 0;
    int v8 = 0;
    int v9;
    int v10;
    v9 = v7;
    v10 = v8;
    while (true) {
      int v11 = 4;
      int v12 = v3 % v11;
      int v13 = 1;
      int v14 = v12 + v13;
      bool v15 = v10 < v14;
      v9 = v9;
      v10 = v10;
      if (!v15) break;
      int v16 = 0;
      bool v17 = v2 != v16;
      int v18;
      if (v17) {
        uint v19 = simt_subgroup_id(__simt_tid);
        int v20 = (int)(v19);
        v18 = v20;
      } else {
        int v21 = 0;
        int v22 = v0 + v21;
        v18 = v22;
      }
      uint v23 = simt_lane_id(__simt_tid);
      int v24 = (int)(v23);
      int v25 = 1;
      int v26 = v10 + v25;
      v9 = v18;
      v10 = v26;
    }
    int v27 = 1;
    int v28 = v0 + v27;
    v6 = v9;
  } else {
    int v29;
    v29 = v0;
    switch (v3) {
      case 0:
        {
        int v30 = 0;
        bool v31 = v2 != v30;
        int v32;
        if (v31) {
          int v33 = 2;
          int v34 = v0 + v33;
          v32 = v34;
        } else {
          int v35 = 2;
          int v36 = v0 + v35;
          v32 = v36;
        }
        int v37 = 2;
        v29 = v32;
        break;
      }
      default:
        {
        int v38 = 0;
        bool v39 = v2 != v38;
        int v40;
        if (v39) {
          int v41 = 4;
          v40 = v41;
        } else {
          int v42 = 1;
          v40 = v42;
        }
        int v43 = 3;
        int v44 = v0 + v43;
        v29 = v40;
        break;
      }
    }
    int v45 = 2;
    v6 = v29;
  }
  bool v46 = true;
  int v47 = simt_wave_count_bits(v46);
  int v48 = 0;
  int v49 = v48 + v0;
  v1[v49] = v47;
  return;
}

kernel void kernel_main(device int* v50 [[buffer(0)]], device int* v51 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v52 = static_cast<int>(__simt_tid3.x);
  int v53 = 0;
  int v54 = v53 + v52;
  int v55 = v51[v54];
  int v56 = 4;
  int v57 = v56 + v52;
  int v58 = v51[v57];
  helper0(v52, v50, v55, v58, static_cast<int>(__simt_tid3.x));
  int v59 = 8;
  int v60 = v59 + v52;
  int v61 = v51[v60];
  uint v62 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v63 = (int)(v62);
  int v64;
  v64 = v63;
  switch (v61) {
    case 0:
      {
      int v65 = 2;
      v64 = v65;
      break;
    }
    case 1:
      {
      int v66 = 12;
      int v67 = v66 + v52;
      int v68 = v51[v67];
      int v69 = 3;
      int v70 = v52 + v69;
      int v71;
      v71 = v70;
      switch (v68) {
        case 0:
          {
          int v72 = 16;
          int v73 = v72 + v52;
          int v74 = v51[v73];
          int v75 = 0;
          int v76 = v52 + v75;
          int v77;
          v77 = v76;
          switch (v74) {
            case 0:
              {
              int v78 = 2;
              int v79 = v52 + v78;
              v77 = v79;
              break;
            }
            default:
              {
              v77 = v52;
              break;
            }
          }
          bool v80 = true;
          v71 = v77;
          break;
        }
        default:
          {
          int v81 = 0;
          int v82 = 0;
          int v83;
          int v84;
          v83 = v81;
          v84 = v82;
          while (true) {
            int v85 = 4;
            int v86 = v84 * v85;
            int v87 = v86 + v52;
            int v88 = 20;
            int v89 = v88 + v87;
            int v90 = v51[v89];
            int v91 = 0;
            bool v92 = v90 != v91;
            v83 = v83;
            v84 = v84;
            if (!v92) break;
            int v93 = v83 + v84;
            int v94 = 1;
            int v95 = v84 + v94;
            v83 = v93;
            v84 = v95;
            break;
            ;
          }
          bool v96 = true;
          v71 = v83;
          break;
        }
        case 1:
          {
          int v97 = 0;
          int v98 = v52 + v97;
          v71 = v98;
        }
        case 2:
          {
          v71 = v52;
          break;
        }
      }
      bool v99 = true;
      v64 = v71;
      break;
    }
    case 2:
      {
      int v100 = 40;
      int v101 = v100 + v52;
      int v102 = v51[v101];
      int v103 = 3;
      int v104 = v52 + v103;
      int v105;
      v105 = v104;
      switch (v102) {
        case 0:
          {
          int v106 = 44;
          int v107 = v106 + v52;
          int v108 = v51[v107];
          int v109 = 0;
          int v110 = v52 + v109;
          int v111;
          v111 = v110;
          switch (v108) {
            case 0:
              {
              int v112 = 3;
              v111 = v112;
              break;
            }
            default:
              {
              int v113 = 3;
              v111 = v113;
            }
            case 1:
              {
              int v114 = 2;
              v111 = v114;
            }
            case 2:
              {
              v111 = v52;
              break;
            }
          }
          bool v115 = true;
          v105 = v111;
        }
        case 1:
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
            int v122 = v121 + v52;
            int v123 = 48;
            int v124 = v123 + v122;
            int v125 = v51[v124];
            int v126 = 0;
            bool v127 = v125 != v126;
            v118 = v118;
            v119 = v119;
            if (!v127) break;
            int v128 = v118 + v119;
            int v129 = 1;
            int v130 = v119 + v129;
            v118 = v128;
            v119 = v130;
            break;
            ;
          }
          bool v131 = true;
          v105 = v118;
        }
        case 2:
          {
          v105 = v52;
        }
        default:
          {
          int v132 = 68;
          int v133 = v132 + v52;
          int v134 = v51[v133];
          int v135 = 0;
          bool v136 = v134 != v135;
          int v137;
          if (v136) {
            v137 = v52;
          } else {
            int v138 = 0;
            v137 = v138;
          }
          v105 = v137;
          break;
        }
      }
      bool v139 = true;
      v64 = v105;
      break;
    }
    default:
      {
      int v140 = 1;
      int v141 = v52 + v140;
      v64 = v141;
      break;
    }
  }
  bool v142 = true;
  int v143 = 16;
  int v144 = v143 + v52;
  bool v145 = true;
  int v146 = simt_wave_count_bits(v145);
  v50[v144] = v146;
  int v147 = 72;
  int v148 = v147 + v52;
  int v149 = v51[v148];
  uint v150 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v151 = (int)(v150);
  int v152;
  v152 = v151;
  switch (v149) {
    default:
      {
      int v153 = 76;
      int v154 = v153 + v52;
      int v155 = v51[v154];
      int v156 = 0;
      bool v157 = v155 != v156;
      int v158;
      if (v157) {
        int v159 = 1;
        v158 = v159;
      } else {
        int v160 = 80;
        int v161 = v160 + v52;
        int v162 = v51[v161];
        int v163 = 0;
        int v164;
        v164 = v163;
        switch (v162) {
          case 0:
            {
            v164 = v52;
            break;
          }
          case 1:
            {
            int v165 = 4;
            v164 = v165;
          }
          case 2:
            {
            int v166 = 3;
            int v167 = v52 + v166;
            v164 = v167;
            break;
          }
          default:
            {
            int v168 = 0;
            int v169 = v52 + v168;
            v164 = v169;
            break;
          }
        }
        bool v170 = true;
        v158 = v164;
      }
      v152 = v158;
      break;
    }
    case 0:
      {
      int v171 = 84;
      int v172 = v171 + v52;
      int v173 = v51[v172];
      int v174 = 2;
      int v175 = v52 + v174;
      int v176;
      v176 = v175;
      switch (v173) {
        case 0:
          {
          int v177 = 88;
          int v178 = v177 + v52;
          int v179 = v51[v178];
          int v180 = 3;
          int v181 = v52 + v180;
          int v182;
          v182 = v181;
          switch (v179) {
            case 0:
              {
              int v183 = 4;
              int v184 = v52 + v183;
              v182 = v184;
            }
            case 1:
              {
              int v185 = 2;
              v182 = v185;
              break;
            }
            default:
              {
              int v186 = 0;
              v182 = v186;
              break;
            }
          }
          bool v187 = true;
          v176 = v182;
          break;
        }
        default:
          {
          int v188 = 0;
          int v189 = 0;
          int v190;
          int v191;
          v190 = v188;
          v191 = v189;
          while (true) {
            int v192 = 4;
            int v193 = v191 * v192;
            int v194 = v193 + v52;
            int v195 = 92;
            int v196 = v195 + v194;
            int v197 = v51[v196];
            int v198 = 0;
            bool v199 = v197 != v198;
            v190 = v190;
            v191 = v191;
            if (!v199) break;
            int v200 = v190 + v191;
            int v201 = 1;
            int v202 = v191 + v201;
            v190 = v200;
            v191 = v202;
          }
          bool v203 = true;
          v176 = v190;
          break;
        }
        case 1:
          {
          int v204 = 112;
          int v205 = v204 + v52;
          int v206 = v51[v205];
          int v207 = 4;
          int v208;
          v208 = v207;
          switch (v206) {
            case 0:
              {
              v208 = v52;
              break;
            }
            default:
              {
              int v209 = 4;
              int v210 = v52 + v209;
              v208 = v210;
              break;
            }
          }
          bool v211 = true;
          v176 = v208;
          break;
        }
        case 2:
          {
          int v212 = 116;
          int v213 = v212 + v52;
          int v214 = v51[v213];
          int v215 = 0;
          bool v216 = v214 != v215;
          int v217;
          if (v216) {
            v217 = v52;
          } else {
            int v218 = 2;
            int v219 = v52 + v218;
            v217 = v219;
          }
          v176 = v217;
          break;
        }
      }
      bool v220 = true;
      v152 = v176;
    }
    case 1:
      {
      int v221 = 120;
      int v222 = v221 + v52;
      int v223 = v51[v222];
      int v224 = 0;
      bool v225 = v223 != v224;
      int v226;
      if (v225) {
        int v227 = 124;
        int v228 = v227 + v52;
        int v229 = v51[v228];
        int v230 = 0;
        int v231;
        v231 = v230;
        switch (v229) {
          default:
            {
            v231 = v52;
          }
          case 0:
            {
            int v232 = 2;
            v231 = v232;
            break;
          }
        }
        bool v233 = true;
        v226 = v231;
      } else {
        int v234 = 128;
        int v235 = v234 + v52;
        int v236 = v51[v235];
        int v237 = 0;
        int v238;
        v238 = v237;
        switch (v236) {
          case 0:
            {
            int v239 = 4;
            v238 = v239;
            break;
          }
          case 1:
            {
            int v240 = 0;
            int v241 = v52 + v240;
            v238 = v241;
            break;
          }
          case 2:
            {
            v238 = v52;
            break;
          }
          default:
            {
            v238 = v52;
            break;
          }
        }
        bool v242 = true;
        v226 = v238;
      }
      v152 = v226;
      break;
    }
    case 2:
      {
      int v243 = 132;
      int v244 = v243 + v52;
      int v245 = v51[v244];
      int v246 = 4;
      int v247;
      v247 = v246;
      switch (v245) {
        default:
          {
          int v248 = 136;
          int v249 = v248 + v52;
          int v250 = v51[v249];
          int v251 = 0;
          bool v252 = v250 != v251;
          int v253;
          if (v252) {
            int v254 = 4;
            v253 = v254;
          } else {
            v253 = v52;
          }
          v247 = v253;
          break;
        }
        case 0:
          {
          int v255 = 140;
          int v256 = v255 + v52;
          int v257 = v51[v256];
          int v258 = 3;
          int v259;
          v259 = v258;
          switch (v257) {
            default:
              {
              v259 = v52;
              break;
            }
            case 0:
              {
              v259 = v52;
              break;
            }
          }
          bool v260 = true;
          v247 = v259;
          break;
        }
      }
      bool v261 = true;
      v152 = v247;
      break;
    }
  }
  bool v262 = true;
  int v263 = 32;
  int v264 = v263 + v52;
  bool v265 = true;
  int v266 = simt_wave_count_bits(v265);
  v50[v264] = v266;
  int v267 = 144;
  int v268 = v267 + v52;
  int v269 = v51[v268];
  int v270 = 0;
  bool v271 = v269 != v270;
  int v272;
  if (v271) {
    int v273 = 0;
    int v274 = 0;
    int v275;
    int v276;
    v275 = v273;
    v276 = v274;
    while (true) {
      int v277 = 4;
      int v278 = v276 * v277;
      int v279 = v278 + v52;
      int v280 = 148;
      int v281 = v280 + v279;
      int v282 = v51[v281];
      int v283 = 0;
      bool v284 = v282 != v283;
      v275 = v275;
      v276 = v276;
      if (!v284) break;
      int v285 = 168;
      int v286 = v285 + v52;
      int v287 = v51[v286];
      int v288 = 3;
      int v289;
      v289 = v288;
      switch (v287) {
        case 0:
          {
          int v290 = 2;
          int v291 = v52 + v290;
          v289 = v291;
        }
        default:
          {
          int v292 = 0;
          int v293 = v52 + v292;
          v289 = v293;
          break;
        }
      }
      bool v294 = true;
      int v295 = v275 + v289;
      int v296 = 1;
      int v297 = v276 + v296;
      v275 = v295;
      v276 = v297;
      continue;
      ;
    }
    bool v298 = true;
    v272 = v275;
  } else {
    int v299 = 2;
    v272 = v299;
  }
  int v300 = 48;
  int v301 = v300 + v52;
  bool v302 = true;
  int v303 = simt_wave_count_bits(v302);
  v50[v301] = v303;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 172; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
