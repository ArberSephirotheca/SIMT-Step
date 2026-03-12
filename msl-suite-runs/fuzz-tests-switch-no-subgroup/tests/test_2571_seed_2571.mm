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
  uint v4 = simt_lane_id(__simt_tid);
  int v5 = (int)(v4);
  int v6;
  v6 = v5;
  switch (v3) {
    default:
      {
      int v7 = 0;
      bool v8 = v2 != v7;
      int v9;
      if (v8) {
        int v10 = 0;
        int v11 = 0;
        int v12;
        int v13;
        v12 = v10;
        v13 = v11;
        while (true) {
          int v14 = 4;
          int v15 = v3 % v14;
          int v16 = 1;
          int v17 = v15 + v16;
          bool v18 = v13 < v17;
          v12 = v12;
          v13 = v13;
          if (!v18) break;
          int v19 = 4;
          int v20 = v0 + v19;
          int v21 = 1;
          int v22 = v13 + v21;
          v12 = v20;
          v13 = v22;
          break;
          ;
        }
        v9 = v12;
      } else {
        int v23 = 0;
        int v24 = 0;
        int v25;
        int v26;
        v25 = v23;
        v26 = v24;
        while (true) {
          int v27 = 4;
          int v28 = v3 % v27;
          int v29 = 1;
          int v30 = v28 + v29;
          bool v31 = v26 < v30;
          v25 = v25;
          v26 = v26;
          if (!v31) break;
          int v32 = 1;
          int v33 = v26 + v32;
          v25 = v0;
          v26 = v33;
        }
        v9 = v25;
      }
      v6 = v9;
      break;
    }
    case 0:
      {
      int v34;
      v34 = v0;
      switch (v3) {
        default:
          {
          int v35 = 3;
          int v36 = v3 % v35;
          int v37 = 3;
          int v38;
          v38 = v37;
          switch (v36) {
            case 0:
              {
              v38 = v0;
              break;
            }
            case 1:
              {
              v38 = v0;
              break;
            }
            default:
              {
              int v39 = 1;
              int v40 = v0 + v39;
              v38 = v40;
              break;
            }
          }
          int v41 = 0;
          int v42 = v0 + v41;
          v34 = v38;
        }
        case 0:
          {
          int v43 = 3;
          int v44 = v3 % v43;
          int v45 = 2;
          int v46 = v0 + v45;
          int v47;
          v47 = v46;
          switch (v44) {
            case 0:
              {
              int v48 = 0;
              int v49 = v0 + v48;
              v47 = v49;
              break;
            }
            case 1:
              {
              v47 = v0;
              break;
            }
            default:
              {
              int v50 = 0;
              int v51 = v0 + v50;
              v47 = v51;
            }
            case 2:
              {
              int v52 = 4;
              v47 = v52;
              break;
            }
          }
          v34 = v47;
          break;
        }
      }
      v6 = v34;
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
  int v66 = 0;
  bool v67 = v62 != v66;
  if (v67) {
  } else {
    int v68 = 0;
    int v69 = 0;
    int v70;
    int v71;
    v70 = v68;
    v71 = v69;
    while (true) {
      int v72 = 2;
      bool v73 = v71 < v72;
      v70 = v70;
      v71 = v71;
      if (!v73) break;
      int v74 = 4;
      int v75 = v59 % v74;
      int v76;
      v76 = v59;
      switch (v75) {
        case 0:
          {
          int v77 = 0;
          int v78 = v76 + v77;
          v76 = v78;
          break;
        }
        default:
          {
          int v79 = 3;
          int v80 = v76 + v79;
          v76 = v80;
          break;
        }
        case 1:
          {
          int v81 = 0;
          int v82 = v76 + v81;
          v76 = v82;
          break;
        }
        case 2:
          {
          int v83 = 1;
          int v84 = v76 + v83;
          v76 = v84;
          break;
        }
      }
      helper0(v59, v57, v62, v65, static_cast<int>(__simt_tid3.x));
      int v85 = 1;
      int v86 = v71 + v85;
      v70 = v70;
      v71 = v86;
    }
  }
  int v87 = 8;
  int v88 = v87 + v59;
  int v89 = v58[v88];
  int v90 = 3;
  int v91 = v59 + v90;
  int v92;
  v92 = v91;
  switch (v89) {
    case 0:
      {
      int v93 = 12;
      int v94 = v93 + v59;
      int v95 = v58[v94];
      int v96 = 2;
      int v97;
      v97 = v96;
      switch (v95) {
        case 0:
          {
          int v98 = 16;
          int v99 = v98 + v59;
          int v100 = v58[v99];
          int v101 = 0;
          bool v102 = v100 != v101;
          int v103;
          if (v102) {
            v103 = v59;
          } else {
            int v104 = 2;
            v103 = v104;
          }
          v97 = v103;
          break;
        }
        case 1:
          {
          int v105 = 20;
          int v106 = v105 + v59;
          int v107 = v58[v106];
          int v108 = 0;
          bool v109 = v107 != v108;
          int v110;
          if (v109) {
            int v111 = 0;
            v110 = v111;
          } else {
            int v112 = 1;
            v110 = v112;
          }
          v97 = v110;
          break;
        }
        default:
          {
          int v113 = 24;
          int v114 = v113 + v59;
          int v115 = v58[v114];
          int v116 = 0;
          bool v117 = v115 != v116;
          int v118;
          if (v117) {
            v118 = v59;
          } else {
            int v119 = 4;
            v118 = v119;
          }
          v97 = v118;
          break;
        }
        case 2:
          {
          int v120 = 0;
          int v121 = 0;
          int v122;
          int v123;
          v122 = v120;
          v123 = v121;
          while (true) {
            int v124 = 4;
            int v125 = v123 * v124;
            int v126 = v125 + v59;
            int v127 = 28;
            int v128 = v127 + v126;
            int v129 = v58[v128];
            int v130 = 0;
            bool v131 = v129 != v130;
            v122 = v122;
            v123 = v123;
            if (!v131) break;
            int v132 = v122 + v123;
            int v133 = 1;
            int v134 = v123 + v133;
            bool v135 = true;
            v122 = v132;
            v123 = v134;
          }
          v97 = v122;
          break;
        }
      }
      v92 = v97;
    }
    case 1:
      {
      int v136 = 0;
      int v137 = v59 + v136;
      v92 = v137;
      break;
    }
    default:
      {
      int v138 = 48;
      int v139 = v138 + v59;
      int v140 = v58[v139];
      int v141 = 0;
      bool v142 = v140 != v141;
      int v143;
      if (v142) {
        int v144 = 52;
        int v145 = v144 + v59;
        int v146 = v58[v145];
        int v147;
        v147 = v59;
        switch (v146) {
          default:
            {
            int v148 = 1;
            v147 = v148;
            break;
          }
          case 0:
            {
            v147 = v59;
            break;
          }
        }
        v143 = v147;
      } else {
        int v149 = 56;
        int v150 = v149 + v59;
        int v151 = v58[v150];
        int v152;
        v152 = v59;
        switch (v151) {
          case 0:
            {
            v152 = v59;
            break;
          }
          case 1:
            {
            int v153 = 1;
            v152 = v153;
            break;
          }
          default:
            {
            v152 = v59;
            break;
          }
          case 2:
            {
            v152 = v59;
            break;
          }
        }
        bool v154 = true;
        v143 = v152;
      }
      v92 = v143;
      break;
    }
    case 2:
      {
      int v155 = 60;
      int v156 = v155 + v59;
      int v157 = v58[v156];
      int v158;
      v158 = v59;
      switch (v157) {
        case 0:
          {
          int v159 = 64;
          int v160 = v159 + v59;
          int v161 = v58[v160];
          int v162;
          v162 = v59;
          switch (v161) {
            case 0:
              {
              v162 = v59;
              break;
            }
            case 1:
              {
              v162 = v59;
              break;
            }
            default:
              {
              v162 = v59;
              break;
            }
            case 2:
              {
              v162 = v59;
              break;
            }
          }
          v158 = v162;
        }
        default:
          {
          int v163 = 68;
          int v164 = v163 + v59;
          int v165 = v58[v164];
          int v166;
          v166 = v59;
          switch (v165) {
            default:
              {
              v166 = v59;
              break;
            }
            case 0:
              {
              int v167 = 4;
              v166 = v167;
              break;
            }
            case 1:
              {
              int v168 = 2;
              v166 = v168;
              break;
            }
          }
          v158 = v166;
          break;
        }
        case 1:
          {
          int v169 = 72;
          int v170 = v169 + v59;
          int v171 = v58[v170];
          int v172 = 0;
          bool v173 = v171 != v172;
          int v174;
          if (v173) {
            int v175 = 1;
            v174 = v175;
          } else {
            int v176 = 0;
            int v177 = v59 + v176;
            v174 = v177;
          }
          v158 = v174;
          break;
        }
        case 2:
          {
          int v178 = 76;
          int v179 = v178 + v59;
          int v180 = v58[v179];
          int v181 = 1;
          int v182 = v59 + v181;
          int v183;
          v183 = v182;
          switch (v180) {
            case 0:
              {
              int v184 = 2;
              v183 = v184;
              break;
            }
            case 1:
              {
              int v185 = 2;
              int v186 = v59 + v185;
              v183 = v186;
              break;
            }
            case 2:
              {
              int v187 = 4;
              v183 = v187;
              break;
            }
            default:
              {
              v183 = v59;
              break;
            }
          }
          v158 = v183;
          break;
        }
      }
      bool v188 = true;
      v92 = v158;
      break;
    }
  }
  int v189 = 80;
  int v190 = v189 + v59;
  int v191 = v58[v190];
  int v192 = 4;
  int v193 = v59 + v192;
  int v194;
  v194 = v193;
  switch (v191) {
    case 0:
      {
      int v195 = 1;
      int v196 = v59 + v195;
      v194 = v196;
      break;
    }
    case 1:
      {
      int v197 = 84;
      int v198 = v197 + v59;
      int v199 = v58[v198];
      int v200;
      v200 = v59;
      switch (v199) {
        case 0:
          {
          int v201 = 2;
          int v202 = v59 + v201;
          v200 = v202;
          break;
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
            int v209 = v208 + v59;
            int v210 = 88;
            int v211 = v210 + v209;
            int v212 = v58[v211];
            int v213 = 0;
            bool v214 = v212 != v213;
            v205 = v205;
            v206 = v206;
            if (!v214) break;
            int v215 = v205 + v206;
            int v216 = 1;
            int v217 = v206 + v216;
            bool v218 = true;
            v205 = v215;
            v206 = v217;
            break;
            ;
          }
          v200 = v205;
          break;
        }
        case 1:
          {
          int v219 = 108;
          int v220 = v219 + v59;
          int v221 = v58[v220];
          int v222;
          v222 = v59;
          switch (v221) {
            default:
              {
              int v223 = 4;
              int v224 = v59 + v223;
              v222 = v224;
              break;
            }
            case 0:
              {
              int v225 = 1;
              int v226 = v59 + v225;
              v222 = v226;
            }
            case 1:
              {
              int v227 = 2;
              v222 = v227;
              break;
            }
          }
          v200 = v222;
          break;
        }
        case 2:
          {
          int v228 = 112;
          int v229 = v228 + v59;
          int v230 = v58[v229];
          int v231;
          v231 = v59;
          switch (v230) {
            case 0:
              {
              v231 = v59;
              break;
            }
            default:
              {
              int v232 = 4;
              v231 = v232;
              break;
            }
            case 1:
              {
              int v233 = 4;
              int v234 = v59 + v233;
              v231 = v234;
              break;
            }
            case 2:
              {
              int v235 = 4;
              int v236 = v59 + v235;
              v231 = v236;
              break;
            }
          }
          v200 = v231;
          break;
        }
      }
      v194 = v200;
    }
    default:
      {
      v194 = v59;
      break;
    }
  }
  bool v237 = true;
  int v238 = 16;
  int v239 = v238 + v59;
  bool v240 = true;
  int v241 = simt_wave_count_bits(v240);
  v57[v239] = v241;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 20; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 116; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
