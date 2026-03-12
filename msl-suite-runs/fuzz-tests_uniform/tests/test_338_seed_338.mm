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
  int v6 = 4;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 0;
      bool v10 = v2 != v9;
      int v11;
      if (v10) {
        int v12 = 0;
        bool v13 = v2 != v12;
        int v14;
        if (v13) {
          int v15 = 0;
          int v16 = v0 + v15;
          v14 = v16;
        } else {
          int v17 = 3;
          v14 = v17;
        }
        v11 = v14;
      } else {
        int v18 = 2;
        int v19 = v3 % v18;
        int v20;
        v20 = v0;
        switch (v19) {
          case 0:
            {
            int v21 = 1;
            v20 = v21;
            break;
          }
          default:
            {
            int v22 = 3;
            v20 = v22;
            break;
          }
          case 1:
            {
            int v23 = 1;
            int v24 = v0 + v23;
            v20 = v24;
            break;
          }
        }
        int v25 = 1;
        int v26 = v0 + v25;
        v11 = v20;
      }
      int v27 = 4;
      int v28 = v0 + v27;
      v8 = v11;
      break;
    }
    default:
      {
      int v29 = 0;
      bool v30 = v2 != v29;
      int v31;
      if (v30) {
        int v32 = 0;
        bool v33 = v2 != v32;
        int v34;
        if (v33) {
          int v35 = 3;
          v34 = v35;
        } else {
          v34 = v0;
        }
        v31 = v34;
      } else {
        int v36 = 2;
        int v37 = v3 % v36;
        int v38 = 2;
        int v39;
        v39 = v38;
        switch (v37) {
          case 0:
            {
            int v40 = 2;
            int v41 = v0 + v40;
            v39 = v41;
            break;
          }
          default:
            {
            int v42 = 3;
            v39 = v42;
            break;
          }
        }
        int v43 = 1;
        v31 = v39;
      }
      int v44 = 3;
      int v45 = v0 + v44;
      v8 = v31;
      break;
    }
    case 1:
      {
      int v46 = 2;
      int v47 = v3 % v46;
      int v48;
      v48 = v0;
      switch (v47) {
        case 0:
          {
          int v49 = 0;
          bool v50 = v2 != v49;
          int v51;
          if (v50) {
            v51 = v0;
          } else {
            int v52 = 0;
            int v53 = v0 + v52;
            v51 = v53;
          }
          int v54 = 3;
          v48 = v51;
          break;
        }
        default:
          {
          int v55 = 3;
          int v56;
          v56 = v55;
          switch (v3) {
            case 0:
              {
              int v57 = 1;
              int v58 = v0 + v57;
              v56 = v58;
              break;
            }
            default:
              {
              int v59 = 2;
              int v60 = v0 + v59;
              v56 = v60;
              break;
            }
          }
          v48 = v56;
          break;
        }
      }
      int v61 = 0;
      int v62 = v0 + v61;
      v8 = v48;
      break;
    }
  }
  bool v63 = true;
  int v64 = simt_wave_count_bits(v63);
  int v65 = 0;
  int v66 = v65 + v0;
  v1[v66] = v64;
  return;
}

kernel void kernel_main(device int* v67 [[buffer(0)]], device int* v68 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v69 = static_cast<int>(__simt_tid3.x);
  int v70 = 0;
  int v71 = v70 + v69;
  int v72 = v68[v71];
  int v73 = 4;
  int v74 = v73 + v69;
  int v75 = v68[v74];
  helper0(v69, v67, v72, v75, static_cast<int>(__simt_tid3.x));
  uint v76 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v77 = (int)(v76);
  int v78 = 8;
  int v79 = v78 + v69;
  int v80 = v68[v79];
  uint v81 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v82 = (int)(v81);
  int v83;
  v83 = v82;
  switch (v80) {
    case 0:
      {
      int v84 = 12;
      int v85 = v84 + v69;
      int v86 = v68[v85];
      int v87 = 1;
      int v88;
      v88 = v87;
      switch (v86) {
        case 0:
          {
          v88 = v69;
          break;
        }
        default:
          {
          int v89 = 16;
          int v90 = v89 + v69;
          int v91 = v68[v90];
          int v92 = 0;
          bool v93 = v91 != v92;
          int v94;
          if (v93) {
            v94 = v69;
          } else {
            int v95 = 4;
            int v96 = v69 + v95;
            v94 = v96;
          }
          v88 = v94;
          break;
        }
      }
      bool v97 = true;
      v83 = v88;
      break;
    }
    default:
      {
      int v98 = 0;
      int v99 = 0;
      int v100;
      int v101;
      v100 = v98;
      v101 = v99;
      while (true) {
        int v102 = 4;
        int v103 = v101 * v102;
        int v104 = v103 + v69;
        int v105 = 20;
        int v106 = v105 + v104;
        int v107 = v68[v106];
        int v108 = 0;
        bool v109 = v107 != v108;
        v100 = v100;
        v101 = v101;
        if (!v109) break;
        int v110 = 0;
        int v111 = 0;
        int v112;
        int v113;
        v112 = v110;
        v113 = v111;
        while (true) {
          int v114 = 4;
          int v115 = v113 * v114;
          int v116 = v115 + v69;
          int v117 = 40;
          int v118 = v117 + v116;
          int v119 = v68[v118];
          int v120 = 0;
          bool v121 = v119 != v120;
          v112 = v112;
          v113 = v113;
          if (!v121) break;
          int v122 = v112 + v113;
          int v123 = 1;
          int v124 = v113 + v123;
          v112 = v122;
          v113 = v124;
        }
        bool v125 = true;
        int v126 = v100 + v112;
        int v127 = 1;
        int v128 = v101 + v127;
        v100 = v126;
        v101 = v128;
      }
      bool v129 = true;
      v83 = v100;
      break;
    }
  }
  bool v130 = true;
  int v131 = 16;
  int v132 = v131 + v69;
  bool v133 = true;
  int v134 = simt_wave_count_bits(v133);
  v67[v132] = v134;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 60; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
