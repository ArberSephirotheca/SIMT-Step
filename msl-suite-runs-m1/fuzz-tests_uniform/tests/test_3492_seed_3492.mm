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
  int v6 = 1;
  int v7 = v0 + v6;
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
        case 0:
          {
          int v13 = 0;
          bool v14 = v2 != v13;
          int v15;
          if (v14) {
            int v16 = 3;
            v15 = v16;
          } else {
            int v17 = 0;
            int v18 = v0 + v17;
            v15 = v18;
          }
          int v19 = 1;
          v12 = v15;
          break;
        }
        case 1:
          {
          int v20 = 0;
          bool v21 = v2 != v20;
          int v22;
          if (v21) {
            int v23 = 1;
            v22 = v23;
          } else {
            int v24 = 2;
            v22 = v24;
          }
          v12 = v22;
        }
        default:
          {
          int v25 = 0;
          bool v26 = v2 != v25;
          int v27;
          if (v26) {
            int v28 = 1;
            v27 = v28;
          } else {
            v27 = v0;
          }
          int v29 = 4;
          int v30 = v0 + v29;
          v12 = v27;
          break;
        }
        case 2:
          {
          int v31 = 2;
          int v32 = v3 % v31;
          int v33;
          v33 = v0;
          switch (v32) {
            case 0:
              {
              int v34 = 4;
              v33 = v34;
              break;
            }
            default:
              {
              int v35 = 0;
              int v36 = v0 + v35;
              v33 = v36;
              break;
            }
          }
          v12 = v33;
          break;
        }
      }
      int v37 = 0;
      int v38 = v0 + v37;
      v8 = v12;
      break;
    }
    case 1:
      {
      int v39 = 0;
      int v40 = 0;
      int v41;
      int v42;
      v41 = v39;
      v42 = v40;
      while (true) {
        int v43 = 4;
        int v44 = v3 % v43;
        int v45 = 1;
        int v46 = v44 + v45;
        bool v47 = v42 < v46;
        v41 = v41;
        v42 = v42;
        if (!v47) break;
        int v48 = 4;
        int v49 = 1;
        int v50 = v42 + v49;
        v41 = v48;
        v42 = v50;
        break;
        ;
      }
      v8 = v41;
      break;
    }
    case 2:
      {
      int v51 = 4;
      int v52 = v3 % v51;
      int v53 = 3;
      int v54 = v0 + v53;
      int v55;
      v55 = v54;
      switch (v52) {
        default:
          {
          int v56 = 0;
          bool v57 = v2 != v56;
          int v58;
          if (v57) {
            int v59 = 4;
            v58 = v59;
          } else {
            int v60 = 0;
            v58 = v60;
          }
          int v61 = 2;
          int v62 = v0 + v61;
          v55 = v58;
        }
        case 0:
          {
          int v63 = 0;
          bool v64 = v2 != v63;
          int v65;
          if (v64) {
            int v66 = 0;
            int v67 = v0 + v66;
            v65 = v67;
          } else {
            int v68 = 4;
            v65 = v68;
          }
          int v69 = 4;
          v55 = v65;
        }
        case 1:
          {
          int v70 = 0;
          int v71 = 0;
          int v72;
          int v73;
          v72 = v70;
          v73 = v71;
          while (true) {
            int v74 = 4;
            int v75 = v3 % v74;
            int v76 = 1;
            int v77 = v75 + v76;
            bool v78 = v73 < v77;
            v72 = v72;
            v73 = v73;
            if (!v78) break;
            int v79 = 0;
            int v80 = v0 + v79;
            int v81 = 1;
            int v82 = v73 + v81;
            v72 = v80;
            v73 = v82;
            break;
            ;
          }
          int v83 = 0;
          v55 = v72;
          break;
        }
        case 2:
          {
          int v84 = 3;
          int v85 = v3 % v84;
          int v86 = 4;
          int v87 = v0 + v86;
          int v88;
          v88 = v87;
          switch (v85) {
            default:
              {
              int v89 = 1;
              int v90 = v0 + v89;
              v88 = v90;
              break;
            }
            case 0:
              {
              v88 = v0;
              break;
            }
            case 1:
              {
              int v91 = 3;
              int v92 = v0 + v91;
              v88 = v92;
              break;
            }
          }
          int v93 = 0;
          int v94 = v0 + v93;
          v55 = v88;
          break;
        }
      }
      v8 = v55;
      break;
    }
    default:
      {
      int v95 = 0;
      bool v96 = v2 != v95;
      int v97;
      if (v96) {
        int v98 = 0;
        bool v99 = v2 != v98;
        int v100;
        if (v99) {
          int v101 = 1;
          v100 = v101;
        } else {
          v100 = v0;
        }
        int v102 = 3;
        v97 = v100;
      } else {
        int v103 = 0;
        bool v104 = v2 != v103;
        int v105;
        if (v104) {
          int v106 = 3;
          v105 = v106;
        } else {
          int v107 = 4;
          v105 = v107;
        }
        int v108 = 3;
        v97 = v105;
      }
      int v109 = 1;
      int v110 = v0 + v109;
      v8 = v97;
      break;
    }
  }
  bool v111 = true;
  int v112 = simt_wave_count_bits(v111);
  int v113 = 0;
  int v114 = v113 + v0;
  v1[v114] = v112;
  return;
}

kernel void kernel_main(device int* v115 [[buffer(0)]], device int* v116 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v117 = static_cast<int>(__simt_tid3.x);
  int v118 = 0;
  int v119 = v118 + v117;
  int v120 = v116[v119];
  int v121 = 4;
  int v122 = v121 + v117;
  int v123 = v116[v122];
  helper0(v117, v115, v120, v123, static_cast<int>(__simt_tid3.x));
  int v124 = 0;
  int v125 = 0;
  int v126;
  int v127;
  v126 = v124;
  v127 = v125;
  while (true) {
    int v128 = 4;
    int v129 = v127 * v128;
    int v130 = v129 + v117;
    int v131 = 8;
    int v132 = v131 + v130;
    int v133 = v116[v132];
    int v134 = 0;
    bool v135 = v133 != v134;
    v126 = v126;
    v127 = v127;
    if (!v135) break;
    int v136 = v126 + v127;
    int v137 = 1;
    int v138 = v127 + v137;
    v126 = v136;
    v127 = v138;
  }
  bool v139 = true;
  int v140 = 16;
  int v141 = v140 + v117;
  bool v142 = true;
  int v143 = simt_wave_count_bits(v142);
  v115[v141] = v143;
  int v144 = 28;
  int v145 = v144 + v117;
  int v146 = v116[v145];
  int v147;
  v147 = v117;
  switch (v146) {
    case 0:
      {
      int v148 = 32;
      int v149 = v148 + v117;
      int v150 = v116[v149];
      int v151 = 1;
      int v152;
      v152 = v151;
      switch (v150) {
        default:
          {
          int v153 = 36;
          int v154 = v153 + v117;
          int v155 = v116[v154];
          int v156 = 0;
          bool v157 = v155 != v156;
          int v158;
          if (v157) {
            int v159 = 2;
            int v160 = v117 + v159;
            v158 = v160;
          } else {
            int v161 = 2;
            int v162 = v117 + v161;
            v158 = v162;
          }
          v152 = v158;
          break;
        }
        case 0:
          {
          int v163 = 40;
          int v164 = v163 + v117;
          int v165 = v116[v164];
          int v166;
          v166 = v117;
          switch (v165) {
            default:
              {
              int v167 = 2;
              int v168 = v117 + v167;
              v166 = v168;
              break;
            }
            case 0:
              {
              int v169 = 3;
              int v170 = v117 + v169;
              v166 = v170;
            }
            case 1:
              {
              int v171 = 2;
              v166 = v171;
              break;
            }
          }
          bool v172 = true;
          v152 = v166;
          break;
        }
        case 1:
          {
          int v173 = 44;
          int v174 = v173 + v117;
          int v175 = v116[v174];
          int v176 = 0;
          bool v177 = v175 != v176;
          int v178;
          if (v177) {
            v178 = v117;
          } else {
            int v179 = 3;
            v178 = v179;
          }
          v152 = v178;
          break;
        }
      }
      bool v180 = true;
      v147 = v152;
      break;
    }
    case 1:
      {
      int v181 = 48;
      int v182 = v181 + v117;
      int v183 = v116[v182];
      int v184 = 0;
      bool v185 = v183 != v184;
      int v186;
      if (v185) {
        v186 = v117;
      } else {
        int v187 = 0;
        int v188 = 0;
        int v189;
        int v190;
        v189 = v187;
        v190 = v188;
        while (true) {
          int v191 = 4;
          int v192 = v190 * v191;
          int v193 = v192 + v117;
          int v194 = 52;
          int v195 = v194 + v193;
          int v196 = v116[v195];
          int v197 = 0;
          bool v198 = v196 != v197;
          v189 = v189;
          v190 = v190;
          if (!v198) break;
          int v199 = v189 + v190;
          int v200 = 1;
          int v201 = v190 + v200;
          v189 = v199;
          v190 = v201;
          continue;
          ;
        }
        bool v202 = true;
        v186 = v189;
      }
      v147 = v186;
    }
    default:
      {
      int v203 = 0;
      int v204 = 0;
      int v205;
      int v206;
      v205 = v203;
      v206 = v204;
      while (true) {
        int v207 = 4;
        int v208 = v206 * v207;
        int v209 = v208 + v117;
        int v210 = 72;
        int v211 = v210 + v209;
        int v212 = v116[v211];
        int v213 = 0;
        bool v214 = v212 != v213;
        v205 = v205;
        v206 = v206;
        if (!v214) break;
        int v215 = v205 + v206;
        int v216 = 1;
        int v217 = v206 + v216;
        v205 = v215;
        v206 = v217;
      }
      bool v218 = true;
      v147 = v205;
      break;
    }
    case 2:
      {
      int v219 = 0;
      int v220 = 0;
      int v221;
      int v222;
      v221 = v219;
      v222 = v220;
      while (true) {
        int v223 = 4;
        int v224 = v222 * v223;
        int v225 = v224 + v117;
        int v226 = 92;
        int v227 = v226 + v225;
        int v228 = v116[v227];
        int v229 = 0;
        bool v230 = v228 != v229;
        v221 = v221;
        v222 = v222;
        if (!v230) break;
        int v231 = v221 + v222;
        int v232 = 1;
        int v233 = v222 + v232;
        v221 = v231;
        v222 = v233;
        continue;
        ;
      }
      bool v234 = true;
      v147 = v221;
      break;
    }
  }
  bool v235 = true;
  int v236 = 32;
  int v237 = v236 + v117;
  bool v238 = true;
  int v239 = simt_wave_count_bits(v238);
  v115[v237] = v239;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
