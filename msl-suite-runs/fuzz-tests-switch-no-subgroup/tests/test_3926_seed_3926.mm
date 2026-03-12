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
        bool v19 = true;
        int v20 = simt_wave_count_bits(v19);
        int v21 = 0;
        int v22 = 4;
        int v23 = v10 * v22;
        int v24 = v21 + v23;
        int v25 = v24 + v0;
        v1[v25] = v20;
        v18 = v20;
      } else {
        bool v26 = true;
        int v27 = simt_wave_count_bits(v26);
        int v28 = 16;
        int v29 = 4;
        int v30 = v10 * v29;
        int v31 = v28 + v30;
        int v32 = v31 + v0;
        v1[v32] = v27;
        v18 = v27;
      }
      int v33 = 1;
      int v34 = v10 + v33;
      v9 = v18;
      v10 = v34;
      break;
      ;
    }
    v6 = v9;
  } else {
    int v35 = 0;
    bool v36 = v2 != v35;
    int v37;
    if (v36) {
      int v38 = 0;
      bool v39 = v2 != v38;
      int v40;
      if (v39) {
        bool v41 = true;
        int v42 = simt_wave_count_bits(v41);
        int v43 = 32;
        int v44 = v43 + v0;
        v1[v44] = v42;
        v40 = v42;
      } else {
        bool v45 = true;
        int v46 = simt_wave_count_bits(v45);
        int v47 = 48;
        int v48 = v47 + v0;
        v1[v48] = v46;
        v40 = v46;
      }
      v37 = v40;
    } else {
      int v49 = 2;
      int v50 = v3 % v49;
      int v51 = 0;
      int v52;
      v52 = v51;
      switch (v50) {
        case 0:
          {
          int v53 = 1;
          v52 = v53;
          break;
        }
        default:
          {
          int v54 = 4;
          int v55 = v0 + v54;
          v52 = v55;
          break;
        }
        case 1:
          {
          int v56 = 4;
          v52 = v56;
          break;
        }
      }
      v37 = v52;
    }
    v6 = v37;
  }
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
  uint v66 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v67 = (int)(v66);
  int v68 = 8;
  int v69 = v68 + v59;
  int v70 = v58[v69];
  uint v71 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v72 = (int)(v71);
  int v73;
  v73 = v72;
  switch (v70) {
    case 0:
      {
      int v74 = 12;
      int v75 = v74 + v59;
      int v76 = v58[v75];
      int v77 = 4;
      int v78 = v59 + v77;
      int v79;
      v79 = v78;
      switch (v76) {
        case 0:
          {
          int v80 = 16;
          int v81 = v80 + v59;
          int v82 = v58[v81];
          int v83 = 0;
          bool v84 = v82 != v83;
          int v85;
          if (v84) {
            v85 = v59;
          } else {
            int v86 = 3;
            int v87 = v59 + v86;
            v85 = v87;
          }
          v79 = v85;
        }
        case 1:
          {
          int v88 = 20;
          int v89 = v88 + v59;
          int v90 = v58[v89];
          int v91 = 4;
          int v92;
          v92 = v91;
          switch (v90) {
            case 0:
              {
              int v93 = 2;
              v92 = v93;
              break;
            }
            case 1:
              {
              v92 = v59;
              break;
            }
            default:
              {
              int v94 = 2;
              v92 = v94;
              break;
            }
            case 2:
              {
              v92 = v59;
              break;
            }
          }
          bool v95 = true;
          v79 = v92;
        }
        default:
          {
          int v96 = 0;
          int v97 = 0;
          int v98;
          int v99;
          v98 = v96;
          v99 = v97;
          while (true) {
            int v100 = 4;
            int v101 = v99 * v100;
            int v102 = v101 + v59;
            int v103 = 24;
            int v104 = v103 + v102;
            int v105 = v58[v104];
            int v106 = 0;
            bool v107 = v105 != v106;
            v98 = v98;
            v99 = v99;
            if (!v107) break;
            int v108 = v98 + v99;
            int v109 = 1;
            int v110 = v99 + v109;
            bool v111 = true;
            v98 = v108;
            v99 = v110;
          }
          v79 = v98;
          break;
        }
      }
      v73 = v79;
      break;
    }
    default:
      {
      int v112 = 44;
      int v113 = v112 + v59;
      int v114 = v58[v113];
      int v115 = 0;
      bool v116 = v114 != v115;
      int v117;
      if (v116) {
        int v118 = 48;
        int v119 = v118 + v59;
        int v120 = v58[v119];
        int v121 = 3;
        int v122;
        v122 = v121;
        switch (v120) {
          case 0:
            {
            int v123 = 4;
            int v124 = v59 + v123;
            v122 = v124;
            break;
          }
          default:
            {
            int v125 = 4;
            int v126 = v59 + v125;
            v122 = v126;
            break;
          }
        }
        v117 = v122;
      } else {
        int v127 = 52;
        int v128 = v127 + v59;
        int v129 = v58[v128];
        int v130;
        v130 = v59;
        switch (v129) {
          case 0:
            {
            int v131 = 0;
            int v132 = v59 + v131;
            v130 = v132;
            break;
          }
          default:
            {
            int v133 = 1;
            int v134 = v59 + v133;
            v130 = v134;
            break;
          }
        }
        v117 = v130;
      }
      v73 = v117;
      break;
    }
    case 1:
      {
      int v135 = 56;
      int v136 = v135 + v59;
      int v137 = v58[v136];
      int v138 = 0;
      bool v139 = v137 != v138;
      int v140;
      if (v139) {
        int v141 = 60;
        int v142 = v141 + v59;
        int v143 = v58[v142];
        int v144 = 0;
        bool v145 = v143 != v144;
        int v146;
        if (v145) {
          int v147 = 0;
          int v148 = v59 + v147;
          v146 = v148;
        } else {
          int v149 = 1;
          v146 = v149;
        }
        v140 = v146;
      } else {
        int v150 = 0;
        int v151 = 0;
        int v152;
        int v153;
        v152 = v150;
        v153 = v151;
        while (true) {
          int v154 = 4;
          int v155 = v153 * v154;
          int v156 = v155 + v59;
          int v157 = 64;
          int v158 = v157 + v156;
          int v159 = v58[v158];
          int v160 = 0;
          bool v161 = v159 != v160;
          v152 = v152;
          v153 = v153;
          if (!v161) break;
          int v162 = v152 + v153;
          int v163 = 1;
          int v164 = v153 + v163;
          bool v165 = true;
          v152 = v162;
          v153 = v164;
        }
        v140 = v152;
      }
      v73 = v140;
      break;
    }
    case 2:
      {
      int v166 = 84;
      int v167 = v166 + v59;
      int v168 = v58[v167];
      int v169 = 4;
      int v170 = v59 + v169;
      int v171;
      v171 = v170;
      switch (v168) {
        case 0:
          {
          int v172 = 88;
          int v173 = v172 + v59;
          int v174 = v58[v173];
          int v175 = 1;
          int v176 = v59 + v175;
          int v177;
          v177 = v176;
          switch (v174) {
            default:
              {
              int v178 = 4;
              int v179 = v59 + v178;
              v177 = v179;
              break;
            }
            case 0:
              {
              v177 = v59;
            }
            case 1:
              {
              int v180 = 3;
              int v181 = v59 + v180;
              v177 = v181;
              break;
            }
          }
          v171 = v177;
        }
        default:
          {
          int v182 = 92;
          int v183 = v182 + v59;
          int v184 = v58[v183];
          int v185 = 0;
          bool v186 = v184 != v185;
          int v187;
          if (v186) {
            int v188 = 2;
            v187 = v188;
          } else {
            int v189 = 4;
            int v190 = v59 + v189;
            v187 = v190;
          }
          v171 = v187;
          break;
        }
      }
      v73 = v171;
      break;
    }
  }
  bool v191 = true;
  int v192 = 64;
  int v193 = v192 + v59;
  bool v194 = true;
  int v195 = simt_wave_count_bits(v194);
  v57[v193] = v195;
  int v196 = 96;
  int v197 = v196 + v59;
  int v198 = v58[v197];
  uint v199 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v200 = (int)(v199);
  int v201;
  v201 = v200;
  switch (v198) {
    case 0:
      {
      int v202 = 0;
      int v203 = 0;
      int v204;
      int v205;
      v204 = v202;
      v205 = v203;
      while (true) {
        int v206 = 4;
        int v207 = v205 * v206;
        int v208 = v207 + v59;
        int v209 = 100;
        int v210 = v209 + v208;
        int v211 = v58[v210];
        int v212 = 0;
        bool v213 = v211 != v212;
        v204 = v204;
        v205 = v205;
        if (!v213) break;
        int v214 = 0;
        int v215 = 0;
        int v216;
        int v217;
        v216 = v214;
        v217 = v215;
        while (true) {
          int v218 = 4;
          int v219 = v217 * v218;
          int v220 = v219 + v59;
          int v221 = 120;
          int v222 = v221 + v220;
          int v223 = v58[v222];
          int v224 = 0;
          bool v225 = v223 != v224;
          v216 = v216;
          v217 = v217;
          if (!v225) break;
          int v226 = v216 + v217;
          int v227 = 1;
          int v228 = v217 + v227;
          bool v229 = true;
          v216 = v226;
          v217 = v228;
          break;
          ;
        }
        int v230 = v204 + v216;
        int v231 = 1;
        int v232 = v205 + v231;
        bool v233 = true;
        v204 = v230;
        v205 = v232;
      }
      v201 = v204;
      break;
    }
    case 1:
      {
      v201 = v59;
      break;
    }
    default:
      {
      int v234 = 140;
      int v235 = v234 + v59;
      int v236 = v58[v235];
      int v237 = 4;
      int v238;
      v238 = v237;
      switch (v236) {
        case 0:
          {
          int v239 = 144;
          int v240 = v239 + v59;
          int v241 = v58[v240];
          int v242 = 0;
          bool v243 = v241 != v242;
          int v244;
          if (v243) {
            int v245 = 0;
            v244 = v245;
          } else {
            int v246 = 0;
            v244 = v246;
          }
          v238 = v244;
          break;
        }
        case 1:
          {
          int v247 = 148;
          int v248 = v247 + v59;
          int v249 = v58[v248];
          int v250 = 0;
          bool v251 = v249 != v250;
          int v252;
          if (v251) {
            int v253 = 2;
            v252 = v253;
          } else {
            int v254 = 3;
            int v255 = v59 + v254;
            v252 = v255;
          }
          v238 = v252;
          break;
        }
        default:
          {
          int v256 = 152;
          int v257 = v256 + v59;
          int v258 = v58[v257];
          int v259 = 0;
          bool v260 = v258 != v259;
          int v261;
          if (v260) {
            v261 = v59;
          } else {
            v261 = v59;
          }
          v238 = v261;
          break;
        }
      }
      v201 = v238;
      break;
    }
    case 2:
      {
      int v262 = 156;
      int v263 = v262 + v59;
      int v264 = v58[v263];
      int v265;
      v265 = v59;
      switch (v264) {
        case 0:
          {
          int v266 = 160;
          int v267 = v266 + v59;
          int v268 = v58[v267];
          int v269;
          v269 = v59;
          switch (v268) {
            case 0:
              {
              v269 = v59;
              break;
            }
            case 1:
              {
              int v270 = 4;
              v269 = v270;
              break;
            }
            case 2:
              {
              int v271 = 2;
              v269 = v271;
            }
            default:
              {
              v269 = v59;
              break;
            }
          }
          bool v272 = true;
          v265 = v269;
          break;
        }
        default:
          {
          int v273 = 164;
          int v274 = v273 + v59;
          int v275 = v58[v274];
          int v276;
          v276 = v59;
          switch (v275) {
            case 0:
              {
              int v277 = 4;
              v276 = v277;
              break;
            }
            case 1:
              {
              int v278 = 2;
              int v279 = v59 + v278;
              v276 = v279;
            }
            default:
              {
              int v280 = 3;
              v276 = v280;
              break;
            }
          }
          bool v281 = true;
          v265 = v276;
          break;
        }
      }
      bool v282 = true;
      v201 = v265;
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 168; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
