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
      int v9 = 4;
      int v10 = v0 + v9;
      v8 = v10;
      break;
    }
    case 0:
      {
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
        int v20 = 0;
        int v21 = 0;
        int v22;
        int v23;
        v22 = v20;
        v23 = v21;
        while (true) {
          int v24 = 4;
          int v25 = v3 % v24;
          int v26 = 1;
          int v27 = v25 + v26;
          bool v28 = v23 < v27;
          v22 = v22;
          v23 = v23;
          if (!v28) break;
          int v29 = 2;
          int v30 = 1;
          int v31 = v23 + v30;
          v22 = v29;
          v23 = v31;
        }
        int v32 = 1;
        int v33 = v14 + v32;
        v13 = v22;
        v14 = v33;
      }
      v8 = v13;
      break;
    }
  }
  bool v34 = true;
  int v35 = simt_wave_count_bits(v34);
  int v36 = 0;
  int v37 = v36 + v0;
  v1[v37] = v35;
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
  helper0(v40, v38, v43, v46, static_cast<int>(__simt_tid3.x));
  int v47 = 8;
  int v48 = v47 + v40;
  int v49 = v39[v48];
  uint v50 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v51 = (int)(v50);
  int v52;
  v52 = v51;
  switch (v49) {
    default:
      {
      int v53 = 12;
      int v54 = v53 + v40;
      int v55 = v39[v54];
      int v56 = 0;
      bool v57 = v55 != v56;
      int v58;
      if (v57) {
        int v59 = 2;
        int v60 = v40 + v59;
        v58 = v60;
      } else {
        v58 = v40;
      }
      v52 = v58;
    }
    case 0:
      {
      int v61 = 16;
      int v62 = v61 + v40;
      int v63 = v39[v62];
      int v64;
      v64 = v40;
      switch (v63) {
        case 0:
          {
          int v65 = 3;
          v64 = v65;
          break;
        }
        case 1:
          {
          int v66 = 3;
          v64 = v66;
          break;
        }
        default:
          {
          int v67 = 20;
          int v68 = v67 + v40;
          int v69 = v39[v68];
          int v70 = 0;
          bool v71 = v69 != v70;
          int v72;
          if (v71) {
            int v73 = 1;
            v72 = v73;
          } else {
            int v74 = 3;
            int v75 = v40 + v74;
            v72 = v75;
          }
          v64 = v72;
          break;
        }
      }
      bool v76 = true;
      v52 = v64;
      break;
    }
    case 1:
      {
      int v77 = 0;
      int v78 = v40 + v77;
      v52 = v78;
      break;
    }
  }
  int v79 = 24;
  int v80 = v79 + v40;
  int v81 = v39[v80];
  int v82 = 2;
  int v83;
  v83 = v82;
  switch (v81) {
    case 0:
      {
      int v84 = 28;
      int v85 = v84 + v40;
      int v86 = v39[v85];
      int v87;
      v87 = v40;
      switch (v86) {
        case 0:
          {
          int v88 = 32;
          int v89 = v88 + v40;
          int v90 = v39[v89];
          int v91 = 0;
          bool v92 = v90 != v91;
          int v93;
          if (v92) {
            int v94 = 0;
            v93 = v94;
          } else {
            int v95 = 4;
            v93 = v95;
          }
          v87 = v93;
        }
        default:
          {
          int v96 = 36;
          int v97 = v96 + v40;
          int v98 = v39[v97];
          int v99;
          v99 = v40;
          switch (v98) {
            case 0:
              {
              int v100 = 4;
              int v101 = v40 + v100;
              v99 = v101;
            }
            case 1:
              {
              int v102 = 3;
              v99 = v102;
              break;
            }
            default:
              {
              int v103 = 4;
              int v104 = v40 + v103;
              v99 = v104;
              break;
            }
            case 2:
              {
              int v105 = 0;
              v99 = v105;
              break;
            }
          }
          v87 = v99;
        }
        case 1:
          {
          int v106 = 0;
          int v107 = 0;
          int v108;
          int v109;
          v108 = v106;
          v109 = v107;
          while (true) {
            int v110 = 4;
            int v111 = v109 * v110;
            int v112 = v111 + v40;
            int v113 = 40;
            int v114 = v113 + v112;
            int v115 = v39[v114];
            int v116 = 0;
            bool v117 = v115 != v116;
            v108 = v108;
            v109 = v109;
            if (!v117) break;
            int v118 = v108 + v109;
            int v119 = 1;
            int v120 = v109 + v119;
            bool v121 = true;
            v108 = v118;
            v109 = v120;
          }
          v87 = v108;
          break;
        }
        case 2:
          {
          int v122 = 2;
          v87 = v122;
          break;
        }
      }
      v83 = v87;
      break;
    }
    default:
      {
      int v123 = 60;
      int v124 = v123 + v40;
      int v125 = v39[v124];
      int v126 = 1;
      int v127 = v40 + v126;
      int v128;
      v128 = v127;
      switch (v125) {
        default:
          {
          int v129 = 64;
          int v130 = v129 + v40;
          int v131 = v39[v130];
          int v132 = 0;
          bool v133 = v131 != v132;
          int v134;
          if (v133) {
            int v135 = 1;
            v134 = v135;
          } else {
            int v136 = 1;
            int v137 = v40 + v136;
            v134 = v137;
          }
          v128 = v134;
          break;
        }
        case 0:
          {
          int v138 = 68;
          int v139 = v138 + v40;
          int v140 = v39[v139];
          int v141 = 0;
          bool v142 = v140 != v141;
          int v143;
          if (v142) {
            int v144 = 3;
            v143 = v144;
          } else {
            int v145 = 0;
            int v146 = v40 + v145;
            v143 = v146;
          }
          v128 = v143;
          break;
        }
        case 1:
          {
          int v147 = 72;
          int v148 = v147 + v40;
          int v149 = v39[v148];
          int v150;
          v150 = v40;
          switch (v149) {
            case 0:
              {
              v150 = v40;
              break;
            }
            default:
              {
              int v151 = 3;
              v150 = v151;
              break;
            }
          }
          v128 = v150;
          break;
        }
      }
      v83 = v128;
      break;
    }
    case 1:
      {
      int v152 = 76;
      int v153 = v152 + v40;
      int v154 = v39[v153];
      int v155;
      v155 = v40;
      switch (v154) {
        case 0:
          {
          int v156 = 80;
          int v157 = v156 + v40;
          int v158 = v39[v157];
          int v159 = 0;
          int v160 = v40 + v159;
          int v161;
          v161 = v160;
          switch (v158) {
            case 0:
              {
              int v162 = 1;
              v161 = v162;
            }
            default:
              {
              int v163 = 3;
              int v164 = v40 + v163;
              v161 = v164;
              break;
            }
            case 1:
              {
              int v165 = 2;
              int v166 = v40 + v165;
              v161 = v166;
            }
            case 2:
              {
              int v167 = 1;
              int v168 = v40 + v167;
              v161 = v168;
              break;
            }
          }
          v155 = v161;
        }
        case 1:
          {
          int v169 = 84;
          int v170 = v169 + v40;
          int v171 = v39[v170];
          int v172 = 0;
          bool v173 = v171 != v172;
          int v174;
          if (v173) {
            v174 = v40;
          } else {
            v174 = v40;
          }
          v155 = v174;
        }
        case 2:
          {
          int v175 = 88;
          int v176 = v175 + v40;
          int v177 = v39[v176];
          int v178;
          v178 = v40;
          switch (v177) {
            case 0:
              {
              v178 = v40;
              break;
            }
            case 1:
              {
              int v179 = 3;
              int v180 = v40 + v179;
              v178 = v180;
            }
            default:
              {
              int v181 = 2;
              v178 = v181;
              break;
            }
          }
          v155 = v178;
          break;
        }
        default:
          {
          int v182 = 0;
          int v183 = 0;
          int v184;
          int v185;
          v184 = v182;
          v185 = v183;
          while (true) {
            int v186 = 4;
            int v187 = v185 * v186;
            int v188 = v187 + v40;
            int v189 = 92;
            int v190 = v189 + v188;
            int v191 = v39[v190];
            int v192 = 0;
            bool v193 = v191 != v192;
            v184 = v184;
            v185 = v185;
            if (!v193) break;
            int v194 = v184 + v185;
            int v195 = 1;
            int v196 = v185 + v195;
            bool v197 = true;
            v184 = v194;
            v185 = v196;
          }
          v155 = v184;
          break;
        }
      }
      v83 = v155;
      break;
    }
  }
  int v198 = 112;
  int v199 = v198 + v40;
  int v200 = v39[v199];
  int v201;
  v201 = v40;
  switch (v200) {
    case 0:
      {
      int v202 = 116;
      int v203 = v202 + v40;
      int v204 = v39[v203];
      int v205;
      v205 = v40;
      switch (v204) {
        case 0:
          {
          int v206 = 0;
          int v207 = 0;
          int v208;
          int v209;
          v208 = v206;
          v209 = v207;
          while (true) {
            int v210 = 4;
            int v211 = v209 * v210;
            int v212 = v211 + v40;
            int v213 = 120;
            int v214 = v213 + v212;
            int v215 = v39[v214];
            int v216 = 0;
            bool v217 = v215 != v216;
            v208 = v208;
            v209 = v209;
            if (!v217) break;
            int v218 = v208 + v209;
            int v219 = 1;
            int v220 = v209 + v219;
            bool v221 = true;
            v208 = v218;
            v209 = v220;
          }
          v205 = v208;
        }
        case 1:
          {
          int v222 = 0;
          int v223 = 0;
          int v224;
          int v225;
          v224 = v222;
          v225 = v223;
          while (true) {
            int v226 = 4;
            int v227 = v225 * v226;
            int v228 = v227 + v40;
            int v229 = 140;
            int v230 = v229 + v228;
            int v231 = v39[v230];
            int v232 = 0;
            bool v233 = v231 != v232;
            v224 = v224;
            v225 = v225;
            if (!v233) break;
            int v234 = v224 + v225;
            int v235 = 1;
            int v236 = v225 + v235;
            bool v237 = true;
            v224 = v234;
            v225 = v236;
          }
          v205 = v224;
        }
        default:
          {
          int v238 = 160;
          int v239 = v238 + v40;
          int v240 = v39[v239];
          int v241;
          v241 = v40;
          switch (v240) {
            default:
              {
              v241 = v40;
              break;
            }
            case 0:
              {
              int v242 = 0;
              int v243 = v40 + v242;
              v241 = v243;
              break;
            }
          }
          v205 = v241;
          break;
        }
        case 2:
          {
          v205 = v40;
          break;
        }
      }
      v201 = v205;
      break;
    }
    case 1:
      {
      int v244 = 164;
      int v245 = v244 + v40;
      int v246 = v39[v245];
      int v247;
      v247 = v40;
      switch (v246) {
        case 0:
          {
          int v248 = 168;
          int v249 = v248 + v40;
          int v250 = v39[v249];
          int v251 = 0;
          bool v252 = v250 != v251;
          int v253;
          if (v252) {
            v253 = v40;
          } else {
            int v254 = 4;
            int v255 = v40 + v254;
            v253 = v255;
          }
          v247 = v253;
          break;
        }
        case 1:
          {
          int v256 = 0;
          int v257 = 0;
          int v258;
          int v259;
          v258 = v256;
          v259 = v257;
          while (true) {
            int v260 = 4;
            int v261 = v259 * v260;
            int v262 = v261 + v40;
            int v263 = 172;
            int v264 = v263 + v262;
            int v265 = v39[v264];
            int v266 = 0;
            bool v267 = v265 != v266;
            v258 = v258;
            v259 = v259;
            if (!v267) break;
            int v268 = v258 + v259;
            int v269 = 1;
            int v270 = v259 + v269;
            bool v271 = true;
            v258 = v268;
            v259 = v270;
          }
          v247 = v258;
          break;
        }
        default:
          {
          int v272 = 4;
          int v273 = v40 + v272;
          v247 = v273;
          break;
        }
        case 2:
          {
          int v274 = 1;
          v247 = v274;
          break;
        }
      }
      v201 = v247;
      break;
    }
    case 2:
      {
      int v275 = 0;
      int v276 = 0;
      int v277;
      int v278;
      v277 = v275;
      v278 = v276;
      while (true) {
        int v279 = 4;
        int v280 = v278 * v279;
        int v281 = v280 + v40;
        int v282 = 192;
        int v283 = v282 + v281;
        int v284 = v39[v283];
        int v285 = 0;
        bool v286 = v284 != v285;
        v277 = v277;
        v278 = v278;
        if (!v286) break;
        int v287 = 1;
        int v288 = v40 + v287;
        int v289 = v277 + v288;
        int v290 = 1;
        int v291 = v278 + v290;
        bool v292 = true;
        v277 = v289;
        v278 = v291;
      }
      v201 = v277;
      break;
    }
    default:
      {
      int v293 = 212;
      int v294 = v293 + v40;
      int v295 = v39[v294];
      int v296 = 0;
      bool v297 = v295 != v296;
      int v298;
      if (v297) {
        int v299 = 216;
        int v300 = v299 + v40;
        int v301 = v39[v300];
        int v302 = 0;
        bool v303 = v301 != v302;
        int v304;
        if (v303) {
          int v305 = 3;
          v304 = v305;
        } else {
          int v306 = 1;
          v304 = v306;
        }
        v298 = v304;
      } else {
        int v307 = 3;
        int v308 = v40 + v307;
        v298 = v308;
      }
      v201 = v298;
      break;
    }
  }
  bool v309 = true;
  int v310 = 16;
  int v311 = v310 + v40;
  bool v312 = true;
  int v313 = simt_wave_count_bits(v312);
  v38[v311] = v313;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 220; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
