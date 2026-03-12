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
  int v6 = 2;
  int v7;
  v7 = v6;
  switch (v5) {
    case 0:
      {
      int v8 = 2;
      int v9 = v3 % v8;
      int v10 = 1;
      int v11;
      v11 = v10;
      switch (v9) {
        case 0:
          {
          int v12 = 3;
          int v13 = v3 % v12;
          int v14 = 0;
          int v15 = v0 + v14;
          int v16;
          v16 = v15;
          switch (v13) {
            case 0:
              {
              int v17 = 0;
              int v18 = v0 + v17;
              v16 = v18;
            }
            case 1:
              {
              int v19 = 3;
              int v20 = v0 + v19;
              v16 = v20;
              break;
            }
            default:
              {
              int v21 = 1;
              v16 = v21;
              break;
            }
            case 2:
              {
              int v22 = 2;
              int v23 = v0 + v22;
              v16 = v23;
              break;
            }
          }
          int v24 = 2;
          int v25 = v0 + v24;
          v11 = v16;
          break;
        }
        case 1:
          {
          int v26 = 0;
          bool v27 = v2 != v26;
          int v28;
          if (v27) {
            int v29 = 1;
            int v30 = v0 + v29;
            v28 = v30;
          } else {
            int v31 = 0;
            v28 = v31;
          }
          int v32 = 1;
          v11 = v28;
          break;
        }
        default:
          {
          int v33 = 2;
          int v34 = v3 % v33;
          int v35 = 4;
          int v36;
          v36 = v35;
          switch (v34) {
            case 0:
              {
              int v37 = 3;
              int v38 = v0 + v37;
              v36 = v38;
              break;
            }
            default:
              {
              v36 = v0;
              break;
            }
          }
          v11 = v36;
          break;
        }
      }
      int v39 = 2;
      int v40 = v0 + v39;
      v7 = v11;
      break;
    }
    default:
      {
      int v41 = 1;
      int v42 = v0 + v41;
      v7 = v42;
      break;
    }
  }
  bool v43 = true;
  int v44 = simt_wave_count_bits(v43);
  int v45 = 0;
  int v46 = v45 + v0;
  v1[v46] = v44;
  return;
}

kernel void kernel_main(device int* v47 [[buffer(0)]], device int* v48 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v49 = static_cast<int>(__simt_tid3.x);
  int v50 = 0;
  int v51 = v50 + v49;
  int v52 = v48[v51];
  int v53 = 4;
  int v54 = v53 + v49;
  int v55 = v48[v54];
  helper0(v49, v47, v52, v55, static_cast<int>(__simt_tid3.x));
  int v56 = 4;
  int v57 = 8;
  int v58 = v57 + v49;
  int v59 = v48[v58];
  int v60 = 0;
  bool v61 = v59 != v60;
  int v62;
  if (v61) {
    int v63 = 12;
    int v64 = v63 + v49;
    int v65 = v48[v64];
    uint v66 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v67 = (int)(v66);
    int v68;
    v68 = v67;
    switch (v65) {
      case 0:
        {
        int v69 = 16;
        int v70 = v69 + v49;
        int v71 = v48[v70];
        int v72 = 4;
        int v73;
        v73 = v72;
        switch (v71) {
          default:
            {
            int v74 = 4;
            int v75 = v49 + v74;
            v73 = v75;
            break;
          }
          case 0:
            {
            v73 = v49;
            break;
          }
        }
        bool v76 = true;
        v68 = v73;
        break;
      }
      default:
        {
        int v77 = 4;
        int v78 = v49 + v77;
        v68 = v78;
        break;
      }
      case 1:
        {
        int v79 = 20;
        int v80 = v79 + v49;
        int v81 = v48[v80];
        int v82 = 0;
        bool v83 = v81 != v82;
        int v84;
        if (v83) {
          int v85 = 0;
          v84 = v85;
        } else {
          int v86 = 3;
          v84 = v86;
        }
        v68 = v84;
        break;
      }
    }
    bool v87 = true;
    v62 = v68;
  } else {
    int v88 = 24;
    int v89 = v88 + v49;
    int v90 = v48[v89];
    int v91 = 0;
    bool v92 = v90 != v91;
    int v93;
    if (v92) {
      int v94 = 28;
      int v95 = v94 + v49;
      int v96 = v48[v95];
      int v97 = 0;
      bool v98 = v96 != v97;
      int v99;
      if (v98) {
        int v100 = 0;
        v99 = v100;
      } else {
        v99 = v49;
      }
      v93 = v99;
    } else {
      int v101 = 32;
      int v102 = v101 + v49;
      int v103 = v48[v102];
      int v104 = 0;
      bool v105 = v103 != v104;
      int v106;
      if (v105) {
        int v107 = 0;
        v106 = v107;
      } else {
        int v108 = 3;
        int v109 = v49 + v108;
        v106 = v109;
      }
      v93 = v106;
    }
    v62 = v93;
  }
  int v110 = 16;
  int v111 = v110 + v49;
  bool v112 = true;
  int v113 = simt_wave_count_bits(v112);
  v47[v111] = v113;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 36; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
