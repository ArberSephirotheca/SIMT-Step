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
    int v7 = 2;
    int v8 = v3 % v7;
    uint v9 = simt_lane_id(__simt_tid);
    int v10 = (int)(v9);
    int v11;
    v11 = v10;
    switch (v8) {
      default:
        {
        int v12 = 3;
        int v13 = v3 % v12;
        int v14 = 2;
        int v15;
        v15 = v14;
        switch (v13) {
          case 0:
            {
            int v16 = 3;
            int v17 = v0 + v16;
            v15 = v17;
          }
          case 1:
            {
            int v18 = 4;
            v15 = v18;
          }
          default:
            {
            int v19 = 1;
            v15 = v19;
            break;
          }
        }
        v11 = v15;
        break;
      }
      case 0:
        {
        int v20 = 3;
        v11 = v20;
        break;
      }
      case 1:
        {
        v11 = v0;
        break;
      }
    }
    v6 = v11;
  } else {
    int v21 = 0;
    int v22 = 0;
    int v23;
    int v24;
    v23 = v21;
    v24 = v22;
    while (true) {
      int v25 = 4;
      int v26 = v3 % v25;
      int v27 = 1;
      int v28 = v26 + v27;
      bool v29 = v24 < v28;
      v23 = v23;
      v24 = v24;
      if (!v29) break;
      int v30 = 0;
      bool v31 = v2 != v30;
      int v32;
      if (v31) {
        bool v33 = true;
        int v34 = simt_wave_count_bits(v33);
        int v35 = 0;
        int v36 = 4;
        int v37 = v24 * v36;
        int v38 = v35 + v37;
        int v39 = v38 + v0;
        v1[v39] = v34;
        v32 = v34;
      } else {
        bool v40 = true;
        int v41 = simt_wave_count_bits(v40);
        int v42 = 16;
        int v43 = 4;
        int v44 = v24 * v43;
        int v45 = v42 + v44;
        int v46 = v45 + v0;
        v1[v46] = v41;
        v32 = v41;
      }
      int v47 = 1;
      int v48 = v24 + v47;
      v23 = v32;
      v24 = v48;
    }
    v6 = v23;
  }
  return;
}

kernel void kernel_main(device int* v49 [[buffer(0)]], device int* v50 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v51 = static_cast<int>(__simt_tid3.x);
  int v52 = 0;
  int v53 = v52 + v51;
  int v54 = v50[v53];
  int v55 = 4;
  int v56 = v55 + v51;
  int v57 = v50[v56];
  helper0(v51, v49, v54, v57, static_cast<int>(__simt_tid3.x));
  uint v58 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v59 = (int)(v58);
  int v60 = 8;
  int v61 = v60 + v51;
  int v62 = v50[v61];
  int v63;
  v63 = v51;
  switch (v62) {
    default:
      {
      int v64 = 0;
      int v65 = 0;
      int v66;
      int v67;
      v66 = v64;
      v67 = v65;
      while (true) {
        int v68 = 4;
        int v69 = v67 * v68;
        int v70 = v69 + v51;
        int v71 = 12;
        int v72 = v71 + v70;
        int v73 = v50[v72];
        int v74 = 0;
        bool v75 = v73 != v74;
        v66 = v66;
        v67 = v67;
        if (!v75) break;
        int v76 = 32;
        int v77 = v76 + v51;
        int v78 = v50[v77];
        int v79 = 2;
        int v80;
        v80 = v79;
        switch (v78) {
          default:
            {
            int v81 = 2;
            int v82 = v51 + v81;
            v80 = v82;
          }
          case 0:
            {
            int v83 = 1;
            int v84 = v51 + v83;
            v80 = v84;
          }
          case 1:
            {
            v80 = v51;
            break;
          }
          case 2:
            {
            int v85 = 1;
            int v86 = v51 + v85;
            v80 = v86;
            break;
          }
        }
        int v87 = v66 + v80;
        int v88 = 1;
        int v89 = v67 + v88;
        bool v90 = true;
        v66 = v87;
        v67 = v89;
      }
      v63 = v66;
      break;
    }
    case 0:
      {
      int v91 = 36;
      int v92 = v91 + v51;
      int v93 = v50[v92];
      int v94;
      v94 = v51;
      switch (v93) {
        default:
          {
          int v95 = 0;
          v94 = v95;
        }
        case 0:
          {
          int v96 = 0;
          int v97 = v51 + v96;
          v94 = v97;
          break;
        }
        case 1:
          {
          int v98 = 40;
          int v99 = v98 + v51;
          int v100 = v50[v99];
          int v101;
          v101 = v51;
          switch (v100) {
            case 0:
              {
              v101 = v51;
            }
            default:
              {
              int v102 = 3;
              int v103 = v51 + v102;
              v101 = v103;
              break;
            }
          }
          v94 = v101;
        }
        case 2:
          {
          int v104 = 0;
          int v105 = v51 + v104;
          v94 = v105;
          break;
        }
      }
      bool v106 = true;
      v63 = v94;
      break;
    }
    case 1:
      {
      int v107 = 44;
      int v108 = v107 + v51;
      int v109 = v50[v108];
      int v110 = 0;
      bool v111 = v109 != v110;
      int v112;
      if (v111) {
        int v113 = 48;
        int v114 = v113 + v51;
        int v115 = v50[v114];
        int v116 = 1;
        int v117 = v51 + v116;
        int v118;
        v118 = v117;
        switch (v115) {
          default:
            {
            v118 = v51;
            break;
          }
          case 0:
            {
            v118 = v51;
            break;
          }
        }
        v112 = v118;
      } else {
        int v119 = 52;
        int v120 = v119 + v51;
        int v121 = v50[v120];
        int v122 = 3;
        int v123;
        v123 = v122;
        switch (v121) {
          case 0:
            {
            int v124 = 4;
            v123 = v124;
          }
          default:
            {
            int v125 = 2;
            int v126 = v51 + v125;
            v123 = v126;
            break;
          }
        }
        bool v127 = true;
        v112 = v123;
      }
      v63 = v112;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 32; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 56; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
