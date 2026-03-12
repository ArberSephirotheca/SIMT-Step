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
    v6 = v7;
  } else {
    int v8 = 3;
    int v9 = v3 % v8;
    uint v10 = simt_lane_id(__simt_tid);
    int v11 = (int)(v10);
    int v12;
    v12 = v11;
    switch (v9) {
      case 0:
        {
        int v13 = 0;
        bool v14 = v2 != v13;
        int v15;
        if (v14) {
          int v16 = 1;
          v15 = v16;
        } else {
          int v17 = 3;
          v15 = v17;
        }
        int v18 = 4;
        v12 = v15;
        break;
      }
      default:
        {
        int v19 = 1;
        v12 = v19;
        break;
      }
      case 1:
        {
        int v20 = 0;
        bool v21 = v2 != v20;
        int v22;
        if (v21) {
          int v23 = 0;
          int v24 = v0 + v23;
          v22 = v24;
        } else {
          int v25 = 1;
          int v26 = v0 + v25;
          v22 = v26;
        }
        int v27 = 1;
        int v28 = v0 + v27;
        v12 = v22;
        break;
      }
      case 2:
        {
        int v29 = 2;
        int v30 = v3 % v29;
        int v31;
        v31 = v0;
        switch (v30) {
          default:
            {
            int v32 = 3;
            v31 = v32;
          }
          case 0:
            {
            v31 = v0;
            break;
          }
          case 1:
            {
            int v33 = 1;
            int v34 = v0 + v33;
            v31 = v34;
            break;
          }
        }
        int v35 = 3;
        int v36 = v0 + v35;
        v12 = v31;
        break;
      }
    }
    uint v37 = simt_subgroup_id(__simt_tid);
    int v38 = (int)(v37);
    v6 = v12;
  }
  bool v39 = true;
  int v40 = simt_wave_count_bits(v39);
  int v41 = 0;
  int v42 = v41 + v0;
  v1[v42] = v40;
  return;
}

kernel void kernel_main(device int* v43 [[buffer(0)]], device int* v44 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v45 = static_cast<int>(__simt_tid3.x);
  int v46 = 0;
  int v47 = v46 + v45;
  int v48 = v44[v47];
  int v49 = 4;
  int v50 = v49 + v45;
  int v51 = v44[v50];
  helper0(v45, v43, v48, v51, static_cast<int>(__simt_tid3.x));
  int v52 = 0;
  int v53 = 0;
  int v54;
  int v55;
  v54 = v52;
  v55 = v53;
  while (true) {
    int v56 = 4;
    int v57 = v55 * v56;
    int v58 = v57 + v45;
    int v59 = 8;
    int v60 = v59 + v58;
    int v61 = v44[v60];
    int v62 = 0;
    bool v63 = v61 != v62;
    v54 = v54;
    v55 = v55;
    if (!v63) break;
    int v64 = 0;
    int v65 = 0;
    int v66;
    int v67;
    v66 = v64;
    v67 = v65;
    while (true) {
      int v68 = 4;
      int v69 = v67 * v68;
      int v70 = v69 + v45;
      int v71 = 28;
      int v72 = v71 + v70;
      int v73 = v44[v72];
      int v74 = 0;
      bool v75 = v73 != v74;
      v66 = v66;
      v67 = v67;
      if (!v75) break;
      int v76 = 48;
      int v77 = v76 + v45;
      int v78 = v44[v77];
      int v79 = 0;
      bool v80 = v78 != v79;
      int v81;
      if (v80) {
        v81 = v45;
      } else {
        v81 = v45;
      }
      int v82 = v66 + v81;
      int v83 = 1;
      int v84 = v67 + v83;
      v66 = v82;
      v67 = v84;
    }
    bool v85 = true;
    int v86 = v54 + v66;
    int v87 = 1;
    int v88 = v55 + v87;
    v54 = v86;
    v55 = v88;
  }
  bool v89 = true;
  int v90 = 16;
  int v91 = v90 + v45;
  bool v92 = true;
  int v93 = simt_wave_count_bits(v92);
  v43[v91] = v93;
  int v94 = 52;
  int v95 = v94 + v45;
  int v96 = v44[v95];
  int v97 = 0;
  bool v98 = v96 != v97;
  int v99;
  if (v98) {
    int v100 = 56;
    int v101 = v100 + v45;
    int v102 = v44[v101];
    int v103 = 0;
    bool v104 = v102 != v103;
    int v105;
    if (v104) {
      int v106 = 60;
      int v107 = v106 + v45;
      int v108 = v44[v107];
      uint v109 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v110 = (int)(v109);
      int v111;
      v111 = v110;
      switch (v108) {
        case 0:
          {
          int v112 = 4;
          int v113 = v45 + v112;
          v111 = v113;
          break;
        }
        case 1:
          {
          int v114 = 3;
          int v115 = v45 + v114;
          v111 = v115;
        }
        default:
          {
          int v116 = 4;
          int v117 = v45 + v116;
          v111 = v117;
          break;
        }
      }
      bool v118 = true;
      v105 = v111;
    } else {
      int v119 = 64;
      int v120 = v119 + v45;
      int v121 = v44[v120];
      int v122 = 0;
      bool v123 = v121 != v122;
      int v124;
      if (v123) {
        int v125 = 1;
        int v126 = v45 + v125;
        v124 = v126;
      } else {
        uint v127 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v128 = (int)(v127);
        v124 = v128;
      }
      v105 = v124;
    }
    v99 = v105;
  } else {
    int v129 = 68;
    int v130 = v129 + v45;
    int v131 = v44[v130];
    int v132 = 0;
    bool v133 = v131 != v132;
    int v134;
    if (v133) {
      int v135 = 72;
      int v136 = v135 + v45;
      int v137 = v44[v136];
      int v138 = 0;
      bool v139 = v137 != v138;
      int v140;
      if (v139) {
        uint v141 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v142 = (int)(v141);
        v140 = v142;
      } else {
        uint v143 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v144 = (int)(v143);
        v140 = v144;
      }
      v134 = v140;
    } else {
      uint v145 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v146 = (int)(v145);
      v134 = v146;
    }
    v99 = v134;
  }
  int v147 = 32;
  int v148 = v147 + v45;
  bool v149 = true;
  int v150 = simt_wave_count_bits(v149);
  v43[v148] = v150;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 76; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
