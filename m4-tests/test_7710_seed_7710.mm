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
    int v7 = 0;
    int v8 = 0;
    int v9;
    int v10;
    v9 = v7;
    v10 = v8;
    while (true) {
      int v11 = 4;
      int v12 = v3 % v11;
      int v13 = 1;
      int v14 = v12 + v13;
      bool v15 = v10 < v14;
      v9 = v9;
      v10 = v10;
      if (!v15) break;
      bool v16 = true;
      int v17 = simt_wave_count_bits(v16);
      int v18 = 0;
      int v19 = 4;
      int v20 = v10 * v19;
      int v21 = v18 + v20;
      int v22 = v21 + v0;
      v1[v22] = v17;
      int v23 = 1;
      int v24 = v10 + v23;
      v9 = v17;
      v10 = v24;
    }
    v6 = v9;
  } else {
    int v25 = 0;
    bool v26 = v2 != v25;
    int v27;
    if (v26) {
      int v28 = 0;
      bool v29 = v2 != v28;
      int v30;
      if (v29) {
        bool v31 = true;
        int v32 = simt_wave_count_bits(v31);
        int v33 = 16;
        int v34 = v33 + v0;
        v1[v34] = v32;
        v30 = v32;
      } else {
        bool v35 = true;
        int v36 = simt_wave_count_bits(v35);
        int v37 = 32;
        int v38 = v37 + v0;
        v1[v38] = v36;
        v30 = v36;
      }
      v27 = v30;
    } else {
      int v39 = 2;
      int v40 = v3 % v39;
      uint v41 = simt_subgroup_id(__simt_tid);
      int v42 = (int)(v41);
      int v43;
      v43 = v42;
      switch (v40) {
        case 0:
          {
          int v44 = 4;
          int v45 = v0 + v44;
          v43 = v45;
          break;
        }
        case 1:
          {
          v43 = v0;
          break;
        }
        default:
          {
          v43 = v0;
          break;
        }
      }
      bool v46 = true;
      int v47 = simt_wave_count_bits(v46);
      int v48 = 48;
      int v49 = v48 + v0;
      v1[v49] = v47;
      v27 = v43;
    }
    v6 = v27;
  }
  return;
}

kernel void kernel_main(device int* v50 [[buffer(0)]], device int* v51 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v52 = static_cast<int>(__simt_tid3.x);
  int v53 = 0;
  int v54 = v53 + v52;
  int v55 = v51[v54];
  int v56 = 4;
  int v57 = v56 + v52;
  int v58 = v51[v57];
  int v59 = 0;
  bool v60 = v55 != v59;
  if (v60) {
    int v61 = 8;
    int v62 = v61 + v52;
    int v63 = v51[v62];
    int v64 = 0;
    bool v65 = v63 != v64;
    if (v65) {
      uint v66 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v67 = (int)(v66);
      int v68;
      v68 = v67;
      switch (v52) {
        default:
          {
          int v69 = 4;
          int v70 = v68 + v69;
          v68 = v70;
          break;
        }
        case 0:
          {
          int v71 = 3;
          int v72 = v68 + v71;
          v68 = v72;
          break;
        }
      }
      helper0(v52, v50, v55, v58, static_cast<int>(__simt_tid3.x));
    } else {
    }
  } else {
  }
  uint v73 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v74 = (int)(v73);
  int v75 = 12;
  int v76 = v75 + v52;
  int v77 = v51[v76];
  int v78 = 2;
  int v79 = v52 + v78;
  int v80;
  v80 = v79;
  switch (v77) {
    default:
      {
      int v81 = 16;
      int v82 = v81 + v52;
      int v83 = v51[v82];
      int v84 = 3;
      int v85 = v52 + v84;
      int v86;
      v86 = v85;
      switch (v83) {
        case 0:
          {
          int v87 = 1;
          int v88 = v52 + v87;
          v86 = v88;
        }
        case 1:
          {
          int v89 = 20;
          int v90 = v89 + v52;
          int v91 = v51[v90];
          int v92 = 0;
          bool v93 = v91 != v92;
          int v94;
          if (v93) {
            int v95 = 1;
            v94 = v95;
          } else {
            int v96 = 2;
            v94 = v96;
          }
          v86 = v94;
        }
        default:
          {
          int v97 = 24;
          int v98 = v97 + v52;
          int v99 = v51[v98];
          int v100 = 0;
          int v101 = v52 + v100;
          int v102;
          v102 = v101;
          switch (v99) {
            case 0:
              {
              int v103 = 0;
              v102 = v103;
              break;
            }
            default:
              {
              v102 = v52;
              break;
            }
            case 1:
              {
              v102 = v52;
              break;
            }
          }
          v86 = v102;
          break;
        }
        case 2:
          {
          int v104 = 0;
          int v105 = 0;
          int v106;
          int v107;
          v106 = v104;
          v107 = v105;
          while (true) {
            int v108 = 4;
            int v109 = v107 * v108;
            int v110 = v109 + v52;
            int v111 = 28;
            int v112 = v111 + v110;
            int v113 = v51[v112];
            int v114 = 0;
            bool v115 = v113 != v114;
            v106 = v106;
            v107 = v107;
            if (!v115) break;
            int v116 = v106 + v107;
            int v117 = 1;
            int v118 = v107 + v117;
            bool v119 = true;
            v106 = v116;
            v107 = v118;
          }
          v86 = v106;
          break;
        }
      }
      v80 = v86;
      break;
    }
    case 0:
      {
      int v120 = 48;
      int v121 = v120 + v52;
      int v122 = v51[v121];
      int v123 = 2;
      int v124 = v52 + v123;
      int v125;
      v125 = v124;
      switch (v122) {
        case 0:
          {
          v125 = v52;
          break;
        }
        default:
          {
          int v126 = 52;
          int v127 = v126 + v52;
          int v128 = v51[v127];
          int v129 = 1;
          int v130;
          v130 = v129;
          switch (v128) {
            default:
              {
              int v131 = 2;
              v130 = v131;
              break;
            }
            case 0:
              {
              int v132 = 1;
              v130 = v132;
              break;
            }
          }
          v125 = v130;
          break;
        }
        case 1:
          {
          int v133 = 56;
          int v134 = v133 + v52;
          int v135 = v51[v134];
          int v136 = 0;
          bool v137 = v135 != v136;
          int v138;
          if (v137) {
            v138 = v52;
          } else {
            int v139 = 2;
            v138 = v139;
          }
          v125 = v138;
          break;
        }
      }
      bool v140 = true;
      v80 = v125;
    }
    case 1:
      {
      int v141 = 60;
      int v142 = v141 + v52;
      int v143 = v51[v142];
      int v144 = 0;
      bool v145 = v143 != v144;
      int v146;
      if (v145) {
        int v147 = 0;
        int v148 = 0;
        int v149;
        int v150;
        v149 = v147;
        v150 = v148;
        while (true) {
          int v151 = 4;
          int v152 = v150 * v151;
          int v153 = v152 + v52;
          int v154 = 64;
          int v155 = v154 + v153;
          int v156 = v51[v155];
          int v157 = 0;
          bool v158 = v156 != v157;
          v149 = v149;
          v150 = v150;
          if (!v158) break;
          int v159 = v149 + v150;
          int v160 = 1;
          int v161 = v150 + v160;
          bool v162 = true;
          v149 = v159;
          v150 = v161;
          break;
          ;
        }
        v146 = v149;
      } else {
        int v163 = 84;
        int v164 = v163 + v52;
        int v165 = v51[v164];
        int v166 = 0;
        bool v167 = v165 != v166;
        int v168;
        if (v167) {
          int v169 = 3;
          v168 = v169;
        } else {
          v168 = v52;
        }
        v146 = v168;
      }
      v80 = v146;
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
    static int32_t expected0[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 9; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 88; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
