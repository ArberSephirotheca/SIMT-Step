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
      int v16 = 2;
      int v17 = v3 % v16;
      int v18 = 0;
      int v19;
      v19 = v18;
      switch (v17) {
        default:
          {
          int v20 = 0;
          v19 = v20;
          break;
        }
        case 0:
          {
          int v21 = 2;
          int v22 = v0 + v21;
          v19 = v22;
          break;
        }
        case 1:
          {
          int v23 = 1;
          int v24 = v0 + v23;
          v19 = v24;
          break;
        }
      }
      uint v25 = simt_lane_id(__simt_tid);
      int v26 = (int)(v25);
      v15 = v19;
    } else {
      int v27 = 0;
      bool v28 = v2 != v27;
      int v29;
      if (v28) {
        v29 = v0;
      } else {
        int v30 = 4;
        int v31 = v0 + v30;
        v29 = v31;
      }
      v15 = v29;
    }
    uint v32 = simt_lane_id(__simt_tid);
    int v33 = (int)(v32);
    int v34 = 1;
    int v35 = v7 + v34;
    v6 = v15;
    v7 = v35;
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
    v54 = v42;
  } else {
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
      int v64 = 0;
      bool v65 = v63 != v64;
      int v66;
      if (v65) {
        int v67 = 1;
        int v68 = v42 + v67;
        v66 = v68;
      } else {
        uint v69 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v70 = (int)(v69);
        v66 = v70;
      }
      v60 = v66;
    } else {
      int v71 = 20;
      int v72 = v71 + v42;
      int v73 = v41[v72];
      int v74 = 0;
      bool v75 = v73 != v74;
      int v76;
      if (v75) {
        int v77 = 2;
        int v78 = v42 + v77;
        v76 = v78;
      } else {
        int v79 = 4;
        int v80 = v42 + v79;
        v76 = v80;
      }
      v60 = v76;
    }
    v54 = v60;
  }
  int v81 = 16;
  int v82 = v81 + v42;
  bool v83 = true;
  int v84 = simt_wave_count_bits(v83);
  v40[v82] = v84;
  int v85 = 24;
  int v86 = v85 + v42;
  int v87 = v41[v86];
  int v88 = 0;
  bool v89 = v87 != v88;
  int v90;
  if (v89) {
    int v91 = 28;
    int v92 = v91 + v42;
    int v93 = v41[v92];
    int v94 = 1;
    int v95;
    v95 = v94;
    switch (v93) {
      default:
        {
        v95 = v42;
        break;
      }
      case 0:
        {
        int v96 = 0;
        int v97 = 0;
        int v98;
        int v99;
        v98 = v96;
        v99 = v97;
        while (true) {
          int v100 = 4;
          int v101 = v99 * v100;
          int v102 = v101 + v42;
          int v103 = 32;
          int v104 = v103 + v102;
          int v105 = v41[v104];
          int v106 = 0;
          bool v107 = v105 != v106;
          v98 = v98;
          v99 = v99;
          if (!v107) break;
          int v108 = v98 + v99;
          int v109 = 1;
          int v110 = v99 + v109;
          v98 = v108;
          v99 = v110;
        }
        bool v111 = true;
        v95 = v98;
        break;
      }
      case 1:
        {
        int v112 = 0;
        int v113 = 0;
        int v114;
        int v115;
        v114 = v112;
        v115 = v113;
        while (true) {
          int v116 = 4;
          int v117 = v115 * v116;
          int v118 = v117 + v42;
          int v119 = 52;
          int v120 = v119 + v118;
          int v121 = v41[v120];
          int v122 = 0;
          bool v123 = v121 != v122;
          v114 = v114;
          v115 = v115;
          if (!v123) break;
          int v124 = v114 + v115;
          int v125 = 1;
          int v126 = v115 + v125;
          v114 = v124;
          v115 = v126;
        }
        bool v127 = true;
        v95 = v114;
        break;
      }
    }
    bool v128 = true;
    v90 = v95;
  } else {
    int v129 = 72;
    int v130 = v129 + v42;
    int v131 = v41[v130];
    int v132 = 0;
    bool v133 = v131 != v132;
    int v134;
    if (v133) {
      int v135 = 76;
      int v136 = v135 + v42;
      int v137 = v41[v136];
      int v138 = 0;
      bool v139 = v137 != v138;
      int v140;
      if (v139) {
        uint v141 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v142 = (int)(v141);
        v140 = v142;
      } else {
        int v143 = 0;
        int v144 = v42 + v143;
        v140 = v144;
      }
      v134 = v140;
    } else {
      int v145 = 3;
      v134 = v145;
    }
    v90 = v134;
  }
  int v146 = 32;
  int v147 = v146 + v42;
  bool v148 = true;
  int v149 = simt_wave_count_bits(v148);
  v40[v147] = v149;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 80; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
