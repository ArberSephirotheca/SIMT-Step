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
  bool v4 = true;
  int v5 = simt_wave_count_bits(v4);
  int v6 = 0;
  int v7 = v6 + v0;
  v1[v7] = v5;
  int v8;
  v8 = v0;
  switch (v3) {
    case 0:
      {
      int v9 = 3;
      int v10 = v3 % v9;
      int v11;
      v11 = v0;
      switch (v10) {
        default:
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
            int v21 = 0;
            int v22 = v0 + v21;
            int v23 = 1;
            int v24 = v15 + v23;
            v14 = v22;
            v15 = v24;
          }
          v11 = v14;
          break;
        }
        case 0:
          {
          int v25 = 4;
          int v26 = v3 % v25;
          int v27 = 3;
          int v28 = v0 + v27;
          int v29;
          v29 = v28;
          switch (v26) {
            default:
              {
              int v30 = 4;
              int v31 = v0 + v30;
              v29 = v31;
            }
            case 0:
              {
              int v32 = 3;
              int v33 = v0 + v32;
              v29 = v33;
              break;
            }
            case 1:
              {
              v29 = v0;
            }
            case 2:
              {
              int v34 = 0;
              v29 = v34;
              break;
            }
          }
          v11 = v29;
        }
        case 1:
          {
          int v35 = 0;
          bool v36 = v2 != v35;
          int v37;
          if (v36) {
            v37 = v0;
          } else {
            v37 = v0;
          }
          v11 = v37;
        }
        case 2:
          {
          int v38 = 0;
          bool v39 = v2 != v38;
          int v40;
          if (v39) {
            int v41 = 0;
            v40 = v41;
          } else {
            int v42 = 3;
            int v43 = v0 + v42;
            v40 = v43;
          }
          v11 = v40;
          break;
        }
      }
      v8 = v11;
    }
    default:
      {
      int v44 = 2;
      int v45 = v3 % v44;
      int v46 = 4;
      int v47 = v0 + v46;
      int v48;
      v48 = v47;
      switch (v45) {
        case 0:
          {
          int v49 = 2;
          int v50 = v3 % v49;
          int v51 = 2;
          int v52 = v0 + v51;
          int v53;
          v53 = v52;
          switch (v50) {
            default:
              {
              int v54 = 3;
              v53 = v54;
            }
            case 0:
              {
              v53 = v0;
              break;
            }
          }
          v48 = v53;
          break;
        }
        default:
          {
          int v55 = 0;
          bool v56 = v2 != v55;
          int v57;
          if (v56) {
            v57 = v0;
          } else {
            int v58 = 3;
            v57 = v58;
          }
          v48 = v57;
          break;
        }
        case 1:
          {
          int v59 = 2;
          v48 = v59;
          break;
        }
      }
      v8 = v48;
      break;
    }
  }
  bool v60 = true;
  int v61 = simt_wave_count_bits(v60);
  int v62 = 16;
  int v63 = v62 + v0;
  v1[v63] = v61;
  int v64 = 0;
  bool v65 = v2 != v64;
  int v66 = v65 ? v5 : v8;
  return;
}

kernel void kernel_main(device int* v67 [[buffer(0)]], device int* v68 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v69 = static_cast<int>(__simt_tid3.x);
  int v70 = 0;
  int v71 = v70 + v69;
  int v72 = v68[v71];
  int v73 = 4;
  int v74 = v73 + v69;
  int v75 = v68[v74];
  helper0(v69, v67, v72, v75, static_cast<int>(__simt_tid3.x));
  uint v76 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v77 = (int)(v76);
  int v78 = 8;
  int v79 = v78 + v69;
  int v80 = v68[v79];
  int v81;
  v81 = v69;
  switch (v80) {
    case 0:
      {
      int v82 = 12;
      int v83 = v82 + v69;
      int v84 = v68[v83];
      int v85 = 4;
      int v86 = v69 + v85;
      int v87;
      v87 = v86;
      switch (v84) {
        case 0:
          {
          int v88 = 16;
          int v89 = v88 + v69;
          int v90 = v68[v89];
          int v91 = 0;
          bool v92 = v90 != v91;
          int v93;
          if (v92) {
            v93 = v69;
          } else {
            int v94 = 2;
            int v95 = v69 + v94;
            v93 = v95;
          }
          v87 = v93;
          break;
        }
        default:
          {
          int v96 = 20;
          int v97 = v96 + v69;
          int v98 = v68[v97];
          int v99 = 3;
          int v100 = v69 + v99;
          int v101;
          v101 = v100;
          switch (v98) {
            default:
              {
              int v102 = 3;
              v101 = v102;
            }
            case 0:
              {
              v101 = v69;
              break;
            }
          }
          v87 = v101;
          break;
        }
      }
      bool v103 = true;
      v81 = v87;
      break;
    }
    case 1:
      {
      int v104 = 24;
      int v105 = v104 + v69;
      int v106 = v68[v105];
      int v107 = 2;
      int v108 = v69 + v107;
      int v109;
      v109 = v108;
      switch (v106) {
        case 0:
          {
          int v110 = 28;
          int v111 = v110 + v69;
          int v112 = v68[v111];
          int v113 = 3;
          int v114;
          v114 = v113;
          switch (v112) {
            case 0:
              {
              int v115 = 4;
              v114 = v115;
              break;
            }
            default:
              {
              int v116 = 4;
              v114 = v116;
            }
            case 1:
              {
              v114 = v69;
              break;
            }
          }
          v109 = v114;
        }
        default:
          {
          int v117 = 2;
          v109 = v117;
          break;
        }
        case 1:
          {
          int v118 = 32;
          int v119 = v118 + v69;
          int v120 = v68[v119];
          int v121 = 4;
          int v122 = v69 + v121;
          int v123;
          v123 = v122;
          switch (v120) {
            case 0:
              {
              v123 = v69;
            }
            case 1:
              {
              int v124 = 4;
              int v125 = v69 + v124;
              v123 = v125;
            }
            default:
              {
              int v126 = 3;
              v123 = v126;
              break;
            }
          }
          v109 = v123;
        }
        case 2:
          {
          int v127 = 36;
          int v128 = v127 + v69;
          int v129 = v68[v128];
          int v130 = 1;
          int v131 = v69 + v130;
          int v132;
          v132 = v131;
          switch (v129) {
            default:
              {
              v132 = v69;
              break;
            }
            case 0:
              {
              int v133 = 1;
              v132 = v133;
            }
            case 1:
              {
              int v134 = 3;
              v132 = v134;
              break;
            }
            case 2:
              {
              int v135 = 0;
              v132 = v135;
              break;
            }
          }
          bool v136 = true;
          v109 = v132;
          break;
        }
      }
      v81 = v109;
      break;
    }
    default:
      {
      int v137 = 40;
      int v138 = v137 + v69;
      int v139 = v68[v138];
      int v140 = 0;
      bool v141 = v139 != v140;
      int v142;
      if (v141) {
        int v143 = 44;
        int v144 = v143 + v69;
        int v145 = v68[v144];
        int v146 = 0;
        int v147;
        v147 = v146;
        switch (v145) {
          case 0:
            {
            int v148 = 3;
            int v149 = v69 + v148;
            v147 = v149;
            break;
          }
          default:
            {
            int v150 = 3;
            int v151 = v69 + v150;
            v147 = v151;
            break;
          }
        }
        v142 = v147;
      } else {
        int v152 = 0;
        int v153 = 0;
        int v154;
        int v155;
        v154 = v152;
        v155 = v153;
        while (true) {
          int v156 = 4;
          int v157 = v155 * v156;
          int v158 = v157 + v69;
          int v159 = 48;
          int v160 = v159 + v158;
          int v161 = v68[v160];
          int v162 = 0;
          bool v163 = v161 != v162;
          v154 = v154;
          v155 = v155;
          if (!v163) break;
          int v164 = v154 + v155;
          int v165 = 1;
          int v166 = v155 + v165;
          bool v167 = true;
          v154 = v164;
          v155 = v166;
          continue;
          ;
        }
        v142 = v154;
      }
      v81 = v142;
      break;
    }
  }
  bool v168 = true;
  int v169 = 32;
  int v170 = v169 + v69;
  bool v171 = true;
  int v172 = simt_wave_count_bits(v171);
  v67[v170] = v172;
  int v173 = 68;
  int v174 = v173 + v69;
  int v175 = v68[v174];
  int v176 = 0;
  int v177 = v69 + v176;
  int v178;
  v178 = v177;
  switch (v175) {
    case 0:
      {
      int v179 = 72;
      int v180 = v179 + v69;
      int v181 = v68[v180];
      int v182;
      v182 = v69;
      switch (v181) {
        case 0:
          {
          int v183 = 76;
          int v184 = v183 + v69;
          int v185 = v68[v184];
          int v186;
          v186 = v69;
          switch (v185) {
            default:
              {
              int v187 = 3;
              int v188 = v69 + v187;
              v186 = v188;
            }
            case 0:
              {
              int v189 = 0;
              v186 = v189;
              break;
            }
          }
          bool v190 = true;
          v182 = v186;
          break;
        }
        default:
          {
          int v191 = 0;
          int v192 = 0;
          int v193;
          int v194;
          v193 = v191;
          v194 = v192;
          while (true) {
            int v195 = 4;
            int v196 = v194 * v195;
            int v197 = v196 + v69;
            int v198 = 80;
            int v199 = v198 + v197;
            int v200 = v68[v199];
            int v201 = 0;
            bool v202 = v200 != v201;
            v193 = v193;
            v194 = v194;
            if (!v202) break;
            int v203 = v193 + v194;
            int v204 = 1;
            int v205 = v194 + v204;
            bool v206 = true;
            v193 = v203;
            v194 = v205;
            continue;
            ;
          }
          v182 = v193;
          break;
        }
      }
      v178 = v182;
      break;
    }
    default:
      {
      int v207 = 100;
      int v208 = v207 + v69;
      int v209 = v68[v208];
      int v210;
      v210 = v69;
      switch (v209) {
        case 0:
          {
          int v211 = 104;
          int v212 = v211 + v69;
          int v213 = v68[v212];
          int v214 = 0;
          bool v215 = v213 != v214;
          int v216;
          if (v215) {
            int v217 = 0;
            int v218 = v69 + v217;
            v216 = v218;
          } else {
            v216 = v69;
          }
          v210 = v216;
        }
        case 1:
          {
          int v219 = 108;
          int v220 = v219 + v69;
          int v221 = v68[v220];
          int v222 = 0;
          bool v223 = v221 != v222;
          int v224;
          if (v223) {
            int v225 = 0;
            v224 = v225;
          } else {
            v224 = v69;
          }
          v210 = v224;
        }
        default:
          {
          int v226 = 0;
          int v227 = 0;
          int v228;
          int v229;
          v228 = v226;
          v229 = v227;
          while (true) {
            int v230 = 4;
            int v231 = v229 * v230;
            int v232 = v231 + v69;
            int v233 = 112;
            int v234 = v233 + v232;
            int v235 = v68[v234];
            int v236 = 0;
            bool v237 = v235 != v236;
            v228 = v228;
            v229 = v229;
            if (!v237) break;
            int v238 = v228 + v229;
            int v239 = 1;
            int v240 = v229 + v239;
            bool v241 = true;
            v228 = v238;
            v229 = v240;
          }
          v210 = v228;
          break;
        }
        case 2:
          {
          int v242 = 132;
          int v243 = v242 + v69;
          int v244 = v68[v243];
          int v245 = 0;
          bool v246 = v244 != v245;
          int v247;
          if (v246) {
            int v248 = 0;
            int v249 = v69 + v248;
            v247 = v249;
          } else {
            int v250 = 4;
            int v251 = v69 + v250;
            v247 = v251;
          }
          v210 = v247;
          break;
        }
      }
      v178 = v210;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 136; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
