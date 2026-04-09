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
  int v8 = 0;
  int v9 = 0;
  int v10;
  int v11;
  v10 = v8;
  v11 = v9;
  while (true) {
    int v12 = 4;
    int v13 = v3 % v12;
    int v14 = 1;
    int v15 = v13 + v14;
    bool v16 = v11 < v15;
    v10 = v10;
    v11 = v11;
    if (!v16) break;
    int v17 = 0;
    int v18 = 0;
    int v19;
    int v20;
    v19 = v17;
    v20 = v18;
    while (true) {
      int v21 = 4;
      int v22 = v3 % v21;
      int v23 = 1;
      int v24 = v22 + v23;
      bool v25 = v20 < v24;
      v19 = v19;
      v20 = v20;
      if (!v25) break;
      int v26 = 3;
      int v27 = v3 % v26;
      int v28 = 2;
      int v29 = v0 + v28;
      int v30;
      v30 = v29;
      switch (v27) {
        case 0:
          {
          int v31 = 2;
          int v32 = v0 + v31;
          v30 = v32;
          break;
        }
        default:
          {
          v30 = v0;
          break;
        }
        case 1:
          {
          int v33 = 1;
          v30 = v33;
        }
        case 2:
          {
          v30 = v0;
          break;
        }
      }
      int v34 = 1;
      int v35 = v20 + v34;
      v19 = v30;
      v20 = v35;
      break;
      ;
    }
    int v36 = 1;
    int v37 = v11 + v36;
    v10 = v19;
    v11 = v37;
    break;
    ;
  }
  int v38 = 0;
  bool v39 = v2 != v38;
  int v40 = v39 ? v5 : v10;
  return;
}

kernel void kernel_main(device int* v41 [[buffer(0)]], device int* v42 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v43 = static_cast<int>(__simt_tid3.x);
  int v44 = 0;
  int v45 = v44 + v43;
  int v46 = v42[v45];
  int v47 = 4;
  int v48 = v47 + v43;
  int v49 = v42[v48];
  int v50 = 0;
  bool v51 = v46 != v50;
  if (v51) {
  } else {
    int v52 = 0;
    int v53 = 0;
    int v54;
    int v55;
    v54 = v52;
    v55 = v53;
    while (true) {
      int v56 = 2;
      bool v57 = v55 < v56;
      v54 = v54;
      v55 = v55;
      if (!v57) break;
      int v58 = 3;
      int v59 = v43 % v58;
      uint v60 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v61 = (int)(v60);
      int v62;
      v62 = v61;
      switch (v59) {
        default:
          {
          int v63 = 0;
          int v64 = v62 + v63;
          v62 = v64;
          break;
        }
        case 0:
          {
          int v65 = 2;
          int v66 = v62 + v65;
          v62 = v66;
          break;
        }
        case 1:
          {
          int v67 = 1;
          int v68 = v62 + v67;
          v62 = v68;
          break;
        }
        case 2:
          {
          int v69 = 0;
          int v70 = v62 + v69;
          v62 = v70;
          break;
        }
      }
      helper0(v43, v41, v46, v49, static_cast<int>(__simt_tid3.x));
      int v71 = 1;
      int v72 = v55 + v71;
      v54 = v54;
      v55 = v72;
    }
  }
  int v73 = 8;
  int v74 = v73 + v43;
  int v75 = v42[v74];
  int v76 = 0;
  int v77;
  v77 = v76;
  switch (v75) {
    default:
      {
      int v78 = 3;
      int v79 = v43 + v78;
      v77 = v79;
      break;
    }
    case 0:
      {
      int v80 = 12;
      int v81 = v80 + v43;
      int v82 = v42[v81];
      int v83 = 0;
      bool v84 = v82 != v83;
      int v85;
      if (v84) {
        int v86 = 2;
        int v87 = v43 + v86;
        v85 = v87;
      } else {
        int v88 = 16;
        int v89 = v88 + v43;
        int v90 = v42[v89];
        int v91 = 0;
        bool v92 = v90 != v91;
        int v93;
        if (v92) {
          int v94 = 4;
          v93 = v94;
        } else {
          int v95 = 1;
          int v96 = v43 + v95;
          v93 = v96;
        }
        v85 = v93;
      }
      v77 = v85;
      break;
    }
  }
  bool v97 = true;
  int v98 = 16;
  int v99 = v98 + v43;
  bool v100 = true;
  int v101 = simt_wave_count_bits(v100);
  v41[v99] = v101;
  int v102 = 20;
  int v103 = v102 + v43;
  int v104 = v42[v103];
  uint v105 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v106 = (int)(v105);
  int v107;
  v107 = v106;
  switch (v104) {
    case 0:
      {
      int v108 = 24;
      int v109 = v108 + v43;
      int v110 = v42[v109];
      int v111 = 4;
      int v112 = v43 + v111;
      int v113;
      v113 = v112;
      switch (v110) {
        case 0:
          {
          int v114 = 1;
          v113 = v114;
          break;
        }
        default:
          {
          int v115 = 0;
          int v116 = 0;
          int v117;
          int v118;
          v117 = v115;
          v118 = v116;
          while (true) {
            int v119 = 4;
            int v120 = v118 * v119;
            int v121 = v120 + v43;
            int v122 = 28;
            int v123 = v122 + v121;
            int v124 = v42[v123];
            int v125 = 0;
            bool v126 = v124 != v125;
            v117 = v117;
            v118 = v118;
            if (!v126) break;
            int v127 = v117 + v118;
            int v128 = 1;
            int v129 = v118 + v128;
            bool v130 = true;
            v117 = v127;
            v118 = v129;
          }
          v113 = v117;
          break;
        }
        case 1:
          {
          int v131 = 48;
          int v132 = v131 + v43;
          int v133 = v42[v132];
          int v134 = 0;
          bool v135 = v133 != v134;
          int v136;
          if (v135) {
            v136 = v43;
          } else {
            v136 = v43;
          }
          v113 = v136;
          break;
        }
      }
      v107 = v113;
      break;
    }
    default:
      {
      int v137 = 52;
      int v138 = v137 + v43;
      int v139 = v42[v138];
      int v140 = 1;
      int v141 = v43 + v140;
      int v142;
      v142 = v141;
      switch (v139) {
        default:
          {
          int v143 = 56;
          int v144 = v143 + v43;
          int v145 = v42[v144];
          int v146 = 3;
          int v147 = v43 + v146;
          int v148;
          v148 = v147;
          switch (v145) {
            default:
              {
              int v149 = 0;
              v148 = v149;
            }
            case 0:
              {
              int v150 = 0;
              v148 = v150;
            }
            case 1:
              {
              v148 = v43;
              break;
            }
          }
          v142 = v148;
          break;
        }
        case 0:
          {
          int v151 = 60;
          int v152 = v151 + v43;
          int v153 = v42[v152];
          int v154;
          v154 = v43;
          switch (v153) {
            default:
              {
              int v155 = 2;
              v154 = v155;
              break;
            }
            case 0:
              {
              int v156 = 1;
              int v157 = v43 + v156;
              v154 = v157;
              break;
            }
          }
          bool v158 = true;
          v142 = v154;
          break;
        }
      }
      bool v159 = true;
      v107 = v142;
    }
    case 1:
      {
      int v160 = 64;
      int v161 = v160 + v43;
      int v162 = v42[v161];
      int v163 = 0;
      bool v164 = v162 != v163;
      int v165;
      if (v164) {
        int v166 = 3;
        v165 = v166;
      } else {
        int v167 = 68;
        int v168 = v167 + v43;
        int v169 = v42[v168];
        int v170 = 0;
        bool v171 = v169 != v170;
        int v172;
        if (v171) {
          v172 = v43;
        } else {
          int v173 = 4;
          int v174 = v43 + v173;
          v172 = v174;
        }
        v165 = v172;
      }
      v107 = v165;
      break;
    }
    case 2:
      {
      int v175 = 72;
      int v176 = v175 + v43;
      int v177 = v42[v176];
      int v178 = 4;
      int v179 = v43 + v178;
      int v180;
      v180 = v179;
      switch (v177) {
        default:
          {
          int v181 = 76;
          int v182 = v181 + v43;
          int v183 = v42[v182];
          int v184 = 4;
          int v185;
          v185 = v184;
          switch (v183) {
            default:
              {
              v185 = v43;
            }
            case 0:
              {
              v185 = v43;
            }
            case 1:
              {
              int v186 = 2;
              v185 = v186;
              break;
            }
            case 2:
              {
              int v187 = 1;
              int v188 = v43 + v187;
              v185 = v188;
              break;
            }
          }
          v180 = v185;
        }
        case 0:
          {
          int v189 = 80;
          int v190 = v189 + v43;
          int v191 = v42[v190];
          int v192;
          v192 = v43;
          switch (v191) {
            case 0:
              {
              int v193 = 3;
              int v194 = v43 + v193;
              v192 = v194;
              break;
            }
            case 1:
              {
              int v195 = 2;
              int v196 = v43 + v195;
              v192 = v196;
            }
            case 2:
              {
              int v197 = 3;
              v192 = v197;
              break;
            }
            default:
              {
              v192 = v43;
              break;
            }
          }
          bool v198 = true;
          v180 = v192;
          break;
        }
        case 1:
          {
          int v199 = 84;
          int v200 = v199 + v43;
          int v201 = v42[v200];
          int v202;
          v202 = v43;
          switch (v201) {
            default:
              {
              int v203 = 3;
              int v204 = v43 + v203;
              v202 = v204;
              break;
            }
            case 0:
              {
              int v205 = 2;
              int v206 = v43 + v205;
              v202 = v206;
              break;
            }
            case 1:
              {
              int v207 = 1;
              v202 = v207;
              break;
            }
          }
          v180 = v202;
          break;
        }
      }
      bool v208 = true;
      v107 = v180;
      break;
    }
  }
  bool v209 = true;
  int v210 = 32;
  int v211 = v210 + v43;
  bool v212 = true;
  int v213 = simt_wave_count_bits(v212);
  v41[v211] = v213;
  int v214 = 0;
  int v215 = 0;
  int v216;
  int v217;
  v216 = v214;
  v217 = v215;
  while (true) {
    int v218 = 4;
    int v219 = v217 * v218;
    int v220 = v219 + v43;
    int v221 = 88;
    int v222 = v221 + v220;
    int v223 = v42[v222];
    int v224 = 0;
    bool v225 = v223 != v224;
    v216 = v216;
    v217 = v217;
    if (!v225) break;
    int v226 = v216 + v217;
    int v227 = 1;
    int v228 = v217 + v227;
    bool v229 = true;
    int v230 = 48;
    int v231 = 4;
    int v232 = v217 * v231;
    int v233 = v230 + v232;
    int v234 = v233 + v43;
    bool v235 = true;
    int v236 = simt_wave_count_bits(v235);
    v41[v234] = v236;
    v216 = v226;
    v217 = v228;
    break;
    ;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 108; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
