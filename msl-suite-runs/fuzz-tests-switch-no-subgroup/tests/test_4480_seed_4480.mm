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
  int v4 = 2;
  int v5 = v3 % v4;
  int v6;
  v6 = v0;
  switch (v5) {
    default:
      {
      int v7 = 2;
      int v8 = v3 % v7;
      int v9 = 1;
      int v10 = v0 + v9;
      int v11;
      v11 = v10;
      switch (v8) {
        default:
          {
          int v12 = 4;
          int v13 = v0 + v12;
          v11 = v13;
          break;
        }
        case 0:
          {
          int v14 = 0;
          bool v15 = v2 != v14;
          int v16;
          if (v15) {
            int v17 = 4;
            v16 = v17;
          } else {
            int v18 = 1;
            int v19 = v0 + v18;
            v16 = v19;
          }
          v11 = v16;
          break;
        }
        case 1:
          {
          v11 = v0;
          break;
        }
      }
      v6 = v11;
      break;
    }
    case 0:
      {
      v6 = v0;
      break;
    }
  }
  bool v20 = true;
  int v21 = simt_wave_count_bits(v20);
  int v22 = 0;
  int v23 = v22 + v0;
  v1[v23] = v21;
  return;
}

kernel void kernel_main(device int* v24 [[buffer(0)]], device int* v25 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v26 = static_cast<int>(__simt_tid3.x);
  int v27 = 0;
  int v28 = v27 + v26;
  int v29 = v25[v28];
  int v30 = 4;
  int v31 = v30 + v26;
  int v32 = v25[v31];
  helper0(v26, v24, v29, v32, static_cast<int>(__simt_tid3.x));
  int v33 = 8;
  int v34 = v33 + v26;
  int v35 = v25[v34];
  int v36 = 0;
  int v37;
  v37 = v36;
  switch (v35) {
    case 0:
      {
      int v38 = 12;
      int v39 = v38 + v26;
      int v40 = v25[v39];
      int v41 = 0;
      bool v42 = v40 != v41;
      int v43;
      if (v42) {
        int v44 = 16;
        int v45 = v44 + v26;
        int v46 = v25[v45];
        int v47 = 0;
        bool v48 = v46 != v47;
        int v49;
        if (v48) {
          v49 = v26;
        } else {
          int v50 = 0;
          v49 = v50;
        }
        v43 = v49;
      } else {
        int v51 = 20;
        int v52 = v51 + v26;
        int v53 = v25[v52];
        int v54;
        v54 = v26;
        switch (v53) {
          case 0:
            {
            v54 = v26;
          }
          case 1:
            {
            int v55 = 1;
            v54 = v55;
          }
          default:
            {
            int v56 = 3;
            v54 = v56;
            break;
          }
        }
        bool v57 = true;
        v43 = v54;
      }
      v37 = v43;
    }
    default:
      {
      int v58 = 3;
      v37 = v58;
    }
    case 1:
      {
      int v59 = 0;
      int v60 = 0;
      int v61;
      int v62;
      v61 = v59;
      v62 = v60;
      while (true) {
        int v63 = 4;
        int v64 = v62 * v63;
        int v65 = v64 + v26;
        int v66 = 24;
        int v67 = v66 + v65;
        int v68 = v25[v67];
        int v69 = 0;
        bool v70 = v68 != v69;
        v61 = v61;
        v62 = v62;
        if (!v70) break;
        int v71 = 44;
        int v72 = v71 + v26;
        int v73 = v25[v72];
        int v74 = 3;
        int v75 = v26 + v74;
        int v76;
        v76 = v75;
        switch (v73) {
          case 0:
            {
            v76 = v26;
          }
          default:
            {
            int v77 = 0;
            v76 = v77;
            break;
          }
        }
        int v78 = v61 + v76;
        int v79 = 1;
        int v80 = v62 + v79;
        bool v81 = true;
        v61 = v78;
        v62 = v80;
        break;
        ;
      }
      v37 = v61;
      break;
    }
  }
  uint v82 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v83 = (int)(v82);
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 4; ++idx) {
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
