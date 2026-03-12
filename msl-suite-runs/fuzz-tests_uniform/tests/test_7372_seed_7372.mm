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
  uint v4 = simt_lane_id(__simt_tid);
  int v5 = (int)(v4);
  int v6 = 2;
  int v7 = v3 % v6;
  int v8 = 1;
  int v9 = v0 + v8;
  int v10;
  v10 = v9;
  switch (v7) {
    case 0:
      {
      int v11 = 0;
      bool v12 = v2 != v11;
      int v13;
      if (v12) {
        int v14 = 4;
        int v15 = v3 % v14;
        int v16;
        v16 = v0;
        switch (v15) {
          default:
            {
            int v17 = 3;
            v16 = v17;
            break;
          }
          case 0:
            {
            int v18 = 3;
            v16 = v18;
            break;
          }
          case 1:
            {
            v16 = v0;
            break;
          }
          case 2:
            {
            v16 = v0;
            break;
          }
        }
        v13 = v16;
      } else {
        v13 = v0;
      }
      v10 = v13;
      break;
    }
    case 1:
      {
      int v19 = 2;
      int v20 = v3 % v19;
      int v21;
      v21 = v0;
      switch (v20) {
        default:
          {
          int v22 = 0;
          int v23 = 0;
          int v24;
          int v25;
          v24 = v22;
          v25 = v23;
          while (true) {
            int v26 = 4;
            int v27 = v3 % v26;
            int v28 = 1;
            int v29 = v27 + v28;
            bool v30 = v25 < v29;
            v24 = v24;
            v25 = v25;
            if (!v30) break;
            int v31 = 3;
            int v32 = 1;
            int v33 = v25 + v32;
            v24 = v31;
            v25 = v33;
          }
          int v34 = 0;
          v21 = v24;
          break;
        }
        case 0:
          {
          int v35 = 0;
          int v36 = 0;
          int v37;
          int v38;
          v37 = v35;
          v38 = v36;
          while (true) {
            int v39 = 4;
            int v40 = v3 % v39;
            int v41 = 1;
            int v42 = v40 + v41;
            bool v43 = v38 < v42;
            v37 = v37;
            v38 = v38;
            if (!v43) break;
            int v44 = 1;
            int v45 = v38 + v44;
            v37 = v0;
            v38 = v45;
            break;
            ;
          }
          int v46 = 4;
          v21 = v37;
        }
        case 1:
          {
          int v47 = 2;
          v21 = v47;
          break;
        }
      }
      int v48 = 4;
      int v49 = v0 + v48;
      v10 = v21;
      break;
    }
    default:
      {
      int v50 = 1;
      int v51 = v0 + v50;
      v10 = v51;
      break;
    }
  }
  bool v52 = true;
  int v53 = simt_wave_count_bits(v52);
  int v54 = 0;
  int v55 = v54 + v0;
  v1[v55] = v53;
  int v56 = 0;
  bool v57 = v2 != v56;
  int v58 = v57 ? v5 : v10;
  return;
}

kernel void kernel_main(device int* v59 [[buffer(0)]], device int* v60 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v61 = static_cast<int>(__simt_tid3.x);
  int v62 = 0;
  int v63 = v62 + v61;
  int v64 = v60[v63];
  int v65 = 4;
  int v66 = v65 + v61;
  int v67 = v60[v66];
  helper0(v61, v59, v64, v67, static_cast<int>(__simt_tid3.x));
  uint v68 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v69 = (int)(v68);
  int v70 = 8;
  int v71 = v70 + v61;
  int v72 = v60[v71];
  int v73 = 0;
  bool v74 = v72 != v73;
  int v75;
  if (v74) {
    int v76 = 12;
    int v77 = v76 + v61;
    int v78 = v60[v77];
    int v79 = 0;
    bool v80 = v78 != v79;
    int v81;
    if (v80) {
      int v82 = 16;
      int v83 = v82 + v61;
      int v84 = v60[v83];
      int v85 = 1;
      int v86;
      v86 = v85;
      switch (v84) {
        default:
          {
          v86 = v61;
          break;
        }
        case 0:
          {
          int v87 = 2;
          v86 = v87;
          break;
        }
        case 1:
          {
          int v88 = 2;
          int v89 = v61 + v88;
          v86 = v89;
          break;
        }
      }
      bool v90 = true;
      v81 = v86;
    } else {
      int v91 = 20;
      int v92 = v91 + v61;
      int v93 = v60[v92];
      int v94 = 0;
      bool v95 = v93 != v94;
      int v96;
      if (v95) {
        uint v97 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v98 = (int)(v97);
        v96 = v98;
      } else {
        int v99 = 3;
        int v100 = v61 + v99;
        v96 = v100;
      }
      v81 = v96;
    }
    v75 = v81;
  } else {
    uint v101 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v102 = (int)(v101);
    v75 = v102;
  }
  int v103 = 16;
  int v104 = v103 + v61;
  bool v105 = true;
  int v106 = simt_wave_count_bits(v105);
  v59[v104] = v106;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 24; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
