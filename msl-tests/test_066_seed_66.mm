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
  uint v4 = simt_subgroup_id(__simt_tid);
  int v5 = (int)(v4);
  int v6 = 2;
  int v7 = v3 % v6;
  int v8 = 0;
  int v9 = v0 + v8;
  int v10;
  v10 = v9;
  switch (v7) {
    case 0:
      {
      int v11 = 3;
      v10 = v11;
      break;
    }
    case 1:
      {
      int v12 = 0;
      bool v13 = v2 != v12;
      int v14;
      if (v13) {
        int v15 = 0;
        int v16 = 0;
        int v17;
        int v18;
        v17 = v15;
        v18 = v16;
        while (true) {
          int v19 = 4;
          int v20 = v3 % v19;
          int v21 = 1;
          int v22 = v20 + v21;
          bool v23 = v18 < v22;
          v17 = v17;
          v18 = v18;
          if (!v23) break;
          int v24 = 1;
          int v25 = v18 + v24;
          v17 = v0;
          v18 = v25;
        }
        int v26 = 0;
        int v27 = v0 + v26;
        v14 = v17;
      } else {
        int v28 = 2;
        int v29 = v3 % v28;
        int v30 = 3;
        int v31 = v0 + v30;
        int v32;
        v32 = v31;
        switch (v29) {
          case 0:
            {
            int v33 = 4;
            v32 = v33;
            break;
          }
          case 1:
            {
            v32 = v0;
            break;
          }
          default:
            {
            v32 = v0;
            break;
          }
        }
        int v34 = 0;
        v14 = v32;
      }
      v10 = v14;
      break;
    }
    default:
      {
      int v35 = 2;
      int v36 = v3 % v35;
      int v37 = 3;
      int v38;
      v38 = v37;
      switch (v36) {
        default:
          {
          int v39 = 2;
          int v40 = v3 % v39;
          int v41 = 0;
          int v42 = v0 + v41;
          int v43;
          v43 = v42;
          switch (v40) {
            default:
              {
              v43 = v0;
            }
            case 0:
              {
              v43 = v0;
            }
            case 1:
              {
              int v44 = 0;
              v43 = v44;
              break;
            }
          }
          v38 = v43;
          break;
        }
        case 0:
          {
          int v45 = 0;
          int v46 = 0;
          int v47;
          int v48;
          v47 = v45;
          v48 = v46;
          while (true) {
            int v49 = 4;
            int v50 = v3 % v49;
            int v51 = 1;
            int v52 = v50 + v51;
            bool v53 = v48 < v52;
            v47 = v47;
            v48 = v48;
            if (!v53) break;
            int v54 = 1;
            int v55 = v48 + v54;
            v47 = v0;
            v48 = v55;
          }
          v38 = v47;
          break;
        }
        case 1:
          {
          int v56 = 0;
          int v57 = 0;
          int v58;
          int v59;
          v58 = v56;
          v59 = v57;
          while (true) {
            int v60 = 4;
            int v61 = v3 % v60;
            int v62 = 1;
            int v63 = v61 + v62;
            bool v64 = v59 < v63;
            v58 = v58;
            v59 = v59;
            if (!v64) break;
            int v65 = 1;
            int v66 = v59 + v65;
            v58 = v0;
            v59 = v66;
          }
          int v67 = 0;
          v38 = v58;
          break;
        }
      }
      v10 = v38;
      break;
    }
  }
  bool v68 = true;
  int v69 = simt_wave_count_bits(v68);
  int v70 = 0;
  int v71 = v70 + v0;
  v1[v71] = v69;
  int v72 = 0;
  bool v73 = v2 != v72;
  int v74 = v73 ? v5 : v10;
  return;
}

kernel void kernel_main(device int* v75 [[buffer(0)]], device int* v76 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v77 = static_cast<int>(__simt_tid3.x);
  int v78 = 0;
  int v79 = v78 + v77;
  int v80 = v76[v79];
  int v81 = 4;
  int v82 = v81 + v77;
  int v83 = v76[v82];
  helper0(v77, v75, v80, v83, static_cast<int>(__simt_tid3.x));
  int v84 = 0;
  int v85 = v77 + v84;
  int v86 = 8;
  int v87 = v86 + v77;
  int v88 = v76[v87];
  int v89 = 0;
  bool v90 = v88 != v89;
  int v91;
  if (v90) {
    int v92 = 0;
    int v93 = 0;
    int v94;
    int v95;
    v94 = v92;
    v95 = v93;
    while (true) {
      int v96 = 4;
      int v97 = v95 * v96;
      int v98 = v97 + v77;
      int v99 = 12;
      int v100 = v99 + v98;
      int v101 = v76[v100];
      int v102 = 0;
      bool v103 = v101 != v102;
      v94 = v94;
      v95 = v95;
      if (!v103) break;
      int v104 = v94 + v95;
      int v105 = 1;
      int v106 = v95 + v105;
      v94 = v104;
      v95 = v106;
    }
    bool v107 = true;
    v91 = v94;
  } else {
    int v108 = 32;
    int v109 = v108 + v77;
    int v110 = v76[v109];
    uint v111 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v112 = (int)(v111);
    int v113;
    v113 = v112;
    switch (v110) {
      case 0:
        {
        int v114 = 36;
        int v115 = v114 + v77;
        int v116 = v76[v115];
        int v117 = 2;
        int v118 = v77 + v117;
        int v119;
        v119 = v118;
        switch (v116) {
          case 0:
            {
            int v120 = 1;
            int v121 = v77 + v120;
            v119 = v121;
            break;
          }
          default:
            {
            v119 = v77;
            break;
          }
        }
        bool v122 = true;
        v113 = v119;
      }
      default:
        {
        int v123 = 0;
        int v124 = v77 + v123;
        v113 = v124;
        break;
      }
      case 1:
        {
        v113 = v77;
        break;
      }
    }
    bool v125 = true;
    v91 = v113;
  }
  int v126 = 16;
  int v127 = v126 + v77;
  bool v128 = true;
  int v129 = simt_wave_count_bits(v128);
  v75[v127] = v129;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
