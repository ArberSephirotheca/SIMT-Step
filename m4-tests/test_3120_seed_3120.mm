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
    bool v13 = true;
    int v14 = simt_wave_count_bits(v13);
    int v15 = 0;
    int v16 = 4;
    int v17 = v7 * v16;
    int v18 = v15 + v17;
    int v19 = v18 + v0;
    v1[v19] = v14;
    int v20 = 1;
    int v21 = v7 + v20;
    v6 = v14;
    v7 = v21;
  }
  int v22 = 4;
  int v23 = v3 % v22;
  int v24 = 0;
  int v25;
  v25 = v24;
  switch (v23) {
    default:
      {
      int v26 = 1;
      int v27 = v0 + v26;
      int v28;
      v28 = v27;
      switch (v3) {
        default:
          {
          int v29 = 3;
          int v30 = v3 % v29;
          int v31;
          v31 = v0;
          switch (v30) {
            case 0:
              {
              int v32 = 2;
              int v33 = v0 + v32;
              v31 = v33;
            }
            default:
              {
              int v34 = 3;
              v31 = v34;
            }
            case 1:
              {
              int v35 = 4;
              int v36 = v0 + v35;
              v31 = v36;
              break;
            }
          }
          v28 = v31;
          break;
        }
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
            int v47 = v0 + v46;
            int v48 = 1;
            int v49 = v40 + v48;
            v39 = v47;
            v40 = v49;
          }
          v28 = v39;
          break;
        }
      }
      v25 = v28;
      break;
    }
    case 0:
      {
      int v50 = 2;
      int v51 = v3 % v50;
      int v52 = 3;
      int v53 = v0 + v52;
      int v54;
      v54 = v53;
      switch (v51) {
        case 0:
          {
          int v55 = 3;
          int v56 = v3 % v55;
          int v57 = 0;
          int v58;
          v58 = v57;
          switch (v56) {
            default:
              {
              int v59 = 3;
              v58 = v59;
              break;
            }
            case 0:
              {
              int v60 = 4;
              int v61 = v0 + v60;
              v58 = v61;
              break;
            }
            case 1:
              {
              v58 = v0;
              break;
            }
          }
          int v62 = 1;
          int v63 = v0 + v62;
          v54 = v58;
          break;
        }
        default:
          {
          int v64 = 0;
          int v65 = 0;
          int v66;
          int v67;
          v66 = v64;
          v67 = v65;
          while (true) {
            int v68 = 4;
            int v69 = v3 % v68;
            int v70 = 1;
            int v71 = v69 + v70;
            bool v72 = v67 < v71;
            v66 = v66;
            v67 = v67;
            if (!v72) break;
            int v73 = 1;
            int v74 = v67 + v73;
            v66 = v0;
            v67 = v74;
          }
          v54 = v66;
          break;
        }
        case 1:
          {
          int v75 = 0;
          int v76 = 0;
          int v77;
          int v78;
          v77 = v75;
          v78 = v76;
          while (true) {
            int v79 = 4;
            int v80 = v3 % v79;
            int v81 = 1;
            int v82 = v80 + v81;
            bool v83 = v78 < v82;
            v77 = v77;
            v78 = v78;
            if (!v83) break;
            int v84 = 3;
            int v85 = v0 + v84;
            int v86 = 1;
            int v87 = v78 + v86;
            v77 = v85;
            v78 = v87;
          }
          v54 = v77;
          break;
        }
      }
      v25 = v54;
      break;
    }
    case 1:
      {
      int v88 = 0;
      bool v89 = v2 != v88;
      int v90;
      if (v89) {
        int v91 = 2;
        int v92 = v3 % v91;
        int v93;
        v93 = v0;
        switch (v92) {
          default:
            {
            int v94 = 2;
            int v95 = v0 + v94;
            v93 = v95;
            break;
          }
          case 0:
            {
            int v96 = 0;
            int v97 = v0 + v96;
            v93 = v97;
            break;
          }
        }
        v90 = v93;
      } else {
        int v98 = 3;
        int v99;
        v99 = v98;
        switch (v3) {
          default:
            {
            int v100 = 3;
            int v101 = v0 + v100;
            v99 = v101;
            break;
          }
          case 0:
            {
            v99 = v0;
            break;
          }
        }
        v90 = v99;
      }
      v25 = v90;
      break;
    }
    case 2:
      {
      int v102 = 0;
      int v103 = v0 + v102;
      v25 = v103;
      break;
    }
  }
  bool v104 = true;
  int v105 = simt_wave_count_bits(v104);
  int v106 = 16;
  int v107 = v106 + v0;
  v1[v107] = v105;
  int v108 = 0;
  bool v109 = v2 != v108;
  int v110 = v109 ? v6 : v25;
  return;
}

kernel void kernel_main(device int* v111 [[buffer(0)]], device int* v112 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v113 = static_cast<int>(__simt_tid3.x);
  int v114 = 0;
  int v115 = v114 + v113;
  int v116 = v112[v115];
  int v117 = 4;
  int v118 = v117 + v113;
  int v119 = v112[v118];
  helper0(v113, v111, v116, v119, static_cast<int>(__simt_tid3.x));
  int v120 = 0;
  int v121 = 0;
  int v122;
  int v123;
  v122 = v120;
  v123 = v121;
  while (true) {
    int v124 = 4;
    int v125 = v123 * v124;
    int v126 = v125 + v113;
    int v127 = 8;
    int v128 = v127 + v126;
    int v129 = v112[v128];
    int v130 = 0;
    bool v131 = v129 != v130;
    v122 = v122;
    v123 = v123;
    if (!v131) break;
    int v132 = v122 + v123;
    int v133 = 1;
    int v134 = v123 + v133;
    bool v135 = true;
    int v136 = 32;
    int v137 = 4;
    int v138 = v123 * v137;
    int v139 = v136 + v138;
    int v140 = v139 + v113;
    bool v141 = true;
    int v142 = simt_wave_count_bits(v141);
    v111[v140] = v142;
    v122 = v132;
    v123 = v134;
  }
  int v143 = 0;
  int v144 = 0;
  int v145;
  int v146;
  v145 = v143;
  v146 = v144;
  while (true) {
    int v147 = 4;
    int v148 = v146 * v147;
    int v149 = v148 + v113;
    int v150 = 28;
    int v151 = v150 + v149;
    int v152 = v112[v151];
    int v153 = 0;
    bool v154 = v152 != v153;
    v145 = v145;
    v146 = v146;
    if (!v154) break;
    int v155 = v145 + v146;
    int v156 = 1;
    int v157 = v146 + v156;
    bool v158 = true;
    int v159 = 48;
    int v160 = 4;
    int v161 = v146 * v160;
    int v162 = v159 + v161;
    int v163 = v162 + v113;
    bool v164 = true;
    int v165 = simt_wave_count_bits(v164);
    v111[v163] = v165;
    v145 = v155;
    v146 = v157;
    break;
    ;
  }
  int v166 = 48;
  int v167 = v166 + v113;
  int v168 = v112[v167];
  uint v169 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v170 = (int)(v169);
  int v171;
  v171 = v170;
  switch (v168) {
    case 0:
      {
      int v172 = 52;
      int v173 = v172 + v113;
      int v174 = v112[v173];
      int v175;
      v175 = v113;
      switch (v174) {
        default:
          {
          int v176 = 56;
          int v177 = v176 + v113;
          int v178 = v112[v177];
          int v179;
          v179 = v113;
          switch (v178) {
            case 0:
              {
              v179 = v113;
              break;
            }
            default:
              {
              v179 = v113;
              break;
            }
          }
          v175 = v179;
          break;
        }
        case 0:
          {
          int v180 = 60;
          int v181 = v180 + v113;
          int v182 = v112[v181];
          int v183 = 0;
          bool v184 = v182 != v183;
          int v185;
          if (v184) {
            int v186 = 1;
            v185 = v186;
          } else {
            int v187 = 1;
            v185 = v187;
          }
          v175 = v185;
          break;
        }
        case 1:
          {
          int v188 = 64;
          int v189 = v188 + v113;
          int v190 = v112[v189];
          int v191;
          v191 = v113;
          switch (v190) {
            case 0:
              {
              int v192 = 2;
              int v193 = v113 + v192;
              v191 = v193;
              break;
            }
            case 1:
              {
              v191 = v113;
              break;
            }
            default:
              {
              v191 = v113;
              break;
            }
          }
          v175 = v191;
          break;
        }
      }
      bool v194 = true;
      v171 = v175;
    }
    default:
      {
      int v195 = 68;
      int v196 = v195 + v113;
      int v197 = v112[v196];
      int v198 = 0;
      bool v199 = v197 != v198;
      int v200;
      if (v199) {
        v200 = v113;
      } else {
        int v201 = 72;
        int v202 = v201 + v113;
        int v203 = v112[v202];
        int v204 = 0;
        bool v205 = v203 != v204;
        int v206;
        if (v205) {
          int v207 = 0;
          int v208 = v113 + v207;
          v206 = v208;
        } else {
          int v209 = 2;
          v206 = v209;
        }
        v200 = v206;
      }
      v171 = v200;
      break;
    }
    case 1:
      {
      int v210 = 76;
      int v211 = v210 + v113;
      int v212 = v112[v211];
      int v213 = 0;
      int v214;
      v214 = v213;
      switch (v212) {
        default:
          {
          int v215 = 80;
          int v216 = v215 + v113;
          int v217 = v112[v216];
          int v218 = 0;
          bool v219 = v217 != v218;
          int v220;
          if (v219) {
            v220 = v113;
          } else {
            int v221 = 3;
            v220 = v221;
          }
          v214 = v220;
          break;
        }
        case 0:
          {
          int v222 = 84;
          int v223 = v222 + v113;
          int v224 = v112[v223];
          int v225 = 4;
          int v226;
          v226 = v225;
          switch (v224) {
            default:
              {
              int v227 = 2;
              v226 = v227;
              break;
            }
            case 0:
              {
              int v228 = 1;
              int v229 = v113 + v228;
              v226 = v229;
              break;
            }
          }
          v214 = v226;
          break;
        }
        case 1:
          {
          int v230 = 88;
          int v231 = v230 + v113;
          int v232 = v112[v231];
          int v233 = 0;
          bool v234 = v232 != v233;
          int v235;
          if (v234) {
            int v236 = 2;
            v235 = v236;
          } else {
            int v237 = 4;
            int v238 = v113 + v237;
            v235 = v238;
          }
          v214 = v235;
          break;
        }
      }
      v171 = v214;
      break;
    }
    case 2:
      {
      int v239 = 0;
      int v240 = 0;
      int v241;
      int v242;
      v241 = v239;
      v242 = v240;
      while (true) {
        int v243 = 4;
        int v244 = v242 * v243;
        int v245 = v244 + v113;
        int v246 = 92;
        int v247 = v246 + v245;
        int v248 = v112[v247];
        int v249 = 0;
        bool v250 = v248 != v249;
        v241 = v241;
        v242 = v242;
        if (!v250) break;
        int v251 = v241 + v242;
        int v252 = 1;
        int v253 = v242 + v252;
        bool v254 = true;
        v241 = v251;
        v242 = v253;
      }
      v171 = v241;
      break;
    }
  }
  bool v255 = true;
  int v256 = 64;
  int v257 = v256 + v113;
  bool v258 = true;
  int v259 = simt_wave_count_bits(v258);
  v111[v257] = v259;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 112; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
