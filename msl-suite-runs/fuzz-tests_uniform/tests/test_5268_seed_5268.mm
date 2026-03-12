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
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 3;
      int v10;
      v10 = v9;
      switch (v3) {
        default:
          {
          int v11 = 2;
          int v12 = v3 % v11;
          int v13 = 0;
          int v14;
          v14 = v13;
          switch (v12) {
            case 0:
              {
              int v15 = 1;
              v14 = v15;
            }
            case 1:
              {
              int v16 = 1;
              int v17 = v0 + v16;
              v14 = v17;
            }
            default:
              {
              v14 = v0;
              break;
            }
          }
          int v18 = 3;
          int v19 = v0 + v18;
          v10 = v14;
          break;
        }
        case 0:
          {
          int v20 = 1;
          v10 = v20;
          break;
        }
      }
      int v21 = 2;
      v8 = v10;
      break;
    }
    case 0:
      {
      int v22 = 3;
      int v23 = v3 % v22;
      int v24;
      v24 = v0;
      switch (v23) {
        default:
          {
          int v25 = 0;
          v24 = v25;
          break;
        }
        case 0:
          {
          int v26 = 0;
          bool v27 = v2 != v26;
          int v28;
          if (v27) {
            int v29 = 4;
            v28 = v29;
          } else {
            int v30 = 1;
            int v31 = v0 + v30;
            v28 = v31;
          }
          v24 = v28;
        }
        case 1:
          {
          int v32 = 1;
          int v33;
          v33 = v32;
          switch (v3) {
            default:
              {
              int v34 = 3;
              int v35 = v0 + v34;
              v33 = v35;
            }
            case 0:
              {
              int v36 = 4;
              v33 = v36;
              break;
            }
          }
          int v37 = 2;
          v24 = v33;
          break;
        }
      }
      int v38 = 2;
      v8 = v24;
      break;
    }
    case 1:
      {
      int v39 = 0;
      int v40 = 0;
      int v41;
      int v42;
      v41 = v39;
      v42 = v40;
      while (true) {
        int v43 = 4;
        int v44 = v3 % v43;
        int v45 = 1;
        int v46 = v44 + v45;
        bool v47 = v42 < v46;
        v41 = v41;
        v42 = v42;
        if (!v47) break;
        int v48 = 2;
        int v49 = v3 % v48;
        int v50 = 2;
        int v51 = v0 + v50;
        int v52;
        v52 = v51;
        switch (v49) {
          case 0:
            {
            int v53 = 1;
            int v54 = v0 + v53;
            v52 = v54;
            break;
          }
          default:
            {
            int v55 = 3;
            v52 = v55;
            break;
          }
        }
        int v56 = 3;
        int v57 = v0 + v56;
        int v58 = 1;
        int v59 = v42 + v58;
        v41 = v52;
        v42 = v59;
      }
      int v60 = 2;
      v8 = v41;
      break;
    }
  }
  bool v61 = true;
  int v62 = simt_wave_count_bits(v61);
  int v63 = 0;
  int v64 = v63 + v0;
  v1[v64] = v62;
  int v65 = 0;
  bool v66 = v2 != v65;
  int v67 = v66 ? v0 : v8;
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
  uint v77 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v78 = (int)(v77);
  int v79 = 3;
  int v80 = v70 + v79;
  int v81 = 8;
  int v82 = v81 + v70;
  int v83 = v69[v82];
  int v84 = 1;
  int v85 = v70 + v84;
  int v86;
  v86 = v85;
  switch (v83) {
    default:
      {
      int v87 = 12;
      int v88 = v87 + v70;
      int v89 = v69[v88];
      int v90 = 0;
      bool v91 = v89 != v90;
      int v92;
      if (v91) {
        int v93 = 3;
        int v94 = v70 + v93;
        v92 = v94;
      } else {
        int v95 = 16;
        int v96 = v95 + v70;
        int v97 = v69[v96];
        int v98 = 0;
        int v99;
        v99 = v98;
        switch (v97) {
          case 0:
            {
            v99 = v70;
            break;
          }
          case 1:
            {
            v99 = v70;
            break;
          }
          case 2:
            {
            int v100 = 3;
            int v101 = v70 + v100;
            v99 = v101;
            break;
          }
          default:
            {
            int v102 = 1;
            int v103 = v70 + v102;
            v99 = v103;
            break;
          }
        }
        bool v104 = true;
        v92 = v99;
      }
      v86 = v92;
      break;
    }
    case 0:
      {
      v86 = v70;
      break;
    }
  }
  bool v105 = true;
  int v106 = 16;
  int v107 = v106 + v70;
  bool v108 = true;
  int v109 = simt_wave_count_bits(v108);
  v68[v107] = v109;
  int v110 = 0;
  int v111 = 0;
  int v112;
  int v113;
  v112 = v110;
  v113 = v111;
  while (true) {
    int v114 = 4;
    int v115 = v113 * v114;
    int v116 = v115 + v70;
    int v117 = 20;
    int v118 = v117 + v116;
    int v119 = v69[v118];
    int v120 = 0;
    bool v121 = v119 != v120;
    v112 = v112;
    v113 = v113;
    if (!v121) break;
    int v122 = 40;
    int v123 = v122 + v70;
    int v124 = v69[v123];
    uint v125 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v126 = (int)(v125);
    int v127;
    v127 = v126;
    switch (v124) {
      case 0:
        {
        int v128 = 0;
        int v129 = 0;
        int v130;
        int v131;
        v130 = v128;
        v131 = v129;
        while (true) {
          int v132 = 4;
          int v133 = v131 * v132;
          int v134 = v133 + v70;
          int v135 = 44;
          int v136 = v135 + v134;
          int v137 = v69[v136];
          int v138 = 0;
          bool v139 = v137 != v138;
          v130 = v130;
          v131 = v131;
          if (!v139) break;
          int v140 = v130 + v131;
          int v141 = 1;
          int v142 = v131 + v141;
          v130 = v140;
          v131 = v142;
        }
        bool v143 = true;
        v127 = v130;
        break;
      }
      default:
        {
        int v144 = 64;
        int v145 = v144 + v70;
        int v146 = v69[v145];
        int v147 = 3;
        int v148;
        v148 = v147;
        switch (v146) {
          case 0:
            {
            v148 = v70;
            break;
          }
          default:
            {
            int v149 = 2;
            v148 = v149;
            break;
          }
        }
        bool v150 = true;
        v127 = v148;
        break;
      }
    }
    bool v151 = true;
    int v152 = v112 + v127;
    int v153 = 1;
    int v154 = v113 + v153;
    v112 = v152;
    v113 = v154;
    break;
    ;
  }
  bool v155 = true;
  int v156 = 32;
  int v157 = v156 + v70;
  bool v158 = true;
  int v159 = simt_wave_count_bits(v158);
  v68[v157] = v159;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
