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
    int v7 = 4;
    int v8 = v0 + v7;
    v6 = v8;
  } else {
    int v9 = 4;
    int v10 = v3 % v9;
    uint v11 = simt_lane_id(__simt_tid);
    int v12 = (int)(v11);
    int v13;
    v13 = v12;
    switch (v10) {
      default:
        {
        v13 = v0;
        break;
      }
      case 0:
        {
        int v14 = 3;
        v13 = v14;
        break;
      }
      case 1:
        {
        int v15 = 0;
        bool v16 = v2 != v15;
        int v17;
        if (v16) {
          int v18 = 2;
          v17 = v18;
        } else {
          int v19 = 3;
          int v20 = v0 + v19;
          v17 = v20;
        }
        int v21 = 4;
        v13 = v17;
      }
      case 2:
        {
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
          int v31 = 1;
          int v32 = v25 + v31;
          v24 = v0;
          v25 = v32;
        }
        v13 = v24;
        break;
      }
    }
    uint v33 = simt_lane_id(__simt_tid);
    int v34 = (int)(v33);
    v6 = v13;
  }
  bool v35 = true;
  int v36 = simt_wave_count_bits(v35);
  int v37 = 0;
  int v38 = v37 + v0;
  v1[v38] = v36;
  return;
}

kernel void kernel_main(device int* v39 [[buffer(0)]], device int* v40 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v41 = static_cast<int>(__simt_tid3.x);
  int v42 = 0;
  int v43 = v42 + v41;
  int v44 = v40[v43];
  int v45 = 4;
  int v46 = v45 + v41;
  int v47 = v40[v46];
  helper0(v41, v39, v44, v47, static_cast<int>(__simt_tid3.x));
  int v48 = 0;
  int v49 = 0;
  int v50 = 0;
  int v51;
  int v52;
  v51 = v49;
  v52 = v50;
  while (true) {
    int v53 = 4;
    int v54 = v52 * v53;
    int v55 = v54 + v41;
    int v56 = 8;
    int v57 = v56 + v55;
    int v58 = v40[v57];
    int v59 = 0;
    bool v60 = v58 != v59;
    v51 = v51;
    v52 = v52;
    if (!v60) break;
    uint v61 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v62 = (int)(v61);
    int v63 = v51 + v62;
    int v64 = 1;
    int v65 = v52 + v64;
    v51 = v63;
    v52 = v65;
  }
  bool v66 = true;
  int v67 = 16;
  int v68 = v67 + v41;
  bool v69 = true;
  int v70 = simt_wave_count_bits(v69);
  v39[v68] = v70;
  int v71 = 0;
  int v72 = 0;
  int v73;
  int v74;
  v73 = v71;
  v74 = v72;
  while (true) {
    int v75 = 4;
    int v76 = v74 * v75;
    int v77 = v76 + v41;
    int v78 = 28;
    int v79 = v78 + v77;
    int v80 = v40[v79];
    int v81 = 0;
    bool v82 = v80 != v81;
    v73 = v73;
    v74 = v74;
    if (!v82) break;
    int v83 = v73 + v74;
    int v84 = 1;
    int v85 = v74 + v84;
    v73 = v83;
    v74 = v85;
    break;
    ;
  }
  bool v86 = true;
  int v87 = 32;
  int v88 = v87 + v41;
  bool v89 = true;
  int v90 = simt_wave_count_bits(v89);
  v39[v88] = v90;
  int v91 = 0;
  int v92 = 0;
  int v93;
  int v94;
  v93 = v91;
  v94 = v92;
  while (true) {
    int v95 = 4;
    int v96 = v94 * v95;
    int v97 = v96 + v41;
    int v98 = 48;
    int v99 = v98 + v97;
    int v100 = v40[v99];
    int v101 = 0;
    bool v102 = v100 != v101;
    v93 = v93;
    v94 = v94;
    if (!v102) break;
    int v103 = v93 + v94;
    int v104 = 1;
    int v105 = v94 + v104;
    v93 = v103;
    v94 = v105;
  }
  bool v106 = true;
  int v107 = 48;
  int v108 = v107 + v41;
  bool v109 = true;
  int v110 = simt_wave_count_bits(v109);
  v39[v108] = v110;
  int v111 = 0;
  int v112 = 0;
  int v113;
  int v114;
  v113 = v111;
  v114 = v112;
  while (true) {
    int v115 = 4;
    int v116 = v114 * v115;
    int v117 = v116 + v41;
    int v118 = 68;
    int v119 = v118 + v117;
    int v120 = v40[v119];
    int v121 = 0;
    bool v122 = v120 != v121;
    v113 = v113;
    v114 = v114;
    if (!v122) break;
    int v123 = 88;
    int v124 = v123 + v41;
    int v125 = v40[v124];
    int v126 = 0;
    bool v127 = v125 != v126;
    int v128;
    if (v127) {
      int v129 = 92;
      int v130 = v129 + v41;
      int v131 = v40[v130];
      uint v132 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v133 = (int)(v132);
      int v134;
      v134 = v133;
      switch (v131) {
        case 0:
          {
          int v135 = 2;
          int v136 = v41 + v135;
          v134 = v136;
          break;
        }
        case 1:
          {
          v134 = v41;
          break;
        }
        default:
          {
          v134 = v41;
          break;
        }
        case 2:
          {
          v134 = v41;
          break;
        }
      }
      bool v137 = true;
      v128 = v134;
    } else {
      int v138 = 96;
      int v139 = v138 + v41;
      int v140 = v40[v139];
      int v141 = 0;
      bool v142 = v140 != v141;
      int v143;
      if (v142) {
        int v144 = 4;
        v143 = v144;
      } else {
        int v145 = 0;
        int v146 = v41 + v145;
        v143 = v146;
      }
      v128 = v143;
    }
    int v147 = v113 + v128;
    int v148 = 1;
    int v149 = v114 + v148;
    v113 = v147;
    v114 = v149;
    break;
    ;
  }
  bool v150 = true;
  int v151 = 64;
  int v152 = v151 + v41;
  bool v153 = true;
  int v154 = simt_wave_count_bits(v153);
  v39[v152] = v154;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 100; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
