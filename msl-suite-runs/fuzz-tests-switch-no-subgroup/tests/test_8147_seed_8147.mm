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
      int v18 = 0;
      int v19;
      v19 = v18;
      switch (v17) {
        default:
          {
          v19 = v0;
          break;
        }
        case 0:
          {
          int v20 = 2;
          v19 = v20;
        }
        case 1:
          {
          int v21 = 1;
          int v22 = v0 + v21;
          v19 = v22;
          break;
        }
      }
      int v23 = 1;
      int v24 = v10 + v23;
      v9 = v19;
      v10 = v24;
    }
    v6 = v9;
  } else {
    int v25 = 4;
    int v26 = v3 % v25;
    uint v27 = simt_subgroup_id(__simt_tid);
    int v28 = (int)(v27);
    int v29;
    v29 = v28;
    switch (v26) {
      case 0:
        {
        int v30 = 2;
        int v31 = v3 % v30;
        int v32 = 4;
        int v33;
        v33 = v32;
        switch (v31) {
          case 0:
            {
            int v34 = 4;
            int v35 = v0 + v34;
            v33 = v35;
            break;
          }
          default:
            {
            int v36 = 4;
            int v37 = v0 + v36;
            v33 = v37;
            break;
          }
        }
        v29 = v33;
        break;
      }
      case 1:
        {
        int v38 = 2;
        int v39 = v3 % v38;
        int v40;
        v40 = v0;
        switch (v39) {
          case 0:
            {
            v40 = v0;
            break;
          }
          default:
            {
            int v41 = 0;
            int v42 = v0 + v41;
            v40 = v42;
            break;
          }
          case 1:
            {
            int v43 = 3;
            v40 = v43;
            break;
          }
        }
        v29 = v40;
      }
      case 2:
        {
        int v44 = 2;
        v29 = v44;
        break;
      }
      default:
        {
        int v45 = 1;
        int v46;
        v46 = v45;
        switch (v3) {
          default:
            {
            int v47 = 1;
            int v48 = v0 + v47;
            v46 = v48;
            break;
          }
          case 0:
            {
            int v49 = 2;
            v46 = v49;
            break;
          }
        }
        int v50 = 2;
        v29 = v46;
        break;
      }
    }
    v6 = v29;
  }
  bool v51 = true;
  int v52 = simt_wave_count_bits(v51);
  int v53 = 0;
  int v54 = v53 + v0;
  v1[v54] = v52;
  return;
}

kernel void kernel_main(device int* v55 [[buffer(0)]], device int* v56 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v57 = static_cast<int>(__simt_tid3.x);
  int v58 = 0;
  int v59 = v58 + v57;
  int v60 = v56[v59];
  int v61 = 4;
  int v62 = v61 + v57;
  int v63 = v56[v62];
  int v64 = 0;
  bool v65 = v60 != v64;
  if (v65) {
    int v66 = 8;
    int v67 = v66 + v57;
    int v68 = v56[v67];
    int v69 = 0;
    bool v70 = v68 != v69;
    if (v70) {
      helper0(v57, v55, v60, v63, static_cast<int>(__simt_tid3.x));
    } else {
    }
  } else {
  }
  int v71 = 12;
  int v72 = v71 + v57;
  int v73 = v56[v72];
  int v74 = 0;
  bool v75 = v73 != v74;
  int v76;
  if (v75) {
    int v77 = 16;
    int v78 = v77 + v57;
    int v79 = v56[v78];
    uint v80 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v81 = (int)(v80);
    int v82;
    v82 = v81;
    switch (v79) {
      default:
        {
        int v83 = 3;
        v82 = v83;
        break;
      }
      case 0:
        {
        v82 = v57;
        break;
      }
      case 1:
        {
        int v84 = 20;
        int v85 = v84 + v57;
        int v86 = v56[v85];
        int v87;
        v87 = v57;
        switch (v86) {
          case 0:
            {
            int v88 = 2;
            v87 = v88;
          }
          default:
            {
            int v89 = 2;
            v87 = v89;
          }
          case 1:
            {
            v87 = v57;
            break;
          }
        }
        v82 = v87;
        break;
      }
      case 2:
        {
        int v90 = 0;
        int v91 = 0;
        int v92;
        int v93;
        v92 = v90;
        v93 = v91;
        while (true) {
          int v94 = 4;
          int v95 = v93 * v94;
          int v96 = v95 + v57;
          int v97 = 24;
          int v98 = v97 + v96;
          int v99 = v56[v98];
          int v100 = 0;
          bool v101 = v99 != v100;
          v92 = v92;
          v93 = v93;
          if (!v101) break;
          int v102 = v92 + v93;
          int v103 = 1;
          int v104 = v93 + v103;
          bool v105 = true;
          v92 = v102;
          v93 = v104;
        }
        v82 = v92;
        break;
      }
    }
    v76 = v82;
  } else {
    int v106 = 44;
    int v107 = v106 + v57;
    int v108 = v56[v107];
    int v109 = 0;
    bool v110 = v108 != v109;
    int v111;
    if (v110) {
      uint v112 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v113 = (int)(v112);
      v111 = v113;
    } else {
      int v114 = 4;
      int v115 = v57 + v114;
      v111 = v115;
    }
    int v116 = 16;
    int v117 = v116 + v57;
    bool v118 = true;
    int v119 = simt_wave_count_bits(v118);
    v55[v117] = v119;
    v76 = v111;
  }
  int v120 = 32;
  int v121 = v120 + v57;
  bool v122 = true;
  int v123 = simt_wave_count_bits(v122);
  v55[v121] = v123;
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
    static int32_t expected0[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 48; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
