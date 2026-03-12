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
  int v5 = v3 % v4;
  int v6 = 4;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      v8 = v0;
      break;
    }
    default:
      {
      v8 = v0;
      break;
    }
    case 1:
      {
      int v9 = 0;
      v8 = v9;
      break;
    }
    case 2:
      {
      int v10 = 0;
      bool v11 = v2 != v10;
      int v12;
      if (v11) {
        int v13 = 4;
        int v14;
        v14 = v13;
        switch (v3) {
          case 0:
            {
            v14 = v0;
            break;
          }
          default:
            {
            int v15 = 1;
            v14 = v15;
            break;
          }
        }
        v12 = v14;
      } else {
        v12 = v0;
      }
      v8 = v12;
      break;
    }
  }
  bool v16 = true;
  int v17 = simt_wave_count_bits(v16);
  int v18 = 0;
  int v19 = v18 + v0;
  v1[v19] = v17;
  return;
}

kernel void kernel_main(device int* v20 [[buffer(0)]], device int* v21 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v22 = static_cast<int>(__simt_tid3.x);
  int v23 = 0;
  int v24 = v23 + v22;
  int v25 = v21[v24];
  int v26 = 4;
  int v27 = v26 + v22;
  int v28 = v21[v27];
  int v29 = 0;
  bool v30 = v25 != v29;
  if (v30) {
    int v31 = 8;
    int v32 = v31 + v22;
    int v33 = v21[v32];
    int v34 = 0;
    bool v35 = v33 != v34;
    if (v35) {
    } else {
      helper0(v22, v20, v25, v28, static_cast<int>(__simt_tid3.x));
    }
  } else {
  }
  uint v36 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v37 = (int)(v36);
  int v38 = 12;
  int v39 = v38 + v22;
  int v40 = v21[v39];
  int v41 = 0;
  bool v42 = v40 != v41;
  int v43;
  if (v42) {
    int v44 = 16;
    int v45 = v44 + v22;
    int v46 = v21[v45];
    int v47 = 2;
    int v48;
    v48 = v47;
    switch (v46) {
      case 0:
        {
        int v49 = 20;
        int v50 = v49 + v22;
        int v51 = v21[v50];
        int v52 = 2;
        int v53 = v22 + v52;
        int v54;
        v54 = v53;
        switch (v51) {
          case 0:
            {
            int v55 = 1;
            int v56 = v22 + v55;
            v54 = v56;
            break;
          }
          case 1:
            {
            v54 = v22;
            break;
          }
          default:
            {
            v54 = v22;
            break;
          }
        }
        v48 = v54;
        break;
      }
      case 1:
        {
        int v57 = 1;
        v48 = v57;
        break;
      }
      default:
        {
        v48 = v22;
      }
      case 2:
        {
        int v58 = 24;
        int v59 = v58 + v22;
        int v60 = v21[v59];
        int v61 = 0;
        bool v62 = v60 != v61;
        int v63;
        if (v62) {
          int v64 = 2;
          int v65 = v22 + v64;
          v63 = v65;
        } else {
          int v66 = 2;
          v63 = v66;
        }
        v48 = v63;
        break;
      }
    }
    v43 = v48;
  } else {
    uint v67 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v68 = (int)(v67);
    v43 = v68;
  }
  int v69 = 16;
  int v70 = v69 + v22;
  bool v71 = true;
  int v72 = simt_wave_count_bits(v71);
  v20[v70] = v72;
  int v73 = 28;
  int v74 = v73 + v22;
  int v75 = v21[v74];
  uint v76 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v77 = (int)(v76);
  int v78;
  v78 = v77;
  switch (v75) {
    case 0:
      {
      int v79 = 32;
      int v80 = v79 + v22;
      int v81 = v21[v80];
      int v82 = 0;
      int v83 = v22 + v82;
      int v84;
      v84 = v83;
      switch (v81) {
        default:
          {
          int v85 = 36;
          int v86 = v85 + v22;
          int v87 = v21[v86];
          int v88;
          v88 = v22;
          switch (v87) {
            case 0:
              {
              int v89 = 0;
              v88 = v89;
            }
            default:
              {
              int v90 = 0;
              int v91 = v22 + v90;
              v88 = v91;
              break;
            }
            case 1:
              {
              v88 = v22;
              break;
            }
            case 2:
              {
              int v92 = 1;
              v88 = v92;
              break;
            }
          }
          v84 = v88;
          break;
        }
        case 0:
          {
          int v93 = 40;
          int v94 = v93 + v22;
          int v95 = v21[v94];
          int v96 = 2;
          int v97 = v22 + v96;
          int v98;
          v98 = v97;
          switch (v95) {
            case 0:
              {
              v98 = v22;
              break;
            }
            default:
              {
              int v99 = 3;
              v98 = v99;
              break;
            }
          }
          bool v100 = true;
          v84 = v98;
          break;
        }
        case 1:
          {
          int v101 = 2;
          v84 = v101;
          break;
        }
        case 2:
          {
          int v102 = 4;
          v84 = v102;
          break;
        }
      }
      v78 = v84;
    }
    default:
      {
      v78 = v22;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
