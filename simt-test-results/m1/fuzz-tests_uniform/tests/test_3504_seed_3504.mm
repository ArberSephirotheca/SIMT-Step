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
  int v4;
  v4 = v0;
  switch (v3) {
    case 0:
      {
      int v5 = 0;
      bool v6 = v2 != v5;
      int v7;
      if (v6) {
        int v8 = 0;
        bool v9 = v2 != v8;
        int v10;
        if (v9) {
          v10 = v0;
        } else {
          int v11 = 2;
          v10 = v11;
        }
        int v12 = 2;
        v7 = v10;
      } else {
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
          int v22 = 4;
          int v23 = v0 + v22;
          int v24 = 1;
          int v25 = v16 + v24;
          v15 = v23;
          v16 = v25;
          break;
          ;
        }
        int v26 = 2;
        v7 = v15;
      }
      int v27 = 2;
      v4 = v7;
      break;
    }
    default:
      {
      v4 = v0;
      break;
    }
  }
  bool v28 = true;
  int v29 = simt_wave_count_bits(v28);
  int v30 = 0;
  int v31 = v30 + v0;
  v1[v31] = v29;
  return;
}

kernel void kernel_main(device int* v32 [[buffer(0)]], device int* v33 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v34 = static_cast<int>(__simt_tid3.x);
  int v35 = 0;
  int v36 = v35 + v34;
  int v37 = v33[v36];
  int v38 = 4;
  int v39 = v38 + v34;
  int v40 = v33[v39];
  helper0(v34, v32, v37, v40, static_cast<int>(__simt_tid3.x));
  int v41 = 8;
  int v42 = v41 + v34;
  int v43 = v33[v42];
  int v44 = 2;
  int v45 = v34 + v44;
  int v46;
  v46 = v45;
  switch (v43) {
    default:
      {
      int v47 = 12;
      int v48 = v47 + v34;
      int v49 = v33[v48];
      int v50 = 1;
      int v51 = v34 + v50;
      int v52;
      v52 = v51;
      switch (v49) {
        case 0:
          {
          int v53 = 16;
          int v54 = v53 + v34;
          int v55 = v33[v54];
          int v56 = 0;
          bool v57 = v55 != v56;
          int v58;
          if (v57) {
            int v59 = 4;
            v58 = v59;
          } else {
            v58 = v34;
          }
          v52 = v58;
          break;
        }
        default:
          {
          int v60 = 20;
          int v61 = v60 + v34;
          int v62 = v33[v61];
          int v63 = 0;
          bool v64 = v62 != v63;
          int v65;
          if (v64) {
            v65 = v34;
          } else {
            int v66 = 3;
            v65 = v66;
          }
          v52 = v65;
          break;
        }
        case 1:
          {
          int v67 = 24;
          int v68 = v67 + v34;
          int v69 = v33[v68];
          int v70 = 0;
          bool v71 = v69 != v70;
          int v72;
          if (v71) {
            v72 = v34;
          } else {
            int v73 = 2;
            v72 = v73;
          }
          v52 = v72;
          break;
        }
      }
      bool v74 = true;
      v46 = v52;
      break;
    }
    case 0:
      {
      int v75 = 28;
      int v76 = v75 + v34;
      int v77 = v33[v76];
      int v78 = 4;
      int v79;
      v79 = v78;
      switch (v77) {
        case 0:
          {
          v79 = v34;
          break;
        }
        case 1:
          {
          int v80 = 32;
          int v81 = v80 + v34;
          int v82 = v33[v81];
          int v83 = 2;
          int v84;
          v84 = v83;
          switch (v82) {
            case 0:
              {
              int v85 = 3;
              int v86 = v34 + v85;
              v84 = v86;
              break;
            }
            default:
              {
              int v87 = 2;
              v84 = v87;
            }
            case 1:
              {
              v84 = v34;
              break;
            }
          }
          bool v88 = true;
          v79 = v84;
          break;
        }
        default:
          {
          int v89 = 36;
          int v90 = v89 + v34;
          int v91 = v33[v90];
          int v92 = 0;
          int v93;
          v93 = v92;
          switch (v91) {
            case 0:
              {
              int v94 = 2;
              int v95 = v34 + v94;
              v93 = v95;
              break;
            }
            default:
              {
              int v96 = 1;
              int v97 = v34 + v96;
              v93 = v97;
              break;
            }
          }
          bool v98 = true;
          v79 = v93;
          break;
        }
      }
      bool v99 = true;
      v46 = v79;
      break;
    }
    case 1:
      {
      int v100 = 40;
      int v101 = v100 + v34;
      int v102 = v33[v101];
      int v103 = 2;
      int v104;
      v104 = v103;
      switch (v102) {
        case 0:
          {
          int v105 = 44;
          int v106 = v105 + v34;
          int v107 = v33[v106];
          int v108;
          v108 = v34;
          switch (v107) {
            case 0:
              {
              int v109 = 2;
              int v110 = v34 + v109;
              v108 = v110;
              break;
            }
            case 1:
              {
              int v111 = 0;
              int v112 = v34 + v111;
              v108 = v112;
              break;
            }
            default:
              {
              int v113 = 4;
              v108 = v113;
              break;
            }
          }
          bool v114 = true;
          v104 = v108;
          break;
        }
        case 1:
          {
          int v115 = 48;
          int v116 = v115 + v34;
          int v117 = v33[v116];
          int v118 = 0;
          bool v119 = v117 != v118;
          int v120;
          if (v119) {
            int v121 = 0;
            int v122 = v34 + v121;
            v120 = v122;
          } else {
            int v123 = 3;
            int v124 = v34 + v123;
            v120 = v124;
          }
          v104 = v120;
          break;
        }
        default:
          {
          int v125 = 52;
          int v126 = v125 + v34;
          int v127 = v33[v126];
          int v128 = 3;
          int v129 = v34 + v128;
          int v130;
          v130 = v129;
          switch (v127) {
            case 0:
              {
              v130 = v34;
              break;
            }
            case 1:
              {
              int v131 = 0;
              v130 = v131;
              break;
            }
            case 2:
              {
              int v132 = 4;
              v130 = v132;
              break;
            }
            default:
              {
              int v133 = 0;
              v130 = v133;
              break;
            }
          }
          bool v134 = true;
          v104 = v130;
          break;
        }
      }
      bool v135 = true;
      v46 = v104;
      break;
    }
    case 2:
      {
      int v136 = 56;
      int v137 = v136 + v34;
      int v138 = v33[v137];
      int v139 = 0;
      bool v140 = v138 != v139;
      int v141;
      if (v140) {
        v141 = v34;
      } else {
        int v142 = 2;
        int v143 = v34 + v142;
        v141 = v143;
      }
      v46 = v141;
      break;
    }
  }
  bool v144 = true;
  int v145 = 16;
  int v146 = v145 + v34;
  bool v147 = true;
  int v148 = simt_wave_count_bits(v147);
  v32[v146] = v148;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
