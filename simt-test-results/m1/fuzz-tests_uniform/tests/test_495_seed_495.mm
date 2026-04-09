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
  uint v4 = simt_subgroup_id(__simt_tid);
  int v5 = (int)(v4);
  int v6 = 0;
  bool v7 = v2 != v6;
  int v8;
  if (v7) {
    int v9 = 0;
    int v10 = 0;
    int v11;
    int v12;
    v11 = v9;
    v12 = v10;
    while (true) {
      int v13 = 4;
      int v14 = v3 % v13;
      int v15 = 1;
      int v16 = v14 + v15;
      bool v17 = v12 < v16;
      v11 = v11;
      v12 = v12;
      if (!v17) break;
      int v18 = 1;
      int v19 = v12 + v18;
      v11 = v0;
      v12 = v19;
    }
    uint v20 = simt_lane_id(__simt_tid);
    int v21 = (int)(v20);
    v8 = v11;
  } else {
    int v22 = 0;
    bool v23 = v2 != v22;
    int v24;
    if (v23) {
      int v25 = 2;
      int v26 = v0 + v25;
      int v27;
      v27 = v26;
      switch (v3) {
        default:
          {
          int v28 = 4;
          v27 = v28;
        }
        case 0:
          {
          int v29 = 3;
          int v30 = v0 + v29;
          v27 = v30;
          break;
        }
      }
      int v31 = 1;
      v24 = v27;
    } else {
      int v32 = 0;
      bool v33 = v2 != v32;
      int v34;
      if (v33) {
        int v35 = 3;
        int v36 = v0 + v35;
        v34 = v36;
      } else {
        uint v37 = simt_lane_id(__simt_tid);
        int v38 = (int)(v37);
        v34 = v38;
      }
      int v39 = 1;
      v24 = v34;
    }
    uint v40 = simt_subgroup_id(__simt_tid);
    int v41 = (int)(v40);
    v8 = v24;
  }
  bool v42 = true;
  int v43 = simt_wave_count_bits(v42);
  int v44 = 0;
  int v45 = v44 + v0;
  v1[v45] = v43;
  int v46 = 0;
  bool v47 = v2 != v46;
  int v48 = v47 ? v5 : v8;
  return;
}

kernel void kernel_main(device int* v49 [[buffer(0)]], device int* v50 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v51 = static_cast<int>(__simt_tid3.x);
  int v52 = 0;
  int v53 = v52 + v51;
  int v54 = v50[v53];
  int v55 = 4;
  int v56 = v55 + v51;
  int v57 = v50[v56];
  helper0(v51, v49, v54, v57, static_cast<int>(__simt_tid3.x));
  int v58 = 0;
  int v59 = 0;
  int v60;
  int v61;
  v60 = v58;
  v61 = v59;
  while (true) {
    int v62 = 4;
    int v63 = v61 * v62;
    int v64 = v63 + v51;
    int v65 = 8;
    int v66 = v65 + v64;
    int v67 = v50[v66];
    int v68 = 0;
    bool v69 = v67 != v68;
    v60 = v60;
    v61 = v61;
    if (!v69) break;
    int v70 = v60 + v61;
    int v71 = 1;
    int v72 = v61 + v71;
    v60 = v70;
    v61 = v72;
    break;
    ;
  }
  bool v73 = true;
  int v74 = 16;
  int v75 = v74 + v51;
  bool v76 = true;
  int v77 = simt_wave_count_bits(v76);
  v49[v75] = v77;
  int v78 = 0;
  int v79 = 28;
  int v80 = v79 + v51;
  int v81 = v50[v80];
  int v82 = 0;
  bool v83 = v81 != v82;
  int v84;
  if (v83) {
    int v85 = 32;
    int v86 = v85 + v51;
    int v87 = v50[v86];
    int v88 = 0;
    bool v89 = v87 != v88;
    int v90;
    if (v89) {
      int v91 = 0;
      int v92 = 0;
      int v93;
      int v94;
      v93 = v91;
      v94 = v92;
      while (true) {
        int v95 = 4;
        int v96 = v94 * v95;
        int v97 = v96 + v51;
        int v98 = 36;
        int v99 = v98 + v97;
        int v100 = v50[v99];
        int v101 = 0;
        bool v102 = v100 != v101;
        v93 = v93;
        v94 = v94;
        if (!v102) break;
        int v103 = v93 + v94;
        int v104 = 1;
        int v105 = v94 + v104;
        v93 = v103;
        v94 = v105;
      }
      bool v106 = true;
      v90 = v93;
    } else {
      int v107 = 56;
      int v108 = v107 + v51;
      int v109 = v50[v108];
      int v110 = 0;
      bool v111 = v109 != v110;
      int v112;
      if (v111) {
        int v113 = 4;
        v112 = v113;
      } else {
        uint v114 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v115 = (int)(v114);
        v112 = v115;
      }
      v90 = v112;
    }
    v84 = v90;
  } else {
    int v116 = 60;
    int v117 = v116 + v51;
    int v118 = v50[v117];
    int v119 = 0;
    bool v120 = v118 != v119;
    int v121;
    if (v120) {
      uint v122 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v123 = (int)(v122);
      v121 = v123;
    } else {
      int v124 = 64;
      int v125 = v124 + v51;
      int v126 = v50[v125];
      uint v127 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v128 = (int)(v127);
      int v129;
      v129 = v128;
      switch (v126) {
        default:
          {
          int v130 = 1;
          v129 = v130;
          break;
        }
        case 0:
          {
          int v131 = 0;
          int v132 = v51 + v131;
          v129 = v132;
          break;
        }
        case 1:
          {
          v129 = v51;
          break;
        }
      }
      bool v133 = true;
      v121 = v129;
    }
    v84 = v121;
  }
  int v134 = 32;
  int v135 = v134 + v51;
  bool v136 = true;
  int v137 = simt_wave_count_bits(v136);
  v49[v135] = v137;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
