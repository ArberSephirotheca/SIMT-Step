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
    uint v13 = simt_subgroup_id(__simt_tid);
    int v14 = (int)(v13);
    int v15 = 1;
    int v16 = v7 + v15;
    v6 = v14;
    v7 = v16;
    break;
    ;
  }
  bool v17 = true;
  int v18 = simt_wave_count_bits(v17);
  int v19 = 0;
  int v20 = v19 + v0;
  v1[v20] = v18;
  int v21 = 3;
  int v22 = v3 % v21;
  int v23 = 3;
  int v24;
  v24 = v23;
  switch (v22) {
    case 0:
      {
      int v25 = 2;
      int v26 = v3 % v25;
      int v27 = 2;
      int v28;
      v28 = v27;
      switch (v26) {
        default:
          {
          int v29 = 4;
          v28 = v29;
          break;
        }
        case 0:
          {
          int v30 = 0;
          int v31 = 0;
          int v32;
          int v33;
          v32 = v30;
          v33 = v31;
          while (true) {
            int v34 = 4;
            int v35 = v3 % v34;
            int v36 = 1;
            int v37 = v35 + v36;
            bool v38 = v33 < v37;
            v32 = v32;
            v33 = v33;
            if (!v38) break;
            int v39 = 2;
            int v40 = 1;
            int v41 = v33 + v40;
            v32 = v39;
            v33 = v41;
          }
          int v42 = 1;
          v28 = v32;
          break;
        }
      }
      v24 = v28;
    }
    case 1:
      {
      int v43 = 3;
      int v44 = v3 % v43;
      int v45 = 2;
      int v46;
      v46 = v45;
      switch (v44) {
        case 0:
          {
          int v47 = 4;
          int v48 = v3 % v47;
          int v49 = 0;
          int v50 = v0 + v49;
          int v51;
          v51 = v50;
          switch (v48) {
            case 0:
              {
              int v52 = 0;
              v51 = v52;
              break;
            }
            case 1:
              {
              int v53 = 3;
              int v54 = v0 + v53;
              v51 = v54;
              break;
            }
            case 2:
              {
              int v55 = 1;
              v51 = v55;
              break;
            }
            default:
              {
              int v56 = 1;
              int v57 = v0 + v56;
              v51 = v57;
              break;
            }
          }
          int v58 = 2;
          int v59 = v0 + v58;
          v46 = v51;
          break;
        }
        case 1:
          {
          int v60 = 0;
          bool v61 = v2 != v60;
          int v62;
          if (v61) {
            int v63 = 0;
            v62 = v63;
          } else {
            int v64 = 0;
            v62 = v64;
          }
          int v65 = 4;
          int v66 = v0 + v65;
          v46 = v62;
          break;
        }
        default:
          {
          int v67 = 3;
          int v68 = v3 % v67;
          int v69 = 2;
          int v70;
          v70 = v69;
          switch (v68) {
            case 0:
              {
              int v71 = 4;
              int v72 = v0 + v71;
              v70 = v72;
            }
            case 1:
              {
              int v73 = 0;
              int v74 = v0 + v73;
              v70 = v74;
            }
            default:
              {
              int v75 = 2;
              int v76 = v0 + v75;
              v70 = v76;
              break;
            }
          }
          int v77 = 4;
          int v78 = v0 + v77;
          v46 = v70;
          break;
        }
      }
      int v79 = 0;
      int v80 = v0 + v79;
      v24 = v46;
    }
    case 2:
      {
      int v81 = 4;
      v24 = v81;
      break;
    }
    default:
      {
      int v82 = 0;
      bool v83 = v2 != v82;
      int v84;
      if (v83) {
        int v85 = 0;
        bool v86 = v2 != v85;
        int v87;
        if (v86) {
          int v88 = 0;
          v87 = v88;
        } else {
          int v89 = 4;
          v87 = v89;
        }
        v84 = v87;
      } else {
        v84 = v0;
      }
      int v90 = 0;
      int v91 = v0 + v90;
      v24 = v84;
      break;
    }
  }
  bool v92 = true;
  int v93 = simt_wave_count_bits(v92);
  int v94 = 16;
  int v95 = v94 + v0;
  v1[v95] = v93;
  int v96 = 0;
  bool v97 = v2 != v96;
  int v98 = v97 ? v6 : v24;
  return;
}

kernel void kernel_main(device int* v99 [[buffer(0)]], device int* v100 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v101 = static_cast<int>(__simt_tid3.x);
  int v102 = 0;
  int v103 = v102 + v101;
  int v104 = v100[v103];
  int v105 = 4;
  int v106 = v105 + v101;
  int v107 = v100[v106];
  helper0(v101, v99, v104, v107, static_cast<int>(__simt_tid3.x));
  int v108 = 0;
  int v109 = 0;
  int v110;
  int v111;
  v110 = v108;
  v111 = v109;
  while (true) {
    int v112 = 4;
    int v113 = v111 * v112;
    int v114 = v113 + v101;
    int v115 = 8;
    int v116 = v115 + v114;
    int v117 = v100[v116];
    int v118 = 0;
    bool v119 = v117 != v118;
    v110 = v110;
    v111 = v111;
    if (!v119) break;
    int v120 = v110 + v111;
    int v121 = 1;
    int v122 = v111 + v121;
    v110 = v120;
    v111 = v122;
  }
  bool v123 = true;
  int v124 = 32;
  int v125 = v124 + v101;
  bool v126 = true;
  int v127 = simt_wave_count_bits(v126);
  v99[v125] = v127;
  int v128 = 28;
  int v129 = v128 + v101;
  int v130 = v100[v129];
  int v131;
  v131 = v101;
  switch (v130) {
    case 0:
      {
      v131 = v101;
      break;
    }
    default:
      {
      int v132 = 32;
      int v133 = v132 + v101;
      int v134 = v100[v133];
      int v135 = 0;
      int v136;
      v136 = v135;
      switch (v134) {
        case 0:
          {
          int v137 = 36;
          int v138 = v137 + v101;
          int v139 = v100[v138];
          int v140 = 0;
          bool v141 = v139 != v140;
          int v142;
          if (v141) {
            int v143 = 2;
            v142 = v143;
          } else {
            int v144 = 0;
            v142 = v144;
          }
          v136 = v142;
          break;
        }
        case 1:
          {
          int v145 = 0;
          int v146 = 0;
          int v147;
          int v148;
          v147 = v145;
          v148 = v146;
          while (true) {
            int v149 = 4;
            int v150 = v148 * v149;
            int v151 = v150 + v101;
            int v152 = 40;
            int v153 = v152 + v151;
            int v154 = v100[v153];
            int v155 = 0;
            bool v156 = v154 != v155;
            v147 = v147;
            v148 = v148;
            if (!v156) break;
            int v157 = v147 + v148;
            int v158 = 1;
            int v159 = v148 + v158;
            v147 = v157;
            v148 = v159;
          }
          bool v160 = true;
          v136 = v147;
        }
        case 2:
          {
          int v161 = 60;
          int v162 = v161 + v101;
          int v163 = v100[v162];
          int v164 = 1;
          int v165;
          v165 = v164;
          switch (v163) {
            case 0:
              {
              int v166 = 3;
              int v167 = v101 + v166;
              v165 = v167;
            }
            default:
              {
              int v168 = 1;
              int v169 = v101 + v168;
              v165 = v169;
              break;
            }
          }
          bool v170 = true;
          v136 = v165;
          break;
        }
        default:
          {
          int v171 = 64;
          int v172 = v171 + v101;
          int v173 = v100[v172];
          int v174;
          v174 = v101;
          switch (v173) {
            default:
              {
              int v175 = 0;
              v174 = v175;
              break;
            }
            case 0:
              {
              int v176 = 4;
              v174 = v176;
              break;
            }
          }
          bool v177 = true;
          v136 = v174;
          break;
        }
      }
      bool v178 = true;
      v131 = v136;
      break;
    }
  }
  bool v179 = true;
  int v180 = 48;
  int v181 = v180 + v101;
  bool v182 = true;
  int v183 = simt_wave_count_bits(v182);
  v99[v181] = v183;
  int v184 = 68;
  int v185 = v184 + v101;
  int v186 = v100[v185];
  int v187 = 2;
  int v188;
  v188 = v187;
  switch (v186) {
    case 0:
      {
      int v189 = 72;
      int v190 = v189 + v101;
      int v191 = v100[v190];
      int v192 = 0;
      bool v193 = v191 != v192;
      int v194;
      if (v193) {
        int v195 = 76;
        int v196 = v195 + v101;
        int v197 = v100[v196];
        int v198 = 2;
        int v199;
        v199 = v198;
        switch (v197) {
          case 0:
            {
            int v200 = 2;
            v199 = v200;
            break;
          }
          default:
            {
            int v201 = 0;
            v199 = v201;
            break;
          }
          case 1:
            {
            v199 = v101;
            break;
          }
          case 2:
            {
            v199 = v101;
            break;
          }
        }
        bool v202 = true;
        v194 = v199;
      } else {
        int v203 = 80;
        int v204 = v203 + v101;
        int v205 = v100[v204];
        int v206 = 3;
        int v207;
        v207 = v206;
        switch (v205) {
          case 0:
            {
            int v208 = 2;
            int v209 = v101 + v208;
            v207 = v209;
            break;
          }
          default:
            {
            int v210 = 1;
            v207 = v210;
            break;
          }
          case 1:
            {
            int v211 = 1;
            v207 = v211;
            break;
          }
          case 2:
            {
            int v212 = 0;
            int v213 = v101 + v212;
            v207 = v213;
            break;
          }
        }
        bool v214 = true;
        v194 = v207;
      }
      v188 = v194;
      break;
    }
    default:
      {
      int v215 = 0;
      int v216 = 0;
      int v217;
      int v218;
      v217 = v215;
      v218 = v216;
      while (true) {
        int v219 = 4;
        int v220 = v218 * v219;
        int v221 = v220 + v101;
        int v222 = 84;
        int v223 = v222 + v221;
        int v224 = v100[v223];
        int v225 = 0;
        bool v226 = v224 != v225;
        v217 = v217;
        v218 = v218;
        if (!v226) break;
        int v227 = v217 + v218;
        int v228 = 1;
        int v229 = v218 + v228;
        v217 = v227;
        v218 = v229;
      }
      bool v230 = true;
      v188 = v217;
      break;
    }
    case 1:
      {
      int v231 = 0;
      int v232 = 0;
      int v233;
      int v234;
      v233 = v231;
      v234 = v232;
      while (true) {
        int v235 = 4;
        int v236 = v234 * v235;
        int v237 = v236 + v101;
        int v238 = 104;
        int v239 = v238 + v237;
        int v240 = v100[v239];
        int v241 = 0;
        bool v242 = v240 != v241;
        v233 = v233;
        v234 = v234;
        if (!v242) break;
        int v243 = 124;
        int v244 = v243 + v101;
        int v245 = v100[v244];
        int v246 = 3;
        int v247 = v101 + v246;
        int v248;
        v248 = v247;
        switch (v245) {
          default:
            {
            int v249 = 1;
            v248 = v249;
          }
          case 0:
            {
            int v250 = 0;
            v248 = v250;
          }
          case 1:
            {
            int v251 = 3;
            v248 = v251;
          }
          case 2:
            {
            int v252 = 0;
            int v253 = v101 + v252;
            v248 = v253;
            break;
          }
        }
        bool v254 = true;
        int v255 = v233 + v248;
        int v256 = 1;
        int v257 = v234 + v256;
        v233 = v255;
        v234 = v257;
      }
      bool v258 = true;
      v188 = v233;
      break;
    }
    case 2:
      {
      int v259 = 1;
      int v260 = v101 + v259;
      v188 = v260;
      break;
    }
  }
  bool v261 = true;
  int v262 = 64;
  int v263 = v262 + v101;
  bool v264 = true;
  int v265 = simt_wave_count_bits(v264);
  v99[v263] = v265;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 128; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
