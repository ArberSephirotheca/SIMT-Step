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
    uint v7 = simt_subgroup_id(__simt_tid);
    int v8 = (int)(v7);
    v6 = v8;
  } else {
    int v9 = 0;
    int v10 = 0;
    int v11;
    int v12;
    v11 = v9;
    v12 = v10;
    while (true) {
      int v13 = 4;
      int v14 = v3 % v13;
      int v15 = 1;
      int v16 = v14 + v15;
      bool v17 = v12 < v16;
      v11 = v11;
      v12 = v12;
      if (!v17) break;
      int v18 = 4;
      int v19 = 1;
      int v20 = v12 + v19;
      v11 = v18;
      v12 = v20;
    }
    uint v21 = simt_subgroup_id(__simt_tid);
    int v22 = (int)(v21);
    v6 = v11;
  }
  bool v23 = true;
  int v24 = simt_wave_count_bits(v23);
  int v25 = 0;
  int v26 = v25 + v0;
  v1[v26] = v24;
  int v27 = 2;
  int v28 = v3 % v27;
  uint v29 = simt_subgroup_id(__simt_tid);
  int v30 = (int)(v29);
  int v31;
  v31 = v30;
  switch (v28) {
    default:
      {
      int v32 = 2;
      v31 = v32;
      break;
    }
    case 0:
      {
      int v33 = 2;
      int v34 = v3 % v33;
      int v35;
      v35 = v0;
      switch (v34) {
        case 0:
          {
          int v36 = 3;
          int v37 = v0 + v36;
          v35 = v37;
          break;
        }
        default:
          {
          int v38 = 4;
          int v39 = v0 + v38;
          v35 = v39;
          break;
        }
      }
      int v40 = 1;
      int v41 = v0 + v40;
      v31 = v35;
      break;
    }
    case 1:
      {
      int v42 = 0;
      bool v43 = v2 != v42;
      int v44;
      if (v43) {
        v44 = v0;
      } else {
        int v45 = 0;
        bool v46 = v2 != v45;
        int v47;
        if (v46) {
          int v48 = 0;
          int v49 = v0 + v48;
          v47 = v49;
        } else {
          int v50 = 0;
          int v51 = v0 + v50;
          v47 = v51;
        }
        int v52 = 1;
        int v53 = v0 + v52;
        v44 = v47;
      }
      int v54 = 1;
      v31 = v44;
      break;
    }
  }
  bool v55 = true;
  int v56 = simt_wave_count_bits(v55);
  int v57 = 16;
  int v58 = v57 + v0;
  v1[v58] = v56;
  int v59 = 0;
  bool v60 = v2 != v59;
  int v61 = v60 ? v6 : v31;
  return;
}

kernel void kernel_main(device int* v62 [[buffer(0)]], device int* v63 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v64 = static_cast<int>(__simt_tid3.x);
  int v65 = 0;
  int v66 = v65 + v64;
  int v67 = v63[v66];
  int v68 = 4;
  int v69 = v68 + v64;
  int v70 = v63[v69];
  helper0(v64, v62, v67, v70, static_cast<int>(__simt_tid3.x));
  int v71 = 0;
  int v72 = 0;
  int v73;
  int v74;
  v73 = v71;
  v74 = v72;
  while (true) {
    int v75 = 4;
    int v76 = v74 * v75;
    int v77 = v76 + v64;
    int v78 = 8;
    int v79 = v78 + v77;
    int v80 = v63[v79];
    int v81 = 0;
    bool v82 = v80 != v81;
    v73 = v73;
    v74 = v74;
    if (!v82) break;
    uint v83 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v84 = (int)(v83);
    int v85 = v73 + v84;
    int v86 = 1;
    int v87 = v74 + v86;
    v73 = v85;
    v74 = v87;
  }
  bool v88 = true;
  int v89 = 32;
  int v90 = v89 + v64;
  bool v91 = true;
  int v92 = simt_wave_count_bits(v91);
  v62[v90] = v92;
  int v93 = 0;
  int v94 = 0;
  int v95;
  int v96;
  v95 = v93;
  v96 = v94;
  while (true) {
    int v97 = 4;
    int v98 = v96 * v97;
    int v99 = v98 + v64;
    int v100 = 28;
    int v101 = v100 + v99;
    int v102 = v63[v101];
    int v103 = 0;
    bool v104 = v102 != v103;
    v95 = v95;
    v96 = v96;
    if (!v104) break;
    int v105 = 4;
    int v106 = v64 + v105;
    int v107 = v95 + v106;
    int v108 = 1;
    int v109 = v96 + v108;
    v95 = v107;
    v96 = v109;
  }
  bool v110 = true;
  int v111 = 48;
  int v112 = v111 + v64;
  bool v113 = true;
  int v114 = simt_wave_count_bits(v113);
  v62[v112] = v114;
  int v115 = 48;
  int v116 = v115 + v64;
  int v117 = v63[v116];
  int v118;
  v118 = v64;
  switch (v117) {
    case 0:
      {
      int v119 = 52;
      int v120 = v119 + v64;
      int v121 = v63[v120];
      int v122 = 0;
      bool v123 = v121 != v122;
      int v124;
      if (v123) {
        int v125 = 4;
        v124 = v125;
      } else {
        int v126 = 56;
        int v127 = v126 + v64;
        int v128 = v63[v127];
        int v129 = 4;
        int v130 = v64 + v129;
        int v131;
        v131 = v130;
        switch (v128) {
          default:
            {
            int v132 = 4;
            int v133 = v64 + v132;
            v131 = v133;
            break;
          }
          case 0:
            {
            int v134 = 2;
            int v135 = v64 + v134;
            v131 = v135;
            break;
          }
        }
        bool v136 = true;
        v124 = v131;
      }
      v118 = v124;
      break;
    }
    case 1:
      {
      int v137 = 3;
      int v138 = v64 + v137;
      v118 = v138;
      break;
    }
    default:
      {
      int v139 = 1;
      int v140 = v64 + v139;
      v118 = v140;
      break;
    }
  }
  bool v141 = true;
  int v142 = 64;
  int v143 = v142 + v64;
  bool v144 = true;
  int v145 = simt_wave_count_bits(v144);
  v62[v143] = v145;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
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
