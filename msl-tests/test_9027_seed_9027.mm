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
    bool v14 = v2 != v13;
    int v15;
    if (v14) {
      uint v16 = simt_subgroup_id(__simt_tid);
      int v17 = (int)(v16);
      int v18;
      v18 = v17;
      switch (v3) {
        case 0:
          {
          int v19 = 0;
          int v20 = v0 + v19;
          v18 = v20;
          break;
        }
        default:
          {
          v18 = v0;
          break;
        }
      }
      uint v21 = simt_subgroup_id(__simt_tid);
      int v22 = (int)(v21);
      v15 = v18;
    } else {
      int v23 = 3;
      int v24 = v3 % v23;
      uint v25 = simt_lane_id(__simt_tid);
      int v26 = (int)(v25);
      int v27;
      v27 = v26;
      switch (v24) {
        case 0:
          {
          v27 = v0;
          break;
        }
        case 1:
          {
          int v28 = 3;
          v27 = v28;
          break;
        }
        default:
          {
          int v29 = 3;
          int v30 = v0 + v29;
          v27 = v30;
          break;
        }
        case 2:
          {
          int v31 = 3;
          v27 = v31;
          break;
        }
      }
      uint v32 = simt_subgroup_id(__simt_tid);
      int v33 = (int)(v32);
      v15 = v27;
    }
    uint v34 = simt_lane_id(__simt_tid);
    int v35 = (int)(v34);
    int v36 = 1;
    int v37 = v7 + v36;
    v6 = v15;
    v7 = v37;
  }
  bool v38 = true;
  int v39 = simt_wave_count_bits(v38);
  int v40 = 0;
  int v41 = v40 + v0;
  v1[v41] = v39;
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
  int v54 = 0;
  bool v55 = v53 != v54;
  int v56;
  if (v55) {
    int v57 = 12;
    int v58 = v57 + v44;
    int v59 = v43[v58];
    int v60 = 0;
    int v61;
    v61 = v60;
    switch (v59) {
      default:
        {
        int v62 = 0;
        int v63 = 0;
        int v64;
        int v65;
        v64 = v62;
        v65 = v63;
        while (true) {
          int v66 = 4;
          int v67 = v65 * v66;
          int v68 = v67 + v44;
          int v69 = 16;
          int v70 = v69 + v68;
          int v71 = v43[v70];
          int v72 = 0;
          bool v73 = v71 != v72;
          v64 = v64;
          v65 = v65;
          if (!v73) break;
          int v74 = v64 + v65;
          int v75 = 1;
          int v76 = v65 + v75;
          v64 = v74;
          v65 = v76;
        }
        bool v77 = true;
        v61 = v64;
        break;
      }
      case 0:
        {
        int v78 = 0;
        int v79 = 0;
        int v80;
        int v81;
        v80 = v78;
        v81 = v79;
        while (true) {
          int v82 = 4;
          int v83 = v81 * v82;
          int v84 = v83 + v44;
          int v85 = 36;
          int v86 = v85 + v84;
          int v87 = v43[v86];
          int v88 = 0;
          bool v89 = v87 != v88;
          v80 = v80;
          v81 = v81;
          if (!v89) break;
          int v90 = v80 + v81;
          int v91 = 1;
          int v92 = v81 + v91;
          v80 = v90;
          v81 = v92;
        }
        bool v93 = true;
        v61 = v80;
        break;
      }
      case 1:
        {
        int v94 = 56;
        int v95 = v94 + v44;
        int v96 = v43[v95];
        int v97 = 4;
        int v98;
        v98 = v97;
        switch (v96) {
          case 0:
            {
            int v99 = 1;
            v98 = v99;
            break;
          }
          default:
            {
            int v100 = 3;
            v98 = v100;
            break;
          }
        }
        bool v101 = true;
        v61 = v98;
        break;
      }
    }
    bool v102 = true;
    v56 = v61;
  } else {
    int v103 = 60;
    int v104 = v103 + v44;
    int v105 = v43[v104];
    int v106 = 0;
    bool v107 = v105 != v106;
    int v108;
    if (v107) {
      int v109 = 2;
      int v110 = v44 + v109;
      v108 = v110;
    } else {
      int v111 = 64;
      int v112 = v111 + v44;
      int v113 = v43[v112];
      int v114 = 0;
      bool v115 = v113 != v114;
      int v116;
      if (v115) {
        int v117 = 0;
        v116 = v117;
      } else {
        int v118 = 2;
        v116 = v118;
      }
      v108 = v116;
    }
    v56 = v108;
  }
  int v119 = 16;
  int v120 = v119 + v44;
  bool v121 = true;
  int v122 = simt_wave_count_bits(v121);
  v42[v120] = v122;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
