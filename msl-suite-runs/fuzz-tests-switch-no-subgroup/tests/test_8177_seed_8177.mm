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
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 2;
      int v10 = v3 % v9;
      int v11 = 1;
      int v12;
      v12 = v11;
      switch (v10) {
        default:
          {
          int v13 = 2;
          int v14 = v3 % v13;
          int v15 = 4;
          int v16 = v0 + v15;
          int v17;
          v17 = v16;
          switch (v14) {
            case 0:
              {
              int v18 = 2;
              v17 = v18;
              break;
            }
            case 1:
              {
              int v19 = 4;
              v17 = v19;
              break;
            }
            default:
              {
              int v20 = 0;
              v17 = v20;
              break;
            }
          }
          v12 = v17;
          break;
        }
        case 0:
          {
          int v21 = 4;
          int v22 = v3 % v21;
          int v23 = 3;
          int v24 = v0 + v23;
          int v25;
          v25 = v24;
          switch (v22) {
            case 0:
              {
              int v26 = 3;
              v25 = v26;
              break;
            }
            case 1:
              {
              int v27 = 2;
              v25 = v27;
              break;
            }
            default:
              {
              v25 = v0;
              break;
            }
            case 2:
              {
              v25 = v0;
              break;
            }
          }
          int v28 = 1;
          v12 = v25;
          break;
        }
      }
      v8 = v12;
      break;
    }
    case 0:
      {
      int v29 = 4;
      int v30 = v3 % v29;
      int v31 = 3;
      int v32;
      v32 = v31;
      switch (v30) {
        default:
          {
          int v33 = 0;
          int v34 = 0;
          int v35;
          int v36;
          v35 = v33;
          v36 = v34;
          while (true) {
            int v37 = 4;
            int v38 = v3 % v37;
            int v39 = 1;
            int v40 = v38 + v39;
            bool v41 = v36 < v40;
            v35 = v35;
            v36 = v36;
            if (!v41) break;
            int v42 = 1;
            int v43 = v36 + v42;
            v35 = v0;
            v36 = v43;
            break;
            ;
          }
          v32 = v35;
          break;
        }
        case 0:
          {
          int v44 = 0;
          bool v45 = v2 != v44;
          int v46;
          if (v45) {
            int v47 = 3;
            v46 = v47;
          } else {
            int v48 = 2;
            v46 = v48;
          }
          v32 = v46;
          break;
        }
        case 1:
          {
          int v49 = 4;
          int v50 = v3 % v49;
          int v51;
          v51 = v0;
          switch (v50) {
            case 0:
              {
              int v52 = 3;
              v51 = v52;
              break;
            }
            case 1:
              {
              int v53 = 1;
              v51 = v53;
              break;
            }
            default:
              {
              int v54 = 3;
              int v55 = v0 + v54;
              v51 = v55;
              break;
            }
            case 2:
              {
              v51 = v0;
              break;
            }
          }
          v32 = v51;
          break;
        }
        case 2:
          {
          int v56 = 0;
          bool v57 = v2 != v56;
          int v58;
          if (v57) {
            v58 = v0;
          } else {
            int v59 = 1;
            v58 = v59;
          }
          v32 = v58;
          break;
        }
      }
      v8 = v32;
    }
    case 1:
      {
      int v60 = 4;
      int v61 = v3 % v60;
      int v62 = 4;
      int v63;
      v63 = v62;
      switch (v61) {
        default:
          {
          v63 = v0;
          break;
        }
        case 0:
          {
          int v64 = 0;
          bool v65 = v2 != v64;
          int v66;
          if (v65) {
            int v67 = 2;
            v66 = v67;
          } else {
            int v68 = 3;
            v66 = v68;
          }
          v63 = v66;
          break;
        }
        case 1:
          {
          v63 = v0;
          break;
        }
        case 2:
          {
          int v69 = 0;
          int v70 = 0;
          int v71;
          int v72;
          v71 = v69;
          v72 = v70;
          while (true) {
            int v73 = 4;
            int v74 = v3 % v73;
            int v75 = 1;
            int v76 = v74 + v75;
            bool v77 = v72 < v76;
            v71 = v71;
            v72 = v72;
            if (!v77) break;
            int v78 = 1;
            int v79 = v0 + v78;
            int v80 = 1;
            int v81 = v72 + v80;
            v71 = v79;
            v72 = v81;
          }
          v63 = v71;
          break;
        }
      }
      v8 = v63;
      break;
    }
    case 2:
      {
      int v82 = 0;
      int v83 = 0;
      int v84;
      int v85;
      v84 = v82;
      v85 = v83;
      while (true) {
        int v86 = 4;
        int v87 = v3 % v86;
        int v88 = 1;
        int v89 = v87 + v88;
        bool v90 = v85 < v89;
        v84 = v84;
        v85 = v85;
        if (!v90) break;
        int v91 = 3;
        int v92 = 1;
        int v93 = v85 + v92;
        v84 = v91;
        v85 = v93;
      }
      v8 = v84;
      break;
    }
  }
  bool v94 = true;
  int v95 = simt_wave_count_bits(v94);
  int v96 = 0;
  int v97 = v96 + v0;
  v1[v97] = v95;
  return;
}

kernel void kernel_main(device int* v98 [[buffer(0)]], device int* v99 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v100 = static_cast<int>(__simt_tid3.x);
  int v101 = 0;
  int v102 = v101 + v100;
  int v103 = v99[v102];
  int v104 = 4;
  int v105 = v104 + v100;
  int v106 = v99[v105];
  helper0(v100, v98, v103, v106, static_cast<int>(__simt_tid3.x));
  int v107 = 8;
  int v108 = v107 + v100;
  int v109 = v99[v108];
  uint v110 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v111 = (int)(v110);
  int v112;
  v112 = v111;
  switch (v109) {
    default:
      {
      int v113 = 12;
      int v114 = v113 + v100;
      int v115 = v99[v114];
      int v116 = 1;
      int v117 = v100 + v116;
      int v118;
      v118 = v117;
      switch (v115) {
        case 0:
          {
          int v119 = 16;
          int v120 = v119 + v100;
          int v121 = v99[v120];
          int v122 = 0;
          int v123 = v100 + v122;
          int v124;
          v124 = v123;
          switch (v121) {
            case 0:
              {
              int v125 = 3;
              int v126 = v100 + v125;
              v124 = v126;
              break;
            }
            case 1:
              {
              v124 = v100;
            }
            default:
              {
              int v127 = 2;
              v124 = v127;
            }
            case 2:
              {
              v124 = v100;
              break;
            }
          }
          bool v128 = true;
          v118 = v124;
        }
        default:
          {
          int v129 = 0;
          int v130 = 0;
          int v131;
          int v132;
          v131 = v129;
          v132 = v130;
          while (true) {
            int v133 = 4;
            int v134 = v132 * v133;
            int v135 = v134 + v100;
            int v136 = 20;
            int v137 = v136 + v135;
            int v138 = v99[v137];
            int v139 = 0;
            bool v140 = v138 != v139;
            v131 = v131;
            v132 = v132;
            if (!v140) break;
            int v141 = v131 + v132;
            int v142 = 1;
            int v143 = v132 + v142;
            bool v144 = true;
            v131 = v141;
            v132 = v143;
            break;
            ;
          }
          v118 = v131;
          break;
        }
      }
      bool v145 = true;
      v112 = v118;
      break;
    }
    case 0:
      {
      int v146 = 4;
      v112 = v146;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 4; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 40; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
