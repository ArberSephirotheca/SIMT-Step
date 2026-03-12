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
    v6 = v7;
  } else {
    int v8 = 3;
    int v9 = v3 % v8;
    uint v10 = simt_subgroup_id(__simt_tid);
    int v11 = (int)(v10);
    int v12;
    v12 = v11;
    switch (v9) {
      case 0:
        {
        int v13 = 0;
        bool v14 = v2 != v13;
        int v15;
        if (v14) {
          v15 = v0;
        } else {
          int v16 = 1;
          v15 = v16;
        }
        int v17 = 1;
        int v18 = v0 + v17;
        v12 = v15;
      }
      case 1:
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
          int v28 = 1;
          int v29 = v0 + v28;
          int v30 = 1;
          int v31 = v22 + v30;
          v21 = v29;
          v22 = v31;
        }
        v12 = v21;
      }
      default:
        {
        int v32 = 0;
        int v33 = 0;
        int v34;
        int v35;
        v34 = v32;
        v35 = v33;
        while (true) {
          int v36 = 4;
          int v37 = v3 % v36;
          int v38 = 1;
          int v39 = v37 + v38;
          bool v40 = v35 < v39;
          v34 = v34;
          v35 = v35;
          if (!v40) break;
          int v41 = 1;
          int v42 = 1;
          int v43 = v35 + v42;
          v34 = v41;
          v35 = v43;
        }
        int v44 = 4;
        int v45 = v0 + v44;
        v12 = v34;
        break;
      }
    }
    int v46 = 4;
    int v47 = v0 + v46;
    v6 = v12;
  }
  bool v48 = true;
  int v49 = simt_wave_count_bits(v48);
  int v50 = 0;
  int v51 = v50 + v0;
  v1[v51] = v49;
  return;
}

kernel void kernel_main(device int* v52 [[buffer(0)]], device int* v53 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v54 = static_cast<int>(__simt_tid3.x);
  int v55 = 0;
  int v56 = v55 + v54;
  int v57 = v53[v56];
  int v58 = 4;
  int v59 = v58 + v54;
  int v60 = v53[v59];
  helper0(v54, v52, v57, v60, static_cast<int>(__simt_tid3.x));
  int v61 = 8;
  int v62 = v61 + v54;
  int v63 = v53[v62];
  int v64 = 0;
  bool v65 = v63 != v64;
  int v66;
  if (v65) {
    int v67 = 12;
    int v68 = v67 + v54;
    int v69 = v53[v68];
    int v70 = 0;
    bool v71 = v69 != v70;
    int v72;
    if (v71) {
      int v73 = 0;
      int v74 = 0;
      int v75;
      int v76;
      v75 = v73;
      v76 = v74;
      while (true) {
        int v77 = 4;
        int v78 = v76 * v77;
        int v79 = v78 + v54;
        int v80 = 16;
        int v81 = v80 + v79;
        int v82 = v53[v81];
        int v83 = 0;
        bool v84 = v82 != v83;
        v75 = v75;
        v76 = v76;
        if (!v84) break;
        int v85 = v75 + v76;
        int v86 = 1;
        int v87 = v76 + v86;
        v75 = v85;
        v76 = v87;
        continue;
        ;
      }
      bool v88 = true;
      v72 = v75;
    } else {
      int v89 = 36;
      int v90 = v89 + v54;
      int v91 = v53[v90];
      int v92 = 0;
      bool v93 = v91 != v92;
      int v94;
      if (v93) {
        uint v95 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v96 = (int)(v95);
        v94 = v96;
      } else {
        int v97 = 1;
        int v98 = v54 + v97;
        v94 = v98;
      }
      v72 = v94;
    }
    v66 = v72;
  } else {
    int v99 = 40;
    int v100 = v99 + v54;
    int v101 = v53[v100];
    int v102;
    v102 = v54;
    switch (v101) {
      default:
        {
        int v103 = 44;
        int v104 = v103 + v54;
        int v105 = v53[v104];
        int v106 = 4;
        int v107 = v54 + v106;
        int v108;
        v108 = v107;
        switch (v105) {
          case 0:
            {
            v108 = v54;
            break;
          }
          case 1:
            {
            int v109 = 1;
            v108 = v109;
            break;
          }
          case 2:
            {
            v108 = v54;
            break;
          }
          default:
            {
            v108 = v54;
            break;
          }
        }
        bool v110 = true;
        v102 = v108;
        break;
      }
      case 0:
        {
        int v111 = 4;
        int v112 = v54 + v111;
        v102 = v112;
        break;
      }
      case 1:
        {
        int v113 = 48;
        int v114 = v113 + v54;
        int v115 = v53[v114];
        int v116 = 0;
        int v117;
        v117 = v116;
        switch (v115) {
          default:
            {
            int v118 = 1;
            v117 = v118;
          }
          case 0:
            {
            int v119 = 1;
            int v120 = v54 + v119;
            v117 = v120;
            break;
          }
        }
        bool v121 = true;
        v102 = v117;
        break;
      }
    }
    bool v122 = true;
    v66 = v102;
  }
  int v123 = 16;
  int v124 = v123 + v54;
  bool v125 = true;
  int v126 = simt_wave_count_bits(v125);
  v52[v124] = v126;
  int v127 = 1;
  int v128 = v54 + v127;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
