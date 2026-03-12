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
  int v6 = 3;
  int v7;
  v7 = v6;
  switch (v5) {
    case 0:
      {
      int v8 = 0;
      v7 = v8;
      break;
    }
    case 1:
      {
      int v9 = 4;
      int v10 = v3 % v9;
      int v11 = 4;
      int v12;
      v12 = v11;
      switch (v10) {
        default:
          {
          int v13 = 3;
          int v14 = v0 + v13;
          int v15;
          v15 = v14;
          switch (v3) {
            case 0:
              {
              v15 = v0;
              break;
            }
            default:
              {
              int v16 = 3;
              int v17 = v0 + v16;
              v15 = v17;
              break;
            }
          }
          v12 = v15;
        }
        case 0:
          {
          int v18 = 2;
          int v19 = v3 % v18;
          int v20 = 3;
          int v21 = v0 + v20;
          int v22;
          v22 = v21;
          switch (v19) {
            case 0:
              {
              int v23 = 2;
              int v24 = v0 + v23;
              v22 = v24;
              break;
            }
            default:
              {
              int v25 = 1;
              v22 = v25;
            }
            case 1:
              {
              int v26 = 1;
              v22 = v26;
              break;
            }
          }
          int v27 = 0;
          int v28 = v0 + v27;
          v12 = v22;
          break;
        }
        case 1:
          {
          int v29 = 2;
          int v30 = v3 % v29;
          int v31;
          v31 = v0;
          switch (v30) {
            default:
              {
              int v32 = 3;
              v31 = v32;
              break;
            }
            case 0:
              {
              v31 = v0;
              break;
            }
          }
          int v33 = 2;
          int v34 = v0 + v33;
          v12 = v31;
        }
        case 2:
          {
          int v35 = 0;
          int v36 = v0 + v35;
          v12 = v36;
          break;
        }
      }
      v7 = v12;
      break;
    }
    default:
      {
      int v37 = 0;
      int v38 = 0;
      int v39;
      int v40;
      v39 = v37;
      v40 = v38;
      while (true) {
        int v41 = 4;
        int v42 = v3 % v41;
        int v43 = 1;
        int v44 = v42 + v43;
        bool v45 = v40 < v44;
        v39 = v39;
        v40 = v40;
        if (!v45) break;
        int v46 = 1;
        int v47 = v40 + v46;
        v39 = v0;
        v40 = v47;
      }
      int v48 = 3;
      int v49 = v0 + v48;
      v7 = v39;
      break;
    }
    case 2:
      {
      v7 = v0;
      break;
    }
  }
  bool v50 = true;
  int v51 = simt_wave_count_bits(v50);
  int v52 = 0;
  int v53 = v52 + v0;
  v1[v53] = v51;
  return;
}

kernel void kernel_main(device int* v54 [[buffer(0)]], device int* v55 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v56 = static_cast<int>(__simt_tid3.x);
  int v57 = 0;
  int v58 = v57 + v56;
  int v59 = v55[v58];
  int v60 = 4;
  int v61 = v60 + v56;
  int v62 = v55[v61];
  helper0(v56, v54, v59, v62, static_cast<int>(__simt_tid3.x));
  int v63 = 0;
  int v64 = 0;
  int v65;
  int v66;
  v65 = v63;
  v66 = v64;
  while (true) {
    int v67 = 4;
    int v68 = v66 * v67;
    int v69 = v68 + v56;
    int v70 = 8;
    int v71 = v70 + v69;
    int v72 = v55[v71];
    int v73 = 0;
    bool v74 = v72 != v73;
    v65 = v65;
    v66 = v66;
    if (!v74) break;
    int v75 = v65 + v66;
    int v76 = 1;
    int v77 = v66 + v76;
    v65 = v75;
    v66 = v77;
  }
  bool v78 = true;
  int v79 = 16;
  int v80 = v79 + v56;
  bool v81 = true;
  int v82 = simt_wave_count_bits(v81);
  v54[v80] = v82;
  int v83 = 0;
  int v84 = 0;
  int v85;
  int v86;
  v85 = v83;
  v86 = v84;
  while (true) {
    int v87 = 4;
    int v88 = v86 * v87;
    int v89 = v88 + v56;
    int v90 = 28;
    int v91 = v90 + v89;
    int v92 = v55[v91];
    int v93 = 0;
    bool v94 = v92 != v93;
    v85 = v85;
    v86 = v86;
    if (!v94) break;
    int v95 = v85 + v86;
    int v96 = 1;
    int v97 = v86 + v96;
    v85 = v95;
    v86 = v97;
  }
  bool v98 = true;
  int v99 = 32;
  int v100 = v99 + v56;
  bool v101 = true;
  int v102 = simt_wave_count_bits(v101);
  v54[v100] = v102;
  int v103 = 48;
  int v104 = v103 + v56;
  int v105 = v55[v104];
  uint v106 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v107 = (int)(v106);
  int v108;
  v108 = v107;
  switch (v105) {
    case 0:
      {
      int v109 = 52;
      int v110 = v109 + v56;
      int v111 = v55[v110];
      int v112;
      v112 = v56;
      switch (v111) {
        case 0:
          {
          int v113 = 0;
          int v114 = 0;
          int v115;
          int v116;
          v115 = v113;
          v116 = v114;
          while (true) {
            int v117 = 4;
            int v118 = v116 * v117;
            int v119 = v118 + v56;
            int v120 = 56;
            int v121 = v120 + v119;
            int v122 = v55[v121];
            int v123 = 0;
            bool v124 = v122 != v123;
            v115 = v115;
            v116 = v116;
            if (!v124) break;
            int v125 = v115 + v116;
            int v126 = 1;
            int v127 = v116 + v126;
            v115 = v125;
            v116 = v127;
            continue;
            ;
          }
          bool v128 = true;
          v112 = v115;
          break;
        }
        case 1:
          {
          int v129 = 76;
          int v130 = v129 + v56;
          int v131 = v55[v130];
          int v132 = 0;
          bool v133 = v131 != v132;
          int v134;
          if (v133) {
            v134 = v56;
          } else {
            int v135 = 0;
            v134 = v135;
          }
          v112 = v134;
          break;
        }
        case 2:
          {
          int v136 = 80;
          int v137 = v136 + v56;
          int v138 = v55[v137];
          int v139 = 0;
          bool v140 = v138 != v139;
          int v141;
          if (v140) {
            v141 = v56;
          } else {
            v141 = v56;
          }
          v112 = v141;
        }
        default:
          {
          int v142 = 84;
          int v143 = v142 + v56;
          int v144 = v55[v143];
          int v145 = 0;
          bool v146 = v144 != v145;
          int v147;
          if (v146) {
            int v148 = 3;
            v147 = v148;
          } else {
            int v149 = 3;
            v147 = v149;
          }
          v112 = v147;
          break;
        }
      }
      bool v150 = true;
      v108 = v112;
      break;
    }
    default:
      {
      int v151 = 88;
      int v152 = v151 + v56;
      int v153 = v55[v152];
      int v154 = 0;
      bool v155 = v153 != v154;
      int v156;
      if (v155) {
        int v157 = 92;
        int v158 = v157 + v56;
        int v159 = v55[v158];
        int v160 = 0;
        bool v161 = v159 != v160;
        int v162;
        if (v161) {
          v162 = v56;
        } else {
          int v163 = 1;
          int v164 = v56 + v163;
          v162 = v164;
        }
        v156 = v162;
      } else {
        v156 = v56;
      }
      v108 = v156;
    }
    case 1:
      {
      int v165 = 96;
      int v166 = v165 + v56;
      int v167 = v55[v166];
      int v168;
      v168 = v56;
      switch (v167) {
        default:
          {
          int v169 = 0;
          int v170 = 0;
          int v171;
          int v172;
          v171 = v169;
          v172 = v170;
          while (true) {
            int v173 = 4;
            int v174 = v172 * v173;
            int v175 = v174 + v56;
            int v176 = 100;
            int v177 = v176 + v175;
            int v178 = v55[v177];
            int v179 = 0;
            bool v180 = v178 != v179;
            v171 = v171;
            v172 = v172;
            if (!v180) break;
            int v181 = v171 + v172;
            int v182 = 1;
            int v183 = v172 + v182;
            v171 = v181;
            v172 = v183;
            break;
            ;
          }
          bool v184 = true;
          v168 = v171;
          break;
        }
        case 0:
          {
          int v185 = 3;
          v168 = v185;
          break;
        }
      }
      bool v186 = true;
      v108 = v168;
      break;
    }
    case 2:
      {
      v108 = v56;
      break;
    }
  }
  bool v187 = true;
  int v188 = 48;
  int v189 = v188 + v56;
  bool v190 = true;
  int v191 = simt_wave_count_bits(v190);
  v54[v189] = v191;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 120; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
