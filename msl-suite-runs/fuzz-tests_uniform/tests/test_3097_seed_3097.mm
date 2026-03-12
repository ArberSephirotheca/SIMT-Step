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
  int v5 = v0 + v4;
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v3) {
    default:
      {
      int v9 = 2;
      int v10 = v0 + v9;
      int v11;
      v11 = v10;
      switch (v3) {
        case 0:
          {
          int v12 = 0;
          bool v13 = v2 != v12;
          int v14;
          if (v13) {
            v14 = v0;
          } else {
            int v15 = 0;
            int v16 = v0 + v15;
            v14 = v16;
          }
          int v17 = 4;
          v11 = v14;
          break;
        }
        default:
          {
          int v18 = 3;
          int v19 = v3 % v18;
          int v20 = 4;
          int v21;
          v21 = v20;
          switch (v19) {
            case 0:
              {
              int v22 = 2;
              int v23 = v0 + v22;
              v21 = v23;
            }
            default:
              {
              v21 = v0;
              break;
            }
            case 1:
              {
              int v24 = 3;
              int v25 = v0 + v24;
              v21 = v25;
              break;
            }
          }
          v11 = v21;
          break;
        }
      }
      v8 = v11;
      break;
    }
    case 0:
      {
      int v26 = 2;
      int v27 = v3 % v26;
      int v28 = 1;
      int v29 = v0 + v28;
      int v30;
      v30 = v29;
      switch (v27) {
        case 0:
          {
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
            int v41 = 1;
            int v42 = v34 + v41;
            v33 = v40;
            v34 = v42;
            continue;
            ;
          }
          int v43 = 1;
          int v44 = v0 + v43;
          v30 = v33;
        }
        case 1:
          {
          int v45 = 2;
          int v46 = v3 % v45;
          int v47 = 4;
          int v48;
          v48 = v47;
          switch (v46) {
            default:
              {
              v48 = v0;
              break;
            }
            case 0:
              {
              v48 = v0;
              break;
            }
          }
          int v49 = 2;
          int v50 = v0 + v49;
          v30 = v48;
          break;
        }
        default:
          {
          int v51 = 0;
          int v52 = 0;
          int v53;
          int v54;
          v53 = v51;
          v54 = v52;
          while (true) {
            int v55 = 4;
            int v56 = v3 % v55;
            int v57 = 1;
            int v58 = v56 + v57;
            bool v59 = v54 < v58;
            v53 = v53;
            v54 = v54;
            if (!v59) break;
            int v60 = 1;
            int v61 = 1;
            int v62 = v54 + v61;
            v53 = v60;
            v54 = v62;
            continue;
            ;
          }
          v30 = v53;
          break;
        }
      }
      int v63 = 4;
      v8 = v30;
      break;
    }
  }
  bool v64 = true;
  int v65 = simt_wave_count_bits(v64);
  int v66 = 0;
  int v67 = v66 + v0;
  v1[v67] = v65;
  int v68 = 0;
  bool v69 = v2 != v68;
  int v70 = v69 ? v5 : v8;
  return;
}

kernel void kernel_main(device int* v71 [[buffer(0)]], device int* v72 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v73 = static_cast<int>(__simt_tid3.x);
  int v74 = 0;
  int v75 = v74 + v73;
  int v76 = v72[v75];
  int v77 = 4;
  int v78 = v77 + v73;
  int v79 = v72[v78];
  helper0(v73, v71, v76, v79, static_cast<int>(__simt_tid3.x));
  uint v80 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v81 = (int)(v80);
  int v82 = 0;
  int v83 = 0;
  int v84;
  int v85;
  v84 = v82;
  v85 = v83;
  while (true) {
    int v86 = 4;
    int v87 = v85 * v86;
    int v88 = v87 + v73;
    int v89 = 8;
    int v90 = v89 + v88;
    int v91 = v72[v90];
    int v92 = 0;
    bool v93 = v91 != v92;
    v84 = v84;
    v85 = v85;
    if (!v93) break;
    int v94 = 0;
    int v95 = 0;
    int v96;
    int v97;
    v96 = v94;
    v97 = v95;
    while (true) {
      int v98 = 4;
      int v99 = v97 * v98;
      int v100 = v99 + v73;
      int v101 = 28;
      int v102 = v101 + v100;
      int v103 = v72[v102];
      int v104 = 0;
      bool v105 = v103 != v104;
      v96 = v96;
      v97 = v97;
      if (!v105) break;
      uint v106 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v107 = (int)(v106);
      int v108 = v96 + v107;
      int v109 = 1;
      int v110 = v97 + v109;
      v96 = v108;
      v97 = v110;
      break;
      ;
    }
    bool v111 = true;
    int v112 = v84 + v96;
    int v113 = 1;
    int v114 = v85 + v113;
    v84 = v112;
    v85 = v114;
  }
  bool v115 = true;
  int v116 = 16;
  int v117 = v116 + v73;
  bool v118 = true;
  int v119 = simt_wave_count_bits(v118);
  v71[v117] = v119;
  int v120 = 48;
  int v121 = v120 + v73;
  int v122 = v72[v121];
  int v123 = 0;
  bool v124 = v122 != v123;
  int v125;
  if (v124) {
    int v126 = 52;
    int v127 = v126 + v73;
    int v128 = v72[v127];
    int v129 = 0;
    bool v130 = v128 != v129;
    int v131;
    if (v130) {
      int v132 = 56;
      int v133 = v132 + v73;
      int v134 = v72[v133];
      int v135 = 0;
      bool v136 = v134 != v135;
      int v137;
      if (v136) {
        int v138 = 3;
        v137 = v138;
      } else {
        uint v139 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v140 = (int)(v139);
        v137 = v140;
      }
      v131 = v137;
    } else {
      int v141 = 60;
      int v142 = v141 + v73;
      int v143 = v72[v142];
      int v144 = 3;
      int v145 = v73 + v144;
      int v146;
      v146 = v145;
      switch (v143) {
        case 0:
          {
          int v147 = 0;
          v146 = v147;
          break;
        }
        case 1:
          {
          v146 = v73;
          break;
        }
        default:
          {
          v146 = v73;
          break;
        }
      }
      bool v148 = true;
      v131 = v146;
    }
    v125 = v131;
  } else {
    int v149 = 64;
    int v150 = v149 + v73;
    int v151 = v72[v150];
    int v152 = 0;
    bool v153 = v151 != v152;
    int v154;
    if (v153) {
      int v155 = 68;
      int v156 = v155 + v73;
      int v157 = v72[v156];
      int v158 = 0;
      bool v159 = v157 != v158;
      int v160;
      if (v159) {
        int v161 = 1;
        v160 = v161;
      } else {
        uint v162 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v163 = (int)(v162);
        v160 = v163;
      }
      v154 = v160;
    } else {
      int v164 = 72;
      int v165 = v164 + v73;
      int v166 = v72[v165];
      int v167 = 4;
      int v168 = v73 + v167;
      int v169;
      v169 = v168;
      switch (v166) {
        case 0:
          {
          int v170 = 3;
          int v171 = v73 + v170;
          v169 = v171;
          break;
        }
        case 1:
          {
          v169 = v73;
          break;
        }
        case 2:
          {
          int v172 = 0;
          v169 = v172;
          break;
        }
        default:
          {
          v169 = v73;
          break;
        }
      }
      bool v173 = true;
      v154 = v169;
    }
    v125 = v154;
  }
  int v174 = 32;
  int v175 = v174 + v73;
  bool v176 = true;
  int v177 = simt_wave_count_bits(v176);
  v71[v175] = v177;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 76; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
