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
      int v23 = v16 + v22;
      v15 = v0;
      v16 = v23;
    }
    int v24 = 3;
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
  int v31 = 0;
  bool v32 = v2 != v31;
  int v33;
  if (v32) {
    int v34 = 3;
    int v35 = v3 % v34;
    int v36;
    v36 = v0;
    switch (v35) {
      case 0:
        {
        v36 = v0;
        break;
      }
      case 1:
        {
        int v37 = 0;
        bool v38 = v2 != v37;
        int v39;
        if (v38) {
          int v40 = 0;
          v39 = v40;
        } else {
          int v41 = 4;
          int v42 = v0 + v41;
          v39 = v42;
        }
        int v43 = 3;
        v36 = v39;
        break;
      }
      case 2:
        {
        int v44 = 0;
        bool v45 = v2 != v44;
        int v46;
        if (v45) {
          int v47 = 1;
          v46 = v47;
        } else {
          int v48 = 0;
          v46 = v48;
        }
        int v49 = 4;
        int v50 = v0 + v49;
        v36 = v46;
        break;
      }
      default:
        {
        v36 = v0;
        break;
      }
    }
    uint v51 = simt_lane_id(__simt_tid);
    int v52 = (int)(v51);
    v33 = v36;
  } else {
    uint v53 = simt_lane_id(__simt_tid);
    int v54 = (int)(v53);
    v33 = v54;
  }
  bool v55 = true;
  int v56 = simt_wave_count_bits(v55);
  int v57 = 16;
  int v58 = v57 + v0;
  v1[v58] = v56;
  int v59 = 0;
  bool v60 = v2 != v59;
  int v61 = v60 ? v6 : v33;
  return;
}

kernel void kernel_main(device int* v62 [[buffer(0)]], device int* v63 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v64 = static_cast<int>(__simt_tid3.x);
  int v65 = 0;
  int v66 = v65 + v64;
  int v67 = v63[v66];
  int v68 = 4;
  int v69 = v68 + v64;
  int v70 = v63[v69];
  helper0(v64, v62, v67, v70, static_cast<int>(__simt_tid3.x));
  int v71 = 8;
  int v72 = v71 + v64;
  int v73 = v63[v72];
  int v74 = 0;
  bool v75 = v73 != v74;
  int v76;
  if (v75) {
    int v77 = 12;
    int v78 = v77 + v64;
    int v79 = v63[v78];
    int v80 = 4;
    int v81;
    v81 = v80;
    switch (v79) {
      case 0:
        {
        int v82 = 16;
        int v83 = v82 + v64;
        int v84 = v63[v83];
        int v85 = 1;
        int v86;
        v86 = v85;
        switch (v84) {
          case 0:
            {
            v86 = v64;
            break;
          }
          default:
            {
            int v87 = 4;
            v86 = v87;
          }
          case 1:
            {
            int v88 = 0;
            int v89 = v64 + v88;
            v86 = v89;
            break;
          }
        }
        bool v90 = true;
        v81 = v86;
        break;
      }
      default:
        {
        int v91 = 0;
        int v92 = 0;
        int v93;
        int v94;
        v93 = v91;
        v94 = v92;
        while (true) {
          int v95 = 4;
          int v96 = v94 * v95;
          int v97 = v96 + v64;
          int v98 = 20;
          int v99 = v98 + v97;
          int v100 = v63[v99];
          int v101 = 0;
          bool v102 = v100 != v101;
          v93 = v93;
          v94 = v94;
          if (!v102) break;
          int v103 = v93 + v94;
          int v104 = 1;
          int v105 = v94 + v104;
          v93 = v103;
          v94 = v105;
        }
        bool v106 = true;
        v81 = v93;
        break;
      }
    }
    bool v107 = true;
    v76 = v81;
  } else {
    int v108 = 40;
    int v109 = v108 + v64;
    int v110 = v63[v109];
    int v111;
    v111 = v64;
    switch (v110) {
      default:
        {
        int v112 = 44;
        int v113 = v112 + v64;
        int v114 = v63[v113];
        int v115;
        v115 = v64;
        switch (v114) {
          default:
            {
            v115 = v64;
            break;
          }
          case 0:
            {
            int v116 = 4;
            v115 = v116;
            break;
          }
          case 1:
            {
            int v117 = 2;
            int v118 = v64 + v117;
            v115 = v118;
            break;
          }
        }
        bool v119 = true;
        v111 = v115;
      }
      case 0:
        {
        int v120 = 48;
        int v121 = v120 + v64;
        int v122 = v63[v121];
        int v123 = 1;
        int v124 = v64 + v123;
        int v125;
        v125 = v124;
        switch (v122) {
          default:
            {
            int v126 = 0;
            int v127 = v64 + v126;
            v125 = v127;
            break;
          }
          case 0:
            {
            int v128 = 2;
            v125 = v128;
            break;
          }
        }
        bool v129 = true;
        v111 = v125;
        break;
      }
      case 1:
        {
        int v130 = 0;
        int v131 = 0;
        int v132;
        int v133;
        v132 = v130;
        v133 = v131;
        while (true) {
          int v134 = 4;
          int v135 = v133 * v134;
          int v136 = v135 + v64;
          int v137 = 52;
          int v138 = v137 + v136;
          int v139 = v63[v138];
          int v140 = 0;
          bool v141 = v139 != v140;
          v132 = v132;
          v133 = v133;
          if (!v141) break;
          int v142 = v132 + v133;
          int v143 = 1;
          int v144 = v133 + v143;
          v132 = v142;
          v133 = v144;
          continue;
          ;
        }
        bool v145 = true;
        v111 = v132;
        break;
      }
    }
    bool v146 = true;
    v76 = v111;
  }
  int v147 = 32;
  int v148 = v147 + v64;
  bool v149 = true;
  int v150 = simt_wave_count_bits(v149);
  v62[v148] = v150;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 72; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
