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
    int v7 = 3;
    int v8 = v0 + v7;
    v6 = v8;
  } else {
    int v9 = 0;
    bool v10 = v2 != v9;
    int v11;
    if (v10) {
      int v12 = 3;
      int v13 = v3 % v12;
      uint v14 = simt_lane_id(__simt_tid);
      int v15 = (int)(v14);
      int v16;
      v16 = v15;
      switch (v13) {
        case 0:
          {
          v16 = v0;
          break;
        }
        default:
          {
          int v17 = 2;
          v16 = v17;
          break;
        }
        case 1:
          {
          int v18 = 0;
          v16 = v18;
          break;
        }
      }
      uint v19 = simt_lane_id(__simt_tid);
      int v20 = (int)(v19);
      v11 = v16;
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
        int v30 = 4;
        int v31 = 1;
        int v32 = v24 + v31;
        v23 = v30;
        v24 = v32;
        continue;
        ;
      }
      int v33 = 4;
      v11 = v23;
    }
    int v34 = 0;
    int v35 = v0 + v34;
    v6 = v11;
  }
  bool v36 = true;
  int v37 = simt_wave_count_bits(v36);
  int v38 = 0;
  int v39 = v38 + v0;
  v1[v39] = v37;
  return;
}

kernel void kernel_main(device int* v40 [[buffer(0)]], device int* v41 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v42 = static_cast<int>(__simt_tid3.x);
  int v43 = 0;
  int v44 = v43 + v42;
  int v45 = v41[v44];
  int v46 = 4;
  int v47 = v46 + v42;
  int v48 = v41[v47];
  helper0(v42, v40, v45, v48, static_cast<int>(__simt_tid3.x));
  int v49 = 8;
  int v50 = v49 + v42;
  int v51 = v41[v50];
  int v52 = 0;
  bool v53 = v51 != v52;
  int v54;
  if (v53) {
    int v55 = 12;
    int v56 = v55 + v42;
    int v57 = v41[v56];
    int v58 = 0;
    bool v59 = v57 != v58;
    int v60;
    if (v59) {
      int v61 = 16;
      int v62 = v61 + v42;
      int v63 = v41[v62];
      int v64 = 4;
      int v65 = v42 + v64;
      int v66;
      v66 = v65;
      switch (v63) {
        default:
          {
          int v67 = 2;
          v66 = v67;
          break;
        }
        case 0:
          {
          int v68 = 0;
          int v69 = v42 + v68;
          v66 = v69;
        }
        case 1:
          {
          v66 = v42;
          break;
        }
      }
      bool v70 = true;
      v60 = v66;
    } else {
      int v71 = 20;
      int v72 = v71 + v42;
      int v73 = v41[v72];
      int v74;
      v74 = v42;
      switch (v73) {
        case 0:
          {
          v74 = v42;
          break;
        }
        case 1:
          {
          int v75 = 2;
          int v76 = v42 + v75;
          v74 = v76;
          break;
        }
        case 2:
          {
          int v77 = 1;
          int v78 = v42 + v77;
          v74 = v78;
          break;
        }
        default:
          {
          v74 = v42;
          break;
        }
      }
      bool v79 = true;
      v60 = v74;
    }
    v54 = v60;
  } else {
    int v80 = 24;
    int v81 = v80 + v42;
    int v82 = v41[v81];
    int v83 = 0;
    bool v84 = v82 != v83;
    int v85;
    if (v84) {
      int v86 = 28;
      int v87 = v86 + v42;
      int v88 = v41[v87];
      int v89 = 0;
      bool v90 = v88 != v89;
      int v91;
      if (v90) {
        int v92 = 4;
        v91 = v92;
      } else {
        int v93 = 0;
        v91 = v93;
      }
      v85 = v91;
    } else {
      int v94 = 32;
      int v95 = v94 + v42;
      int v96 = v41[v95];
      uint v97 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v98 = (int)(v97);
      int v99;
      v99 = v98;
      switch (v96) {
        case 0:
          {
          int v100 = 0;
          v99 = v100;
        }
        case 1:
          {
          v99 = v42;
        }
        default:
          {
          int v101 = 0;
          v99 = v101;
          break;
        }
      }
      bool v102 = true;
      v85 = v99;
    }
    v54 = v85;
  }
  int v103 = 16;
  int v104 = v103 + v42;
  bool v105 = true;
  int v106 = simt_wave_count_bits(v105);
  v40[v104] = v106;
  uint v107 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v108 = (int)(v107);
  int v109 = 0;
  int v110 = 0;
  int v111;
  int v112;
  v111 = v109;
  v112 = v110;
  while (true) {
    int v113 = 4;
    int v114 = v112 * v113;
    int v115 = v114 + v42;
    int v116 = 36;
    int v117 = v116 + v115;
    int v118 = v41[v117];
    int v119 = 0;
    bool v120 = v118 != v119;
    v111 = v111;
    v112 = v112;
    if (!v120) break;
    int v121 = 56;
    int v122 = v121 + v42;
    int v123 = v41[v122];
    int v124 = 0;
    bool v125 = v123 != v124;
    int v126;
    if (v125) {
      int v127 = 60;
      int v128 = v127 + v42;
      int v129 = v41[v128];
      int v130 = 0;
      bool v131 = v129 != v130;
      int v132;
      if (v131) {
        int v133 = 0;
        v132 = v133;
      } else {
        v132 = v42;
      }
      v126 = v132;
    } else {
      int v134 = 0;
      int v135 = 0;
      int v136;
      int v137;
      v136 = v134;
      v137 = v135;
      while (true) {
        int v138 = 4;
        int v139 = v137 * v138;
        int v140 = v139 + v42;
        int v141 = 64;
        int v142 = v141 + v140;
        int v143 = v41[v142];
        int v144 = 0;
        bool v145 = v143 != v144;
        v136 = v136;
        v137 = v137;
        if (!v145) break;
        int v146 = v136 + v137;
        int v147 = 1;
        int v148 = v137 + v147;
        v136 = v146;
        v137 = v148;
        continue;
        ;
      }
      bool v149 = true;
      v126 = v136;
    }
    int v150 = v111 + v126;
    int v151 = 1;
    int v152 = v112 + v151;
    v111 = v150;
    v112 = v152;
    break;
    ;
  }
  bool v153 = true;
  int v154 = 32;
  int v155 = v154 + v42;
  bool v156 = true;
  int v157 = simt_wave_count_bits(v156);
  v40[v155] = v157;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 84; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
