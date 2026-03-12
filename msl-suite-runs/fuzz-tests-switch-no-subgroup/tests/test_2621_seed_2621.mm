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
  int v6 = 1;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9;
      v9 = v0;
      switch (v3) {
        case 0:
          {
          int v10 = 0;
          bool v11 = v2 != v10;
          int v12;
          if (v11) {
            v12 = v0;
          } else {
            int v13 = 1;
            int v14 = v0 + v13;
            v12 = v14;
          }
          v9 = v12;
          break;
        }
        default:
          {
          int v15 = 0;
          bool v16 = v2 != v15;
          int v17;
          if (v16) {
            int v18 = 1;
            v17 = v18;
          } else {
            int v19 = 4;
            int v20 = v0 + v19;
            v17 = v20;
          }
          v9 = v17;
          break;
        }
      }
      v8 = v9;
      break;
    }
    case 1:
      {
      v8 = v0;
      break;
    }
    default:
      {
      int v21 = 0;
      bool v22 = v2 != v21;
      int v23;
      if (v22) {
        int v24 = 0;
        bool v25 = v2 != v24;
        int v26;
        if (v25) {
          v26 = v0;
        } else {
          v26 = v0;
        }
        v23 = v26;
      } else {
        int v27 = 0;
        int v28 = v0 + v27;
        v23 = v28;
      }
      v8 = v23;
      break;
    }
  }
  bool v29 = true;
  int v30 = simt_wave_count_bits(v29);
  int v31 = 0;
  int v32 = v31 + v0;
  v1[v32] = v30;
  return;
}

kernel void kernel_main(device int* v33 [[buffer(0)]], device int* v34 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v35 = static_cast<int>(__simt_tid3.x);
  int v36 = 0;
  int v37 = v36 + v35;
  int v38 = v34[v37];
  int v39 = 4;
  int v40 = v39 + v35;
  int v41 = v34[v40];
  helper0(v35, v33, v38, v41, static_cast<int>(__simt_tid3.x));
  int v42 = 8;
  int v43 = v42 + v35;
  int v44 = v34[v43];
  uint v45 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v46 = (int)(v45);
  int v47;
  v47 = v46;
  switch (v44) {
    case 0:
      {
      int v48 = 12;
      int v49 = v48 + v35;
      int v50 = v34[v49];
      int v51 = 4;
      int v52;
      v52 = v51;
      switch (v50) {
        default:
          {
          int v53 = 16;
          int v54 = v53 + v35;
          int v55 = v34[v54];
          int v56 = 1;
          int v57 = v35 + v56;
          int v58;
          v58 = v57;
          switch (v55) {
            case 0:
              {
              int v59 = 0;
              int v60 = v35 + v59;
              v58 = v60;
              break;
            }
            case 1:
              {
              int v61 = 0;
              int v62 = v35 + v61;
              v58 = v62;
              break;
            }
            default:
              {
              int v63 = 4;
              int v64 = v35 + v63;
              v58 = v64;
              break;
            }
            case 2:
              {
              v58 = v35;
              break;
            }
          }
          v52 = v58;
        }
        case 0:
          {
          int v65 = 20;
          int v66 = v65 + v35;
          int v67 = v34[v66];
          int v68 = 0;
          bool v69 = v67 != v68;
          int v70;
          if (v69) {
            int v71 = 4;
            int v72 = v35 + v71;
            v70 = v72;
          } else {
            int v73 = 2;
            int v74 = v35 + v73;
            v70 = v74;
          }
          v52 = v70;
          break;
        }
      }
      bool v75 = true;
      v47 = v52;
      break;
    }
    case 1:
      {
      int v76 = 24;
      int v77 = v76 + v35;
      int v78 = v34[v77];
      int v79 = 2;
      int v80 = v35 + v79;
      int v81;
      v81 = v80;
      switch (v78) {
        case 0:
          {
          int v82 = 0;
          int v83 = 0;
          int v84;
          int v85;
          v84 = v82;
          v85 = v83;
          while (true) {
            int v86 = 4;
            int v87 = v85 * v86;
            int v88 = v87 + v35;
            int v89 = 28;
            int v90 = v89 + v88;
            int v91 = v34[v90];
            int v92 = 0;
            bool v93 = v91 != v92;
            v84 = v84;
            v85 = v85;
            if (!v93) break;
            int v94 = v84 + v85;
            int v95 = 1;
            int v96 = v85 + v95;
            bool v97 = true;
            v84 = v94;
            v85 = v96;
            continue;
            ;
          }
          v81 = v84;
        }
        case 1:
          {
          int v98 = 0;
          int v99 = 0;
          int v100;
          int v101;
          v100 = v98;
          v101 = v99;
          while (true) {
            int v102 = 4;
            int v103 = v101 * v102;
            int v104 = v103 + v35;
            int v105 = 48;
            int v106 = v105 + v104;
            int v107 = v34[v106];
            int v108 = 0;
            bool v109 = v107 != v108;
            v100 = v100;
            v101 = v101;
            if (!v109) break;
            int v110 = v100 + v101;
            int v111 = 1;
            int v112 = v101 + v111;
            bool v113 = true;
            v100 = v110;
            v101 = v112;
          }
          v81 = v100;
        }
        default:
          {
          int v114 = 68;
          int v115 = v114 + v35;
          int v116 = v34[v115];
          int v117 = 0;
          bool v118 = v116 != v117;
          int v119;
          if (v118) {
            int v120 = 1;
            int v121 = v35 + v120;
            v119 = v121;
          } else {
            int v122 = 2;
            v119 = v122;
          }
          v81 = v119;
        }
        case 2:
          {
          int v123 = 72;
          int v124 = v123 + v35;
          int v125 = v34[v124];
          int v126;
          v126 = v35;
          switch (v125) {
            case 0:
              {
              int v127 = 3;
              int v128 = v35 + v127;
              v126 = v128;
              break;
            }
            default:
              {
              int v129 = 1;
              v126 = v129;
              break;
            }
            case 1:
              {
              int v130 = 1;
              v126 = v130;
              break;
            }
          }
          v81 = v126;
          break;
        }
      }
      v47 = v81;
      break;
    }
    default:
      {
      int v131 = 76;
      int v132 = v131 + v35;
      int v133 = v34[v132];
      int v134 = 0;
      int v135;
      v135 = v134;
      switch (v133) {
        case 0:
          {
          int v136 = 80;
          int v137 = v136 + v35;
          int v138 = v34[v137];
          int v139 = 4;
          int v140;
          v140 = v139;
          switch (v138) {
            case 0:
              {
              int v141 = 0;
              v140 = v141;
              break;
            }
            default:
              {
              int v142 = 0;
              v140 = v142;
              break;
            }
          }
          v135 = v140;
        }
        case 1:
          {
          int v143 = 84;
          int v144 = v143 + v35;
          int v145 = v34[v144];
          int v146 = 4;
          int v147 = v35 + v146;
          int v148;
          v148 = v147;
          switch (v145) {
            case 0:
              {
              int v149 = 2;
              v148 = v149;
              break;
            }
            default:
              {
              int v150 = 2;
              int v151 = v35 + v150;
              v148 = v151;
            }
            case 1:
              {
              v148 = v35;
            }
            case 2:
              {
              int v152 = 2;
              int v153 = v35 + v152;
              v148 = v153;
              break;
            }
          }
          bool v154 = true;
          v135 = v148;
        }
        default:
          {
          int v155 = 88;
          int v156 = v155 + v35;
          int v157 = v34[v156];
          int v158 = 0;
          bool v159 = v157 != v158;
          int v160;
          if (v159) {
            int v161 = 2;
            v160 = v161;
          } else {
            int v162 = 1;
            v160 = v162;
          }
          v135 = v160;
          break;
        }
      }
      v47 = v135;
      break;
    }
    case 2:
      {
      int v163 = 92;
      int v164 = v163 + v35;
      int v165 = v34[v164];
      int v166 = 3;
      int v167;
      v167 = v166;
      switch (v165) {
        case 0:
          {
          int v168 = 0;
          int v169 = 0;
          int v170;
          int v171;
          v170 = v168;
          v171 = v169;
          while (true) {
            int v172 = 4;
            int v173 = v171 * v172;
            int v174 = v173 + v35;
            int v175 = 96;
            int v176 = v175 + v174;
            int v177 = v34[v176];
            int v178 = 0;
            bool v179 = v177 != v178;
            v170 = v170;
            v171 = v171;
            if (!v179) break;
            int v180 = v170 + v171;
            int v181 = 1;
            int v182 = v171 + v181;
            bool v183 = true;
            v170 = v180;
            v171 = v182;
            break;
            ;
          }
          v167 = v170;
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
            int v190 = v189 + v35;
            int v191 = 116;
            int v192 = v191 + v190;
            int v193 = v34[v192];
            int v194 = 0;
            bool v195 = v193 != v194;
            v186 = v186;
            v187 = v187;
            if (!v195) break;
            int v196 = v186 + v187;
            int v197 = 1;
            int v198 = v187 + v197;
            bool v199 = true;
            v186 = v196;
            v187 = v198;
          }
          v167 = v186;
          break;
        }
        case 1:
          {
          int v200 = 136;
          int v201 = v200 + v35;
          int v202 = v34[v201];
          int v203 = 3;
          int v204 = v35 + v203;
          int v205;
          v205 = v204;
          switch (v202) {
            case 0:
              {
              int v206 = 1;
              int v207 = v35 + v206;
              v205 = v207;
            }
            case 1:
              {
              int v208 = 4;
              int v209 = v35 + v208;
              v205 = v209;
              break;
            }
            default:
              {
              v205 = v35;
              break;
            }
            case 2:
              {
              v205 = v35;
              break;
            }
          }
          v167 = v205;
          break;
        }
      }
      v47 = v167;
      break;
    }
  }
  int v210 = 140;
  int v211 = v210 + v35;
  int v212 = v34[v211];
  int v213 = 0;
  bool v214 = v212 != v213;
  int v215;
  if (v214) {
    int v216 = 144;
    int v217 = v216 + v35;
    int v218 = v34[v217];
    int v219 = 0;
    bool v220 = v218 != v219;
    int v221;
    if (v220) {
      int v222 = 148;
      int v223 = v222 + v35;
      int v224 = v34[v223];
      int v225 = 2;
      int v226 = v35 + v225;
      int v227;
      v227 = v226;
      switch (v224) {
        case 0:
          {
          int v228 = 0;
          v227 = v228;
          break;
        }
        default:
          {
          v227 = v35;
          break;
        }
        case 1:
          {
          v227 = v35;
          break;
        }
        case 2:
          {
          v227 = v35;
          break;
        }
      }
      v221 = v227;
    } else {
      int v229 = 152;
      int v230 = v229 + v35;
      int v231 = v34[v230];
      int v232 = 0;
      bool v233 = v231 != v232;
      int v234;
      if (v233) {
        int v235 = 3;
        v234 = v235;
      } else {
        uint v236 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v237 = (int)(v236);
        v234 = v237;
      }
      int v238 = 16;
      int v239 = v238 + v35;
      bool v240 = true;
      int v241 = simt_wave_count_bits(v240);
      v33[v239] = v241;
      v221 = v234;
    }
    int v242 = 32;
    int v243 = v242 + v35;
    bool v244 = true;
    int v245 = simt_wave_count_bits(v244);
    v33[v243] = v245;
    v215 = v221;
  } else {
    int v246 = 0;
    int v247 = 0;
    int v248;
    int v249;
    v248 = v246;
    v249 = v247;
    while (true) {
      int v250 = 4;
      int v251 = v249 * v250;
      int v252 = v251 + v35;
      int v253 = 156;
      int v254 = v253 + v252;
      int v255 = v34[v254];
      int v256 = 0;
      bool v257 = v255 != v256;
      v248 = v248;
      v249 = v249;
      if (!v257) break;
      int v258 = 176;
      int v259 = v258 + v35;
      int v260 = v34[v259];
      int v261;
      v261 = v35;
      switch (v260) {
        default:
          {
          int v262 = 4;
          v261 = v262;
          break;
        }
        case 0:
          {
          v261 = v35;
          break;
        }
      }
      int v263 = v248 + v261;
      int v264 = 1;
      int v265 = v249 + v264;
      bool v266 = true;
      int v267 = 48;
      int v268 = 4;
      int v269 = v249 * v268;
      int v270 = v267 + v269;
      int v271 = v270 + v35;
      bool v272 = true;
      int v273 = simt_wave_count_bits(v272);
      v33[v271] = v273;
      v248 = v263;
      v249 = v265;
    }
    v215 = v248;
  }
  int v274 = 64;
  int v275 = v274 + v35;
  bool v276 = true;
  int v277 = simt_wave_count_bits(v276);
  v33[v275] = v277;
  int v278 = 3;
  int v279 = v35 + v278;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 180; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
