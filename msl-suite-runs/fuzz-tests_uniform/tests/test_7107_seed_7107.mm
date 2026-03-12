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
    bool v8 = v2 != v7;
    int v9;
    if (v8) {
      int v10 = 2;
      int v11 = v3 % v10;
      uint v12 = simt_lane_id(__simt_tid);
      int v13 = (int)(v12);
      int v14;
      v14 = v13;
      switch (v11) {
        default:
          {
          v14 = v0;
        }
        case 0:
          {
          int v15 = 2;
          int v16 = v0 + v15;
          v14 = v16;
          break;
        }
        case 1:
          {
          int v17 = 4;
          int v18 = v0 + v17;
          v14 = v18;
          break;
        }
      }
      uint v19 = simt_subgroup_id(__simt_tid);
      int v20 = (int)(v19);
      v9 = v14;
    } else {
      v9 = v0;
    }
    uint v21 = simt_lane_id(__simt_tid);
    int v22 = (int)(v21);
    v6 = v9;
  } else {
    int v23 = 0;
    bool v24 = v2 != v23;
    int v25;
    if (v24) {
      int v26 = 4;
      int v27 = v3 % v26;
      uint v28 = simt_lane_id(__simt_tid);
      int v29 = (int)(v28);
      int v30;
      v30 = v29;
      switch (v27) {
        case 0:
          {
          int v31 = 2;
          int v32 = v0 + v31;
          v30 = v32;
          break;
        }
        case 1:
          {
          int v33 = 0;
          int v34 = v0 + v33;
          v30 = v34;
          break;
        }
        default:
          {
          v30 = v0;
          break;
        }
        case 2:
          {
          v30 = v0;
          break;
        }
      }
      uint v35 = simt_lane_id(__simt_tid);
      int v36 = (int)(v35);
      v25 = v30;
    } else {
      int v37 = 0;
      bool v38 = v2 != v37;
      int v39;
      if (v38) {
        uint v40 = simt_lane_id(__simt_tid);
        int v41 = (int)(v40);
        v39 = v41;
      } else {
        uint v42 = simt_subgroup_id(__simt_tid);
        int v43 = (int)(v42);
        v39 = v43;
      }
      uint v44 = simt_subgroup_id(__simt_tid);
      int v45 = (int)(v44);
      v25 = v39;
    }
    v6 = v25;
  }
  bool v46 = true;
  int v47 = simt_wave_count_bits(v46);
  int v48 = 0;
  int v49 = v48 + v0;
  v1[v49] = v47;
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
  int v59 = 8;
  int v60 = v59 + v52;
  int v61 = v51[v60];
  int v62 = 0;
  bool v63 = v61 != v62;
  int v64;
  if (v63) {
    uint v65 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v66 = (int)(v65);
    v64 = v66;
  } else {
    int v67 = 1;
    v64 = v67;
  }
  int v68 = 16;
  int v69 = v68 + v52;
  bool v70 = true;
  int v71 = simt_wave_count_bits(v70);
  v50[v69] = v71;
  int v72 = 12;
  int v73 = v72 + v52;
  int v74 = v51[v73];
  int v75 = 0;
  bool v76 = v74 != v75;
  int v77;
  if (v76) {
    uint v78 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v79 = (int)(v78);
    v77 = v79;
  } else {
    int v80 = 16;
    int v81 = v80 + v52;
    int v82 = v51[v81];
    int v83 = 0;
    bool v84 = v82 != v83;
    int v85;
    if (v84) {
      int v86 = 0;
      int v87 = 0;
      int v88;
      int v89;
      v88 = v86;
      v89 = v87;
      while (true) {
        int v90 = 4;
        int v91 = v89 * v90;
        int v92 = v91 + v52;
        int v93 = 20;
        int v94 = v93 + v92;
        int v95 = v51[v94];
        int v96 = 0;
        bool v97 = v95 != v96;
        v88 = v88;
        v89 = v89;
        if (!v97) break;
        int v98 = v88 + v89;
        int v99 = 1;
        int v100 = v89 + v99;
        v88 = v98;
        v89 = v100;
      }
      bool v101 = true;
      v85 = v88;
    } else {
      int v102 = 40;
      int v103 = v102 + v52;
      int v104 = v51[v103];
      int v105 = 0;
      bool v106 = v104 != v105;
      int v107;
      if (v106) {
        uint v108 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v109 = (int)(v108);
        v107 = v109;
      } else {
        int v110 = 0;
        int v111 = v52 + v110;
        v107 = v111;
      }
      v85 = v107;
    }
    v77 = v85;
  }
  int v112 = 32;
  int v113 = v112 + v52;
  bool v114 = true;
  int v115 = simt_wave_count_bits(v114);
  v50[v113] = v115;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
