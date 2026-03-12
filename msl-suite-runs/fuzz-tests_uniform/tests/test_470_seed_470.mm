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
    int v7 = 2;
    int v8 = v3 % v7;
    int v9;
    v9 = v0;
    switch (v8) {
      case 0:
        {
        int v10 = 0;
        int v11 = 0;
        int v12;
        int v13;
        v12 = v10;
        v13 = v11;
        while (true) {
          int v14 = 4;
          int v15 = v3 % v14;
          int v16 = 1;
          int v17 = v15 + v16;
          bool v18 = v13 < v17;
          v12 = v12;
          v13 = v13;
          if (!v18) break;
          int v19 = 2;
          int v20 = 1;
          int v21 = v13 + v20;
          v12 = v19;
          v13 = v21;
        }
        int v22 = 0;
        int v23 = v0 + v22;
        v9 = v12;
        break;
      }
      default:
        {
        v9 = v0;
        break;
      }
    }
    int v24 = 4;
    int v25 = v0 + v24;
    v6 = v9;
  } else {
    int v26;
    v26 = v0;
    switch (v3) {
      case 0:
        {
        int v27 = 2;
        int v28 = v3 % v27;
        int v29 = 4;
        int v30 = v0 + v29;
        int v31;
        v31 = v30;
        switch (v28) {
          case 0:
            {
            v31 = v0;
          }
          default:
            {
            int v32 = 2;
            int v33 = v0 + v32;
            v31 = v33;
            break;
          }
          case 1:
            {
            int v34 = 2;
            int v35 = v0 + v34;
            v31 = v35;
            break;
          }
        }
        int v36 = 3;
        int v37 = v0 + v36;
        v26 = v31;
        break;
      }
      default:
        {
        int v38 = 0;
        bool v39 = v2 != v38;
        int v40;
        if (v39) {
          int v41 = 0;
          v40 = v41;
        } else {
          v40 = v0;
        }
        v26 = v40;
        break;
      }
    }
    v6 = v26;
  }
  bool v42 = true;
  int v43 = simt_wave_count_bits(v42);
  int v44 = 0;
  int v45 = v44 + v0;
  v1[v45] = v43;
  return;
}

kernel void kernel_main(device int* v46 [[buffer(0)]], device int* v47 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v48 = static_cast<int>(__simt_tid3.x);
  int v49 = 0;
  int v50 = v49 + v48;
  int v51 = v47[v50];
  int v52 = 4;
  int v53 = v52 + v48;
  int v54 = v47[v53];
  helper0(v48, v46, v51, v54, static_cast<int>(__simt_tid3.x));
  int v55 = 0;
  int v56 = 0;
  int v57;
  int v58;
  v57 = v55;
  v58 = v56;
  while (true) {
    int v59 = 4;
    int v60 = v58 * v59;
    int v61 = v60 + v48;
    int v62 = 8;
    int v63 = v62 + v61;
    int v64 = v47[v63];
    int v65 = 0;
    bool v66 = v64 != v65;
    v57 = v57;
    v58 = v58;
    if (!v66) break;
    int v67 = 28;
    int v68 = v67 + v48;
    int v69 = v47[v68];
    int v70 = 2;
    int v71 = v48 + v70;
    int v72;
    v72 = v71;
    switch (v69) {
      case 0:
        {
        int v73 = 32;
        int v74 = v73 + v48;
        int v75 = v47[v74];
        int v76 = 0;
        bool v77 = v75 != v76;
        int v78;
        if (v77) {
          int v79 = 2;
          int v80 = v48 + v79;
          v78 = v80;
        } else {
          int v81 = 3;
          int v82 = v48 + v81;
          v78 = v82;
        }
        v72 = v78;
        break;
      }
      case 1:
        {
        int v83 = 36;
        int v84 = v83 + v48;
        int v85 = v47[v84];
        int v86 = 0;
        int v87;
        v87 = v86;
        switch (v85) {
          case 0:
            {
            int v88 = 4;
            int v89 = v48 + v88;
            v87 = v89;
            break;
          }
          case 1:
            {
            int v90 = 0;
            int v91 = v48 + v90;
            v87 = v91;
          }
          default:
            {
            v87 = v48;
          }
          case 2:
            {
            int v92 = 0;
            int v93 = v48 + v92;
            v87 = v93;
            break;
          }
        }
        bool v94 = true;
        v72 = v87;
        break;
      }
      default:
        {
        int v95 = 40;
        int v96 = v95 + v48;
        int v97 = v47[v96];
        int v98 = 2;
        int v99;
        v99 = v98;
        switch (v97) {
          case 0:
            {
            int v100 = 3;
            int v101 = v48 + v100;
            v99 = v101;
            break;
          }
          default:
            {
            v99 = v48;
            break;
          }
        }
        bool v102 = true;
        v72 = v99;
        break;
      }
    }
    bool v103 = true;
    int v104 = v57 + v72;
    int v105 = 1;
    int v106 = v58 + v105;
    v57 = v104;
    v58 = v106;
    break;
    ;
  }
  bool v107 = true;
  int v108 = 16;
  int v109 = v108 + v48;
  bool v110 = true;
  int v111 = simt_wave_count_bits(v110);
  v46[v109] = v111;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
