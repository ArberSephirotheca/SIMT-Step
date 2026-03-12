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
    bool v7 = true;
    int v8 = simt_wave_count_bits(v7);
    int v9 = 0;
    int v10 = v9 + v0;
    v1[v10] = v8;
    v6 = v8;
  } else {
    bool v11 = true;
    int v12 = simt_wave_count_bits(v11);
    int v13 = 16;
    int v14 = v13 + v0;
    v1[v14] = v12;
    v6 = v12;
  }
  int v15 = 0;
  int v16 = 0;
  int v17;
  int v18;
  v17 = v15;
  v18 = v16;
  while (true) {
    int v19 = 4;
    int v20 = v3 % v19;
    int v21 = 1;
    int v22 = v20 + v21;
    bool v23 = v18 < v22;
    v17 = v17;
    v18 = v18;
    if (!v23) break;
    bool v24 = true;
    int v25 = simt_wave_count_bits(v24);
    int v26 = 32;
    int v27 = 4;
    int v28 = v18 * v27;
    int v29 = v26 + v28;
    int v30 = v29 + v0;
    v1[v30] = v25;
    int v31 = 1;
    int v32 = v18 + v31;
    v17 = v25;
    v18 = v32;
  }
  int v33 = 0;
  bool v34 = v2 != v33;
  int v35 = v34 ? v6 : v17;
  int v36 = 2;
  int v37 = v3 % v36;
  uint v38 = simt_subgroup_id(__simt_tid);
  int v39 = (int)(v38);
  int v40;
  v40 = v39;
  switch (v37) {
    case 0:
      {
      int v41 = 2;
      int v42 = v3 % v41;
      int v43 = 0;
      int v44;
      v44 = v43;
      switch (v42) {
        default:
          {
          int v45 = 4;
          int v46 = v3 % v45;
          int v47 = 1;
          int v48 = v0 + v47;
          int v49;
          v49 = v48;
          switch (v46) {
            case 0:
              {
              v49 = v0;
              break;
            }
            case 1:
              {
              int v50 = 1;
              v49 = v50;
              break;
            }
            case 2:
              {
              v49 = v0;
              break;
            }
            default:
              {
              int v51 = 1;
              int v52 = v0 + v51;
              v49 = v52;
              break;
            }
          }
          v44 = v49;
          break;
        }
        case 0:
          {
          int v53 = 3;
          v44 = v53;
          break;
        }
        case 1:
          {
          int v54 = 0;
          bool v55 = v2 != v54;
          int v56;
          if (v55) {
            int v57 = 0;
            v56 = v57;
          } else {
            int v58 = 1;
            v56 = v58;
          }
          v44 = v56;
          break;
        }
      }
      int v59 = 2;
      int v60 = v0 + v59;
      v40 = v44;
      break;
    }
    case 1:
      {
      v40 = v0;
      break;
    }
    default:
      {
      int v61 = 0;
      bool v62 = v2 != v61;
      int v63;
      if (v62) {
        int v64 = 0;
        bool v65 = v2 != v64;
        int v66;
        if (v65) {
          int v67 = 2;
          int v68 = v0 + v67;
          v66 = v68;
        } else {
          v66 = v0;
        }
        v63 = v66;
      } else {
        int v69 = 4;
        int v70 = v3 % v69;
        int v71;
        v71 = v0;
        switch (v70) {
          default:
            {
            int v72 = 0;
            v71 = v72;
            break;
          }
          case 0:
            {
            v71 = v0;
            break;
          }
          case 1:
            {
            int v73 = 2;
            v71 = v73;
            break;
          }
          case 2:
            {
            int v74 = 0;
            int v75 = v0 + v74;
            v71 = v75;
            break;
          }
        }
        int v76 = 3;
        int v77 = v0 + v76;
        v63 = v71;
      }
      v40 = v63;
      break;
    }
  }
  int v78 = 0;
  bool v79 = v2 != v78;
  int v80 = v79 ? v35 : v40;
  return;
}

kernel void kernel_main(device int* v81 [[buffer(0)]], device int* v82 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v83 = static_cast<int>(__simt_tid3.x);
  int v84 = 0;
  int v85 = v84 + v83;
  int v86 = v82[v85];
  int v87 = 4;
  int v88 = v87 + v83;
  int v89 = v82[v88];
  helper0(v83, v81, v86, v89, static_cast<int>(__simt_tid3.x));
  uint v90 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v91 = (int)(v90);
  int v92 = 2;
  int v93 = v83 + v92;
  int v94 = 8;
  int v95 = v94 + v83;
  int v96 = v82[v95];
  int v97;
  v97 = v83;
  switch (v96) {
    default:
      {
      v97 = v83;
      break;
    }
    case 0:
      {
      int v98 = 0;
      int v99 = 0;
      int v100;
      int v101;
      v100 = v98;
      v101 = v99;
      while (true) {
        int v102 = 4;
        int v103 = v101 * v102;
        int v104 = v103 + v83;
        int v105 = 12;
        int v106 = v105 + v104;
        int v107 = v82[v106];
        int v108 = 0;
        bool v109 = v107 != v108;
        v100 = v100;
        v101 = v101;
        if (!v109) break;
        int v110 = 32;
        int v111 = v110 + v83;
        int v112 = v82[v111];
        int v113 = 4;
        int v114;
        v114 = v113;
        switch (v112) {
          default:
            {
            int v115 = 3;
            int v116 = v83 + v115;
            v114 = v116;
            break;
          }
          case 0:
            {
            v114 = v83;
            break;
          }
          case 1:
            {
            v114 = v83;
            break;
          }
          case 2:
            {
            v114 = v83;
            break;
          }
        }
        int v117 = v100 + v114;
        int v118 = 1;
        int v119 = v101 + v118;
        bool v120 = true;
        v100 = v117;
        v101 = v119;
      }
      v97 = v100;
      break;
    }
    case 1:
      {
      int v121 = 36;
      int v122 = v121 + v83;
      int v123 = v82[v122];
      int v124 = 0;
      bool v125 = v123 != v124;
      int v126;
      if (v125) {
        int v127 = 40;
        int v128 = v127 + v83;
        int v129 = v82[v128];
        int v130 = 0;
        bool v131 = v129 != v130;
        int v132;
        if (v131) {
          v132 = v83;
        } else {
          int v133 = 4;
          int v134 = v83 + v133;
          v132 = v134;
        }
        v126 = v132;
      } else {
        int v135 = 44;
        int v136 = v135 + v83;
        int v137 = v82[v136];
        int v138;
        v138 = v83;
        switch (v137) {
          case 0:
            {
            int v139 = 1;
            int v140 = v83 + v139;
            v138 = v140;
          }
          case 1:
            {
            int v141 = 3;
            int v142 = v83 + v141;
            v138 = v142;
          }
          case 2:
            {
            v138 = v83;
            break;
          }
          default:
            {
            int v143 = 1;
            v138 = v143;
            break;
          }
        }
        v126 = v138;
      }
      v97 = v126;
      break;
    }
    case 2:
      {
      int v144 = 48;
      int v145 = v144 + v83;
      int v146 = v82[v145];
      int v147;
      v147 = v83;
      switch (v146) {
        case 0:
          {
          int v148 = 52;
          int v149 = v148 + v83;
          int v150 = v82[v149];
          int v151 = 4;
          int v152;
          v152 = v151;
          switch (v150) {
            default:
              {
              v152 = v83;
              break;
            }
            case 0:
              {
              v152 = v83;
              break;
            }
          }
          v147 = v152;
          break;
        }
        default:
          {
          int v153 = 56;
          int v154 = v153 + v83;
          int v155 = v82[v154];
          int v156 = 4;
          int v157 = v83 + v156;
          int v158;
          v158 = v157;
          switch (v155) {
            case 0:
              {
              int v159 = 0;
              int v160 = v83 + v159;
              v158 = v160;
              break;
            }
            default:
              {
              int v161 = 4;
              int v162 = v83 + v161;
              v158 = v162;
              break;
            }
          }
          v147 = v158;
          break;
        }
        case 1:
          {
          int v163 = 4;
          int v164 = v83 + v163;
          v147 = v164;
          break;
        }
      }
      v97 = v147;
      break;
    }
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
    static int32_t expected0[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 47; ++idx) {
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
