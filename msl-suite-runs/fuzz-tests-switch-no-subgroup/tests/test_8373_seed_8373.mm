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
  int v6 = 0;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 2;
      int v10 = v0 + v9;
      v8 = v10;
      break;
    }
    case 1:
      {
      int v11 = 2;
      int v12 = v3 % v11;
      int v13 = 3;
      int v14;
      v14 = v13;
      switch (v12) {
        case 0:
          {
          int v15 = 0;
          int v16 = v0 + v15;
          v14 = v16;
          break;
        }
        default:
          {
          v14 = v0;
          break;
        }
        case 1:
          {
          int v17 = 3;
          int v18 = v0 + v17;
          v14 = v18;
          break;
        }
      }
      v8 = v14;
      break;
    }
    case 2:
      {
      int v19 = 0;
      int v20 = 0;
      int v21;
      int v22;
      v21 = v19;
      v22 = v20;
      while (true) {
        int v23 = 4;
        int v24 = v3 % v23;
        int v25 = 1;
        int v26 = v24 + v25;
        bool v27 = v22 < v26;
        v21 = v21;
        v22 = v22;
        if (!v27) break;
        int v28 = 0;
        bool v29 = v2 != v28;
        int v30;
        if (v29) {
          int v31 = 3;
          int v32 = v0 + v31;
          v30 = v32;
        } else {
          int v33 = 3;
          v30 = v33;
        }
        int v34 = 1;
        int v35 = v22 + v34;
        v21 = v30;
        v22 = v35;
      }
      v8 = v21;
      break;
    }
    default:
      {
      int v36 = 4;
      int v37 = v3 % v36;
      int v38 = 1;
      int v39;
      v39 = v38;
      switch (v37) {
        case 0:
          {
          int v40 = 0;
          v39 = v40;
          break;
        }
        case 1:
          {
          int v41 = 4;
          int v42 = v0 + v41;
          int v43;
          v43 = v42;
          switch (v3) {
            default:
              {
              int v44 = 4;
              v43 = v44;
              break;
            }
            case 0:
              {
              v43 = v0;
              break;
            }
          }
          int v45 = 4;
          int v46 = v0 + v45;
          v39 = v43;
          break;
        }
        case 2:
          {
          int v47 = 0;
          bool v48 = v2 != v47;
          int v49;
          if (v48) {
            int v50 = 2;
            v49 = v50;
          } else {
            int v51 = 0;
            v49 = v51;
          }
          v39 = v49;
          break;
        }
        default:
          {
          int v52 = 3;
          v39 = v52;
          break;
        }
      }
      v8 = v39;
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
  int v69 = 0;
  int v70 = v59 + v69;
  int v71;
  v71 = v70;
  switch (v68) {
    case 0:
      {
      int v72 = 12;
      int v73 = v72 + v59;
      int v74 = v58[v73];
      int v75 = 0;
      bool v76 = v74 != v75;
      int v77;
      if (v76) {
        v77 = v59;
      } else {
        int v78 = 4;
        v77 = v78;
      }
      v71 = v77;
      break;
    }
    case 1:
      {
      int v79 = 16;
      int v80 = v79 + v59;
      int v81 = v58[v80];
      int v82 = 0;
      bool v83 = v81 != v82;
      int v84;
      if (v83) {
        int v85 = 20;
        int v86 = v85 + v59;
        int v87 = v58[v86];
        int v88 = 0;
        bool v89 = v87 != v88;
        int v90;
        if (v89) {
          v90 = v59;
        } else {
          int v91 = 0;
          v90 = v91;
        }
        v84 = v90;
      } else {
        int v92 = 24;
        int v93 = v92 + v59;
        int v94 = v58[v93];
        int v95;
        v95 = v59;
        switch (v94) {
          case 0:
            {
            int v96 = 4;
            int v97 = v59 + v96;
            v95 = v97;
            break;
          }
          case 1:
            {
            int v98 = 0;
            v95 = v98;
            break;
          }
          default:
            {
            int v99 = 0;
            int v100 = v59 + v99;
            v95 = v100;
            break;
          }
        }
        v84 = v95;
      }
      v71 = v84;
      break;
    }
    default:
      {
      int v101 = 28;
      int v102 = v101 + v59;
      int v103 = v58[v102];
      int v104;
      v104 = v59;
      switch (v103) {
        case 0:
          {
          int v105 = 32;
          int v106 = v105 + v59;
          int v107 = v58[v106];
          int v108 = 0;
          bool v109 = v107 != v108;
          int v110;
          if (v109) {
            v110 = v59;
          } else {
            int v111 = 1;
            v110 = v111;
          }
          v104 = v110;
          break;
        }
        default:
          {
          int v112 = 0;
          int v113 = 0;
          int v114;
          int v115;
          v114 = v112;
          v115 = v113;
          while (true) {
            int v116 = 4;
            int v117 = v115 * v116;
            int v118 = v117 + v59;
            int v119 = 36;
            int v120 = v119 + v118;
            int v121 = v58[v120];
            int v122 = 0;
            bool v123 = v121 != v122;
            v114 = v114;
            v115 = v115;
            if (!v123) break;
            int v124 = v114 + v115;
            int v125 = 1;
            int v126 = v115 + v125;
            bool v127 = true;
            v114 = v124;
            v115 = v126;
          }
          v104 = v114;
        }
        case 1:
          {
          int v128 = 56;
          int v129 = v128 + v59;
          int v130 = v58[v129];
          int v131 = 0;
          bool v132 = v130 != v131;
          int v133;
          if (v132) {
            int v134 = 0;
            v133 = v134;
          } else {
            v133 = v59;
          }
          v104 = v133;
          break;
        }
      }
      v71 = v104;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 60; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
