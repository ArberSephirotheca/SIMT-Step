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
  int v4 = 3;
  int v5 = 0;
  bool v6 = v2 != v5;
  int v7;
  if (v6) {
    int v8 = 3;
    int v9 = v3 % v8;
    uint v10 = simt_subgroup_id(__simt_tid);
    int v11 = (int)(v10);
    int v12;
    v12 = v11;
    switch (v9) {
      default:
        {
        int v13 = 0;
        int v14 = 0;
        int v15;
        int v16;
        v15 = v13;
        v16 = v14;
        while (true) {
          int v17 = 4;
          int v18 = v3 % v17;
          int v19 = 1;
          int v20 = v18 + v19;
          bool v21 = v16 < v20;
          v15 = v15;
          v16 = v16;
          if (!v21) break;
          int v22 = 1;
          int v23 = 1;
          int v24 = v16 + v23;
          v15 = v22;
          v16 = v24;
        }
        int v25 = 2;
        v12 = v15;
        break;
      }
      case 0:
        {
        int v26 = 0;
        bool v27 = v2 != v26;
        int v28;
        if (v27) {
          int v29 = 1;
          int v30 = v0 + v29;
          v28 = v30;
        } else {
          int v31 = 1;
          int v32 = v0 + v31;
          v28 = v32;
        }
        v12 = v28;
        break;
      }
      case 1:
        {
        int v33 = 0;
        int v34;
        v34 = v33;
        switch (v3) {
          default:
            {
            int v35 = 2;
            int v36 = v0 + v35;
            v34 = v36;
          }
          case 0:
            {
            v34 = v0;
            break;
          }
        }
        int v37 = 1;
        int v38 = v0 + v37;
        v12 = v34;
        break;
      }
      case 2:
        {
        int v39 = 4;
        int v40;
        v40 = v39;
        switch (v3) {
          case 0:
            {
            int v41 = 2;
            v40 = v41;
            break;
          }
          default:
            {
            int v42 = 2;
            int v43 = v0 + v42;
            v40 = v43;
            break;
          }
        }
        v12 = v40;
        break;
      }
    }
    v7 = v12;
  } else {
    int v44 = 0;
    bool v45 = v2 != v44;
    int v46;
    if (v45) {
      int v47 = 0;
      bool v48 = v2 != v47;
      int v49;
      if (v48) {
        v49 = v0;
      } else {
        int v50 = 1;
        v49 = v50;
      }
      int v51 = 1;
      int v52 = v0 + v51;
      v46 = v49;
    } else {
      int v53 = 0;
      int v54 = 0;
      int v55;
      int v56;
      v55 = v53;
      v56 = v54;
      while (true) {
        int v57 = 4;
        int v58 = v3 % v57;
        int v59 = 1;
        int v60 = v58 + v59;
        bool v61 = v56 < v60;
        v55 = v55;
        v56 = v56;
        if (!v61) break;
        uint v62 = simt_lane_id(__simt_tid);
        int v63 = (int)(v62);
        int v64 = 1;
        int v65 = v56 + v64;
        v55 = v63;
        v56 = v65;
        break;
        ;
      }
      int v66 = 1;
      v46 = v55;
    }
    int v67 = 0;
    v7 = v46;
  }
  bool v68 = true;
  int v69 = simt_wave_count_bits(v68);
  int v70 = 0;
  int v71 = v70 + v0;
  v1[v71] = v69;
  int v72 = 0;
  bool v73 = v2 != v72;
  int v74 = v73 ? v4 : v7;
  return;
}

kernel void kernel_main(device int* v75 [[buffer(0)]], device int* v76 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v77 = static_cast<int>(__simt_tid3.x);
  int v78 = 0;
  int v79 = v78 + v77;
  int v80 = v76[v79];
  int v81 = 4;
  int v82 = v81 + v77;
  int v83 = v76[v82];
  helper0(v77, v75, v80, v83, static_cast<int>(__simt_tid3.x));
  int v84 = 0;
  int v85 = 0;
  int v86;
  int v87;
  v86 = v84;
  v87 = v85;
  while (true) {
    int v88 = 4;
    int v89 = v87 * v88;
    int v90 = v89 + v77;
    int v91 = 8;
    int v92 = v91 + v90;
    int v93 = v76[v92];
    int v94 = 0;
    bool v95 = v93 != v94;
    v86 = v86;
    v87 = v87;
    if (!v95) break;
    int v96 = v86 + v77;
    int v97 = 1;
    int v98 = v87 + v97;
    v86 = v96;
    v87 = v98;
  }
  bool v99 = true;
  int v100 = 16;
  int v101 = v100 + v77;
  bool v102 = true;
  int v103 = simt_wave_count_bits(v102);
  v75[v101] = v103;
  uint v104 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v105 = (int)(v104);
  int v106 = 28;
  int v107 = v106 + v77;
  int v108 = v76[v107];
  int v109 = 0;
  int v110 = v77 + v109;
  int v111;
  v111 = v110;
  switch (v108) {
    case 0:
      {
      int v112 = 4;
      int v113 = v77 + v112;
      v111 = v113;
      break;
    }
    case 1:
      {
      int v114 = 0;
      int v115 = 0;
      int v116;
      int v117;
      v116 = v114;
      v117 = v115;
      while (true) {
        int v118 = 4;
        int v119 = v117 * v118;
        int v120 = v119 + v77;
        int v121 = 32;
        int v122 = v121 + v120;
        int v123 = v76[v122];
        int v124 = 0;
        bool v125 = v123 != v124;
        v116 = v116;
        v117 = v117;
        if (!v125) break;
        int v126 = 52;
        int v127 = v126 + v77;
        int v128 = v76[v127];
        int v129 = 3;
        int v130 = v77 + v129;
        int v131;
        v131 = v130;
        switch (v128) {
          case 0:
            {
            int v132 = 1;
            int v133 = v77 + v132;
            v131 = v133;
            break;
          }
          default:
            {
            int v134 = 2;
            v131 = v134;
            break;
          }
          case 1:
            {
            int v135 = 3;
            v131 = v135;
            break;
          }
          case 2:
            {
            v131 = v77;
            break;
          }
        }
        bool v136 = true;
        int v137 = v116 + v131;
        int v138 = 1;
        int v139 = v117 + v138;
        v116 = v137;
        v117 = v139;
      }
      bool v140 = true;
      v111 = v116;
      break;
    }
    default:
      {
      int v141 = 56;
      int v142 = v141 + v77;
      int v143 = v76[v142];
      int v144 = 0;
      bool v145 = v143 != v144;
      int v146;
      if (v145) {
        int v147 = 60;
        int v148 = v147 + v77;
        int v149 = v76[v148];
        int v150 = 0;
        bool v151 = v149 != v150;
        int v152;
        if (v151) {
          int v153 = 4;
          v152 = v153;
        } else {
          int v154 = 3;
          v152 = v154;
        }
        v146 = v152;
      } else {
        v146 = v77;
      }
      v111 = v146;
      break;
    }
  }
  bool v155 = true;
  int v156 = 32;
  int v157 = v156 + v77;
  bool v158 = true;
  int v159 = simt_wave_count_bits(v158);
  v75[v157] = v159;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 64; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
