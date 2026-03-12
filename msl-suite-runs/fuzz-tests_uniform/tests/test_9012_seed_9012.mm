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
    int v14 = 0;
    int v15;
    int v16;
    v15 = v13;
    v16 = v14;
    while (true) {
      int v17 = 4;
      int v18 = v3 % v17;
      int v19 = 1;
      int v20 = v18 + v19;
      bool v21 = v16 < v20;
      v15 = v15;
      v16 = v16;
      if (!v21) break;
      int v22 = 3;
      int v23 = v3 % v22;
      int v24;
      v24 = v0;
      switch (v23) {
        case 0:
          {
          int v25 = 0;
          int v26 = v0 + v25;
          v24 = v26;
          break;
        }
        case 1:
          {
          int v27 = 2;
          v24 = v27;
          break;
        }
        default:
          {
          int v28 = 4;
          v24 = v28;
          break;
        }
      }
      int v29 = 1;
      int v30 = v16 + v29;
      v15 = v24;
      v16 = v30;
    }
    int v31 = 3;
    int v32 = v0 + v31;
    int v33 = 1;
    int v34 = v7 + v33;
    v6 = v15;
    v7 = v34;
  }
  bool v35 = true;
  int v36 = simt_wave_count_bits(v35);
  int v37 = 0;
  int v38 = v37 + v0;
  v1[v38] = v36;
  return;
}

kernel void kernel_main(device int* v39 [[buffer(0)]], device int* v40 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v41 = static_cast<int>(__simt_tid3.x);
  int v42 = 0;
  int v43 = v42 + v41;
  int v44 = v40[v43];
  int v45 = 4;
  int v46 = v45 + v41;
  int v47 = v40[v46];
  helper0(v41, v39, v44, v47, static_cast<int>(__simt_tid3.x));
  int v48 = 0;
  int v49 = 0;
  int v50;
  int v51;
  v50 = v48;
  v51 = v49;
  while (true) {
    int v52 = 4;
    int v53 = v51 * v52;
    int v54 = v53 + v41;
    int v55 = 8;
    int v56 = v55 + v54;
    int v57 = v40[v56];
    int v58 = 0;
    bool v59 = v57 != v58;
    v50 = v50;
    v51 = v51;
    if (!v59) break;
    int v60 = v50 + v51;
    int v61 = 1;
    int v62 = v51 + v61;
    v50 = v60;
    v51 = v62;
  }
  bool v63 = true;
  int v64 = 16;
  int v65 = v64 + v41;
  bool v66 = true;
  int v67 = simt_wave_count_bits(v66);
  v39[v65] = v67;
  int v68 = 28;
  int v69 = v68 + v41;
  int v70 = v40[v69];
  int v71 = 2;
  int v72;
  v72 = v71;
  switch (v70) {
    case 0:
      {
      int v73 = 32;
      int v74 = v73 + v41;
      int v75 = v40[v74];
      int v76;
      v76 = v41;
      switch (v75) {
        case 0:
          {
          int v77 = 36;
          int v78 = v77 + v41;
          int v79 = v40[v78];
          int v80 = 0;
          bool v81 = v79 != v80;
          int v82;
          if (v81) {
            int v83 = 1;
            v82 = v83;
          } else {
            int v84 = 3;
            v82 = v84;
          }
          v76 = v82;
          break;
        }
        case 1:
          {
          int v85 = 40;
          int v86 = v85 + v41;
          int v87 = v40[v86];
          int v88 = 0;
          bool v89 = v87 != v88;
          int v90;
          if (v89) {
            int v91 = 2;
            int v92 = v41 + v91;
            v90 = v92;
          } else {
            v90 = v41;
          }
          v76 = v90;
          break;
        }
        case 2:
          {
          int v93 = 44;
          int v94 = v93 + v41;
          int v95 = v40[v94];
          int v96 = 0;
          int v97 = v41 + v96;
          int v98;
          v98 = v97;
          switch (v95) {
            case 0:
              {
              v98 = v41;
              break;
            }
            default:
              {
              v98 = v41;
              break;
            }
            case 1:
              {
              v98 = v41;
              break;
            }
            case 2:
              {
              v98 = v41;
              break;
            }
          }
          bool v99 = true;
          v76 = v98;
          break;
        }
        default:
          {
          int v100 = 0;
          int v101 = 0;
          int v102;
          int v103;
          v102 = v100;
          v103 = v101;
          while (true) {
            int v104 = 4;
            int v105 = v103 * v104;
            int v106 = v105 + v41;
            int v107 = 48;
            int v108 = v107 + v106;
            int v109 = v40[v108];
            int v110 = 0;
            bool v111 = v109 != v110;
            v102 = v102;
            v103 = v103;
            if (!v111) break;
            int v112 = v102 + v103;
            int v113 = 1;
            int v114 = v103 + v113;
            v102 = v112;
            v103 = v114;
            continue;
            ;
          }
          bool v115 = true;
          v76 = v102;
          break;
        }
      }
      bool v116 = true;
      v72 = v76;
      break;
    }
    case 1:
      {
      int v117 = 0;
      int v118 = 0;
      int v119;
      int v120;
      v119 = v117;
      v120 = v118;
      while (true) {
        int v121 = 4;
        int v122 = v120 * v121;
        int v123 = v122 + v41;
        int v124 = 68;
        int v125 = v124 + v123;
        int v126 = v40[v125];
        int v127 = 0;
        bool v128 = v126 != v127;
        v119 = v119;
        v120 = v120;
        if (!v128) break;
        int v129 = v119 + v120;
        int v130 = 1;
        int v131 = v120 + v130;
        v119 = v129;
        v120 = v131;
        break;
        ;
      }
      bool v132 = true;
      v72 = v119;
      break;
    }
    case 2:
      {
      int v133 = 88;
      int v134 = v133 + v41;
      int v135 = v40[v134];
      int v136;
      v136 = v41;
      switch (v135) {
        case 0:
          {
          int v137 = 92;
          int v138 = v137 + v41;
          int v139 = v40[v138];
          int v140 = 3;
          int v141;
          v141 = v140;
          switch (v139) {
            case 0:
              {
              int v142 = 0;
              int v143 = v41 + v142;
              v141 = v143;
              break;
            }
            case 1:
              {
              int v144 = 0;
              v141 = v144;
            }
            default:
              {
              v141 = v41;
              break;
            }
            case 2:
              {
              int v145 = 1;
              int v146 = v41 + v145;
              v141 = v146;
              break;
            }
          }
          bool v147 = true;
          v136 = v141;
        }
        case 1:
          {
          int v148 = 96;
          int v149 = v148 + v41;
          int v150 = v40[v149];
          int v151 = 0;
          bool v152 = v150 != v151;
          int v153;
          if (v152) {
            int v154 = 1;
            v153 = v154;
          } else {
            int v155 = 4;
            v153 = v155;
          }
          v136 = v153;
        }
        case 2:
          {
          int v156 = 100;
          int v157 = v156 + v41;
          int v158 = v40[v157];
          int v159;
          v159 = v41;
          switch (v158) {
            default:
              {
              v159 = v41;
              break;
            }
            case 0:
              {
              int v160 = 1;
              int v161 = v41 + v160;
              v159 = v161;
              break;
            }
            case 1:
              {
              int v162 = 4;
              int v163 = v41 + v162;
              v159 = v163;
              break;
            }
            case 2:
              {
              v159 = v41;
              break;
            }
          }
          bool v164 = true;
          v136 = v159;
        }
        default:
          {
          int v165 = 104;
          int v166 = v165 + v41;
          int v167 = v40[v166];
          int v168 = 0;
          bool v169 = v167 != v168;
          int v170;
          if (v169) {
            int v171 = 1;
            int v172 = v41 + v171;
            v170 = v172;
          } else {
            int v173 = 1;
            v170 = v173;
          }
          v136 = v170;
          break;
        }
      }
      bool v174 = true;
      v72 = v136;
      break;
    }
    default:
      {
      int v175 = 0;
      int v176 = 0;
      int v177;
      int v178;
      v177 = v175;
      v178 = v176;
      while (true) {
        int v179 = 4;
        int v180 = v178 * v179;
        int v181 = v180 + v41;
        int v182 = 108;
        int v183 = v182 + v181;
        int v184 = v40[v183];
        int v185 = 0;
        bool v186 = v184 != v185;
        v177 = v177;
        v178 = v178;
        if (!v186) break;
        int v187 = v177 + v178;
        int v188 = 1;
        int v189 = v178 + v188;
        v177 = v187;
        v178 = v189;
      }
      bool v190 = true;
      v72 = v177;
      break;
    }
  }
  bool v191 = true;
  int v192 = 32;
  int v193 = v192 + v41;
  bool v194 = true;
  int v195 = simt_wave_count_bits(v194);
  v39[v193] = v195;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 128; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
