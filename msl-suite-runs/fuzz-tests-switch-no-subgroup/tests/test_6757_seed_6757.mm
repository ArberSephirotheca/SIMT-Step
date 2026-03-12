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
  bool v4 = true;
  int v5 = simt_wave_count_bits(v4);
  int v6 = 0;
  int v7 = v6 + v0;
  v1[v7] = v5;
  int v8 = 3;
  int v9 = v3 % v8;
  int v10;
  v10 = v0;
  switch (v9) {
    case 0:
      {
      int v11 = 0;
      bool v12 = v2 != v11;
      int v13;
      if (v12) {
        int v14 = 4;
        v13 = v14;
      } else {
        int v15 = 4;
        int v16 = v3 % v15;
        int v17 = 0;
        int v18;
        v18 = v17;
        switch (v16) {
          case 0:
            {
            int v19 = 0;
            int v20 = v0 + v19;
            v18 = v20;
            break;
          }
          case 1:
            {
            v18 = v0;
            break;
          }
          case 2:
            {
            int v21 = 1;
            int v22 = v0 + v21;
            v18 = v22;
            break;
          }
          default:
            {
            int v23 = 4;
            int v24 = v0 + v23;
            v18 = v24;
            break;
          }
        }
        int v25 = 2;
        int v26 = v0 + v25;
        v13 = v18;
      }
      v10 = v13;
      break;
    }
    case 1:
      {
      int v27 = 4;
      int v28 = v0 + v27;
      v10 = v28;
      break;
    }
    default:
      {
      int v29 = 2;
      int v30 = v0 + v29;
      v10 = v30;
      break;
    }
  }
  int v31 = 0;
  bool v32 = v2 != v31;
  int v33 = v32 ? v5 : v10;
  return;
}

kernel void kernel_main(device int* v34 [[buffer(0)]], device int* v35 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v36 = static_cast<int>(__simt_tid3.x);
  int v37 = 0;
  int v38 = v37 + v36;
  int v39 = v35[v38];
  int v40 = 4;
  int v41 = v40 + v36;
  int v42 = v35[v41];
  helper0(v36, v34, v39, v42, static_cast<int>(__simt_tid3.x));
  int v43 = 8;
  int v44 = v43 + v36;
  int v45 = v35[v44];
  int v46 = 0;
  bool v47 = v45 != v46;
  int v48;
  if (v47) {
    int v49 = 2;
    int v50 = v36 + v49;
    v48 = v50;
  } else {
    int v51 = 0;
    v48 = v51;
  }
  int v52 = 16;
  int v53 = v52 + v36;
  bool v54 = true;
  int v55 = simt_wave_count_bits(v54);
  v34[v53] = v55;
  int v56 = 12;
  int v57 = v56 + v36;
  int v58 = v35[v57];
  int v59 = 0;
  int v60;
  v60 = v59;
  switch (v58) {
    default:
      {
      int v61 = 16;
      int v62 = v61 + v36;
      int v63 = v35[v62];
      int v64 = 0;
      bool v65 = v63 != v64;
      int v66;
      if (v65) {
        int v67 = 20;
        int v68 = v67 + v36;
        int v69 = v35[v68];
        int v70 = 0;
        int v71 = v36 + v70;
        int v72;
        v72 = v71;
        switch (v69) {
          default:
            {
            int v73 = 3;
            v72 = v73;
            break;
          }
          case 0:
            {
            int v74 = 1;
            int v75 = v36 + v74;
            v72 = v75;
            break;
          }
        }
        bool v76 = true;
        v66 = v72;
      } else {
        int v77 = 24;
        int v78 = v77 + v36;
        int v79 = v35[v78];
        int v80;
        v80 = v36;
        switch (v79) {
          default:
            {
            int v81 = 3;
            v80 = v81;
          }
          case 0:
            {
            int v82 = 2;
            v80 = v82;
            break;
          }
          case 1:
            {
            int v83 = 2;
            v80 = v83;
            break;
          }
        }
        v66 = v80;
      }
      v60 = v66;
      break;
    }
    case 0:
      {
      int v84 = 28;
      int v85 = v84 + v36;
      int v86 = v35[v85];
      int v87;
      v87 = v36;
      switch (v86) {
        case 0:
          {
          v87 = v36;
        }
        default:
          {
          int v88 = 32;
          int v89 = v88 + v36;
          int v90 = v35[v89];
          int v91 = 0;
          bool v92 = v90 != v91;
          int v93;
          if (v92) {
            int v94 = 3;
            v93 = v94;
          } else {
            v93 = v36;
          }
          v87 = v93;
          break;
        }
        case 1:
          {
          int v95 = 36;
          int v96 = v95 + v36;
          int v97 = v35[v96];
          int v98 = 0;
          bool v99 = v97 != v98;
          int v100;
          if (v99) {
            int v101 = 2;
            int v102 = v36 + v101;
            v100 = v102;
          } else {
            int v103 = 1;
            int v104 = v36 + v103;
            v100 = v104;
          }
          v87 = v100;
          break;
        }
      }
      v60 = v87;
    }
    case 1:
      {
      int v105 = 0;
      v60 = v105;
      break;
    }
  }
  int v106 = 1;
  int v107 = v36 + v106;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 40; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
