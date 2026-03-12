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
  int v8 = 2;
  int v9 = v3 % v8;
  uint v10 = simt_subgroup_id(__simt_tid);
  int v11 = (int)(v10);
  int v12;
  v12 = v11;
  switch (v9) {
    case 0:
      {
      v12 = v0;
      break;
    }
    case 1:
      {
      int v13 = 2;
      int v14 = v3 % v13;
      int v15;
      v15 = v0;
      switch (v14) {
        case 0:
          {
          int v16 = 0;
          bool v17 = v2 != v16;
          int v18;
          if (v17) {
            v18 = v0;
          } else {
            int v19 = 3;
            int v20 = v0 + v19;
            v18 = v20;
          }
          v15 = v18;
          break;
        }
        case 1:
          {
          int v21 = 0;
          bool v22 = v2 != v21;
          int v23;
          if (v22) {
            int v24 = 1;
            v23 = v24;
          } else {
            int v25 = 3;
            int v26 = v0 + v25;
            v23 = v26;
          }
          v15 = v23;
        }
        default:
          {
          int v27 = 0;
          bool v28 = v2 != v27;
          int v29;
          if (v28) {
            int v30 = 3;
            v29 = v30;
          } else {
            v29 = v0;
          }
          v15 = v29;
          break;
        }
      }
      v12 = v15;
      break;
    }
    default:
      {
      int v31 = 0;
      int v32 = v0 + v31;
      v12 = v32;
      break;
    }
  }
  int v33 = 0;
  bool v34 = v2 != v33;
  int v35 = v34 ? v5 : v12;
  return;
}

kernel void kernel_main(device int* v36 [[buffer(0)]], device int* v37 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v38 = static_cast<int>(__simt_tid3.x);
  int v39 = 0;
  int v40 = v39 + v38;
  int v41 = v37[v40];
  int v42 = 4;
  int v43 = v42 + v38;
  int v44 = v37[v43];
  int v45 = 0;
  bool v46 = v41 != v45;
  if (v46) {
    int v47 = 8;
    int v48 = v47 + v38;
    int v49 = v37[v48];
    int v50 = 0;
    bool v51 = v49 != v50;
    if (v51) {
    } else {
      int v52 = 3;
      int v53 = v38 % v52;
      int v54 = 1;
      int v55;
      v55 = v54;
      switch (v53) {
        case 0:
          {
          int v56 = 4;
          int v57 = v55 + v56;
          v55 = v57;
          break;
        }
        case 1:
          {
          int v58 = 4;
          int v59 = v55 + v58;
          v55 = v59;
          break;
        }
        case 2:
          {
          int v60 = 0;
          int v61 = v55 + v60;
          v55 = v61;
          break;
        }
        default:
          {
          int v62 = 1;
          int v63 = v55 + v62;
          v55 = v63;
          break;
        }
      }
      helper0(v38, v36, v41, v44, static_cast<int>(__simt_tid3.x));
    }
  } else {
  }
  int v64 = 2;
  int v65 = v38 + v64;
  int v66 = 12;
  int v67 = v66 + v38;
  int v68 = v37[v67];
  int v69 = 0;
  bool v70 = v68 != v69;
  int v71;
  if (v70) {
    int v72 = 16;
    int v73 = v72 + v38;
    int v74 = v37[v73];
    int v75 = 0;
    bool v76 = v74 != v75;
    int v77;
    if (v76) {
      uint v78 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v79 = (int)(v78);
      v77 = v79;
    } else {
      int v80 = 20;
      int v81 = v80 + v38;
      int v82 = v37[v81];
      int v83 = 2;
      int v84 = v38 + v83;
      int v85;
      v85 = v84;
      switch (v82) {
        case 0:
          {
          int v86 = 1;
          int v87 = v38 + v86;
          v85 = v87;
          break;
        }
        default:
          {
          int v88 = 0;
          v85 = v88;
          break;
        }
      }
      v77 = v85;
    }
    int v89 = 16;
    int v90 = v89 + v38;
    bool v91 = true;
    int v92 = simt_wave_count_bits(v91);
    v36[v90] = v92;
    v71 = v77;
  } else {
    int v93 = 0;
    int v94 = 0;
    int v95;
    int v96;
    v95 = v93;
    v96 = v94;
    while (true) {
      int v97 = 4;
      int v98 = v96 * v97;
      int v99 = v98 + v38;
      int v100 = 24;
      int v101 = v100 + v99;
      int v102 = v37[v101];
      int v103 = 0;
      bool v104 = v102 != v103;
      v95 = v95;
      v96 = v96;
      if (!v104) break;
      int v105 = v95 + v96;
      int v106 = 1;
      int v107 = v96 + v106;
      bool v108 = true;
      int v109 = 32;
      int v110 = 4;
      int v111 = v96 * v110;
      int v112 = v109 + v111;
      int v113 = v112 + v38;
      bool v114 = true;
      int v115 = simt_wave_count_bits(v114);
      v36[v113] = v115;
      v95 = v105;
      v96 = v107;
    }
    v71 = v95;
  }
  int v116 = 48;
  int v117 = v116 + v38;
  bool v118 = true;
  int v119 = simt_wave_count_bits(v118);
  v36[v117] = v119;
  int v120 = 44;
  int v121 = v120 + v38;
  int v122 = v37[v121];
  int v123;
  v123 = v38;
  switch (v122) {
    default:
      {
      int v124 = 48;
      int v125 = v124 + v38;
      int v126 = v37[v125];
      int v127 = 3;
      int v128;
      v128 = v127;
      switch (v126) {
        case 0:
          {
          v128 = v38;
          break;
        }
        case 1:
          {
          int v129 = 52;
          int v130 = v129 + v38;
          int v131 = v37[v130];
          int v132;
          v132 = v38;
          switch (v131) {
            case 0:
              {
              int v133 = 1;
              v132 = v133;
            }
            default:
              {
              int v134 = 3;
              int v135 = v38 + v134;
              v132 = v135;
              break;
            }
          }
          v128 = v132;
        }
        default:
          {
          v128 = v38;
          break;
        }
      }
      v123 = v128;
      break;
    }
    case 0:
      {
      int v136 = 0;
      v123 = v136;
      break;
    }
    case 1:
      {
      int v137 = 56;
      int v138 = v137 + v38;
      int v139 = v37[v138];
      int v140 = 0;
      bool v141 = v139 != v140;
      int v142;
      if (v141) {
        int v143 = 60;
        int v144 = v143 + v38;
        int v145 = v37[v144];
        int v146 = 3;
        int v147;
        v147 = v146;
        switch (v145) {
          case 0:
            {
            int v148 = 3;
            v147 = v148;
          }
          case 1:
            {
            int v149 = 3;
            v147 = v149;
          }
          default:
            {
            int v150 = 3;
            int v151 = v38 + v150;
            v147 = v151;
            break;
          }
          case 2:
            {
            int v152 = 1;
            int v153 = v38 + v152;
            v147 = v153;
            break;
          }
        }
        v142 = v147;
      } else {
        int v154 = 64;
        int v155 = v154 + v38;
        int v156 = v37[v155];
        int v157 = 4;
        int v158;
        v158 = v157;
        switch (v156) {
          default:
            {
            v158 = v38;
            break;
          }
          case 0:
            {
            v158 = v38;
            break;
          }
        }
        v142 = v158;
      }
      v123 = v142;
      break;
    }
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
