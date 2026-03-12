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
  uint v4 = simt_lane_id(__simt_tid);
  int v5 = (int)(v4);
  int v6 = 0;
  bool v7 = v2 != v6;
  int v8;
  if (v7) {
    int v9 = 2;
    int v10 = v3 % v9;
    int v11 = 0;
    int v12;
    v12 = v11;
    switch (v10) {
      case 0:
        {
        int v13 = 2;
        int v14 = v3 % v13;
        int v15;
        v15 = v0;
        switch (v14) {
          default:
            {
            v15 = v0;
            break;
          }
          case 0:
            {
            v15 = v0;
            break;
          }
        }
        v12 = v15;
        break;
      }
      default:
        {
        int v16 = 4;
        int v17;
        v17 = v16;
        switch (v3) {
          default:
            {
            v17 = v0;
          }
          case 0:
            {
            v17 = v0;
            break;
          }
        }
        int v18 = 3;
        int v19 = v0 + v18;
        v12 = v17;
        break;
      }
    }
    uint v20 = simt_lane_id(__simt_tid);
    int v21 = (int)(v20);
    v8 = v12;
  } else {
    int v22 = 2;
    int v23 = v3 % v22;
    int v24;
    v24 = v0;
    switch (v23) {
      default:
        {
        int v25 = 0;
        bool v26 = v2 != v25;
        int v27;
        if (v26) {
          int v28 = 3;
          v27 = v28;
        } else {
          int v29 = 1;
          v27 = v29;
        }
        int v30 = 2;
        v24 = v27;
        break;
      }
      case 0:
        {
        int v31 = 0;
        bool v32 = v2 != v31;
        int v33;
        if (v32) {
          int v34 = 0;
          v33 = v34;
        } else {
          int v35 = 0;
          v33 = v35;
        }
        v24 = v33;
        break;
      }
      case 1:
        {
        int v36 = 0;
        int v37 = 0;
        int v38;
        int v39;
        v38 = v36;
        v39 = v37;
        while (true) {
          int v40 = 4;
          int v41 = v3 % v40;
          int v42 = 1;
          int v43 = v41 + v42;
          bool v44 = v39 < v43;
          v38 = v38;
          v39 = v39;
          if (!v44) break;
          int v45 = 0;
          int v46 = 1;
          int v47 = v39 + v46;
          v38 = v45;
          v39 = v47;
          continue;
          ;
        }
        v24 = v38;
        break;
      }
    }
    int v48 = 2;
    int v49 = v0 + v48;
    v8 = v24;
  }
  bool v50 = true;
  int v51 = simt_wave_count_bits(v50);
  int v52 = 0;
  int v53 = v52 + v0;
  v1[v53] = v51;
  int v54 = 0;
  bool v55 = v2 != v54;
  int v56 = v55 ? v5 : v8;
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
  bool v70 = v68 != v69;
  int v71;
  if (v70) {
    int v72 = 12;
    int v73 = v72 + v59;
    int v74 = v58[v73];
    int v75 = 0;
    bool v76 = v74 != v75;
    int v77;
    if (v76) {
      v77 = v59;
    } else {
      int v78 = 16;
      int v79 = v78 + v59;
      int v80 = v58[v79];
      uint v81 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v82 = (int)(v81);
      int v83;
      v83 = v82;
      switch (v80) {
        case 0:
          {
          int v84 = 2;
          int v85 = v59 + v84;
          v83 = v85;
          break;
        }
        default:
          {
          v83 = v59;
          break;
        }
        case 1:
          {
          v83 = v59;
          break;
        }
        case 2:
          {
          v83 = v59;
          break;
        }
      }
      bool v86 = true;
      v77 = v83;
    }
    v71 = v77;
  } else {
    int v87 = 0;
    v71 = v87;
  }
  int v88 = 16;
  int v89 = v88 + v59;
  bool v90 = true;
  int v91 = simt_wave_count_bits(v90);
  v57[v89] = v91;
  uint v92 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v93 = (int)(v92);
  int v94 = 20;
  int v95 = v94 + v59;
  int v96 = v58[v95];
  int v97 = 0;
  bool v98 = v96 != v97;
  int v99;
  if (v98) {
    int v100 = 24;
    int v101 = v100 + v59;
    int v102 = v58[v101];
    int v103 = 0;
    bool v104 = v102 != v103;
    int v105;
    if (v104) {
      int v106 = 28;
      int v107 = v106 + v59;
      int v108 = v58[v107];
      int v109 = 0;
      bool v110 = v108 != v109;
      int v111;
      if (v110) {
        int v112 = 0;
        int v113 = v59 + v112;
        v111 = v113;
      } else {
        int v114 = 2;
        v111 = v114;
      }
      v105 = v111;
    } else {
      int v115 = 0;
      int v116 = 0;
      int v117;
      int v118;
      v117 = v115;
      v118 = v116;
      while (true) {
        int v119 = 4;
        int v120 = v118 * v119;
        int v121 = v120 + v59;
        int v122 = 32;
        int v123 = v122 + v121;
        int v124 = v58[v123];
        int v125 = 0;
        bool v126 = v124 != v125;
        v117 = v117;
        v118 = v118;
        if (!v126) break;
        int v127 = v117 + v118;
        int v128 = 1;
        int v129 = v118 + v128;
        v117 = v127;
        v118 = v129;
        break;
        ;
      }
      bool v130 = true;
      v105 = v117;
    }
    v99 = v105;
  } else {
    uint v131 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v132 = (int)(v131);
    v99 = v132;
  }
  int v133 = 32;
  int v134 = v133 + v59;
  bool v135 = true;
  int v136 = simt_wave_count_bits(v135);
  v57[v134] = v136;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 52; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
