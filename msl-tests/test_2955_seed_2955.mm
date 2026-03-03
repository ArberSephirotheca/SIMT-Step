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
  int v4 = 1;
  int v5 = 2;
  int v6 = v3 % v5;
  int v7;
  v7 = v0;
  switch (v6) {
    default:
      {
      int v8 = 0;
      bool v9 = v2 != v8;
      int v10;
      if (v9) {
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
          int v20 = 1;
          int v21 = v14 + v20;
          v13 = v0;
          v14 = v21;
        }
        int v22 = 0;
        int v23 = v0 + v22;
        v10 = v13;
      } else {
        int v24 = 0;
        int v25 = 0;
        int v26;
        int v27;
        v26 = v24;
        v27 = v25;
        while (true) {
          int v28 = 4;
          int v29 = v3 % v28;
          int v30 = 1;
          int v31 = v29 + v30;
          bool v32 = v27 < v31;
          v26 = v26;
          v27 = v27;
          if (!v32) break;
          int v33 = 2;
          int v34 = 1;
          int v35 = v27 + v34;
          v26 = v33;
          v27 = v35;
        }
        v10 = v26;
      }
      int v36 = 1;
      int v37 = v0 + v36;
      v7 = v10;
      break;
    }
    case 0:
      {
      int v38 = 2;
      int v39 = v3 % v38;
      int v40;
      v40 = v0;
      switch (v39) {
        case 0:
          {
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
            int v50 = 0;
            int v51 = 1;
            int v52 = v44 + v51;
            v43 = v50;
            v44 = v52;
          }
          int v53 = 1;
          v40 = v43;
        }
        default:
          {
          int v54 = 0;
          v40 = v54;
          break;
        }
      }
      int v55 = 2;
      int v56 = v0 + v55;
      v7 = v40;
      break;
    }
  }
  bool v57 = true;
  int v58 = simt_wave_count_bits(v57);
  int v59 = 0;
  int v60 = v59 + v0;
  v1[v60] = v58;
  int v61 = 0;
  bool v62 = v2 != v61;
  int v63 = v62 ? v4 : v7;
  return;
}

kernel void kernel_main(device int* v64 [[buffer(0)]], device int* v65 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v66 = static_cast<int>(__simt_tid3.x);
  int v67 = 0;
  int v68 = v67 + v66;
  int v69 = v65[v68];
  int v70 = 4;
  int v71 = v70 + v66;
  int v72 = v65[v71];
  helper0(v66, v64, v69, v72, static_cast<int>(__simt_tid3.x));
  int v73 = 8;
  int v74 = v73 + v66;
  int v75 = v65[v74];
  uint v76 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v77 = (int)(v76);
  int v78;
  v78 = v77;
  switch (v75) {
    case 0:
      {
      int v79 = 12;
      int v80 = v79 + v66;
      int v81 = v65[v80];
      int v82 = 4;
      int v83;
      v83 = v82;
      switch (v81) {
        case 0:
          {
          int v84 = 16;
          int v85 = v84 + v66;
          int v86 = v65[v85];
          int v87 = 0;
          bool v88 = v86 != v87;
          int v89;
          if (v88) {
            int v90 = 3;
            int v91 = v66 + v90;
            v89 = v91;
          } else {
            int v92 = 0;
            v89 = v92;
          }
          v83 = v89;
          break;
        }
        default:
          {
          int v93 = 0;
          int v94 = v66 + v93;
          v83 = v94;
          break;
        }
      }
      bool v95 = true;
      v78 = v83;
    }
    case 1:
      {
      int v96 = 20;
      int v97 = v96 + v66;
      int v98 = v65[v97];
      int v99 = 0;
      bool v100 = v98 != v99;
      int v101;
      if (v100) {
        v101 = v66;
      } else {
        int v102 = 24;
        int v103 = v102 + v66;
        int v104 = v65[v103];
        int v105 = 0;
        bool v106 = v104 != v105;
        int v107;
        if (v106) {
          int v108 = 1;
          v107 = v108;
        } else {
          int v109 = 2;
          int v110 = v66 + v109;
          v107 = v110;
        }
        v101 = v107;
      }
      v78 = v101;
      break;
    }
    case 2:
      {
      int v111 = 28;
      int v112 = v111 + v66;
      int v113 = v65[v112];
      int v114 = 1;
      int v115;
      v115 = v114;
      switch (v113) {
        case 0:
          {
          v115 = v66;
          break;
        }
        case 1:
          {
          int v116 = 32;
          int v117 = v116 + v66;
          int v118 = v65[v117];
          int v119 = 0;
          bool v120 = v118 != v119;
          int v121;
          if (v120) {
            int v122 = 3;
            v121 = v122;
          } else {
            int v123 = 4;
            v121 = v123;
          }
          v115 = v121;
          break;
        }
        default:
          {
          int v124 = 36;
          int v125 = v124 + v66;
          int v126 = v65[v125];
          int v127 = 4;
          int v128;
          v128 = v127;
          switch (v126) {
            case 0:
              {
              int v129 = 3;
              int v130 = v66 + v129;
              v128 = v130;
              break;
            }
            case 1:
              {
              v128 = v66;
              break;
            }
            default:
              {
              int v131 = 4;
              v128 = v131;
            }
            case 2:
              {
              v128 = v66;
              break;
            }
          }
          bool v132 = true;
          v115 = v128;
          break;
        }
        case 2:
          {
          int v133 = 0;
          int v134 = 0;
          int v135;
          int v136;
          v135 = v133;
          v136 = v134;
          while (true) {
            int v137 = 4;
            int v138 = v136 * v137;
            int v139 = v138 + v66;
            int v140 = 40;
            int v141 = v140 + v139;
            int v142 = v65[v141];
            int v143 = 0;
            bool v144 = v142 != v143;
            v135 = v135;
            v136 = v136;
            if (!v144) break;
            int v145 = v135 + v136;
            int v146 = 1;
            int v147 = v136 + v146;
            v135 = v145;
            v136 = v147;
          }
          bool v148 = true;
          v115 = v135;
          break;
        }
      }
      bool v149 = true;
      v78 = v115;
    }
    default:
      {
      int v150 = 60;
      int v151 = v150 + v66;
      int v152 = v65[v151];
      int v153 = 0;
      int v154;
      v154 = v153;
      switch (v152) {
        default:
          {
          int v155 = 0;
          int v156 = 0;
          int v157;
          int v158;
          v157 = v155;
          v158 = v156;
          while (true) {
            int v159 = 4;
            int v160 = v158 * v159;
            int v161 = v160 + v66;
            int v162 = 64;
            int v163 = v162 + v161;
            int v164 = v65[v163];
            int v165 = 0;
            bool v166 = v164 != v165;
            v157 = v157;
            v158 = v158;
            if (!v166) break;
            int v167 = v157 + v158;
            int v168 = 1;
            int v169 = v158 + v168;
            v157 = v167;
            v158 = v169;
          }
          bool v170 = true;
          v154 = v157;
          break;
        }
        case 0:
          {
          int v171 = 1;
          int v172 = v66 + v171;
          v154 = v172;
          break;
        }
        case 1:
          {
          int v173 = 84;
          int v174 = v173 + v66;
          int v175 = v65[v174];
          int v176 = 3;
          int v177;
          v177 = v176;
          switch (v175) {
            case 0:
              {
              v177 = v66;
              break;
            }
            default:
              {
              int v178 = 4;
              int v179 = v66 + v178;
              v177 = v179;
              break;
            }
            case 1:
              {
              v177 = v66;
              break;
            }
          }
          bool v180 = true;
          v154 = v177;
          break;
        }
        case 2:
          {
          int v181 = 88;
          int v182 = v181 + v66;
          int v183 = v65[v182];
          int v184 = 0;
          bool v185 = v183 != v184;
          int v186;
          if (v185) {
            v186 = v66;
          } else {
            int v187 = 3;
            int v188 = v66 + v187;
            v186 = v188;
          }
          v154 = v186;
          break;
        }
      }
      bool v189 = true;
      v78 = v154;
      break;
    }
  }
  bool v190 = true;
  int v191 = 16;
  int v192 = v191 + v66;
  bool v193 = true;
  int v194 = simt_wave_count_bits(v193);
  v64[v192] = v194;
  int v195 = 92;
  int v196 = v195 + v66;
  int v197 = v65[v196];
  int v198;
  v198 = v66;
  switch (v197) {
    case 0:
      {
      int v199 = 0;
      int v200 = 0;
      int v201;
      int v202;
      v201 = v199;
      v202 = v200;
      while (true) {
        int v203 = 4;
        int v204 = v202 * v203;
        int v205 = v204 + v66;
        int v206 = 96;
        int v207 = v206 + v205;
        int v208 = v65[v207];
        int v209 = 0;
        bool v210 = v208 != v209;
        v201 = v201;
        v202 = v202;
        if (!v210) break;
        int v211 = 116;
        int v212 = v211 + v66;
        int v213 = v65[v212];
        int v214 = 0;
        bool v215 = v213 != v214;
        int v216;
        if (v215) {
          int v217 = 4;
          int v218 = v66 + v217;
          v216 = v218;
        } else {
          v216 = v66;
        }
        int v219 = v201 + v216;
        int v220 = 1;
        int v221 = v202 + v220;
        v201 = v219;
        v202 = v221;
      }
      bool v222 = true;
      v198 = v201;
      break;
    }
    case 1:
      {
      int v223 = 4;
      int v224 = v66 + v223;
      v198 = v224;
      break;
    }
    default:
      {
      int v225 = 0;
      int v226 = 0;
      int v227;
      int v228;
      v227 = v225;
      v228 = v226;
      while (true) {
        int v229 = 4;
        int v230 = v228 * v229;
        int v231 = v230 + v66;
        int v232 = 120;
        int v233 = v232 + v231;
        int v234 = v65[v233];
        int v235 = 0;
        bool v236 = v234 != v235;
        v227 = v227;
        v228 = v228;
        if (!v236) break;
        int v237 = v227 + v228;
        int v238 = 1;
        int v239 = v228 + v238;
        v227 = v237;
        v228 = v239;
      }
      bool v240 = true;
      v198 = v227;
      break;
    }
    case 2:
      {
      int v241 = 140;
      int v242 = v241 + v66;
      int v243 = v65[v242];
      int v244 = 1;
      int v245;
      v245 = v244;
      switch (v243) {
        case 0:
          {
          int v246 = 144;
          int v247 = v246 + v66;
          int v248 = v65[v247];
          int v249;
          v249 = v66;
          switch (v248) {
            case 0:
              {
              int v250 = 3;
              v249 = v250;
              break;
            }
            default:
              {
              int v251 = 3;
              int v252 = v66 + v251;
              v249 = v252;
              break;
            }
          }
          bool v253 = true;
          v245 = v249;
          break;
        }
        default:
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
            int v260 = v259 + v66;
            int v261 = 148;
            int v262 = v261 + v260;
            int v263 = v65[v262];
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
          }
          bool v269 = true;
          v245 = v256;
          break;
        }
      }
      bool v270 = true;
      v198 = v245;
      break;
    }
  }
  bool v271 = true;
  int v272 = 32;
  int v273 = v272 + v66;
  bool v274 = true;
  int v275 = simt_wave_count_bits(v274);
  v64[v273] = v275;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 168; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
