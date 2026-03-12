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
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 3;
      int v10 = v3 % v9;
      int v11 = 2;
      int v12;
      v12 = v11;
      switch (v10) {
        default:
          {
          int v13 = 4;
          int v14 = v0 + v13;
          v12 = v14;
        }
        case 0:
          {
          v12 = v0;
          break;
        }
        case 1:
          {
          int v15 = 0;
          bool v16 = v2 != v15;
          int v17;
          if (v16) {
            int v18 = 0;
            int v19 = v0 + v18;
            v17 = v19;
          } else {
            v17 = v0;
          }
          v12 = v17;
          break;
        }
        case 2:
          {
          int v20 = 3;
          int v21 = v3 % v20;
          int v22 = 0;
          int v23 = v0 + v22;
          int v24;
          v24 = v23;
          switch (v21) {
            case 0:
              {
              v24 = v0;
              break;
            }
            case 1:
              {
              int v25 = 4;
              v24 = v25;
              break;
            }
            case 2:
              {
              int v26 = 1;
              int v27 = v0 + v26;
              v24 = v27;
            }
            default:
              {
              int v28 = 2;
              v24 = v28;
              break;
            }
          }
          v12 = v24;
          break;
        }
      }
      v8 = v12;
      break;
    }
    default:
      {
      int v29 = 2;
      int v30 = v3 % v29;
      int v31 = 0;
      int v32 = v0 + v31;
      int v33;
      v33 = v32;
      switch (v30) {
        case 0:
          {
          int v34 = 3;
          int v35 = v3 % v34;
          int v36 = 2;
          int v37 = v0 + v36;
          int v38;
          v38 = v37;
          switch (v35) {
            case 0:
              {
              v38 = v0;
              break;
            }
            case 1:
              {
              int v39 = 0;
              int v40 = v0 + v39;
              v38 = v40;
              break;
            }
            case 2:
              {
              int v41 = 3;
              v38 = v41;
              break;
            }
            default:
              {
              int v42 = 3;
              v38 = v42;
              break;
            }
          }
          v33 = v38;
          break;
        }
        default:
          {
          int v43 = 0;
          int v44 = 0;
          int v45;
          int v46;
          v45 = v43;
          v46 = v44;
          while (true) {
            int v47 = 4;
            int v48 = v3 % v47;
            int v49 = 1;
            int v50 = v48 + v49;
            bool v51 = v46 < v50;
            v45 = v45;
            v46 = v46;
            if (!v51) break;
            int v52 = 2;
            int v53 = 1;
            int v54 = v46 + v53;
            v45 = v52;
            v46 = v54;
          }
          v33 = v45;
          break;
        }
        case 1:
          {
          int v55 = 0;
          bool v56 = v2 != v55;
          int v57;
          if (v56) {
            v57 = v0;
          } else {
            int v58 = 3;
            int v59 = v0 + v58;
            v57 = v59;
          }
          v33 = v57;
          break;
        }
      }
      v8 = v33;
      break;
    }
    case 1:
      {
      int v60 = 4;
      int v61 = v3 % v60;
      int v62 = 3;
      int v63;
      v63 = v62;
      switch (v61) {
        case 0:
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
            int v73 = 3;
            int v74 = 1;
            int v75 = v67 + v74;
            v66 = v73;
            v67 = v75;
          }
          v63 = v66;
          break;
        }
        case 1:
          {
          int v76 = 3;
          int v77 = v3 % v76;
          int v78 = 4;
          int v79 = v0 + v78;
          int v80;
          v80 = v79;
          switch (v77) {
            case 0:
              {
              int v81 = 2;
              v80 = v81;
              break;
            }
            case 1:
              {
              int v82 = 1;
              int v83 = v0 + v82;
              v80 = v83;
              break;
            }
            case 2:
              {
              int v84 = 4;
              int v85 = v0 + v84;
              v80 = v85;
            }
            default:
              {
              int v86 = 2;
              v80 = v86;
              break;
            }
          }
          v63 = v80;
          break;
        }
        default:
          {
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
            int v96 = 1;
            int v97 = v90 + v96;
            v89 = v0;
            v90 = v97;
          }
          v63 = v89;
          break;
        }
        case 2:
          {
          int v98 = 3;
          int v99 = v0 + v98;
          v63 = v99;
          break;
        }
      }
      v8 = v63;
      break;
    }
  }
  bool v100 = true;
  int v101 = simt_wave_count_bits(v100);
  int v102 = 0;
  int v103 = v102 + v0;
  v1[v103] = v101;
  return;
}

kernel void kernel_main(device int* v104 [[buffer(0)]], device int* v105 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v106 = static_cast<int>(__simt_tid3.x);
  int v107 = 0;
  int v108 = v107 + v106;
  int v109 = v105[v108];
  int v110 = 4;
  int v111 = v110 + v106;
  int v112 = v105[v111];
  helper0(v106, v104, v109, v112, static_cast<int>(__simt_tid3.x));
  int v113 = 0;
  int v114 = 0;
  int v115;
  int v116;
  v115 = v113;
  v116 = v114;
  while (true) {
    int v117 = 4;
    int v118 = v116 * v117;
    int v119 = v118 + v106;
    int v120 = 8;
    int v121 = v120 + v119;
    int v122 = v105[v121];
    int v123 = 0;
    bool v124 = v122 != v123;
    v115 = v115;
    v116 = v116;
    if (!v124) break;
    int v125 = 28;
    int v126 = v125 + v106;
    int v127 = v105[v126];
    int v128;
    v128 = v106;
    switch (v127) {
      default:
        {
        int v129 = 32;
        int v130 = v129 + v106;
        int v131 = v105[v130];
        int v132 = 0;
        bool v133 = v131 != v132;
        int v134;
        if (v133) {
          v134 = v106;
        } else {
          int v135 = 3;
          int v136 = v106 + v135;
          v134 = v136;
        }
        v128 = v134;
        break;
      }
      case 0:
        {
        int v137 = 2;
        v128 = v137;
        break;
      }
    }
    bool v138 = true;
    int v139 = 16;
    int v140 = v139 + v106;
    bool v141 = true;
    int v142 = simt_wave_count_bits(v141);
    v104[v140] = v142;
    int v143 = v115 + v128;
    int v144 = 1;
    int v145 = v116 + v144;
    bool v146 = true;
    int v147 = 32;
    int v148 = 4;
    int v149 = v116 * v148;
    int v150 = v147 + v149;
    int v151 = v150 + v106;
    bool v152 = true;
    int v153 = simt_wave_count_bits(v152);
    v104[v151] = v153;
    v115 = v143;
    v116 = v145;
    break;
    ;
  }
  uint v154 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v155 = (int)(v154);
  int v156 = 36;
  int v157 = v156 + v106;
  int v158 = v105[v157];
  int v159;
  v159 = v106;
  switch (v158) {
    case 0:
      {
      int v160 = 0;
      int v161 = 0;
      int v162;
      int v163;
      v162 = v160;
      v163 = v161;
      while (true) {
        int v164 = 4;
        int v165 = v163 * v164;
        int v166 = v165 + v106;
        int v167 = 40;
        int v168 = v167 + v166;
        int v169 = v105[v168];
        int v170 = 0;
        bool v171 = v169 != v170;
        v162 = v162;
        v163 = v163;
        if (!v171) break;
        int v172 = 0;
        int v173 = 0;
        int v174;
        int v175;
        v174 = v172;
        v175 = v173;
        while (true) {
          int v176 = 4;
          int v177 = v175 * v176;
          int v178 = v177 + v106;
          int v179 = 60;
          int v180 = v179 + v178;
          int v181 = v105[v180];
          int v182 = 0;
          bool v183 = v181 != v182;
          v174 = v174;
          v175 = v175;
          if (!v183) break;
          int v184 = v174 + v175;
          int v185 = 1;
          int v186 = v175 + v185;
          bool v187 = true;
          v174 = v184;
          v175 = v186;
        }
        int v188 = v162 + v174;
        int v189 = 1;
        int v190 = v163 + v189;
        bool v191 = true;
        v162 = v188;
        v163 = v190;
      }
      v159 = v162;
    }
    case 1:
      {
      int v192 = 80;
      int v193 = v192 + v106;
      int v194 = v105[v193];
      int v195;
      v195 = v106;
      switch (v194) {
        case 0:
          {
          int v196 = 2;
          v195 = v196;
          break;
        }
        default:
          {
          int v197 = 84;
          int v198 = v197 + v106;
          int v199 = v105[v198];
          int v200 = 0;
          bool v201 = v199 != v200;
          int v202;
          if (v201) {
            v202 = v106;
          } else {
            int v203 = 3;
            v202 = v203;
          }
          v195 = v202;
          break;
        }
      }
      bool v204 = true;
      v159 = v195;
      break;
    }
    case 2:
      {
      int v205 = 88;
      int v206 = v205 + v106;
      int v207 = v105[v206];
      int v208 = 3;
      int v209;
      v209 = v208;
      switch (v207) {
        case 0:
          {
          int v210 = 92;
          int v211 = v210 + v106;
          int v212 = v105[v211];
          int v213 = 4;
          int v214;
          v214 = v213;
          switch (v212) {
            case 0:
              {
              v214 = v106;
            }
            default:
              {
              v214 = v106;
              break;
            }
            case 1:
              {
              int v215 = 4;
              int v216 = v106 + v215;
              v214 = v216;
              break;
            }
          }
          v209 = v214;
        }
        case 1:
          {
          int v217 = 0;
          int v218 = 0;
          int v219;
          int v220;
          v219 = v217;
          v220 = v218;
          while (true) {
            int v221 = 4;
            int v222 = v220 * v221;
            int v223 = v222 + v106;
            int v224 = 96;
            int v225 = v224 + v223;
            int v226 = v105[v225];
            int v227 = 0;
            bool v228 = v226 != v227;
            v219 = v219;
            v220 = v220;
            if (!v228) break;
            int v229 = v219 + v220;
            int v230 = 1;
            int v231 = v220 + v230;
            bool v232 = true;
            v219 = v229;
            v220 = v231;
            break;
            ;
          }
          v209 = v219;
          break;
        }
        default:
          {
          int v233 = 116;
          int v234 = v233 + v106;
          int v235 = v105[v234];
          int v236 = 0;
          bool v237 = v235 != v236;
          int v238;
          if (v237) {
            v238 = v106;
          } else {
            int v239 = 2;
            v238 = v239;
          }
          v209 = v238;
          break;
        }
      }
      v159 = v209;
      break;
    }
    default:
      {
      int v240 = 120;
      int v241 = v240 + v106;
      int v242 = v105[v241];
      int v243 = 0;
      bool v244 = v242 != v243;
      int v245;
      if (v244) {
        int v246 = 124;
        int v247 = v246 + v106;
        int v248 = v105[v247];
        int v249 = 0;
        int v250 = v106 + v249;
        int v251;
        v251 = v250;
        switch (v248) {
          case 0:
            {
            int v252 = 3;
            int v253 = v106 + v252;
            v251 = v253;
            break;
          }
          case 1:
            {
            int v254 = 0;
            int v255 = v106 + v254;
            v251 = v255;
            break;
          }
          default:
            {
            int v256 = 2;
            v251 = v256;
            break;
          }
        }
        v245 = v251;
      } else {
        v245 = v106;
      }
      v159 = v245;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
