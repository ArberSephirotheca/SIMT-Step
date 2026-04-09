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
    continue;
    ;
  }
  int v22 = 0;
  bool v23 = v2 != v22;
  int v24;
  if (v23) {
    bool v25 = true;
    int v26 = simt_wave_count_bits(v25);
    int v27 = 16;
    int v28 = v27 + v0;
    v1[v28] = v26;
    v24 = v26;
  } else {
    int v29 = 0;
    int v30 = 0;
    int v31;
    int v32;
    v31 = v29;
    v32 = v30;
    while (true) {
      int v33 = 4;
      int v34 = v3 % v33;
      int v35 = 1;
      int v36 = v34 + v35;
      bool v37 = v32 < v36;
      v31 = v31;
      v32 = v32;
      if (!v37) break;
      bool v38 = true;
      int v39 = simt_wave_count_bits(v38);
      int v40 = 32;
      int v41 = 4;
      int v42 = v32 * v41;
      int v43 = v40 + v42;
      int v44 = v43 + v0;
      v1[v44] = v39;
      int v45 = 1;
      int v46 = v32 + v45;
      v31 = v39;
      v32 = v46;
      break;
      ;
    }
    v24 = v31;
  }
  int v47 = 0;
  bool v48 = v2 != v47;
  int v49 = v48 ? v6 : v24;
  return;
}

kernel void kernel_main(device int* v50 [[buffer(0)]], device int* v51 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v52 = static_cast<int>(__simt_tid3.x);
  int v53 = 0;
  int v54 = v53 + v52;
  int v55 = v51[v54];
  int v56 = 4;
  int v57 = v56 + v52;
  int v58 = v51[v57];
  int v59 = 0;
  bool v60 = v55 != v59;
  if (v60) {
  } else {
    int v61 = 8;
    int v62 = v61 + v52;
    int v63 = v51[v62];
    int v64 = 0;
    bool v65 = v63 != v64;
    if (v65) {
      helper0(v52, v50, v55, v58, static_cast<int>(__simt_tid3.x));
    } else {
    }
  }
  int v66 = 12;
  int v67 = v66 + v52;
  int v68 = v51[v67];
  uint v69 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v70 = (int)(v69);
  int v71;
  v71 = v70;
  switch (v68) {
    default:
      {
      int v72 = 16;
      int v73 = v72 + v52;
      int v74 = v51[v73];
      int v75 = 4;
      int v76;
      v76 = v75;
      switch (v74) {
        default:
          {
          int v77 = 20;
          int v78 = v77 + v52;
          int v79 = v51[v78];
          int v80 = 0;
          bool v81 = v79 != v80;
          int v82;
          if (v81) {
            int v83 = 1;
            int v84 = v52 + v83;
            v82 = v84;
          } else {
            int v85 = 1;
            v82 = v85;
          }
          v76 = v82;
        }
        case 0:
          {
          int v86 = 24;
          int v87 = v86 + v52;
          int v88 = v51[v87];
          int v89;
          v89 = v52;
          switch (v88) {
            case 0:
              {
              int v90 = 1;
              v89 = v90;
              break;
            }
            case 1:
              {
              int v91 = 4;
              int v92 = v52 + v91;
              v89 = v92;
              break;
            }
            default:
              {
              v89 = v52;
              break;
            }
          }
          v76 = v89;
          break;
        }
      }
      v71 = v76;
      break;
    }
    case 0:
      {
      int v93 = 4;
      int v94 = v52 + v93;
      v71 = v94;
      break;
    }
    case 1:
      {
      int v95 = 28;
      int v96 = v95 + v52;
      int v97 = v51[v96];
      int v98 = 3;
      int v99 = v52 + v98;
      int v100;
      v100 = v99;
      switch (v97) {
        case 0:
          {
          int v101 = 32;
          int v102 = v101 + v52;
          int v103 = v51[v102];
          int v104 = 0;
          bool v105 = v103 != v104;
          int v106;
          if (v105) {
            int v107 = 2;
            v106 = v107;
          } else {
            int v108 = 1;
            v106 = v108;
          }
          v100 = v106;
          break;
        }
        case 1:
          {
          int v109 = 4;
          int v110 = v52 + v109;
          v100 = v110;
          break;
        }
        default:
          {
          int v111 = 36;
          int v112 = v111 + v52;
          int v113 = v51[v112];
          int v114;
          v114 = v52;
          switch (v113) {
            default:
              {
              int v115 = 0;
              v114 = v115;
              break;
            }
            case 0:
              {
              int v116 = 0;
              int v117 = v52 + v116;
              v114 = v117;
              break;
            }
          }
          v100 = v114;
          break;
        }
      }
      bool v118 = true;
      v71 = v100;
      break;
    }
  }
  int v119 = 40;
  int v120 = v119 + v52;
  int v121 = v51[v120];
  int v122;
  v122 = v52;
  switch (v121) {
    case 0:
      {
      int v123 = 44;
      int v124 = v123 + v52;
      int v125 = v51[v124];
      int v126 = 0;
      bool v127 = v125 != v126;
      int v128;
      if (v127) {
        int v129 = 1;
        int v130 = v52 + v129;
        v128 = v130;
      } else {
        int v131 = 48;
        int v132 = v131 + v52;
        int v133 = v51[v132];
        int v134 = 3;
        int v135 = v52 + v134;
        int v136;
        v136 = v135;
        switch (v133) {
          case 0:
            {
            v136 = v52;
            break;
          }
          default:
            {
            int v137 = 1;
            v136 = v137;
            break;
          }
          case 1:
            {
            int v138 = 0;
            int v139 = v52 + v138;
            v136 = v139;
            break;
          }
        }
        bool v140 = true;
        v128 = v136;
      }
      v122 = v128;
      break;
    }
    case 1:
      {
      int v141 = 52;
      int v142 = v141 + v52;
      int v143 = v51[v142];
      int v144;
      v144 = v52;
      switch (v143) {
        case 0:
          {
          int v145 = 56;
          int v146 = v145 + v52;
          int v147 = v51[v146];
          int v148 = 0;
          bool v149 = v147 != v148;
          int v150;
          if (v149) {
            v150 = v52;
          } else {
            int v151 = 2;
            v150 = v151;
          }
          v144 = v150;
          break;
        }
        default:
          {
          int v152 = 60;
          int v153 = v152 + v52;
          int v154 = v51[v153];
          int v155 = 0;
          bool v156 = v154 != v155;
          int v157;
          if (v156) {
            v157 = v52;
          } else {
            v157 = v52;
          }
          v144 = v157;
          break;
        }
        case 1:
          {
          int v158 = 4;
          v144 = v158;
          break;
        }
        case 2:
          {
          int v159 = 64;
          int v160 = v159 + v52;
          int v161 = v51[v160];
          int v162 = 0;
          bool v163 = v161 != v162;
          int v164;
          if (v163) {
            v164 = v52;
          } else {
            v164 = v52;
          }
          v144 = v164;
          break;
        }
      }
      v122 = v144;
      break;
    }
    case 2:
      {
      int v165 = 68;
      int v166 = v165 + v52;
      int v167 = v51[v166];
      int v168 = 1;
      int v169 = v52 + v168;
      int v170;
      v170 = v169;
      switch (v167) {
        case 0:
          {
          int v171 = 72;
          int v172 = v171 + v52;
          int v173 = v51[v172];
          int v174;
          v174 = v52;
          switch (v173) {
            default:
              {
              int v175 = 1;
              v174 = v175;
              break;
            }
            case 0:
              {
              v174 = v52;
              break;
            }
          }
          v170 = v174;
          break;
        }
        default:
          {
          int v176 = 76;
          int v177 = v176 + v52;
          int v178 = v51[v177];
          int v179 = 0;
          bool v180 = v178 != v179;
          int v181;
          if (v180) {
            int v182 = 3;
            int v183 = v52 + v182;
            v181 = v183;
          } else {
            int v184 = 2;
            v181 = v184;
          }
          v170 = v181;
          break;
        }
      }
      v122 = v170;
      break;
    }
    default:
      {
      int v185 = 80;
      int v186 = v185 + v52;
      int v187 = v51[v186];
      int v188 = 0;
      int v189 = v52 + v188;
      int v190;
      v190 = v189;
      switch (v187) {
        default:
          {
          int v191 = 84;
          int v192 = v191 + v52;
          int v193 = v51[v192];
          int v194 = 2;
          int v195;
          v195 = v194;
          switch (v193) {
            case 0:
              {
              v195 = v52;
              break;
            }
            default:
              {
              int v196 = 4;
              v195 = v196;
              break;
            }
            case 1:
              {
              int v197 = 4;
              v195 = v197;
              break;
            }
          }
          v190 = v195;
          break;
        }
        case 0:
          {
          int v198 = 1;
          int v199 = v52 + v198;
          v190 = v199;
          break;
        }
        case 1:
          {
          int v200 = 88;
          int v201 = v200 + v52;
          int v202 = v51[v201];
          int v203 = 4;
          int v204;
          v204 = v203;
          switch (v202) {
            default:
              {
              int v205 = 1;
              v204 = v205;
              break;
            }
            case 0:
              {
              int v206 = 3;
              int v207 = v52 + v206;
              v204 = v207;
              break;
            }
            case 1:
              {
              int v208 = 4;
              v204 = v208;
              break;
            }
            case 2:
              {
              int v209 = 3;
              v204 = v209;
              break;
            }
          }
          v190 = v204;
        }
        case 2:
          {
          int v210 = 92;
          int v211 = v210 + v52;
          int v212 = v51[v211];
          int v213 = 0;
          bool v214 = v212 != v213;
          int v215;
          if (v214) {
            int v216 = 3;
            int v217 = v52 + v216;
            v215 = v217;
          } else {
            v215 = v52;
          }
          v190 = v215;
          break;
        }
      }
      v122 = v190;
      break;
    }
  }
  int v218 = 96;
  int v219 = v218 + v52;
  int v220 = v51[v219];
  int v221 = 0;
  int v222 = v52 + v221;
  int v223;
  v223 = v222;
  switch (v220) {
    default:
      {
      int v224 = 100;
      int v225 = v224 + v52;
      int v226 = v51[v225];
      int v227 = 2;
      int v228 = v52 + v227;
      int v229;
      v229 = v228;
      switch (v226) {
        default:
          {
          int v230 = 2;
          v229 = v230;
          break;
        }
        case 0:
          {
          int v231 = 4;
          v229 = v231;
          break;
        }
      }
      v223 = v229;
      break;
    }
    case 0:
      {
      int v232 = 104;
      int v233 = v232 + v52;
      int v234 = v51[v233];
      int v235 = 0;
      bool v236 = v234 != v235;
      int v237;
      if (v236) {
        int v238 = 1;
        v237 = v238;
      } else {
        int v239 = 2;
        int v240 = v52 + v239;
        v237 = v240;
      }
      v223 = v237;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 35; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 108; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
