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
    bool v17 = true;
    int v18 = simt_wave_count_bits(v17);
    int v19 = 16;
    int v20 = 4;
    int v21 = v11 * v20;
    int v22 = v19 + v21;
    int v23 = v22 + v0;
    v1[v23] = v18;
    int v24 = 1;
    int v25 = v11 + v24;
    v10 = v18;
    v11 = v25;
    break;
    ;
  }
  int v26 = 0;
  bool v27 = v2 != v26;
  int v28 = v27 ? v5 : v10;
  int v29 = 0;
  bool v30 = v2 != v29;
  int v31;
  if (v30) {
    int v32;
    v32 = v0;
    switch (v3) {
      default:
        {
        int v33 = 0;
        bool v34 = v2 != v33;
        int v35;
        if (v34) {
          int v36 = 3;
          v35 = v36;
        } else {
          int v37 = 1;
          v35 = v37;
        }
        v32 = v35;
        break;
      }
      case 0:
        {
        int v38 = 4;
        int v39 = v3 % v38;
        int v40;
        v40 = v0;
        switch (v39) {
          default:
            {
            int v41 = 3;
            int v42 = v0 + v41;
            v40 = v42;
            break;
          }
          case 0:
            {
            int v43 = 2;
            int v44 = v0 + v43;
            v40 = v44;
            break;
          }
          case 1:
            {
            v40 = v0;
            break;
          }
          case 2:
            {
            int v45 = 4;
            v40 = v45;
            break;
          }
        }
        v32 = v40;
        break;
      }
    }
    v31 = v32;
  } else {
    uint v46 = simt_subgroup_id(__simt_tid);
    int v47 = (int)(v46);
    int v48;
    v48 = v47;
    switch (v3) {
      default:
        {
        v48 = v0;
        break;
      }
      case 0:
        {
        int v49 = 0;
        int v50 = 0;
        int v51;
        int v52;
        v51 = v49;
        v52 = v50;
        while (true) {
          int v53 = 4;
          int v54 = v3 % v53;
          int v55 = 1;
          int v56 = v54 + v55;
          bool v57 = v52 < v56;
          v51 = v51;
          v52 = v52;
          if (!v57) break;
          int v58 = 1;
          int v59 = v0 + v58;
          int v60 = 1;
          int v61 = v52 + v60;
          v51 = v59;
          v52 = v61;
        }
        v48 = v51;
        break;
      }
    }
    bool v62 = true;
    int v63 = simt_wave_count_bits(v62);
    int v64 = 32;
    int v65 = v64 + v0;
    v1[v65] = v63;
    v31 = v48;
  }
  int v66 = 0;
  bool v67 = v2 != v66;
  int v68 = v67 ? v28 : v31;
  return;
}

kernel void kernel_main(device int* v69 [[buffer(0)]], device int* v70 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v71 = static_cast<int>(__simt_tid3.x);
  int v72 = 0;
  int v73 = v72 + v71;
  int v74 = v70[v73];
  int v75 = 4;
  int v76 = v75 + v71;
  int v77 = v70[v76];
  helper0(v71, v69, v74, v77, static_cast<int>(__simt_tid3.x));
  int v78 = 8;
  int v79 = v78 + v71;
  int v80 = v70[v79];
  int v81;
  v81 = v71;
  switch (v80) {
    case 0:
      {
      int v82 = 12;
      int v83 = v82 + v71;
      int v84 = v70[v83];
      int v85 = 0;
      bool v86 = v84 != v85;
      int v87;
      if (v86) {
        int v88 = 16;
        int v89 = v88 + v71;
        int v90 = v70[v89];
        int v91;
        v91 = v71;
        switch (v90) {
          default:
            {
            v91 = v71;
            break;
          }
          case 0:
            {
            v91 = v71;
            break;
          }
          case 1:
            {
            int v92 = 0;
            int v93 = v71 + v92;
            v91 = v93;
            break;
          }
        }
        v87 = v91;
      } else {
        int v94 = 20;
        int v95 = v94 + v71;
        int v96 = v70[v95];
        int v97 = 0;
        bool v98 = v96 != v97;
        int v99;
        if (v98) {
          int v100 = 1;
          v99 = v100;
        } else {
          int v101 = 1;
          v99 = v101;
        }
        v87 = v99;
      }
      v81 = v87;
    }
    case 1:
      {
      int v102 = 0;
      int v103 = v71 + v102;
      v81 = v103;
    }
    default:
      {
      int v104 = 24;
      int v105 = v104 + v71;
      int v106 = v70[v105];
      int v107 = 0;
      bool v108 = v106 != v107;
      int v109;
      if (v108) {
        int v110 = 28;
        int v111 = v110 + v71;
        int v112 = v70[v111];
        int v113 = 0;
        bool v114 = v112 != v113;
        int v115;
        if (v114) {
          int v116 = 0;
          int v117 = v71 + v116;
          v115 = v117;
        } else {
          int v118 = 3;
          int v119 = v71 + v118;
          v115 = v119;
        }
        v109 = v115;
      } else {
        int v120 = 32;
        int v121 = v120 + v71;
        int v122 = v70[v121];
        int v123 = 0;
        bool v124 = v122 != v123;
        int v125;
        if (v124) {
          int v126 = 0;
          v125 = v126;
        } else {
          int v127 = 4;
          int v128 = v71 + v127;
          v125 = v128;
        }
        v109 = v125;
      }
      v81 = v109;
      break;
    }
    case 2:
      {
      int v129 = 0;
      int v130 = 0;
      int v131;
      int v132;
      v131 = v129;
      v132 = v130;
      while (true) {
        int v133 = 4;
        int v134 = v132 * v133;
        int v135 = v134 + v71;
        int v136 = 36;
        int v137 = v136 + v135;
        int v138 = v70[v137];
        int v139 = 0;
        bool v140 = v138 != v139;
        v131 = v131;
        v132 = v132;
        if (!v140) break;
        int v141 = v131 + v132;
        int v142 = 1;
        int v143 = v132 + v142;
        bool v144 = true;
        v131 = v141;
        v132 = v143;
      }
      v81 = v131;
      break;
    }
  }
  bool v145 = true;
  int v146 = 48;
  int v147 = v146 + v71;
  bool v148 = true;
  int v149 = simt_wave_count_bits(v148);
  v69[v147] = v149;
  uint v150 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v151 = (int)(v150);
  uint v152 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v153 = (int)(v152);
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
