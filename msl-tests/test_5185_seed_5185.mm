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
  uint v4 = simt_subgroup_id(__simt_tid);
  int v5 = (int)(v4);
  int v6 = 0;
  bool v7 = v2 != v6;
  int v8;
  if (v7) {
    int v9 = 4;
    int v10 = v3 % v9;
    int v11;
    v11 = v0;
    switch (v10) {
      case 0:
        {
        int v12 = 0;
        bool v13 = v2 != v12;
        int v14;
        if (v13) {
          int v15 = 1;
          int v16 = v0 + v15;
          v14 = v16;
        } else {
          int v17 = 2;
          v14 = v17;
        }
        v11 = v14;
      }
      case 1:
        {
        int v18 = 3;
        int v19 = v3 % v18;
        int v20 = 4;
        int v21 = v0 + v20;
        int v22;
        v22 = v21;
        switch (v19) {
          default:
            {
            v22 = v0;
            break;
          }
          case 0:
            {
            int v23 = 3;
            v22 = v23;
          }
          case 1:
            {
            int v24 = 2;
            int v25 = v0 + v24;
            v22 = v25;
            break;
          }
          case 2:
            {
            int v26 = 4;
            int v27 = v0 + v26;
            v22 = v27;
            break;
          }
        }
        v11 = v22;
        break;
      }
      default:
        {
        int v28 = 3;
        int v29 = v3 % v28;
        int v30 = 4;
        int v31 = v0 + v30;
        int v32;
        v32 = v31;
        switch (v29) {
          default:
            {
            v32 = v0;
            break;
          }
          case 0:
            {
            int v33 = 2;
            v32 = v33;
            break;
          }
          case 1:
            {
            v32 = v0;
            break;
          }
        }
        int v34 = 2;
        int v35 = v0 + v34;
        v11 = v32;
        break;
      }
      case 2:
        {
        int v36 = 0;
        bool v37 = v2 != v36;
        int v38;
        if (v37) {
          int v39 = 2;
          int v40 = v0 + v39;
          v38 = v40;
        } else {
          int v41 = 4;
          v38 = v41;
        }
        int v42 = 2;
        v11 = v38;
        break;
      }
    }
    uint v43 = simt_subgroup_id(__simt_tid);
    int v44 = (int)(v43);
    v8 = v11;
  } else {
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
      int v54 = 0;
      int v55 = 0;
      int v56;
      int v57;
      v56 = v54;
      v57 = v55;
      while (true) {
        int v58 = 4;
        int v59 = v3 % v58;
        int v60 = 1;
        int v61 = v59 + v60;
        bool v62 = v57 < v61;
        v56 = v56;
        v57 = v57;
        if (!v62) break;
        uint v63 = simt_subgroup_id(__simt_tid);
        int v64 = (int)(v63);
        int v65 = 1;
        int v66 = v57 + v65;
        v56 = v64;
        v57 = v66;
        continue;
        ;
      }
      int v67 = 1;
      int v68 = 1;
      int v69 = v48 + v68;
      v47 = v56;
      v48 = v69;
    }
    uint v70 = simt_lane_id(__simt_tid);
    int v71 = (int)(v70);
    v8 = v47;
  }
  bool v72 = true;
  int v73 = simt_wave_count_bits(v72);
  int v74 = 0;
  int v75 = v74 + v0;
  v1[v75] = v73;
  int v76 = 0;
  bool v77 = v2 != v76;
  int v78 = v77 ? v5 : v8;
  return;
}

kernel void kernel_main(device int* v79 [[buffer(0)]], device int* v80 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v81 = static_cast<int>(__simt_tid3.x);
  int v82 = 0;
  int v83 = v82 + v81;
  int v84 = v80[v83];
  int v85 = 4;
  int v86 = v85 + v81;
  int v87 = v80[v86];
  helper0(v81, v79, v84, v87, static_cast<int>(__simt_tid3.x));
  int v88 = 8;
  int v89 = v88 + v81;
  int v90 = v80[v89];
  int v91;
  v91 = v81;
  switch (v90) {
    default:
      {
      int v92 = 12;
      int v93 = v92 + v81;
      int v94 = v80[v93];
      int v95 = 3;
      int v96;
      v96 = v95;
      switch (v94) {
        case 0:
          {
          int v97 = 16;
          int v98 = v97 + v81;
          int v99 = v80[v98];
          int v100;
          v100 = v81;
          switch (v99) {
            case 0:
              {
              int v101 = 4;
              int v102 = v81 + v101;
              v100 = v102;
              break;
            }
            default:
              {
              int v103 = 3;
              v100 = v103;
              break;
            }
          }
          bool v104 = true;
          v96 = v100;
          break;
        }
        case 1:
          {
          int v105 = 1;
          int v106 = v81 + v105;
          v96 = v106;
          break;
        }
        case 2:
          {
          int v107 = 20;
          int v108 = v107 + v81;
          int v109 = v80[v108];
          int v110;
          v110 = v81;
          switch (v109) {
            case 0:
              {
              int v111 = 2;
              v110 = v111;
              break;
            }
            default:
              {
              int v112 = 3;
              v110 = v112;
              break;
            }
          }
          bool v113 = true;
          v96 = v110;
          break;
        }
        default:
          {
          int v114 = 24;
          int v115 = v114 + v81;
          int v116 = v80[v115];
          int v117;
          v117 = v81;
          switch (v116) {
            case 0:
              {
              v117 = v81;
              break;
            }
            case 1:
              {
              int v118 = 3;
              int v119 = v81 + v118;
              v117 = v119;
              break;
            }
            default:
              {
              v117 = v81;
              break;
            }
          }
          bool v120 = true;
          v96 = v117;
          break;
        }
      }
      bool v121 = true;
      v91 = v96;
      break;
    }
    case 0:
      {
      int v122 = 28;
      int v123 = v122 + v81;
      int v124 = v80[v123];
      int v125 = 3;
      int v126 = v81 + v125;
      int v127;
      v127 = v126;
      switch (v124) {
        case 0:
          {
          int v128 = 32;
          int v129 = v128 + v81;
          int v130 = v80[v129];
          int v131 = 0;
          bool v132 = v130 != v131;
          int v133;
          if (v132) {
            int v134 = 1;
            v133 = v134;
          } else {
            int v135 = 3;
            int v136 = v81 + v135;
            v133 = v136;
          }
          v127 = v133;
          break;
        }
        default:
          {
          int v137 = 36;
          int v138 = v137 + v81;
          int v139 = v80[v138];
          int v140;
          v140 = v81;
          switch (v139) {
            case 0:
              {
              v140 = v81;
              break;
            }
            default:
              {
              v140 = v81;
              break;
            }
            case 1:
              {
              int v141 = 0;
              v140 = v141;
              break;
            }
            case 2:
              {
              v140 = v81;
              break;
            }
          }
          bool v142 = true;
          v127 = v140;
          break;
        }
        case 1:
          {
          int v143 = 40;
          int v144 = v143 + v81;
          int v145 = v80[v144];
          int v146;
          v146 = v81;
          switch (v145) {
            case 0:
              {
              int v147 = 4;
              v146 = v147;
            }
            default:
              {
              int v148 = 2;
              int v149 = v81 + v148;
              v146 = v149;
              break;
            }
          }
          bool v150 = true;
          v127 = v146;
          break;
        }
      }
      bool v151 = true;
      v91 = v127;
      break;
    }
    case 1:
      {
      int v152 = 44;
      int v153 = v152 + v81;
      int v154 = v80[v153];
      int v155 = 0;
      bool v156 = v154 != v155;
      int v157;
      if (v156) {
        int v158 = 0;
        int v159 = 0;
        int v160;
        int v161;
        v160 = v158;
        v161 = v159;
        while (true) {
          int v162 = 4;
          int v163 = v161 * v162;
          int v164 = v163 + v81;
          int v165 = 48;
          int v166 = v165 + v164;
          int v167 = v80[v166];
          int v168 = 0;
          bool v169 = v167 != v168;
          v160 = v160;
          v161 = v161;
          if (!v169) break;
          int v170 = v160 + v161;
          int v171 = 1;
          int v172 = v161 + v171;
          v160 = v170;
          v161 = v172;
          continue;
          ;
        }
        bool v173 = true;
        v157 = v160;
      } else {
        int v174 = 0;
        int v175 = 0;
        int v176;
        int v177;
        v176 = v174;
        v177 = v175;
        while (true) {
          int v178 = 4;
          int v179 = v177 * v178;
          int v180 = v179 + v81;
          int v181 = 68;
          int v182 = v181 + v180;
          int v183 = v80[v182];
          int v184 = 0;
          bool v185 = v183 != v184;
          v176 = v176;
          v177 = v177;
          if (!v185) break;
          int v186 = v176 + v177;
          int v187 = 1;
          int v188 = v177 + v187;
          v176 = v186;
          v177 = v188;
        }
        bool v189 = true;
        v157 = v176;
      }
      v91 = v157;
      break;
    }
    case 2:
      {
      int v190 = 88;
      int v191 = v190 + v81;
      int v192 = v80[v191];
      int v193 = 0;
      bool v194 = v192 != v193;
      int v195;
      if (v194) {
        int v196 = 2;
        v195 = v196;
      } else {
        int v197 = 0;
        int v198 = 0;
        int v199;
        int v200;
        v199 = v197;
        v200 = v198;
        while (true) {
          int v201 = 4;
          int v202 = v200 * v201;
          int v203 = v202 + v81;
          int v204 = 92;
          int v205 = v204 + v203;
          int v206 = v80[v205];
          int v207 = 0;
          bool v208 = v206 != v207;
          v199 = v199;
          v200 = v200;
          if (!v208) break;
          int v209 = v199 + v200;
          int v210 = 1;
          int v211 = v200 + v210;
          v199 = v209;
          v200 = v211;
        }
        bool v212 = true;
        v195 = v199;
      }
      v91 = v195;
      break;
    }
  }
  bool v213 = true;
  int v214 = 16;
  int v215 = v214 + v81;
  bool v216 = true;
  int v217 = simt_wave_count_bits(v216);
  v79[v215] = v217;
  int v218 = 0;
  int v219 = 0;
  int v220;
  int v221;
  v220 = v218;
  v221 = v219;
  while (true) {
    int v222 = 4;
    int v223 = v221 * v222;
    int v224 = v223 + v81;
    int v225 = 112;
    int v226 = v225 + v224;
    int v227 = v80[v226];
    int v228 = 0;
    bool v229 = v227 != v228;
    v220 = v220;
    v221 = v221;
    if (!v229) break;
    int v230 = v220 + v221;
    int v231 = 1;
    int v232 = v221 + v231;
    v220 = v230;
    v221 = v232;
  }
  bool v233 = true;
  int v234 = 32;
  int v235 = v234 + v81;
  bool v236 = true;
  int v237 = simt_wave_count_bits(v236);
  v79[v235] = v237;
  int v238 = 0;
  int v239 = 0;
  int v240;
  int v241;
  v240 = v238;
  v241 = v239;
  while (true) {
    int v242 = 4;
    int v243 = v241 * v242;
    int v244 = v243 + v81;
    int v245 = 132;
    int v246 = v245 + v244;
    int v247 = v80[v246];
    int v248 = 0;
    bool v249 = v247 != v248;
    v240 = v240;
    v241 = v241;
    if (!v249) break;
    int v250 = 152;
    int v251 = v250 + v81;
    int v252 = v80[v251];
    int v253 = 2;
    int v254 = v81 + v253;
    int v255;
    v255 = v254;
    switch (v252) {
      case 0:
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
          int v262 = v261 + v81;
          int v263 = 156;
          int v264 = v263 + v262;
          int v265 = v80[v264];
          int v266 = 0;
          bool v267 = v265 != v266;
          v258 = v258;
          v259 = v259;
          if (!v267) break;
          int v268 = v258 + v259;
          int v269 = 1;
          int v270 = v259 + v269;
          v258 = v268;
          v259 = v270;
          break;
          ;
        }
        bool v271 = true;
        v255 = v258;
        break;
      }
      default:
        {
        int v272 = 176;
        int v273 = v272 + v81;
        int v274 = v80[v273];
        int v275 = 0;
        bool v276 = v274 != v275;
        int v277;
        if (v276) {
          int v278 = 4;
          v277 = v278;
        } else {
          v277 = v81;
        }
        v255 = v277;
        break;
      }
      case 1:
        {
        int v279 = 180;
        int v280 = v279 + v81;
        int v281 = v80[v280];
        int v282 = 4;
        int v283;
        v283 = v282;
        switch (v281) {
          case 0:
            {
            int v284 = 1;
            v283 = v284;
            break;
          }
          case 1:
            {
            int v285 = 3;
            v283 = v285;
            break;
          }
          default:
            {
            int v286 = 0;
            int v287 = v81 + v286;
            v283 = v287;
            break;
          }
          case 2:
            {
            int v288 = 3;
            v283 = v288;
            break;
          }
        }
        bool v289 = true;
        v255 = v283;
        break;
      }
      case 2:
        {
        int v290 = 184;
        int v291 = v290 + v81;
        int v292 = v80[v291];
        int v293 = 0;
        bool v294 = v292 != v293;
        int v295;
        if (v294) {
          v295 = v81;
        } else {
          int v296 = 0;
          v295 = v296;
        }
        v255 = v295;
        break;
      }
    }
    bool v297 = true;
    int v298 = v240 + v255;
    int v299 = 1;
    int v300 = v241 + v299;
    v240 = v298;
    v241 = v300;
  }
  bool v301 = true;
  int v302 = 48;
  int v303 = v302 + v81;
  bool v304 = true;
  int v305 = simt_wave_count_bits(v304);
  v79[v303] = v305;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
