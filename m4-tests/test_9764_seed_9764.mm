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
  int v4 = 4;
  int v5 = v3 % v4;
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 4;
      v8 = v9;
      break;
    }
    case 0:
      {
      int v10 = 0;
      int v11 = 0;
      int v12;
      int v13;
      v12 = v10;
      v13 = v11;
      while (true) {
        int v14 = 4;
        int v15 = v3 % v14;
        int v16 = 1;
        int v17 = v15 + v16;
        bool v18 = v13 < v17;
        v12 = v12;
        v13 = v13;
        if (!v18) break;
        int v19 = 0;
        bool v20 = v2 != v19;
        int v21;
        if (v20) {
          int v22 = 1;
          int v23 = v0 + v22;
          v21 = v23;
        } else {
          int v24 = 1;
          int v25 = v0 + v24;
          v21 = v25;
        }
        int v26 = 1;
        int v27 = v13 + v26;
        v12 = v21;
        v13 = v27;
      }
      v8 = v12;
      break;
    }
    case 1:
      {
      int v28 = 4;
      int v29 = v3 % v28;
      int v30 = 0;
      int v31;
      v31 = v30;
      switch (v29) {
        case 0:
          {
          int v32 = 0;
          bool v33 = v2 != v32;
          int v34;
          if (v33) {
            int v35 = 2;
            v34 = v35;
          } else {
            int v36 = 2;
            int v37 = v0 + v36;
            v34 = v37;
          }
          v31 = v34;
        }
        default:
          {
          int v38 = 0;
          int v39 = 0;
          int v40;
          int v41;
          v40 = v38;
          v41 = v39;
          while (true) {
            int v42 = 4;
            int v43 = v3 % v42;
            int v44 = 1;
            int v45 = v43 + v44;
            bool v46 = v41 < v45;
            v40 = v40;
            v41 = v41;
            if (!v46) break;
            int v47 = 1;
            int v48 = v41 + v47;
            v40 = v0;
            v41 = v48;
            continue;
            ;
          }
          v31 = v40;
        }
        case 1:
          {
          int v49 = 4;
          int v50 = v3 % v49;
          int v51 = 0;
          int v52 = v0 + v51;
          int v53;
          v53 = v52;
          switch (v50) {
            default:
              {
              int v54 = 2;
              int v55 = v0 + v54;
              v53 = v55;
              break;
            }
            case 0:
              {
              v53 = v0;
              break;
            }
            case 1:
              {
              v53 = v0;
              break;
            }
            case 2:
              {
              v53 = v0;
              break;
            }
          }
          int v56 = 3;
          int v57 = v0 + v56;
          v31 = v53;
        }
        case 2:
          {
          int v58 = 3;
          int v59 = v3 % v58;
          int v60 = 2;
          int v61;
          v61 = v60;
          switch (v59) {
            case 0:
              {
              int v62 = 3;
              int v63 = v0 + v62;
              v61 = v63;
              break;
            }
            default:
              {
              v61 = v0;
              break;
            }
            case 1:
              {
              int v64 = 2;
              v61 = v64;
              break;
            }
          }
          v31 = v61;
          break;
        }
      }
      int v65 = 0;
      v8 = v31;
      break;
    }
    case 2:
      {
      int v66 = 4;
      int v67 = v3 % v66;
      int v68;
      v68 = v0;
      switch (v67) {
        case 0:
          {
          int v69 = 4;
          int v70 = v3 % v69;
          int v71;
          v71 = v0;
          switch (v70) {
            default:
              {
              int v72 = 3;
              int v73 = v0 + v72;
              v71 = v73;
              break;
            }
            case 0:
              {
              int v74 = 3;
              v71 = v74;
              break;
            }
            case 1:
              {
              int v75 = 3;
              v71 = v75;
              break;
            }
            case 2:
              {
              int v76 = 0;
              int v77 = v0 + v76;
              v71 = v77;
              break;
            }
          }
          int v78 = 1;
          v68 = v71;
          break;
        }
        case 1:
          {
          int v79 = 0;
          int v80 = 0;
          int v81;
          int v82;
          v81 = v79;
          v82 = v80;
          while (true) {
            int v83 = 4;
            int v84 = v3 % v83;
            int v85 = 1;
            int v86 = v84 + v85;
            bool v87 = v82 < v86;
            v81 = v81;
            v82 = v82;
            if (!v87) break;
            int v88 = 2;
            int v89 = 1;
            int v90 = v82 + v89;
            v81 = v88;
            v82 = v90;
          }
          v68 = v81;
          break;
        }
        default:
          {
          int v91 = 0;
          bool v92 = v2 != v91;
          int v93;
          if (v92) {
            v93 = v0;
          } else {
            v93 = v0;
          }
          v68 = v93;
          break;
        }
        case 2:
          {
          int v94 = 3;
          int v95 = v3 % v94;
          int v96 = 0;
          int v97;
          v97 = v96;
          switch (v95) {
            case 0:
              {
              int v98 = 1;
              v97 = v98;
            }
            default:
              {
              v97 = v0;
            }
            case 1:
              {
              v97 = v0;
              break;
            }
            case 2:
              {
              int v99 = 3;
              v97 = v99;
              break;
            }
          }
          int v100 = 3;
          int v101 = v0 + v100;
          v68 = v97;
          break;
        }
      }
      int v102 = 3;
      v8 = v68;
      break;
    }
  }
  bool v103 = true;
  int v104 = simt_wave_count_bits(v103);
  int v105 = 0;
  int v106 = v105 + v0;
  v1[v106] = v104;
  return;
}

kernel void kernel_main(device int* v107 [[buffer(0)]], device int* v108 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v109 = static_cast<int>(__simt_tid3.x);
  int v110 = 0;
  int v111 = v110 + v109;
  int v112 = v108[v111];
  int v113 = 4;
  int v114 = v113 + v109;
  int v115 = v108[v114];
  helper0(v109, v107, v112, v115, static_cast<int>(__simt_tid3.x));
  uint v116 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v117 = (int)(v116);
  int v118 = 8;
  int v119 = v118 + v109;
  int v120 = v108[v119];
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
      int v130 = v129 + v109;
      int v131 = 12;
      int v132 = v131 + v130;
      int v133 = v108[v132];
      int v134 = 0;
      bool v135 = v133 != v134;
      v126 = v126;
      v127 = v127;
      if (!v135) break;
      int v136 = 32;
      int v137 = v136 + v109;
      int v138 = v108[v137];
      int v139 = 0;
      bool v140 = v138 != v139;
      int v141;
      if (v140) {
        int v142 = 2;
        v141 = v142;
      } else {
        uint v143 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v144 = (int)(v143);
        v141 = v144;
      }
      int v145 = 16;
      int v146 = v145 + v109;
      bool v147 = true;
      int v148 = simt_wave_count_bits(v147);
      v107[v146] = v148;
      int v149 = v126 + v141;
      int v150 = 1;
      int v151 = v127 + v150;
      bool v152 = true;
      int v153 = 32;
      int v154 = 4;
      int v155 = v127 * v154;
      int v156 = v153 + v155;
      int v157 = v156 + v109;
      bool v158 = true;
      int v159 = simt_wave_count_bits(v158);
      v107[v157] = v159;
      v126 = v149;
      v127 = v151;
    }
    v123 = v126;
  } else {
    int v160 = 0;
    int v161 = 0;
    int v162;
    int v163;
    v162 = v160;
    v163 = v161;
    while (true) {
      int v164 = 4;
      int v165 = v163 * v164;
      int v166 = v165 + v109;
      int v167 = 36;
      int v168 = v167 + v166;
      int v169 = v108[v168];
      int v170 = 0;
      bool v171 = v169 != v170;
      v162 = v162;
      v163 = v163;
      if (!v171) break;
      int v172 = v162 + v163;
      int v173 = 1;
      int v174 = v163 + v173;
      bool v175 = true;
      int v176 = 48;
      int v177 = 4;
      int v178 = v163 * v177;
      int v179 = v176 + v178;
      int v180 = v179 + v109;
      bool v181 = true;
      int v182 = simt_wave_count_bits(v181);
      v107[v180] = v182;
      v162 = v172;
      v163 = v174;
    }
    v123 = v162;
  }
  int v183 = 64;
  int v184 = v183 + v109;
  bool v185 = true;
  int v186 = simt_wave_count_bits(v185);
  v107[v184] = v186;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 56; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
