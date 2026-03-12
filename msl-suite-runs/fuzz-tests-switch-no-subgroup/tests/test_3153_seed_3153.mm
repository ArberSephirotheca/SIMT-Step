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
    int v13 = 4;
    int v14 = v3 % v13;
    int v15 = 2;
    int v16 = v0 + v15;
    int v17;
    v17 = v16;
    switch (v14) {
      case 0:
        {
        int v18 = 0;
        bool v19 = v2 != v18;
        int v20;
        if (v19) {
          int v21 = 3;
          int v22 = v0 + v21;
          v20 = v22;
        } else {
          int v23 = 0;
          int v24 = v0 + v23;
          v20 = v24;
        }
        v17 = v20;
        break;
      }
      default:
        {
        int v25 = 3;
        int v26 = v0 + v25;
        v17 = v26;
        break;
      }
      case 1:
        {
        int v27 = 0;
        bool v28 = v2 != v27;
        int v29;
        if (v28) {
          int v30 = 1;
          int v31 = v0 + v30;
          v29 = v31;
        } else {
          int v32 = 1;
          int v33 = v0 + v32;
          v29 = v33;
        }
        v17 = v29;
        break;
      }
      case 2:
        {
        int v34 = 3;
        int v35 = v3 % v34;
        int v36 = 3;
        int v37;
        v37 = v36;
        switch (v35) {
          case 0:
            {
            int v38 = 2;
            v37 = v38;
            break;
          }
          default:
            {
            v37 = v0;
            break;
          }
          case 1:
            {
            int v39 = 4;
            int v40 = v0 + v39;
            v37 = v40;
            break;
          }
        }
        v17 = v37;
        break;
      }
    }
    bool v41 = true;
    int v42 = simt_wave_count_bits(v41);
    int v43 = 0;
    int v44 = 4;
    int v45 = v7 * v44;
    int v46 = v43 + v45;
    int v47 = v46 + v0;
    v1[v47] = v42;
    int v48 = 1;
    int v49 = v7 + v48;
    v6 = v17;
    v7 = v49;
    break;
    ;
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
  helper0(v52, v50, v55, v58, static_cast<int>(__simt_tid3.x));
  int v59 = 0;
  int v60 = 0;
  int v61;
  int v62;
  v61 = v59;
  v62 = v60;
  while (true) {
    int v63 = 4;
    int v64 = v62 * v63;
    int v65 = v64 + v52;
    int v66 = 8;
    int v67 = v66 + v65;
    int v68 = v51[v67];
    int v69 = 0;
    bool v70 = v68 != v69;
    v61 = v61;
    v62 = v62;
    if (!v70) break;
    int v71 = v61 + v62;
    int v72 = 1;
    int v73 = v62 + v72;
    bool v74 = true;
    int v75 = 16;
    int v76 = 4;
    int v77 = v62 * v76;
    int v78 = v75 + v77;
    int v79 = v78 + v52;
    bool v80 = true;
    int v81 = simt_wave_count_bits(v80);
    v50[v79] = v81;
    v61 = v71;
    v62 = v73;
  }
  int v82 = 28;
  int v83 = v82 + v52;
  int v84 = v51[v83];
  int v85 = 2;
  int v86;
  v86 = v85;
  switch (v84) {
    case 0:
      {
      int v87 = 1;
      int v88 = v52 + v87;
      v86 = v88;
    }
    case 1:
      {
      int v89 = 32;
      int v90 = v89 + v52;
      int v91 = v51[v90];
      int v92 = 2;
      int v93;
      v93 = v92;
      switch (v91) {
        case 0:
          {
          int v94 = 36;
          int v95 = v94 + v52;
          int v96 = v51[v95];
          int v97 = 3;
          int v98 = v52 + v97;
          int v99;
          v99 = v98;
          switch (v96) {
            case 0:
              {
              int v100 = 0;
              int v101 = v52 + v100;
              v99 = v101;
              break;
            }
            default:
              {
              int v102 = 4;
              int v103 = v52 + v102;
              v99 = v103;
              break;
            }
            case 1:
              {
              int v104 = 0;
              int v105 = v52 + v104;
              v99 = v105;
              break;
            }
          }
          v93 = v99;
        }
        default:
          {
          int v106 = 40;
          int v107 = v106 + v52;
          int v108 = v51[v107];
          int v109 = 4;
          int v110 = v52 + v109;
          int v111;
          v111 = v110;
          switch (v108) {
            default:
              {
              int v112 = 2;
              int v113 = v52 + v112;
              v111 = v113;
              break;
            }
            case 0:
              {
              int v114 = 0;
              int v115 = v52 + v114;
              v111 = v115;
              break;
            }
            case 1:
              {
              int v116 = 0;
              v111 = v116;
              break;
            }
          }
          v93 = v111;
          break;
        }
        case 1:
          {
          int v117 = 4;
          int v118 = v52 + v117;
          v93 = v118;
          break;
        }
      }
      bool v119 = true;
      v86 = v93;
    }
    default:
      {
      v86 = v52;
      break;
    }
  }
  bool v120 = true;
  int v121 = 32;
  int v122 = v121 + v52;
  bool v123 = true;
  int v124 = simt_wave_count_bits(v123);
  v50[v122] = v124;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 44; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
