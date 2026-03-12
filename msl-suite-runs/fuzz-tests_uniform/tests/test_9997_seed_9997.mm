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
    uint v7 = simt_lane_id(__simt_tid);
    int v8 = (int)(v7);
    int v9;
    v9 = v8;
    switch (v3) {
      case 0:
        {
        int v10 = 2;
        int v11 = v3 % v10;
        int v12 = 1;
        int v13;
        v13 = v12;
        switch (v11) {
          case 0:
            {
            int v14 = 2;
            int v15 = v0 + v14;
            v13 = v15;
            break;
          }
          default:
            {
            v13 = v0;
            break;
          }
        }
        int v16 = 2;
        v9 = v13;
      }
      default:
        {
        v9 = v0;
        break;
      }
    }
    uint v17 = simt_lane_id(__simt_tid);
    int v18 = (int)(v17);
    v6 = v9;
  } else {
    v6 = v0;
  }
  bool v19 = true;
  int v20 = simt_wave_count_bits(v19);
  int v21 = 0;
  int v22 = v21 + v0;
  v1[v22] = v20;
  return;
}

kernel void kernel_main(device int* v23 [[buffer(0)]], device int* v24 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v25 = static_cast<int>(__simt_tid3.x);
  int v26 = 0;
  int v27 = v26 + v25;
  int v28 = v24[v27];
  int v29 = 4;
  int v30 = v29 + v25;
  int v31 = v24[v30];
  helper0(v25, v23, v28, v31, static_cast<int>(__simt_tid3.x));
  int v32 = 8;
  int v33 = v32 + v25;
  int v34 = v24[v33];
  int v35;
  v35 = v25;
  switch (v34) {
    case 0:
      {
      int v36 = 12;
      int v37 = v36 + v25;
      int v38 = v24[v37];
      int v39;
      v39 = v25;
      switch (v38) {
        case 0:
          {
          int v40 = 0;
          int v41 = 0;
          int v42;
          int v43;
          v42 = v40;
          v43 = v41;
          while (true) {
            int v44 = 4;
            int v45 = v43 * v44;
            int v46 = v45 + v25;
            int v47 = 16;
            int v48 = v47 + v46;
            int v49 = v24[v48];
            int v50 = 0;
            bool v51 = v49 != v50;
            v42 = v42;
            v43 = v43;
            if (!v51) break;
            int v52 = v42 + v43;
            int v53 = 1;
            int v54 = v43 + v53;
            v42 = v52;
            v43 = v54;
          }
          bool v55 = true;
          v39 = v42;
          break;
        }
        default:
          {
          int v56 = 36;
          int v57 = v56 + v25;
          int v58 = v24[v57];
          int v59;
          v59 = v25;
          switch (v58) {
            default:
              {
              int v60 = 3;
              v59 = v60;
              break;
            }
            case 0:
              {
              v59 = v25;
              break;
            }
            case 1:
              {
              int v61 = 4;
              int v62 = v25 + v61;
              v59 = v62;
            }
            case 2:
              {
              v59 = v25;
              break;
            }
          }
          bool v63 = true;
          v39 = v59;
        }
        case 1:
          {
          int v64 = 40;
          int v65 = v64 + v25;
          int v66 = v24[v65];
          int v67 = 0;
          bool v68 = v66 != v67;
          int v69;
          if (v68) {
            v69 = v25;
          } else {
            int v70 = 3;
            int v71 = v25 + v70;
            v69 = v71;
          }
          v39 = v69;
          break;
        }
      }
      bool v72 = true;
      v35 = v39;
      break;
    }
    default:
      {
      int v73 = 44;
      int v74 = v73 + v25;
      int v75 = v24[v74];
      int v76;
      v76 = v25;
      switch (v75) {
        case 0:
          {
          int v77 = 4;
          v76 = v77;
          break;
        }
        default:
          {
          int v78 = 0;
          int v79 = 0;
          int v80;
          int v81;
          v80 = v78;
          v81 = v79;
          while (true) {
            int v82 = 4;
            int v83 = v81 * v82;
            int v84 = v83 + v25;
            int v85 = 48;
            int v86 = v85 + v84;
            int v87 = v24[v86];
            int v88 = 0;
            bool v89 = v87 != v88;
            v80 = v80;
            v81 = v81;
            if (!v89) break;
            int v90 = v80 + v81;
            int v91 = 1;
            int v92 = v81 + v91;
            v80 = v90;
            v81 = v92;
            break;
            ;
          }
          bool v93 = true;
          v76 = v80;
          break;
        }
        case 1:
          {
          int v94 = 2;
          v76 = v94;
          break;
        }
        case 2:
          {
          int v95 = 68;
          int v96 = v95 + v25;
          int v97 = v24[v96];
          int v98 = 0;
          bool v99 = v97 != v98;
          int v100;
          if (v99) {
            v100 = v25;
          } else {
            v100 = v25;
          }
          v76 = v100;
          break;
        }
      }
      bool v101 = true;
      v35 = v76;
      break;
    }
    case 1:
      {
      int v102 = 72;
      int v103 = v102 + v25;
      int v104 = v24[v103];
      int v105 = 0;
      bool v106 = v104 != v105;
      int v107;
      if (v106) {
        int v108 = 76;
        int v109 = v108 + v25;
        int v110 = v24[v109];
        int v111 = 1;
        int v112;
        v112 = v111;
        switch (v110) {
          default:
            {
            v112 = v25;
          }
          case 0:
            {
            int v113 = 2;
            int v114 = v25 + v113;
            v112 = v114;
            break;
          }
        }
        bool v115 = true;
        v107 = v112;
      } else {
        int v116 = 1;
        v107 = v116;
      }
      v35 = v107;
      break;
    }
    case 2:
      {
      int v117 = 80;
      int v118 = v117 + v25;
      int v119 = v24[v118];
      int v120 = 3;
      int v121;
      v121 = v120;
      switch (v119) {
        case 0:
          {
          int v122 = 3;
          v121 = v122;
          break;
        }
        default:
          {
          int v123 = 84;
          int v124 = v123 + v25;
          int v125 = v24[v124];
          int v126 = 2;
          int v127;
          v127 = v126;
          switch (v125) {
            case 0:
              {
              v127 = v25;
              break;
            }
            default:
              {
              int v128 = 3;
              v127 = v128;
              break;
            }
            case 1:
              {
              v127 = v25;
              break;
            }
          }
          bool v129 = true;
          v121 = v127;
          break;
        }
      }
      bool v130 = true;
      v35 = v121;
      break;
    }
  }
  bool v131 = true;
  int v132 = 16;
  int v133 = v132 + v25;
  bool v134 = true;
  int v135 = simt_wave_count_bits(v134);
  v23[v133] = v135;
  int v136 = 0;
  int v137 = 0;
  int v138;
  int v139;
  v138 = v136;
  v139 = v137;
  while (true) {
    int v140 = 4;
    int v141 = v139 * v140;
    int v142 = v141 + v25;
    int v143 = 88;
    int v144 = v143 + v142;
    int v145 = v24[v144];
    int v146 = 0;
    bool v147 = v145 != v146;
    v138 = v138;
    v139 = v139;
    if (!v147) break;
    int v148 = 108;
    int v149 = v148 + v25;
    int v150 = v24[v149];
    int v151 = 0;
    bool v152 = v150 != v151;
    int v153;
    if (v152) {
      int v154 = 112;
      int v155 = v154 + v25;
      int v156 = v24[v155];
      int v157 = 0;
      bool v158 = v156 != v157;
      int v159;
      if (v158) {
        int v160 = 3;
        int v161 = v25 + v160;
        v159 = v161;
      } else {
        int v162 = 4;
        v159 = v162;
      }
      v153 = v159;
    } else {
      int v163 = 116;
      int v164 = v163 + v25;
      int v165 = v24[v164];
      int v166 = 3;
      int v167 = v25 + v166;
      int v168;
      v168 = v167;
      switch (v165) {
        case 0:
          {
          int v169 = 1;
          v168 = v169;
          break;
        }
        case 1:
          {
          int v170 = 1;
          int v171 = v25 + v170;
          v168 = v171;
          break;
        }
        default:
          {
          v168 = v25;
          break;
        }
        case 2:
          {
          int v172 = 1;
          v168 = v172;
          break;
        }
      }
      bool v173 = true;
      v153 = v168;
    }
    int v174 = v138 + v153;
    int v175 = 1;
    int v176 = v139 + v175;
    v138 = v174;
    v139 = v176;
  }
  bool v177 = true;
  int v178 = 32;
  int v179 = v178 + v25;
  bool v180 = true;
  int v181 = simt_wave_count_bits(v180);
  v23[v179] = v181;
  int v182 = 120;
  int v183 = v182 + v25;
  int v184 = v24[v183];
  uint v185 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v186 = (int)(v185);
  int v187;
  v187 = v186;
  switch (v184) {
    case 0:
      {
      int v188 = 124;
      int v189 = v188 + v25;
      int v190 = v24[v189];
      int v191 = 0;
      bool v192 = v190 != v191;
      int v193;
      if (v192) {
        int v194 = 128;
        int v195 = v194 + v25;
        int v196 = v24[v195];
        int v197 = 0;
        bool v198 = v196 != v197;
        int v199;
        if (v198) {
          int v200 = 0;
          int v201 = v25 + v200;
          v199 = v201;
        } else {
          int v202 = 4;
          int v203 = v25 + v202;
          v199 = v203;
        }
        v193 = v199;
      } else {
        int v204 = 1;
        int v205 = v25 + v204;
        v193 = v205;
      }
      v187 = v193;
      break;
    }
    case 1:
      {
      int v206 = 132;
      int v207 = v206 + v25;
      int v208 = v24[v207];
      int v209 = 2;
      int v210;
      v210 = v209;
      switch (v208) {
        case 0:
          {
          v210 = v25;
          break;
        }
        case 1:
          {
          v210 = v25;
          break;
        }
        default:
          {
          int v211 = 0;
          int v212 = 0;
          int v213;
          int v214;
          v213 = v211;
          v214 = v212;
          while (true) {
            int v215 = 4;
            int v216 = v214 * v215;
            int v217 = v216 + v25;
            int v218 = 136;
            int v219 = v218 + v217;
            int v220 = v24[v219];
            int v221 = 0;
            bool v222 = v220 != v221;
            v213 = v213;
            v214 = v214;
            if (!v222) break;
            int v223 = v213 + v214;
            int v224 = 1;
            int v225 = v214 + v224;
            v213 = v223;
            v214 = v225;
          }
          bool v226 = true;
          v210 = v213;
          break;
        }
        case 2:
          {
          int v227 = 156;
          int v228 = v227 + v25;
          int v229 = v24[v228];
          int v230 = 0;
          bool v231 = v229 != v230;
          int v232;
          if (v231) {
            v232 = v25;
          } else {
            v232 = v25;
          }
          v210 = v232;
          break;
        }
      }
      bool v233 = true;
      v187 = v210;
      break;
    }
    default:
      {
      int v234 = 160;
      int v235 = v234 + v25;
      int v236 = v24[v235];
      int v237 = 3;
      int v238;
      v238 = v237;
      switch (v236) {
        case 0:
          {
          int v239 = 164;
          int v240 = v239 + v25;
          int v241 = v24[v240];
          int v242 = 0;
          bool v243 = v241 != v242;
          int v244;
          if (v243) {
            v244 = v25;
          } else {
            int v245 = 2;
            int v246 = v25 + v245;
            v244 = v246;
          }
          v238 = v244;
          break;
        }
        default:
          {
          int v247 = 0;
          int v248 = 0;
          int v249;
          int v250;
          v249 = v247;
          v250 = v248;
          while (true) {
            int v251 = 4;
            int v252 = v250 * v251;
            int v253 = v252 + v25;
            int v254 = 168;
            int v255 = v254 + v253;
            int v256 = v24[v255];
            int v257 = 0;
            bool v258 = v256 != v257;
            v249 = v249;
            v250 = v250;
            if (!v258) break;
            int v259 = v249 + v250;
            int v260 = 1;
            int v261 = v250 + v260;
            v249 = v259;
            v250 = v261;
          }
          bool v262 = true;
          v238 = v249;
          break;
        }
      }
      bool v263 = true;
      v187 = v238;
      break;
    }
  }
  bool v264 = true;
  int v265 = 48;
  int v266 = v265 + v25;
  bool v267 = true;
  int v268 = simt_wave_count_bits(v267);
  v23[v266] = v268;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 52; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 188; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
