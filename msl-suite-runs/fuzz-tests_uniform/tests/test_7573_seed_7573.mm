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
  int v4 = 3;
  int v5 = v3 % v4;
  int v6 = 4;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      v8 = v0;
      break;
    }
    case 1:
      {
      int v9 = 4;
      int v10 = v3 % v9;
      int v11;
      v11 = v0;
      switch (v10) {
        case 0:
          {
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
            int v21 = 2;
            int v22 = 1;
            int v23 = v15 + v22;
            v14 = v21;
            v15 = v23;
            continue;
            ;
          }
          int v24 = 2;
          v11 = v14;
          break;
        }
        case 1:
          {
          int v25 = 1;
          int v26 = v0 + v25;
          v11 = v26;
          break;
        }
        case 2:
          {
          int v27 = 0;
          int v28 = 0;
          int v29;
          int v30;
          v29 = v27;
          v30 = v28;
          while (true) {
            int v31 = 4;
            int v32 = v3 % v31;
            int v33 = 1;
            int v34 = v32 + v33;
            bool v35 = v30 < v34;
            v29 = v29;
            v30 = v30;
            if (!v35) break;
            int v36 = 1;
            int v37 = v30 + v36;
            v29 = v0;
            v30 = v37;
            continue;
            ;
          }
          v11 = v29;
          break;
        }
        default:
          {
          int v38 = 0;
          bool v39 = v2 != v38;
          int v40;
          if (v39) {
            v40 = v0;
          } else {
            int v41 = 0;
            int v42 = v0 + v41;
            v40 = v42;
          }
          v11 = v40;
          break;
        }
      }
      int v43 = 0;
      int v44 = v0 + v43;
      v8 = v11;
      break;
    }
    case 2:
      {
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
        bool v55 = v2 != v54;
        int v56;
        if (v55) {
          v56 = v0;
        } else {
          int v57 = 3;
          int v58 = v0 + v57;
          v56 = v58;
        }
        int v59 = 1;
        int v60 = v0 + v59;
        int v61 = 1;
        int v62 = v48 + v61;
        v47 = v56;
        v48 = v62;
      }
      int v63 = 2;
      v8 = v47;
      break;
    }
    default:
      {
      int v64 = 4;
      int v65 = v3 % v64;
      int v66;
      v66 = v0;
      switch (v65) {
        default:
          {
          int v67 = 0;
          bool v68 = v2 != v67;
          int v69;
          if (v68) {
            int v70 = 3;
            v69 = v70;
          } else {
            v69 = v0;
          }
          int v71 = 0;
          int v72 = v0 + v71;
          v66 = v69;
          break;
        }
        case 0:
          {
          int v73 = 1;
          int v74 = v0 + v73;
          v66 = v74;
        }
        case 1:
          {
          int v75 = 0;
          bool v76 = v2 != v75;
          int v77;
          if (v76) {
            int v78 = 0;
            v77 = v78;
          } else {
            int v79 = 3;
            int v80 = v0 + v79;
            v77 = v80;
          }
          int v81 = 1;
          int v82 = v0 + v81;
          v66 = v77;
        }
        case 2:
          {
          int v83 = 0;
          int v84 = v0 + v83;
          v66 = v84;
          break;
        }
      }
      int v85 = 1;
      v8 = v66;
      break;
    }
  }
  bool v86 = true;
  int v87 = simt_wave_count_bits(v86);
  int v88 = 0;
  int v89 = v88 + v0;
  v1[v89] = v87;
  return;
}

kernel void kernel_main(device int* v90 [[buffer(0)]], device int* v91 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v92 = static_cast<int>(__simt_tid3.x);
  int v93 = 0;
  int v94 = v93 + v92;
  int v95 = v91[v94];
  int v96 = 4;
  int v97 = v96 + v92;
  int v98 = v91[v97];
  helper0(v92, v90, v95, v98, static_cast<int>(__simt_tid3.x));
  int v99 = 8;
  int v100 = v99 + v92;
  int v101 = v91[v100];
  int v102 = 3;
  int v103 = v92 + v102;
  int v104;
  v104 = v103;
  switch (v101) {
    case 0:
      {
      int v105 = 12;
      int v106 = v105 + v92;
      int v107 = v91[v106];
      int v108 = 4;
      int v109 = v92 + v108;
      int v110;
      v110 = v109;
      switch (v107) {
        default:
          {
          int v111 = 16;
          int v112 = v111 + v92;
          int v113 = v91[v112];
          int v114 = 0;
          int v115 = v92 + v114;
          int v116;
          v116 = v115;
          switch (v113) {
            case 0:
              {
              int v117 = 4;
              v116 = v117;
              break;
            }
            case 1:
              {
              int v118 = 4;
              int v119 = v92 + v118;
              v116 = v119;
              break;
            }
            default:
              {
              v116 = v92;
              break;
            }
            case 2:
              {
              int v120 = 4;
              v116 = v120;
              break;
            }
          }
          bool v121 = true;
          v110 = v116;
          break;
        }
        case 0:
          {
          int v122 = 20;
          int v123 = v122 + v92;
          int v124 = v91[v123];
          int v125 = 0;
          bool v126 = v124 != v125;
          int v127;
          if (v126) {
            int v128 = 2;
            v127 = v128;
          } else {
            int v129 = 1;
            v127 = v129;
          }
          v110 = v127;
          break;
        }
        case 1:
          {
          int v130 = 1;
          v110 = v130;
          break;
        }
      }
      bool v131 = true;
      v104 = v110;
    }
    case 1:
      {
      int v132 = 2;
      v104 = v132;
      break;
    }
    default:
      {
      int v133 = 24;
      int v134 = v133 + v92;
      int v135 = v91[v134];
      int v136;
      v136 = v92;
      switch (v135) {
        case 0:
          {
          int v137 = 28;
          int v138 = v137 + v92;
          int v139 = v91[v138];
          int v140 = 0;
          bool v141 = v139 != v140;
          int v142;
          if (v141) {
            int v143 = 1;
            v142 = v143;
          } else {
            v142 = v92;
          }
          v136 = v142;
          break;
        }
        case 1:
          {
          int v144 = 3;
          int v145 = v92 + v144;
          v136 = v145;
          break;
        }
        default:
          {
          int v146 = 0;
          int v147 = 0;
          int v148;
          int v149;
          v148 = v146;
          v149 = v147;
          while (true) {
            int v150 = 4;
            int v151 = v149 * v150;
            int v152 = v151 + v92;
            int v153 = 32;
            int v154 = v153 + v152;
            int v155 = v91[v154];
            int v156 = 0;
            bool v157 = v155 != v156;
            v148 = v148;
            v149 = v149;
            if (!v157) break;
            int v158 = v148 + v149;
            int v159 = 1;
            int v160 = v149 + v159;
            v148 = v158;
            v149 = v160;
          }
          bool v161 = true;
          v136 = v148;
          break;
        }
        case 2:
          {
          int v162 = 1;
          int v163 = v92 + v162;
          v136 = v163;
          break;
        }
      }
      bool v164 = true;
      v104 = v136;
    }
    case 2:
      {
      int v165 = 52;
      int v166 = v165 + v92;
      int v167 = v91[v166];
      int v168;
      v168 = v92;
      switch (v167) {
        case 0:
          {
          int v169 = 56;
          int v170 = v169 + v92;
          int v171 = v91[v170];
          int v172 = 4;
          int v173 = v92 + v172;
          int v174;
          v174 = v173;
          switch (v171) {
            case 0:
              {
              v174 = v92;
              break;
            }
            default:
              {
              v174 = v92;
              break;
            }
            case 1:
              {
              v174 = v92;
              break;
            }
            case 2:
              {
              int v175 = 1;
              v174 = v175;
              break;
            }
          }
          bool v176 = true;
          v168 = v174;
          break;
        }
        default:
          {
          int v177 = 60;
          int v178 = v177 + v92;
          int v179 = v91[v178];
          int v180;
          v180 = v92;
          switch (v179) {
            case 0:
              {
              v180 = v92;
              break;
            }
            case 1:
              {
              v180 = v92;
              break;
            }
            case 2:
              {
              v180 = v92;
              break;
            }
            default:
              {
              int v181 = 0;
              int v182 = v92 + v181;
              v180 = v182;
              break;
            }
          }
          bool v183 = true;
          v168 = v180;
        }
        case 1:
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
            int v190 = v189 + v92;
            int v191 = 64;
            int v192 = v191 + v190;
            int v193 = v91[v192];
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
          }
          bool v199 = true;
          v168 = v186;
        }
        case 2:
          {
          int v200 = 84;
          int v201 = v200 + v92;
          int v202 = v91[v201];
          int v203 = 0;
          bool v204 = v202 != v203;
          int v205;
          if (v204) {
            int v206 = 0;
            v205 = v206;
          } else {
            int v207 = 3;
            int v208 = v92 + v207;
            v205 = v208;
          }
          v168 = v205;
          break;
        }
      }
      bool v209 = true;
      v104 = v168;
      break;
    }
  }
  bool v210 = true;
  int v211 = 16;
  int v212 = v211 + v92;
  bool v213 = true;
  int v214 = simt_wave_count_bits(v213);
  v90[v212] = v214;
  int v215 = 88;
  int v216 = v215 + v92;
  int v217 = v91[v216];
  int v218 = 0;
  bool v219 = v217 != v218;
  int v220;
  if (v219) {
    int v221 = 92;
    int v222 = v221 + v92;
    int v223 = v91[v222];
    int v224 = 0;
    bool v225 = v223 != v224;
    int v226;
    if (v225) {
      uint v227 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v228 = (int)(v227);
      v226 = v228;
    } else {
      int v229 = 96;
      int v230 = v229 + v92;
      int v231 = v91[v230];
      int v232 = 0;
      bool v233 = v231 != v232;
      int v234;
      if (v233) {
        uint v235 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v236 = (int)(v235);
        v234 = v236;
      } else {
        uint v237 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v238 = (int)(v237);
        v234 = v238;
      }
      v226 = v234;
    }
    v220 = v226;
  } else {
    int v239 = 100;
    int v240 = v239 + v92;
    int v241 = v91[v240];
    int v242 = 0;
    bool v243 = v241 != v242;
    int v244;
    if (v243) {
      int v245 = 0;
      int v246 = 0;
      int v247;
      int v248;
      v247 = v245;
      v248 = v246;
      while (true) {
        int v249 = 4;
        int v250 = v248 * v249;
        int v251 = v250 + v92;
        int v252 = 104;
        int v253 = v252 + v251;
        int v254 = v91[v253];
        int v255 = 0;
        bool v256 = v254 != v255;
        v247 = v247;
        v248 = v248;
        if (!v256) break;
        int v257 = v247 + v248;
        int v258 = 1;
        int v259 = v248 + v258;
        v247 = v257;
        v248 = v259;
      }
      bool v260 = true;
      v244 = v247;
    } else {
      int v261 = 124;
      int v262 = v261 + v92;
      int v263 = v91[v262];
      uint v264 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v265 = (int)(v264);
      int v266;
      v266 = v265;
      switch (v263) {
        case 0:
          {
          v266 = v92;
          break;
        }
        case 1:
          {
          v266 = v92;
          break;
        }
        default:
          {
          int v267 = 2;
          v266 = v267;
        }
        case 2:
          {
          int v268 = 3;
          v266 = v268;
          break;
        }
      }
      bool v269 = true;
      v244 = v266;
    }
    v220 = v244;
  }
  int v270 = 32;
  int v271 = v270 + v92;
  bool v272 = true;
  int v273 = simt_wave_count_bits(v272);
  v90[v271] = v273;
  uint v274 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v275 = (int)(v274);
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 128; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
