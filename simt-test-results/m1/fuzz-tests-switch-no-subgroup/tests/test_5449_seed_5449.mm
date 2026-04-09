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
    bool v7 = true;
    int v8 = simt_wave_count_bits(v7);
    int v9 = 0;
    int v10 = v9 + v0;
    v1[v10] = v8;
    v6 = v8;
  } else {
    bool v11 = true;
    int v12 = simt_wave_count_bits(v11);
    int v13 = 16;
    int v14 = v13 + v0;
    v1[v14] = v12;
    v6 = v12;
  }
  int v15 = 3;
  int v16 = v3 % v15;
  int v17;
  v17 = v0;
  switch (v16) {
    case 0:
      {
      int v18 = 0;
      int v19 = 0;
      int v20;
      int v21;
      v20 = v18;
      v21 = v19;
      while (true) {
        int v22 = 4;
        int v23 = v3 % v22;
        int v24 = 1;
        int v25 = v23 + v24;
        bool v26 = v21 < v25;
        v20 = v20;
        v21 = v21;
        if (!v26) break;
        int v27 = 0;
        int v28 = 0;
        int v29;
        int v30;
        v29 = v27;
        v30 = v28;
        while (true) {
          int v31 = 4;
          int v32 = v3 % v31;
          int v33 = 1;
          int v34 = v32 + v33;
          bool v35 = v30 < v34;
          v29 = v29;
          v30 = v30;
          if (!v35) break;
          int v36 = 1;
          int v37 = v30 + v36;
          v29 = v0;
          v30 = v37;
        }
        int v38 = 1;
        int v39 = v21 + v38;
        v20 = v29;
        v21 = v39;
        break;
        ;
      }
      v17 = v20;
      break;
    }
    default:
      {
      int v40 = 3;
      int v41 = v3 % v40;
      int v42 = 0;
      int v43;
      v43 = v42;
      switch (v41) {
        case 0:
          {
          int v44 = 0;
          int v45 = 0;
          int v46;
          int v47;
          v46 = v44;
          v47 = v45;
          while (true) {
            int v48 = 4;
            int v49 = v3 % v48;
            int v50 = 1;
            int v51 = v49 + v50;
            bool v52 = v47 < v51;
            v46 = v46;
            v47 = v47;
            if (!v52) break;
            int v53 = 1;
            int v54 = v0 + v53;
            int v55 = 1;
            int v56 = v47 + v55;
            v46 = v54;
            v47 = v56;
          }
          v43 = v46;
          break;
        }
        case 1:
          {
          int v57 = 3;
          int v58 = v3 % v57;
          int v59;
          v59 = v0;
          switch (v58) {
            case 0:
              {
              int v60 = 0;
              int v61 = v0 + v60;
              v59 = v61;
              break;
            }
            case 1:
              {
              int v62 = 2;
              v59 = v62;
              break;
            }
            case 2:
              {
              v59 = v0;
              break;
            }
            default:
              {
              int v63 = 3;
              int v64 = v0 + v63;
              v59 = v64;
              break;
            }
          }
          v43 = v59;
          break;
        }
        case 2:
          {
          int v65 = 2;
          int v66 = v3 % v65;
          int v67;
          v67 = v0;
          switch (v66) {
            case 0:
              {
              int v68 = 0;
              v67 = v68;
              break;
            }
            default:
              {
              v67 = v0;
              break;
            }
            case 1:
              {
              int v69 = 4;
              v67 = v69;
              break;
            }
          }
          v43 = v67;
          break;
        }
        default:
          {
          int v70 = 0;
          bool v71 = v2 != v70;
          int v72;
          if (v71) {
            int v73 = 4;
            v72 = v73;
          } else {
            v72 = v0;
          }
          v43 = v72;
          break;
        }
      }
      v17 = v43;
      break;
    }
    case 1:
      {
      int v74 = 0;
      bool v75 = v2 != v74;
      int v76;
      if (v75) {
        int v77 = 0;
        bool v78 = v2 != v77;
        int v79;
        if (v78) {
          v79 = v0;
        } else {
          v79 = v0;
        }
        v76 = v79;
      } else {
        v76 = v0;
      }
      v17 = v76;
      break;
    }
    case 2:
      {
      int v80 = 4;
      int v81 = v3 % v80;
      int v82 = 3;
      int v83 = v0 + v82;
      int v84;
      v84 = v83;
      switch (v81) {
        case 0:
          {
          int v85 = 0;
          int v86 = 0;
          int v87;
          int v88;
          v87 = v85;
          v88 = v86;
          while (true) {
            int v89 = 4;
            int v90 = v3 % v89;
            int v91 = 1;
            int v92 = v90 + v91;
            bool v93 = v88 < v92;
            v87 = v87;
            v88 = v88;
            if (!v93) break;
            int v94 = 1;
            int v95 = v88 + v94;
            v87 = v0;
            v88 = v95;
          }
          v84 = v87;
          break;
        }
        case 1:
          {
          int v96 = 0;
          bool v97 = v2 != v96;
          int v98;
          if (v97) {
            int v99 = 3;
            v98 = v99;
          } else {
            int v100 = 3;
            v98 = v100;
          }
          v84 = v98;
          break;
        }
        default:
          {
          int v101 = 0;
          bool v102 = v2 != v101;
          int v103;
          if (v102) {
            int v104 = 3;
            int v105 = v0 + v104;
            v103 = v105;
          } else {
            int v106 = 1;
            int v107 = v0 + v106;
            v103 = v107;
          }
          v84 = v103;
          break;
        }
        case 2:
          {
          int v108 = 0;
          bool v109 = v2 != v108;
          int v110;
          if (v109) {
            int v111 = 3;
            int v112 = v0 + v111;
            v110 = v112;
          } else {
            int v113 = 2;
            v110 = v113;
          }
          v84 = v110;
          break;
        }
      }
      v17 = v84;
      break;
    }
  }
  bool v114 = true;
  int v115 = simt_wave_count_bits(v114);
  int v116 = 32;
  int v117 = v116 + v0;
  v1[v117] = v115;
  int v118 = 0;
  bool v119 = v2 != v118;
  int v120 = v119 ? v6 : v17;
  return;
}

kernel void kernel_main(device int* v121 [[buffer(0)]], device int* v122 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v123 = static_cast<int>(__simt_tid3.x);
  int v124 = 0;
  int v125 = v124 + v123;
  int v126 = v122[v125];
  int v127 = 4;
  int v128 = v127 + v123;
  int v129 = v122[v128];
  int v130 = 0;
  bool v131 = v126 != v130;
  if (v131) {
  } else {
    int v132 = 8;
    int v133 = v132 + v123;
    int v134 = v122[v133];
    int v135 = 0;
    bool v136 = v134 != v135;
    if (v136) {
    } else {
      helper0(v123, v121, v126, v129, static_cast<int>(__simt_tid3.x));
    }
  }
  int v137 = 12;
  int v138 = v137 + v123;
  int v139 = v122[v138];
  int v140 = 4;
  int v141;
  v141 = v140;
  switch (v139) {
    default:
      {
      int v142 = 2;
      v141 = v142;
    }
    case 0:
      {
      int v143 = 16;
      int v144 = v143 + v123;
      int v145 = v122[v144];
      int v146;
      v146 = v123;
      switch (v145) {
        case 0:
          {
          int v147 = 20;
          int v148 = v147 + v123;
          int v149 = v122[v148];
          int v150 = 4;
          int v151;
          v151 = v150;
          switch (v149) {
            case 0:
              {
              int v152 = 1;
              v151 = v152;
              break;
            }
            case 1:
              {
              int v153 = 4;
              int v154 = v123 + v153;
              v151 = v154;
              break;
            }
            case 2:
              {
              int v155 = 0;
              v151 = v155;
              break;
            }
            default:
              {
              int v156 = 4;
              v151 = v156;
              break;
            }
          }
          v146 = v151;
          break;
        }
        default:
          {
          int v157 = 24;
          int v158 = v157 + v123;
          int v159 = v122[v158];
          int v160 = 0;
          bool v161 = v159 != v160;
          int v162;
          if (v161) {
            v162 = v123;
          } else {
            int v163 = 3;
            v162 = v163;
          }
          v146 = v162;
          break;
        }
      }
      v141 = v146;
    }
    case 1:
      {
      int v164 = 28;
      int v165 = v164 + v123;
      int v166 = v122[v165];
      int v167 = 0;
      bool v168 = v166 != v167;
      int v169;
      if (v168) {
        int v170 = 0;
        v169 = v170;
      } else {
        int v171 = 32;
        int v172 = v171 + v123;
        int v173 = v122[v172];
        int v174 = 0;
        bool v175 = v173 != v174;
        int v176;
        if (v175) {
          int v177 = 0;
          v176 = v177;
        } else {
          int v178 = 1;
          int v179 = v123 + v178;
          v176 = v179;
        }
        v169 = v176;
      }
      v141 = v169;
      break;
    }
    case 2:
      {
      int v180 = 2;
      int v181 = v123 + v180;
      v141 = v181;
      break;
    }
  }
  int v182 = 36;
  int v183 = v182 + v123;
  int v184 = v122[v183];
  uint v185 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v186 = (int)(v185);
  int v187;
  v187 = v186;
  switch (v184) {
    default:
      {
      int v188 = 0;
      int v189 = 0;
      int v190;
      int v191;
      v190 = v188;
      v191 = v189;
      while (true) {
        int v192 = 4;
        int v193 = v191 * v192;
        int v194 = v193 + v123;
        int v195 = 40;
        int v196 = v195 + v194;
        int v197 = v122[v196];
        int v198 = 0;
        bool v199 = v197 != v198;
        v190 = v190;
        v191 = v191;
        if (!v199) break;
        int v200 = v190 + v191;
        int v201 = 1;
        int v202 = v191 + v201;
        bool v203 = true;
        v190 = v200;
        v191 = v202;
      }
      v187 = v190;
      break;
    }
    case 0:
      {
      int v204 = 60;
      int v205 = v204 + v123;
      int v206 = v122[v205];
      int v207 = 3;
      int v208 = v123 + v207;
      int v209;
      v209 = v208;
      switch (v206) {
        case 0:
          {
          v209 = v123;
          break;
        }
        case 1:
          {
          int v210 = 0;
          int v211 = 0;
          int v212;
          int v213;
          v212 = v210;
          v213 = v211;
          while (true) {
            int v214 = 4;
            int v215 = v213 * v214;
            int v216 = v215 + v123;
            int v217 = 64;
            int v218 = v217 + v216;
            int v219 = v122[v218];
            int v220 = 0;
            bool v221 = v219 != v220;
            v212 = v212;
            v213 = v213;
            if (!v221) break;
            int v222 = v212 + v213;
            int v223 = 1;
            int v224 = v213 + v223;
            bool v225 = true;
            v212 = v222;
            v213 = v224;
            continue;
            ;
          }
          v209 = v212;
          break;
        }
        case 2:
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
            int v232 = v231 + v123;
            int v233 = 84;
            int v234 = v233 + v232;
            int v235 = v122[v234];
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
          v209 = v228;
          break;
        }
        default:
          {
          int v242 = 2;
          v209 = v242;
          break;
        }
      }
      v187 = v209;
      break;
    }
    case 1:
      {
      int v243 = 104;
      int v244 = v243 + v123;
      int v245 = v122[v244];
      int v246 = 0;
      bool v247 = v245 != v246;
      int v248;
      if (v247) {
        int v249 = 108;
        int v250 = v249 + v123;
        int v251 = v122[v250];
        int v252 = 0;
        bool v253 = v251 != v252;
        int v254;
        if (v253) {
          int v255 = 3;
          int v256 = v123 + v255;
          v254 = v256;
        } else {
          int v257 = 0;
          v254 = v257;
        }
        v248 = v254;
      } else {
        int v258 = 3;
        v248 = v258;
      }
      v187 = v248;
      break;
    }
    case 2:
      {
      v187 = v123;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 112; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
