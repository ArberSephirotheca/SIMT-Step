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
  int v4 = 4;
  int v5 = v0 + v4;
  int v6 = 0;
  bool v7 = v2 != v6;
  int v8;
  if (v7) {
    int v9 = 4;
    v8 = v9;
  } else {
    int v10 = 0;
    bool v11 = v2 != v10;
    int v12;
    if (v11) {
      int v13 = 0;
      bool v14 = v2 != v13;
      int v15;
      if (v14) {
        uint v16 = simt_lane_id(__simt_tid);
        int v17 = (int)(v16);
        v15 = v17;
      } else {
        int v18 = 2;
        v15 = v18;
      }
      int v19 = 4;
      int v20 = v0 + v19;
      v12 = v15;
    } else {
      int v21 = 3;
      int v22 = v3 % v21;
      uint v23 = simt_lane_id(__simt_tid);
      int v24 = (int)(v23);
      int v25;
      v25 = v24;
      switch (v22) {
        case 0:
          {
          int v26 = 3;
          v25 = v26;
          break;
        }
        case 1:
          {
          int v27 = 4;
          v25 = v27;
          break;
        }
        case 2:
          {
          int v28 = 4;
          int v29 = v0 + v28;
          v25 = v29;
          break;
        }
        default:
          {
          int v30 = 2;
          int v31 = v0 + v30;
          v25 = v31;
          break;
        }
      }
      int v32 = 0;
      v12 = v25;
    }
    uint v33 = simt_subgroup_id(__simt_tid);
    int v34 = (int)(v33);
    v8 = v12;
  }
  bool v35 = true;
  int v36 = simt_wave_count_bits(v35);
  int v37 = 0;
  int v38 = v37 + v0;
  v1[v38] = v36;
  int v39 = 0;
  bool v40 = v2 != v39;
  int v41 = v40 ? v5 : v8;
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
  int v51 = 8;
  int v52 = v51 + v44;
  int v53 = v43[v52];
  int v54 = 4;
  int v55;
  v55 = v54;
  switch (v53) {
    case 0:
      {
      int v56 = 12;
      int v57 = v56 + v44;
      int v58 = v43[v57];
      int v59 = 0;
      bool v60 = v58 != v59;
      int v61;
      if (v60) {
        int v62 = 16;
        int v63 = v62 + v44;
        int v64 = v43[v63];
        int v65 = 0;
        bool v66 = v64 != v65;
        int v67;
        if (v66) {
          v67 = v44;
        } else {
          int v68 = 0;
          int v69 = v44 + v68;
          v67 = v69;
        }
        v61 = v67;
      } else {
        v61 = v44;
      }
      v55 = v61;
    }
    case 1:
      {
      int v70 = 20;
      int v71 = v70 + v44;
      int v72 = v43[v71];
      int v73 = 2;
      int v74 = v44 + v73;
      int v75;
      v75 = v74;
      switch (v72) {
        case 0:
          {
          int v76 = 24;
          int v77 = v76 + v44;
          int v78 = v43[v77];
          int v79 = 4;
          int v80;
          v80 = v79;
          switch (v78) {
            default:
              {
              int v81 = 4;
              int v82 = v44 + v81;
              v80 = v82;
              break;
            }
            case 0:
              {
              v80 = v44;
              break;
            }
            case 1:
              {
              v80 = v44;
              break;
            }
          }
          bool v83 = true;
          v75 = v80;
          break;
        }
        case 1:
          {
          int v84 = 2;
          v75 = v84;
          break;
        }
        default:
          {
          int v85 = 28;
          int v86 = v85 + v44;
          int v87 = v43[v86];
          int v88 = 0;
          bool v89 = v87 != v88;
          int v90;
          if (v89) {
            v90 = v44;
          } else {
            v90 = v44;
          }
          v75 = v90;
          break;
        }
      }
      bool v91 = true;
      v55 = v75;
    }
    default:
      {
      int v92 = 32;
      int v93 = v92 + v44;
      int v94 = v43[v93];
      int v95 = 0;
      bool v96 = v94 != v95;
      int v97;
      if (v96) {
        int v98 = 36;
        int v99 = v98 + v44;
        int v100 = v43[v99];
        int v101 = 4;
        int v102;
        v102 = v101;
        switch (v100) {
          case 0:
            {
            v102 = v44;
            break;
          }
          default:
            {
            v102 = v44;
            break;
          }
        }
        bool v103 = true;
        v97 = v102;
      } else {
        v97 = v44;
      }
      v55 = v97;
    }
    case 2:
      {
      int v104 = 3;
      v55 = v104;
      break;
    }
  }
  bool v105 = true;
  int v106 = 16;
  int v107 = v106 + v44;
  bool v108 = true;
  int v109 = simt_wave_count_bits(v108);
  v42[v107] = v109;
  int v110 = 4;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
