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
    v6 = v0;
  } else {
    uint v7 = simt_lane_id(__simt_tid);
    int v8 = (int)(v7);
    v6 = v8;
  }
  bool v9 = true;
  int v10 = simt_wave_count_bits(v9);
  int v11 = 0;
  int v12 = v11 + v0;
  v1[v12] = v10;
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
    int v22 = 0;
    int v23 = 0;
    int v24;
    int v25;
    v24 = v22;
    v25 = v23;
    while (true) {
      int v26 = 4;
      int v27 = v3 % v26;
      int v28 = 1;
      int v29 = v27 + v28;
      bool v30 = v25 < v29;
      v24 = v24;
      v25 = v25;
      if (!v30) break;
      uint v31 = simt_lane_id(__simt_tid);
      int v32 = (int)(v31);
      int v33 = 1;
      int v34 = v25 + v33;
      v24 = v32;
      v25 = v34;
      continue;
      ;
    }
    int v35 = 3;
    int v36 = 1;
    int v37 = v16 + v36;
    v15 = v24;
    v16 = v37;
  }
  bool v38 = true;
  int v39 = simt_wave_count_bits(v38);
  int v40 = 16;
  int v41 = v40 + v0;
  v1[v41] = v39;
  int v42 = 0;
  bool v43 = v2 != v42;
  int v44 = v43 ? v6 : v15;
  return;
}

kernel void kernel_main(device int* v45 [[buffer(0)]], device int* v46 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v47 = static_cast<int>(__simt_tid3.x);
  int v48 = 0;
  int v49 = v48 + v47;
  int v50 = v46[v49];
  int v51 = 4;
  int v52 = v51 + v47;
  int v53 = v46[v52];
  helper0(v47, v45, v50, v53, static_cast<int>(__simt_tid3.x));
  int v54 = 8;
  int v55 = v54 + v47;
  int v56 = v46[v55];
  int v57 = 0;
  bool v58 = v56 != v57;
  int v59;
  if (v58) {
    int v60 = 12;
    int v61 = v60 + v47;
    int v62 = v46[v61];
    int v63 = 0;
    int v64 = v47 + v63;
    int v65;
    v65 = v64;
    switch (v62) {
      case 0:
        {
        int v66 = 4;
        int v67 = v47 + v66;
        v65 = v67;
      }
      case 1:
        {
        v65 = v47;
        break;
      }
      default:
        {
        int v68 = 16;
        int v69 = v68 + v47;
        int v70 = v46[v69];
        int v71;
        v71 = v47;
        switch (v70) {
          default:
            {
            v71 = v47;
          }
          case 0:
            {
            int v72 = 2;
            int v73 = v47 + v72;
            v71 = v73;
            break;
          }
          case 1:
            {
            int v74 = 1;
            v71 = v74;
            break;
          }
        }
        bool v75 = true;
        v65 = v71;
      }
      case 2:
        {
        v65 = v47;
        break;
      }
    }
    bool v76 = true;
    v59 = v65;
  } else {
    int v77 = 20;
    int v78 = v77 + v47;
    int v79 = v46[v78];
    int v80 = 0;
    bool v81 = v79 != v80;
    int v82;
    if (v81) {
      int v83 = 3;
      int v84 = v47 + v83;
      v82 = v84;
    } else {
      int v85 = 24;
      int v86 = v85 + v47;
      int v87 = v46[v86];
      int v88 = 4;
      int v89 = v47 + v88;
      int v90;
      v90 = v89;
      switch (v87) {
        case 0:
          {
          v90 = v47;
          break;
        }
        default:
          {
          int v91 = 4;
          v90 = v91;
          break;
        }
        case 1:
          {
          int v92 = 1;
          v90 = v92;
          break;
        }
        case 2:
          {
          v90 = v47;
          break;
        }
      }
      bool v93 = true;
      v82 = v90;
    }
    v59 = v82;
  }
  int v94 = 32;
  int v95 = v94 + v47;
  bool v96 = true;
  int v97 = simt_wave_count_bits(v96);
  v45[v95] = v97;
  int v98 = 28;
  int v99 = v98 + v47;
  int v100 = v46[v99];
  int v101 = 0;
  bool v102 = v100 != v101;
  int v103;
  if (v102) {
    v103 = v47;
  } else {
    int v104 = 32;
    int v105 = v104 + v47;
    int v106 = v46[v105];
    int v107 = 0;
    bool v108 = v106 != v107;
    int v109;
    if (v108) {
      int v110 = 36;
      int v111 = v110 + v47;
      int v112 = v46[v111];
      uint v113 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v114 = (int)(v113);
      int v115;
      v115 = v114;
      switch (v112) {
        case 0:
          {
          int v116 = 0;
          v115 = v116;
          break;
        }
        case 1:
          {
          v115 = v47;
          break;
        }
        case 2:
          {
          int v117 = 0;
          int v118 = v47 + v117;
          v115 = v118;
          break;
        }
        default:
          {
          int v119 = 4;
          v115 = v119;
          break;
        }
      }
      bool v120 = true;
      v109 = v115;
    } else {
      int v121 = 4;
      v109 = v121;
    }
    v103 = v109;
  }
  int v122 = 48;
  int v123 = v122 + v47;
  bool v124 = true;
  int v125 = simt_wave_count_bits(v124);
  v45[v123] = v125;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 52; ++idx) {
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
