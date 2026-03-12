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
  int v6;
  int v7;
  v6 = v4;
  v7 = v5;
  while (true) {
    int v8 = 4;
    int v9 = v3 % v8;
    int v10 = 1;
    int v11 = v9 + v10;
    bool v12 = v7 < v11;
    v6 = v6;
    v7 = v7;
    if (!v12) break;
    int v13 = 0;
    bool v14 = v2 != v13;
    int v15;
    if (v14) {
      uint v16 = simt_subgroup_id(__simt_tid);
      int v17 = (int)(v16);
      v15 = v17;
    } else {
      int v18 = 3;
      int v19 = v0 + v18;
      int v20;
      v20 = v19;
      switch (v3) {
        default:
          {
          v20 = v0;
        }
        case 0:
          {
          int v21 = 0;
          v20 = v21;
          break;
        }
      }
      int v22 = 4;
      int v23 = v0 + v22;
      v15 = v20;
    }
    uint v24 = simt_subgroup_id(__simt_tid);
    int v25 = (int)(v24);
    int v26 = 1;
    int v27 = v7 + v26;
    v6 = v15;
    v7 = v27;
  }
  bool v28 = true;
  int v29 = simt_wave_count_bits(v28);
  int v30 = 0;
  int v31 = v30 + v0;
  v1[v31] = v29;
  return;
}

kernel void kernel_main(device int* v32 [[buffer(0)]], device int* v33 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v34 = static_cast<int>(__simt_tid3.x);
  int v35 = 0;
  int v36 = v35 + v34;
  int v37 = v33[v36];
  int v38 = 4;
  int v39 = v38 + v34;
  int v40 = v33[v39];
  helper0(v34, v32, v37, v40, static_cast<int>(__simt_tid3.x));
  int v41 = 8;
  int v42 = v41 + v34;
  int v43 = v33[v42];
  int v44 = 4;
  int v45 = v34 + v44;
  int v46;
  v46 = v45;
  switch (v43) {
    case 0:
      {
      int v47 = 0;
      int v48 = 0;
      int v49;
      int v50;
      v49 = v47;
      v50 = v48;
      while (true) {
        int v51 = 4;
        int v52 = v50 * v51;
        int v53 = v52 + v34;
        int v54 = 12;
        int v55 = v54 + v53;
        int v56 = v33[v55];
        int v57 = 0;
        bool v58 = v56 != v57;
        v49 = v49;
        v50 = v50;
        if (!v58) break;
        int v59 = v49 + v50;
        int v60 = 1;
        int v61 = v50 + v60;
        v49 = v59;
        v50 = v61;
        break;
        ;
      }
      bool v62 = true;
      v46 = v49;
      break;
    }
    default:
      {
      int v63 = 32;
      int v64 = v63 + v34;
      int v65 = v33[v64];
      int v66 = 0;
      bool v67 = v65 != v66;
      int v68;
      if (v67) {
        int v69 = 36;
        int v70 = v69 + v34;
        int v71 = v33[v70];
        int v72 = 0;
        bool v73 = v71 != v72;
        int v74;
        if (v73) {
          int v75 = 2;
          v74 = v75;
        } else {
          int v76 = 0;
          int v77 = v34 + v76;
          v74 = v77;
        }
        v68 = v74;
      } else {
        int v78 = 0;
        int v79 = 0;
        int v80;
        int v81;
        v80 = v78;
        v81 = v79;
        while (true) {
          int v82 = 4;
          int v83 = v81 * v82;
          int v84 = v83 + v34;
          int v85 = 40;
          int v86 = v85 + v84;
          int v87 = v33[v86];
          int v88 = 0;
          bool v89 = v87 != v88;
          v80 = v80;
          v81 = v81;
          if (!v89) break;
          int v90 = v80 + v81;
          int v91 = 1;
          int v92 = v81 + v91;
          v80 = v90;
          v81 = v92;
        }
        bool v93 = true;
        v68 = v80;
      }
      v46 = v68;
      break;
    }
  }
  bool v94 = true;
  int v95 = 16;
  int v96 = v95 + v34;
  bool v97 = true;
  int v98 = simt_wave_count_bits(v97);
  v32[v96] = v98;
  uint v99 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v100 = (int)(v99);
  int v101 = 60;
  int v102 = v101 + v34;
  int v103 = v33[v102];
  uint v104 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v105 = (int)(v104);
  int v106;
  v106 = v105;
  switch (v103) {
    case 0:
      {
      int v107 = 64;
      int v108 = v107 + v34;
      int v109 = v33[v108];
      int v110 = 0;
      bool v111 = v109 != v110;
      int v112;
      if (v111) {
        int v113 = 68;
        int v114 = v113 + v34;
        int v115 = v33[v114];
        int v116 = 0;
        bool v117 = v115 != v116;
        int v118;
        if (v117) {
          int v119 = 0;
          v118 = v119;
        } else {
          v118 = v34;
        }
        v112 = v118;
      } else {
        int v120 = 72;
        int v121 = v120 + v34;
        int v122 = v33[v121];
        int v123 = 0;
        bool v124 = v122 != v123;
        int v125;
        if (v124) {
          int v126 = 4;
          int v127 = v34 + v126;
          v125 = v127;
        } else {
          v125 = v34;
        }
        v112 = v125;
      }
      v106 = v112;
      break;
    }
    default:
      {
      int v128 = 76;
      int v129 = v128 + v34;
      int v130 = v33[v129];
      int v131 = 3;
      int v132 = v34 + v131;
      int v133;
      v133 = v132;
      switch (v130) {
        case 0:
          {
          int v134 = 80;
          int v135 = v134 + v34;
          int v136 = v33[v135];
          int v137 = 0;
          bool v138 = v136 != v137;
          int v139;
          if (v138) {
            int v140 = 0;
            int v141 = v34 + v140;
            v139 = v141;
          } else {
            int v142 = 3;
            int v143 = v34 + v142;
            v139 = v143;
          }
          v133 = v139;
          break;
        }
        case 1:
          {
          int v144 = 4;
          int v145 = v34 + v144;
          v133 = v145;
          break;
        }
        default:
          {
          int v146 = 0;
          int v147 = 0;
          int v148;
          int v149;
          v148 = v146;
          v149 = v147;
          while (true) {
            int v150 = 4;
            int v151 = v149 * v150;
            int v152 = v151 + v34;
            int v153 = 84;
            int v154 = v153 + v152;
            int v155 = v33[v154];
            int v156 = 0;
            bool v157 = v155 != v156;
            v148 = v148;
            v149 = v149;
            if (!v157) break;
            int v158 = v148 + v149;
            int v159 = 1;
            int v160 = v149 + v159;
            v148 = v158;
            v149 = v160;
            break;
            ;
          }
          bool v161 = true;
          v133 = v148;
          break;
        }
        case 2:
          {
          int v162 = 104;
          int v163 = v162 + v34;
          int v164 = v33[v163];
          int v165 = 0;
          bool v166 = v164 != v165;
          int v167;
          if (v166) {
            int v168 = 1;
            v167 = v168;
          } else {
            int v169 = 2;
            v167 = v169;
          }
          v133 = v167;
          break;
        }
      }
      bool v170 = true;
      v106 = v133;
      break;
    }
    case 1:
      {
      int v171 = 108;
      int v172 = v171 + v34;
      int v173 = v33[v172];
      int v174 = 1;
      int v175 = v34 + v174;
      int v176;
      v176 = v175;
      switch (v173) {
        case 0:
          {
          int v177 = 112;
          int v178 = v177 + v34;
          int v179 = v33[v178];
          int v180 = 0;
          int v181;
          v181 = v180;
          switch (v179) {
            case 0:
              {
              int v182 = 4;
              v181 = v182;
              break;
            }
            default:
              {
              v181 = v34;
              break;
            }
            case 1:
              {
              int v183 = 0;
              int v184 = v34 + v183;
              v181 = v184;
              break;
            }
            case 2:
              {
              int v185 = 2;
              int v186 = v34 + v185;
              v181 = v186;
              break;
            }
          }
          bool v187 = true;
          v176 = v181;
          break;
        }
        default:
          {
          int v188 = 3;
          v176 = v188;
          break;
        }
      }
      bool v189 = true;
      v106 = v176;
      break;
    }
    case 2:
      {
      int v190 = 0;
      int v191 = 0;
      int v192;
      int v193;
      v192 = v190;
      v193 = v191;
      while (true) {
        int v194 = 4;
        int v195 = v193 * v194;
        int v196 = v195 + v34;
        int v197 = 116;
        int v198 = v197 + v196;
        int v199 = v33[v198];
        int v200 = 0;
        bool v201 = v199 != v200;
        v192 = v192;
        v193 = v193;
        if (!v201) break;
        int v202 = 136;
        int v203 = v202 + v34;
        int v204 = v33[v203];
        int v205 = 3;
        int v206;
        v206 = v205;
        switch (v204) {
          default:
            {
            int v207 = 4;
            v206 = v207;
            break;
          }
          case 0:
            {
            int v208 = 4;
            v206 = v208;
            break;
          }
        }
        bool v209 = true;
        int v210 = v192 + v206;
        int v211 = 1;
        int v212 = v193 + v211;
        v192 = v210;
        v193 = v212;
      }
      bool v213 = true;
      v106 = v192;
      break;
    }
  }
  bool v214 = true;
  int v215 = 32;
  int v216 = v215 + v34;
  bool v217 = true;
  int v218 = simt_wave_count_bits(v217);
  v32[v216] = v218;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 140; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
