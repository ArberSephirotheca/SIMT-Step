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
  int v4;
  v4 = v0;
  switch (v3) {
    case 0:
      {
      int v5 = 0;
      v4 = v5;
      break;
    }
    default:
      {
      int v6 = 0;
      int v7 = 0;
      int v8;
      int v9;
      v8 = v6;
      v9 = v7;
      while (true) {
        int v10 = 4;
        int v11 = v3 % v10;
        int v12 = 1;
        int v13 = v11 + v12;
        bool v14 = v9 < v13;
        v8 = v8;
        v9 = v9;
        if (!v14) break;
        int v15 = 2;
        int v16 = v3 % v15;
        int v17 = 0;
        int v18 = v0 + v17;
        int v19;
        v19 = v18;
        switch (v16) {
          default:
            {
            int v20 = 0;
            int v21 = v0 + v20;
            v19 = v21;
          }
          case 0:
            {
            v19 = v0;
          }
          case 1:
            {
            v19 = v0;
            break;
          }
        }
        int v22 = 1;
        int v23 = v9 + v22;
        v8 = v19;
        v9 = v23;
        break;
        ;
      }
      int v24 = 2;
      v4 = v8;
      break;
    }
  }
  bool v25 = true;
  int v26 = simt_wave_count_bits(v25);
  int v27 = 0;
  int v28 = v27 + v0;
  v1[v28] = v26;
  return;
}

kernel void kernel_main(device int* v29 [[buffer(0)]], device int* v30 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v31 = static_cast<int>(__simt_tid3.x);
  int v32 = 0;
  int v33 = v32 + v31;
  int v34 = v30[v33];
  int v35 = 4;
  int v36 = v35 + v31;
  int v37 = v30[v36];
  helper0(v31, v29, v34, v37, static_cast<int>(__simt_tid3.x));
  int v38 = 0;
  int v39 = 0;
  int v40;
  int v41;
  v40 = v38;
  v41 = v39;
  while (true) {
    int v42 = 4;
    int v43 = v41 * v42;
    int v44 = v43 + v31;
    int v45 = 8;
    int v46 = v45 + v44;
    int v47 = v30[v46];
    int v48 = 0;
    bool v49 = v47 != v48;
    v40 = v40;
    v41 = v41;
    if (!v49) break;
    int v50 = 0;
    int v51 = 0;
    int v52;
    int v53;
    v52 = v50;
    v53 = v51;
    while (true) {
      int v54 = 4;
      int v55 = v53 * v54;
      int v56 = v55 + v31;
      int v57 = 28;
      int v58 = v57 + v56;
      int v59 = v30[v58];
      int v60 = 0;
      bool v61 = v59 != v60;
      v52 = v52;
      v53 = v53;
      if (!v61) break;
      int v62 = 48;
      int v63 = v62 + v31;
      int v64 = v30[v63];
      uint v65 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v66 = (int)(v65);
      int v67;
      v67 = v66;
      switch (v64) {
        case 0:
          {
          int v68 = 0;
          int v69 = v31 + v68;
          v67 = v69;
          break;
        }
        default:
          {
          v67 = v31;
        }
        case 1:
          {
          int v70 = 3;
          int v71 = v31 + v70;
          v67 = v71;
          break;
        }
      }
      bool v72 = true;
      int v73 = v52 + v67;
      int v74 = 1;
      int v75 = v53 + v74;
      v52 = v73;
      v53 = v75;
    }
    bool v76 = true;
    int v77 = v40 + v52;
    int v78 = 1;
    int v79 = v41 + v78;
    v40 = v77;
    v41 = v79;
  }
  bool v80 = true;
  int v81 = 16;
  int v82 = v81 + v31;
  bool v83 = true;
  int v84 = simt_wave_count_bits(v83);
  v29[v82] = v84;
  int v85 = 52;
  int v86 = v85 + v31;
  int v87 = v30[v86];
  int v88 = 2;
  int v89;
  v89 = v88;
  switch (v87) {
    case 0:
      {
      int v90 = 56;
      int v91 = v90 + v31;
      int v92 = v30[v91];
      int v93 = 0;
      bool v94 = v92 != v93;
      int v95;
      if (v94) {
        int v96 = 60;
        int v97 = v96 + v31;
        int v98 = v30[v97];
        int v99 = 0;
        int v100;
        v100 = v99;
        switch (v98) {
          case 0:
            {
            int v101 = 3;
            v100 = v101;
            break;
          }
          default:
            {
            v100 = v31;
          }
          case 1:
            {
            int v102 = 2;
            v100 = v102;
            break;
          }
          case 2:
            {
            v100 = v31;
            break;
          }
        }
        bool v103 = true;
        v95 = v100;
      } else {
        int v104 = 64;
        int v105 = v104 + v31;
        int v106 = v30[v105];
        int v107 = 0;
        int v108;
        v108 = v107;
        switch (v106) {
          default:
            {
            int v109 = 0;
            v108 = v109;
            break;
          }
          case 0:
            {
            int v110 = 2;
            v108 = v110;
            break;
          }
        }
        bool v111 = true;
        v95 = v108;
      }
      v89 = v95;
      break;
    }
    case 1:
      {
      int v112 = 68;
      int v113 = v112 + v31;
      int v114 = v30[v113];
      int v115;
      v115 = v31;
      switch (v114) {
        default:
          {
          int v116 = 4;
          v115 = v116;
          break;
        }
        case 0:
          {
          int v117 = 72;
          int v118 = v117 + v31;
          int v119 = v30[v118];
          int v120 = 0;
          bool v121 = v119 != v120;
          int v122;
          if (v121) {
            int v123 = 3;
            v122 = v123;
          } else {
            v122 = v31;
          }
          v115 = v122;
          break;
        }
      }
      bool v124 = true;
      v89 = v115;
    }
    default:
      {
      int v125 = 0;
      int v126 = 0;
      int v127;
      int v128;
      v127 = v125;
      v128 = v126;
      while (true) {
        int v129 = 4;
        int v130 = v128 * v129;
        int v131 = v130 + v31;
        int v132 = 76;
        int v133 = v132 + v131;
        int v134 = v30[v133];
        int v135 = 0;
        bool v136 = v134 != v135;
        v127 = v127;
        v128 = v128;
        if (!v136) break;
        int v137 = 96;
        int v138 = v137 + v31;
        int v139 = v30[v138];
        int v140 = 0;
        bool v141 = v139 != v140;
        int v142;
        if (v141) {
          int v143 = 1;
          v142 = v143;
        } else {
          v142 = v31;
        }
        int v144 = v127 + v142;
        int v145 = 1;
        int v146 = v128 + v145;
        v127 = v144;
        v128 = v146;
      }
      bool v147 = true;
      v89 = v127;
      break;
    }
  }
  bool v148 = true;
  int v149 = 32;
  int v150 = v149 + v31;
  bool v151 = true;
  int v152 = simt_wave_count_bits(v151);
  v29[v150] = v152;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 100; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
