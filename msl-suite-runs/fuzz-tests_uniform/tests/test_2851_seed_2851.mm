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
    int v13 = 1;
    int v14 = 1;
    int v15 = v7 + v14;
    v6 = v13;
    v7 = v15;
    break;
    ;
  }
  bool v16 = true;
  int v17 = simt_wave_count_bits(v16);
  int v18 = 0;
  int v19 = v18 + v0;
  v1[v19] = v17;
  int v20 = 0;
  bool v21 = v2 != v20;
  int v22;
  if (v21) {
    int v23 = 0;
    int v24 = v0 + v23;
    v22 = v24;
  } else {
    int v25 = 0;
    int v26 = 0;
    int v27;
    int v28;
    v27 = v25;
    v28 = v26;
    while (true) {
      int v29 = 4;
      int v30 = v3 % v29;
      int v31 = 1;
      int v32 = v30 + v31;
      bool v33 = v28 < v32;
      v27 = v27;
      v28 = v28;
      if (!v33) break;
      int v34 = 0;
      bool v35 = v2 != v34;
      int v36;
      if (v35) {
        uint v37 = simt_lane_id(__simt_tid);
        int v38 = (int)(v37);
        v36 = v38;
      } else {
        uint v39 = simt_lane_id(__simt_tid);
        int v40 = (int)(v39);
        v36 = v40;
      }
      uint v41 = simt_subgroup_id(__simt_tid);
      int v42 = (int)(v41);
      int v43 = 1;
      int v44 = v28 + v43;
      v27 = v36;
      v28 = v44;
    }
    uint v45 = simt_subgroup_id(__simt_tid);
    int v46 = (int)(v45);
    v22 = v27;
  }
  bool v47 = true;
  int v48 = simt_wave_count_bits(v47);
  int v49 = 16;
  int v50 = v49 + v0;
  v1[v50] = v48;
  int v51 = 0;
  bool v52 = v2 != v51;
  int v53 = v52 ? v6 : v22;
  return;
}

kernel void kernel_main(device int* v54 [[buffer(0)]], device int* v55 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v56 = static_cast<int>(__simt_tid3.x);
  int v57 = 0;
  int v58 = v57 + v56;
  int v59 = v55[v58];
  int v60 = 4;
  int v61 = v60 + v56;
  int v62 = v55[v61];
  helper0(v56, v54, v59, v62, static_cast<int>(__simt_tid3.x));
  int v63 = 8;
  int v64 = v63 + v56;
  int v65 = v55[v64];
  int v66 = 4;
  int v67 = v56 + v66;
  int v68;
  v68 = v67;
  switch (v65) {
    case 0:
      {
      int v69 = 12;
      int v70 = v69 + v56;
      int v71 = v55[v70];
      int v72 = 0;
      bool v73 = v71 != v72;
      int v74;
      if (v73) {
        int v75 = 1;
        v74 = v75;
      } else {
        int v76 = 16;
        int v77 = v76 + v56;
        int v78 = v55[v77];
        int v79 = 0;
        bool v80 = v78 != v79;
        int v81;
        if (v80) {
          int v82 = 4;
          int v83 = v56 + v82;
          v81 = v83;
        } else {
          v81 = v56;
        }
        v74 = v81;
      }
      v68 = v74;
      break;
    }
    case 1:
      {
      int v84 = 20;
      int v85 = v84 + v56;
      int v86 = v55[v85];
      int v87 = 3;
      int v88;
      v88 = v87;
      switch (v86) {
        case 0:
          {
          int v89 = 24;
          int v90 = v89 + v56;
          int v91 = v55[v90];
          int v92 = 0;
          int v93 = v56 + v92;
          int v94;
          v94 = v93;
          switch (v91) {
            case 0:
              {
              int v95 = 0;
              int v96 = v56 + v95;
              v94 = v96;
            }
            default:
              {
              int v97 = 0;
              v94 = v97;
            }
            case 1:
              {
              int v98 = 2;
              v94 = v98;
            }
            case 2:
              {
              int v99 = 4;
              int v100 = v56 + v99;
              v94 = v100;
              break;
            }
          }
          bool v101 = true;
          v88 = v94;
          break;
        }
        default:
          {
          int v102 = 1;
          v88 = v102;
          break;
        }
      }
      bool v103 = true;
      v68 = v88;
      break;
    }
    default:
      {
      int v104 = 28;
      int v105 = v104 + v56;
      int v106 = v55[v105];
      int v107 = 2;
      int v108 = v56 + v107;
      int v109;
      v109 = v108;
      switch (v106) {
        default:
          {
          int v110 = 0;
          int v111 = 0;
          int v112;
          int v113;
          v112 = v110;
          v113 = v111;
          while (true) {
            int v114 = 4;
            int v115 = v113 * v114;
            int v116 = v115 + v56;
            int v117 = 32;
            int v118 = v117 + v116;
            int v119 = v55[v118];
            int v120 = 0;
            bool v121 = v119 != v120;
            v112 = v112;
            v113 = v113;
            if (!v121) break;
            int v122 = v112 + v113;
            int v123 = 1;
            int v124 = v113 + v123;
            v112 = v122;
            v113 = v124;
          }
          bool v125 = true;
          v109 = v112;
          break;
        }
        case 0:
          {
          int v126 = 52;
          int v127 = v126 + v56;
          int v128 = v55[v127];
          int v129 = 0;
          bool v130 = v128 != v129;
          int v131;
          if (v130) {
            v131 = v56;
          } else {
            int v132 = 2;
            int v133 = v56 + v132;
            v131 = v133;
          }
          v109 = v131;
        }
        case 1:
          {
          int v134 = 56;
          int v135 = v134 + v56;
          int v136 = v55[v135];
          int v137 = 0;
          bool v138 = v136 != v137;
          int v139;
          if (v138) {
            int v140 = 4;
            int v141 = v56 + v140;
            v139 = v141;
          } else {
            v139 = v56;
          }
          v109 = v139;
          break;
        }
      }
      bool v142 = true;
      v68 = v109;
      break;
    }
  }
  bool v143 = true;
  int v144 = 32;
  int v145 = v144 + v56;
  bool v146 = true;
  int v147 = simt_wave_count_bits(v146);
  v54[v145] = v147;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 60; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
