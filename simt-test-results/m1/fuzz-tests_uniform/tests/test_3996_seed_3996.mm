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
  int v4 = 1;
  int v5 = 0;
  int v6 = 0;
  int v7;
  int v8;
  v7 = v5;
  v8 = v6;
  while (true) {
    int v9 = 4;
    int v10 = v3 % v9;
    int v11 = 1;
    int v12 = v10 + v11;
    bool v13 = v8 < v12;
    v7 = v7;
    v8 = v8;
    if (!v13) break;
    uint v14 = simt_subgroup_id(__simt_tid);
    int v15 = (int)(v14);
    int v16 = 1;
    int v17 = v8 + v16;
    v7 = v15;
    v8 = v17;
  }
  bool v18 = true;
  int v19 = simt_wave_count_bits(v18);
  int v20 = 0;
  int v21 = v20 + v0;
  v1[v21] = v19;
  int v22 = 0;
  bool v23 = v2 != v22;
  int v24 = v23 ? v4 : v7;
  int v25 = 3;
  int v26 = v3 % v25;
  int v27 = 1;
  int v28;
  v28 = v27;
  switch (v26) {
    case 0:
      {
      int v29 = 4;
      int v30 = v0 + v29;
      v28 = v30;
      break;
    }
    case 1:
      {
      int v31 = 2;
      int v32 = v3 % v31;
      int v33;
      v33 = v0;
      switch (v32) {
        default:
          {
          int v34 = 0;
          bool v35 = v2 != v34;
          int v36;
          if (v35) {
            int v37 = 4;
            v36 = v37;
          } else {
            v36 = v0;
          }
          int v38 = 0;
          int v39 = v0 + v38;
          v33 = v36;
          break;
        }
        case 0:
          {
          int v40 = 4;
          int v41 = v3 % v40;
          int v42 = 0;
          int v43;
          v43 = v42;
          switch (v41) {
            case 0:
              {
              int v44 = 0;
              v43 = v44;
              break;
            }
            case 1:
              {
              v43 = v0;
            }
            default:
              {
              int v45 = 1;
              v43 = v45;
            }
            case 2:
              {
              v43 = v0;
              break;
            }
          }
          int v46 = 0;
          int v47 = v0 + v46;
          v33 = v43;
          break;
        }
      }
      int v48 = 1;
      int v49 = v0 + v48;
      v28 = v33;
      break;
    }
    default:
      {
      int v50 = 2;
      int v51 = v3 % v50;
      int v52 = 2;
      int v53 = v0 + v52;
      int v54;
      v54 = v53;
      switch (v51) {
        case 0:
          {
          int v55 = 3;
          int v56 = v0 + v55;
          v54 = v56;
          break;
        }
        default:
          {
          int v57 = 0;
          bool v58 = v2 != v57;
          int v59;
          if (v58) {
            int v60 = 1;
            int v61 = v0 + v60;
            v59 = v61;
          } else {
            v59 = v0;
          }
          int v62 = 2;
          v54 = v59;
          break;
        }
        case 1:
          {
          int v63 = 0;
          int v64 = 0;
          int v65;
          int v66;
          v65 = v63;
          v66 = v64;
          while (true) {
            int v67 = 4;
            int v68 = v3 % v67;
            int v69 = 1;
            int v70 = v68 + v69;
            bool v71 = v66 < v70;
            v65 = v65;
            v66 = v66;
            if (!v71) break;
            int v72 = 2;
            int v73 = v0 + v72;
            int v74 = 1;
            int v75 = v66 + v74;
            v65 = v73;
            v66 = v75;
          }
          v54 = v65;
          break;
        }
      }
      int v76 = 4;
      v28 = v54;
      break;
    }
    case 2:
      {
      int v77 = 0;
      bool v78 = v2 != v77;
      int v79;
      if (v78) {
        int v80 = 1;
        int v81;
        v81 = v80;
        switch (v3) {
          default:
            {
            v81 = v0;
            break;
          }
          case 0:
            {
            int v82 = 2;
            v81 = v82;
            break;
          }
        }
        int v83 = 2;
        int v84 = v0 + v83;
        v79 = v81;
      } else {
        int v85 = 0;
        bool v86 = v2 != v85;
        int v87;
        if (v86) {
          int v88 = 1;
          v87 = v88;
        } else {
          int v89 = 0;
          v87 = v89;
        }
        int v90 = 4;
        int v91 = v0 + v90;
        v79 = v87;
      }
      int v92 = 0;
      int v93 = v0 + v92;
      v28 = v79;
      break;
    }
  }
  bool v94 = true;
  int v95 = simt_wave_count_bits(v94);
  int v96 = 16;
  int v97 = v96 + v0;
  v1[v97] = v95;
  int v98 = 0;
  bool v99 = v2 != v98;
  int v100 = v99 ? v24 : v28;
  return;
}

kernel void kernel_main(device int* v101 [[buffer(0)]], device int* v102 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v103 = static_cast<int>(__simt_tid3.x);
  int v104 = 0;
  int v105 = v104 + v103;
  int v106 = v102[v105];
  int v107 = 4;
  int v108 = v107 + v103;
  int v109 = v102[v108];
  helper0(v103, v101, v106, v109, static_cast<int>(__simt_tid3.x));
  int v110 = 0;
  int v111 = 0;
  int v112;
  int v113;
  v112 = v110;
  v113 = v111;
  while (true) {
    int v114 = 4;
    int v115 = v113 * v114;
    int v116 = v115 + v103;
    int v117 = 8;
    int v118 = v117 + v116;
    int v119 = v102[v118];
    int v120 = 0;
    bool v121 = v119 != v120;
    v112 = v112;
    v113 = v113;
    if (!v121) break;
    int v122 = v112 + v113;
    int v123 = 1;
    int v124 = v113 + v123;
    v112 = v122;
    v113 = v124;
    continue;
    ;
  }
  bool v125 = true;
  int v126 = 32;
  int v127 = v126 + v103;
  bool v128 = true;
  int v129 = simt_wave_count_bits(v128);
  v101[v127] = v129;
  int v130 = 28;
  int v131 = v130 + v103;
  int v132 = v102[v131];
  uint v133 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v134 = (int)(v133);
  int v135;
  v135 = v134;
  switch (v132) {
    default:
      {
      int v136 = 32;
      int v137 = v136 + v103;
      int v138 = v102[v137];
      int v139 = 4;
      int v140;
      v140 = v139;
      switch (v138) {
        default:
          {
          int v141 = 0;
          int v142 = v103 + v141;
          v140 = v142;
        }
        case 0:
          {
          int v143 = 0;
          int v144 = 0;
          int v145;
          int v146;
          v145 = v143;
          v146 = v144;
          while (true) {
            int v147 = 4;
            int v148 = v146 * v147;
            int v149 = v148 + v103;
            int v150 = 36;
            int v151 = v150 + v149;
            int v152 = v102[v151];
            int v153 = 0;
            bool v154 = v152 != v153;
            v145 = v145;
            v146 = v146;
            if (!v154) break;
            int v155 = v145 + v146;
            int v156 = 1;
            int v157 = v146 + v156;
            v145 = v155;
            v146 = v157;
            break;
            ;
          }
          bool v158 = true;
          v140 = v145;
        }
        case 1:
          {
          int v159 = 0;
          v140 = v159;
          break;
        }
      }
      bool v160 = true;
      v135 = v140;
      break;
    }
    case 0:
      {
      int v161 = 0;
      int v162 = 0;
      int v163;
      int v164;
      v163 = v161;
      v164 = v162;
      while (true) {
        int v165 = 4;
        int v166 = v164 * v165;
        int v167 = v166 + v103;
        int v168 = 56;
        int v169 = v168 + v167;
        int v170 = v102[v169];
        int v171 = 0;
        bool v172 = v170 != v171;
        v163 = v163;
        v164 = v164;
        if (!v172) break;
        int v173 = 0;
        int v174 = 0;
        int v175;
        int v176;
        v175 = v173;
        v176 = v174;
        while (true) {
          int v177 = 4;
          int v178 = v176 * v177;
          int v179 = v178 + v103;
          int v180 = 76;
          int v181 = v180 + v179;
          int v182 = v102[v181];
          int v183 = 0;
          bool v184 = v182 != v183;
          v175 = v175;
          v176 = v176;
          if (!v184) break;
          int v185 = v175 + v176;
          int v186 = 1;
          int v187 = v176 + v186;
          v175 = v185;
          v176 = v187;
        }
        bool v188 = true;
        int v189 = v163 + v175;
        int v190 = 1;
        int v191 = v164 + v190;
        v163 = v189;
        v164 = v191;
      }
      bool v192 = true;
      v135 = v163;
    }
    case 1:
      {
      int v193 = 96;
      int v194 = v193 + v103;
      int v195 = v102[v194];
      int v196 = 0;
      bool v197 = v195 != v196;
      int v198;
      if (v197) {
        int v199 = 0;
        v198 = v199;
      } else {
        v198 = v103;
      }
      v135 = v198;
    }
    case 2:
      {
      int v200 = 100;
      int v201 = v200 + v103;
      int v202 = v102[v201];
      int v203 = 1;
      int v204 = v103 + v203;
      int v205;
      v205 = v204;
      switch (v202) {
        case 0:
          {
          int v206 = 104;
          int v207 = v206 + v103;
          int v208 = v102[v207];
          int v209 = 0;
          bool v210 = v208 != v209;
          int v211;
          if (v210) {
            int v212 = 3;
            v211 = v212;
          } else {
            int v213 = 0;
            int v214 = v103 + v213;
            v211 = v214;
          }
          v205 = v211;
          break;
        }
        default:
          {
          int v215 = 1;
          v205 = v215;
          break;
        }
      }
      bool v216 = true;
      v135 = v205;
      break;
    }
  }
  bool v217 = true;
  int v218 = 48;
  int v219 = v218 + v103;
  bool v220 = true;
  int v221 = simt_wave_count_bits(v220);
  v101[v219] = v221;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
