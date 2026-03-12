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
  int v5 = 0;
  int v6;
  int v7;
  v6 = v4;
  v7 = v5;
  while (true) {
    int v8 = 4;
    int v9 = v3 % v8;
    int v10 = 1;
    int v11 = v9 + v10;
    bool v12 = v7 < v11;
    v6 = v6;
    v7 = v7;
    if (!v12) break;
    int v13 = 0;
    int v14 = 0;
    int v15;
    int v16;
    v15 = v13;
    v16 = v14;
    while (true) {
      int v17 = 4;
      int v18 = v3 % v17;
      int v19 = 1;
      int v20 = v18 + v19;
      bool v21 = v16 < v20;
      v15 = v15;
      v16 = v16;
      if (!v21) break;
      int v22 = 4;
      int v23 = v3 % v22;
      uint v24 = simt_subgroup_id(__simt_tid);
      int v25 = (int)(v24);
      int v26;
      v26 = v25;
      switch (v23) {
        default:
          {
          int v27 = 4;
          v26 = v27;
          break;
        }
        case 0:
          {
          int v28 = 2;
          v26 = v28;
          break;
        }
        case 1:
          {
          v26 = v0;
          break;
        }
        case 2:
          {
          int v29 = 0;
          v26 = v29;
          break;
        }
      }
      int v30 = 1;
      int v31 = v16 + v30;
      v15 = v26;
      v16 = v31;
      continue;
      ;
    }
    int v32 = 1;
    int v33 = v7 + v32;
    v6 = v15;
    v7 = v33;
  }
  bool v34 = true;
  int v35 = simt_wave_count_bits(v34);
  int v36 = 0;
  int v37 = v36 + v0;
  v1[v37] = v35;
  return;
}

kernel void kernel_main(device int* v38 [[buffer(0)]], device int* v39 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v40 = static_cast<int>(__simt_tid3.x);
  int v41 = 0;
  int v42 = v41 + v40;
  int v43 = v39[v42];
  int v44 = 4;
  int v45 = v44 + v40;
  int v46 = v39[v45];
  int v47 = 0;
  bool v48 = v43 != v47;
  if (v48) {
  } else {
    int v49 = 8;
    int v50 = v49 + v40;
    int v51 = v39[v50];
    int v52 = 0;
    bool v53 = v51 != v52;
    if (v53) {
    } else {
      int v54 = 4;
      int v55 = v40 % v54;
      int v56;
      v56 = v40;
      switch (v55) {
        default:
          {
          int v57 = 3;
          int v58 = v56 + v57;
          v56 = v58;
          break;
        }
        case 0:
          {
          int v59 = 1;
          int v60 = v56 + v59;
          v56 = v60;
          break;
        }
        case 1:
          {
          int v61 = 3;
          int v62 = v56 + v61;
          v56 = v62;
          break;
        }
        case 2:
          {
          int v63 = 0;
          int v64 = v56 + v63;
          v56 = v64;
          break;
        }
      }
      helper0(v40, v38, v43, v46, static_cast<int>(__simt_tid3.x));
    }
  }
  int v65 = 12;
  int v66 = v65 + v40;
  int v67 = v39[v66];
  uint v68 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v69 = (int)(v68);
  int v70;
  v70 = v69;
  switch (v67) {
    case 0:
      {
      int v71 = 3;
      int v72 = v40 + v71;
      v70 = v72;
      break;
    }
    default:
      {
      int v73 = 1;
      int v74 = v40 + v73;
      v70 = v74;
      break;
    }
    case 1:
      {
      int v75 = 16;
      int v76 = v75 + v40;
      int v77 = v39[v76];
      int v78 = 1;
      int v79 = v40 + v78;
      int v80;
      v80 = v79;
      switch (v77) {
        case 0:
          {
          int v81 = 0;
          int v82 = 0;
          int v83;
          int v84;
          v83 = v81;
          v84 = v82;
          while (true) {
            int v85 = 4;
            int v86 = v84 * v85;
            int v87 = v86 + v40;
            int v88 = 20;
            int v89 = v88 + v87;
            int v90 = v39[v89];
            int v91 = 0;
            bool v92 = v90 != v91;
            v83 = v83;
            v84 = v84;
            if (!v92) break;
            int v93 = v83 + v84;
            int v94 = 1;
            int v95 = v84 + v94;
            bool v96 = true;
            v83 = v93;
            v84 = v95;
            continue;
            ;
          }
          v80 = v83;
          break;
        }
        case 1:
          {
          int v97 = 40;
          int v98 = v97 + v40;
          int v99 = v39[v98];
          int v100;
          v100 = v40;
          switch (v99) {
            case 0:
              {
              int v101 = 2;
              v100 = v101;
              break;
            }
            default:
              {
              int v102 = 1;
              int v103 = v40 + v102;
              v100 = v103;
            }
            case 1:
              {
              v100 = v40;
              break;
            }
          }
          v80 = v100;
          break;
        }
        default:
          {
          int v104 = 44;
          int v105 = v104 + v40;
          int v106 = v39[v105];
          int v107;
          v107 = v40;
          switch (v106) {
            case 0:
              {
              int v108 = 4;
              int v109 = v40 + v108;
              v107 = v109;
              break;
            }
            default:
              {
              int v110 = 2;
              int v111 = v40 + v110;
              v107 = v111;
              break;
            }
            case 1:
              {
              int v112 = 3;
              int v113 = v40 + v112;
              v107 = v113;
              break;
            }
            case 2:
              {
              v107 = v40;
              break;
            }
          }
          v80 = v107;
          break;
        }
      }
      v70 = v80;
      break;
    }
  }
  bool v114 = true;
  int v115 = 16;
  int v116 = v115 + v40;
  bool v117 = true;
  int v118 = simt_wave_count_bits(v117);
  v38[v116] = v118;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 48; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
