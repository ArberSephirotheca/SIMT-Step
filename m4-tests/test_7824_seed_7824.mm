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
  int v4 = 2;
  int v5 = v3 % v4;
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 0;
      int v10 = 0;
      int v11;
      int v12;
      v11 = v9;
      v12 = v10;
      while (true) {
        int v13 = 4;
        int v14 = v3 % v13;
        int v15 = 1;
        int v16 = v14 + v15;
        bool v17 = v12 < v16;
        v11 = v11;
        v12 = v12;
        if (!v17) break;
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
          int v27 = 1;
          int v28 = 1;
          int v29 = v21 + v28;
          v20 = v27;
          v21 = v29;
        }
        int v30 = 1;
        int v31 = v12 + v30;
        v11 = v20;
        v12 = v31;
      }
      v8 = v11;
      break;
    }
    default:
      {
      int v32 = 4;
      int v33 = v3 % v32;
      int v34;
      v34 = v0;
      switch (v33) {
        case 0:
          {
          int v35 = 3;
          int v36 = v3 % v35;
          int v37 = 0;
          int v38 = v0 + v37;
          int v39;
          v39 = v38;
          switch (v36) {
            case 0:
              {
              int v40 = 4;
              v39 = v40;
            }
            case 1:
              {
              int v41 = 1;
              int v42 = v0 + v41;
              v39 = v42;
            }
            default:
              {
              v39 = v0;
              break;
            }
          }
          v34 = v39;
        }
        case 1:
          {
          int v43 = 4;
          int v44;
          v44 = v43;
          switch (v3) {
            default:
              {
              v44 = v0;
              break;
            }
            case 0:
              {
              int v45 = 1;
              int v46 = v0 + v45;
              v44 = v46;
              break;
            }
          }
          int v47 = 0;
          int v48 = v0 + v47;
          v34 = v44;
          break;
        }
        case 2:
          {
          v34 = v0;
        }
        default:
          {
          int v49 = 4;
          int v50 = v3 % v49;
          int v51 = 1;
          int v52;
          v52 = v51;
          switch (v50) {
            case 0:
              {
              int v53 = 3;
              v52 = v53;
              break;
            }
            case 1:
              {
              v52 = v0;
              break;
            }
            case 2:
              {
              v52 = v0;
              break;
            }
            default:
              {
              int v54 = 2;
              int v55 = v0 + v54;
              v52 = v55;
              break;
            }
          }
          v34 = v52;
          break;
        }
      }
      v8 = v34;
      break;
    }
    case 1:
      {
      int v56 = 0;
      int v57 = 0;
      int v58;
      int v59;
      v58 = v56;
      v59 = v57;
      while (true) {
        int v60 = 4;
        int v61 = v3 % v60;
        int v62 = 1;
        int v63 = v61 + v62;
        bool v64 = v59 < v63;
        v58 = v58;
        v59 = v59;
        if (!v64) break;
        int v65 = 0;
        bool v66 = v2 != v65;
        int v67;
        if (v66) {
          int v68 = 4;
          v67 = v68;
        } else {
          int v69 = 4;
          int v70 = v0 + v69;
          v67 = v70;
        }
        int v71 = 1;
        int v72 = v59 + v71;
        v58 = v67;
        v59 = v72;
      }
      v8 = v58;
      break;
    }
  }
  bool v73 = true;
  int v74 = simt_wave_count_bits(v73);
  int v75 = 0;
  int v76 = v75 + v0;
  v1[v76] = v74;
  return;
}

kernel void kernel_main(device int* v77 [[buffer(0)]], device int* v78 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v79 = static_cast<int>(__simt_tid3.x);
  int v80 = 0;
  int v81 = v80 + v79;
  int v82 = v78[v81];
  int v83 = 4;
  int v84 = v83 + v79;
  int v85 = v78[v84];
  int v86 = 0;
  bool v87 = v82 != v86;
  if (v87) {
    int v88 = 8;
    int v89 = v88 + v79;
    int v90 = v78[v89];
    int v91 = 0;
    bool v92 = v90 != v91;
    if (v92) {
      helper0(v79, v77, v82, v85, static_cast<int>(__simt_tid3.x));
    } else {
    }
  } else {
  }
  int v93 = 12;
  int v94 = v93 + v79;
  int v95 = v78[v94];
  int v96 = 0;
  bool v97 = v95 != v96;
  int v98;
  if (v97) {
    int v99 = 16;
    int v100 = v99 + v79;
    int v101 = v78[v100];
    uint v102 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v103 = (int)(v102);
    int v104;
    v104 = v103;
    switch (v101) {
      default:
        {
        int v105 = 20;
        int v106 = v105 + v79;
        int v107 = v78[v106];
        int v108 = 0;
        bool v109 = v107 != v108;
        int v110;
        if (v109) {
          v110 = v79;
        } else {
          int v111 = 1;
          v110 = v111;
        }
        v104 = v110;
        break;
      }
      case 0:
        {
        int v112 = 4;
        v104 = v112;
        break;
      }
    }
    v98 = v104;
  } else {
    int v113 = 24;
    int v114 = v113 + v79;
    int v115 = v78[v114];
    uint v116 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v117 = (int)(v116);
    int v118;
    v118 = v117;
    switch (v115) {
      case 0:
        {
        int v119 = 28;
        int v120 = v119 + v79;
        int v121 = v78[v120];
        int v122 = 0;
        bool v123 = v121 != v122;
        int v124;
        if (v123) {
          v124 = v79;
        } else {
          int v125 = 4;
          v124 = v125;
        }
        v118 = v124;
        break;
      }
      default:
        {
        int v126 = 0;
        v118 = v126;
        break;
      }
      case 1:
        {
        int v127 = 32;
        int v128 = v127 + v79;
        int v129 = v78[v128];
        int v130 = 0;
        bool v131 = v129 != v130;
        int v132;
        if (v131) {
          int v133 = 4;
          v132 = v133;
        } else {
          int v134 = 3;
          v132 = v134;
        }
        v118 = v132;
        break;
      }
      case 2:
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
          int v141 = v140 + v79;
          int v142 = 36;
          int v143 = v142 + v141;
          int v144 = v78[v143];
          int v145 = 0;
          bool v146 = v144 != v145;
          v137 = v137;
          v138 = v138;
          if (!v146) break;
          int v147 = v137 + v138;
          int v148 = 1;
          int v149 = v138 + v148;
          bool v150 = true;
          v137 = v147;
          v138 = v149;
        }
        v118 = v137;
        break;
      }
    }
    bool v151 = true;
    int v152 = 16;
    int v153 = v152 + v79;
    bool v154 = true;
    int v155 = simt_wave_count_bits(v154);
    v77[v153] = v155;
    v98 = v118;
  }
  int v156 = 32;
  int v157 = v156 + v79;
  bool v158 = true;
  int v159 = simt_wave_count_bits(v158);
  v77[v157] = v159;
  uint v160 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v161 = (int)(v160);
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
