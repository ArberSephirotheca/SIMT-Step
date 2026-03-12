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
      int v16 = 2;
      int v17 = v3 % v16;
      uint v18 = simt_subgroup_id(__simt_tid);
      int v19 = (int)(v18);
      int v20;
      v20 = v19;
      switch (v17) {
        case 0:
          {
          int v21 = 1;
          v20 = v21;
          break;
        }
        default:
          {
          int v22 = 4;
          int v23 = v0 + v22;
          v20 = v23;
          break;
        }
        case 1:
          {
          int v24 = 4;
          int v25 = v0 + v24;
          v20 = v25;
          break;
        }
      }
      uint v26 = simt_lane_id(__simt_tid);
      int v27 = (int)(v26);
      int v28 = 1;
      int v29 = v10 + v28;
      v9 = v20;
      v10 = v29;
    }
    uint v30 = simt_lane_id(__simt_tid);
    int v31 = (int)(v30);
    v6 = v9;
  } else {
    int v32 = 2;
    int v33 = v3 % v32;
    int v34 = 3;
    int v35 = v0 + v34;
    int v36;
    v36 = v35;
    switch (v33) {
      default:
        {
        int v37 = 2;
        int v38 = v3 % v37;
        int v39 = 4;
        int v40;
        v40 = v39;
        switch (v38) {
          case 0:
            {
            int v41 = 2;
            v40 = v41;
          }
          case 1:
            {
            v40 = v0;
          }
          default:
            {
            int v42 = 2;
            int v43 = v0 + v42;
            v40 = v43;
            break;
          }
        }
        v36 = v40;
        break;
      }
      case 0:
        {
        int v44 = 0;
        int v45 = 0;
        int v46;
        int v47;
        v46 = v44;
        v47 = v45;
        while (true) {
          int v48 = 4;
          int v49 = v3 % v48;
          int v50 = 1;
          int v51 = v49 + v50;
          bool v52 = v47 < v51;
          v46 = v46;
          v47 = v47;
          if (!v52) break;
          int v53 = 1;
          int v54 = 1;
          int v55 = v47 + v54;
          v46 = v53;
          v47 = v55;
        }
        int v56 = 1;
        int v57 = v0 + v56;
        v36 = v46;
        break;
      }
      case 1:
        {
        int v58 = 4;
        int v59 = v3 % v58;
        int v60 = 2;
        int v61 = v0 + v60;
        int v62;
        v62 = v61;
        switch (v59) {
          case 0:
            {
            int v63 = 1;
            v62 = v63;
            break;
          }
          case 1:
            {
            int v64 = 3;
            v62 = v64;
            break;
          }
          default:
            {
            int v65 = 0;
            v62 = v65;
            break;
          }
          case 2:
            {
            int v66 = 0;
            int v67 = v0 + v66;
            v62 = v67;
            break;
          }
        }
        int v68 = 2;
        v36 = v62;
        break;
      }
    }
    int v69 = 2;
    int v70 = v0 + v69;
    v6 = v36;
  }
  bool v71 = true;
  int v72 = simt_wave_count_bits(v71);
  int v73 = 0;
  int v74 = v73 + v0;
  v1[v74] = v72;
  return;
}

kernel void kernel_main(device int* v75 [[buffer(0)]], device int* v76 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v77 = static_cast<int>(__simt_tid3.x);
  int v78 = 0;
  int v79 = v78 + v77;
  int v80 = v76[v79];
  int v81 = 4;
  int v82 = v81 + v77;
  int v83 = v76[v82];
  helper0(v77, v75, v80, v83, static_cast<int>(__simt_tid3.x));
  int v84 = 8;
  int v85 = v84 + v77;
  int v86 = v76[v85];
  int v87 = 0;
  bool v88 = v86 != v87;
  int v89;
  if (v88) {
    int v90 = 12;
    int v91 = v90 + v77;
    int v92 = v76[v91];
    int v93 = 0;
    bool v94 = v92 != v93;
    int v95;
    if (v94) {
      int v96 = 16;
      int v97 = v96 + v77;
      int v98 = v76[v97];
      int v99 = 0;
      bool v100 = v98 != v99;
      int v101;
      if (v100) {
        v101 = v77;
      } else {
        uint v102 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v103 = (int)(v102);
        v101 = v103;
      }
      v95 = v101;
    } else {
      int v104 = 20;
      int v105 = v104 + v77;
      int v106 = v76[v105];
      uint v107 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v108 = (int)(v107);
      int v109;
      v109 = v108;
      switch (v106) {
        case 0:
          {
          int v110 = 3;
          v109 = v110;
        }
        case 1:
          {
          v109 = v77;
        }
        default:
          {
          int v111 = 3;
          v109 = v111;
          break;
        }
        case 2:
          {
          int v112 = 4;
          int v113 = v77 + v112;
          v109 = v113;
          break;
        }
      }
      bool v114 = true;
      v95 = v109;
    }
    v89 = v95;
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
      int v121 = v120 + v77;
      int v122 = 24;
      int v123 = v122 + v121;
      int v124 = v76[v123];
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
    }
    bool v130 = true;
    v89 = v117;
  }
  int v131 = 16;
  int v132 = v131 + v77;
  bool v133 = true;
  int v134 = simt_wave_count_bits(v133);
  v75[v132] = v134;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 44; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
