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
    bool v11 = true;
    int v12 = simt_wave_count_bits(v11);
    int v13 = 16;
    int v14 = v13 + v0;
    v1[v14] = v12;
    v10 = v12;
  } else {
    bool v15 = true;
    int v16 = simt_wave_count_bits(v15);
    int v17 = 32;
    int v18 = v17 + v0;
    v1[v18] = v16;
    v10 = v16;
  }
  int v19 = 0;
  bool v20 = v2 != v19;
  int v21 = v20 ? v5 : v10;
  int v22 = 0;
  bool v23 = v2 != v22;
  int v24;
  if (v23) {
    int v25 = 4;
    int v26 = v3 % v25;
    int v27 = 4;
    int v28;
    v28 = v27;
    switch (v26) {
      case 0:
        {
        int v29 = 0;
        int v30 = 0;
        int v31;
        int v32;
        v31 = v29;
        v32 = v30;
        while (true) {
          int v33 = 4;
          int v34 = v3 % v33;
          int v35 = 1;
          int v36 = v34 + v35;
          bool v37 = v32 < v36;
          v31 = v31;
          v32 = v32;
          if (!v37) break;
          int v38 = 4;
          int v39 = v0 + v38;
          int v40 = 1;
          int v41 = v32 + v40;
          v31 = v39;
          v32 = v41;
          break;
          ;
        }
        v28 = v31;
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
          int v51 = 1;
          int v52 = v45 + v51;
          v44 = v0;
          v45 = v52;
        }
        v28 = v44;
        break;
      }
      case 2:
        {
        int v53 = 0;
        bool v54 = v2 != v53;
        int v55;
        if (v54) {
          v55 = v0;
        } else {
          int v56 = 2;
          v55 = v56;
        }
        v28 = v55;
        break;
      }
      default:
        {
        int v57 = 0;
        bool v58 = v2 != v57;
        int v59;
        if (v58) {
          int v60 = 0;
          int v61 = v0 + v60;
          v59 = v61;
        } else {
          int v62 = 2;
          int v63 = v0 + v62;
          v59 = v63;
        }
        v28 = v59;
        break;
      }
    }
    bool v64 = true;
    int v65 = simt_wave_count_bits(v64);
    int v66 = 48;
    int v67 = v66 + v0;
    v1[v67] = v65;
    v24 = v28;
  } else {
    int v68 = 0;
    int v69 = 0;
    int v70;
    int v71;
    v70 = v68;
    v71 = v69;
    while (true) {
      int v72 = 4;
      int v73 = v3 % v72;
      int v74 = 1;
      int v75 = v73 + v74;
      bool v76 = v71 < v75;
      v70 = v70;
      v71 = v71;
      if (!v76) break;
      int v77 = 4;
      int v78 = v3 % v77;
      int v79;
      v79 = v0;
      switch (v78) {
        default:
          {
          int v80 = 4;
          v79 = v80;
          break;
        }
        case 0:
          {
          int v81 = 0;
          int v82 = v0 + v81;
          v79 = v82;
        }
        case 1:
          {
          v79 = v0;
        }
        case 2:
          {
          v79 = v0;
          break;
        }
      }
      int v83 = 1;
      int v84 = v71 + v83;
      v70 = v79;
      v71 = v84;
    }
    v24 = v70;
  }
  int v85 = 0;
  bool v86 = v2 != v85;
  int v87 = v86 ? v21 : v24;
  return;
}

kernel void kernel_main(device int* v88 [[buffer(0)]], device int* v89 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v90 = static_cast<int>(__simt_tid3.x);
  int v91 = 0;
  int v92 = v91 + v90;
  int v93 = v89[v92];
  int v94 = 4;
  int v95 = v94 + v90;
  int v96 = v89[v95];
  helper0(v90, v88, v93, v96, static_cast<int>(__simt_tid3.x));
  int v97 = 8;
  int v98 = v97 + v90;
  int v99 = v89[v98];
  int v100 = 4;
  int v101;
  v101 = v100;
  switch (v99) {
    case 0:
      {
      int v102 = 12;
      int v103 = v102 + v90;
      int v104 = v89[v103];
      int v105 = 0;
      bool v106 = v104 != v105;
      int v107;
      if (v106) {
        int v108 = 0;
        int v109 = 0;
        int v110;
        int v111;
        v110 = v108;
        v111 = v109;
        while (true) {
          int v112 = 4;
          int v113 = v111 * v112;
          int v114 = v113 + v90;
          int v115 = 16;
          int v116 = v115 + v114;
          int v117 = v89[v116];
          int v118 = 0;
          bool v119 = v117 != v118;
          v110 = v110;
          v111 = v111;
          if (!v119) break;
          int v120 = v110 + v111;
          int v121 = 1;
          int v122 = v111 + v121;
          bool v123 = true;
          v110 = v120;
          v111 = v122;
          continue;
          ;
        }
        v107 = v110;
      } else {
        int v124 = 36;
        int v125 = v124 + v90;
        int v126 = v89[v125];
        int v127 = 0;
        bool v128 = v126 != v127;
        int v129;
        if (v128) {
          int v130 = 0;
          v129 = v130;
        } else {
          int v131 = 2;
          v129 = v131;
        }
        v107 = v129;
      }
      v101 = v107;
      break;
    }
    case 1:
      {
      int v132 = 40;
      int v133 = v132 + v90;
      int v134 = v89[v133];
      int v135 = 2;
      int v136 = v90 + v135;
      int v137;
      v137 = v136;
      switch (v134) {
        default:
          {
          v137 = v90;
          break;
        }
        case 0:
          {
          int v138 = 44;
          int v139 = v138 + v90;
          int v140 = v89[v139];
          int v141 = 0;
          bool v142 = v140 != v141;
          int v143;
          if (v142) {
            int v144 = 0;
            int v145 = v90 + v144;
            v143 = v145;
          } else {
            int v146 = 4;
            int v147 = v90 + v146;
            v143 = v147;
          }
          v137 = v143;
          break;
        }
      }
      v101 = v137;
      break;
    }
    default:
      {
      int v148 = 48;
      int v149 = v148 + v90;
      int v150 = v89[v149];
      int v151 = 3;
      int v152 = v90 + v151;
      int v153;
      v153 = v152;
      switch (v150) {
        case 0:
          {
          int v154 = 3;
          v153 = v154;
          break;
        }
        default:
          {
          v153 = v90;
          break;
        }
        case 1:
          {
          int v155 = 52;
          int v156 = v155 + v90;
          int v157 = v89[v156];
          int v158 = 0;
          int v159 = v90 + v158;
          int v160;
          v160 = v159;
          switch (v157) {
            default:
              {
              v160 = v90;
            }
            case 0:
              {
              int v161 = 0;
              v160 = v161;
              break;
            }
          }
          bool v162 = true;
          v153 = v160;
          break;
        }
      }
      v101 = v153;
      break;
    }
    case 2:
      {
      int v163 = 56;
      int v164 = v163 + v90;
      int v165 = v89[v164];
      int v166 = 4;
      int v167;
      v167 = v166;
      switch (v165) {
        case 0:
          {
          int v168 = 60;
          int v169 = v168 + v90;
          int v170 = v89[v169];
          int v171 = 0;
          bool v172 = v170 != v171;
          int v173;
          if (v172) {
            int v174 = 1;
            v173 = v174;
          } else {
            int v175 = 0;
            int v176 = v90 + v175;
            v173 = v176;
          }
          v167 = v173;
        }
        case 1:
          {
          int v177 = 64;
          int v178 = v177 + v90;
          int v179 = v89[v178];
          int v180 = 0;
          bool v181 = v179 != v180;
          int v182;
          if (v181) {
            int v183 = 4;
            v182 = v183;
          } else {
            int v184 = 1;
            int v185 = v90 + v184;
            v182 = v185;
          }
          v167 = v182;
        }
        default:
          {
          int v186 = 3;
          int v187 = v90 + v186;
          v167 = v187;
          break;
        }
        case 2:
          {
          int v188 = 68;
          int v189 = v188 + v90;
          int v190 = v89[v189];
          int v191 = 2;
          int v192 = v90 + v191;
          int v193;
          v193 = v192;
          switch (v190) {
            case 0:
              {
              int v194 = 2;
              v193 = v194;
            }
            case 1:
              {
              v193 = v90;
            }
            default:
              {
              int v195 = 0;
              int v196 = v90 + v195;
              v193 = v196;
              break;
            }
          }
          bool v197 = true;
          v167 = v193;
          break;
        }
      }
      bool v198 = true;
      v101 = v167;
      break;
    }
  }
  bool v199 = true;
  int v200 = 64;
  int v201 = v200 + v90;
  bool v202 = true;
  int v203 = simt_wave_count_bits(v202);
  v88[v201] = v203;
  int v204 = 72;
  int v205 = v204 + v90;
  int v206 = v89[v205];
  int v207 = 0;
  bool v208 = v206 != v207;
  int v209;
  if (v208) {
    int v210 = 0;
    int v211 = 0;
    int v212;
    int v213;
    v212 = v210;
    v213 = v211;
    while (true) {
      int v214 = 4;
      int v215 = v213 * v214;
      int v216 = v215 + v90;
      int v217 = 76;
      int v218 = v217 + v216;
      int v219 = v89[v218];
      int v220 = 0;
      bool v221 = v219 != v220;
      v212 = v212;
      v213 = v213;
      if (!v221) break;
      int v222 = 96;
      int v223 = v222 + v90;
      int v224 = v89[v223];
      uint v225 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v226 = (int)(v225);
      int v227;
      v227 = v226;
      switch (v224) {
        default:
          {
          int v228 = 1;
          v227 = v228;
          break;
        }
        case 0:
          {
          int v229 = 2;
          int v230 = v90 + v229;
          v227 = v230;
          break;
        }
        case 1:
          {
          v227 = v90;
          break;
        }
      }
      bool v231 = true;
      int v232 = 80;
      int v233 = v232 + v90;
      bool v234 = true;
      int v235 = simt_wave_count_bits(v234);
      v88[v233] = v235;
      int v236 = v212 + v227;
      int v237 = 1;
      int v238 = v213 + v237;
      bool v239 = true;
      int v240 = 96;
      int v241 = 4;
      int v242 = v213 * v241;
      int v243 = v240 + v242;
      int v244 = v243 + v90;
      bool v245 = true;
      int v246 = simt_wave_count_bits(v245);
      v88[v244] = v246;
      v212 = v236;
      v213 = v238;
    }
    v209 = v212;
  } else {
    int v247 = 100;
    int v248 = v247 + v90;
    int v249 = v89[v248];
    int v250 = 0;
    int v251 = v90 + v250;
    int v252;
    v252 = v251;
    switch (v249) {
      case 0:
        {
        int v253 = 104;
        int v254 = v253 + v90;
        int v255 = v89[v254];
        int v256 = 1;
        int v257;
        v257 = v256;
        switch (v255) {
          case 0:
            {
            v257 = v90;
            break;
          }
          default:
            {
            int v258 = 4;
            int v259 = v90 + v258;
            v257 = v259;
            break;
          }
        }
        v252 = v257;
        break;
      }
      case 1:
        {
        int v260 = 108;
        int v261 = v260 + v90;
        int v262 = v89[v261];
        int v263 = 0;
        bool v264 = v262 != v263;
        int v265;
        if (v264) {
          v265 = v90;
        } else {
          v265 = v90;
        }
        v252 = v265;
      }
      case 2:
        {
        int v266 = 0;
        int v267 = 0;
        int v268;
        int v269;
        v268 = v266;
        v269 = v267;
        while (true) {
          int v270 = 4;
          int v271 = v269 * v270;
          int v272 = v271 + v90;
          int v273 = 112;
          int v274 = v273 + v272;
          int v275 = v89[v274];
          int v276 = 0;
          bool v277 = v275 != v276;
          v268 = v268;
          v269 = v269;
          if (!v277) break;
          int v278 = v268 + v269;
          int v279 = 1;
          int v280 = v269 + v279;
          bool v281 = true;
          v268 = v278;
          v269 = v280;
          break;
          ;
        }
        v252 = v268;
      }
      default:
        {
        int v282 = 132;
        int v283 = v282 + v90;
        int v284 = v89[v283];
        int v285 = 0;
        bool v286 = v284 != v285;
        int v287;
        if (v286) {
          int v288 = 3;
          int v289 = v90 + v288;
          v287 = v289;
        } else {
          v287 = v90;
        }
        v252 = v287;
        break;
      }
    }
    v209 = v252;
  }
  int v290 = 112;
  int v291 = v290 + v90;
  bool v292 = true;
  int v293 = simt_wave_count_bits(v292);
  v88[v291] = v293;
  int v294 = 0;
  int v295 = 0;
  int v296;
  int v297;
  v296 = v294;
  v297 = v295;
  while (true) {
    int v298 = 4;
    int v299 = v297 * v298;
    int v300 = v299 + v90;
    int v301 = 136;
    int v302 = v301 + v300;
    int v303 = v89[v302];
    int v304 = 0;
    bool v305 = v303 != v304;
    v296 = v296;
    v297 = v297;
    if (!v305) break;
    int v306 = v296 + v297;
    int v307 = 1;
    int v308 = v297 + v307;
    bool v309 = true;
    int v310 = 128;
    int v311 = 4;
    int v312 = v297 * v311;
    int v313 = v310 + v312;
    int v314 = v313 + v90;
    bool v315 = true;
    int v316 = simt_wave_count_bits(v315);
    v88[v314] = v316;
    v296 = v306;
    v297 = v308;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 139; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 156; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
