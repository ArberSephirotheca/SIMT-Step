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
  int v6 = 1;
  int v7;
  v7 = v6;
  switch (v5) {
    case 0:
      {
      int v8;
      v8 = v0;
      switch (v3) {
        default:
          {
          int v9 = 3;
          int v10 = v3 % v9;
          int v11 = 1;
          int v12 = v0 + v11;
          int v13;
          v13 = v12;
          switch (v10) {
            case 0:
              {
              v13 = v0;
              break;
            }
            default:
              {
              int v14 = 4;
              int v15 = v0 + v14;
              v13 = v15;
              break;
            }
            case 1:
              {
              v13 = v0;
              break;
            }
          }
          int v16 = 1;
          v8 = v13;
          break;
        }
        case 0:
          {
          int v17 = 0;
          bool v18 = v2 != v17;
          int v19;
          if (v18) {
            v19 = v0;
          } else {
            int v20 = 2;
            v19 = v20;
          }
          int v21 = 1;
          v8 = v19;
          break;
        }
      }
      int v22 = 1;
      int v23 = v0 + v22;
      v7 = v8;
      break;
    }
    case 1:
      {
      int v24 = 2;
      int v25 = v3 % v24;
      int v26;
      v26 = v0;
      switch (v25) {
        case 0:
          {
          int v27 = 0;
          bool v28 = v2 != v27;
          int v29;
          if (v28) {
            int v30 = 3;
            v29 = v30;
          } else {
            int v31 = 3;
            int v32 = v0 + v31;
            v29 = v32;
          }
          int v33 = 0;
          int v34 = v0 + v33;
          v26 = v29;
          break;
        }
        default:
          {
          int v35 = 2;
          int v36 = v3 % v35;
          int v37 = 0;
          int v38 = v0 + v37;
          int v39;
          v39 = v38;
          switch (v36) {
            case 0:
              {
              v39 = v0;
            }
            default:
              {
              int v40 = 2;
              v39 = v40;
              break;
            }
          }
          int v41 = 2;
          int v42 = v0 + v41;
          v26 = v39;
          break;
        }
      }
      int v43 = 2;
      int v44 = v0 + v43;
      v7 = v26;
      break;
    }
    default:
      {
      v7 = v0;
      break;
    }
  }
  bool v45 = true;
  int v46 = simt_wave_count_bits(v45);
  int v47 = 0;
  int v48 = v47 + v0;
  v1[v48] = v46;
  return;
}

kernel void kernel_main(device int* v49 [[buffer(0)]], device int* v50 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v51 = static_cast<int>(__simt_tid3.x);
  int v52 = 0;
  int v53 = v52 + v51;
  int v54 = v50[v53];
  int v55 = 4;
  int v56 = v55 + v51;
  int v57 = v50[v56];
  helper0(v51, v49, v54, v57, static_cast<int>(__simt_tid3.x));
  int v58 = 0;
  int v59 = 0;
  int v60;
  int v61;
  v60 = v58;
  v61 = v59;
  while (true) {
    int v62 = 4;
    int v63 = v61 * v62;
    int v64 = v63 + v51;
    int v65 = 8;
    int v66 = v65 + v64;
    int v67 = v50[v66];
    int v68 = 0;
    bool v69 = v67 != v68;
    v60 = v60;
    v61 = v61;
    if (!v69) break;
    int v70 = 0;
    int v71 = 0;
    int v72;
    int v73;
    v72 = v70;
    v73 = v71;
    while (true) {
      int v74 = 4;
      int v75 = v73 * v74;
      int v76 = v75 + v51;
      int v77 = 28;
      int v78 = v77 + v76;
      int v79 = v50[v78];
      int v80 = 0;
      bool v81 = v79 != v80;
      v72 = v72;
      v73 = v73;
      if (!v81) break;
      int v82 = 48;
      int v83 = v82 + v51;
      int v84 = v50[v83];
      uint v85 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v86 = (int)(v85);
      int v87;
      v87 = v86;
      switch (v84) {
        case 0:
          {
          int v88 = 4;
          v87 = v88;
        }
        default:
          {
          v87 = v51;
          break;
        }
        case 1:
          {
          int v89 = 0;
          int v90 = v51 + v89;
          v87 = v90;
          break;
        }
      }
      bool v91 = true;
      int v92 = v72 + v87;
      int v93 = 1;
      int v94 = v73 + v93;
      v72 = v92;
      v73 = v94;
    }
    bool v95 = true;
    int v96 = v60 + v72;
    int v97 = 1;
    int v98 = v61 + v97;
    v60 = v96;
    v61 = v98;
  }
  bool v99 = true;
  int v100 = 16;
  int v101 = v100 + v51;
  bool v102 = true;
  int v103 = simt_wave_count_bits(v102);
  v49[v101] = v103;
  int v104 = 52;
  int v105 = v104 + v51;
  int v106 = v50[v105];
  int v107 = 0;
  bool v108 = v106 != v107;
  int v109;
  if (v108) {
    int v110 = 2;
    v109 = v110;
  } else {
    int v111 = 56;
    int v112 = v111 + v51;
    int v113 = v50[v112];
    int v114 = 0;
    bool v115 = v113 != v114;
    int v116;
    if (v115) {
      int v117 = 0;
      int v118 = 0;
      int v119;
      int v120;
      v119 = v117;
      v120 = v118;
      while (true) {
        int v121 = 4;
        int v122 = v120 * v121;
        int v123 = v122 + v51;
        int v124 = 60;
        int v125 = v124 + v123;
        int v126 = v50[v125];
        int v127 = 0;
        bool v128 = v126 != v127;
        v119 = v119;
        v120 = v120;
        if (!v128) break;
        int v129 = v119 + v120;
        int v130 = 1;
        int v131 = v120 + v130;
        v119 = v129;
        v120 = v131;
      }
      bool v132 = true;
      v116 = v119;
    } else {
      int v133 = 80;
      int v134 = v133 + v51;
      int v135 = v50[v134];
      int v136 = 3;
      int v137 = v51 + v136;
      int v138;
      v138 = v137;
      switch (v135) {
        case 0:
          {
          int v139 = 1;
          v138 = v139;
          break;
        }
        case 1:
          {
          int v140 = 1;
          int v141 = v51 + v140;
          v138 = v141;
          break;
        }
        default:
          {
          int v142 = 4;
          int v143 = v51 + v142;
          v138 = v143;
          break;
        }
      }
      bool v144 = true;
      v116 = v138;
    }
    v109 = v116;
  }
  int v145 = 32;
  int v146 = v145 + v51;
  bool v147 = true;
  int v148 = simt_wave_count_bits(v147);
  v49[v146] = v148;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
