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
  int v4 = 3;
  int v5 = 0;
  int v6 = 0;
  int v7;
  int v8;
  v7 = v5;
  v8 = v6;
  while (true) {
    int v9 = 4;
    int v10 = v3 % v9;
    int v11 = 1;
    int v12 = v10 + v11;
    bool v13 = v8 < v12;
    v7 = v7;
    v8 = v8;
    if (!v13) break;
    int v14 = 0;
    int v15 = 0;
    int v16;
    int v17;
    v16 = v14;
    v17 = v15;
    while (true) {
      int v18 = 4;
      int v19 = v3 % v18;
      int v20 = 1;
      int v21 = v19 + v20;
      bool v22 = v17 < v21;
      v16 = v16;
      v17 = v17;
      if (!v22) break;
      int v23 = 2;
      int v24 = v3 % v23;
      int v25 = 2;
      int v26 = v0 + v25;
      int v27;
      v27 = v26;
      switch (v24) {
        case 0:
          {
          v27 = v0;
          break;
        }
        default:
          {
          v27 = v0;
          break;
        }
        case 1:
          {
          v27 = v0;
          break;
        }
      }
      int v28 = 2;
      int v29 = v0 + v28;
      int v30 = 1;
      int v31 = v17 + v30;
      v16 = v27;
      v17 = v31;
    }
    int v32 = 3;
    int v33 = 1;
    int v34 = v8 + v33;
    v7 = v16;
    v8 = v34;
    continue;
    ;
  }
  bool v35 = true;
  int v36 = simt_wave_count_bits(v35);
  int v37 = 0;
  int v38 = v37 + v0;
  v1[v38] = v36;
  int v39 = 0;
  bool v40 = v2 != v39;
  int v41 = v40 ? v4 : v7;
  return;
}

kernel void kernel_main(device int* v42 [[buffer(0)]], device int* v43 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v44 = static_cast<int>(__simt_tid3.x);
  int v45 = 0;
  int v46 = v45 + v44;
  int v47 = v43[v46];
  int v48 = 4;
  int v49 = v48 + v44;
  int v50 = v43[v49];
  helper0(v44, v42, v47, v50, static_cast<int>(__simt_tid3.x));
  int v51 = 2;
  int v52 = v44 + v51;
  int v53 = 8;
  int v54 = v53 + v44;
  int v55 = v43[v54];
  int v56;
  v56 = v44;
  switch (v55) {
    case 0:
      {
      int v57 = 12;
      int v58 = v57 + v44;
      int v59 = v43[v58];
      int v60 = 3;
      int v61 = v44 + v60;
      int v62;
      v62 = v61;
      switch (v59) {
        case 0:
          {
          v62 = v44;
          break;
        }
        default:
          {
          int v63 = 16;
          int v64 = v63 + v44;
          int v65 = v43[v64];
          int v66 = 0;
          bool v67 = v65 != v66;
          int v68;
          if (v67) {
            int v69 = 2;
            int v70 = v44 + v69;
            v68 = v70;
          } else {
            int v71 = 2;
            int v72 = v44 + v71;
            v68 = v72;
          }
          v62 = v68;
          break;
        }
      }
      bool v73 = true;
      v56 = v62;
      break;
    }
    case 1:
      {
      int v74 = 20;
      int v75 = v74 + v44;
      int v76 = v43[v75];
      int v77 = 0;
      bool v78 = v76 != v77;
      int v79;
      if (v78) {
        int v80 = 24;
        int v81 = v80 + v44;
        int v82 = v43[v81];
        int v83;
        v83 = v44;
        switch (v82) {
          default:
            {
            int v84 = 0;
            int v85 = v44 + v84;
            v83 = v85;
            break;
          }
          case 0:
            {
            int v86 = 1;
            int v87 = v44 + v86;
            v83 = v87;
            break;
          }
          case 1:
            {
            int v88 = 1;
            v83 = v88;
            break;
          }
          case 2:
            {
            int v89 = 3;
            int v90 = v44 + v89;
            v83 = v90;
            break;
          }
        }
        bool v91 = true;
        v79 = v83;
      } else {
        int v92 = 28;
        int v93 = v92 + v44;
        int v94 = v43[v93];
        int v95 = 0;
        bool v96 = v94 != v95;
        int v97;
        if (v96) {
          int v98 = 2;
          v97 = v98;
        } else {
          int v99 = 4;
          int v100 = v44 + v99;
          v97 = v100;
        }
        v79 = v97;
      }
      v56 = v79;
      break;
    }
    case 2:
      {
      int v101 = 2;
      int v102 = v44 + v101;
      v56 = v102;
      break;
    }
    default:
      {
      int v103 = 2;
      int v104 = v44 + v103;
      v56 = v104;
      break;
    }
  }
  bool v105 = true;
  int v106 = 16;
  int v107 = v106 + v44;
  bool v108 = true;
  int v109 = simt_wave_count_bits(v108);
  v42[v107] = v109;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 32; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
