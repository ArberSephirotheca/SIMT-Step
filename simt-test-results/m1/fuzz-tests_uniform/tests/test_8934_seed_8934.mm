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
  int v4 = 2;
  int v5 = v3 % v4;
  int v6 = 1;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 2;
      v8 = v9;
      break;
    }
    case 0:
      {
      int v10 = 3;
      int v11 = v3 % v10;
      int v12;
      v12 = v0;
      switch (v11) {
        case 0:
          {
          int v13 = 3;
          int v14 = v3 % v13;
          int v15 = 3;
          int v16 = v0 + v15;
          int v17;
          v17 = v16;
          switch (v14) {
            case 0:
              {
              v17 = v0;
            }
            default:
              {
              int v18 = 0;
              v17 = v18;
            }
            case 1:
              {
              int v19 = 4;
              int v20 = v0 + v19;
              v17 = v20;
            }
            case 2:
              {
              int v21 = 3;
              v17 = v21;
              break;
            }
          }
          int v22 = 3;
          int v23 = v0 + v22;
          v12 = v17;
          break;
        }
        case 1:
          {
          int v24 = 3;
          int v25 = v3 % v24;
          int v26 = 3;
          int v27;
          v27 = v26;
          switch (v25) {
            case 0:
              {
              int v28 = 2;
              v27 = v28;
            }
            case 1:
              {
              int v29 = 0;
              v27 = v29;
              break;
            }
            default:
              {
              v27 = v0;
            }
            case 2:
              {
              int v30 = 4;
              int v31 = v0 + v30;
              v27 = v31;
              break;
            }
          }
          v12 = v27;
        }
        default:
          {
          int v32 = 2;
          int v33 = v3 % v32;
          int v34 = 3;
          int v35;
          v35 = v34;
          switch (v33) {
            default:
              {
              int v36 = 4;
              v35 = v36;
              break;
            }
            case 0:
              {
              v35 = v0;
              break;
            }
          }
          int v37 = 3;
          int v38 = v0 + v37;
          v12 = v35;
          break;
        }
      }
      int v39 = 3;
      v8 = v12;
      break;
    }
    case 1:
      {
      int v40 = 2;
      int v41 = v3 % v40;
      int v42 = 2;
      int v43 = v0 + v42;
      int v44;
      v44 = v43;
      switch (v41) {
        case 0:
          {
          int v45 = 4;
          v44 = v45;
        }
        case 1:
          {
          int v46 = 3;
          v44 = v46;
          break;
        }
        default:
          {
          int v47 = 0;
          bool v48 = v2 != v47;
          int v49;
          if (v48) {
            v49 = v0;
          } else {
            v49 = v0;
          }
          int v50 = 2;
          int v51 = v0 + v50;
          v44 = v49;
          break;
        }
      }
      int v52 = 1;
      v8 = v44;
      break;
    }
  }
  bool v53 = true;
  int v54 = simt_wave_count_bits(v53);
  int v55 = 0;
  int v56 = v55 + v0;
  v1[v56] = v54;
  return;
}

kernel void kernel_main(device int* v57 [[buffer(0)]], device int* v58 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v59 = static_cast<int>(__simt_tid3.x);
  int v60 = 0;
  int v61 = v60 + v59;
  int v62 = v58[v61];
  int v63 = 4;
  int v64 = v63 + v59;
  int v65 = v58[v64];
  helper0(v59, v57, v62, v65, static_cast<int>(__simt_tid3.x));
  int v66 = 8;
  int v67 = v66 + v59;
  int v68 = v58[v67];
  uint v69 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v70 = (int)(v69);
  int v71;
  v71 = v70;
  switch (v68) {
    case 0:
      {
      int v72 = 12;
      int v73 = v72 + v59;
      int v74 = v58[v73];
      int v75 = 4;
      int v76;
      v76 = v75;
      switch (v74) {
        case 0:
          {
          int v77 = 16;
          int v78 = v77 + v59;
          int v79 = v58[v78];
          int v80 = 0;
          int v81 = v59 + v80;
          int v82;
          v82 = v81;
          switch (v79) {
            case 0:
              {
              int v83 = 2;
              int v84 = v59 + v83;
              v82 = v84;
            }
            case 1:
              {
              v82 = v59;
              break;
            }
            default:
              {
              int v85 = 1;
              v82 = v85;
              break;
            }
            case 2:
              {
              v82 = v59;
              break;
            }
          }
          bool v86 = true;
          v76 = v82;
          break;
        }
        default:
          {
          int v87 = 20;
          int v88 = v87 + v59;
          int v89 = v58[v88];
          int v90 = 3;
          int v91;
          v91 = v90;
          switch (v89) {
            case 0:
              {
              int v92 = 4;
              v91 = v92;
              break;
            }
            default:
              {
              int v93 = 1;
              int v94 = v59 + v93;
              v91 = v94;
              break;
            }
            case 1:
              {
              int v95 = 0;
              v91 = v95;
              break;
            }
          }
          bool v96 = true;
          v76 = v91;
          break;
        }
      }
      bool v97 = true;
      v71 = v76;
    }
    case 1:
      {
      int v98 = 0;
      int v99 = 0;
      int v100;
      int v101;
      v100 = v98;
      v101 = v99;
      while (true) {
        int v102 = 4;
        int v103 = v101 * v102;
        int v104 = v103 + v59;
        int v105 = 24;
        int v106 = v105 + v104;
        int v107 = v58[v106];
        int v108 = 0;
        bool v109 = v107 != v108;
        v100 = v100;
        v101 = v101;
        if (!v109) break;
        int v110 = 44;
        int v111 = v110 + v59;
        int v112 = v58[v111];
        int v113 = 0;
        bool v114 = v112 != v113;
        int v115;
        if (v114) {
          int v116 = 4;
          v115 = v116;
        } else {
          int v117 = 4;
          v115 = v117;
        }
        int v118 = v100 + v115;
        int v119 = 1;
        int v120 = v101 + v119;
        v100 = v118;
        v101 = v120;
        continue;
        ;
      }
      bool v121 = true;
      v71 = v100;
    }
    default:
      {
      int v122 = 48;
      int v123 = v122 + v59;
      int v124 = v58[v123];
      int v125;
      v125 = v59;
      switch (v124) {
        default:
          {
          int v126 = 52;
          int v127 = v126 + v59;
          int v128 = v58[v127];
          int v129 = 0;
          bool v130 = v128 != v129;
          int v131;
          if (v130) {
            v131 = v59;
          } else {
            int v132 = 4;
            int v133 = v59 + v132;
            v131 = v133;
          }
          v125 = v131;
          break;
        }
        case 0:
          {
          int v134 = 56;
          int v135 = v134 + v59;
          int v136 = v58[v135];
          int v137 = 2;
          int v138 = v59 + v137;
          int v139;
          v139 = v138;
          switch (v136) {
            case 0:
              {
              int v140 = 3;
              v139 = v140;
            }
            default:
              {
              int v141 = 1;
              int v142 = v59 + v141;
              v139 = v142;
              break;
            }
          }
          bool v143 = true;
          v125 = v139;
          break;
        }
      }
      bool v144 = true;
      v71 = v125;
    }
    case 2:
      {
      v71 = v59;
      break;
    }
  }
  bool v145 = true;
  int v146 = 16;
  int v147 = v146 + v59;
  bool v148 = true;
  int v149 = simt_wave_count_bits(v148);
  v57[v147] = v149;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 20; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 60; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
