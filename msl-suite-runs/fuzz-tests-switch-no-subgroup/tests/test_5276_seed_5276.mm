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
    int v13 = 3;
    int v14 = v3 % v13;
    int v15 = 4;
    int v16 = v0 + v15;
    int v17;
    v17 = v16;
    switch (v14) {
      case 0:
        {
        int v18 = 2;
        int v19 = v3 % v18;
        int v20 = 0;
        int v21;
        v21 = v20;
        switch (v19) {
          default:
            {
            v21 = v0;
            break;
          }
          case 0:
            {
            v21 = v0;
            break;
          }
        }
        v17 = v21;
        break;
      }
      case 1:
        {
        int v22 = 2;
        int v23 = v0 + v22;
        v17 = v23;
        break;
      }
      default:
        {
        int v24 = 1;
        v17 = v24;
        break;
      }
      case 2:
        {
        int v25 = 0;
        bool v26 = v2 != v25;
        int v27;
        if (v26) {
          int v28 = 1;
          v27 = v28;
        } else {
          int v29 = 0;
          v27 = v29;
        }
        v17 = v27;
        break;
      }
    }
    bool v30 = true;
    int v31 = simt_wave_count_bits(v30);
    int v32 = 0;
    int v33 = 4;
    int v34 = v7 * v33;
    int v35 = v32 + v34;
    int v36 = v35 + v0;
    v1[v36] = v31;
    int v37 = 1;
    int v38 = v7 + v37;
    v6 = v17;
    v7 = v38;
    continue;
    ;
  }
  return;
}

kernel void kernel_main(device int* v39 [[buffer(0)]], device int* v40 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v41 = static_cast<int>(__simt_tid3.x);
  int v42 = 0;
  int v43 = v42 + v41;
  int v44 = v40[v43];
  int v45 = 4;
  int v46 = v45 + v41;
  int v47 = v40[v46];
  helper0(v41, v39, v44, v47, static_cast<int>(__simt_tid3.x));
  int v48 = 0;
  int v49 = 0;
  int v50;
  int v51;
  v50 = v48;
  v51 = v49;
  while (true) {
    int v52 = 4;
    int v53 = v51 * v52;
    int v54 = v53 + v41;
    int v55 = 8;
    int v56 = v55 + v54;
    int v57 = v40[v56];
    int v58 = 0;
    bool v59 = v57 != v58;
    v50 = v50;
    v51 = v51;
    if (!v59) break;
    int v60 = 28;
    int v61 = v60 + v41;
    int v62 = v40[v61];
    uint v63 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v64 = (int)(v63);
    int v65;
    v65 = v64;
    switch (v62) {
      default:
        {
        int v66 = 3;
        v65 = v66;
        break;
      }
      case 0:
        {
        int v67 = 32;
        int v68 = v67 + v41;
        int v69 = v40[v68];
        int v70 = 2;
        int v71;
        v71 = v70;
        switch (v69) {
          case 0:
            {
            int v72 = 1;
            int v73 = v41 + v72;
            v71 = v73;
          }
          case 1:
            {
            v71 = v41;
          }
          default:
            {
            int v74 = 4;
            int v75 = v41 + v74;
            v71 = v75;
            break;
          }
        }
        bool v76 = true;
        v65 = v71;
        break;
      }
    }
    int v77 = v50 + v65;
    int v78 = 1;
    int v79 = v51 + v78;
    bool v80 = true;
    int v81 = 16;
    int v82 = 4;
    int v83 = v51 * v82;
    int v84 = v81 + v83;
    int v85 = v84 + v41;
    bool v86 = true;
    int v87 = simt_wave_count_bits(v86);
    v39[v85] = v87;
    v50 = v77;
    v51 = v79;
  }
  int v88 = 0;
  int v89 = 0;
  int v90;
  int v91;
  v90 = v88;
  v91 = v89;
  while (true) {
    int v92 = 4;
    int v93 = v91 * v92;
    int v94 = v93 + v41;
    int v95 = 36;
    int v96 = v95 + v94;
    int v97 = v40[v96];
    int v98 = 0;
    bool v99 = v97 != v98;
    v90 = v90;
    v91 = v91;
    if (!v99) break;
    int v100 = 56;
    int v101 = v100 + v41;
    int v102 = v40[v101];
    uint v103 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v104 = (int)(v103);
    int v105;
    v105 = v104;
    switch (v102) {
      case 0:
        {
        int v106 = 2;
        v105 = v106;
        break;
      }
      default:
        {
        int v107 = 60;
        int v108 = v107 + v41;
        int v109 = v40[v108];
        int v110 = 0;
        bool v111 = v109 != v110;
        int v112;
        if (v111) {
          v112 = v41;
        } else {
          v112 = v41;
        }
        v105 = v112;
        break;
      }
      case 1:
        {
        int v113 = 64;
        int v114 = v113 + v41;
        int v115 = v40[v114];
        int v116 = 3;
        int v117;
        v117 = v116;
        switch (v115) {
          case 0:
            {
            int v118 = 4;
            int v119 = v41 + v118;
            v117 = v119;
            break;
          }
          case 1:
            {
            int v120 = 2;
            int v121 = v41 + v120;
            v117 = v121;
            break;
          }
          case 2:
            {
            int v122 = 3;
            int v123 = v41 + v122;
            v117 = v123;
            break;
          }
          default:
            {
            int v124 = 1;
            v117 = v124;
            break;
          }
        }
        v105 = v117;
        break;
      }
    }
    bool v125 = true;
    int v126 = 32;
    int v127 = v126 + v41;
    bool v128 = true;
    int v129 = simt_wave_count_bits(v128);
    v39[v127] = v129;
    int v130 = v90 + v105;
    int v131 = 1;
    int v132 = v91 + v131;
    bool v133 = true;
    int v134 = 48;
    int v135 = 4;
    int v136 = v91 * v135;
    int v137 = v134 + v136;
    int v138 = v137 + v41;
    bool v139 = true;
    int v140 = simt_wave_count_bits(v139);
    v39[v138] = v140;
    v90 = v130;
    v91 = v132;
    continue;
    ;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 59; ++idx) {
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
