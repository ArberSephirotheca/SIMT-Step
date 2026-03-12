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
  int v4 = 2;
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
        int v17 = 0;
        bool v18 = v2 != v17;
        int v19;
        if (v18) {
          v19 = v0;
        } else {
          int v20 = 3;
          int v21 = v0 + v20;
          v19 = v21;
        }
        int v22 = 1;
        int v23 = v11 + v22;
        v10 = v19;
        v11 = v23;
        break;
        ;
      }
      v7 = v10;
    }
    default:
      {
      int v24 = 3;
      int v25 = v3 % v24;
      int v26;
      v26 = v0;
      switch (v25) {
        case 0:
          {
          int v27 = 3;
          int v28 = v3 % v27;
          int v29;
          v29 = v0;
          switch (v28) {
            case 0:
              {
              int v30 = 2;
              v29 = v30;
              break;
            }
            default:
              {
              v29 = v0;
              break;
            }
            case 1:
              {
              int v31 = 0;
              int v32 = v0 + v31;
              v29 = v32;
              break;
            }
          }
          v26 = v29;
          break;
        }
        case 1:
          {
          int v33 = 0;
          bool v34 = v2 != v33;
          int v35;
          if (v34) {
            int v36 = 2;
            int v37 = v0 + v36;
            v35 = v37;
          } else {
            int v38 = 0;
            v35 = v38;
          }
          v26 = v35;
          break;
        }
        default:
          {
          int v39 = 0;
          bool v40 = v2 != v39;
          int v41;
          if (v40) {
            int v42 = 1;
            int v43 = v0 + v42;
            v41 = v43;
          } else {
            int v44 = 2;
            int v45 = v0 + v44;
            v41 = v45;
          }
          v26 = v41;
          break;
        }
      }
      v7 = v26;
      break;
    }
  }
  bool v46 = true;
  int v47 = simt_wave_count_bits(v46);
  int v48 = 0;
  int v49 = v48 + v0;
  v1[v49] = v47;
  return;
}

kernel void kernel_main(device int* v50 [[buffer(0)]], device int* v51 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v52 = static_cast<int>(__simt_tid3.x);
  int v53 = 0;
  int v54 = v53 + v52;
  int v55 = v51[v54];
  int v56 = 4;
  int v57 = v56 + v52;
  int v58 = v51[v57];
  int v59 = 0;
  bool v60 = v55 != v59;
  if (v60) {
    int v61 = 0;
    int v62 = 0;
    int v63;
    int v64;
    v63 = v61;
    v64 = v62;
    while (true) {
      int v65 = 1;
      bool v66 = v64 < v65;
      v63 = v63;
      v64 = v64;
      if (!v66) break;
      helper0(v52, v50, v55, v58, static_cast<int>(__simt_tid3.x));
      int v67 = 1;
      int v68 = v64 + v67;
      v63 = v63;
      v64 = v68;
    }
  } else {
  }
  int v69 = 1;
  int v70 = 8;
  int v71 = v70 + v52;
  int v72 = v51[v71];
  int v73 = 0;
  int v74;
  v74 = v73;
  switch (v72) {
    case 0:
      {
      int v75 = 12;
      int v76 = v75 + v52;
      int v77 = v51[v76];
      int v78 = 0;
      int v79 = v52 + v78;
      int v80;
      v80 = v79;
      switch (v77) {
        case 0:
          {
          int v81 = 0;
          int v82 = 0;
          int v83;
          int v84;
          v83 = v81;
          v84 = v82;
          while (true) {
            int v85 = 4;
            int v86 = v84 * v85;
            int v87 = v86 + v52;
            int v88 = 16;
            int v89 = v88 + v87;
            int v90 = v51[v89];
            int v91 = 0;
            bool v92 = v90 != v91;
            v83 = v83;
            v84 = v84;
            if (!v92) break;
            int v93 = v83 + v84;
            int v94 = 1;
            int v95 = v84 + v94;
            bool v96 = true;
            v83 = v93;
            v84 = v95;
          }
          v80 = v83;
          break;
        }
        default:
          {
          v80 = v52;
          break;
        }
      }
      v74 = v80;
      break;
    }
    case 1:
      {
      v74 = v52;
      break;
    }
    default:
      {
      int v97 = 0;
      int v98 = 0;
      int v99;
      int v100;
      v99 = v97;
      v100 = v98;
      while (true) {
        int v101 = 4;
        int v102 = v100 * v101;
        int v103 = v102 + v52;
        int v104 = 36;
        int v105 = v104 + v103;
        int v106 = v51[v105];
        int v107 = 0;
        bool v108 = v106 != v107;
        v99 = v99;
        v100 = v100;
        if (!v108) break;
        int v109 = 56;
        int v110 = v109 + v52;
        int v111 = v51[v110];
        int v112 = 0;
        bool v113 = v111 != v112;
        int v114;
        if (v113) {
          int v115 = 4;
          int v116 = v52 + v115;
          v114 = v116;
        } else {
          v114 = v52;
        }
        int v117 = v99 + v114;
        int v118 = 1;
        int v119 = v100 + v118;
        bool v120 = true;
        v99 = v117;
        v100 = v119;
      }
      v74 = v99;
      break;
    }
    case 2:
      {
      int v121 = 60;
      int v122 = v121 + v52;
      int v123 = v51[v122];
      int v124 = 4;
      int v125;
      v125 = v124;
      switch (v123) {
        case 0:
          {
          int v126 = 0;
          int v127 = 0;
          int v128;
          int v129;
          v128 = v126;
          v129 = v127;
          while (true) {
            int v130 = 4;
            int v131 = v129 * v130;
            int v132 = v131 + v52;
            int v133 = 64;
            int v134 = v133 + v132;
            int v135 = v51[v134];
            int v136 = 0;
            bool v137 = v135 != v136;
            v128 = v128;
            v129 = v129;
            if (!v137) break;
            int v138 = v128 + v129;
            int v139 = 1;
            int v140 = v129 + v139;
            bool v141 = true;
            v128 = v138;
            v129 = v140;
            continue;
            ;
          }
          v125 = v128;
          break;
        }
        case 1:
          {
          int v142 = 84;
          int v143 = v142 + v52;
          int v144 = v51[v143];
          int v145 = 0;
          bool v146 = v144 != v145;
          int v147;
          if (v146) {
            int v148 = 4;
            int v149 = v52 + v148;
            v147 = v149;
          } else {
            int v150 = 2;
            int v151 = v52 + v150;
            v147 = v151;
          }
          v125 = v147;
          break;
        }
        case 2:
          {
          int v152 = 0;
          int v153 = 0;
          int v154;
          int v155;
          v154 = v152;
          v155 = v153;
          while (true) {
            int v156 = 4;
            int v157 = v155 * v156;
            int v158 = v157 + v52;
            int v159 = 88;
            int v160 = v159 + v158;
            int v161 = v51[v160];
            int v162 = 0;
            bool v163 = v161 != v162;
            v154 = v154;
            v155 = v155;
            if (!v163) break;
            int v164 = v154 + v155;
            int v165 = 1;
            int v166 = v155 + v165;
            bool v167 = true;
            v154 = v164;
            v155 = v166;
          }
          v125 = v154;
          break;
        }
        default:
          {
          v125 = v52;
          break;
        }
      }
      v74 = v125;
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
    static int32_t expected0[] = {static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 1; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 108; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
