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
      uint v12 = simt_subgroup_id(__simt_tid);
      int v13 = (int)(v12);
      int v14;
      v14 = v13;
      switch (v11) {
        default:
          {
          v14 = v0;
          break;
        }
        case 0:
          {
          int v15 = 4;
          int v16 = v0 + v15;
          v14 = v16;
          break;
        }
      }
      bool v17 = true;
      int v18 = simt_wave_count_bits(v17);
      int v19 = 0;
      int v20 = v19 + v0;
      v1[v20] = v18;
      v9 = v14;
    } else {
      int v21 = 0;
      bool v22 = v2 != v21;
      int v23;
      if (v22) {
        bool v24 = true;
        int v25 = simt_wave_count_bits(v24);
        int v26 = 16;
        int v27 = v26 + v0;
        v1[v27] = v25;
        v23 = v25;
      } else {
        bool v28 = true;
        int v29 = simt_wave_count_bits(v28);
        int v30 = 32;
        int v31 = v30 + v0;
        v1[v31] = v29;
        v23 = v29;
      }
      v9 = v23;
    }
    v6 = v9;
  } else {
    int v32 = 2;
    int v33 = v3 % v32;
    uint v34 = simt_lane_id(__simt_tid);
    int v35 = (int)(v34);
    int v36;
    v36 = v35;
    switch (v33) {
      case 0:
        {
        int v37 = 0;
        int v38 = 0;
        int v39;
        int v40;
        v39 = v37;
        v40 = v38;
        while (true) {
          int v41 = 4;
          int v42 = v3 % v41;
          int v43 = 1;
          int v44 = v42 + v43;
          bool v45 = v40 < v44;
          v39 = v39;
          v40 = v40;
          if (!v45) break;
          int v46 = 1;
          int v47 = v40 + v46;
          v39 = v0;
          v40 = v47;
        }
        v36 = v39;
        break;
      }
      default:
        {
        int v48 = 4;
        v36 = v48;
        break;
      }
    }
    v6 = v36;
  }
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
  int v58 = 8;
  int v59 = v58 + v51;
  int v60 = v50[v59];
  uint v61 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v62 = (int)(v61);
  int v63;
  v63 = v62;
  switch (v60) {
    case 0:
      {
      int v64 = 12;
      int v65 = v64 + v51;
      int v66 = v50[v65];
      int v67 = 0;
      bool v68 = v66 != v67;
      int v69;
      if (v68) {
        int v70 = 1;
        v69 = v70;
      } else {
        int v71 = 1;
        int v72 = v51 + v71;
        v69 = v72;
      }
      v63 = v69;
      break;
    }
    default:
      {
      v63 = v51;
      break;
    }
    case 1:
      {
      int v73 = 16;
      int v74 = v73 + v51;
      int v75 = v50[v74];
      int v76 = 0;
      bool v77 = v75 != v76;
      int v78;
      if (v77) {
        int v79 = 0;
        int v80 = 0;
        int v81;
        int v82;
        v81 = v79;
        v82 = v80;
        while (true) {
          int v83 = 4;
          int v84 = v82 * v83;
          int v85 = v84 + v51;
          int v86 = 20;
          int v87 = v86 + v85;
          int v88 = v50[v87];
          int v89 = 0;
          bool v90 = v88 != v89;
          v81 = v81;
          v82 = v82;
          if (!v90) break;
          int v91 = v81 + v82;
          int v92 = 1;
          int v93 = v82 + v92;
          bool v94 = true;
          v81 = v91;
          v82 = v93;
          break;
          ;
        }
        v78 = v81;
      } else {
        int v95 = 3;
        v78 = v95;
      }
      v63 = v78;
      break;
    }
    case 2:
      {
      int v96 = 3;
      int v97 = v51 + v96;
      v63 = v97;
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
    static int32_t expected0[] = {static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 3; ++idx) {
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
