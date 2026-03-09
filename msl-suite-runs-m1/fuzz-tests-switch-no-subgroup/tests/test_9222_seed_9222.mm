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
    bool v13 = true;
    int v14 = simt_wave_count_bits(v13);
    int v15 = 0;
    int v16 = 4;
    int v17 = v7 * v16;
    int v18 = v15 + v17;
    int v19 = v18 + v0;
    v1[v19] = v14;
    int v20 = 1;
    int v21 = v7 + v20;
    v6 = v14;
    v7 = v21;
  }
  int v22 = 0;
  int v23;
  v23 = v22;
  switch (v3) {
    case 0:
      {
      int v24 = 1;
      int v25 = v0 + v24;
      v23 = v25;
    }
    default:
      {
      int v26 = 3;
      int v27 = v0 + v26;
      v23 = v27;
      break;
    }
  }
  int v28 = 0;
  bool v29 = v2 != v28;
  int v30 = v29 ? v6 : v23;
  int v31 = 3;
  int v32 = v3 % v31;
  uint v33 = simt_subgroup_id(__simt_tid);
  int v34 = (int)(v33);
  int v35;
  v35 = v34;
  switch (v32) {
    case 0:
      {
      int v36 = 0;
      int v37 = v0 + v36;
      v35 = v37;
    }
    case 1:
      {
      int v38 = 0;
      bool v39 = v2 != v38;
      int v40;
      if (v39) {
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
          int v50 = 4;
          int v51 = 1;
          int v52 = v44 + v51;
          v43 = v50;
          v44 = v52;
        }
        v40 = v43;
      } else {
        int v53 = 2;
        int v54 = v3 % v53;
        int v55 = 3;
        int v56;
        v56 = v55;
        switch (v54) {
          case 0:
            {
            int v57 = 1;
            v56 = v57;
            break;
          }
          default:
            {
            int v58 = 1;
            v56 = v58;
            break;
          }
        }
        v40 = v56;
      }
      v35 = v40;
    }
    default:
      {
      int v59 = 4;
      int v60 = v3 % v59;
      int v61;
      v61 = v0;
      switch (v60) {
        case 0:
          {
          int v62 = 0;
          int v63 = 0;
          int v64;
          int v65;
          v64 = v62;
          v65 = v63;
          while (true) {
            int v66 = 4;
            int v67 = v3 % v66;
            int v68 = 1;
            int v69 = v67 + v68;
            bool v70 = v65 < v69;
            v64 = v64;
            v65 = v65;
            if (!v70) break;
            int v71 = 1;
            int v72 = v65 + v71;
            v64 = v0;
            v65 = v72;
          }
          v61 = v64;
          break;
        }
        case 1:
          {
          int v73 = 0;
          bool v74 = v2 != v73;
          int v75;
          if (v74) {
            v75 = v0;
          } else {
            int v76 = 0;
            int v77 = v0 + v76;
            v75 = v77;
          }
          v61 = v75;
          break;
        }
        case 2:
          {
          int v78 = 2;
          int v79 = v0 + v78;
          v61 = v79;
          break;
        }
        default:
          {
          int v80 = 0;
          int v81 = 0;
          int v82;
          int v83;
          v82 = v80;
          v83 = v81;
          while (true) {
            int v84 = 4;
            int v85 = v3 % v84;
            int v86 = 1;
            int v87 = v85 + v86;
            bool v88 = v83 < v87;
            v82 = v82;
            v83 = v83;
            if (!v88) break;
            int v89 = 1;
            int v90 = v83 + v89;
            v82 = v0;
            v83 = v90;
            break;
            ;
          }
          v61 = v82;
          break;
        }
      }
      v35 = v61;
      break;
    }
  }
  int v91 = 0;
  bool v92 = v2 != v91;
  int v93 = v92 ? v30 : v35;
  return;
}

kernel void kernel_main(device int* v94 [[buffer(0)]], device int* v95 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v96 = static_cast<int>(__simt_tid3.x);
  int v97 = 0;
  int v98 = v97 + v96;
  int v99 = v95[v98];
  int v100 = 4;
  int v101 = v100 + v96;
  int v102 = v95[v101];
  int v103 = 0;
  bool v104 = v99 != v103;
  if (v104) {
  } else {
    int v105 = 0;
    int v106 = 0;
    int v107;
    int v108;
    v107 = v105;
    v108 = v106;
    while (true) {
      int v109 = 1;
      bool v110 = v108 < v109;
      v107 = v107;
      v108 = v108;
      if (!v110) break;
      helper0(v96, v94, v99, v102, static_cast<int>(__simt_tid3.x));
      int v111 = 1;
      int v112 = v108 + v111;
      v107 = v107;
      v108 = v112;
    }
  }
  int v113 = 8;
  int v114 = v113 + v96;
  int v115 = v95[v114];
  int v116;
  v116 = v96;
  switch (v115) {
    default:
      {
      int v117 = 12;
      int v118 = v117 + v96;
      int v119 = v95[v118];
      int v120 = 4;
      int v121;
      v121 = v120;
      switch (v119) {
        default:
          {
          int v122 = 16;
          int v123 = v122 + v96;
          int v124 = v95[v123];
          int v125 = 2;
          int v126;
          v126 = v125;
          switch (v124) {
            default:
              {
              int v127 = 4;
              int v128 = v96 + v127;
              v126 = v128;
            }
            case 0:
              {
              v126 = v96;
            }
            case 1:
              {
              int v129 = 4;
              int v130 = v96 + v129;
              v126 = v130;
              break;
            }
          }
          v121 = v126;
          break;
        }
        case 0:
          {
          int v131 = 20;
          int v132 = v131 + v96;
          int v133 = v95[v132];
          int v134;
          v134 = v96;
          switch (v133) {
            case 0:
              {
              v134 = v96;
              break;
            }
            case 1:
              {
              v134 = v96;
              break;
            }
            case 2:
              {
              int v135 = 4;
              int v136 = v96 + v135;
              v134 = v136;
              break;
            }
            default:
              {
              v134 = v96;
              break;
            }
          }
          bool v137 = true;
          v121 = v134;
          break;
        }
        case 1:
          {
          int v138 = 24;
          int v139 = v138 + v96;
          int v140 = v95[v139];
          int v141 = 0;
          bool v142 = v140 != v141;
          int v143;
          if (v142) {
            int v144 = 3;
            int v145 = v96 + v144;
            v143 = v145;
          } else {
            int v146 = 0;
            v143 = v146;
          }
          v121 = v143;
        }
        case 2:
          {
          int v147 = 28;
          int v148 = v147 + v96;
          int v149 = v95[v148];
          int v150 = 0;
          int v151;
          v151 = v150;
          switch (v149) {
            default:
              {
              int v152 = 4;
              v151 = v152;
              break;
            }
            case 0:
              {
              int v153 = 0;
              int v154 = v96 + v153;
              v151 = v154;
              break;
            }
            case 1:
              {
              int v155 = 0;
              v151 = v155;
              break;
            }
          }
          bool v156 = true;
          v121 = v151;
          break;
        }
      }
      v116 = v121;
    }
    case 0:
      {
      int v157 = 32;
      int v158 = v157 + v96;
      int v159 = v95[v158];
      int v160 = 0;
      bool v161 = v159 != v160;
      int v162;
      if (v161) {
        int v163 = 2;
        v162 = v163;
      } else {
        int v164 = 36;
        int v165 = v164 + v96;
        int v166 = v95[v165];
        int v167 = 4;
        int v168 = v96 + v167;
        int v169;
        v169 = v168;
        switch (v166) {
          case 0:
            {
            int v170 = 0;
            v169 = v170;
            break;
          }
          default:
            {
            int v171 = 3;
            int v172 = v96 + v171;
            v169 = v172;
            break;
          }
        }
        bool v173 = true;
        v162 = v169;
      }
      v116 = v162;
    }
    case 1:
      {
      int v174 = 40;
      int v175 = v174 + v96;
      int v176 = v95[v175];
      int v177 = 0;
      bool v178 = v176 != v177;
      int v179;
      if (v178) {
        v179 = v96;
      } else {
        int v180 = 44;
        int v181 = v180 + v96;
        int v182 = v95[v181];
        int v183 = 0;
        int v184;
        v184 = v183;
        switch (v182) {
          case 0:
            {
            v184 = v96;
          }
          default:
            {
            v184 = v96;
            break;
          }
        }
        v179 = v184;
      }
      v116 = v179;
      break;
    }
    case 2:
      {
      int v185 = 48;
      int v186 = v185 + v96;
      int v187 = v95[v186];
      int v188 = 3;
      int v189;
      v189 = v188;
      switch (v187) {
        case 0:
          {
          int v190 = 0;
          int v191 = 0;
          int v192;
          int v193;
          v192 = v190;
          v193 = v191;
          while (true) {
            int v194 = 4;
            int v195 = v193 * v194;
            int v196 = v195 + v96;
            int v197 = 52;
            int v198 = v197 + v196;
            int v199 = v95[v198];
            int v200 = 0;
            bool v201 = v199 != v200;
            v192 = v192;
            v193 = v193;
            if (!v201) break;
            int v202 = v192 + v193;
            int v203 = 1;
            int v204 = v193 + v203;
            bool v205 = true;
            v192 = v202;
            v193 = v204;
            continue;
            ;
          }
          v189 = v192;
          break;
        }
        case 1:
          {
          int v206 = 1;
          v189 = v206;
        }
        case 2:
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
            int v213 = v212 + v96;
            int v214 = 72;
            int v215 = v214 + v213;
            int v216 = v95[v215];
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
          }
          v189 = v209;
          break;
        }
        default:
          {
          int v223 = 92;
          int v224 = v223 + v96;
          int v225 = v95[v224];
          int v226 = 0;
          bool v227 = v225 != v226;
          int v228;
          if (v227) {
            int v229 = 2;
            int v230 = v96 + v229;
            v228 = v230;
          } else {
            int v231 = 4;
            int v232 = v96 + v231;
            v228 = v232;
          }
          v189 = v228;
          break;
        }
      }
      v116 = v189;
      break;
    }
  }
  bool v233 = true;
  int v234 = 16;
  int v235 = v234 + v96;
  bool v236 = true;
  int v237 = simt_wave_count_bits(v236);
  v94[v235] = v237;
  int v238 = 96;
  int v239 = v238 + v96;
  int v240 = v95[v239];
  int v241 = 1;
  int v242;
  v242 = v241;
  switch (v240) {
    case 0:
      {
      int v243 = 0;
      int v244 = 0;
      int v245;
      int v246;
      v245 = v243;
      v246 = v244;
      while (true) {
        int v247 = 4;
        int v248 = v246 * v247;
        int v249 = v248 + v96;
        int v250 = 100;
        int v251 = v250 + v249;
        int v252 = v95[v251];
        int v253 = 0;
        bool v254 = v252 != v253;
        v245 = v245;
        v246 = v246;
        if (!v254) break;
        int v255 = 0;
        int v256 = v245 + v255;
        int v257 = 1;
        int v258 = v246 + v257;
        bool v259 = true;
        v245 = v256;
        v246 = v258;
        break;
        ;
      }
      v242 = v245;
      break;
    }
    case 1:
      {
      int v260 = 0;
      int v261 = 0;
      int v262;
      int v263;
      v262 = v260;
      v263 = v261;
      while (true) {
        int v264 = 4;
        int v265 = v263 * v264;
        int v266 = v265 + v96;
        int v267 = 120;
        int v268 = v267 + v266;
        int v269 = v95[v268];
        int v270 = 0;
        bool v271 = v269 != v270;
        v262 = v262;
        v263 = v263;
        if (!v271) break;
        int v272 = 4;
        int v273 = v96 + v272;
        int v274 = v262 + v273;
        int v275 = 1;
        int v276 = v263 + v275;
        bool v277 = true;
        v262 = v274;
        v263 = v276;
      }
      v242 = v262;
      break;
    }
    default:
      {
      int v278 = 140;
      int v279 = v278 + v96;
      int v280 = v95[v279];
      int v281 = 1;
      int v282 = v96 + v281;
      int v283;
      v283 = v282;
      switch (v280) {
        case 0:
          {
          int v284 = 1;
          int v285 = v96 + v284;
          v283 = v285;
        }
        case 1:
          {
          int v286 = 0;
          int v287 = 0;
          int v288;
          int v289;
          v288 = v286;
          v289 = v287;
          while (true) {
            int v290 = 4;
            int v291 = v289 * v290;
            int v292 = v291 + v96;
            int v293 = 144;
            int v294 = v293 + v292;
            int v295 = v95[v294];
            int v296 = 0;
            bool v297 = v295 != v296;
            v288 = v288;
            v289 = v289;
            if (!v297) break;
            int v298 = v288 + v289;
            int v299 = 1;
            int v300 = v289 + v299;
            bool v301 = true;
            v288 = v298;
            v289 = v300;
          }
          v283 = v288;
        }
        default:
          {
          int v302 = 164;
          int v303 = v302 + v96;
          int v304 = v95[v303];
          int v305 = 0;
          bool v306 = v304 != v305;
          int v307;
          if (v306) {
            int v308 = 1;
            v307 = v308;
          } else {
            v307 = v96;
          }
          v283 = v307;
          break;
        }
      }
      v242 = v283;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 168; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
