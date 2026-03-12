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
    int v7 = 0;
    bool v8 = v2 != v7;
    int v9;
    if (v8) {
      uint v10 = simt_lane_id(__simt_tid);
      int v11 = (int)(v10);
      v9 = v11;
    } else {
      int v12 = 0;
      bool v13 = v2 != v12;
      int v14;
      if (v13) {
        int v15 = 4;
        v14 = v15;
      } else {
        int v16 = 4;
        v14 = v16;
      }
      int v17 = 0;
      int v18 = v0 + v17;
      v9 = v14;
    }
    uint v19 = simt_subgroup_id(__simt_tid);
    int v20 = (int)(v19);
    v6 = v9;
  } else {
    int v21 = 4;
    int v22 = v3 % v21;
    uint v23 = simt_lane_id(__simt_tid);
    int v24 = (int)(v23);
    int v25;
    v25 = v24;
    switch (v22) {
      case 0:
        {
        int v26 = 0;
        bool v27 = v2 != v26;
        int v28;
        if (v27) {
          int v29 = 2;
          int v30 = v0 + v29;
          v28 = v30;
        } else {
          int v31 = 1;
          v28 = v31;
        }
        int v32 = 0;
        int v33 = v0 + v32;
        v25 = v28;
      }
      case 1:
        {
        int v34 = 3;
        int v35 = v3 % v34;
        int v36 = 3;
        int v37;
        v37 = v36;
        switch (v35) {
          case 0:
            {
            int v38 = 0;
            v37 = v38;
          }
          case 1:
            {
            int v39 = 2;
            v37 = v39;
            break;
          }
          default:
            {
            int v40 = 3;
            int v41 = v0 + v40;
            v37 = v41;
            break;
          }
          case 2:
            {
            v37 = v0;
            break;
          }
        }
        int v42 = 2;
        int v43 = v0 + v42;
        v25 = v37;
      }
      case 2:
        {
        int v44 = 0;
        bool v45 = v2 != v44;
        int v46;
        if (v45) {
          v46 = v0;
        } else {
          int v47 = 2;
          int v48 = v0 + v47;
          v46 = v48;
        }
        int v49 = 0;
        v25 = v46;
      }
      default:
        {
        int v50 = 3;
        int v51 = v3 % v50;
        int v52 = 4;
        int v53 = v0 + v52;
        int v54;
        v54 = v53;
        switch (v51) {
          case 0:
            {
            int v55 = 3;
            int v56 = v0 + v55;
            v54 = v56;
            break;
          }
          case 1:
            {
            int v57 = 2;
            int v58 = v0 + v57;
            v54 = v58;
            break;
          }
          case 2:
            {
            int v59 = 4;
            v54 = v59;
            break;
          }
          default:
            {
            int v60 = 3;
            v54 = v60;
            break;
          }
        }
        int v61 = 0;
        v25 = v54;
        break;
      }
    }
    uint v62 = simt_lane_id(__simt_tid);
    int v63 = (int)(v62);
    v6 = v25;
  }
  bool v64 = true;
  int v65 = simt_wave_count_bits(v64);
  int v66 = 0;
  int v67 = v66 + v0;
  v1[v67] = v65;
  return;
}

kernel void kernel_main(device int* v68 [[buffer(0)]], device int* v69 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v70 = static_cast<int>(__simt_tid3.x);
  int v71 = 0;
  int v72 = v71 + v70;
  int v73 = v69[v72];
  int v74 = 4;
  int v75 = v74 + v70;
  int v76 = v69[v75];
  helper0(v70, v68, v73, v76, static_cast<int>(__simt_tid3.x));
  int v77 = 8;
  int v78 = v77 + v70;
  int v79 = v69[v78];
  int v80 = 0;
  bool v81 = v79 != v80;
  int v82;
  if (v81) {
    int v83 = 12;
    int v84 = v83 + v70;
    int v85 = v69[v84];
    int v86;
    v86 = v70;
    switch (v85) {
      case 0:
        {
        int v87 = 16;
        int v88 = v87 + v70;
        int v89 = v69[v88];
        int v90;
        v90 = v70;
        switch (v89) {
          default:
            {
            int v91 = 1;
            int v92 = v70 + v91;
            v90 = v92;
            break;
          }
          case 0:
            {
            v90 = v70;
          }
          case 1:
            {
            v90 = v70;
            break;
          }
          case 2:
            {
            int v93 = 3;
            int v94 = v70 + v93;
            v90 = v94;
            break;
          }
        }
        bool v95 = true;
        v86 = v90;
      }
      case 1:
        {
        int v96 = 20;
        int v97 = v96 + v70;
        int v98 = v69[v97];
        int v99 = 3;
        int v100;
        v100 = v99;
        switch (v98) {
          case 0:
            {
            int v101 = 2;
            v100 = v101;
            break;
          }
          default:
            {
            int v102 = 3;
            int v103 = v70 + v102;
            v100 = v103;
            break;
          }
        }
        bool v104 = true;
        v86 = v100;
      }
      default:
        {
        int v105 = 24;
        int v106 = v105 + v70;
        int v107 = v69[v106];
        int v108 = 4;
        int v109 = v70 + v108;
        int v110;
        v110 = v109;
        switch (v107) {
          case 0:
            {
            v110 = v70;
          }
          case 1:
            {
            v110 = v70;
            break;
          }
          default:
            {
            int v111 = 0;
            int v112 = v70 + v111;
            v110 = v112;
            break;
          }
        }
        bool v113 = true;
        v86 = v110;
        break;
      }
    }
    bool v114 = true;
    v82 = v86;
  } else {
    int v115 = 1;
    int v116 = v70 + v115;
    v82 = v116;
  }
  int v117 = 16;
  int v118 = v117 + v70;
  bool v119 = true;
  int v120 = simt_wave_count_bits(v119);
  v68[v118] = v120;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 28; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
