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
  int v6;
  v6 = v0;
  switch (v5) {
    default:
      {
      int v7 = 0;
      bool v8 = v2 != v7;
      int v9;
      if (v8) {
        int v10 = 2;
        int v11 = v3 % v10;
        int v12;
        v12 = v0;
        switch (v11) {
          case 0:
            {
            int v13 = 4;
            v12 = v13;
            break;
          }
          case 1:
            {
            int v14 = 1;
            int v15 = v0 + v14;
            v12 = v15;
            break;
          }
          default:
            {
            v12 = v0;
            break;
          }
        }
        v9 = v12;
      } else {
        int v16 = 3;
        int v17 = v3 % v16;
        int v18 = 0;
        int v19;
        v19 = v18;
        switch (v17) {
          case 0:
            {
            int v20 = 3;
            v19 = v20;
            break;
          }
          case 1:
            {
            int v21 = 1;
            int v22 = v0 + v21;
            v19 = v22;
          }
          default:
            {
            int v23 = 2;
            int v24 = v0 + v23;
            v19 = v24;
            break;
          }
        }
        int v25 = 2;
        int v26 = v0 + v25;
        v9 = v19;
      }
      v6 = v9;
      break;
    }
    case 0:
      {
      int v27 = 2;
      int v28 = v3 % v27;
      int v29 = 2;
      int v30 = v0 + v29;
      int v31;
      v31 = v30;
      switch (v28) {
        default:
          {
          int v32 = 0;
          bool v33 = v2 != v32;
          int v34;
          if (v33) {
            int v35 = 3;
            int v36 = v0 + v35;
            v34 = v36;
          } else {
            v34 = v0;
          }
          v31 = v34;
        }
        case 0:
          {
          int v37 = 2;
          int v38 = v3 % v37;
          int v39 = 1;
          int v40;
          v40 = v39;
          switch (v38) {
            default:
              {
              v40 = v0;
            }
            case 0:
              {
              v40 = v0;
              break;
            }
          }
          v31 = v40;
          break;
        }
        case 1:
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
            int v50 = 3;
            int v51 = 1;
            int v52 = v44 + v51;
            v43 = v50;
            v44 = v52;
            break;
            ;
          }
          v31 = v43;
          break;
        }
      }
      v6 = v31;
      break;
    }
  }
  bool v53 = true;
  int v54 = simt_wave_count_bits(v53);
  int v55 = 0;
  int v56 = v55 + v0;
  v1[v56] = v54;
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
  int v66 = 8;
  int v67 = v66 + v59;
  int v68 = v58[v67];
  int v69 = 0;
  bool v70 = v68 != v69;
  int v71;
  if (v70) {
    int v72 = 12;
    int v73 = v72 + v59;
    int v74 = v58[v73];
    int v75 = 0;
    bool v76 = v74 != v75;
    int v77;
    if (v76) {
      int v78 = 16;
      int v79 = v78 + v59;
      int v80 = v58[v79];
      int v81 = 0;
      bool v82 = v80 != v81;
      int v83;
      if (v82) {
        uint v84 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v85 = (int)(v84);
        v83 = v85;
      } else {
        int v86 = 4;
        int v87 = v59 + v86;
        v83 = v87;
      }
      int v88 = 16;
      int v89 = v88 + v59;
      bool v90 = true;
      int v91 = simt_wave_count_bits(v90);
      v57[v89] = v91;
      v77 = v83;
    } else {
      int v92 = 20;
      int v93 = v92 + v59;
      int v94 = v58[v93];
      int v95;
      v95 = v59;
      switch (v94) {
        case 0:
          {
          int v96 = 2;
          v95 = v96;
          break;
        }
        default:
          {
          int v97 = 4;
          v95 = v97;
          break;
        }
        case 1:
          {
          int v98 = 4;
          v95 = v98;
        }
        case 2:
          {
          v95 = v59;
          break;
        }
      }
      v77 = v95;
    }
    int v99 = 32;
    int v100 = v99 + v59;
    bool v101 = true;
    int v102 = simt_wave_count_bits(v101);
    v57[v100] = v102;
    v71 = v77;
  } else {
    int v103 = 0;
    int v104 = 0;
    int v105;
    int v106;
    v105 = v103;
    v106 = v104;
    while (true) {
      int v107 = 4;
      int v108 = v106 * v107;
      int v109 = v108 + v59;
      int v110 = 24;
      int v111 = v110 + v109;
      int v112 = v58[v111];
      int v113 = 0;
      bool v114 = v112 != v113;
      v105 = v105;
      v106 = v106;
      if (!v114) break;
      int v115 = 0;
      int v116 = 0;
      int v117;
      int v118;
      v117 = v115;
      v118 = v116;
      while (true) {
        int v119 = 4;
        int v120 = v118 * v119;
        int v121 = v120 + v59;
        int v122 = 44;
        int v123 = v122 + v121;
        int v124 = v58[v123];
        int v125 = 0;
        bool v126 = v124 != v125;
        v117 = v117;
        v118 = v118;
        if (!v126) break;
        int v127 = v117 + v118;
        int v128 = 1;
        int v129 = v118 + v128;
        bool v130 = true;
        int v131 = 48;
        int v132 = 4;
        int v133 = v118 * v132;
        int v134 = v131 + v133;
        int v135 = v134 + v59;
        bool v136 = true;
        int v137 = simt_wave_count_bits(v136);
        v57[v135] = v137;
        v117 = v127;
        v118 = v129;
      }
      int v138 = v105 + v117;
      int v139 = 1;
      int v140 = v106 + v139;
      bool v141 = true;
      int v142 = 64;
      int v143 = 4;
      int v144 = v106 * v143;
      int v145 = v142 + v144;
      int v146 = v145 + v59;
      bool v147 = true;
      int v148 = simt_wave_count_bits(v147);
      v57[v146] = v148;
      v105 = v138;
      v106 = v140;
    }
    v71 = v105;
  }
  int v149 = 80;
  int v150 = v149 + v59;
  bool v151 = true;
  int v152 = simt_wave_count_bits(v151);
  v57[v150] = v152;
  int v153 = 64;
  int v154 = v153 + v59;
  int v155 = v58[v154];
  int v156 = 0;
  bool v157 = v155 != v156;
  int v158;
  if (v157) {
    int v159 = 0;
    int v160 = 0;
    int v161;
    int v162;
    v161 = v159;
    v162 = v160;
    while (true) {
      int v163 = 4;
      int v164 = v162 * v163;
      int v165 = v164 + v59;
      int v166 = 68;
      int v167 = v166 + v165;
      int v168 = v58[v167];
      int v169 = 0;
      bool v170 = v168 != v169;
      v161 = v161;
      v162 = v162;
      if (!v170) break;
      int v171 = v161 + v162;
      int v172 = 1;
      int v173 = v162 + v172;
      bool v174 = true;
      int v175 = 96;
      int v176 = 4;
      int v177 = v162 * v176;
      int v178 = v175 + v177;
      int v179 = v178 + v59;
      bool v180 = true;
      int v181 = simt_wave_count_bits(v180);
      v57[v179] = v181;
      v161 = v171;
      v162 = v173;
    }
    v158 = v161;
  } else {
    int v182 = 0;
    int v183 = 0;
    int v184;
    int v185;
    v184 = v182;
    v185 = v183;
    while (true) {
      int v186 = 4;
      int v187 = v185 * v186;
      int v188 = v187 + v59;
      int v189 = 88;
      int v190 = v189 + v188;
      int v191 = v58[v190];
      int v192 = 0;
      bool v193 = v191 != v192;
      v184 = v184;
      v185 = v185;
      if (!v193) break;
      int v194 = 108;
      int v195 = v194 + v59;
      int v196 = v58[v195];
      int v197 = 0;
      bool v198 = v196 != v197;
      int v199;
      if (v198) {
        uint v200 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v201 = (int)(v200);
        v199 = v201;
      } else {
        int v202 = 0;
        v199 = v202;
      }
      int v203 = 112;
      int v204 = v203 + v59;
      bool v205 = true;
      int v206 = simt_wave_count_bits(v205);
      v57[v204] = v206;
      int v207 = v184 + v199;
      int v208 = 1;
      int v209 = v185 + v208;
      bool v210 = true;
      int v211 = 128;
      int v212 = 4;
      int v213 = v185 * v212;
      int v214 = v211 + v213;
      int v215 = v214 + v59;
      bool v216 = true;
      int v217 = simt_wave_count_bits(v216);
      v57[v215] = v217;
      v184 = v207;
      v185 = v209;
    }
    v158 = v184;
  }
  int v218 = 144;
  int v219 = v218 + v59;
  bool v220 = true;
  int v221 = simt_wave_count_bits(v220);
  v57[v219] = v221;
  int v222 = 112;
  int v223 = v222 + v59;
  int v224 = v58[v223];
  uint v225 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v226 = (int)(v225);
  int v227;
  v227 = v226;
  switch (v224) {
    case 0:
      {
      int v228 = 1;
      int v229 = v59 + v228;
      v227 = v229;
      break;
    }
    case 1:
      {
      int v230 = 116;
      int v231 = v230 + v59;
      int v232 = v58[v231];
      int v233 = 4;
      int v234 = v59 + v233;
      int v235;
      v235 = v234;
      switch (v232) {
        case 0:
          {
          int v236 = 4;
          int v237 = v59 + v236;
          v235 = v237;
          break;
        }
        default:
          {
          int v238 = 0;
          v235 = v238;
          break;
        }
        case 1:
          {
          int v239 = 120;
          int v240 = v239 + v59;
          int v241 = v58[v240];
          int v242 = 0;
          bool v243 = v241 != v242;
          int v244;
          if (v243) {
            int v245 = 3;
            int v246 = v59 + v245;
            v244 = v246;
          } else {
            v244 = v59;
          }
          v235 = v244;
          break;
        }
        case 2:
          {
          int v247 = 124;
          int v248 = v247 + v59;
          int v249 = v58[v248];
          int v250;
          v250 = v59;
          switch (v249) {
            case 0:
              {
              v250 = v59;
              break;
            }
            case 1:
              {
              int v251 = 2;
              v250 = v251;
              break;
            }
            case 2:
              {
              int v252 = 1;
              int v253 = v59 + v252;
              v250 = v253;
              break;
            }
            default:
              {
              int v254 = 0;
              v250 = v254;
              break;
            }
          }
          v235 = v250;
          break;
        }
      }
      bool v255 = true;
      v227 = v235;
      break;
    }
    default:
      {
      int v256 = 128;
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
      v227 = v261;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 148; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 132; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
