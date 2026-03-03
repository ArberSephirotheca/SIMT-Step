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
  int v6;
  v6 = v0;
  switch (v5) {
    default:
      {
      int v7 = 4;
      int v8 = v3 % v7;
      int v9 = 1;
      int v10;
      v10 = v9;
      switch (v8) {
        case 0:
          {
          int v11 = 0;
          bool v12 = v2 != v11;
          int v13;
          if (v12) {
            int v14 = 2;
            v13 = v14;
          } else {
            v13 = v0;
          }
          int v15 = 4;
          int v16 = v0 + v15;
          v10 = v13;
          break;
        }
        case 1:
          {
          int v17 = 2;
          v10 = v17;
        }
        default:
          {
          int v18 = 0;
          int v19 = 0;
          int v20;
          int v21;
          v20 = v18;
          v21 = v19;
          while (true) {
            int v22 = 4;
            int v23 = v3 % v22;
            int v24 = 1;
            int v25 = v23 + v24;
            bool v26 = v21 < v25;
            v20 = v20;
            v21 = v21;
            if (!v26) break;
            int v27 = 0;
            int v28 = v0 + v27;
            int v29 = 1;
            int v30 = v21 + v29;
            v20 = v28;
            v21 = v30;
            break;
            ;
          }
          int v31 = 0;
          int v32 = v0 + v31;
          v10 = v20;
        }
        case 2:
          {
          v10 = v0;
          break;
        }
      }
      int v33 = 4;
      v6 = v10;
    }
    case 0:
      {
      int v34 = 2;
      int v35 = v3 % v34;
      int v36 = 4;
      int v37;
      v37 = v36;
      switch (v35) {
        case 0:
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
            int v48 = v0 + v47;
            int v49 = 1;
            int v50 = v41 + v49;
            v40 = v48;
            v41 = v50;
            break;
            ;
          }
          int v51 = 3;
          int v52 = v0 + v51;
          v37 = v40;
          break;
        }
        case 1:
          {
          int v53 = 2;
          int v54 = v3 % v53;
          int v55 = 2;
          int v56 = v0 + v55;
          int v57;
          v57 = v56;
          switch (v54) {
            default:
              {
              int v58 = 0;
              int v59 = v0 + v58;
              v57 = v59;
            }
            case 0:
              {
              int v60 = 1;
              int v61 = v0 + v60;
              v57 = v61;
              break;
            }
          }
          int v62 = 0;
          v37 = v57;
          break;
        }
        default:
          {
          int v63 = 0;
          bool v64 = v2 != v63;
          int v65;
          if (v64) {
            v65 = v0;
          } else {
            int v66 = 1;
            v65 = v66;
          }
          v37 = v65;
          break;
        }
      }
      int v67 = 1;
      int v68 = v0 + v67;
      v6 = v37;
      break;
    }
    case 1:
      {
      int v69 = 2;
      int v70;
      v70 = v69;
      switch (v3) {
        default:
          {
          int v71 = 0;
          bool v72 = v2 != v71;
          int v73;
          if (v72) {
            int v74 = 0;
            v73 = v74;
          } else {
            int v75 = 1;
            v73 = v75;
          }
          int v76 = 4;
          v70 = v73;
          break;
        }
        case 0:
          {
          int v77 = 3;
          int v78 = v3 % v77;
          int v79;
          v79 = v0;
          switch (v78) {
            default:
              {
              int v80 = 2;
              int v81 = v0 + v80;
              v79 = v81;
            }
            case 0:
              {
              int v82 = 4;
              v79 = v82;
            }
            case 1:
              {
              int v83 = 0;
              v79 = v83;
              break;
            }
          }
          v70 = v79;
          break;
        }
      }
      v6 = v70;
      break;
    }
    case 2:
      {
      int v84 = 2;
      v6 = v84;
      break;
    }
  }
  bool v85 = true;
  int v86 = simt_wave_count_bits(v85);
  int v87 = 0;
  int v88 = v87 + v0;
  v1[v88] = v86;
  return;
}

kernel void kernel_main(device int* v89 [[buffer(0)]], device int* v90 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v91 = static_cast<int>(__simt_tid3.x);
  int v92 = 0;
  int v93 = v92 + v91;
  int v94 = v90[v93];
  int v95 = 4;
  int v96 = v95 + v91;
  int v97 = v90[v96];
  helper0(v91, v89, v94, v97, static_cast<int>(__simt_tid3.x));
  int v98 = 8;
  int v99 = v98 + v91;
  int v100 = v90[v99];
  int v101;
  v101 = v91;
  switch (v100) {
    case 0:
      {
      int v102 = 1;
      v101 = v102;
      break;
    }
    default:
      {
      v101 = v91;
      break;
    }
  }
  bool v103 = true;
  int v104 = 16;
  int v105 = v104 + v91;
  bool v106 = true;
  int v107 = simt_wave_count_bits(v106);
  v89[v105] = v107;
  int v108 = 12;
  int v109 = v108 + v91;
  int v110 = v90[v109];
  int v111 = 0;
  bool v112 = v110 != v111;
  int v113;
  if (v112) {
    int v114 = 0;
    int v115 = 0;
    int v116;
    int v117;
    v116 = v114;
    v117 = v115;
    while (true) {
      int v118 = 4;
      int v119 = v117 * v118;
      int v120 = v119 + v91;
      int v121 = 16;
      int v122 = v121 + v120;
      int v123 = v90[v122];
      int v124 = 0;
      bool v125 = v123 != v124;
      v116 = v116;
      v117 = v117;
      if (!v125) break;
      int v126 = 36;
      int v127 = v126 + v91;
      int v128 = v90[v127];
      int v129 = 1;
      int v130;
      v130 = v129;
      switch (v128) {
        default:
          {
          int v131 = 0;
          v130 = v131;
          break;
        }
        case 0:
          {
          int v132 = 3;
          v130 = v132;
          break;
        }
        case 1:
          {
          int v133 = 3;
          int v134 = v91 + v133;
          v130 = v134;
          break;
        }
      }
      bool v135 = true;
      int v136 = v116 + v130;
      int v137 = 1;
      int v138 = v117 + v137;
      v116 = v136;
      v117 = v138;
    }
    bool v139 = true;
    v113 = v116;
  } else {
    int v140 = 40;
    int v141 = v140 + v91;
    int v142 = v90[v141];
    int v143 = 0;
    bool v144 = v142 != v143;
    int v145;
    if (v144) {
      v145 = v91;
    } else {
      int v146 = 44;
      int v147 = v146 + v91;
      int v148 = v90[v147];
      uint v149 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v150 = (int)(v149);
      int v151;
      v151 = v150;
      switch (v148) {
        case 0:
          {
          int v152 = 3;
          int v153 = v91 + v152;
          v151 = v153;
          break;
        }
        default:
          {
          int v154 = 0;
          int v155 = v91 + v154;
          v151 = v155;
          break;
        }
      }
      bool v156 = true;
      v145 = v151;
    }
    v113 = v145;
  }
  int v157 = 32;
  int v158 = v157 + v91;
  bool v159 = true;
  int v160 = simt_wave_count_bits(v159);
  v89[v158] = v160;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 48; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
