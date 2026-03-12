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
    v6 = v0;
  } else {
    v6 = v0;
  }
  bool v7 = true;
  int v8 = simt_wave_count_bits(v7);
  int v9 = 0;
  int v10 = v9 + v0;
  v1[v10] = v8;
  int v11 = 3;
  int v12 = v3 % v11;
  uint v13 = simt_lane_id(__simt_tid);
  int v14 = (int)(v13);
  int v15;
  v15 = v14;
  switch (v12) {
    case 0:
      {
      int v16 = 3;
      int v17 = v3 % v16;
      int v18 = 1;
      int v19;
      v19 = v18;
      switch (v17) {
        default:
          {
          int v20 = 4;
          int v21 = v3 % v20;
          int v22 = 3;
          int v23 = v0 + v22;
          int v24;
          v24 = v23;
          switch (v21) {
            case 0:
              {
              int v25 = 0;
              int v26 = v0 + v25;
              v24 = v26;
              break;
            }
            default:
              {
              int v27 = 4;
              v24 = v27;
              break;
            }
            case 1:
              {
              int v28 = 3;
              int v29 = v0 + v28;
              v24 = v29;
              break;
            }
            case 2:
              {
              v24 = v0;
              break;
            }
          }
          int v30 = 0;
          v19 = v24;
          break;
        }
        case 0:
          {
          int v31 = 0;
          int v32;
          v32 = v31;
          switch (v3) {
            case 0:
              {
              int v33 = 1;
              int v34 = v0 + v33;
              v32 = v34;
            }
            default:
              {
              int v35 = 2;
              int v36 = v0 + v35;
              v32 = v36;
              break;
            }
          }
          int v37 = 0;
          v19 = v32;
          break;
        }
        case 1:
          {
          int v38 = 3;
          int v39 = v3 % v38;
          int v40 = 1;
          int v41 = v0 + v40;
          int v42;
          v42 = v41;
          switch (v39) {
            default:
              {
              int v43 = 1;
              v42 = v43;
              break;
            }
            case 0:
              {
              v42 = v0;
            }
            case 1:
              {
              v42 = v0;
              break;
            }
          }
          int v44 = 2;
          int v45 = v0 + v44;
          v19 = v42;
          break;
        }
      }
      int v46 = 1;
      v15 = v19;
      break;
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
        int v56 = 0;
        bool v57 = v2 != v56;
        int v58;
        if (v57) {
          v58 = v0;
        } else {
          int v59 = 4;
          int v60 = v0 + v59;
          v58 = v60;
        }
        int v61 = 1;
        int v62 = v50 + v61;
        v49 = v58;
        v50 = v62;
      }
      int v63 = 3;
      int v64 = v0 + v63;
      v15 = v49;
      break;
    }
    default:
      {
      int v65 = 3;
      v15 = v65;
      break;
    }
  }
  bool v66 = true;
  int v67 = simt_wave_count_bits(v66);
  int v68 = 16;
  int v69 = v68 + v0;
  v1[v69] = v67;
  int v70 = 0;
  bool v71 = v2 != v70;
  int v72 = v71 ? v6 : v15;
  return;
}

kernel void kernel_main(device int* v73 [[buffer(0)]], device int* v74 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v75 = static_cast<int>(__simt_tid3.x);
  int v76 = 0;
  int v77 = v76 + v75;
  int v78 = v74[v77];
  int v79 = 4;
  int v80 = v79 + v75;
  int v81 = v74[v80];
  helper0(v75, v73, v78, v81, static_cast<int>(__simt_tid3.x));
  int v82 = 0;
  int v83 = 0;
  int v84;
  int v85;
  v84 = v82;
  v85 = v83;
  while (true) {
    int v86 = 4;
    int v87 = v85 * v86;
    int v88 = v87 + v75;
    int v89 = 8;
    int v90 = v89 + v88;
    int v91 = v74[v90];
    int v92 = 0;
    bool v93 = v91 != v92;
    v84 = v84;
    v85 = v85;
    if (!v93) break;
    int v94 = 28;
    int v95 = v94 + v75;
    int v96 = v74[v95];
    uint v97 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v98 = (int)(v97);
    int v99;
    v99 = v98;
    switch (v96) {
      default:
        {
        int v100 = 32;
        int v101 = v100 + v75;
        int v102 = v74[v101];
        int v103 = 0;
        bool v104 = v102 != v103;
        int v105;
        if (v104) {
          int v106 = 4;
          v105 = v106;
        } else {
          int v107 = 1;
          int v108 = v75 + v107;
          v105 = v108;
        }
        v99 = v105;
        break;
      }
      case 0:
        {
        int v109 = 36;
        int v110 = v109 + v75;
        int v111 = v74[v110];
        int v112 = 2;
        int v113 = v75 + v112;
        int v114;
        v114 = v113;
        switch (v111) {
          case 0:
            {
            int v115 = 0;
            v114 = v115;
            break;
          }
          case 1:
            {
            int v116 = 3;
            int v117 = v75 + v116;
            v114 = v117;
          }
          default:
            {
            v114 = v75;
          }
          case 2:
            {
            int v118 = 4;
            int v119 = v75 + v118;
            v114 = v119;
            break;
          }
        }
        bool v120 = true;
        v99 = v114;
        break;
      }
      case 1:
        {
        int v121 = 40;
        int v122 = v121 + v75;
        int v123 = v74[v122];
        int v124;
        v124 = v75;
        switch (v123) {
          case 0:
            {
            int v125 = 0;
            v124 = v125;
            break;
          }
          default:
            {
            v124 = v75;
          }
          case 1:
            {
            v124 = v75;
            break;
          }
        }
        bool v126 = true;
        v99 = v124;
        break;
      }
    }
    bool v127 = true;
    int v128 = v84 + v99;
    int v129 = 1;
    int v130 = v85 + v129;
    v84 = v128;
    v85 = v130;
  }
  bool v131 = true;
  int v132 = 32;
  int v133 = v132 + v75;
  bool v134 = true;
  int v135 = simt_wave_count_bits(v134);
  v73[v133] = v135;
  int v136 = 44;
  int v137 = v136 + v75;
  int v138 = v74[v137];
  uint v139 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v140 = (int)(v139);
  int v141;
  v141 = v140;
  switch (v138) {
    case 0:
      {
      int v142 = 48;
      int v143 = v142 + v75;
      int v144 = v74[v143];
      int v145 = 0;
      bool v146 = v144 != v145;
      int v147;
      if (v146) {
        int v148 = 52;
        int v149 = v148 + v75;
        int v150 = v74[v149];
        int v151 = 2;
        int v152 = v75 + v151;
        int v153;
        v153 = v152;
        switch (v150) {
          default:
            {
            v153 = v75;
            break;
          }
          case 0:
            {
            int v154 = 3;
            int v155 = v75 + v154;
            v153 = v155;
            break;
          }
          case 1:
            {
            v153 = v75;
            break;
          }
        }
        bool v156 = true;
        v147 = v153;
      } else {
        int v157 = 0;
        int v158 = 0;
        int v159;
        int v160;
        v159 = v157;
        v160 = v158;
        while (true) {
          int v161 = 4;
          int v162 = v160 * v161;
          int v163 = v162 + v75;
          int v164 = 56;
          int v165 = v164 + v163;
          int v166 = v74[v165];
          int v167 = 0;
          bool v168 = v166 != v167;
          v159 = v159;
          v160 = v160;
          if (!v168) break;
          int v169 = v159 + v160;
          int v170 = 1;
          int v171 = v160 + v170;
          v159 = v169;
          v160 = v171;
          break;
          ;
        }
        bool v172 = true;
        v147 = v159;
      }
      v141 = v147;
    }
    default:
      {
      int v173 = 0;
      int v174 = 0;
      int v175;
      int v176;
      v175 = v173;
      v176 = v174;
      while (true) {
        int v177 = 4;
        int v178 = v176 * v177;
        int v179 = v178 + v75;
        int v180 = 76;
        int v181 = v180 + v179;
        int v182 = v74[v181];
        int v183 = 0;
        bool v184 = v182 != v183;
        v175 = v175;
        v176 = v176;
        if (!v184) break;
        int v185 = 0;
        int v186 = 0;
        int v187;
        int v188;
        v187 = v185;
        v188 = v186;
        while (true) {
          int v189 = 4;
          int v190 = v188 * v189;
          int v191 = v190 + v75;
          int v192 = 96;
          int v193 = v192 + v191;
          int v194 = v74[v193];
          int v195 = 0;
          bool v196 = v194 != v195;
          v187 = v187;
          v188 = v188;
          if (!v196) break;
          int v197 = v187 + v188;
          int v198 = 1;
          int v199 = v188 + v198;
          v187 = v197;
          v188 = v199;
        }
        bool v200 = true;
        int v201 = v175 + v187;
        int v202 = 1;
        int v203 = v176 + v202;
        v175 = v201;
        v176 = v203;
        break;
        ;
      }
      bool v204 = true;
      v141 = v175;
      break;
    }
    case 1:
      {
      int v205 = 1;
      v141 = v205;
      break;
    }
  }
  bool v206 = true;
  int v207 = 48;
  int v208 = v207 + v75;
  bool v209 = true;
  int v210 = simt_wave_count_bits(v209);
  v73[v208] = v210;
  int v211 = 0;
  int v212 = v75 + v211;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
