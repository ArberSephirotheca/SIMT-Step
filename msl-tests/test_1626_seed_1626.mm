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
  uint v4 = simt_subgroup_id(__simt_tid);
  int v5 = (int)(v4);
  int v6 = 0;
  int v7 = 0;
  int v8;
  int v9;
  v8 = v6;
  v9 = v7;
  while (true) {
    int v10 = 4;
    int v11 = v3 % v10;
    int v12 = 1;
    int v13 = v11 + v12;
    bool v14 = v9 < v13;
    v8 = v8;
    v9 = v9;
    if (!v14) break;
    int v15 = 3;
    int v16 = v3 % v15;
    int v17 = 1;
    int v18;
    v18 = v17;
    switch (v16) {
      case 0:
        {
        int v19 = 0;
        int v20 = 0;
        int v21;
        int v22;
        v21 = v19;
        v22 = v20;
        while (true) {
          int v23 = 4;
          int v24 = v3 % v23;
          int v25 = 1;
          int v26 = v24 + v25;
          bool v27 = v22 < v26;
          v21 = v21;
          v22 = v22;
          if (!v27) break;
          int v28 = 1;
          int v29 = v0 + v28;
          int v30 = 1;
          int v31 = v22 + v30;
          v21 = v29;
          v22 = v31;
          break;
          ;
        }
        v18 = v21;
      }
      default:
        {
        int v32 = 0;
        int v33 = 0;
        int v34;
        int v35;
        v34 = v32;
        v35 = v33;
        while (true) {
          int v36 = 4;
          int v37 = v3 % v36;
          int v38 = 1;
          int v39 = v37 + v38;
          bool v40 = v35 < v39;
          v34 = v34;
          v35 = v35;
          if (!v40) break;
          int v41 = 1;
          int v42 = v35 + v41;
          v34 = v0;
          v35 = v42;
        }
        int v43 = 3;
        v18 = v34;
      }
      case 1:
        {
        int v44 = 4;
        int v45 = v0 + v44;
        v18 = v45;
        break;
      }
    }
    uint v46 = simt_lane_id(__simt_tid);
    int v47 = (int)(v46);
    int v48 = 1;
    int v49 = v9 + v48;
    v8 = v18;
    v9 = v49;
  }
  bool v50 = true;
  int v51 = simt_wave_count_bits(v50);
  int v52 = 0;
  int v53 = v52 + v0;
  v1[v53] = v51;
  int v54 = 0;
  bool v55 = v2 != v54;
  int v56 = v55 ? v5 : v8;
  return;
}

kernel void kernel_main(device int* v57 [[buffer(0)]], device int* v58 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v59 = static_cast<int>(__simt_tid3.x);
  int v60 = 0;
  int v61 = v60 + v59;
  int v62 = v58[v61];
  int v63 = 4;
  int v64 = v63 + v59;
  int v65 = v58[v64];
  helper0(v59, v57, v62, v65, static_cast<int>(__simt_tid3.x));
  int v66 = 0;
  int v67 = 0;
  int v68;
  int v69;
  v68 = v66;
  v69 = v67;
  while (true) {
    int v70 = 4;
    int v71 = v69 * v70;
    int v72 = v71 + v59;
    int v73 = 8;
    int v74 = v73 + v72;
    int v75 = v58[v74];
    int v76 = 0;
    bool v77 = v75 != v76;
    v68 = v68;
    v69 = v69;
    if (!v77) break;
    int v78 = 28;
    int v79 = v78 + v59;
    int v80 = v58[v79];
    int v81 = 0;
    bool v82 = v80 != v81;
    int v83;
    if (v82) {
      int v84 = 32;
      int v85 = v84 + v59;
      int v86 = v58[v85];
      uint v87 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v88 = (int)(v87);
      int v89;
      v89 = v88;
      switch (v86) {
        case 0:
          {
          v89 = v59;
          break;
        }
        default:
          {
          int v90 = 0;
          v89 = v90;
          break;
        }
        case 1:
          {
          int v91 = 1;
          v89 = v91;
          break;
        }
        case 2:
          {
          int v92 = 4;
          int v93 = v59 + v92;
          v89 = v93;
          break;
        }
      }
      bool v94 = true;
      v83 = v89;
    } else {
      uint v95 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v96 = (int)(v95);
      v83 = v96;
    }
    int v97 = v68 + v83;
    int v98 = 1;
    int v99 = v69 + v98;
    v68 = v97;
    v69 = v99;
  }
  bool v100 = true;
  int v101 = 16;
  int v102 = v101 + v59;
  bool v103 = true;
  int v104 = simt_wave_count_bits(v103);
  v57[v102] = v104;
  int v105 = 36;
  int v106 = v105 + v59;
  int v107 = v58[v106];
  uint v108 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v109 = (int)(v108);
  int v110;
  v110 = v109;
  switch (v107) {
    case 0:
      {
      int v111 = 40;
      int v112 = v111 + v59;
      int v113 = v58[v112];
      int v114 = 0;
      bool v115 = v113 != v114;
      int v116;
      if (v115) {
        int v117 = 2;
        int v118 = v59 + v117;
        v116 = v118;
      } else {
        int v119 = 0;
        int v120 = 0;
        int v121;
        int v122;
        v121 = v119;
        v122 = v120;
        while (true) {
          int v123 = 4;
          int v124 = v122 * v123;
          int v125 = v124 + v59;
          int v126 = 44;
          int v127 = v126 + v125;
          int v128 = v58[v127];
          int v129 = 0;
          bool v130 = v128 != v129;
          v121 = v121;
          v122 = v122;
          if (!v130) break;
          int v131 = v121 + v122;
          int v132 = 1;
          int v133 = v122 + v132;
          v121 = v131;
          v122 = v133;
        }
        bool v134 = true;
        v116 = v121;
      }
      v110 = v116;
    }
    default:
      {
      int v135 = 0;
      int v136 = 0;
      int v137;
      int v138;
      v137 = v135;
      v138 = v136;
      while (true) {
        int v139 = 4;
        int v140 = v138 * v139;
        int v141 = v140 + v59;
        int v142 = 64;
        int v143 = v142 + v141;
        int v144 = v58[v143];
        int v145 = 0;
        bool v146 = v144 != v145;
        v137 = v137;
        v138 = v138;
        if (!v146) break;
        int v147 = v137 + v138;
        int v148 = 1;
        int v149 = v138 + v148;
        v137 = v147;
        v138 = v149;
      }
      bool v150 = true;
      v110 = v137;
      break;
    }
  }
  bool v151 = true;
  int v152 = 32;
  int v153 = v152 + v59;
  bool v154 = true;
  int v155 = simt_wave_count_bits(v154);
  v57[v153] = v155;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
