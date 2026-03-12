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
  int v6 = 0;
  int v7;
  v7 = v6;
  switch (v5) {
    case 0:
      {
      int v8 = 0;
      int v9 = v0 + v8;
      v7 = v9;
      break;
    }
    case 1:
      {
      int v10;
      v10 = v0;
      switch (v3) {
        case 0:
          {
          int v11;
          v11 = v0;
          switch (v3) {
            case 0:
              {
              int v12 = 4;
              int v13 = v0 + v12;
              v11 = v13;
              break;
            }
            default:
              {
              int v14 = 4;
              v11 = v14;
              break;
            }
          }
          v10 = v11;
          break;
        }
        default:
          {
          int v15 = 3;
          int v16 = v0 + v15;
          v10 = v16;
          break;
        }
      }
      int v17 = 3;
      int v18 = v0 + v17;
      v7 = v10;
      break;
    }
    default:
      {
      int v19 = 3;
      int v20 = v3 % v19;
      int v21 = 3;
      int v22;
      v22 = v21;
      switch (v20) {
        case 0:
          {
          int v23 = 0;
          int v24 = 0;
          int v25;
          int v26;
          v25 = v23;
          v26 = v24;
          while (true) {
            int v27 = 4;
            int v28 = v3 % v27;
            int v29 = 1;
            int v30 = v28 + v29;
            bool v31 = v26 < v30;
            v25 = v25;
            v26 = v26;
            if (!v31) break;
            int v32 = 4;
            int v33 = 1;
            int v34 = v26 + v33;
            v25 = v32;
            v26 = v34;
          }
          int v35 = 1;
          int v36 = v0 + v35;
          v22 = v25;
          break;
        }
        default:
          {
          int v37 = 0;
          bool v38 = v2 != v37;
          int v39;
          if (v38) {
            v39 = v0;
          } else {
            int v40 = 0;
            int v41 = v0 + v40;
            v39 = v41;
          }
          int v42 = 4;
          int v43 = v0 + v42;
          v22 = v39;
          break;
        }
        case 1:
          {
          int v44 = 3;
          int v45 = v3 % v44;
          int v46 = 4;
          int v47 = v0 + v46;
          int v48;
          v48 = v47;
          switch (v45) {
            case 0:
              {
              int v49 = 3;
              v48 = v49;
              break;
            }
            case 1:
              {
              int v50 = 2;
              int v51 = v0 + v50;
              v48 = v51;
              break;
            }
            default:
              {
              int v52 = 3;
              v48 = v52;
              break;
            }
          }
          int v53 = 4;
          int v54 = v0 + v53;
          v22 = v48;
          break;
        }
        case 2:
          {
          v22 = v0;
          break;
        }
      }
      v7 = v22;
      break;
    }
    case 2:
      {
      int v55 = 4;
      int v56 = v0 + v55;
      v7 = v56;
      break;
    }
  }
  bool v57 = true;
  int v58 = simt_wave_count_bits(v57);
  int v59 = 0;
  int v60 = v59 + v0;
  v1[v60] = v58;
  int v61 = 0;
  bool v62 = v2 != v61;
  int v63 = v62 ? v0 : v7;
  return;
}

kernel void kernel_main(device int* v64 [[buffer(0)]], device int* v65 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v66 = static_cast<int>(__simt_tid3.x);
  int v67 = 0;
  int v68 = v67 + v66;
  int v69 = v65[v68];
  int v70 = 4;
  int v71 = v70 + v66;
  int v72 = v65[v71];
  helper0(v66, v64, v69, v72, static_cast<int>(__simt_tid3.x));
  int v73 = 8;
  int v74 = v73 + v66;
  int v75 = v65[v74];
  int v76 = 0;
  bool v77 = v75 != v76;
  int v78;
  if (v77) {
    int v79 = 12;
    int v80 = v79 + v66;
    int v81 = v65[v80];
    int v82 = 0;
    bool v83 = v81 != v82;
    int v84;
    if (v83) {
      int v85 = 16;
      int v86 = v85 + v66;
      int v87 = v65[v86];
      int v88 = 0;
      bool v89 = v87 != v88;
      int v90;
      if (v89) {
        uint v91 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v92 = (int)(v91);
        v90 = v92;
      } else {
        v90 = v66;
      }
      v84 = v90;
    } else {
      int v93 = 0;
      int v94 = 0;
      int v95;
      int v96;
      v95 = v93;
      v96 = v94;
      while (true) {
        int v97 = 4;
        int v98 = v96 * v97;
        int v99 = v98 + v66;
        int v100 = 20;
        int v101 = v100 + v99;
        int v102 = v65[v101];
        int v103 = 0;
        bool v104 = v102 != v103;
        v95 = v95;
        v96 = v96;
        if (!v104) break;
        int v105 = v95 + v96;
        int v106 = 1;
        int v107 = v96 + v106;
        v95 = v105;
        v96 = v107;
      }
      bool v108 = true;
      v84 = v95;
    }
    v78 = v84;
  } else {
    uint v109 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v110 = (int)(v109);
    v78 = v110;
  }
  int v111 = 16;
  int v112 = v111 + v66;
  bool v113 = true;
  int v114 = simt_wave_count_bits(v113);
  v64[v112] = v114;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
