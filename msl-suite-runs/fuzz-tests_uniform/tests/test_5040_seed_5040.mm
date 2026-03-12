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
  int v4 = 4;
  int v5 = v3 % v4;
  int v6;
  v6 = v0;
  switch (v5) {
    case 0:
      {
      int v7 = 1;
      int v8 = v0 + v7;
      v6 = v8;
      break;
    }
    case 1:
      {
      int v9 = 2;
      int v10 = v3 % v9;
      int v11 = 2;
      int v12;
      v12 = v11;
      switch (v10) {
        case 0:
          {
          int v13 = 0;
          int v14 = 0;
          int v15;
          int v16;
          v15 = v13;
          v16 = v14;
          while (true) {
            int v17 = 4;
            int v18 = v3 % v17;
            int v19 = 1;
            int v20 = v18 + v19;
            bool v21 = v16 < v20;
            v15 = v15;
            v16 = v16;
            if (!v21) break;
            int v22 = 1;
            int v23 = v16 + v22;
            v15 = v0;
            v16 = v23;
          }
          int v24 = 2;
          int v25 = v0 + v24;
          v12 = v15;
          break;
        }
        default:
          {
          int v26 = 0;
          int v27 = 0;
          int v28;
          int v29;
          v28 = v26;
          v29 = v27;
          while (true) {
            int v30 = 4;
            int v31 = v3 % v30;
            int v32 = 1;
            int v33 = v31 + v32;
            bool v34 = v29 < v33;
            v28 = v28;
            v29 = v29;
            if (!v34) break;
            int v35 = 1;
            int v36 = v29 + v35;
            v28 = v0;
            v29 = v36;
          }
          v12 = v28;
          break;
        }
      }
      int v37 = 1;
      int v38 = v0 + v37;
      v6 = v12;
      break;
    }
    case 2:
      {
      int v39 = 2;
      int v40 = v3 % v39;
      int v41;
      v41 = v0;
      switch (v40) {
        default:
          {
          int v42 = 1;
          int v43 = v0 + v42;
          v41 = v43;
        }
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
            int v53 = 3;
            int v54 = v0 + v53;
            int v55 = 1;
            int v56 = v47 + v55;
            v46 = v54;
            v47 = v56;
          }
          int v57 = 4;
          int v58 = v0 + v57;
          v41 = v46;
          break;
        }
        case 1:
          {
          int v59 = 4;
          int v60 = v0 + v59;
          v41 = v60;
          break;
        }
      }
      int v61 = 2;
      v6 = v41;
    }
    default:
      {
      int v62 = 0;
      int v63 = 0;
      int v64;
      int v65;
      v64 = v62;
      v65 = v63;
      while (true) {
        int v66 = 4;
        int v67 = v3 % v66;
        int v68 = 1;
        int v69 = v67 + v68;
        bool v70 = v65 < v69;
        v64 = v64;
        v65 = v65;
        if (!v70) break;
        int v71 = 0;
        bool v72 = v2 != v71;
        int v73;
        if (v72) {
          int v74 = 4;
          v73 = v74;
        } else {
          int v75 = 4;
          int v76 = v0 + v75;
          v73 = v76;
        }
        int v77 = 0;
        int v78 = v0 + v77;
        int v79 = 1;
        int v80 = v65 + v79;
        v64 = v73;
        v65 = v80;
      }
      int v81 = 3;
      v6 = v64;
      break;
    }
  }
  bool v82 = true;
  int v83 = simt_wave_count_bits(v82);
  int v84 = 0;
  int v85 = v84 + v0;
  v1[v85] = v83;
  return;
}

kernel void kernel_main(device int* v86 [[buffer(0)]], device int* v87 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v88 = static_cast<int>(__simt_tid3.x);
  int v89 = 0;
  int v90 = v89 + v88;
  int v91 = v87[v90];
  int v92 = 4;
  int v93 = v92 + v88;
  int v94 = v87[v93];
  helper0(v88, v86, v91, v94, static_cast<int>(__simt_tid3.x));
  int v95 = 0;
  int v96 = 0;
  int v97;
  int v98;
  v97 = v95;
  v98 = v96;
  while (true) {
    int v99 = 4;
    int v100 = v98 * v99;
    int v101 = v100 + v88;
    int v102 = 8;
    int v103 = v102 + v101;
    int v104 = v87[v103];
    int v105 = 0;
    bool v106 = v104 != v105;
    v97 = v97;
    v98 = v98;
    if (!v106) break;
    int v107 = 0;
    int v108 = 0;
    int v109;
    int v110;
    v109 = v107;
    v110 = v108;
    while (true) {
      int v111 = 4;
      int v112 = v110 * v111;
      int v113 = v112 + v88;
      int v114 = 28;
      int v115 = v114 + v113;
      int v116 = v87[v115];
      int v117 = 0;
      bool v118 = v116 != v117;
      v109 = v109;
      v110 = v110;
      if (!v118) break;
      int v119 = v109 + v110;
      int v120 = 1;
      int v121 = v110 + v120;
      v109 = v119;
      v110 = v121;
    }
    bool v122 = true;
    int v123 = v97 + v109;
    int v124 = 1;
    int v125 = v98 + v124;
    v97 = v123;
    v98 = v125;
  }
  bool v126 = true;
  int v127 = 16;
  int v128 = v127 + v88;
  bool v129 = true;
  int v130 = simt_wave_count_bits(v129);
  v86[v128] = v130;
  int v131 = 48;
  int v132 = v131 + v88;
  int v133 = v87[v132];
  int v134;
  v134 = v88;
  switch (v133) {
    case 0:
      {
      int v135 = 52;
      int v136 = v135 + v88;
      int v137 = v87[v136];
      int v138 = 4;
      int v139;
      v139 = v138;
      switch (v137) {
        case 0:
          {
          int v140 = 56;
          int v141 = v140 + v88;
          int v142 = v87[v141];
          int v143;
          v143 = v88;
          switch (v142) {
            case 0:
              {
              v143 = v88;
            }
            case 1:
              {
              int v144 = 4;
              v143 = v144;
              break;
            }
            default:
              {
              v143 = v88;
              break;
            }
          }
          bool v145 = true;
          v139 = v143;
        }
        case 1:
          {
          int v146 = 4;
          int v147 = v88 + v146;
          v139 = v147;
        }
        case 2:
          {
          int v148 = 60;
          int v149 = v148 + v88;
          int v150 = v87[v149];
          int v151 = 0;
          bool v152 = v150 != v151;
          int v153;
          if (v152) {
            int v154 = 4;
            v153 = v154;
          } else {
            int v155 = 1;
            v153 = v155;
          }
          v139 = v153;
          break;
        }
        default:
          {
          int v156 = 64;
          int v157 = v156 + v88;
          int v158 = v87[v157];
          int v159 = 0;
          bool v160 = v158 != v159;
          int v161;
          if (v160) {
            v161 = v88;
          } else {
            v161 = v88;
          }
          v139 = v161;
          break;
        }
      }
      bool v162 = true;
      v134 = v139;
      break;
    }
    default:
      {
      int v163 = 68;
      int v164 = v163 + v88;
      int v165 = v87[v164];
      int v166;
      v166 = v88;
      switch (v165) {
        default:
          {
          int v167 = 72;
          int v168 = v167 + v88;
          int v169 = v87[v168];
          int v170;
          v170 = v88;
          switch (v169) {
            case 0:
              {
              v170 = v88;
            }
            default:
              {
              int v171 = 3;
              v170 = v171;
              break;
            }
            case 1:
              {
              v170 = v88;
            }
            case 2:
              {
              int v172 = 2;
              int v173 = v88 + v172;
              v170 = v173;
              break;
            }
          }
          bool v174 = true;
          v166 = v170;
          break;
        }
        case 0:
          {
          int v175 = 76;
          int v176 = v175 + v88;
          int v177 = v87[v176];
          int v178 = 0;
          bool v179 = v177 != v178;
          int v180;
          if (v179) {
            int v181 = 3;
            int v182 = v88 + v181;
            v180 = v182;
          } else {
            int v183 = 3;
            int v184 = v88 + v183;
            v180 = v184;
          }
          v166 = v180;
          break;
        }
        case 1:
          {
          int v185 = 80;
          int v186 = v185 + v88;
          int v187 = v87[v186];
          int v188 = 0;
          bool v189 = v187 != v188;
          int v190;
          if (v189) {
            int v191 = 4;
            v190 = v191;
          } else {
            v190 = v88;
          }
          v166 = v190;
          break;
        }
      }
      bool v192 = true;
      v134 = v166;
      break;
    }
    case 1:
      {
      int v193 = 84;
      int v194 = v193 + v88;
      int v195 = v87[v194];
      int v196;
      v196 = v88;
      switch (v195) {
        default:
          {
          v196 = v88;
          break;
        }
        case 0:
          {
          int v197 = 88;
          int v198 = v197 + v88;
          int v199 = v87[v198];
          int v200 = 0;
          bool v201 = v199 != v200;
          int v202;
          if (v201) {
            int v203 = 3;
            int v204 = v88 + v203;
            v202 = v204;
          } else {
            int v205 = 4;
            v202 = v205;
          }
          v196 = v202;
          break;
        }
      }
      bool v206 = true;
      v134 = v196;
      break;
    }
    case 2:
      {
      int v207 = 92;
      int v208 = v207 + v88;
      int v209 = v87[v208];
      int v210 = 1;
      int v211 = v88 + v210;
      int v212;
      v212 = v211;
      switch (v209) {
        default:
          {
          int v213 = 96;
          int v214 = v213 + v88;
          int v215 = v87[v214];
          int v216;
          v216 = v88;
          switch (v215) {
            case 0:
              {
              int v217 = 3;
              v216 = v217;
              break;
            }
            default:
              {
              int v218 = 2;
              v216 = v218;
              break;
            }
            case 1:
              {
              int v219 = 3;
              v216 = v219;
            }
            case 2:
              {
              int v220 = 1;
              v216 = v220;
              break;
            }
          }
          bool v221 = true;
          v212 = v216;
          break;
        }
        case 0:
          {
          int v222 = 100;
          int v223 = v222 + v88;
          int v224 = v87[v223];
          int v225 = 0;
          bool v226 = v224 != v225;
          int v227;
          if (v226) {
            int v228 = 0;
            int v229 = v88 + v228;
            v227 = v229;
          } else {
            int v230 = 1;
            v227 = v230;
          }
          v212 = v227;
          break;
        }
        case 1:
          {
          int v231 = 0;
          int v232 = 0;
          int v233;
          int v234;
          v233 = v231;
          v234 = v232;
          while (true) {
            int v235 = 4;
            int v236 = v234 * v235;
            int v237 = v236 + v88;
            int v238 = 104;
            int v239 = v238 + v237;
            int v240 = v87[v239];
            int v241 = 0;
            bool v242 = v240 != v241;
            v233 = v233;
            v234 = v234;
            if (!v242) break;
            int v243 = v233 + v234;
            int v244 = 1;
            int v245 = v234 + v244;
            v233 = v243;
            v234 = v245;
            break;
            ;
          }
          bool v246 = true;
          v212 = v233;
          break;
        }
      }
      bool v247 = true;
      v134 = v212;
      break;
    }
  }
  bool v248 = true;
  int v249 = 32;
  int v250 = v249 + v88;
  bool v251 = true;
  int v252 = simt_wave_count_bits(v251);
  v86[v250] = v252;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 124; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
