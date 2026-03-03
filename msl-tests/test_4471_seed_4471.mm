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
  int v4 = 1;
  int v5 = v0 + v4;
  int v6 = 0;
  int v7 = 0;
  int v8;
  int v9;
  v8 = v6;
  v9 = v7;
  while (true) {
    int v10 = 4;
    int v11 = v3 % v10;
    int v12 = 1;
    int v13 = v11 + v12;
    bool v14 = v9 < v13;
    v8 = v8;
    v9 = v9;
    if (!v14) break;
    int v15 = 0;
    bool v16 = v2 != v15;
    int v17;
    if (v16) {
      int v18 = 4;
      int v19 = v3 % v18;
      int v20 = 1;
      int v21;
      v21 = v20;
      switch (v19) {
        case 0:
          {
          v21 = v0;
        }
        case 1:
          {
          int v22 = 4;
          int v23 = v0 + v22;
          v21 = v23;
        }
        case 2:
          {
          int v24 = 0;
          int v25 = v0 + v24;
          v21 = v25;
          break;
        }
        default:
          {
          int v26 = 1;
          int v27 = v0 + v26;
          v21 = v27;
          break;
        }
      }
      v17 = v21;
    } else {
      int v28 = 0;
      bool v29 = v2 != v28;
      int v30;
      if (v29) {
        uint v31 = simt_lane_id(__simt_tid);
        int v32 = (int)(v31);
        v30 = v32;
      } else {
        uint v33 = simt_lane_id(__simt_tid);
        int v34 = (int)(v33);
        v30 = v34;
      }
      uint v35 = simt_lane_id(__simt_tid);
      int v36 = (int)(v35);
      v17 = v30;
    }
    uint v37 = simt_lane_id(__simt_tid);
    int v38 = (int)(v37);
    int v39 = 1;
    int v40 = v9 + v39;
    v8 = v17;
    v9 = v40;
    break;
    ;
  }
  bool v41 = true;
  int v42 = simt_wave_count_bits(v41);
  int v43 = 0;
  int v44 = v43 + v0;
  v1[v44] = v42;
  int v45 = 0;
  bool v46 = v2 != v45;
  int v47 = v46 ? v5 : v8;
  return;
}

kernel void kernel_main(device int* v48 [[buffer(0)]], device int* v49 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v50 = static_cast<int>(__simt_tid3.x);
  int v51 = 0;
  int v52 = v51 + v50;
  int v53 = v49[v52];
  int v54 = 4;
  int v55 = v54 + v50;
  int v56 = v49[v55];
  helper0(v50, v48, v53, v56, static_cast<int>(__simt_tid3.x));
  int v57 = 8;
  int v58 = v57 + v50;
  int v59 = v49[v58];
  uint v60 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v61 = (int)(v60);
  int v62;
  v62 = v61;
  switch (v59) {
    default:
      {
      int v63 = 12;
      int v64 = v63 + v50;
      int v65 = v49[v64];
      int v66;
      v66 = v50;
      switch (v65) {
        case 0:
          {
          int v67 = 16;
          int v68 = v67 + v50;
          int v69 = v49[v68];
          int v70 = 1;
          int v71 = v50 + v70;
          int v72;
          v72 = v71;
          switch (v69) {
            case 0:
              {
              v72 = v50;
              break;
            }
            default:
              {
              int v73 = 4;
              int v74 = v50 + v73;
              v72 = v74;
              break;
            }
          }
          bool v75 = true;
          v66 = v72;
        }
        default:
          {
          int v76 = 20;
          int v77 = v76 + v50;
          int v78 = v49[v77];
          int v79 = 0;
          bool v80 = v78 != v79;
          int v81;
          if (v80) {
            int v82 = 1;
            v81 = v82;
          } else {
            v81 = v50;
          }
          v66 = v81;
          break;
        }
        case 1:
          {
          int v83 = 24;
          int v84 = v83 + v50;
          int v85 = v49[v84];
          int v86 = 0;
          bool v87 = v85 != v86;
          int v88;
          if (v87) {
            int v89 = 0;
            v88 = v89;
          } else {
            int v90 = 4;
            int v91 = v50 + v90;
            v88 = v91;
          }
          v66 = v88;
        }
        case 2:
          {
          int v92 = 2;
          v66 = v92;
          break;
        }
      }
      bool v93 = true;
      v62 = v66;
      break;
    }
    case 0:
      {
      int v94 = 2;
      v62 = v94;
      break;
    }
    case 1:
      {
      int v95 = 0;
      int v96 = 0;
      int v97;
      int v98;
      v97 = v95;
      v98 = v96;
      while (true) {
        int v99 = 4;
        int v100 = v98 * v99;
        int v101 = v100 + v50;
        int v102 = 28;
        int v103 = v102 + v101;
        int v104 = v49[v103];
        int v105 = 0;
        bool v106 = v104 != v105;
        v97 = v97;
        v98 = v98;
        if (!v106) break;
        int v107 = 48;
        int v108 = v107 + v50;
        int v109 = v49[v108];
        int v110 = 0;
        bool v111 = v109 != v110;
        int v112;
        if (v111) {
          int v113 = 4;
          int v114 = v50 + v113;
          v112 = v114;
        } else {
          int v115 = 0;
          int v116 = v50 + v115;
          v112 = v116;
        }
        int v117 = v97 + v112;
        int v118 = 1;
        int v119 = v98 + v118;
        v97 = v117;
        v98 = v119;
      }
      bool v120 = true;
      v62 = v97;
      break;
    }
  }
  bool v121 = true;
  int v122 = 16;
  int v123 = v122 + v50;
  bool v124 = true;
  int v125 = simt_wave_count_bits(v124);
  v48[v123] = v125;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 52; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
