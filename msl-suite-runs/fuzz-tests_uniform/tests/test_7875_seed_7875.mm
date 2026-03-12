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
    int v13 = 1;
    int v14 = v7 + v13;
    v6 = v0;
    v7 = v14;
    break;
    ;
  }
  bool v15 = true;
  int v16 = simt_wave_count_bits(v15);
  int v17 = 0;
  int v18 = v17 + v0;
  v1[v18] = v16;
  int v19 = 0;
  bool v20 = v2 != v19;
  int v21;
  if (v20) {
    int v22 = 0;
    int v23 = 0;
    int v24;
    int v25;
    v24 = v22;
    v25 = v23;
    while (true) {
      int v26 = 4;
      int v27 = v3 % v26;
      int v28 = 1;
      int v29 = v27 + v28;
      bool v30 = v25 < v29;
      v24 = v24;
      v25 = v25;
      if (!v30) break;
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
        uint v40 = simt_subgroup_id(__simt_tid);
        int v41 = (int)(v40);
        int v42 = 1;
        int v43 = v34 + v42;
        v33 = v41;
        v34 = v43;
      }
      uint v44 = simt_lane_id(__simt_tid);
      int v45 = (int)(v44);
      int v46 = 1;
      int v47 = v25 + v46;
      v24 = v33;
      v25 = v47;
    }
    int v48 = 0;
    int v49 = v0 + v48;
    v21 = v24;
  } else {
    int v50 = 2;
    int v51 = v3 % v50;
    int v52;
    v52 = v0;
    switch (v51) {
      case 0:
        {
        int v53 = 4;
        int v54 = v3 % v53;
        int v55;
        v55 = v0;
        switch (v54) {
          case 0:
            {
            int v56 = 3;
            int v57 = v0 + v56;
            v55 = v57;
            break;
          }
          default:
            {
            int v58 = 0;
            v55 = v58;
            break;
          }
          case 1:
            {
            v55 = v0;
            break;
          }
          case 2:
            {
            v55 = v0;
            break;
          }
        }
        int v59 = 4;
        int v60 = v0 + v59;
        v52 = v55;
      }
      default:
        {
        int v61 = 0;
        int v62 = 0;
        int v63;
        int v64;
        v63 = v61;
        v64 = v62;
        while (true) {
          int v65 = 4;
          int v66 = v3 % v65;
          int v67 = 1;
          int v68 = v66 + v67;
          bool v69 = v64 < v68;
          v63 = v63;
          v64 = v64;
          if (!v69) break;
          int v70 = 0;
          int v71 = v0 + v70;
          int v72 = 1;
          int v73 = v64 + v72;
          v63 = v71;
          v64 = v73;
        }
        int v74 = 3;
        v52 = v63;
        break;
      }
    }
    int v75 = 1;
    int v76 = v0 + v75;
    v21 = v52;
  }
  bool v77 = true;
  int v78 = simt_wave_count_bits(v77);
  int v79 = 16;
  int v80 = v79 + v0;
  v1[v80] = v78;
  int v81 = 0;
  bool v82 = v2 != v81;
  int v83 = v82 ? v6 : v21;
  return;
}

kernel void kernel_main(device int* v84 [[buffer(0)]], device int* v85 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v86 = static_cast<int>(__simt_tid3.x);
  int v87 = 0;
  int v88 = v87 + v86;
  int v89 = v85[v88];
  int v90 = 4;
  int v91 = v90 + v86;
  int v92 = v85[v91];
  helper0(v86, v84, v89, v92, static_cast<int>(__simt_tid3.x));
  int v93 = 0;
  int v94 = 0;
  int v95;
  int v96;
  v95 = v93;
  v96 = v94;
  while (true) {
    int v97 = 4;
    int v98 = v96 * v97;
    int v99 = v98 + v86;
    int v100 = 8;
    int v101 = v100 + v99;
    int v102 = v85[v101];
    int v103 = 0;
    bool v104 = v102 != v103;
    v95 = v95;
    v96 = v96;
    if (!v104) break;
    int v105 = v95 + v96;
    int v106 = 1;
    int v107 = v96 + v106;
    v95 = v105;
    v96 = v107;
  }
  bool v108 = true;
  int v109 = 32;
  int v110 = v109 + v86;
  bool v111 = true;
  int v112 = simt_wave_count_bits(v111);
  v84[v110] = v112;
  int v113 = 28;
  int v114 = v113 + v86;
  int v115 = v85[v114];
  int v116 = 0;
  bool v117 = v115 != v116;
  int v118;
  if (v117) {
    int v119 = 4;
    v118 = v119;
  } else {
    int v120 = 0;
    int v121 = 0;
    int v122;
    int v123;
    v122 = v120;
    v123 = v121;
    while (true) {
      int v124 = 4;
      int v125 = v123 * v124;
      int v126 = v125 + v86;
      int v127 = 32;
      int v128 = v127 + v126;
      int v129 = v85[v128];
      int v130 = 0;
      bool v131 = v129 != v130;
      v122 = v122;
      v123 = v123;
      if (!v131) break;
      int v132 = 52;
      int v133 = v132 + v86;
      int v134 = v85[v133];
      int v135 = 0;
      bool v136 = v134 != v135;
      int v137;
      if (v136) {
        int v138 = 1;
        int v139 = v86 + v138;
        v137 = v139;
      } else {
        int v140 = 1;
        int v141 = v86 + v140;
        v137 = v141;
      }
      int v142 = v122 + v137;
      int v143 = 1;
      int v144 = v123 + v143;
      v122 = v142;
      v123 = v144;
    }
    bool v145 = true;
    v118 = v122;
  }
  int v146 = 48;
  int v147 = v146 + v86;
  bool v148 = true;
  int v149 = simt_wave_count_bits(v148);
  v84[v147] = v149;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 52; ++idx) {
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
