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
      uint v16 = simt_lane_id(__simt_tid);
      int v17 = (int)(v16);
      int v18;
      v18 = v17;
      switch (v3) {
        default:
          {
          v18 = v0;
        }
        case 0:
          {
          v18 = v0;
          break;
        }
      }
      uint v19 = simt_subgroup_id(__simt_tid);
      int v20 = (int)(v19);
      v15 = v18;
    } else {
      uint v21 = simt_subgroup_id(__simt_tid);
      int v22 = (int)(v21);
      v15 = v22;
    }
    uint v23 = simt_subgroup_id(__simt_tid);
    int v24 = (int)(v23);
    int v25 = 1;
    int v26 = v7 + v25;
    v6 = v15;
    v7 = v26;
  }
  bool v27 = true;
  int v28 = simt_wave_count_bits(v27);
  int v29 = 0;
  int v30 = v29 + v0;
  v1[v30] = v28;
  return;
}

kernel void kernel_main(device int* v31 [[buffer(0)]], device int* v32 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v33 = static_cast<int>(__simt_tid3.x);
  int v34 = 0;
  int v35 = v34 + v33;
  int v36 = v32[v35];
  int v37 = 4;
  int v38 = v37 + v33;
  int v39 = v32[v38];
  helper0(v33, v31, v36, v39, static_cast<int>(__simt_tid3.x));
  int v40 = 8;
  int v41 = v40 + v33;
  int v42 = v32[v41];
  int v43 = 0;
  bool v44 = v42 != v43;
  int v45;
  if (v44) {
    v45 = v33;
  } else {
    int v46 = 1;
    int v47 = v33 + v46;
    v45 = v47;
  }
  int v48 = 16;
  int v49 = v48 + v33;
  bool v50 = true;
  int v51 = simt_wave_count_bits(v50);
  v31[v49] = v51;
  int v52 = 12;
  int v53 = v52 + v33;
  int v54 = v32[v53];
  int v55;
  v55 = v33;
  switch (v54) {
    case 0:
      {
      int v56 = 16;
      int v57 = v56 + v33;
      int v58 = v32[v57];
      int v59 = 0;
      bool v60 = v58 != v59;
      int v61;
      if (v60) {
        int v62 = 3;
        v61 = v62;
      } else {
        int v63 = 0;
        int v64 = 0;
        int v65;
        int v66;
        v65 = v63;
        v66 = v64;
        while (true) {
          int v67 = 4;
          int v68 = v66 * v67;
          int v69 = v68 + v33;
          int v70 = 20;
          int v71 = v70 + v69;
          int v72 = v32[v71];
          int v73 = 0;
          bool v74 = v72 != v73;
          v65 = v65;
          v66 = v66;
          if (!v74) break;
          int v75 = v65 + v66;
          int v76 = 1;
          int v77 = v66 + v76;
          v65 = v75;
          v66 = v77;
        }
        bool v78 = true;
        v61 = v65;
      }
      v55 = v61;
    }
    case 1:
      {
      int v79 = 40;
      int v80 = v79 + v33;
      int v81 = v32[v80];
      int v82 = 0;
      bool v83 = v81 != v82;
      int v84;
      if (v83) {
        int v85 = 0;
        int v86 = v33 + v85;
        v84 = v86;
      } else {
        int v87 = 4;
        v84 = v87;
      }
      v55 = v84;
    }
    case 2:
      {
      v55 = v33;
    }
    default:
      {
      int v88 = 44;
      int v89 = v88 + v33;
      int v90 = v32[v89];
      int v91;
      v91 = v33;
      switch (v90) {
        case 0:
          {
          int v92 = 48;
          int v93 = v92 + v33;
          int v94 = v32[v93];
          int v95 = 0;
          int v96 = v33 + v95;
          int v97;
          v97 = v96;
          switch (v94) {
            case 0:
              {
              int v98 = 4;
              v97 = v98;
              break;
            }
            default:
              {
              int v99 = 4;
              v97 = v99;
              break;
            }
            case 1:
              {
              int v100 = 0;
              int v101 = v33 + v100;
              v97 = v101;
            }
            case 2:
              {
              int v102 = 3;
              v97 = v102;
              break;
            }
          }
          bool v103 = true;
          v91 = v97;
          break;
        }
        default:
          {
          int v104 = 0;
          int v105 = 0;
          int v106;
          int v107;
          v106 = v104;
          v107 = v105;
          while (true) {
            int v108 = 4;
            int v109 = v107 * v108;
            int v110 = v109 + v33;
            int v111 = 52;
            int v112 = v111 + v110;
            int v113 = v32[v112];
            int v114 = 0;
            bool v115 = v113 != v114;
            v106 = v106;
            v107 = v107;
            if (!v115) break;
            int v116 = v106 + v107;
            int v117 = 1;
            int v118 = v107 + v117;
            v106 = v116;
            v107 = v118;
          }
          bool v119 = true;
          v91 = v106;
          break;
        }
        case 1:
          {
          int v120 = 72;
          int v121 = v120 + v33;
          int v122 = v32[v121];
          int v123;
          v123 = v33;
          switch (v122) {
            case 0:
              {
              int v124 = 2;
              int v125 = v33 + v124;
              v123 = v125;
              break;
            }
            case 1:
              {
              int v126 = 2;
              int v127 = v33 + v126;
              v123 = v127;
              break;
            }
            case 2:
              {
              int v128 = 2;
              int v129 = v33 + v128;
              v123 = v129;
              break;
            }
            default:
              {
              int v130 = 0;
              v123 = v130;
              break;
            }
          }
          bool v131 = true;
          v91 = v123;
          break;
        }
        case 2:
          {
          int v132 = 76;
          int v133 = v132 + v33;
          int v134 = v32[v133];
          int v135;
          v135 = v33;
          switch (v134) {
            case 0:
              {
              v135 = v33;
              break;
            }
            default:
              {
              v135 = v33;
              break;
            }
            case 1:
              {
              int v136 = 0;
              int v137 = v33 + v136;
              v135 = v137;
              break;
            }
          }
          bool v138 = true;
          v91 = v135;
          break;
        }
      }
      bool v139 = true;
      v55 = v91;
      break;
    }
  }
  bool v140 = true;
  int v141 = 32;
  int v142 = v141 + v33;
  bool v143 = true;
  int v144 = simt_wave_count_bits(v143);
  v31[v142] = v144;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
