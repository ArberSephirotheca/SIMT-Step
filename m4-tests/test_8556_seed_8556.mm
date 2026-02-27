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
  int v8 = 3;
  int v9 = v3 % v8;
  uint v10 = simt_subgroup_id(__simt_tid);
  int v11 = (int)(v10);
  int v12;
  v12 = v11;
  switch (v9) {
    case 0:
      {
      int v13 = 1;
      int v14 = v0 + v13;
      v12 = v14;
      break;
    }
    case 1:
      {
      int v15 = 0;
      int v16 = v0 + v15;
      int v17;
      v17 = v16;
      switch (v3) {
        case 0:
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
            int v27 = 1;
            int v28 = v21 + v27;
            v20 = v0;
            v21 = v28;
          }
          v17 = v20;
          break;
        }
        default:
          {
          int v29 = 0;
          bool v30 = v2 != v29;
          int v31;
          if (v30) {
            int v32 = 0;
            v31 = v32;
          } else {
            int v33 = 4;
            v31 = v33;
          }
          v17 = v31;
          break;
        }
      }
      v12 = v17;
      break;
    }
    default:
      {
      int v34 = 2;
      int v35 = v3 % v34;
      int v36 = 3;
      int v37;
      v37 = v36;
      switch (v35) {
        case 0:
          {
          int v38 = 2;
          int v39 = v3 % v38;
          int v40;
          v40 = v0;
          switch (v39) {
            default:
              {
              v40 = v0;
            }
            case 0:
              {
              int v41 = 2;
              int v42 = v0 + v41;
              v40 = v42;
              break;
            }
          }
          v37 = v40;
        }
        default:
          {
          int v43 = 0;
          int v44 = 0;
          int v45;
          int v46;
          v45 = v43;
          v46 = v44;
          while (true) {
            int v47 = 4;
            int v48 = v3 % v47;
            int v49 = 1;
            int v50 = v48 + v49;
            bool v51 = v46 < v50;
            v45 = v45;
            v46 = v46;
            if (!v51) break;
            int v52 = 1;
            int v53 = v46 + v52;
            v45 = v0;
            v46 = v53;
          }
          v37 = v45;
          break;
        }
      }
      v12 = v37;
    }
    case 2:
      {
      int v54 = 0;
      int v55 = 0;
      int v56;
      int v57;
      v56 = v54;
      v57 = v55;
      while (true) {
        int v58 = 4;
        int v59 = v3 % v58;
        int v60 = 1;
        int v61 = v59 + v60;
        bool v62 = v57 < v61;
        v56 = v56;
        v57 = v57;
        if (!v62) break;
        int v63 = 0;
        int v64 = 0;
        int v65;
        int v66;
        v65 = v63;
        v66 = v64;
        while (true) {
          int v67 = 4;
          int v68 = v3 % v67;
          int v69 = 1;
          int v70 = v68 + v69;
          bool v71 = v66 < v70;
          v65 = v65;
          v66 = v66;
          if (!v71) break;
          int v72 = 1;
          int v73 = v66 + v72;
          v65 = v0;
          v66 = v73;
        }
        int v74 = 1;
        int v75 = v57 + v74;
        v56 = v65;
        v57 = v75;
        break;
        ;
      }
      v12 = v56;
      break;
    }
  }
  int v76 = 0;
  bool v77 = v2 != v76;
  int v78 = v77 ? v5 : v12;
  return;
}

kernel void kernel_main(device int* v79 [[buffer(0)]], device int* v80 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v81 = static_cast<int>(__simt_tid3.x);
  int v82 = 0;
  int v83 = v82 + v81;
  int v84 = v80[v83];
  int v85 = 4;
  int v86 = v85 + v81;
  int v87 = v80[v86];
  int v88 = 0;
  bool v89 = v84 != v88;
  if (v89) {
    int v90 = 8;
    int v91 = v90 + v81;
    int v92 = v80[v91];
    int v93 = 0;
    bool v94 = v92 != v93;
    if (v94) {
    } else {
      int v95 = 2;
      int v96 = v81 % v95;
      int v97 = 3;
      int v98;
      v98 = v97;
      switch (v96) {
        case 0:
          {
          int v99 = 2;
          int v100 = v98 + v99;
          v98 = v100;
          break;
        }
        default:
          {
          int v101 = 0;
          int v102 = v98 + v101;
          v98 = v102;
          break;
        }
        case 1:
          {
          int v103 = 3;
          int v104 = v98 + v103;
          v98 = v104;
          break;
        }
      }
      helper0(v81, v79, v84, v87, static_cast<int>(__simt_tid3.x));
    }
  } else {
  }
  uint v105 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v106 = (int)(v105);
  int v107 = 12;
  int v108 = v107 + v81;
  int v109 = v80[v108];
  uint v110 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v111 = (int)(v110);
  int v112;
  v112 = v111;
  switch (v109) {
    case 0:
      {
      int v113 = 2;
      int v114 = v81 + v113;
      v112 = v114;
    }
    default:
      {
      int v115 = 16;
      int v116 = v115 + v81;
      int v117 = v80[v116];
      int v118 = 0;
      int v119 = v81 + v118;
      int v120;
      v120 = v119;
      switch (v117) {
        case 0:
          {
          int v121 = 20;
          int v122 = v121 + v81;
          int v123 = v80[v122];
          int v124 = 0;
          bool v125 = v123 != v124;
          int v126;
          if (v125) {
            v126 = v81;
          } else {
            int v127 = 0;
            v126 = v127;
          }
          v120 = v126;
          break;
        }
        default:
          {
          int v128 = 24;
          int v129 = v128 + v81;
          int v130 = v80[v129];
          int v131;
          v131 = v81;
          switch (v130) {
            case 0:
              {
              int v132 = 3;
              v131 = v132;
              break;
            }
            default:
              {
              v131 = v81;
              break;
            }
            case 1:
              {
              v131 = v81;
              break;
            }
            case 2:
              {
              int v133 = 2;
              int v134 = v81 + v133;
              v131 = v134;
              break;
            }
          }
          v120 = v131;
          break;
        }
      }
      v112 = v120;
      break;
    }
    case 1:
      {
      int v135 = 28;
      int v136 = v135 + v81;
      int v137 = v80[v136];
      int v138 = 0;
      bool v139 = v137 != v138;
      int v140;
      if (v139) {
        int v141 = 32;
        int v142 = v141 + v81;
        int v143 = v80[v142];
        int v144;
        v144 = v81;
        switch (v143) {
          case 0:
            {
            int v145 = 1;
            int v146 = v81 + v145;
            v144 = v146;
            break;
          }
          default:
            {
            int v147 = 0;
            v144 = v147;
            break;
          }
        }
        v140 = v144;
      } else {
        v140 = v81;
      }
      v112 = v140;
    }
    case 2:
      {
      int v148 = 0;
      v112 = v148;
      break;
    }
  }
  bool v149 = true;
  int v150 = 16;
  int v151 = v150 + v81;
  bool v152 = true;
  int v153 = simt_wave_count_bits(v152);
  v79[v151] = v153;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 20; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 36; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
