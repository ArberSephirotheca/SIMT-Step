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
  int v6 = 4;
  int v7;
  v7 = v6;
  switch (v5) {
    case 0:
      {
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
          int v20 = 1;
          v19 = v20;
        } else {
          int v21 = 0;
          int v22 = v0 + v21;
          v19 = v22;
        }
        int v23 = 1;
        int v24 = v11 + v23;
        v10 = v19;
        v11 = v24;
      }
      v7 = v10;
    }
    case 1:
      {
      int v25 = 0;
      bool v26 = v2 != v25;
      int v27;
      if (v26) {
        v27 = v0;
      } else {
        int v28 = 0;
        int v29 = 0;
        int v30;
        int v31;
        v30 = v28;
        v31 = v29;
        while (true) {
          int v32 = 4;
          int v33 = v3 % v32;
          int v34 = 1;
          int v35 = v33 + v34;
          bool v36 = v31 < v35;
          v30 = v30;
          v31 = v31;
          if (!v36) break;
          int v37 = 4;
          int v38 = v0 + v37;
          int v39 = 1;
          int v40 = v31 + v39;
          v30 = v38;
          v31 = v40;
        }
        v27 = v30;
      }
      v7 = v27;
    }
    default:
      {
      int v41 = 4;
      v7 = v41;
      break;
    }
  }
  bool v42 = true;
  int v43 = simt_wave_count_bits(v42);
  int v44 = 0;
  int v45 = v44 + v0;
  v1[v45] = v43;
  return;
}

kernel void kernel_main(device int* v46 [[buffer(0)]], device int* v47 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v48 = static_cast<int>(__simt_tid3.x);
  int v49 = 0;
  int v50 = v49 + v48;
  int v51 = v47[v50];
  int v52 = 4;
  int v53 = v52 + v48;
  int v54 = v47[v53];
  helper0(v48, v46, v51, v54, static_cast<int>(__simt_tid3.x));
  int v55 = 8;
  int v56 = v55 + v48;
  int v57 = v47[v56];
  uint v58 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v59 = (int)(v58);
  int v60;
  v60 = v59;
  switch (v57) {
    case 0:
      {
      int v61 = 12;
      int v62 = v61 + v48;
      int v63 = v47[v62];
      int v64 = 3;
      int v65 = v48 + v64;
      int v66;
      v66 = v65;
      switch (v63) {
        case 0:
          {
          int v67 = 16;
          int v68 = v67 + v48;
          int v69 = v47[v68];
          int v70 = 3;
          int v71 = v48 + v70;
          int v72;
          v72 = v71;
          switch (v69) {
            default:
              {
              v72 = v48;
              break;
            }
            case 0:
              {
              int v73 = 3;
              int v74 = v48 + v73;
              v72 = v74;
              break;
            }
          }
          v66 = v72;
          break;
        }
        case 1:
          {
          int v75 = 4;
          int v76 = v48 + v75;
          v66 = v76;
          break;
        }
        default:
          {
          int v77 = 20;
          int v78 = v77 + v48;
          int v79 = v47[v78];
          int v80 = 3;
          int v81;
          v81 = v80;
          switch (v79) {
            case 0:
              {
              v81 = v48;
              break;
            }
            case 1:
              {
              v81 = v48;
              break;
            }
            default:
              {
              int v82 = 3;
              v81 = v82;
              break;
            }
            case 2:
              {
              v81 = v48;
              break;
            }
          }
          v66 = v81;
          break;
        }
      }
      bool v83 = true;
      v60 = v66;
    }
    default:
      {
      int v84 = 1;
      v60 = v84;
    }
    case 1:
      {
      int v85 = 0;
      int v86 = v48 + v85;
      v60 = v86;
    }
    case 2:
      {
      int v87 = 24;
      int v88 = v87 + v48;
      int v89 = v47[v88];
      int v90;
      v90 = v48;
      switch (v89) {
        default:
          {
          int v91 = 28;
          int v92 = v91 + v48;
          int v93 = v47[v92];
          int v94 = 0;
          bool v95 = v93 != v94;
          int v96;
          if (v95) {
            int v97 = 1;
            v96 = v97;
          } else {
            v96 = v48;
          }
          v90 = v96;
          break;
        }
        case 0:
          {
          int v98 = 32;
          int v99 = v98 + v48;
          int v100 = v47[v99];
          int v101 = 0;
          bool v102 = v100 != v101;
          int v103;
          if (v102) {
            int v104 = 2;
            int v105 = v48 + v104;
            v103 = v105;
          } else {
            int v106 = 2;
            int v107 = v48 + v106;
            v103 = v107;
          }
          v90 = v103;
          break;
        }
        case 1:
          {
          int v108 = 36;
          int v109 = v108 + v48;
          int v110 = v47[v109];
          int v111 = 1;
          int v112 = v48 + v111;
          int v113;
          v113 = v112;
          switch (v110) {
            case 0:
              {
              int v114 = 3;
              int v115 = v48 + v114;
              v113 = v115;
            }
            case 1:
              {
              int v116 = 2;
              v113 = v116;
            }
            default:
              {
              v113 = v48;
              break;
            }
          }
          v90 = v113;
          break;
        }
        case 2:
          {
          int v117 = 4;
          v90 = v117;
          break;
        }
      }
      v60 = v90;
      break;
    }
  }
  int v118 = 40;
  int v119 = v118 + v48;
  int v120 = v47[v119];
  int v121 = 0;
  bool v122 = v120 != v121;
  int v123;
  if (v122) {
    int v124 = 0;
    int v125 = 0;
    int v126;
    int v127;
    v126 = v124;
    v127 = v125;
    while (true) {
      int v128 = 4;
      int v129 = v127 * v128;
      int v130 = v129 + v48;
      int v131 = 44;
      int v132 = v131 + v130;
      int v133 = v47[v132];
      int v134 = 0;
      bool v135 = v133 != v134;
      v126 = v126;
      v127 = v127;
      if (!v135) break;
      int v136 = 64;
      int v137 = v136 + v48;
      int v138 = v47[v137];
      int v139 = 2;
      int v140;
      v140 = v139;
      switch (v138) {
        case 0:
          {
          v140 = v48;
        }
        default:
          {
          int v141 = 2;
          int v142 = v48 + v141;
          v140 = v142;
          break;
        }
        case 1:
          {
          int v143 = 2;
          int v144 = v48 + v143;
          v140 = v144;
          break;
        }
      }
      int v145 = v126 + v140;
      int v146 = 1;
      int v147 = v127 + v146;
      bool v148 = true;
      int v149 = 16;
      int v150 = 4;
      int v151 = v127 * v150;
      int v152 = v149 + v151;
      int v153 = v152 + v48;
      bool v154 = true;
      int v155 = simt_wave_count_bits(v154);
      v46[v153] = v155;
      v126 = v145;
      v127 = v147;
      break;
      ;
    }
    v123 = v126;
  } else {
    int v156 = 68;
    int v157 = v156 + v48;
    int v158 = v47[v157];
    int v159 = 0;
    bool v160 = v158 != v159;
    int v161;
    if (v160) {
      int v162 = 0;
      int v163 = 0;
      int v164;
      int v165;
      v164 = v162;
      v165 = v163;
      while (true) {
        int v166 = 4;
        int v167 = v165 * v166;
        int v168 = v167 + v48;
        int v169 = 72;
        int v170 = v169 + v168;
        int v171 = v47[v170];
        int v172 = 0;
        bool v173 = v171 != v172;
        v164 = v164;
        v165 = v165;
        if (!v173) break;
        int v174 = v164 + v165;
        int v175 = 1;
        int v176 = v165 + v175;
        bool v177 = true;
        int v178 = 32;
        int v179 = 4;
        int v180 = v165 * v179;
        int v181 = v178 + v180;
        int v182 = v181 + v48;
        bool v183 = true;
        int v184 = simt_wave_count_bits(v183);
        v46[v182] = v184;
        v164 = v174;
        v165 = v176;
      }
      v161 = v164;
    } else {
      int v185 = 92;
      int v186 = v185 + v48;
      int v187 = v47[v186];
      int v188 = 1;
      int v189 = v48 + v188;
      int v190;
      v190 = v189;
      switch (v187) {
        default:
          {
          v190 = v48;
          break;
        }
        case 0:
          {
          v190 = v48;
          break;
        }
        case 1:
          {
          v190 = v48;
          break;
        }
      }
      bool v191 = true;
      int v192 = 48;
      int v193 = v192 + v48;
      bool v194 = true;
      int v195 = simt_wave_count_bits(v194);
      v46[v193] = v195;
      v161 = v190;
    }
    int v196 = 64;
    int v197 = v196 + v48;
    bool v198 = true;
    int v199 = simt_wave_count_bits(v198);
    v46[v197] = v199;
    v123 = v161;
  }
  int v200 = 80;
  int v201 = v200 + v48;
  bool v202 = true;
  int v203 = simt_wave_count_bits(v202);
  v46[v201] = v203;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 84; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 96; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
