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
  int v5 = 3;
  int v6 = v3 % v5;
  int v7;
  v7 = v0;
  switch (v6) {
    default:
      {
      int v8 = 2;
      int v9 = v3 % v8;
      int v10 = 1;
      int v11;
      v11 = v10;
      switch (v9) {
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
            int v21 = 1;
            int v22 = v0 + v21;
            int v23 = 1;
            int v24 = v15 + v23;
            v14 = v22;
            v15 = v24;
            break;
            ;
          }
          int v25 = 4;
          v11 = v14;
          break;
        }
        default:
          {
          int v26 = 0;
          int v27 = 0;
          int v28;
          int v29;
          v28 = v26;
          v29 = v27;
          while (true) {
            int v30 = 4;
            int v31 = v3 % v30;
            int v32 = 1;
            int v33 = v31 + v32;
            bool v34 = v29 < v33;
            v28 = v28;
            v29 = v29;
            if (!v34) break;
            int v35 = 4;
            int v36 = v0 + v35;
            int v37 = 1;
            int v38 = v29 + v37;
            v28 = v36;
            v29 = v38;
          }
          int v39 = 2;
          v11 = v28;
          break;
        }
        case 1:
          {
          int v40 = 0;
          int v41 = 0;
          int v42;
          int v43;
          v42 = v40;
          v43 = v41;
          while (true) {
            int v44 = 4;
            int v45 = v3 % v44;
            int v46 = 1;
            int v47 = v45 + v46;
            bool v48 = v43 < v47;
            v42 = v42;
            v43 = v43;
            if (!v48) break;
            int v49 = 0;
            int v50 = 1;
            int v51 = v43 + v50;
            v42 = v49;
            v43 = v51;
          }
          v11 = v42;
          break;
        }
      }
      int v52 = 4;
      int v53 = v0 + v52;
      v7 = v11;
      break;
    }
    case 0:
      {
      v7 = v0;
    }
    case 1:
      {
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
        int v63 = 4;
        int v64 = 1;
        int v65 = v57 + v64;
        v56 = v63;
        v57 = v65;
      }
      int v66 = 2;
      int v67 = v0 + v66;
      v7 = v56;
      break;
    }
  }
  bool v68 = true;
  int v69 = simt_wave_count_bits(v68);
  int v70 = 0;
  int v71 = v70 + v0;
  v1[v71] = v69;
  int v72 = 0;
  bool v73 = v2 != v72;
  int v74 = v73 ? v4 : v7;
  return;
}

kernel void kernel_main(device int* v75 [[buffer(0)]], device int* v76 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v77 = static_cast<int>(__simt_tid3.x);
  int v78 = 0;
  int v79 = v78 + v77;
  int v80 = v76[v79];
  int v81 = 4;
  int v82 = v81 + v77;
  int v83 = v76[v82];
  helper0(v77, v75, v80, v83, static_cast<int>(__simt_tid3.x));
  int v84 = 8;
  int v85 = v84 + v77;
  int v86 = v76[v85];
  uint v87 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v88 = (int)(v87);
  int v89;
  v89 = v88;
  switch (v86) {
    case 0:
      {
      int v90 = 12;
      int v91 = v90 + v77;
      int v92 = v76[v91];
      int v93 = 3;
      int v94;
      v94 = v93;
      switch (v92) {
        default:
          {
          int v95 = 0;
          int v96 = 0;
          int v97;
          int v98;
          v97 = v95;
          v98 = v96;
          while (true) {
            int v99 = 4;
            int v100 = v98 * v99;
            int v101 = v100 + v77;
            int v102 = 16;
            int v103 = v102 + v101;
            int v104 = v76[v103];
            int v105 = 0;
            bool v106 = v104 != v105;
            v97 = v97;
            v98 = v98;
            if (!v106) break;
            int v107 = v97 + v98;
            int v108 = 1;
            int v109 = v98 + v108;
            v97 = v107;
            v98 = v109;
          }
          bool v110 = true;
          v94 = v97;
          break;
        }
        case 0:
          {
          int v111 = 36;
          int v112 = v111 + v77;
          int v113 = v76[v112];
          int v114 = 1;
          int v115 = v77 + v114;
          int v116;
          v116 = v115;
          switch (v113) {
            case 0:
              {
              int v117 = 1;
              int v118 = v77 + v117;
              v116 = v118;
              break;
            }
            default:
              {
              int v119 = 1;
              v116 = v119;
              break;
            }
            case 1:
              {
              int v120 = 0;
              v116 = v120;
              break;
            }
          }
          bool v121 = true;
          v94 = v116;
          break;
        }
        case 1:
          {
          v94 = v77;
          break;
        }
        case 2:
          {
          int v122 = 40;
          int v123 = v122 + v77;
          int v124 = v76[v123];
          int v125 = 0;
          bool v126 = v124 != v125;
          int v127;
          if (v126) {
            int v128 = 0;
            v127 = v128;
          } else {
            v127 = v77;
          }
          v94 = v127;
          break;
        }
      }
      bool v129 = true;
      v89 = v94;
      break;
    }
    default:
      {
      int v130 = 44;
      int v131 = v130 + v77;
      int v132 = v76[v131];
      int v133 = 3;
      int v134;
      v134 = v133;
      switch (v132) {
        default:
          {
          v134 = v77;
        }
        case 0:
          {
          int v135 = 48;
          int v136 = v135 + v77;
          int v137 = v76[v136];
          int v138;
          v138 = v77;
          switch (v137) {
            default:
              {
              int v139 = 3;
              int v140 = v77 + v139;
              v138 = v140;
              break;
            }
            case 0:
              {
              v138 = v77;
              break;
            }
          }
          bool v141 = true;
          v134 = v138;
        }
        case 1:
          {
          int v142 = 0;
          int v143 = 0;
          int v144;
          int v145;
          v144 = v142;
          v145 = v143;
          while (true) {
            int v146 = 4;
            int v147 = v145 * v146;
            int v148 = v147 + v77;
            int v149 = 52;
            int v150 = v149 + v148;
            int v151 = v76[v150];
            int v152 = 0;
            bool v153 = v151 != v152;
            v144 = v144;
            v145 = v145;
            if (!v153) break;
            int v154 = v144 + v145;
            int v155 = 1;
            int v156 = v145 + v155;
            v144 = v154;
            v145 = v156;
          }
          bool v157 = true;
          v134 = v144;
          break;
        }
        case 2:
          {
          int v158 = 72;
          int v159 = v158 + v77;
          int v160 = v76[v159];
          int v161 = 0;
          bool v162 = v160 != v161;
          int v163;
          if (v162) {
            int v164 = 1;
            int v165 = v77 + v164;
            v163 = v165;
          } else {
            int v166 = 3;
            int v167 = v77 + v166;
            v163 = v167;
          }
          v134 = v163;
          break;
        }
      }
      bool v168 = true;
      v89 = v134;
      break;
    }
    case 1:
      {
      int v169 = 0;
      int v170 = 0;
      int v171;
      int v172;
      v171 = v169;
      v172 = v170;
      while (true) {
        int v173 = 4;
        int v174 = v172 * v173;
        int v175 = v174 + v77;
        int v176 = 76;
        int v177 = v176 + v175;
        int v178 = v76[v177];
        int v179 = 0;
        bool v180 = v178 != v179;
        v171 = v171;
        v172 = v172;
        if (!v180) break;
        int v181 = 3;
        int v182 = v171 + v181;
        int v183 = 1;
        int v184 = v172 + v183;
        v171 = v182;
        v172 = v184;
      }
      bool v185 = true;
      v89 = v171;
      break;
    }
    case 2:
      {
      int v186 = 0;
      int v187 = 0;
      int v188;
      int v189;
      v188 = v186;
      v189 = v187;
      while (true) {
        int v190 = 4;
        int v191 = v189 * v190;
        int v192 = v191 + v77;
        int v193 = 96;
        int v194 = v193 + v192;
        int v195 = v76[v194];
        int v196 = 0;
        bool v197 = v195 != v196;
        v188 = v188;
        v189 = v189;
        if (!v197) break;
        int v198 = v188 + v189;
        int v199 = 1;
        int v200 = v189 + v199;
        v188 = v198;
        v189 = v200;
      }
      bool v201 = true;
      v89 = v188;
      break;
    }
  }
  bool v202 = true;
  int v203 = 16;
  int v204 = v203 + v77;
  bool v205 = true;
  int v206 = simt_wave_count_bits(v205);
  v75[v204] = v206;
  int v207 = 4;
  int v208 = v77 + v207;
  int v209 = 116;
  int v210 = v209 + v77;
  int v211 = v76[v210];
  int v212 = 2;
  int v213 = v77 + v212;
  int v214;
  v214 = v213;
  switch (v211) {
    case 0:
      {
      int v215 = 120;
      int v216 = v215 + v77;
      int v217 = v76[v216];
      int v218 = 0;
      int v219;
      v219 = v218;
      switch (v217) {
        default:
          {
          int v220 = 124;
          int v221 = v220 + v77;
          int v222 = v76[v221];
          int v223 = 0;
          bool v224 = v222 != v223;
          int v225;
          if (v224) {
            v225 = v77;
          } else {
            int v226 = 3;
            v225 = v226;
          }
          v219 = v225;
          break;
        }
        case 0:
          {
          int v227 = 128;
          int v228 = v227 + v77;
          int v229 = v76[v228];
          int v230;
          v230 = v77;
          switch (v229) {
            case 0:
              {
              v230 = v77;
            }
            default:
              {
              v230 = v77;
              break;
            }
            case 1:
              {
              int v231 = 4;
              v230 = v231;
            }
            case 2:
              {
              int v232 = 0;
              int v233 = v77 + v232;
              v230 = v233;
              break;
            }
          }
          bool v234 = true;
          v219 = v230;
          break;
        }
        case 1:
          {
          int v235 = 132;
          int v236 = v235 + v77;
          int v237 = v76[v236];
          int v238 = 0;
          bool v239 = v237 != v238;
          int v240;
          if (v239) {
            v240 = v77;
          } else {
            int v241 = 4;
            int v242 = v77 + v241;
            v240 = v242;
          }
          v219 = v240;
          break;
        }
        case 2:
          {
          int v243 = 136;
          int v244 = v243 + v77;
          int v245 = v76[v244];
          int v246 = 0;
          bool v247 = v245 != v246;
          int v248;
          if (v247) {
            int v249 = 1;
            int v250 = v77 + v249;
            v248 = v250;
          } else {
            v248 = v77;
          }
          v219 = v248;
          break;
        }
      }
      bool v251 = true;
      v214 = v219;
    }
    default:
      {
      int v252 = 3;
      int v253 = v77 + v252;
      v214 = v253;
      break;
    }
    case 1:
      {
      int v254 = 0;
      int v255 = 0;
      int v256;
      int v257;
      v256 = v254;
      v257 = v255;
      while (true) {
        int v258 = 4;
        int v259 = v257 * v258;
        int v260 = v259 + v77;
        int v261 = 140;
        int v262 = v261 + v260;
        int v263 = v76[v262];
        int v264 = 0;
        bool v265 = v263 != v264;
        v256 = v256;
        v257 = v257;
        if (!v265) break;
        int v266 = v256 + v257;
        int v267 = 1;
        int v268 = v257 + v267;
        v256 = v266;
        v257 = v268;
        break;
        ;
      }
      bool v269 = true;
      v214 = v256;
      break;
    }
  }
  bool v270 = true;
  int v271 = 32;
  int v272 = v271 + v77;
  bool v273 = true;
  int v274 = simt_wave_count_bits(v273);
  v75[v272] = v274;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 160; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
