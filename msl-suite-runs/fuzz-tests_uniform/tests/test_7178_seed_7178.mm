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
  int v4 = 1;
  int v5 = 3;
  int v6 = v3 % v5;
  uint v7 = simt_subgroup_id(__simt_tid);
  int v8 = (int)(v7);
  int v9;
  v9 = v8;
  switch (v6) {
    case 0:
      {
      v9 = v0;
      break;
    }
    case 1:
      {
      int v10 = 0;
      bool v11 = v2 != v10;
      int v12;
      if (v11) {
        int v13 = 1;
        v12 = v13;
      } else {
        int v14 = 4;
        v12 = v14;
      }
      int v15 = 3;
      v9 = v12;
    }
    default:
      {
      int v16 = 3;
      int v17 = v3 % v16;
      int v18;
      v18 = v0;
      switch (v17) {
        default:
          {
          int v19 = 2;
          int v20;
          v20 = v19;
          switch (v3) {
            default:
              {
              int v21 = 1;
              int v22 = v0 + v21;
              v20 = v22;
              break;
            }
            case 0:
              {
              int v23 = 4;
              int v24 = v0 + v23;
              v20 = v24;
              break;
            }
          }
          int v25 = 1;
          v18 = v20;
          break;
        }
        case 0:
          {
          int v26 = 3;
          int v27 = v3 % v26;
          int v28 = 4;
          int v29 = v0 + v28;
          int v30;
          v30 = v29;
          switch (v27) {
            case 0:
              {
              v30 = v0;
            }
            case 1:
              {
              int v31 = 0;
              v30 = v31;
              break;
            }
            default:
              {
              v30 = v0;
              break;
            }
            case 2:
              {
              int v32 = 1;
              int v33 = v0 + v32;
              v30 = v33;
              break;
            }
          }
          int v34 = 1;
          v18 = v30;
          break;
        }
        case 1:
          {
          int v35 = 3;
          int v36 = v3 % v35;
          int v37 = 4;
          int v38;
          v38 = v37;
          switch (v36) {
            case 0:
              {
              v38 = v0;
              break;
            }
            default:
              {
              int v39 = 1;
              int v40 = v0 + v39;
              v38 = v40;
              break;
            }
            case 1:
              {
              v38 = v0;
              break;
            }
            case 2:
              {
              int v41 = 0;
              v38 = v41;
              break;
            }
          }
          int v42 = 1;
          v18 = v38;
          break;
        }
        case 2:
          {
          int v43 = 0;
          int v44 = 0;
          int v45;
          int v46;
          v45 = v43;
          v46 = v44;
          while (true) {
            int v47 = 4;
            int v48 = v3 % v47;
            int v49 = 1;
            int v50 = v48 + v49;
            bool v51 = v46 < v50;
            v45 = v45;
            v46 = v46;
            if (!v51) break;
            int v52 = 1;
            int v53 = v0 + v52;
            int v54 = 1;
            int v55 = v46 + v54;
            v45 = v53;
            v46 = v55;
          }
          v18 = v45;
          break;
        }
      }
      v9 = v18;
      break;
    }
  }
  bool v56 = true;
  int v57 = simt_wave_count_bits(v56);
  int v58 = 0;
  int v59 = v58 + v0;
  v1[v59] = v57;
  int v60 = 0;
  bool v61 = v2 != v60;
  int v62 = v61 ? v4 : v9;
  return;
}

kernel void kernel_main(device int* v63 [[buffer(0)]], device int* v64 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v65 = static_cast<int>(__simt_tid3.x);
  int v66 = 0;
  int v67 = v66 + v65;
  int v68 = v64[v67];
  int v69 = 4;
  int v70 = v69 + v65;
  int v71 = v64[v70];
  helper0(v65, v63, v68, v71, static_cast<int>(__simt_tid3.x));
  int v72 = 4;
  int v73 = 8;
  int v74 = v73 + v65;
  int v75 = v64[v74];
  int v76 = 0;
  bool v77 = v75 != v76;
  int v78;
  if (v77) {
    int v79 = 0;
    int v80 = 0;
    int v81;
    int v82;
    v81 = v79;
    v82 = v80;
    while (true) {
      int v83 = 4;
      int v84 = v82 * v83;
      int v85 = v84 + v65;
      int v86 = 12;
      int v87 = v86 + v85;
      int v88 = v64[v87];
      int v89 = 0;
      bool v90 = v88 != v89;
      v81 = v81;
      v82 = v82;
      if (!v90) break;
      int v91 = v81 + v82;
      int v92 = 1;
      int v93 = v82 + v92;
      v81 = v91;
      v82 = v93;
    }
    bool v94 = true;
    v78 = v81;
  } else {
    int v95 = 32;
    int v96 = v95 + v65;
    int v97 = v64[v96];
    int v98 = 0;
    bool v99 = v97 != v98;
    int v100;
    if (v99) {
      int v101 = 2;
      v100 = v101;
    } else {
      int v102 = 36;
      int v103 = v102 + v65;
      int v104 = v64[v103];
      int v105;
      v105 = v65;
      switch (v104) {
        case 0:
          {
          v105 = v65;
          break;
        }
        case 1:
          {
          int v106 = 4;
          v105 = v106;
          break;
        }
        case 2:
          {
          int v107 = 1;
          int v108 = v65 + v107;
          v105 = v108;
          break;
        }
        default:
          {
          int v109 = 1;
          int v110 = v65 + v109;
          v105 = v110;
          break;
        }
      }
      bool v111 = true;
      v100 = v105;
    }
    v78 = v100;
  }
  int v112 = 16;
  int v113 = v112 + v65;
  bool v114 = true;
  int v115 = simt_wave_count_bits(v114);
  v63[v113] = v115;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
