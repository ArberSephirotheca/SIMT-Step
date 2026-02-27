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
    bool v13 = true;
    int v14 = simt_wave_count_bits(v13);
    int v15 = 0;
    int v16 = 4;
    int v17 = v7 * v16;
    int v18 = v15 + v17;
    int v19 = v18 + v0;
    v1[v19] = v14;
    int v20 = 1;
    int v21 = v7 + v20;
    v6 = v14;
    v7 = v21;
    break;
    ;
  }
  int v22 = 2;
  int v23 = v3 % v22;
  int v24;
  v24 = v0;
  switch (v23) {
    case 0:
      {
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
        int v35 = 0;
        int v36;
        int v37;
        v36 = v34;
        v37 = v35;
        while (true) {
          int v38 = 4;
          int v39 = v3 % v38;
          int v40 = 1;
          int v41 = v39 + v40;
          bool v42 = v37 < v41;
          v36 = v36;
          v37 = v37;
          if (!v42) break;
          int v43 = 3;
          int v44 = 1;
          int v45 = v37 + v44;
          v36 = v43;
          v37 = v45;
        }
        int v46 = 1;
        int v47 = v28 + v46;
        v27 = v36;
        v28 = v47;
      }
      v24 = v27;
      break;
    }
    default:
      {
      int v48 = 0;
      int v49 = 0;
      int v50;
      int v51;
      v50 = v48;
      v51 = v49;
      while (true) {
        int v52 = 4;
        int v53 = v3 % v52;
        int v54 = 1;
        int v55 = v53 + v54;
        bool v56 = v51 < v55;
        v50 = v50;
        v51 = v51;
        if (!v56) break;
        int v57 = 3;
        int v58 = v3 % v57;
        int v59 = 0;
        int v60;
        v60 = v59;
        switch (v58) {
          default:
            {
            v60 = v0;
            break;
          }
          case 0:
            {
            v60 = v0;
            break;
          }
          case 1:
            {
            int v61 = 3;
            int v62 = v0 + v61;
            v60 = v62;
            break;
          }
        }
        int v63 = 1;
        int v64 = v51 + v63;
        v50 = v60;
        v51 = v64;
        continue;
        ;
      }
      v24 = v50;
      break;
    }
  }
  int v65 = 0;
  bool v66 = v2 != v65;
  int v67 = v66 ? v6 : v24;
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
  uint v80 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v81 = (int)(v80);
  int v82;
  v82 = v81;
  switch (v79) {
    default:
      {
      int v83 = 12;
      int v84 = v83 + v70;
      int v85 = v69[v84];
      int v86 = 0;
      bool v87 = v85 != v86;
      int v88;
      if (v87) {
        int v89 = 16;
        int v90 = v89 + v70;
        int v91 = v69[v90];
        int v92 = 3;
        int v93 = v70 + v92;
        int v94;
        v94 = v93;
        switch (v91) {
          case 0:
            {
            v94 = v70;
            break;
          }
          default:
            {
            v94 = v70;
            break;
          }
        }
        bool v95 = true;
        v88 = v94;
      } else {
        int v96 = 20;
        int v97 = v96 + v70;
        int v98 = v69[v97];
        int v99 = 0;
        bool v100 = v98 != v99;
        int v101;
        if (v100) {
          int v102 = 4;
          v101 = v102;
        } else {
          int v103 = 1;
          int v104 = v70 + v103;
          v101 = v104;
        }
        v88 = v101;
      }
      v82 = v88;
      break;
    }
    case 0:
      {
      int v105 = 24;
      int v106 = v105 + v70;
      int v107 = v69[v106];
      int v108 = 0;
      bool v109 = v107 != v108;
      int v110;
      if (v109) {
        int v111 = 28;
        int v112 = v111 + v70;
        int v113 = v69[v112];
        int v114 = 2;
        int v115;
        v115 = v114;
        switch (v113) {
          default:
            {
            int v116 = 3;
            v115 = v116;
            break;
          }
          case 0:
            {
            int v117 = 0;
            v115 = v117;
            break;
          }
        }
        bool v118 = true;
        v110 = v115;
      } else {
        int v119 = 0;
        int v120 = 0;
        int v121;
        int v122;
        v121 = v119;
        v122 = v120;
        while (true) {
          int v123 = 4;
          int v124 = v122 * v123;
          int v125 = v124 + v70;
          int v126 = 32;
          int v127 = v126 + v125;
          int v128 = v69[v127];
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
        v110 = v121;
      }
      v82 = v110;
      break;
    }
  }
  int v135 = 0;
  int v136 = 0;
  int v137;
  int v138;
  v137 = v135;
  v138 = v136;
  while (true) {
    int v139 = 4;
    int v140 = v138 * v139;
    int v141 = v140 + v70;
    int v142 = 52;
    int v143 = v142 + v141;
    int v144 = v69[v143];
    int v145 = 0;
    bool v146 = v144 != v145;
    v137 = v137;
    v138 = v138;
    if (!v146) break;
    int v147 = v137 + v138;
    int v148 = 1;
    int v149 = v138 + v148;
    bool v150 = true;
    int v151 = 16;
    int v152 = 4;
    int v153 = v138 * v152;
    int v154 = v151 + v153;
    int v155 = v154 + v70;
    bool v156 = true;
    int v157 = simt_wave_count_bits(v156);
    v68[v155] = v157;
    v137 = v147;
    v138 = v149;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 24; ++idx) {
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
