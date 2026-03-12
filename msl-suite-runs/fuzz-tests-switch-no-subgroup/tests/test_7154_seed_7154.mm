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
      int v16 = 4;
      int v17 = v3 % v16;
      uint v18 = simt_subgroup_id(__simt_tid);
      int v19 = (int)(v18);
      int v20;
      v20 = v19;
      switch (v17) {
        case 0:
          {
          v20 = v0;
          break;
        }
        default:
          {
          int v21 = 0;
          v20 = v21;
          break;
        }
        case 1:
          {
          v20 = v0;
          break;
        }
        case 2:
          {
          v20 = v0;
          break;
        }
      }
      int v22 = 1;
      int v23 = v10 + v22;
      v9 = v20;
      v10 = v23;
    }
    v6 = v9;
  } else {
    int v24 = 0;
    int v25 = 0;
    int v26;
    int v27;
    v26 = v24;
    v27 = v25;
    while (true) {
      int v28 = 4;
      int v29 = v3 % v28;
      int v30 = 1;
      int v31 = v29 + v30;
      bool v32 = v27 < v31;
      v26 = v26;
      v27 = v27;
      if (!v32) break;
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
        bool v42 = true;
        int v43 = simt_wave_count_bits(v42);
        int v44 = 0;
        int v45 = 4;
        int v46 = v36 * v45;
        int v47 = v44 + v46;
        int v48 = v47 + v0;
        v1[v48] = v43;
        int v49 = 1;
        int v50 = v36 + v49;
        v35 = v43;
        v36 = v50;
      }
      int v51 = 1;
      int v52 = v27 + v51;
      v26 = v35;
      v27 = v52;
    }
    v6 = v26;
  }
  return;
}

kernel void kernel_main(device int* v53 [[buffer(0)]], device int* v54 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v55 = static_cast<int>(__simt_tid3.x);
  int v56 = 0;
  int v57 = v56 + v55;
  int v58 = v54[v57];
  int v59 = 4;
  int v60 = v59 + v55;
  int v61 = v54[v60];
  helper0(v55, v53, v58, v61, static_cast<int>(__simt_tid3.x));
  uint v62 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v63 = (int)(v62);
  int v64 = 8;
  int v65 = v64 + v55;
  int v66 = v54[v65];
  uint v67 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v68 = (int)(v67);
  int v69;
  v69 = v68;
  switch (v66) {
    case 0:
      {
      int v70 = 12;
      int v71 = v70 + v55;
      int v72 = v54[v71];
      int v73 = 4;
      int v74;
      v74 = v73;
      switch (v72) {
        case 0:
          {
          int v75 = 3;
          v74 = v75;
          break;
        }
        default:
          {
          v74 = v55;
          break;
        }
        case 1:
          {
          int v76 = 16;
          int v77 = v76 + v55;
          int v78 = v54[v77];
          int v79 = 2;
          int v80;
          v80 = v79;
          switch (v78) {
            default:
              {
              int v81 = 3;
              int v82 = v55 + v81;
              v80 = v82;
              break;
            }
            case 0:
              {
              int v83 = 0;
              int v84 = v55 + v83;
              v80 = v84;
              break;
            }
          }
          bool v85 = true;
          v74 = v80;
          break;
        }
        case 2:
          {
          int v86 = 20;
          int v87 = v86 + v55;
          int v88 = v54[v87];
          int v89 = 0;
          bool v90 = v88 != v89;
          int v91;
          if (v90) {
            int v92 = 3;
            v91 = v92;
          } else {
            int v93 = 0;
            int v94 = v55 + v93;
            v91 = v94;
          }
          v74 = v91;
          break;
        }
      }
      v69 = v74;
      break;
    }
    case 1:
      {
      v69 = v55;
      break;
    }
    default:
      {
      int v95 = 24;
      int v96 = v95 + v55;
      int v97 = v54[v96];
      int v98 = 0;
      bool v99 = v97 != v98;
      int v100;
      if (v99) {
        int v101 = 28;
        int v102 = v101 + v55;
        int v103 = v54[v102];
        int v104 = 1;
        int v105;
        v105 = v104;
        switch (v103) {
          default:
            {
            v105 = v55;
          }
          case 0:
            {
            v105 = v55;
            break;
          }
        }
        bool v106 = true;
        v100 = v105;
      } else {
        int v107 = 0;
        int v108 = 0;
        int v109;
        int v110;
        v109 = v107;
        v110 = v108;
        while (true) {
          int v111 = 4;
          int v112 = v110 * v111;
          int v113 = v112 + v55;
          int v114 = 32;
          int v115 = v114 + v113;
          int v116 = v54[v115];
          int v117 = 0;
          bool v118 = v116 != v117;
          v109 = v109;
          v110 = v110;
          if (!v118) break;
          int v119 = v109 + v110;
          int v120 = 1;
          int v121 = v110 + v120;
          bool v122 = true;
          v109 = v119;
          v110 = v121;
          continue;
          ;
        }
        v100 = v109;
      }
      v69 = v100;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 16; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 52; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
