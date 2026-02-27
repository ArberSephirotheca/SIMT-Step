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
      int v16 = 3;
      int v17 = v3 % v16;
      uint v18 = simt_subgroup_id(__simt_tid);
      int v19 = (int)(v18);
      int v20;
      v20 = v19;
      switch (v17) {
        case 0:
          {
          int v21 = 4;
          int v22 = v0 + v21;
          v20 = v22;
          break;
        }
        case 1:
          {
          v20 = v0;
          break;
        }
        default:
          {
          int v23 = 1;
          v20 = v23;
          break;
        }
      }
      bool v24 = true;
      int v25 = simt_wave_count_bits(v24);
      int v26 = 0;
      int v27 = 4;
      int v28 = v10 * v27;
      int v29 = v26 + v28;
      int v30 = v29 + v0;
      v1[v30] = v25;
      int v31 = 1;
      int v32 = v10 + v31;
      v9 = v20;
      v10 = v32;
    }
    v6 = v9;
  } else {
    int v33 = 4;
    int v34 = v3 % v33;
    uint v35 = simt_lane_id(__simt_tid);
    int v36 = (int)(v35);
    int v37;
    v37 = v36;
    switch (v34) {
      case 0:
        {
        int v38 = 0;
        int v39 = 0;
        int v40;
        int v41;
        v40 = v38;
        v41 = v39;
        while (true) {
          int v42 = 4;
          int v43 = v3 % v42;
          int v44 = 1;
          int v45 = v43 + v44;
          bool v46 = v41 < v45;
          v40 = v40;
          v41 = v41;
          if (!v46) break;
          int v47 = 4;
          int v48 = v0 + v47;
          int v49 = 1;
          int v50 = v41 + v49;
          v40 = v48;
          v41 = v50;
          break;
          ;
        }
        v37 = v40;
        break;
      }
      case 1:
        {
        int v51 = 0;
        bool v52 = v2 != v51;
        int v53;
        if (v52) {
          int v54 = 3;
          v53 = v54;
        } else {
          int v55 = 2;
          v53 = v55;
        }
        v37 = v53;
      }
      case 2:
        {
        int v56 = 0;
        int v57 = 0;
        int v58;
        int v59;
        v58 = v56;
        v59 = v57;
        while (true) {
          int v60 = 4;
          int v61 = v3 % v60;
          int v62 = 1;
          int v63 = v61 + v62;
          bool v64 = v59 < v63;
          v58 = v58;
          v59 = v59;
          if (!v64) break;
          int v65 = 2;
          int v66 = 1;
          int v67 = v59 + v66;
          v58 = v65;
          v59 = v67;
        }
        v37 = v58;
      }
      default:
        {
        int v68 = 0;
        bool v69 = v2 != v68;
        int v70;
        if (v69) {
          v70 = v0;
        } else {
          int v71 = 0;
          int v72 = v0 + v71;
          v70 = v72;
        }
        v37 = v70;
        break;
      }
    }
    v6 = v37;
  }
  return;
}

kernel void kernel_main(device int* v73 [[buffer(0)]], device int* v74 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v75 = static_cast<int>(__simt_tid3.x);
  int v76 = 0;
  int v77 = v76 + v75;
  int v78 = v74[v77];
  int v79 = 4;
  int v80 = v79 + v75;
  int v81 = v74[v80];
  helper0(v75, v73, v78, v81, static_cast<int>(__simt_tid3.x));
  int v82 = 0;
  int v83 = 0;
  int v84;
  int v85;
  v84 = v82;
  v85 = v83;
  while (true) {
    int v86 = 4;
    int v87 = v85 * v86;
    int v88 = v87 + v75;
    int v89 = 8;
    int v90 = v89 + v88;
    int v91 = v74[v90];
    int v92 = 0;
    bool v93 = v91 != v92;
    v84 = v84;
    v85 = v85;
    if (!v93) break;
    int v94 = v84 + v85;
    int v95 = 1;
    int v96 = v85 + v95;
    bool v97 = true;
    int v98 = 16;
    int v99 = 4;
    int v100 = v85 * v99;
    int v101 = v98 + v100;
    int v102 = v101 + v75;
    bool v103 = true;
    int v104 = simt_wave_count_bits(v103);
    v73[v102] = v104;
    v84 = v94;
    v85 = v96;
  }
  uint v105 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v106 = (int)(v105);
  uint v107 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v108 = (int)(v107);
  int v109 = 28;
  int v110 = v109 + v75;
  int v111 = v74[v110];
  int v112 = 2;
  int v113 = v75 + v112;
  int v114;
  v114 = v113;
  switch (v111) {
    case 0:
      {
      int v115 = 32;
      int v116 = v115 + v75;
      int v117 = v74[v116];
      int v118 = 0;
      bool v119 = v117 != v118;
      int v120;
      if (v119) {
        int v121 = 36;
        int v122 = v121 + v75;
        int v123 = v74[v122];
        int v124;
        v124 = v75;
        switch (v123) {
          default:
            {
            int v125 = 4;
            int v126 = v75 + v125;
            v124 = v126;
            break;
          }
          case 0:
            {
            v124 = v75;
            break;
          }
          case 1:
            {
            int v127 = 2;
            v124 = v127;
            break;
          }
          case 2:
            {
            int v128 = 1;
            int v129 = v75 + v128;
            v124 = v129;
            break;
          }
        }
        v120 = v124;
      } else {
        int v130 = 40;
        int v131 = v130 + v75;
        int v132 = v74[v131];
        int v133 = 4;
        int v134 = v75 + v133;
        int v135;
        v135 = v134;
        switch (v132) {
          case 0:
            {
            int v136 = 0;
            int v137 = v75 + v136;
            v135 = v137;
          }
          default:
            {
            int v138 = 1;
            int v139 = v75 + v138;
            v135 = v139;
            break;
          }
          case 1:
            {
            int v140 = 3;
            v135 = v140;
            break;
          }
          case 2:
            {
            v135 = v75;
            break;
          }
        }
        bool v141 = true;
        v120 = v135;
      }
      v114 = v120;
      break;
    }
    case 1:
      {
      int v142 = 4;
      int v143 = v75 + v142;
      v114 = v143;
      break;
    }
    default:
      {
      int v144 = 44;
      int v145 = v144 + v75;
      int v146 = v74[v145];
      int v147;
      v147 = v75;
      switch (v146) {
        default:
          {
          int v148 = 48;
          int v149 = v148 + v75;
          int v150 = v74[v149];
          int v151 = 1;
          int v152 = v75 + v151;
          int v153;
          v153 = v152;
          switch (v150) {
            default:
              {
              int v154 = 2;
              v153 = v154;
              break;
            }
            case 0:
              {
              v153 = v75;
              break;
            }
            case 1:
              {
              v153 = v75;
              break;
            }
            case 2:
              {
              v153 = v75;
              break;
            }
          }
          bool v155 = true;
          v147 = v153;
          break;
        }
        case 0:
          {
          int v156 = 52;
          int v157 = v156 + v75;
          int v158 = v74[v157];
          int v159 = 0;
          int v160;
          v160 = v159;
          switch (v158) {
            case 0:
              {
              int v161 = 2;
              v160 = v161;
              break;
            }
            default:
              {
              int v162 = 2;
              v160 = v162;
              break;
            }
          }
          v147 = v160;
          break;
        }
        case 1:
          {
          int v163 = 56;
          int v164 = v163 + v75;
          int v165 = v74[v164];
          int v166 = 0;
          bool v167 = v165 != v166;
          int v168;
          if (v167) {
            v168 = v75;
          } else {
            int v169 = 4;
            int v170 = v75 + v169;
            v168 = v170;
          }
          v147 = v168;
          break;
        }
      }
      v114 = v147;
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 27; ++idx) {
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
