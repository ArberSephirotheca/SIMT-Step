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
  int v5 = v0 + v4;
  int v6 = 3;
  int v7 = v3 % v6;
  int v8 = 2;
  int v9;
  v9 = v8;
  switch (v7) {
    case 0:
      {
      int v10 = 0;
      int v11 = 0;
      int v12;
      int v13;
      v12 = v10;
      v13 = v11;
      while (true) {
        int v14 = 4;
        int v15 = v3 % v14;
        int v16 = 1;
        int v17 = v15 + v16;
        bool v18 = v13 < v17;
        v12 = v12;
        v13 = v13;
        if (!v18) break;
        int v19 = 4;
        int v20 = 1;
        int v21 = v13 + v20;
        v12 = v19;
        v13 = v21;
      }
      int v22 = 2;
      v9 = v12;
      break;
    }
    case 1:
      {
      int v23 = 0;
      bool v24 = v2 != v23;
      int v25;
      if (v24) {
        int v26 = 0;
        bool v27 = v2 != v26;
        int v28;
        if (v27) {
          v28 = v0;
        } else {
          int v29 = 2;
          int v30 = v0 + v29;
          v28 = v30;
        }
        v25 = v28;
      } else {
        int v31 = 0;
        bool v32 = v2 != v31;
        int v33;
        if (v32) {
          v33 = v0;
        } else {
          int v34 = 0;
          int v35 = v0 + v34;
          v33 = v35;
        }
        v25 = v33;
      }
      int v36 = 4;
      int v37 = v0 + v36;
      v9 = v25;
    }
    case 2:
      {
      int v38 = 0;
      bool v39 = v2 != v38;
      int v40;
      if (v39) {
        int v41 = 0;
        bool v42 = v2 != v41;
        int v43;
        if (v42) {
          int v44 = 1;
          int v45 = v0 + v44;
          v43 = v45;
        } else {
          int v46 = 0;
          int v47 = v0 + v46;
          v43 = v47;
        }
        int v48 = 2;
        int v49 = v0 + v48;
        v40 = v43;
      } else {
        int v50 = 2;
        int v51 = v0 + v50;
        v40 = v51;
      }
      int v52 = 4;
      int v53 = v0 + v52;
      v9 = v40;
    }
    default:
      {
      int v54 = 0;
      int v55 = 0;
      int v56;
      int v57;
      v56 = v54;
      v57 = v55;
      while (true) {
        int v58 = 4;
        int v59 = v3 % v58;
        int v60 = 1;
        int v61 = v59 + v60;
        bool v62 = v57 < v61;
        v56 = v56;
        v57 = v57;
        if (!v62) break;
        int v63 = 1;
        int v64 = v57 + v63;
        v56 = v0;
        v57 = v64;
      }
      v9 = v56;
      break;
    }
  }
  bool v65 = true;
  int v66 = simt_wave_count_bits(v65);
  int v67 = 0;
  int v68 = v67 + v0;
  v1[v68] = v66;
  int v69 = 0;
  bool v70 = v2 != v69;
  int v71 = v70 ? v5 : v9;
  return;
}

kernel void kernel_main(device int* v72 [[buffer(0)]], device int* v73 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v74 = static_cast<int>(__simt_tid3.x);
  int v75 = 0;
  int v76 = v75 + v74;
  int v77 = v73[v76];
  int v78 = 4;
  int v79 = v78 + v74;
  int v80 = v73[v79];
  helper0(v74, v72, v77, v80, static_cast<int>(__simt_tid3.x));
  int v81 = 8;
  int v82 = v81 + v74;
  int v83 = v73[v82];
  int v84 = 0;
  bool v85 = v83 != v84;
  int v86;
  if (v85) {
    int v87 = 3;
    int v88 = v74 + v87;
    v86 = v88;
  } else {
    int v89 = 1;
    v86 = v89;
  }
  int v90 = 16;
  int v91 = v90 + v74;
  bool v92 = true;
  int v93 = simt_wave_count_bits(v92);
  v72[v91] = v93;
  int v94 = 12;
  int v95 = v94 + v74;
  int v96 = v73[v95];
  int v97 = 0;
  bool v98 = v96 != v97;
  int v99;
  if (v98) {
    int v100 = 16;
    int v101 = v100 + v74;
    int v102 = v73[v101];
    int v103 = 0;
    bool v104 = v102 != v103;
    int v105;
    if (v104) {
      int v106 = 4;
      v105 = v106;
    } else {
      int v107 = 20;
      int v108 = v107 + v74;
      int v109 = v73[v108];
      int v110 = 0;
      bool v111 = v109 != v110;
      int v112;
      if (v111) {
        uint v113 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v114 = (int)(v113);
        v112 = v114;
      } else {
        uint v115 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v116 = (int)(v115);
        v112 = v116;
      }
      v105 = v112;
    }
    v99 = v105;
  } else {
    int v117 = 2;
    int v118 = v74 + v117;
    v99 = v118;
  }
  int v119 = 32;
  int v120 = v119 + v74;
  bool v121 = true;
  int v122 = simt_wave_count_bits(v121);
  v72[v120] = v122;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 24; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
