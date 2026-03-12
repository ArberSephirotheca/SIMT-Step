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
  int v6;
  v6 = v0;
  switch (v5) {
    case 0:
      {
      int v7 = 0;
      int v8 = 0;
      int v9;
      int v10;
      v9 = v7;
      v10 = v8;
      while (true) {
        int v11 = 4;
        int v12 = v3 % v11;
        int v13 = 1;
        int v14 = v12 + v13;
        bool v15 = v10 < v14;
        v9 = v9;
        v10 = v10;
        if (!v15) break;
        int v16 = 0;
        bool v17 = v2 != v16;
        int v18;
        if (v17) {
          int v19 = 1;
          v18 = v19;
        } else {
          v18 = v0;
        }
        int v20 = 1;
        int v21 = v10 + v20;
        v9 = v18;
        v10 = v21;
      }
      v6 = v9;
      break;
    }
    default:
      {
      v6 = v0;
      break;
    }
    case 1:
      {
      int v22 = 4;
      int v23 = v3 % v22;
      int v24 = 4;
      int v25;
      v25 = v24;
      switch (v23) {
        case 0:
          {
          int v26 = 0;
          bool v27 = v2 != v26;
          int v28;
          if (v27) {
            v28 = v0;
          } else {
            int v29 = 4;
            v28 = v29;
          }
          v25 = v28;
          break;
        }
        case 1:
          {
          int v30 = 3;
          int v31 = v3 % v30;
          int v32 = 2;
          int v33 = v0 + v32;
          int v34;
          v34 = v33;
          switch (v31) {
            case 0:
              {
              int v35 = 4;
              v34 = v35;
            }
            default:
              {
              v34 = v0;
              break;
            }
            case 1:
              {
              int v36 = 2;
              int v37 = v0 + v36;
              v34 = v37;
              break;
            }
            case 2:
              {
              int v38 = 2;
              int v39 = v0 + v38;
              v34 = v39;
              break;
            }
          }
          v25 = v34;
          break;
        }
        case 2:
          {
          int v40 = 1;
          v25 = v40;
          break;
        }
        default:
          {
          int v41 = 3;
          int v42 = v3 % v41;
          int v43 = 1;
          int v44;
          v44 = v43;
          switch (v42) {
            default:
              {
              int v45 = 1;
              v44 = v45;
              break;
            }
            case 0:
              {
              int v46 = 3;
              int v47 = v0 + v46;
              v44 = v47;
              break;
            }
            case 1:
              {
              int v48 = 1;
              v44 = v48;
              break;
            }
          }
          v25 = v44;
          break;
        }
      }
      v6 = v25;
      break;
    }
  }
  bool v49 = true;
  int v50 = simt_wave_count_bits(v49);
  int v51 = 0;
  int v52 = v51 + v0;
  v1[v52] = v50;
  return;
}

kernel void kernel_main(device int* v53 [[buffer(0)]], device int* v54 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v55 = static_cast<int>(__simt_tid3.x);
  int v56 = 0;
  int v57 = v56 + v55;
  int v58 = v54[v57];
  int v59 = 4;
  int v60 = v59 + v55;
  int v61 = v54[v60];
  int v62 = 0;
  bool v63 = v58 != v62;
  if (v63) {
  } else {
    int v64 = 8;
    int v65 = v64 + v55;
    int v66 = v54[v65];
    int v67 = 0;
    bool v68 = v66 != v67;
    if (v68) {
      int v69 = 3;
      int v70 = v55 % v69;
      int v71 = 1;
      int v72 = v55 + v71;
      int v73;
      v73 = v72;
      switch (v70) {
        default:
          {
          int v74 = 0;
          int v75 = v73 + v74;
          v73 = v75;
          break;
        }
        case 0:
          {
          int v76 = 4;
          int v77 = v73 + v76;
          v73 = v77;
          break;
        }
        case 1:
          {
          int v78 = 4;
          int v79 = v73 + v78;
          v73 = v79;
          break;
        }
      }
      helper0(v55, v53, v58, v61, static_cast<int>(__simt_tid3.x));
    } else {
    }
  }
  int v80 = 12;
  int v81 = v80 + v55;
  int v82 = v54[v81];
  int v83 = 1;
  int v84;
  v84 = v83;
  switch (v82) {
    case 0:
      {
      v84 = v55;
      break;
    }
    default:
      {
      int v85 = 4;
      v84 = v85;
      break;
    }
    case 1:
      {
      int v86 = 0;
      v84 = v86;
      break;
    }
    case 2:
      {
      int v87 = 0;
      int v88 = 0;
      int v89;
      int v90;
      v89 = v87;
      v90 = v88;
      while (true) {
        int v91 = 4;
        int v92 = v90 * v91;
        int v93 = v92 + v55;
        int v94 = 16;
        int v95 = v94 + v93;
        int v96 = v54[v95];
        int v97 = 0;
        bool v98 = v96 != v97;
        v89 = v89;
        v90 = v90;
        if (!v98) break;
        int v99 = 36;
        int v100 = v99 + v55;
        int v101 = v54[v100];
        int v102 = 0;
        bool v103 = v101 != v102;
        int v104;
        if (v103) {
          v104 = v55;
        } else {
          v104 = v55;
        }
        int v105 = v89 + v104;
        int v106 = 1;
        int v107 = v90 + v106;
        bool v108 = true;
        v89 = v105;
        v90 = v107;
      }
      v84 = v89;
      break;
    }
  }
  uint v109 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v110 = (int)(v109);
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
    static int32_t expected0[] = {};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 0; ++idx) {
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
