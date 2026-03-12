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
    int v7 = 0;
    int v8 = 0;
    int v9;
    int v10;
    v9 = v7;
    v10 = v8;
    while (true) {
      int v11 = 4;
      int v12 = v3 % v11;
      int v13 = 1;
      int v14 = v12 + v13;
      bool v15 = v10 < v14;
      v9 = v9;
      v10 = v10;
      if (!v15) break;
      int v16 = 1;
      int v17 = v10 + v16;
      v9 = v0;
      v10 = v17;
      continue;
      ;
    }
    int v18 = 0;
    v6 = v9;
  } else {
    int v19 = 0;
    int v20 = v0 + v19;
    v6 = v20;
  }
  bool v21 = true;
  int v22 = simt_wave_count_bits(v21);
  int v23 = 0;
  int v24 = v23 + v0;
  v1[v24] = v22;
  uint v25 = simt_subgroup_id(__simt_tid);
  int v26 = (int)(v25);
  int v27;
  v27 = v26;
  switch (v3) {
    default:
      {
      int v28 = 3;
      int v29 = v3 % v28;
      int v30 = 0;
      int v31 = v0 + v30;
      int v32;
      v32 = v31;
      switch (v29) {
        case 0:
          {
          int v33 = 0;
          int v34 = 0;
          int v35;
          int v36;
          v35 = v33;
          v36 = v34;
          while (true) {
            int v37 = 4;
            int v38 = v3 % v37;
            int v39 = 1;
            int v40 = v38 + v39;
            bool v41 = v36 < v40;
            v35 = v35;
            v36 = v36;
            if (!v41) break;
            int v42 = 3;
            int v43 = 1;
            int v44 = v36 + v43;
            v35 = v42;
            v36 = v44;
          }
          int v45 = 3;
          int v46 = v0 + v45;
          v32 = v35;
        }
        case 1:
          {
          int v47 = 0;
          int v48 = 0;
          int v49;
          int v50;
          v49 = v47;
          v50 = v48;
          while (true) {
            int v51 = 4;
            int v52 = v3 % v51;
            int v53 = 1;
            int v54 = v52 + v53;
            bool v55 = v50 < v54;
            v49 = v49;
            v50 = v50;
            if (!v55) break;
            int v56 = 3;
            int v57 = 1;
            int v58 = v50 + v57;
            v49 = v56;
            v50 = v58;
          }
          int v59 = 4;
          int v60 = v0 + v59;
          v32 = v49;
          break;
        }
        default:
          {
          int v61 = 3;
          int v62 = v3 % v61;
          int v63 = 0;
          int v64 = v0 + v63;
          int v65;
          v65 = v64;
          switch (v62) {
            case 0:
              {
              int v66 = 3;
              v65 = v66;
              break;
            }
            default:
              {
              int v67 = 4;
              int v68 = v0 + v67;
              v65 = v68;
              break;
            }
            case 1:
              {
              int v69 = 0;
              int v70 = v0 + v69;
              v65 = v70;
              break;
            }
          }
          int v71 = 4;
          v32 = v65;
          break;
        }
        case 2:
          {
          int v72 = 0;
          bool v73 = v2 != v72;
          int v74;
          if (v73) {
            v74 = v0;
          } else {
            v74 = v0;
          }
          v32 = v74;
          break;
        }
      }
      v27 = v32;
    }
    case 0:
      {
      int v75 = 0;
      int v76 = 0;
      int v77;
      int v78;
      v77 = v75;
      v78 = v76;
      while (true) {
        int v79 = 4;
        int v80 = v3 % v79;
        int v81 = 1;
        int v82 = v80 + v81;
        bool v83 = v78 < v82;
        v77 = v77;
        v78 = v78;
        if (!v83) break;
        int v84 = 0;
        bool v85 = v2 != v84;
        int v86;
        if (v85) {
          v86 = v0;
        } else {
          v86 = v0;
        }
        int v87 = 2;
        int v88 = 1;
        int v89 = v78 + v88;
        v77 = v86;
        v78 = v89;
      }
      int v90 = 2;
      v27 = v77;
      break;
    }
  }
  bool v91 = true;
  int v92 = simt_wave_count_bits(v91);
  int v93 = 16;
  int v94 = v93 + v0;
  v1[v94] = v92;
  int v95 = 0;
  bool v96 = v2 != v95;
  int v97 = v96 ? v6 : v27;
  return;
}

kernel void kernel_main(device int* v98 [[buffer(0)]], device int* v99 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v100 = static_cast<int>(__simt_tid3.x);
  int v101 = 0;
  int v102 = v101 + v100;
  int v103 = v99[v102];
  int v104 = 4;
  int v105 = v104 + v100;
  int v106 = v99[v105];
  helper0(v100, v98, v103, v106, static_cast<int>(__simt_tid3.x));
  int v107 = 0;
  int v108 = 8;
  int v109 = v108 + v100;
  int v110 = v99[v109];
  int v111 = 2;
  int v112;
  v112 = v111;
  switch (v110) {
    case 0:
      {
      int v113 = 12;
      int v114 = v113 + v100;
      int v115 = v99[v114];
      int v116 = 0;
      bool v117 = v115 != v116;
      int v118;
      if (v117) {
        int v119 = 16;
        int v120 = v119 + v100;
        int v121 = v99[v120];
        int v122;
        v122 = v100;
        switch (v121) {
          case 0:
            {
            int v123 = 4;
            int v124 = v100 + v123;
            v122 = v124;
            break;
          }
          default:
            {
            int v125 = 0;
            int v126 = v100 + v125;
            v122 = v126;
            break;
          }
          case 1:
            {
            int v127 = 1;
            int v128 = v100 + v127;
            v122 = v128;
            break;
          }
        }
        bool v129 = true;
        v118 = v122;
      } else {
        int v130 = 20;
        int v131 = v130 + v100;
        int v132 = v99[v131];
        int v133 = 0;
        bool v134 = v132 != v133;
        int v135;
        if (v134) {
          int v136 = 0;
          v135 = v136;
        } else {
          v135 = v100;
        }
        v118 = v135;
      }
      v112 = v118;
      break;
    }
    case 1:
      {
      int v137 = 24;
      int v138 = v137 + v100;
      int v139 = v99[v138];
      int v140 = 4;
      int v141 = v100 + v140;
      int v142;
      v142 = v141;
      switch (v139) {
        case 0:
          {
          int v143 = 28;
          int v144 = v143 + v100;
          int v145 = v99[v144];
          int v146 = 0;
          bool v147 = v145 != v146;
          int v148;
          if (v147) {
            v148 = v100;
          } else {
            v148 = v100;
          }
          v142 = v148;
          break;
        }
        case 1:
          {
          int v149 = 0;
          int v150 = 0;
          int v151;
          int v152;
          v151 = v149;
          v152 = v150;
          while (true) {
            int v153 = 4;
            int v154 = v152 * v153;
            int v155 = v154 + v100;
            int v156 = 32;
            int v157 = v156 + v155;
            int v158 = v99[v157];
            int v159 = 0;
            bool v160 = v158 != v159;
            v151 = v151;
            v152 = v152;
            if (!v160) break;
            int v161 = v151 + v152;
            int v162 = 1;
            int v163 = v152 + v162;
            v151 = v161;
            v152 = v163;
          }
          bool v164 = true;
          v142 = v151;
          break;
        }
        case 2:
          {
          int v165 = 52;
          int v166 = v165 + v100;
          int v167 = v99[v166];
          int v168 = 0;
          bool v169 = v167 != v168;
          int v170;
          if (v169) {
            v170 = v100;
          } else {
            int v171 = 3;
            int v172 = v100 + v171;
            v170 = v172;
          }
          v142 = v170;
          break;
        }
        default:
          {
          int v173 = 56;
          int v174 = v173 + v100;
          int v175 = v99[v174];
          int v176 = 2;
          int v177 = v100 + v176;
          int v178;
          v178 = v177;
          switch (v175) {
            case 0:
              {
              int v179 = 2;
              v178 = v179;
              break;
            }
            case 1:
              {
              int v180 = 3;
              int v181 = v100 + v180;
              v178 = v181;
              break;
            }
            default:
              {
              v178 = v100;
              break;
            }
          }
          bool v182 = true;
          v142 = v178;
          break;
        }
      }
      bool v183 = true;
      v112 = v142;
      break;
    }
    case 2:
      {
      int v184 = 1;
      int v185 = v100 + v184;
      v112 = v185;
      break;
    }
    default:
      {
      int v186 = 60;
      int v187 = v186 + v100;
      int v188 = v99[v187];
      int v189;
      v189 = v100;
      switch (v188) {
        case 0:
          {
          v189 = v100;
          break;
        }
        default:
          {
          int v190 = 64;
          int v191 = v190 + v100;
          int v192 = v99[v191];
          int v193 = 0;
          bool v194 = v192 != v193;
          int v195;
          if (v194) {
            int v196 = 0;
            int v197 = v100 + v196;
            v195 = v197;
          } else {
            int v198 = 0;
            int v199 = v100 + v198;
            v195 = v199;
          }
          v189 = v195;
          break;
        }
        case 1:
          {
          int v200 = 68;
          int v201 = v200 + v100;
          int v202 = v99[v201];
          int v203 = 0;
          bool v204 = v202 != v203;
          int v205;
          if (v204) {
            v205 = v100;
          } else {
            int v206 = 4;
            int v207 = v100 + v206;
            v205 = v207;
          }
          v189 = v205;
          break;
        }
      }
      bool v208 = true;
      v112 = v189;
      break;
    }
  }
  bool v209 = true;
  int v210 = 32;
  int v211 = v210 + v100;
  bool v212 = true;
  int v213 = simt_wave_count_bits(v212);
  v98[v211] = v213;
  int v214 = 72;
  int v215 = v214 + v100;
  int v216 = v99[v215];
  uint v217 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v218 = (int)(v217);
  int v219;
  v219 = v218;
  switch (v216) {
    case 0:
      {
      int v220 = 1;
      v219 = v220;
      break;
    }
    default:
      {
      int v221 = 76;
      int v222 = v221 + v100;
      int v223 = v99[v222];
      int v224;
      v224 = v100;
      switch (v223) {
        case 0:
          {
          v224 = v100;
        }
        default:
          {
          int v225 = 80;
          int v226 = v225 + v100;
          int v227 = v99[v226];
          int v228 = 0;
          bool v229 = v227 != v228;
          int v230;
          if (v229) {
            v230 = v100;
          } else {
            int v231 = 0;
            int v232 = v100 + v231;
            v230 = v232;
          }
          v224 = v230;
          break;
        }
      }
      bool v233 = true;
      v219 = v224;
      break;
    }
  }
  bool v234 = true;
  int v235 = 48;
  int v236 = v235 + v100;
  bool v237 = true;
  int v238 = simt_wave_count_bits(v237);
  v98[v236] = v238;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 84; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
