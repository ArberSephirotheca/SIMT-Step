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
    int v8 = v3 % v7;
    uint v9 = simt_subgroup_id(__simt_tid);
    int v10 = (int)(v9);
    int v11;
    v11 = v10;
    switch (v8) {
      case 0:
        {
        int v12 = 0;
        bool v13 = v2 != v12;
        int v14;
        if (v13) {
          int v15 = 2;
          v14 = v15;
        } else {
          int v16 = 4;
          int v17 = v0 + v16;
          v14 = v17;
        }
        v11 = v14;
        break;
      }
      case 1:
        {
        int v18 = 0;
        int v19 = 0;
        int v20;
        int v21;
        v20 = v18;
        v21 = v19;
        while (true) {
          int v22 = 4;
          int v23 = v3 % v22;
          int v24 = 1;
          int v25 = v23 + v24;
          bool v26 = v21 < v25;
          v20 = v20;
          v21 = v21;
          if (!v26) break;
          int v27 = 2;
          int v28 = 1;
          int v29 = v21 + v28;
          v20 = v27;
          v21 = v29;
          continue;
          ;
        }
        int v30 = 2;
        v11 = v20;
        break;
      }
      case 2:
        {
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
          int v40 = 4;
          int v41 = v0 + v40;
          int v42 = 1;
          int v43 = v34 + v42;
          v33 = v41;
          v34 = v43;
        }
        v11 = v33;
        break;
      }
      default:
        {
        int v44 = 0;
        int v45 = 0;
        int v46;
        int v47;
        v46 = v44;
        v47 = v45;
        while (true) {
          int v48 = 4;
          int v49 = v3 % v48;
          int v50 = 1;
          int v51 = v49 + v50;
          bool v52 = v47 < v51;
          v46 = v46;
          v47 = v47;
          if (!v52) break;
          int v53 = 2;
          int v54 = 1;
          int v55 = v47 + v54;
          v46 = v53;
          v47 = v55;
        }
        v11 = v46;
        break;
      }
    }
    v6 = v11;
  } else {
    int v56 = 0;
    bool v57 = v2 != v56;
    int v58;
    if (v57) {
      int v59 = 0;
      int v60 = 0;
      int v61;
      int v62;
      v61 = v59;
      v62 = v60;
      while (true) {
        int v63 = 4;
        int v64 = v3 % v63;
        int v65 = 1;
        int v66 = v64 + v65;
        bool v67 = v62 < v66;
        v61 = v61;
        v62 = v62;
        if (!v67) break;
        int v68 = 2;
        int v69 = v0 + v68;
        int v70 = 1;
        int v71 = v62 + v70;
        v61 = v69;
        v62 = v71;
      }
      uint v72 = simt_lane_id(__simt_tid);
      int v73 = (int)(v72);
      v58 = v61;
    } else {
      uint v74 = simt_subgroup_id(__simt_tid);
      int v75 = (int)(v74);
      v58 = v75;
    }
    uint v76 = simt_subgroup_id(__simt_tid);
    int v77 = (int)(v76);
    v6 = v58;
  }
  bool v78 = true;
  int v79 = simt_wave_count_bits(v78);
  int v80 = 0;
  int v81 = v80 + v0;
  v1[v81] = v79;
  int v82 = 0;
  bool v83 = v2 != v82;
  int v84 = v83 ? v0 : v6;
  return;
}

kernel void kernel_main(device int* v85 [[buffer(0)]], device int* v86 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v87 = static_cast<int>(__simt_tid3.x);
  int v88 = 0;
  int v89 = v88 + v87;
  int v90 = v86[v89];
  int v91 = 4;
  int v92 = v91 + v87;
  int v93 = v86[v92];
  helper0(v87, v85, v90, v93, static_cast<int>(__simt_tid3.x));
  int v94 = 0;
  int v95 = 0;
  int v96;
  int v97;
  v96 = v94;
  v97 = v95;
  while (true) {
    int v98 = 4;
    int v99 = v97 * v98;
    int v100 = v99 + v87;
    int v101 = 8;
    int v102 = v101 + v100;
    int v103 = v86[v102];
    int v104 = 0;
    bool v105 = v103 != v104;
    v96 = v96;
    v97 = v97;
    if (!v105) break;
    int v106 = 28;
    int v107 = v106 + v87;
    int v108 = v86[v107];
    int v109 = 0;
    bool v110 = v108 != v109;
    int v111;
    if (v110) {
      uint v112 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v113 = (int)(v112);
      v111 = v113;
    } else {
      int v114 = 32;
      int v115 = v114 + v87;
      int v116 = v86[v115];
      int v117 = 0;
      int v118;
      v118 = v117;
      switch (v116) {
        case 0:
          {
          int v119 = 2;
          v118 = v119;
        }
        default:
          {
          int v120 = 2;
          v118 = v120;
          break;
        }
        case 1:
          {
          int v121 = 1;
          v118 = v121;
          break;
        }
      }
      bool v122 = true;
      v111 = v118;
    }
    int v123 = v96 + v111;
    int v124 = 1;
    int v125 = v97 + v124;
    v96 = v123;
    v97 = v125;
  }
  bool v126 = true;
  int v127 = 16;
  int v128 = v127 + v87;
  bool v129 = true;
  int v130 = simt_wave_count_bits(v129);
  v85[v128] = v130;
  int v131 = 0;
  int v132 = 0;
  int v133;
  int v134;
  v133 = v131;
  v134 = v132;
  while (true) {
    int v135 = 4;
    int v136 = v134 * v135;
    int v137 = v136 + v87;
    int v138 = 36;
    int v139 = v138 + v137;
    int v140 = v86[v139];
    int v141 = 0;
    bool v142 = v140 != v141;
    v133 = v133;
    v134 = v134;
    if (!v142) break;
    int v143 = v133 + v134;
    int v144 = 1;
    int v145 = v134 + v144;
    v133 = v143;
    v134 = v145;
  }
  bool v146 = true;
  int v147 = 32;
  int v148 = v147 + v87;
  bool v149 = true;
  int v150 = simt_wave_count_bits(v149);
  v85[v148] = v150;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 56; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
