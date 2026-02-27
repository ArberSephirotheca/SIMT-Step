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
  int v6;
  v6 = v0;
  switch (v5) {
    case 0:
      {
      int v7 = 0;
      int v8 = 0;
      int v9;
      int v10;
      v9 = v7;
      v10 = v8;
      while (true) {
        int v11 = 4;
        int v12 = v3 % v11;
        int v13 = 1;
        int v14 = v12 + v13;
        bool v15 = v10 < v14;
        v9 = v9;
        v10 = v10;
        if (!v15) break;
        int v16 = 0;
        bool v17 = v2 != v16;
        int v18;
        if (v17) {
          int v19 = 2;
          v18 = v19;
        } else {
          int v20 = 4;
          v18 = v20;
        }
        int v21 = 1;
        int v22 = v10 + v21;
        v9 = v18;
        v10 = v22;
        continue;
        ;
      }
      v6 = v9;
    }
    case 1:
      {
      int v23 = 0;
      int v24 = 0;
      int v25;
      int v26;
      v25 = v23;
      v26 = v24;
      while (true) {
        int v27 = 4;
        int v28 = v3 % v27;
        int v29 = 1;
        int v30 = v28 + v29;
        bool v31 = v26 < v30;
        v25 = v25;
        v26 = v26;
        if (!v31) break;
        int v32 = 0;
        int v33 = 0;
        int v34;
        int v35;
        v34 = v32;
        v35 = v33;
        while (true) {
          int v36 = 4;
          int v37 = v3 % v36;
          int v38 = 1;
          int v39 = v37 + v38;
          bool v40 = v35 < v39;
          v34 = v34;
          v35 = v35;
          if (!v40) break;
          int v41 = 4;
          int v42 = v0 + v41;
          int v43 = 1;
          int v44 = v35 + v43;
          v34 = v42;
          v35 = v44;
        }
        int v45 = 1;
        int v46 = v26 + v45;
        v25 = v34;
        v26 = v46;
        continue;
        ;
      }
      v6 = v25;
    }
    case 2:
      {
      int v47 = 0;
      int v48 = v0 + v47;
      v6 = v48;
      break;
    }
    default:
      {
      int v49 = 2;
      v6 = v49;
      break;
    }
  }
  bool v50 = true;
  int v51 = simt_wave_count_bits(v50);
  int v52 = 0;
  int v53 = v52 + v0;
  v1[v53] = v51;
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
  uint v63 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v64 = (int)(v63);
  int v65 = 8;
  int v66 = v65 + v56;
  int v67 = v55[v66];
  uint v68 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v69 = (int)(v68);
  int v70;
  v70 = v69;
  switch (v67) {
    case 0:
      {
      int v71 = 0;
      int v72 = 0;
      int v73;
      int v74;
      v73 = v71;
      v74 = v72;
      while (true) {
        int v75 = 4;
        int v76 = v74 * v75;
        int v77 = v76 + v56;
        int v78 = 12;
        int v79 = v78 + v77;
        int v80 = v55[v79];
        int v81 = 0;
        bool v82 = v80 != v81;
        v73 = v73;
        v74 = v74;
        if (!v82) break;
        int v83 = v73 + v74;
        int v84 = 1;
        int v85 = v74 + v84;
        bool v86 = true;
        v73 = v83;
        v74 = v85;
      }
      v70 = v73;
      break;
    }
    default:
      {
      int v87 = 0;
      int v88 = 0;
      int v89;
      int v90;
      v89 = v87;
      v90 = v88;
      while (true) {
        int v91 = 4;
        int v92 = v90 * v91;
        int v93 = v92 + v56;
        int v94 = 32;
        int v95 = v94 + v93;
        int v96 = v55[v95];
        int v97 = 0;
        bool v98 = v96 != v97;
        v89 = v89;
        v90 = v90;
        if (!v98) break;
        int v99 = 0;
        int v100 = 0;
        int v101;
        int v102;
        v101 = v99;
        v102 = v100;
        while (true) {
          int v103 = 4;
          int v104 = v102 * v103;
          int v105 = v104 + v56;
          int v106 = 52;
          int v107 = v106 + v105;
          int v108 = v55[v107];
          int v109 = 0;
          bool v110 = v108 != v109;
          v101 = v101;
          v102 = v102;
          if (!v110) break;
          int v111 = v101 + v102;
          int v112 = 1;
          int v113 = v102 + v112;
          bool v114 = true;
          v101 = v111;
          v102 = v113;
        }
        int v115 = v89 + v101;
        int v116 = 1;
        int v117 = v90 + v116;
        bool v118 = true;
        v89 = v115;
        v90 = v117;
      }
      v70 = v89;
      break;
    }
    case 1:
      {
      int v119 = 0;
      int v120 = 0;
      int v121;
      int v122;
      v121 = v119;
      v122 = v120;
      while (true) {
        int v123 = 4;
        int v124 = v122 * v123;
        int v125 = v124 + v56;
        int v126 = 72;
        int v127 = v126 + v125;
        int v128 = v55[v127];
        int v129 = 0;
        bool v130 = v128 != v129;
        v121 = v121;
        v122 = v122;
        if (!v130) break;
        int v131 = v121 + v122;
        int v132 = 1;
        int v133 = v122 + v132;
        bool v134 = true;
        v121 = v131;
        v122 = v133;
      }
      v70 = v121;
      break;
    }
    case 2:
      {
      int v135 = 3;
      int v136 = v56 + v135;
      v70 = v136;
      break;
    }
  }
  bool v137 = true;
  int v138 = 16;
  int v139 = v138 + v56;
  bool v140 = true;
  int v141 = simt_wave_count_bits(v140);
  v54[v139] = v141;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 92; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
