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
  int v4 = 4;
  int v5 = v3 % v4;
  int v6 = 1;
  int v7;
  v7 = v6;
  switch (v5) {
    case 0:
      {
      int v8 = 0;
      int v9 = 0;
      int v10;
      int v11;
      v10 = v8;
      v11 = v9;
      while (true) {
        int v12 = 4;
        int v13 = v3 % v12;
        int v14 = 1;
        int v15 = v13 + v14;
        bool v16 = v11 < v15;
        v10 = v10;
        v11 = v11;
        if (!v16) break;
        int v17 = 2;
        int v18 = v3 % v17;
        int v19 = 2;
        int v20;
        v20 = v19;
        switch (v18) {
          default:
            {
            v20 = v0;
          }
          case 0:
            {
            int v21 = 0;
            v20 = v21;
            break;
          }
        }
        int v22 = 1;
        int v23 = v0 + v22;
        int v24 = 1;
        int v25 = v11 + v24;
        v10 = v20;
        v11 = v25;
        continue;
        ;
      }
      int v26 = 0;
      int v27 = v0 + v26;
      v7 = v10;
      break;
    }
    case 1:
      {
      int v28 = 0;
      bool v29 = v2 != v28;
      int v30;
      if (v29) {
        int v31 = 0;
        int v32 = 0;
        int v33;
        int v34;
        v33 = v31;
        v34 = v32;
        while (true) {
          int v35 = 4;
          int v36 = v3 % v35;
          int v37 = 1;
          int v38 = v36 + v37;
          bool v39 = v34 < v38;
          v33 = v33;
          v34 = v34;
          if (!v39) break;
          int v40 = 4;
          int v41 = 1;
          int v42 = v34 + v41;
          v33 = v40;
          v34 = v42;
        }
        v30 = v33;
      } else {
        int v43 = 3;
        int v44 = v3 % v43;
        int v45 = 3;
        int v46;
        v46 = v45;
        switch (v44) {
          default:
            {
            int v47 = 2;
            v46 = v47;
            break;
          }
          case 0:
            {
            v46 = v0;
            break;
          }
          case 1:
            {
            int v48 = 2;
            int v49 = v0 + v48;
            v46 = v49;
            break;
          }
        }
        int v50 = 0;
        int v51 = v0 + v50;
        v30 = v46;
      }
      int v52 = 0;
      int v53 = v0 + v52;
      v7 = v30;
      break;
    }
    default:
      {
      int v54 = 0;
      bool v55 = v2 != v54;
      int v56;
      if (v55) {
        int v57 = 0;
        bool v58 = v2 != v57;
        int v59;
        if (v58) {
          v59 = v0;
        } else {
          v59 = v0;
        }
        int v60 = 0;
        v56 = v59;
      } else {
        int v61 = 4;
        int v62 = v3 % v61;
        int v63 = 4;
        int v64;
        v64 = v63;
        switch (v62) {
          default:
            {
            int v65 = 1;
            v64 = v65;
            break;
          }
          case 0:
            {
            v64 = v0;
          }
          case 1:
            {
            v64 = v0;
          }
          case 2:
            {
            int v66 = 2;
            int v67 = v0 + v66;
            v64 = v67;
            break;
          }
        }
        int v68 = 2;
        v56 = v64;
      }
      v7 = v56;
      break;
    }
    case 2:
      {
      int v69 = 0;
      int v70 = 0;
      int v71;
      int v72;
      v71 = v69;
      v72 = v70;
      while (true) {
        int v73 = 4;
        int v74 = v3 % v73;
        int v75 = 1;
        int v76 = v74 + v75;
        bool v77 = v72 < v76;
        v71 = v71;
        v72 = v72;
        if (!v77) break;
        int v78 = 1;
        int v79 = v72 + v78;
        v71 = v0;
        v72 = v79;
      }
      int v80 = 1;
      v7 = v71;
      break;
    }
  }
  bool v81 = true;
  int v82 = simt_wave_count_bits(v81);
  int v83 = 0;
  int v84 = v83 + v0;
  v1[v84] = v82;
  return;
}

kernel void kernel_main(device int* v85 [[buffer(0)]], device int* v86 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v87 = static_cast<int>(__simt_tid3.x);
  int v88 = 0;
  int v89 = v88 + v87;
  int v90 = v86[v89];
  int v91 = 4;
  int v92 = v91 + v87;
  int v93 = v86[v92];
  helper0(v87, v85, v90, v93, static_cast<int>(__simt_tid3.x));
  int v94 = 0;
  int v95 = 0;
  int v96;
  int v97;
  v96 = v94;
  v97 = v95;
  while (true) {
    int v98 = 4;
    int v99 = v97 * v98;
    int v100 = v99 + v87;
    int v101 = 8;
    int v102 = v101 + v100;
    int v103 = v86[v102];
    int v104 = 0;
    bool v105 = v103 != v104;
    v96 = v96;
    v97 = v97;
    if (!v105) break;
    int v106 = 28;
    int v107 = v106 + v87;
    int v108 = v86[v107];
    int v109 = 3;
    int v110;
    v110 = v109;
    switch (v108) {
      default:
        {
        int v111 = 32;
        int v112 = v111 + v87;
        int v113 = v86[v112];
        int v114 = 1;
        int v115 = v87 + v114;
        int v116;
        v116 = v115;
        switch (v113) {
          default:
            {
            v116 = v87;
            break;
          }
          case 0:
            {
            int v117 = 1;
            v116 = v117;
            break;
          }
          case 1:
            {
            int v118 = 2;
            int v119 = v87 + v118;
            v116 = v119;
            break;
          }
        }
        bool v120 = true;
        v110 = v116;
        break;
      }
      case 0:
        {
        int v121 = 36;
        int v122 = v121 + v87;
        int v123 = v86[v122];
        int v124 = 4;
        int v125;
        v125 = v124;
        switch (v123) {
          case 0:
            {
            int v126 = 1;
            v125 = v126;
            break;
          }
          default:
            {
            int v127 = 1;
            int v128 = v87 + v127;
            v125 = v128;
            break;
          }
          case 1:
            {
            int v129 = 0;
            v125 = v129;
            break;
          }
          case 2:
            {
            int v130 = 4;
            int v131 = v87 + v130;
            v125 = v131;
            break;
          }
        }
        bool v132 = true;
        v110 = v125;
        break;
      }
      case 1:
        {
        int v133 = 40;
        int v134 = v133 + v87;
        int v135 = v86[v134];
        int v136;
        v136 = v87;
        switch (v135) {
          default:
            {
            int v137 = 0;
            int v138 = v87 + v137;
            v136 = v138;
            break;
          }
          case 0:
            {
            int v139 = 0;
            v136 = v139;
            break;
          }
        }
        bool v140 = true;
        v110 = v136;
        break;
      }
    }
    bool v141 = true;
    int v142 = v96 + v110;
    int v143 = 1;
    int v144 = v97 + v143;
    v96 = v142;
    v97 = v144;
  }
  bool v145 = true;
  int v146 = 16;
  int v147 = v146 + v87;
  bool v148 = true;
  int v149 = simt_wave_count_bits(v148);
  v85[v147] = v149;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 44; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
