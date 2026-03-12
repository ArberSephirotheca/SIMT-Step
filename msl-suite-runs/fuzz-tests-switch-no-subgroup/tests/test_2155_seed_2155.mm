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
    bool v18 = v2 != v17;
    int v19;
    if (v18) {
      int v20 = 3;
      int v21 = v3 % v20;
      int v22 = 4;
      int v23 = v0 + v22;
      int v24;
      v24 = v23;
      switch (v21) {
        case 0:
          {
          int v25 = 1;
          v24 = v25;
          break;
        }
        case 1:
          {
          int v26 = 2;
          v24 = v26;
          break;
        }
        default:
          {
          v24 = v0;
          break;
        }
        case 2:
          {
          v24 = v0;
          break;
        }
      }
      bool v27 = true;
      int v28 = simt_wave_count_bits(v27);
      int v29 = 16;
      int v30 = 4;
      int v31 = v11 * v30;
      int v32 = v29 + v31;
      int v33 = v32 + v0;
      v1[v33] = v28;
      v19 = v24;
    } else {
      int v34 = 3;
      int v35 = v3 % v34;
      uint v36 = simt_lane_id(__simt_tid);
      int v37 = (int)(v36);
      int v38;
      v38 = v37;
      switch (v35) {
        case 0:
          {
          int v39 = 4;
          int v40 = v0 + v39;
          v38 = v40;
          break;
        }
        case 1:
          {
          int v41 = 0;
          v38 = v41;
          break;
        }
        default:
          {
          int v42 = 3;
          v38 = v42;
          break;
        }
        case 2:
          {
          int v43 = 1;
          v38 = v43;
          break;
        }
      }
      v19 = v38;
    }
    int v44 = 1;
    int v45 = v11 + v44;
    v10 = v19;
    v11 = v45;
    break;
    ;
  }
  int v46 = 0;
  bool v47 = v2 != v46;
  int v48 = v47 ? v5 : v10;
  return;
}

kernel void kernel_main(device int* v49 [[buffer(0)]], device int* v50 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v51 = static_cast<int>(__simt_tid3.x);
  int v52 = 0;
  int v53 = v52 + v51;
  int v54 = v50[v53];
  int v55 = 4;
  int v56 = v55 + v51;
  int v57 = v50[v56];
  helper0(v51, v49, v54, v57, static_cast<int>(__simt_tid3.x));
  int v58 = 8;
  int v59 = v58 + v51;
  int v60 = v50[v59];
  int v61 = 0;
  bool v62 = v60 != v61;
  int v63;
  if (v62) {
    v63 = v51;
  } else {
    int v64 = 12;
    int v65 = v64 + v51;
    int v66 = v50[v65];
    int v67 = 0;
    bool v68 = v66 != v67;
    int v69;
    if (v68) {
      int v70 = 0;
      int v71 = 0;
      int v72;
      int v73;
      v72 = v70;
      v73 = v71;
      while (true) {
        int v74 = 4;
        int v75 = v73 * v74;
        int v76 = v75 + v51;
        int v77 = 16;
        int v78 = v77 + v76;
        int v79 = v50[v78];
        int v80 = 0;
        bool v81 = v79 != v80;
        v72 = v72;
        v73 = v73;
        if (!v81) break;
        int v82 = v72 + v73;
        int v83 = 1;
        int v84 = v73 + v83;
        bool v85 = true;
        int v86 = 32;
        int v87 = 4;
        int v88 = v73 * v87;
        int v89 = v86 + v88;
        int v90 = v89 + v51;
        bool v91 = true;
        int v92 = simt_wave_count_bits(v91);
        v49[v90] = v92;
        v72 = v82;
        v73 = v84;
        continue;
        ;
      }
      v69 = v72;
    } else {
      int v93 = 36;
      int v94 = v93 + v51;
      int v95 = v50[v94];
      uint v96 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v97 = (int)(v96);
      int v98;
      v98 = v97;
      switch (v95) {
        default:
          {
          v98 = v51;
          break;
        }
        case 0:
          {
          v98 = v51;
          break;
        }
        case 1:
          {
          int v99 = 3;
          v98 = v99;
          break;
        }
      }
      bool v100 = true;
      int v101 = 48;
      int v102 = v101 + v51;
      bool v103 = true;
      int v104 = simt_wave_count_bits(v103);
      v49[v102] = v104;
      v69 = v98;
    }
    int v105 = 64;
    int v106 = v105 + v51;
    bool v107 = true;
    int v108 = simt_wave_count_bits(v107);
    v49[v106] = v108;
    v63 = v69;
  }
  int v109 = 80;
  int v110 = v109 + v51;
  bool v111 = true;
  int v112 = simt_wave_count_bits(v111);
  v49[v110] = v112;
  int v113 = 0;
  int v114 = 0;
  int v115;
  int v116;
  v115 = v113;
  v116 = v114;
  while (true) {
    int v117 = 4;
    int v118 = v116 * v117;
    int v119 = v118 + v51;
    int v120 = 40;
    int v121 = v120 + v119;
    int v122 = v50[v121];
    int v123 = 0;
    bool v124 = v122 != v123;
    v115 = v115;
    v116 = v116;
    if (!v124) break;
    int v125 = v115 + v116;
    int v126 = 1;
    int v127 = v116 + v126;
    bool v128 = true;
    int v129 = 96;
    int v130 = 4;
    int v131 = v116 * v130;
    int v132 = v129 + v131;
    int v133 = v132 + v51;
    bool v134 = true;
    int v135 = simt_wave_count_bits(v134);
    v49[v133] = v135;
    v115 = v125;
    v116 = v127;
  }
  int v136 = 60;
  int v137 = v136 + v51;
  int v138 = v50[v137];
  uint v139 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v140 = (int)(v139);
  int v141;
  v141 = v140;
  switch (v138) {
    default:
      {
      int v142 = 64;
      int v143 = v142 + v51;
      int v144 = v50[v143];
      int v145 = 4;
      int v146;
      v146 = v145;
      switch (v144) {
        default:
          {
          int v147 = 68;
          int v148 = v147 + v51;
          int v149 = v50[v148];
          int v150;
          v150 = v51;
          switch (v149) {
            default:
              {
              int v151 = 2;
              int v152 = v51 + v151;
              v150 = v152;
              break;
            }
            case 0:
              {
              int v153 = 1;
              int v154 = v51 + v153;
              v150 = v154;
              break;
            }
            case 1:
              {
              v150 = v51;
              break;
            }
            case 2:
              {
              int v155 = 0;
              v150 = v155;
              break;
            }
          }
          bool v156 = true;
          v146 = v150;
        }
        case 0:
          {
          int v157 = 0;
          int v158 = 0;
          int v159;
          int v160;
          v159 = v157;
          v160 = v158;
          while (true) {
            int v161 = 4;
            int v162 = v160 * v161;
            int v163 = v162 + v51;
            int v164 = 72;
            int v165 = v164 + v163;
            int v166 = v50[v165];
            int v167 = 0;
            bool v168 = v166 != v167;
            v159 = v159;
            v160 = v160;
            if (!v168) break;
            int v169 = v159 + v160;
            int v170 = 1;
            int v171 = v160 + v170;
            bool v172 = true;
            v159 = v169;
            v160 = v171;
          }
          v146 = v159;
          break;
        }
      }
      v141 = v146;
      break;
    }
    case 0:
      {
      int v173 = 92;
      int v174 = v173 + v51;
      int v175 = v50[v174];
      int v176;
      v176 = v51;
      switch (v175) {
        default:
          {
          int v177 = 96;
          int v178 = v177 + v51;
          int v179 = v50[v178];
          int v180 = 0;
          bool v181 = v179 != v180;
          int v182;
          if (v181) {
            int v183 = 4;
            v182 = v183;
          } else {
            int v184 = 1;
            v182 = v184;
          }
          v176 = v182;
          break;
        }
        case 0:
          {
          int v185 = 4;
          int v186 = v51 + v185;
          v176 = v186;
          break;
        }
        case 1:
          {
          int v187 = 100;
          int v188 = v187 + v51;
          int v189 = v50[v188];
          int v190 = 0;
          bool v191 = v189 != v190;
          int v192;
          if (v191) {
            int v193 = 0;
            v192 = v193;
          } else {
            v192 = v51;
          }
          v176 = v192;
          break;
        }
      }
      v141 = v176;
      break;
    }
    case 1:
      {
      int v194 = 104;
      int v195 = v194 + v51;
      int v196 = v50[v195];
      int v197 = 0;
      bool v198 = v196 != v197;
      int v199;
      if (v198) {
        int v200 = 108;
        int v201 = v200 + v51;
        int v202 = v50[v201];
        int v203 = 0;
        bool v204 = v202 != v203;
        int v205;
        if (v204) {
          v205 = v51;
        } else {
          int v206 = 0;
          int v207 = v51 + v206;
          v205 = v207;
        }
        v199 = v205;
      } else {
        v199 = v51;
      }
      v141 = v199;
      break;
    }
    case 2:
      {
      int v208 = 112;
      int v209 = v208 + v51;
      int v210 = v50[v209];
      int v211 = 1;
      int v212 = v51 + v211;
      int v213;
      v213 = v212;
      switch (v210) {
        default:
          {
          int v214 = 0;
          int v215 = 0;
          int v216;
          int v217;
          v216 = v214;
          v217 = v215;
          while (true) {
            int v218 = 4;
            int v219 = v217 * v218;
            int v220 = v219 + v51;
            int v221 = 116;
            int v222 = v221 + v220;
            int v223 = v50[v222];
            int v224 = 0;
            bool v225 = v223 != v224;
            v216 = v216;
            v217 = v217;
            if (!v225) break;
            int v226 = v216 + v217;
            int v227 = 1;
            int v228 = v217 + v227;
            bool v229 = true;
            v216 = v226;
            v217 = v228;
          }
          v213 = v216;
        }
        case 0:
          {
          int v230 = 1;
          int v231 = v51 + v230;
          v213 = v231;
        }
        case 1:
          {
          int v232 = 0;
          v213 = v232;
        }
        case 2:
          {
          v213 = v51;
          break;
        }
      }
      v141 = v213;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 107; ++idx) {
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
