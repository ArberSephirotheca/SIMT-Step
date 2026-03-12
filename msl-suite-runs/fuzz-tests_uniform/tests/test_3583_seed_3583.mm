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
    int v7 = 3;
    int v8 = v3 % v7;
    uint v9 = simt_subgroup_id(__simt_tid);
    int v10 = (int)(v9);
    int v11;
    v11 = v10;
    switch (v8) {
      case 0:
        {
        int v12 = 2;
        int v13 = v3 % v12;
        int v14 = 0;
        int v15;
        v15 = v14;
        switch (v13) {
          case 0:
            {
            v15 = v0;
          }
          default:
            {
            v15 = v0;
            break;
          }
        }
        v11 = v15;
        break;
      }
      default:
        {
        int v16 = 3;
        int v17 = v3 % v16;
        int v18;
        v18 = v0;
        switch (v17) {
          case 0:
            {
            v18 = v0;
            break;
          }
          case 1:
            {
            v18 = v0;
            break;
          }
          default:
            {
            int v19 = 0;
            v18 = v19;
            break;
          }
          case 2:
            {
            v18 = v0;
            break;
          }
        }
        int v20 = 4;
        v11 = v18;
        break;
      }
      case 1:
        {
        int v21 = 0;
        int v22 = v0 + v21;
        v11 = v22;
        break;
      }
    }
    uint v23 = simt_subgroup_id(__simt_tid);
    int v24 = (int)(v23);
    v6 = v11;
  } else {
    int v25 = 3;
    int v26 = v3 % v25;
    int v27;
    v27 = v0;
    switch (v26) {
      case 0:
        {
        v27 = v0;
        break;
      }
      case 1:
        {
        int v28 = 0;
        int v29 = 0;
        int v30;
        int v31;
        v30 = v28;
        v31 = v29;
        while (true) {
          int v32 = 4;
          int v33 = v3 % v32;
          int v34 = 1;
          int v35 = v33 + v34;
          bool v36 = v31 < v35;
          v30 = v30;
          v31 = v31;
          if (!v36) break;
          int v37 = 1;
          int v38 = v31 + v37;
          v30 = v0;
          v31 = v38;
        }
        int v39 = 2;
        int v40 = v0 + v39;
        v27 = v30;
      }
      case 2:
        {
        int v41 = 4;
        int v42 = v3 % v41;
        int v43 = 1;
        int v44 = v0 + v43;
        int v45;
        v45 = v44;
        switch (v42) {
          case 0:
            {
            int v46 = 4;
            v45 = v46;
          }
          case 1:
            {
            int v47 = 3;
            v45 = v47;
          }
          case 2:
            {
            v45 = v0;
          }
          default:
            {
            int v48 = 3;
            v45 = v48;
            break;
          }
        }
        int v49 = 0;
        v27 = v45;
      }
      default:
        {
        int v50 = 2;
        int v51 = v3 % v50;
        int v52 = 2;
        int v53 = v0 + v52;
        int v54;
        v54 = v53;
        switch (v51) {
          case 0:
            {
            int v55 = 2;
            int v56 = v0 + v55;
            v54 = v56;
            break;
          }
          default:
            {
            int v57 = 1;
            int v58 = v0 + v57;
            v54 = v58;
            break;
          }
          case 1:
            {
            int v59 = 4;
            int v60 = v0 + v59;
            v54 = v60;
            break;
          }
        }
        int v61 = 1;
        v27 = v54;
        break;
      }
    }
    int v62 = 1;
    int v63 = v0 + v62;
    v6 = v27;
  }
  bool v64 = true;
  int v65 = simt_wave_count_bits(v64);
  int v66 = 0;
  int v67 = v66 + v0;
  v1[v67] = v65;
  return;
}

kernel void kernel_main(device int* v68 [[buffer(0)]], device int* v69 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v70 = static_cast<int>(__simt_tid3.x);
  int v71 = 0;
  int v72 = v71 + v70;
  int v73 = v69[v72];
  int v74 = 4;
  int v75 = v74 + v70;
  int v76 = v69[v75];
  helper0(v70, v68, v73, v76, static_cast<int>(__simt_tid3.x));
  int v77 = 8;
  int v78 = v77 + v70;
  int v79 = v69[v78];
  uint v80 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v81 = (int)(v80);
  int v82;
  v82 = v81;
  switch (v79) {
    case 0:
      {
      int v83 = 0;
      int v84 = 0;
      int v85;
      int v86;
      v85 = v83;
      v86 = v84;
      while (true) {
        int v87 = 4;
        int v88 = v86 * v87;
        int v89 = v88 + v70;
        int v90 = 12;
        int v91 = v90 + v89;
        int v92 = v69[v91];
        int v93 = 0;
        bool v94 = v92 != v93;
        v85 = v85;
        v86 = v86;
        if (!v94) break;
        int v95 = v85 + v86;
        int v96 = 1;
        int v97 = v86 + v96;
        v85 = v95;
        v86 = v97;
        break;
        ;
      }
      bool v98 = true;
      v82 = v85;
    }
    case 1:
      {
      int v99 = 32;
      int v100 = v99 + v70;
      int v101 = v69[v100];
      int v102;
      v102 = v70;
      switch (v101) {
        default:
          {
          int v103 = 36;
          int v104 = v103 + v70;
          int v105 = v69[v104];
          int v106 = 0;
          bool v107 = v105 != v106;
          int v108;
          if (v107) {
            v108 = v70;
          } else {
            int v109 = 1;
            v108 = v109;
          }
          v102 = v108;
          break;
        }
        case 0:
          {
          int v110 = 3;
          v102 = v110;
          break;
        }
      }
      bool v111 = true;
      v82 = v102;
    }
    default:
      {
      int v112 = 40;
      int v113 = v112 + v70;
      int v114 = v69[v113];
      int v115 = 0;
      bool v116 = v114 != v115;
      int v117;
      if (v116) {
        int v118 = 1;
        int v119 = v70 + v118;
        v117 = v119;
      } else {
        int v120 = 44;
        int v121 = v120 + v70;
        int v122 = v69[v121];
        int v123 = 2;
        int v124;
        v124 = v123;
        switch (v122) {
          default:
            {
            int v125 = 1;
            int v126 = v70 + v125;
            v124 = v126;
            break;
          }
          case 0:
            {
            v124 = v70;
            break;
          }
        }
        bool v127 = true;
        v117 = v124;
      }
      v82 = v117;
      break;
    }
  }
  bool v128 = true;
  int v129 = 16;
  int v130 = v129 + v70;
  bool v131 = true;
  int v132 = simt_wave_count_bits(v131);
  v68[v130] = v132;
  int v133 = 0;
  int v134 = 0;
  int v135;
  int v136;
  v135 = v133;
  v136 = v134;
  while (true) {
    int v137 = 4;
    int v138 = v136 * v137;
    int v139 = v138 + v70;
    int v140 = 48;
    int v141 = v140 + v139;
    int v142 = v69[v141];
    int v143 = 0;
    bool v144 = v142 != v143;
    v135 = v135;
    v136 = v136;
    if (!v144) break;
    int v145 = v135 + v136;
    int v146 = 1;
    int v147 = v136 + v146;
    v135 = v145;
    v136 = v147;
    break;
    ;
  }
  bool v148 = true;
  int v149 = 32;
  int v150 = v149 + v70;
  bool v151 = true;
  int v152 = simt_wave_count_bits(v151);
  v68[v150] = v152;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
