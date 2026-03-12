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
    int v13 = 4;
    int v14 = v0 + v13;
    int v15;
    v15 = v14;
    switch (v3) {
      default:
        {
        int v16 = 0;
        bool v17 = v2 != v16;
        int v18;
        if (v17) {
          v18 = v0;
        } else {
          int v19 = 4;
          v18 = v19;
        }
        v15 = v18;
        break;
      }
      case 0:
        {
        int v20 = 0;
        int v21 = v0 + v20;
        v15 = v21;
        break;
      }
    }
    int v22 = 1;
    int v23 = v7 + v22;
    v6 = v15;
    v7 = v23;
  }
  bool v24 = true;
  int v25 = simt_wave_count_bits(v24);
  int v26 = 0;
  int v27 = v26 + v0;
  v1[v27] = v25;
  return;
}

kernel void kernel_main(device int* v28 [[buffer(0)]], device int* v29 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v30 = static_cast<int>(__simt_tid3.x);
  int v31 = 0;
  int v32 = v31 + v30;
  int v33 = v29[v32];
  int v34 = 4;
  int v35 = v34 + v30;
  int v36 = v29[v35];
  helper0(v30, v28, v33, v36, static_cast<int>(__simt_tid3.x));
  int v37 = 0;
  int v38 = 0;
  int v39;
  int v40;
  v39 = v37;
  v40 = v38;
  while (true) {
    int v41 = 4;
    int v42 = v40 * v41;
    int v43 = v42 + v30;
    int v44 = 8;
    int v45 = v44 + v43;
    int v46 = v29[v45];
    int v47 = 0;
    bool v48 = v46 != v47;
    v39 = v39;
    v40 = v40;
    if (!v48) break;
    int v49 = v39 + v40;
    int v50 = 1;
    int v51 = v40 + v50;
    bool v52 = true;
    int v53 = 16;
    int v54 = 4;
    int v55 = v40 * v54;
    int v56 = v53 + v55;
    int v57 = v56 + v30;
    bool v58 = true;
    int v59 = simt_wave_count_bits(v58);
    v28[v57] = v59;
    v39 = v49;
    v40 = v51;
  }
  int v60 = 28;
  int v61 = v60 + v30;
  int v62 = v29[v61];
  int v63 = 3;
  int v64;
  v64 = v63;
  switch (v62) {
    case 0:
      {
      int v65 = 32;
      int v66 = v65 + v30;
      int v67 = v29[v66];
      int v68;
      v68 = v30;
      switch (v67) {
        default:
          {
          int v69 = 36;
          int v70 = v69 + v30;
          int v71 = v29[v70];
          int v72 = 0;
          int v73 = v30 + v72;
          int v74;
          v74 = v73;
          switch (v71) {
            case 0:
              {
              int v75 = 2;
              v74 = v75;
            }
            case 1:
              {
              int v76 = 3;
              v74 = v76;
            }
            default:
              {
              v74 = v30;
              break;
            }
          }
          bool v77 = true;
          v68 = v74;
          break;
        }
        case 0:
          {
          int v78 = 40;
          int v79 = v78 + v30;
          int v80 = v29[v79];
          int v81;
          v81 = v30;
          switch (v80) {
            default:
              {
              int v82 = 1;
              int v83 = v30 + v82;
              v81 = v83;
              break;
            }
            case 0:
              {
              int v84 = 2;
              v81 = v84;
              break;
            }
            case 1:
              {
              v81 = v30;
              break;
            }
          }
          v68 = v81;
          break;
        }
      }
      v64 = v68;
      break;
    }
    default:
      {
      int v85 = 44;
      int v86 = v85 + v30;
      int v87 = v29[v86];
      int v88 = 0;
      bool v89 = v87 != v88;
      int v90;
      if (v89) {
        int v91 = 0;
        int v92 = 0;
        int v93;
        int v94;
        v93 = v91;
        v94 = v92;
        while (true) {
          int v95 = 4;
          int v96 = v94 * v95;
          int v97 = v96 + v30;
          int v98 = 48;
          int v99 = v98 + v97;
          int v100 = v29[v99];
          int v101 = 0;
          bool v102 = v100 != v101;
          v93 = v93;
          v94 = v94;
          if (!v102) break;
          int v103 = v93 + v94;
          int v104 = 1;
          int v105 = v94 + v104;
          bool v106 = true;
          v93 = v103;
          v94 = v105;
        }
        v90 = v93;
      } else {
        int v107 = 68;
        int v108 = v107 + v30;
        int v109 = v29[v108];
        int v110;
        v110 = v30;
        switch (v109) {
          case 0:
            {
            int v111 = 2;
            int v112 = v30 + v111;
            v110 = v112;
            break;
          }
          default:
            {
            int v113 = 0;
            int v114 = v30 + v113;
            v110 = v114;
            break;
          }
        }
        bool v115 = true;
        v90 = v110;
      }
      v64 = v90;
      break;
    }
    case 1:
      {
      int v116 = 72;
      int v117 = v116 + v30;
      int v118 = v29[v117];
      int v119 = 0;
      bool v120 = v118 != v119;
      int v121;
      if (v120) {
        int v122 = 76;
        int v123 = v122 + v30;
        int v124 = v29[v123];
        int v125 = 0;
        bool v126 = v124 != v125;
        int v127;
        if (v126) {
          v127 = v30;
        } else {
          int v128 = 3;
          v127 = v128;
        }
        v121 = v127;
      } else {
        int v129 = 80;
        int v130 = v129 + v30;
        int v131 = v29[v130];
        int v132 = 0;
        bool v133 = v131 != v132;
        int v134;
        if (v133) {
          v134 = v30;
        } else {
          int v135 = 0;
          int v136 = v30 + v135;
          v134 = v136;
        }
        v121 = v134;
      }
      v64 = v121;
      break;
    }
    case 2:
      {
      int v137 = 0;
      int v138 = 0;
      int v139;
      int v140;
      v139 = v137;
      v140 = v138;
      while (true) {
        int v141 = 4;
        int v142 = v140 * v141;
        int v143 = v142 + v30;
        int v144 = 84;
        int v145 = v144 + v143;
        int v146 = v29[v145];
        int v147 = 0;
        bool v148 = v146 != v147;
        v139 = v139;
        v140 = v140;
        if (!v148) break;
        int v149 = 104;
        int v150 = v149 + v30;
        int v151 = v29[v150];
        int v152 = 0;
        bool v153 = v151 != v152;
        int v154;
        if (v153) {
          int v155 = 0;
          int v156 = v30 + v155;
          v154 = v156;
        } else {
          v154 = v30;
        }
        int v157 = v139 + v154;
        int v158 = 1;
        int v159 = v140 + v158;
        bool v160 = true;
        v139 = v157;
        v140 = v159;
      }
      v64 = v139;
      break;
    }
  }
  int v161 = 108;
  int v162 = v161 + v30;
  int v163 = v29[v162];
  int v164 = 1;
  int v165 = v30 + v164;
  int v166;
  v166 = v165;
  switch (v163) {
    default:
      {
      int v167 = 0;
      int v168 = 0;
      int v169;
      int v170;
      v169 = v167;
      v170 = v168;
      while (true) {
        int v171 = 4;
        int v172 = v170 * v171;
        int v173 = v172 + v30;
        int v174 = 112;
        int v175 = v174 + v173;
        int v176 = v29[v175];
        int v177 = 0;
        bool v178 = v176 != v177;
        v169 = v169;
        v170 = v170;
        if (!v178) break;
        int v179 = v169 + v170;
        int v180 = 1;
        int v181 = v170 + v180;
        bool v182 = true;
        v169 = v179;
        v170 = v181;
      }
      v166 = v169;
    }
    case 0:
      {
      int v183 = 132;
      int v184 = v183 + v30;
      int v185 = v29[v184];
      int v186 = 3;
      int v187;
      v187 = v186;
      switch (v185) {
        case 0:
          {
          int v188 = 136;
          int v189 = v188 + v30;
          int v190 = v29[v189];
          int v191 = 0;
          bool v192 = v190 != v191;
          int v193;
          if (v192) {
            v193 = v30;
          } else {
            v193 = v30;
          }
          v187 = v193;
          break;
        }
        default:
          {
          int v194 = 140;
          int v195 = v194 + v30;
          int v196 = v29[v195];
          int v197 = 4;
          int v198;
          v198 = v197;
          switch (v196) {
            case 0:
              {
              int v199 = 1;
              int v200 = v30 + v199;
              v198 = v200;
              break;
            }
            case 1:
              {
              int v201 = 3;
              v198 = v201;
              break;
            }
            default:
              {
              v198 = v30;
              break;
            }
            case 2:
              {
              int v202 = 0;
              int v203 = v30 + v202;
              v198 = v203;
              break;
            }
          }
          v187 = v198;
          break;
        }
      }
      v166 = v187;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 24; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 144; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
