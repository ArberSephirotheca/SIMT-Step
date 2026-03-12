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
    bool v13 = true;
    int v14 = simt_wave_count_bits(v13);
    int v15 = 0;
    int v16 = 4;
    int v17 = v7 * v16;
    int v18 = v15 + v17;
    int v19 = v18 + v0;
    v1[v19] = v14;
    int v20 = 1;
    int v21 = v7 + v20;
    v6 = v14;
    v7 = v21;
  }
  int v22 = 0;
  int v23 = 0;
  int v24;
  int v25;
  v24 = v22;
  v25 = v23;
  while (true) {
    int v26 = 4;
    int v27 = v3 % v26;
    int v28 = 1;
    int v29 = v27 + v28;
    bool v30 = v25 < v29;
    v24 = v24;
    v25 = v25;
    if (!v30) break;
    int v31 = 0;
    int v32 = 0;
    int v33;
    int v34;
    v33 = v31;
    v34 = v32;
    while (true) {
      int v35 = 4;
      int v36 = v3 % v35;
      int v37 = 1;
      int v38 = v36 + v37;
      bool v39 = v34 < v38;
      v33 = v33;
      v34 = v34;
      if (!v39) break;
      int v40 = 0;
      bool v41 = v2 != v40;
      int v42;
      if (v41) {
        bool v43 = true;
        int v44 = simt_wave_count_bits(v43);
        int v45 = 16;
        int v46 = 4;
        int v47 = v34 * v46;
        int v48 = v45 + v47;
        int v49 = v48 + v0;
        v1[v49] = v44;
        v42 = v44;
      } else {
        bool v50 = true;
        int v51 = simt_wave_count_bits(v50);
        int v52 = 32;
        int v53 = 4;
        int v54 = v34 * v53;
        int v55 = v52 + v54;
        int v56 = v55 + v0;
        v1[v56] = v51;
        v42 = v51;
      }
      int v57 = 1;
      int v58 = v34 + v57;
      v33 = v42;
      v34 = v58;
    }
    int v59 = 1;
    int v60 = v25 + v59;
    v24 = v33;
    v25 = v60;
    continue;
    ;
  }
  int v61 = 0;
  bool v62 = v2 != v61;
  int v63 = v62 ? v6 : v24;
  return;
}

kernel void kernel_main(device int* v64 [[buffer(0)]], device int* v65 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v66 = static_cast<int>(__simt_tid3.x);
  int v67 = 0;
  int v68 = v67 + v66;
  int v69 = v65[v68];
  int v70 = 4;
  int v71 = v70 + v66;
  int v72 = v65[v71];
  helper0(v66, v64, v69, v72, static_cast<int>(__simt_tid3.x));
  int v73 = 8;
  int v74 = v73 + v66;
  int v75 = v65[v74];
  int v76;
  v76 = v66;
  switch (v75) {
    default:
      {
      int v77 = 12;
      int v78 = v77 + v66;
      int v79 = v65[v78];
      int v80;
      v80 = v66;
      switch (v79) {
        default:
          {
          int v81 = 16;
          int v82 = v81 + v66;
          int v83 = v65[v82];
          int v84 = 0;
          bool v85 = v83 != v84;
          int v86;
          if (v85) {
            int v87 = 2;
            v86 = v87;
          } else {
            int v88 = 3;
            int v89 = v66 + v88;
            v86 = v89;
          }
          v80 = v86;
          break;
        }
        case 0:
          {
          int v90 = 20;
          int v91 = v90 + v66;
          int v92 = v65[v91];
          int v93 = 1;
          int v94;
          v94 = v93;
          switch (v92) {
            case 0:
              {
              v94 = v66;
              break;
            }
            case 1:
              {
              int v95 = 4;
              int v96 = v66 + v95;
              v94 = v96;
              break;
            }
            case 2:
              {
              v94 = v66;
            }
            default:
              {
              int v97 = 3;
              int v98 = v66 + v97;
              v94 = v98;
              break;
            }
          }
          v80 = v94;
          break;
        }
        case 1:
          {
          int v99 = 24;
          int v100 = v99 + v66;
          int v101 = v65[v100];
          int v102 = 0;
          bool v103 = v101 != v102;
          int v104;
          if (v103) {
            int v105 = 0;
            int v106 = v66 + v105;
            v104 = v106;
          } else {
            int v107 = 1;
            int v108 = v66 + v107;
            v104 = v108;
          }
          v80 = v104;
          break;
        }
        case 2:
          {
          int v109 = 28;
          int v110 = v109 + v66;
          int v111 = v65[v110];
          int v112 = 0;
          bool v113 = v111 != v112;
          int v114;
          if (v113) {
            int v115 = 2;
            int v116 = v66 + v115;
            v114 = v116;
          } else {
            int v117 = 2;
            v114 = v117;
          }
          v80 = v114;
          break;
        }
      }
      bool v118 = true;
      v76 = v80;
    }
    case 0:
      {
      int v119 = 32;
      int v120 = v119 + v66;
      int v121 = v65[v120];
      int v122 = 0;
      bool v123 = v121 != v122;
      int v124;
      if (v123) {
        int v125 = 0;
        int v126 = 0;
        int v127;
        int v128;
        v127 = v125;
        v128 = v126;
        while (true) {
          int v129 = 4;
          int v130 = v128 * v129;
          int v131 = v130 + v66;
          int v132 = 36;
          int v133 = v132 + v131;
          int v134 = v65[v133];
          int v135 = 0;
          bool v136 = v134 != v135;
          v127 = v127;
          v128 = v128;
          if (!v136) break;
          int v137 = v127 + v128;
          int v138 = 1;
          int v139 = v128 + v138;
          bool v140 = true;
          v127 = v137;
          v128 = v139;
        }
        v124 = v127;
      } else {
        int v141 = 1;
        int v142 = v66 + v141;
        v124 = v142;
      }
      v76 = v124;
      break;
    }
  }
  int v143 = 0;
  int v144 = 0;
  int v145;
  int v146;
  v145 = v143;
  v146 = v144;
  while (true) {
    int v147 = 4;
    int v148 = v146 * v147;
    int v149 = v148 + v66;
    int v150 = 56;
    int v151 = v150 + v149;
    int v152 = v65[v151];
    int v153 = 0;
    bool v154 = v152 != v153;
    v145 = v145;
    v146 = v146;
    if (!v154) break;
    int v155 = 0;
    int v156 = 0;
    int v157;
    int v158;
    v157 = v155;
    v158 = v156;
    while (true) {
      int v159 = 4;
      int v160 = v158 * v159;
      int v161 = v160 + v66;
      int v162 = 76;
      int v163 = v162 + v161;
      int v164 = v65[v163];
      int v165 = 0;
      bool v166 = v164 != v165;
      v157 = v157;
      v158 = v158;
      if (!v166) break;
      int v167 = 96;
      int v168 = v167 + v66;
      int v169 = v65[v168];
      int v170 = 4;
      int v171;
      v171 = v170;
      switch (v169) {
        default:
          {
          int v172 = 3;
          int v173 = v66 + v172;
          v171 = v173;
          break;
        }
        case 0:
          {
          int v174 = 0;
          int v175 = v66 + v174;
          v171 = v175;
          break;
        }
        case 1:
          {
          int v176 = 3;
          v171 = v176;
          break;
        }
        case 2:
          {
          v171 = v66;
          break;
        }
      }
      int v177 = v157 + v171;
      int v178 = 1;
      int v179 = v158 + v178;
      bool v180 = true;
      int v181 = 48;
      int v182 = 4;
      int v183 = v158 * v182;
      int v184 = v181 + v183;
      int v185 = v184 + v66;
      bool v186 = true;
      int v187 = simt_wave_count_bits(v186);
      v64[v185] = v187;
      v157 = v177;
      v158 = v179;
      continue;
      ;
    }
    int v188 = v145 + v157;
    int v189 = 1;
    int v190 = v146 + v189;
    bool v191 = true;
    int v192 = 64;
    int v193 = 4;
    int v194 = v146 * v193;
    int v195 = v192 + v194;
    int v196 = v195 + v66;
    bool v197 = true;
    int v198 = simt_wave_count_bits(v197);
    v64[v196] = v198;
    v145 = v188;
    v146 = v190;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 75; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 100; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
