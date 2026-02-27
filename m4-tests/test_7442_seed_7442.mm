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
  bool v4 = true;
  int v5 = simt_wave_count_bits(v4);
  int v6 = 0;
  int v7 = v6 + v0;
  v1[v7] = v5;
  int v8 = 2;
  int v9 = v3 % v8;
  int v10 = 3;
  int v11 = v0 + v10;
  int v12;
  v12 = v11;
  switch (v9) {
    default:
      {
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
        int v22 = 2;
        int v23 = v3 % v22;
        int v24 = 1;
        int v25 = v0 + v24;
        int v26;
        v26 = v25;
        switch (v23) {
          default:
            {
            int v27 = 3;
            v26 = v27;
            break;
          }
          case 0:
            {
            v26 = v0;
            break;
          }
          case 1:
            {
            int v28 = 2;
            v26 = v28;
            break;
          }
        }
        int v29 = 1;
        int v30 = v16 + v29;
        v15 = v26;
        v16 = v30;
      }
      v12 = v15;
      break;
    }
    case 0:
      {
      int v31 = 0;
      int v32 = 0;
      int v33;
      int v34;
      v33 = v31;
      v34 = v32;
      while (true) {
        int v35 = 4;
        int v36 = v3 % v35;
        int v37 = 1;
        int v38 = v36 + v37;
        bool v39 = v34 < v38;
        v33 = v33;
        v34 = v34;
        if (!v39) break;
        int v40 = 2;
        int v41 = v3 % v40;
        int v42 = 1;
        int v43;
        v43 = v42;
        switch (v41) {
          case 0:
            {
            int v44 = 1;
            int v45 = v0 + v44;
            v43 = v45;
          }
          default:
            {
            v43 = v0;
            break;
          }
        }
        int v46 = 1;
        int v47 = v34 + v46;
        v33 = v43;
        v34 = v47;
      }
      v12 = v33;
      break;
    }
    case 1:
      {
      int v48 = 3;
      int v49 = v3 % v48;
      int v50 = 1;
      int v51 = v0 + v50;
      int v52;
      v52 = v51;
      switch (v49) {
        default:
          {
          v52 = v0;
        }
        case 0:
          {
          v52 = v0;
        }
        case 1:
          {
          int v53 = 0;
          bool v54 = v2 != v53;
          int v55;
          if (v54) {
            v55 = v0;
          } else {
            v55 = v0;
          }
          v52 = v55;
          break;
        }
      }
      v12 = v52;
      break;
    }
  }
  int v56 = 0;
  bool v57 = v2 != v56;
  int v58 = v57 ? v5 : v12;
  return;
}

kernel void kernel_main(device int* v59 [[buffer(0)]], device int* v60 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v61 = static_cast<int>(__simt_tid3.x);
  int v62 = 0;
  int v63 = v62 + v61;
  int v64 = v60[v63];
  int v65 = 4;
  int v66 = v65 + v61;
  int v67 = v60[v66];
  helper0(v61, v59, v64, v67, static_cast<int>(__simt_tid3.x));
  int v68 = 8;
  int v69 = v68 + v61;
  int v70 = v60[v69];
  uint v71 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v72 = (int)(v71);
  int v73;
  v73 = v72;
  switch (v70) {
    default:
      {
      v73 = v61;
      break;
    }
    case 0:
      {
      v73 = v61;
      break;
    }
  }
  uint v74 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v75 = (int)(v74);
  int v76 = 12;
  int v77 = v76 + v61;
  int v78 = v60[v77];
  int v79 = 0;
  bool v80 = v78 != v79;
  int v81;
  if (v80) {
    int v82 = 16;
    int v83 = v82 + v61;
    int v84 = v60[v83];
    int v85 = 0;
    bool v86 = v84 != v85;
    int v87;
    if (v86) {
      uint v88 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v89 = (int)(v88);
      v87 = v89;
    } else {
      int v90 = 20;
      int v91 = v90 + v61;
      int v92 = v60[v91];
      int v93;
      v93 = v61;
      switch (v92) {
        case 0:
          {
          v93 = v61;
        }
        case 1:
          {
          int v94 = 2;
          v93 = v94;
          break;
        }
        default:
          {
          int v95 = 4;
          v93 = v95;
          break;
        }
        case 2:
          {
          int v96 = 1;
          int v97 = v61 + v96;
          v93 = v97;
          break;
        }
      }
      v87 = v93;
    }
    int v98 = 16;
    int v99 = v98 + v61;
    bool v100 = true;
    int v101 = simt_wave_count_bits(v100);
    v59[v99] = v101;
    v81 = v87;
  } else {
    int v102 = 24;
    int v103 = v102 + v61;
    int v104 = v60[v103];
    uint v105 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v106 = (int)(v105);
    int v107;
    v107 = v106;
    switch (v104) {
      default:
        {
        int v108 = 28;
        int v109 = v108 + v61;
        int v110 = v60[v109];
        int v111 = 4;
        int v112 = v61 + v111;
        int v113;
        v113 = v112;
        switch (v110) {
          case 0:
            {
            int v114 = 1;
            v113 = v114;
          }
          case 1:
            {
            v113 = v61;
          }
          default:
            {
            int v115 = 1;
            int v116 = v61 + v115;
            v113 = v116;
            break;
          }
          case 2:
            {
            int v117 = 4;
            int v118 = v61 + v117;
            v113 = v118;
            break;
          }
        }
        v107 = v113;
        break;
      }
      case 0:
        {
        int v119 = 32;
        int v120 = v119 + v61;
        int v121 = v60[v120];
        int v122 = 0;
        bool v123 = v121 != v122;
        int v124;
        if (v123) {
          v124 = v61;
        } else {
          int v125 = 1;
          int v126 = v61 + v125;
          v124 = v126;
        }
        v107 = v124;
        break;
      }
    }
    v81 = v107;
  }
  int v127 = 32;
  int v128 = v127 + v61;
  bool v129 = true;
  int v130 = simt_wave_count_bits(v129);
  v59[v128] = v130;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 36; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 36; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
