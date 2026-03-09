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
    int v13 = 0;
    int v14 = 0;
    int v15;
    int v16;
    v15 = v13;
    v16 = v14;
    while (true) {
      int v17 = 4;
      int v18 = v3 % v17;
      int v19 = 1;
      int v20 = v18 + v19;
      bool v21 = v16 < v20;
      v15 = v15;
      v16 = v16;
      if (!v21) break;
      bool v22 = true;
      int v23 = simt_wave_count_bits(v22);
      int v24 = 0;
      int v25 = 4;
      int v26 = v16 * v25;
      int v27 = v24 + v26;
      int v28 = v27 + v0;
      v1[v28] = v23;
      int v29 = 1;
      int v30 = v16 + v29;
      v15 = v23;
      v16 = v30;
      break;
      ;
    }
    int v31 = 1;
    int v32 = v7 + v31;
    v6 = v15;
    v7 = v32;
  }
  int v33 = 4;
  int v34 = v3 % v33;
  int v35 = 1;
  int v36;
  v36 = v35;
  switch (v34) {
    case 0:
      {
      int v37 = 0;
      int v38 = 0;
      int v39;
      int v40;
      v39 = v37;
      v40 = v38;
      while (true) {
        int v41 = 4;
        int v42 = v3 % v41;
        int v43 = 1;
        int v44 = v42 + v43;
        bool v45 = v40 < v44;
        v39 = v39;
        v40 = v40;
        if (!v45) break;
        int v46 = 3;
        int v47 = v3 % v46;
        int v48 = 0;
        int v49 = v0 + v48;
        int v50;
        v50 = v49;
        switch (v47) {
          default:
            {
            int v51 = 1;
            int v52 = v0 + v51;
            v50 = v52;
            break;
          }
          case 0:
            {
            int v53 = 4;
            int v54 = v0 + v53;
            v50 = v54;
            break;
          }
          case 1:
            {
            int v55 = 3;
            int v56 = v0 + v55;
            v50 = v56;
            break;
          }
        }
        int v57 = 1;
        int v58 = v40 + v57;
        v39 = v50;
        v40 = v58;
      }
      v36 = v39;
      break;
    }
    default:
      {
      int v59 = 0;
      int v60 = 0;
      int v61;
      int v62;
      v61 = v59;
      v62 = v60;
      while (true) {
        int v63 = 4;
        int v64 = v3 % v63;
        int v65 = 1;
        int v66 = v64 + v65;
        bool v67 = v62 < v66;
        v61 = v61;
        v62 = v62;
        if (!v67) break;
        int v68 = 4;
        int v69 = v3 % v68;
        int v70 = 2;
        int v71;
        v71 = v70;
        switch (v69) {
          case 0:
            {
            int v72 = 2;
            v71 = v72;
            break;
          }
          case 1:
            {
            v71 = v0;
            break;
          }
          case 2:
            {
            int v73 = 2;
            int v74 = v0 + v73;
            v71 = v74;
            break;
          }
          default:
            {
            int v75 = 3;
            v71 = v75;
            break;
          }
        }
        int v76 = 1;
        int v77 = v62 + v76;
        v61 = v71;
        v62 = v77;
      }
      v36 = v61;
      break;
    }
    case 1:
      {
      int v78 = 0;
      int v79 = 0;
      int v80;
      int v81;
      v80 = v78;
      v81 = v79;
      while (true) {
        int v82 = 4;
        int v83 = v3 % v82;
        int v84 = 1;
        int v85 = v83 + v84;
        bool v86 = v81 < v85;
        v80 = v80;
        v81 = v81;
        if (!v86) break;
        int v87 = 0;
        int v88 = 0;
        int v89;
        int v90;
        v89 = v87;
        v90 = v88;
        while (true) {
          int v91 = 4;
          int v92 = v3 % v91;
          int v93 = 1;
          int v94 = v92 + v93;
          bool v95 = v90 < v94;
          v89 = v89;
          v90 = v90;
          if (!v95) break;
          int v96 = 2;
          int v97 = 1;
          int v98 = v90 + v97;
          v89 = v96;
          v90 = v98;
        }
        int v99 = 1;
        int v100 = v81 + v99;
        v80 = v89;
        v81 = v100;
      }
      v36 = v80;
      break;
    }
    case 2:
      {
      int v101 = 0;
      bool v102 = v2 != v101;
      int v103;
      if (v102) {
        int v104 = 2;
        int v105 = v3 % v104;
        int v106 = 1;
        int v107 = v0 + v106;
        int v108;
        v108 = v107;
        switch (v105) {
          case 0:
            {
            v108 = v0;
          }
          default:
            {
            int v109 = 4;
            int v110 = v0 + v109;
            v108 = v110;
            break;
          }
        }
        v103 = v108;
      } else {
        int v111 = 0;
        bool v112 = v2 != v111;
        int v113;
        if (v112) {
          int v114 = 1;
          int v115 = v0 + v114;
          v113 = v115;
        } else {
          v113 = v0;
        }
        v103 = v113;
      }
      v36 = v103;
      break;
    }
  }
  int v116 = 0;
  bool v117 = v2 != v116;
  int v118 = v117 ? v6 : v36;
  return;
}

kernel void kernel_main(device int* v119 [[buffer(0)]], device int* v120 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v121 = static_cast<int>(__simt_tid3.x);
  int v122 = 0;
  int v123 = v122 + v121;
  int v124 = v120[v123];
  int v125 = 4;
  int v126 = v125 + v121;
  int v127 = v120[v126];
  helper0(v121, v119, v124, v127, static_cast<int>(__simt_tid3.x));
  int v128 = 8;
  int v129 = v128 + v121;
  int v130 = v120[v129];
  uint v131 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v132 = (int)(v131);
  int v133;
  v133 = v132;
  switch (v130) {
    default:
      {
      int v134 = 12;
      int v135 = v134 + v121;
      int v136 = v120[v135];
      int v137 = 0;
      bool v138 = v136 != v137;
      int v139;
      if (v138) {
        int v140 = 2;
        v139 = v140;
      } else {
        int v141 = 16;
        int v142 = v141 + v121;
        int v143 = v120[v142];
        int v144;
        v144 = v121;
        switch (v143) {
          default:
            {
            int v145 = 1;
            int v146 = v121 + v145;
            v144 = v146;
          }
          case 0:
            {
            int v147 = 0;
            v144 = v147;
            break;
          }
        }
        v139 = v144;
      }
      v133 = v139;
      break;
    }
    case 0:
      {
      v133 = v121;
      break;
    }
    case 1:
      {
      int v148 = 20;
      int v149 = v148 + v121;
      int v150 = v120[v149];
      int v151 = 0;
      bool v152 = v150 != v151;
      int v153;
      if (v152) {
        int v154 = 2;
        v153 = v154;
      } else {
        int v155 = 24;
        int v156 = v155 + v121;
        int v157 = v120[v156];
        int v158 = 0;
        bool v159 = v157 != v158;
        int v160;
        if (v159) {
          v160 = v121;
        } else {
          int v161 = 4;
          v160 = v161;
        }
        v153 = v160;
      }
      v133 = v153;
      break;
    }
    case 2:
      {
      int v162 = 28;
      int v163 = v162 + v121;
      int v164 = v120[v163];
      int v165 = 3;
      int v166 = v121 + v165;
      int v167;
      v167 = v166;
      switch (v164) {
        case 0:
          {
          int v168 = 32;
          int v169 = v168 + v121;
          int v170 = v120[v169];
          int v171 = 0;
          bool v172 = v170 != v171;
          int v173;
          if (v172) {
            int v174 = 4;
            int v175 = v121 + v174;
            v173 = v175;
          } else {
            int v176 = 3;
            v173 = v176;
          }
          v167 = v173;
          break;
        }
        case 1:
          {
          int v177 = 2;
          v167 = v177;
          break;
        }
        default:
          {
          int v178 = 36;
          int v179 = v178 + v121;
          int v180 = v120[v179];
          int v181;
          v181 = v121;
          switch (v180) {
            case 0:
              {
              int v182 = 0;
              int v183 = v121 + v182;
              v181 = v183;
            }
            case 1:
              {
              int v184 = 2;
              int v185 = v121 + v184;
              v181 = v185;
            }
            case 2:
              {
              int v186 = 2;
              int v187 = v121 + v186;
              v181 = v187;
              break;
            }
            default:
              {
              int v188 = 0;
              int v189 = v121 + v188;
              v181 = v189;
              break;
            }
          }
          v167 = v181;
          break;
        }
        case 2:
          {
          int v190 = 40;
          int v191 = v190 + v121;
          int v192 = v120[v191];
          int v193 = 2;
          int v194;
          v194 = v193;
          switch (v192) {
            case 0:
              {
              int v195 = 1;
              int v196 = v121 + v195;
              v194 = v196;
              break;
            }
            default:
              {
              int v197 = 0;
              v194 = v197;
              break;
            }
          }
          bool v198 = true;
          v167 = v194;
          break;
        }
      }
      bool v199 = true;
      v133 = v167;
      break;
    }
  }
  int v200 = 44;
  int v201 = v200 + v121;
  int v202 = v120[v201];
  int v203 = 2;
  int v204 = v121 + v203;
  int v205;
  v205 = v204;
  switch (v202) {
    default:
      {
      int v206 = 1;
      v205 = v206;
      break;
    }
    case 0:
      {
      int v207 = 0;
      int v208 = v121 + v207;
      v205 = v208;
      break;
    }
    case 1:
      {
      int v209 = 48;
      int v210 = v209 + v121;
      int v211 = v120[v210];
      int v212 = 2;
      int v213;
      v213 = v212;
      switch (v211) {
        case 0:
          {
          int v214 = 52;
          int v215 = v214 + v121;
          int v216 = v120[v215];
          int v217 = 0;
          bool v218 = v216 != v217;
          int v219;
          if (v218) {
            int v220 = 0;
            v219 = v220;
          } else {
            int v221 = 0;
            int v222 = v121 + v221;
            v219 = v222;
          }
          v213 = v219;
          break;
        }
        case 1:
          {
          int v223 = 56;
          int v224 = v223 + v121;
          int v225 = v120[v224];
          int v226 = 0;
          bool v227 = v225 != v226;
          int v228;
          if (v227) {
            v228 = v121;
          } else {
            v228 = v121;
          }
          v213 = v228;
          break;
        }
        default:
          {
          int v229 = 60;
          int v230 = v229 + v121;
          int v231 = v120[v230];
          int v232 = 0;
          bool v233 = v231 != v232;
          int v234;
          if (v233) {
            v234 = v121;
          } else {
            v234 = v121;
          }
          v213 = v234;
          break;
        }
        case 2:
          {
          int v235 = 64;
          int v236 = v235 + v121;
          int v237 = v120[v236];
          int v238 = 0;
          bool v239 = v237 != v238;
          int v240;
          if (v239) {
            int v241 = 3;
            int v242 = v121 + v241;
            v240 = v242;
          } else {
            v240 = v121;
          }
          v213 = v240;
          break;
        }
      }
      v205 = v213;
      break;
    }
    case 2:
      {
      int v243 = 68;
      int v244 = v243 + v121;
      int v245 = v120[v244];
      int v246 = 2;
      int v247;
      v247 = v246;
      switch (v245) {
        default:
          {
          v247 = v121;
          break;
        }
        case 0:
          {
          int v248 = 0;
          int v249 = 0;
          int v250;
          int v251;
          v250 = v248;
          v251 = v249;
          while (true) {
            int v252 = 4;
            int v253 = v251 * v252;
            int v254 = v253 + v121;
            int v255 = 72;
            int v256 = v255 + v254;
            int v257 = v120[v256];
            int v258 = 0;
            bool v259 = v257 != v258;
            v250 = v250;
            v251 = v251;
            if (!v259) break;
            int v260 = v250 + v251;
            int v261 = 1;
            int v262 = v251 + v261;
            bool v263 = true;
            v250 = v260;
            v251 = v262;
          }
          v247 = v250;
          break;
        }
        case 1:
          {
          int v264 = 92;
          int v265 = v264 + v121;
          int v266 = v120[v265];
          int v267 = 0;
          int v268 = v121 + v267;
          int v269;
          v269 = v268;
          switch (v266) {
            case 0:
              {
              int v270 = 2;
              v269 = v270;
              break;
            }
            case 1:
              {
              int v271 = 2;
              v269 = v271;
              break;
            }
            case 2:
              {
              int v272 = 4;
              v269 = v272;
              break;
            }
            default:
              {
              int v273 = 0;
              v269 = v273;
              break;
            }
          }
          v247 = v269;
          break;
        }
      }
      bool v274 = true;
      v205 = v247;
      break;
    }
  }
  int v275 = 0;
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
    static int32_t expected0[] = {static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 4; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 96; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
