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
  int v6 = 0;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 3;
      int v10 = v3 % v9;
      int v11 = 2;
      int v12 = v0 + v11;
      int v13;
      v13 = v12;
      switch (v10) {
        default:
          {
          int v14 = 4;
          int v15 = v3 % v14;
          int v16 = 3;
          int v17;
          v17 = v16;
          switch (v15) {
            case 0:
              {
              int v18 = 1;
              v17 = v18;
            }
            case 1:
              {
              int v19 = 4;
              v17 = v19;
              break;
            }
            case 2:
              {
              int v20 = 3;
              int v21 = v0 + v20;
              v17 = v21;
            }
            default:
              {
              int v22 = 1;
              v17 = v22;
              break;
            }
          }
          v13 = v17;
          break;
        }
        case 0:
          {
          int v23 = 0;
          bool v24 = v2 != v23;
          int v25;
          if (v24) {
            v25 = v0;
          } else {
            int v26 = 1;
            int v27 = v0 + v26;
            v25 = v27;
          }
          int v28 = 4;
          int v29 = v0 + v28;
          v13 = v25;
          break;
        }
        case 1:
          {
          v13 = v0;
          break;
        }
      }
      int v30 = 3;
      int v31 = v0 + v30;
      v8 = v13;
    }
    case 1:
      {
      int v32 = 0;
      bool v33 = v2 != v32;
      int v34;
      if (v33) {
        int v35 = 0;
        bool v36 = v2 != v35;
        int v37;
        if (v36) {
          v37 = v0;
        } else {
          v37 = v0;
        }
        int v38 = 3;
        int v39 = v0 + v38;
        v34 = v37;
      } else {
        int v40 = 4;
        int v41 = v3 % v40;
        int v42 = 2;
        int v43;
        v43 = v42;
        switch (v41) {
          case 0:
            {
            int v44 = 4;
            v43 = v44;
            break;
          }
          case 1:
            {
            int v45 = 1;
            v43 = v45;
            break;
          }
          default:
            {
            v43 = v0;
            break;
          }
          case 2:
            {
            int v46 = 3;
            v43 = v46;
            break;
          }
        }
        int v47 = 0;
        int v48 = v0 + v47;
        v34 = v43;
      }
      int v49 = 3;
      v8 = v34;
      break;
    }
    case 2:
      {
      int v50 = 1;
      v8 = v50;
      break;
    }
    default:
      {
      int v51 = 0;
      bool v52 = v2 != v51;
      int v53;
      if (v52) {
        int v54 = 0;
        int v55 = 0;
        int v56;
        int v57;
        v56 = v54;
        v57 = v55;
        while (true) {
          int v58 = 4;
          int v59 = v3 % v58;
          int v60 = 1;
          int v61 = v59 + v60;
          bool v62 = v57 < v61;
          v56 = v56;
          v57 = v57;
          if (!v62) break;
          int v63 = 2;
          int v64 = v0 + v63;
          int v65 = 1;
          int v66 = v57 + v65;
          v56 = v64;
          v57 = v66;
        }
        int v67 = 1;
        v53 = v56;
      } else {
        int v68 = 0;
        bool v69 = v2 != v68;
        int v70;
        if (v69) {
          int v71 = 4;
          v70 = v71;
        } else {
          v70 = v0;
        }
        int v72 = 0;
        int v73 = v0 + v72;
        v53 = v70;
      }
      v8 = v53;
      break;
    }
  }
  bool v74 = true;
  int v75 = simt_wave_count_bits(v74);
  int v76 = 0;
  int v77 = v76 + v0;
  v1[v77] = v75;
  return;
}

kernel void kernel_main(device int* v78 [[buffer(0)]], device int* v79 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v80 = static_cast<int>(__simt_tid3.x);
  int v81 = 0;
  int v82 = v81 + v80;
  int v83 = v79[v82];
  int v84 = 4;
  int v85 = v84 + v80;
  int v86 = v79[v85];
  helper0(v80, v78, v83, v86, static_cast<int>(__simt_tid3.x));
  int v87 = 0;
  int v88 = 0;
  int v89;
  int v90;
  v89 = v87;
  v90 = v88;
  while (true) {
    int v91 = 4;
    int v92 = v90 * v91;
    int v93 = v92 + v80;
    int v94 = 8;
    int v95 = v94 + v93;
    int v96 = v79[v95];
    int v97 = 0;
    bool v98 = v96 != v97;
    v89 = v89;
    v90 = v90;
    if (!v98) break;
    uint v99 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v100 = (int)(v99);
    int v101 = v89 + v100;
    int v102 = 1;
    int v103 = v90 + v102;
    v89 = v101;
    v90 = v103;
    continue;
    ;
  }
  bool v104 = true;
  int v105 = 16;
  int v106 = v105 + v80;
  bool v107 = true;
  int v108 = simt_wave_count_bits(v107);
  v78[v106] = v108;
  int v109 = 28;
  int v110 = v109 + v80;
  int v111 = v79[v110];
  int v112 = 4;
  int v113 = v80 + v112;
  int v114;
  v114 = v113;
  switch (v111) {
    default:
      {
      v114 = v80;
      break;
    }
    case 0:
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
        int v121 = v120 + v80;
        int v122 = 32;
        int v123 = v122 + v121;
        int v124 = v79[v123];
        int v125 = 0;
        bool v126 = v124 != v125;
        v117 = v117;
        v118 = v118;
        if (!v126) break;
        int v127 = v117 + v118;
        int v128 = 1;
        int v129 = v118 + v128;
        v117 = v127;
        v118 = v129;
        break;
        ;
      }
      bool v130 = true;
      v114 = v117;
      break;
    }
    case 1:
      {
      int v131 = 52;
      int v132 = v131 + v80;
      int v133 = v79[v132];
      int v134 = 0;
      bool v135 = v133 != v134;
      int v136;
      if (v135) {
        int v137 = 2;
        int v138 = v80 + v137;
        v136 = v138;
      } else {
        int v139 = 56;
        int v140 = v139 + v80;
        int v141 = v79[v140];
        int v142;
        v142 = v80;
        switch (v141) {
          case 0:
            {
            int v143 = 1;
            v142 = v143;
            break;
          }
          default:
            {
            int v144 = 2;
            v142 = v144;
            break;
          }
          case 1:
            {
            int v145 = 4;
            int v146 = v80 + v145;
            v142 = v146;
            break;
          }
          case 2:
            {
            v142 = v80;
            break;
          }
        }
        bool v147 = true;
        v136 = v142;
      }
      v114 = v136;
      break;
    }
  }
  bool v148 = true;
  int v149 = 32;
  int v150 = v149 + v80;
  bool v151 = true;
  int v152 = simt_wave_count_bits(v151);
  v78[v150] = v152;
  int v153 = 60;
  int v154 = v153 + v80;
  int v155 = v79[v154];
  int v156;
  v156 = v80;
  switch (v155) {
    case 0:
      {
      int v157 = 64;
      int v158 = v157 + v80;
      int v159 = v79[v158];
      int v160 = 2;
      int v161 = v80 + v160;
      int v162;
      v162 = v161;
      switch (v159) {
        case 0:
          {
          int v163 = 68;
          int v164 = v163 + v80;
          int v165 = v79[v164];
          int v166 = 1;
          int v167 = v80 + v166;
          int v168;
          v168 = v167;
          switch (v165) {
            case 0:
              {
              int v169 = 3;
              v168 = v169;
              break;
            }
            default:
              {
              int v170 = 4;
              int v171 = v80 + v170;
              v168 = v171;
              break;
            }
            case 1:
              {
              int v172 = 0;
              int v173 = v80 + v172;
              v168 = v173;
              break;
            }
            case 2:
              {
              int v174 = 2;
              v168 = v174;
              break;
            }
          }
          bool v175 = true;
          v162 = v168;
          break;
        }
        default:
          {
          int v176 = 72;
          int v177 = v176 + v80;
          int v178 = v79[v177];
          int v179 = 1;
          int v180 = v80 + v179;
          int v181;
          v181 = v180;
          switch (v178) {
            default:
              {
              v181 = v80;
              break;
            }
            case 0:
              {
              v181 = v80;
            }
            case 1:
              {
              v181 = v80;
              break;
            }
            case 2:
              {
              v181 = v80;
              break;
            }
          }
          bool v182 = true;
          v162 = v181;
          break;
        }
        case 1:
          {
          int v183 = 76;
          int v184 = v183 + v80;
          int v185 = v79[v184];
          int v186 = 3;
          int v187;
          v187 = v186;
          switch (v185) {
            default:
              {
              int v188 = 0;
              int v189 = v80 + v188;
              v187 = v189;
              break;
            }
            case 0:
              {
              int v190 = 0;
              int v191 = v80 + v190;
              v187 = v191;
              break;
            }
          }
          bool v192 = true;
          v162 = v187;
          break;
        }
        case 2:
          {
          int v193 = 80;
          int v194 = v193 + v80;
          int v195 = v79[v194];
          int v196;
          v196 = v80;
          switch (v195) {
            case 0:
              {
              v196 = v80;
              break;
            }
            default:
              {
              int v197 = 4;
              v196 = v197;
              break;
            }
          }
          bool v198 = true;
          v162 = v196;
          break;
        }
      }
      bool v199 = true;
      v156 = v162;
      break;
    }
    default:
      {
      int v200 = 84;
      int v201 = v200 + v80;
      int v202 = v79[v201];
      int v203 = 0;
      int v204 = v80 + v203;
      int v205;
      v205 = v204;
      switch (v202) {
        case 0:
          {
          int v206 = 88;
          int v207 = v206 + v80;
          int v208 = v79[v207];
          int v209 = 0;
          bool v210 = v208 != v209;
          int v211;
          if (v210) {
            int v212 = 2;
            int v213 = v80 + v212;
            v211 = v213;
          } else {
            int v214 = 3;
            v211 = v214;
          }
          v205 = v211;
          break;
        }
        case 1:
          {
          int v215 = 92;
          int v216 = v215 + v80;
          int v217 = v79[v216];
          int v218 = 2;
          int v219 = v80 + v218;
          int v220;
          v220 = v219;
          switch (v217) {
            case 0:
              {
              v220 = v80;
              break;
            }
            case 1:
              {
              v220 = v80;
              break;
            }
            default:
              {
              int v221 = 4;
              int v222 = v80 + v221;
              v220 = v222;
              break;
            }
          }
          bool v223 = true;
          v205 = v220;
          break;
        }
        default:
          {
          int v224 = 0;
          int v225 = 0;
          int v226;
          int v227;
          v226 = v224;
          v227 = v225;
          while (true) {
            int v228 = 4;
            int v229 = v227 * v228;
            int v230 = v229 + v80;
            int v231 = 96;
            int v232 = v231 + v230;
            int v233 = v79[v232];
            int v234 = 0;
            bool v235 = v233 != v234;
            v226 = v226;
            v227 = v227;
            if (!v235) break;
            int v236 = v226 + v227;
            int v237 = 1;
            int v238 = v227 + v237;
            v226 = v236;
            v227 = v238;
          }
          bool v239 = true;
          v205 = v226;
          break;
        }
      }
      bool v240 = true;
      v156 = v205;
      break;
    }
  }
  bool v241 = true;
  int v242 = 48;
  int v243 = v242 + v80;
  bool v244 = true;
  int v245 = simt_wave_count_bits(v244);
  v78[v243] = v245;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 116; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
