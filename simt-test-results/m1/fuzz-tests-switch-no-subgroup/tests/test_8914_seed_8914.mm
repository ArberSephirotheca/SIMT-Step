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
      int v10 = 3;
      int v11 = v3 % v10;
      uint v12 = simt_lane_id(__simt_tid);
      int v13 = (int)(v12);
      int v14;
      v14 = v13;
      switch (v11) {
        case 0:
          {
          int v15 = 0;
          v14 = v15;
          break;
        }
        case 1:
          {
          int v16 = 0;
          v14 = v16;
          break;
        }
        default:
          {
          int v17 = 4;
          int v18 = v0 + v17;
          v14 = v18;
          break;
        }
        case 2:
          {
          int v19 = 1;
          int v20 = v0 + v19;
          v14 = v20;
          break;
        }
      }
      v9 = v14;
    } else {
      int v21 = 0;
      int v22 = 0;
      int v23;
      int v24;
      v23 = v21;
      v24 = v22;
      while (true) {
        int v25 = 4;
        int v26 = v3 % v25;
        int v27 = 1;
        int v28 = v26 + v27;
        bool v29 = v24 < v28;
        v23 = v23;
        v24 = v24;
        if (!v29) break;
        bool v30 = true;
        int v31 = simt_wave_count_bits(v30);
        int v32 = 0;
        int v33 = 4;
        int v34 = v24 * v33;
        int v35 = v32 + v34;
        int v36 = v35 + v0;
        v1[v36] = v31;
        int v37 = 1;
        int v38 = v24 + v37;
        v23 = v31;
        v24 = v38;
      }
      v9 = v23;
    }
    v6 = v9;
  } else {
    int v39 = 0;
    bool v40 = v2 != v39;
    int v41;
    if (v40) {
      int v42 = 3;
      int v43 = v3 % v42;
      int v44;
      v44 = v0;
      switch (v43) {
        case 0:
          {
          v44 = v0;
        }
        case 1:
          {
          int v45 = 0;
          v44 = v45;
        }
        default:
          {
          v44 = v0;
        }
        case 2:
          {
          v44 = v0;
          break;
        }
      }
      v41 = v44;
    } else {
      bool v46 = true;
      int v47 = simt_wave_count_bits(v46);
      int v48 = 16;
      int v49 = v48 + v0;
      v1[v49] = v47;
      v41 = v47;
    }
    v6 = v41;
  }
  return;
}

kernel void kernel_main(device int* v50 [[buffer(0)]], device int* v51 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v52 = static_cast<int>(__simt_tid3.x);
  int v53 = 0;
  int v54 = v53 + v52;
  int v55 = v51[v54];
  int v56 = 4;
  int v57 = v56 + v52;
  int v58 = v51[v57];
  int v59 = 0;
  bool v60 = v55 != v59;
  if (v60) {
  } else {
    int v61 = 0;
    int v62 = 0;
    int v63;
    int v64;
    v63 = v61;
    v64 = v62;
    while (true) {
      int v65 = 1;
      bool v66 = v64 < v65;
      v63 = v63;
      v64 = v64;
      if (!v66) break;
      int v67 = 4;
      int v68 = v52 % v67;
      int v69 = 4;
      int v70;
      v70 = v69;
      switch (v68) {
        case 0:
          {
          int v71 = 3;
          int v72 = v70 + v71;
          v70 = v72;
          break;
        }
        default:
          {
          int v73 = 1;
          int v74 = v70 + v73;
          v70 = v74;
          break;
        }
        case 1:
          {
          int v75 = 3;
          int v76 = v70 + v75;
          v70 = v76;
          break;
        }
        case 2:
          {
          int v77 = 3;
          int v78 = v70 + v77;
          v70 = v78;
          break;
        }
      }
      helper0(v52, v50, v55, v58, static_cast<int>(__simt_tid3.x));
      int v79 = 1;
      int v80 = v64 + v79;
      v63 = v63;
      v64 = v80;
    }
  }
  uint v81 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v82 = (int)(v81);
  int v83 = 0;
  int v84 = 0;
  int v85;
  int v86;
  v85 = v83;
  v86 = v84;
  while (true) {
    int v87 = 4;
    int v88 = v86 * v87;
    int v89 = v88 + v52;
    int v90 = 8;
    int v91 = v90 + v89;
    int v92 = v51[v91];
    int v93 = 0;
    bool v94 = v92 != v93;
    v85 = v85;
    v86 = v86;
    if (!v94) break;
    uint v95 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v96 = (int)(v95);
    int v97 = v85 + v96;
    int v98 = 1;
    int v99 = v86 + v98;
    bool v100 = true;
    int v101 = 32;
    int v102 = 4;
    int v103 = v86 * v102;
    int v104 = v101 + v103;
    int v105 = v104 + v52;
    bool v106 = true;
    int v107 = simt_wave_count_bits(v106);
    v50[v105] = v107;
    v85 = v97;
    v86 = v99;
    continue;
    ;
  }
  int v108 = 0;
  int v109 = 0;
  int v110;
  int v111;
  v110 = v108;
  v111 = v109;
  while (true) {
    int v112 = 4;
    int v113 = v111 * v112;
    int v114 = v113 + v52;
    int v115 = 28;
    int v116 = v115 + v114;
    int v117 = v51[v116];
    int v118 = 0;
    bool v119 = v117 != v118;
    v110 = v110;
    v111 = v111;
    if (!v119) break;
    int v120 = 0;
    int v121 = 0;
    int v122;
    int v123;
    v122 = v120;
    v123 = v121;
    while (true) {
      int v124 = 4;
      int v125 = v123 * v124;
      int v126 = v125 + v52;
      int v127 = 48;
      int v128 = v127 + v126;
      int v129 = v51[v128];
      int v130 = 0;
      bool v131 = v129 != v130;
      v122 = v122;
      v123 = v123;
      if (!v131) break;
      int v132 = v122 + v123;
      int v133 = 1;
      int v134 = v123 + v133;
      bool v135 = true;
      int v136 = 48;
      int v137 = 4;
      int v138 = v123 * v137;
      int v139 = v136 + v138;
      int v140 = v139 + v52;
      bool v141 = true;
      int v142 = simt_wave_count_bits(v141);
      v50[v140] = v142;
      v122 = v132;
      v123 = v134;
    }
    int v143 = v110 + v122;
    int v144 = 1;
    int v145 = v111 + v144;
    bool v146 = true;
    int v147 = 64;
    int v148 = 4;
    int v149 = v111 * v148;
    int v150 = v147 + v149;
    int v151 = v150 + v52;
    bool v152 = true;
    int v153 = simt_wave_count_bits(v152);
    v50[v151] = v153;
    v110 = v143;
    v111 = v145;
    break;
    ;
  }
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
