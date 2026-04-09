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
    v6 = v0;
  } else {
    int v7 = 0;
    bool v8 = v2 != v7;
    int v9;
    if (v8) {
      uint v10 = simt_subgroup_id(__simt_tid);
      int v11 = (int)(v10);
      v9 = v11;
    } else {
      int v12 = 0;
      int v13 = 0;
      int v14;
      int v15;
      v14 = v12;
      v15 = v13;
      while (true) {
        int v16 = 4;
        int v17 = v3 % v16;
        int v18 = 1;
        int v19 = v17 + v18;
        bool v20 = v15 < v19;
        v14 = v14;
        v15 = v15;
        if (!v20) break;
        int v21 = 1;
        int v22 = v0 + v21;
        int v23 = 1;
        int v24 = v15 + v23;
        v14 = v22;
        v15 = v24;
        continue;
        ;
      }
      v9 = v14;
    }
    uint v25 = simt_lane_id(__simt_tid);
    int v26 = (int)(v25);
    v6 = v9;
  }
  bool v27 = true;
  int v28 = simt_wave_count_bits(v27);
  int v29 = 0;
  int v30 = v29 + v0;
  v1[v30] = v28;
  return;
}

kernel void kernel_main(device int* v31 [[buffer(0)]], device int* v32 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v33 = static_cast<int>(__simt_tid3.x);
  int v34 = 0;
  int v35 = v34 + v33;
  int v36 = v32[v35];
  int v37 = 4;
  int v38 = v37 + v33;
  int v39 = v32[v38];
  helper0(v33, v31, v36, v39, static_cast<int>(__simt_tid3.x));
  int v40 = 8;
  int v41 = v40 + v33;
  int v42 = v32[v41];
  uint v43 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v44 = (int)(v43);
  int v45;
  v45 = v44;
  switch (v42) {
    case 0:
      {
      v45 = v33;
      break;
    }
    default:
      {
      int v46 = 12;
      int v47 = v46 + v33;
      int v48 = v32[v47];
      int v49 = 0;
      int v50 = v33 + v49;
      int v51;
      v51 = v50;
      switch (v48) {
        default:
          {
          int v52 = 16;
          int v53 = v52 + v33;
          int v54 = v32[v53];
          int v55 = 0;
          bool v56 = v54 != v55;
          int v57;
          if (v56) {
            int v58 = 4;
            v57 = v58;
          } else {
            int v59 = 0;
            v57 = v59;
          }
          v51 = v57;
        }
        case 0:
          {
          int v60 = 0;
          int v61 = 0;
          int v62;
          int v63;
          v62 = v60;
          v63 = v61;
          while (true) {
            int v64 = 4;
            int v65 = v63 * v64;
            int v66 = v65 + v33;
            int v67 = 20;
            int v68 = v67 + v66;
            int v69 = v32[v68];
            int v70 = 0;
            bool v71 = v69 != v70;
            v62 = v62;
            v63 = v63;
            if (!v71) break;
            int v72 = v62 + v63;
            int v73 = 1;
            int v74 = v63 + v73;
            v62 = v72;
            v63 = v74;
          }
          bool v75 = true;
          v51 = v62;
          break;
        }
        case 1:
          {
          int v76 = 0;
          int v77 = 0;
          int v78;
          int v79;
          v78 = v76;
          v79 = v77;
          while (true) {
            int v80 = 4;
            int v81 = v79 * v80;
            int v82 = v81 + v33;
            int v83 = 40;
            int v84 = v83 + v82;
            int v85 = v32[v84];
            int v86 = 0;
            bool v87 = v85 != v86;
            v78 = v78;
            v79 = v79;
            if (!v87) break;
            int v88 = v78 + v79;
            int v89 = 1;
            int v90 = v79 + v89;
            v78 = v88;
            v79 = v90;
          }
          bool v91 = true;
          v51 = v78;
        }
        case 2:
          {
          int v92 = 0;
          v51 = v92;
          break;
        }
      }
      bool v93 = true;
      v45 = v51;
      break;
    }
    case 1:
      {
      int v94 = 0;
      int v95 = 0;
      int v96;
      int v97;
      v96 = v94;
      v97 = v95;
      while (true) {
        int v98 = 4;
        int v99 = v97 * v98;
        int v100 = v99 + v33;
        int v101 = 60;
        int v102 = v101 + v100;
        int v103 = v32[v102];
        int v104 = 0;
        bool v105 = v103 != v104;
        v96 = v96;
        v97 = v97;
        if (!v105) break;
        int v106 = v96 + v97;
        int v107 = 1;
        int v108 = v97 + v107;
        v96 = v106;
        v97 = v108;
      }
      bool v109 = true;
      v45 = v96;
      break;
    }
  }
  bool v110 = true;
  int v111 = 16;
  int v112 = v111 + v33;
  bool v113 = true;
  int v114 = simt_wave_count_bits(v113);
  v31[v112] = v114;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 80; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
