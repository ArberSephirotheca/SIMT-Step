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
  int v6 = 1;
  int v7;
  v7 = v6;
  switch (v5) {
    case 0:
      {
      int v8 = 0;
      int v9 = 0;
      int v10;
      int v11;
      v10 = v8;
      v11 = v9;
      while (true) {
        int v12 = 4;
        int v13 = v3 % v12;
        int v14 = 1;
        int v15 = v13 + v14;
        bool v16 = v11 < v15;
        v10 = v10;
        v11 = v11;
        if (!v16) break;
        int v17 = 3;
        int v18 = v3 % v17;
        int v19 = 2;
        int v20 = v0 + v19;
        int v21;
        v21 = v20;
        switch (v18) {
          default:
            {
            v21 = v0;
            break;
          }
          case 0:
            {
            int v22 = 0;
            int v23 = v0 + v22;
            v21 = v23;
            break;
          }
          case 1:
            {
            int v24 = 3;
            v21 = v24;
            break;
          }
        }
        int v25 = 1;
        int v26 = v11 + v25;
        v10 = v21;
        v11 = v26;
      }
      v7 = v10;
      break;
    }
    default:
      {
      int v27 = 1;
      int v28 = v0 + v27;
      v7 = v28;
      break;
    }
    case 1:
      {
      int v29 = 2;
      int v30 = v0 + v29;
      v7 = v30;
      break;
    }
  }
  bool v31 = true;
  int v32 = simt_wave_count_bits(v31);
  int v33 = 0;
  int v34 = v33 + v0;
  v1[v34] = v32;
  return;
}

kernel void kernel_main(device int* v35 [[buffer(0)]], device int* v36 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v37 = static_cast<int>(__simt_tid3.x);
  int v38 = 0;
  int v39 = v38 + v37;
  int v40 = v36[v39];
  int v41 = 4;
  int v42 = v41 + v37;
  int v43 = v36[v42];
  helper0(v37, v35, v40, v43, static_cast<int>(__simt_tid3.x));
  int v44 = 0;
  int v45 = 0;
  int v46;
  int v47;
  v46 = v44;
  v47 = v45;
  while (true) {
    int v48 = 4;
    int v49 = v47 * v48;
    int v50 = v49 + v37;
    int v51 = 8;
    int v52 = v51 + v50;
    int v53 = v36[v52];
    int v54 = 0;
    bool v55 = v53 != v54;
    v46 = v46;
    v47 = v47;
    if (!v55) break;
    int v56 = 28;
    int v57 = v56 + v37;
    int v58 = v36[v57];
    int v59 = 0;
    bool v60 = v58 != v59;
    int v61;
    if (v60) {
      int v62 = 32;
      int v63 = v62 + v37;
      int v64 = v36[v63];
      int v65 = 0;
      bool v66 = v64 != v65;
      int v67;
      if (v66) {
        uint v68 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v69 = (int)(v68);
        v67 = v69;
      } else {
        int v70 = 1;
        v67 = v70;
      }
      v61 = v67;
    } else {
      int v71 = 36;
      int v72 = v71 + v37;
      int v73 = v36[v72];
      int v74 = 0;
      bool v75 = v73 != v74;
      int v76;
      if (v75) {
        v76 = v37;
      } else {
        uint v77 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v78 = (int)(v77);
        v76 = v78;
      }
      v61 = v76;
    }
    int v79 = v46 + v61;
    int v80 = 1;
    int v81 = v47 + v80;
    v46 = v79;
    v47 = v81;
    continue;
    ;
  }
  bool v82 = true;
  int v83 = 16;
  int v84 = v83 + v37;
  bool v85 = true;
  int v86 = simt_wave_count_bits(v85);
  v35[v84] = v86;
  int v87 = 2;
  int v88 = v37 + v87;
  int v89 = 40;
  int v90 = v89 + v37;
  int v91 = v36[v90];
  int v92 = 0;
  bool v93 = v91 != v92;
  int v94;
  if (v93) {
    uint v95 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v96 = (int)(v95);
    v94 = v96;
  } else {
    int v97 = 44;
    int v98 = v97 + v37;
    int v99 = v36[v98];
    int v100 = 0;
    bool v101 = v99 != v100;
    int v102;
    if (v101) {
      int v103 = 48;
      int v104 = v103 + v37;
      int v105 = v36[v104];
      int v106 = 0;
      int v107 = v37 + v106;
      int v108;
      v108 = v107;
      switch (v105) {
        case 0:
          {
          int v109 = 3;
          int v110 = v37 + v109;
          v108 = v110;
          break;
        }
        case 1:
          {
          v108 = v37;
          break;
        }
        case 2:
          {
          int v111 = 1;
          v108 = v111;
          break;
        }
        default:
          {
          int v112 = 1;
          v108 = v112;
          break;
        }
      }
      bool v113 = true;
      v102 = v108;
    } else {
      int v114 = 52;
      int v115 = v114 + v37;
      int v116 = v36[v115];
      uint v117 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v118 = (int)(v117);
      int v119;
      v119 = v118;
      switch (v116) {
        case 0:
          {
          int v120 = 1;
          v119 = v120;
        }
        case 1:
          {
          v119 = v37;
        }
        default:
          {
          int v121 = 4;
          v119 = v121;
          break;
        }
      }
      bool v122 = true;
      v102 = v119;
    }
    v94 = v102;
  }
  int v123 = 32;
  int v124 = v123 + v37;
  bool v125 = true;
  int v126 = simt_wave_count_bits(v125);
  v35[v124] = v126;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 56; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
