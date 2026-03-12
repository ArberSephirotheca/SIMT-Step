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
  int v5 = v3 % v4;
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 4;
      int v10;
      v10 = v9;
      switch (v3) {
        case 0:
          {
          int v11 = 4;
          int v12 = v3 % v11;
          int v13 = 1;
          int v14 = v0 + v13;
          int v15;
          v15 = v14;
          switch (v12) {
            case 0:
              {
              int v16 = 1;
              int v17 = v0 + v16;
              v15 = v17;
            }
            default:
              {
              int v18 = 0;
              v15 = v18;
            }
            case 1:
              {
              v15 = v0;
            }
            case 2:
              {
              int v19 = 3;
              v15 = v19;
              break;
            }
          }
          v10 = v15;
          break;
        }
        default:
          {
          int v20 = 4;
          int v21 = v3 % v20;
          int v22 = 1;
          int v23 = v0 + v22;
          int v24;
          v24 = v23;
          switch (v21) {
            case 0:
              {
              v24 = v0;
              break;
            }
            default:
              {
              int v25 = 4;
              int v26 = v0 + v25;
              v24 = v26;
              break;
            }
            case 1:
              {
              int v27 = 3;
              v24 = v27;
              break;
            }
            case 2:
              {
              int v28 = 0;
              int v29 = v0 + v28;
              v24 = v29;
              break;
            }
          }
          int v30 = 4;
          int v31 = v0 + v30;
          v10 = v24;
          break;
        }
      }
      v8 = v10;
      break;
    }
    case 0:
      {
      int v32 = 3;
      int v33;
      v33 = v32;
      switch (v3) {
        default:
          {
          int v34 = 0;
          bool v35 = v2 != v34;
          int v36;
          if (v35) {
            int v37 = 4;
            v36 = v37;
          } else {
            int v38 = 0;
            int v39 = v0 + v38;
            v36 = v39;
          }
          v33 = v36;
          break;
        }
        case 0:
          {
          int v40 = 4;
          int v41 = v3 % v40;
          int v42 = 0;
          int v43 = v0 + v42;
          int v44;
          v44 = v43;
          switch (v41) {
            case 0:
              {
              int v45 = 2;
              int v46 = v0 + v45;
              v44 = v46;
            }
            case 1:
              {
              int v47 = 4;
              int v48 = v0 + v47;
              v44 = v48;
            }
            default:
              {
              v44 = v0;
            }
            case 2:
              {
              int v49 = 2;
              int v50 = v0 + v49;
              v44 = v50;
              break;
            }
          }
          v33 = v44;
          break;
        }
      }
      v8 = v33;
      break;
    }
    case 1:
      {
      int v51 = 0;
      bool v52 = v2 != v51;
      int v53;
      if (v52) {
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
          int v63 = 2;
          int v64 = 1;
          int v65 = v57 + v64;
          v56 = v63;
          v57 = v65;
        }
        v53 = v56;
      } else {
        int v66 = 3;
        int v67 = v3 % v66;
        int v68;
        v68 = v0;
        switch (v67) {
          case 0:
            {
            int v69 = 0;
            v68 = v69;
            break;
          }
          case 1:
            {
            v68 = v0;
            break;
          }
          default:
            {
            v68 = v0;
            break;
          }
        }
        v53 = v68;
      }
      v8 = v53;
      break;
    }
  }
  bool v70 = true;
  int v71 = simt_wave_count_bits(v70);
  int v72 = 0;
  int v73 = v72 + v0;
  v1[v73] = v71;
  return;
}

kernel void kernel_main(device int* v74 [[buffer(0)]], device int* v75 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v76 = static_cast<int>(__simt_tid3.x);
  int v77 = 0;
  int v78 = v77 + v76;
  int v79 = v75[v78];
  int v80 = 4;
  int v81 = v80 + v76;
  int v82 = v75[v81];
  helper0(v76, v74, v79, v82, static_cast<int>(__simt_tid3.x));
  uint v83 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v84 = (int)(v83);
  int v85 = 0;
  int v86 = 0;
  int v87;
  int v88;
  v87 = v85;
  v88 = v86;
  while (true) {
    int v89 = 4;
    int v90 = v88 * v89;
    int v91 = v90 + v76;
    int v92 = 8;
    int v93 = v92 + v91;
    int v94 = v75[v93];
    int v95 = 0;
    bool v96 = v94 != v95;
    v87 = v87;
    v88 = v88;
    if (!v96) break;
    int v97 = v87 + v88;
    int v98 = 1;
    int v99 = v88 + v98;
    bool v100 = true;
    int v101 = 16;
    int v102 = 4;
    int v103 = v88 * v102;
    int v104 = v101 + v103;
    int v105 = v104 + v76;
    bool v106 = true;
    int v107 = simt_wave_count_bits(v106);
    v74[v105] = v107;
    v87 = v97;
    v88 = v99;
  }
  int v108 = 28;
  int v109 = v108 + v76;
  int v110 = v75[v109];
  int v111 = 0;
  bool v112 = v110 != v111;
  int v113;
  if (v112) {
    int v114 = 32;
    int v115 = v114 + v76;
    int v116 = v75[v115];
    int v117 = 0;
    bool v118 = v116 != v117;
    int v119;
    if (v118) {
      int v120 = 36;
      int v121 = v120 + v76;
      int v122 = v75[v121];
      uint v123 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v124 = (int)(v123);
      int v125;
      v125 = v124;
      switch (v122) {
        default:
          {
          v125 = v76;
        }
        case 0:
          {
          int v126 = 0;
          int v127 = v76 + v126;
          v125 = v127;
          break;
        }
        case 1:
          {
          int v128 = 2;
          int v129 = v76 + v128;
          v125 = v129;
          break;
        }
      }
      v119 = v125;
    } else {
      int v130 = 40;
      int v131 = v130 + v76;
      int v132 = v75[v131];
      int v133 = 0;
      bool v134 = v132 != v133;
      int v135;
      if (v134) {
        uint v136 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v137 = (int)(v136);
        v135 = v137;
      } else {
        uint v138 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v139 = (int)(v138);
        v135 = v139;
      }
      int v140 = 32;
      int v141 = v140 + v76;
      bool v142 = true;
      int v143 = simt_wave_count_bits(v142);
      v74[v141] = v143;
      v119 = v135;
    }
    int v144 = 48;
    int v145 = v144 + v76;
    bool v146 = true;
    int v147 = simt_wave_count_bits(v146);
    v74[v145] = v147;
    v113 = v119;
  } else {
    v113 = v76;
  }
  int v148 = 64;
  int v149 = v148 + v76;
  bool v150 = true;
  int v151 = simt_wave_count_bits(v150);
  v74[v149] = v151;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 44; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
