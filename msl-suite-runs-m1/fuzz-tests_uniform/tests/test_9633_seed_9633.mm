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
  bool v6 = v2 != v5;
  int v7;
  if (v6) {
    int v8 = 0;
    bool v9 = v2 != v8;
    int v10;
    if (v9) {
      int v11 = 4;
      int v12 = v3 % v11;
      uint v13 = simt_lane_id(__simt_tid);
      int v14 = (int)(v13);
      int v15;
      v15 = v14;
      switch (v12) {
        case 0:
          {
          int v16 = 4;
          v15 = v16;
          break;
        }
        case 1:
          {
          int v17 = 2;
          v15 = v17;
          break;
        }
        case 2:
          {
          int v18 = 2;
          int v19 = v0 + v18;
          v15 = v19;
          break;
        }
        default:
          {
          int v20 = 2;
          int v21 = v0 + v20;
          v15 = v21;
          break;
        }
      }
      uint v22 = simt_subgroup_id(__simt_tid);
      int v23 = (int)(v22);
      v10 = v15;
    } else {
      uint v24 = simt_lane_id(__simt_tid);
      int v25 = (int)(v24);
      v10 = v25;
    }
    uint v26 = simt_subgroup_id(__simt_tid);
    int v27 = (int)(v26);
    v7 = v10;
  } else {
    int v28 = 3;
    v7 = v28;
  }
  bool v29 = true;
  int v30 = simt_wave_count_bits(v29);
  int v31 = 0;
  int v32 = v31 + v0;
  v1[v32] = v30;
  int v33 = 0;
  bool v34 = v2 != v33;
  int v35 = v34 ? v4 : v7;
  return;
}

kernel void kernel_main(device int* v36 [[buffer(0)]], device int* v37 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v38 = static_cast<int>(__simt_tid3.x);
  int v39 = 0;
  int v40 = v39 + v38;
  int v41 = v37[v40];
  int v42 = 4;
  int v43 = v42 + v38;
  int v44 = v37[v43];
  helper0(v38, v36, v41, v44, static_cast<int>(__simt_tid3.x));
  int v45 = 8;
  int v46 = v45 + v38;
  int v47 = v37[v46];
  int v48 = 0;
  bool v49 = v47 != v48;
  int v50;
  if (v49) {
    int v51 = 12;
    int v52 = v51 + v38;
    int v53 = v37[v52];
    int v54 = 0;
    bool v55 = v53 != v54;
    int v56;
    if (v55) {
      int v57 = 16;
      int v58 = v57 + v38;
      int v59 = v37[v58];
      int v60 = 1;
      int v61;
      v61 = v60;
      switch (v59) {
        case 0:
          {
          int v62 = 2;
          int v63 = v38 + v62;
          v61 = v63;
          break;
        }
        default:
          {
          int v64 = 4;
          int v65 = v38 + v64;
          v61 = v65;
          break;
        }
        case 1:
          {
          int v66 = 0;
          v61 = v66;
          break;
        }
      }
      bool v67 = true;
      v56 = v61;
    } else {
      int v68 = 20;
      int v69 = v68 + v38;
      int v70 = v37[v69];
      int v71 = 0;
      bool v72 = v70 != v71;
      int v73;
      if (v72) {
        uint v74 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v75 = (int)(v74);
        v73 = v75;
      } else {
        int v76 = 3;
        v73 = v76;
      }
      v56 = v73;
    }
    v50 = v56;
  } else {
    int v77 = 0;
    int v78 = 0;
    int v79;
    int v80;
    v79 = v77;
    v80 = v78;
    while (true) {
      int v81 = 4;
      int v82 = v80 * v81;
      int v83 = v82 + v38;
      int v84 = 24;
      int v85 = v84 + v83;
      int v86 = v37[v85];
      int v87 = 0;
      bool v88 = v86 != v87;
      v79 = v79;
      v80 = v80;
      if (!v88) break;
      int v89 = v79 + v80;
      int v90 = 1;
      int v91 = v80 + v90;
      v79 = v89;
      v80 = v91;
    }
    bool v92 = true;
    v50 = v79;
  }
  int v93 = 16;
  int v94 = v93 + v38;
  bool v95 = true;
  int v96 = simt_wave_count_bits(v95);
  v36[v94] = v96;
  int v97 = 44;
  int v98 = v97 + v38;
  int v99 = v37[v98];
  int v100;
  v100 = v38;
  switch (v99) {
    case 0:
      {
      int v101 = 48;
      int v102 = v101 + v38;
      int v103 = v37[v102];
      int v104;
      v104 = v38;
      switch (v103) {
        case 0:
          {
          int v105 = 52;
          int v106 = v105 + v38;
          int v107 = v37[v106];
          int v108 = 0;
          bool v109 = v107 != v108;
          int v110;
          if (v109) {
            int v111 = 4;
            v110 = v111;
          } else {
            int v112 = 2;
            int v113 = v38 + v112;
            v110 = v113;
          }
          v104 = v110;
          break;
        }
        default:
          {
          int v114 = 56;
          int v115 = v114 + v38;
          int v116 = v37[v115];
          int v117 = 0;
          bool v118 = v116 != v117;
          int v119;
          if (v118) {
            v119 = v38;
          } else {
            int v120 = 3;
            int v121 = v38 + v120;
            v119 = v121;
          }
          v104 = v119;
          break;
        }
        case 1:
          {
          int v122 = 0;
          int v123 = 0;
          int v124;
          int v125;
          v124 = v122;
          v125 = v123;
          while (true) {
            int v126 = 4;
            int v127 = v125 * v126;
            int v128 = v127 + v38;
            int v129 = 60;
            int v130 = v129 + v128;
            int v131 = v37[v130];
            int v132 = 0;
            bool v133 = v131 != v132;
            v124 = v124;
            v125 = v125;
            if (!v133) break;
            int v134 = v124 + v125;
            int v135 = 1;
            int v136 = v125 + v135;
            v124 = v134;
            v125 = v136;
            continue;
            ;
          }
          bool v137 = true;
          v104 = v124;
          break;
        }
        case 2:
          {
          int v138 = 0;
          int v139 = 0;
          int v140;
          int v141;
          v140 = v138;
          v141 = v139;
          while (true) {
            int v142 = 4;
            int v143 = v141 * v142;
            int v144 = v143 + v38;
            int v145 = 80;
            int v146 = v145 + v144;
            int v147 = v37[v146];
            int v148 = 0;
            bool v149 = v147 != v148;
            v140 = v140;
            v141 = v141;
            if (!v149) break;
            int v150 = v140 + v141;
            int v151 = 1;
            int v152 = v141 + v151;
            v140 = v150;
            v141 = v152;
          }
          bool v153 = true;
          v104 = v140;
          break;
        }
      }
      bool v154 = true;
      v100 = v104;
      break;
    }
    default:
      {
      int v155 = 100;
      int v156 = v155 + v38;
      int v157 = v37[v156];
      int v158 = 0;
      bool v159 = v157 != v158;
      int v160;
      if (v159) {
        int v161 = 0;
        int v162 = 0;
        int v163;
        int v164;
        v163 = v161;
        v164 = v162;
        while (true) {
          int v165 = 4;
          int v166 = v164 * v165;
          int v167 = v166 + v38;
          int v168 = 104;
          int v169 = v168 + v167;
          int v170 = v37[v169];
          int v171 = 0;
          bool v172 = v170 != v171;
          v163 = v163;
          v164 = v164;
          if (!v172) break;
          int v173 = v163 + v164;
          int v174 = 1;
          int v175 = v164 + v174;
          v163 = v173;
          v164 = v175;
          break;
          ;
        }
        bool v176 = true;
        v160 = v163;
      } else {
        int v177 = 4;
        v160 = v177;
      }
      v100 = v160;
      break;
    }
  }
  bool v178 = true;
  int v179 = 32;
  int v180 = v179 + v38;
  bool v181 = true;
  int v182 = simt_wave_count_bits(v181);
  v36[v180] = v182;
  int v183 = 124;
  int v184 = v183 + v38;
  int v185 = v37[v184];
  int v186 = 0;
  bool v187 = v185 != v186;
  int v188;
  if (v187) {
    int v189 = 128;
    int v190 = v189 + v38;
    int v191 = v37[v190];
    int v192 = 0;
    bool v193 = v191 != v192;
    int v194;
    if (v193) {
      int v195 = 132;
      int v196 = v195 + v38;
      int v197 = v37[v196];
      int v198 = 0;
      bool v199 = v197 != v198;
      int v200;
      if (v199) {
        v200 = v38;
      } else {
        int v201 = 0;
        v200 = v201;
      }
      v194 = v200;
    } else {
      int v202 = 136;
      int v203 = v202 + v38;
      int v204 = v37[v203];
      uint v205 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v206 = (int)(v205);
      int v207;
      v207 = v206;
      switch (v204) {
        case 0:
          {
          int v208 = 2;
          v207 = v208;
          break;
        }
        case 1:
          {
          int v209 = 2;
          v207 = v209;
        }
        case 2:
          {
          int v210 = 0;
          int v211 = v38 + v210;
          v207 = v211;
        }
        default:
          {
          int v212 = 4;
          v207 = v212;
          break;
        }
      }
      bool v213 = true;
      v194 = v207;
    }
    v188 = v194;
  } else {
    int v214 = 0;
    int v215 = 0;
    int v216;
    int v217;
    v216 = v214;
    v217 = v215;
    while (true) {
      int v218 = 4;
      int v219 = v217 * v218;
      int v220 = v219 + v38;
      int v221 = 140;
      int v222 = v221 + v220;
      int v223 = v37[v222];
      int v224 = 0;
      bool v225 = v223 != v224;
      v216 = v216;
      v217 = v217;
      if (!v225) break;
      int v226 = v216 + v217;
      int v227 = 1;
      int v228 = v217 + v227;
      v216 = v226;
      v217 = v228;
      continue;
      ;
    }
    bool v229 = true;
    v188 = v216;
  }
  int v230 = 48;
  int v231 = v230 + v38;
  bool v232 = true;
  int v233 = simt_wave_count_bits(v232);
  v36[v231] = v233;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 160; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
