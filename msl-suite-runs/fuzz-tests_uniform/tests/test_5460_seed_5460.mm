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
      }
      int v24 = 0;
      v7 = v10;
    }
    default:
      {
      int v25 = 0;
      bool v26 = v2 != v25;
      int v27;
      if (v26) {
        int v28 = 4;
        int v29 = v3 % v28;
        int v30 = 2;
        int v31 = v0 + v30;
        int v32;
        v32 = v31;
        switch (v29) {
          default:
            {
            int v33 = 3;
            int v34 = v0 + v33;
            v32 = v34;
          }
          case 0:
            {
            int v35 = 2;
            v32 = v35;
          }
          case 1:
            {
            int v36 = 4;
            v32 = v36;
            break;
          }
          case 2:
            {
            int v37 = 4;
            int v38 = v0 + v37;
            v32 = v38;
            break;
          }
        }
        v27 = v32;
      } else {
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
          int v48 = 1;
          int v49 = v0 + v48;
          int v50 = 1;
          int v51 = v42 + v50;
          v41 = v49;
          v42 = v51;
        }
        int v52 = 4;
        int v53 = v0 + v52;
        v27 = v41;
      }
      int v54 = 1;
      int v55 = v0 + v54;
      v7 = v27;
    }
    case 1:
      {
      v7 = v0;
    }
    case 2:
      {
      int v56 = 2;
      int v57 = v3 % v56;
      int v58 = 4;
      int v59;
      v59 = v58;
      switch (v57) {
        default:
          {
          int v60 = 2;
          int v61;
          v61 = v60;
          switch (v3) {
            case 0:
              {
              v61 = v0;
            }
            default:
              {
              int v62 = 1;
              int v63 = v0 + v62;
              v61 = v63;
              break;
            }
          }
          int v64 = 4;
          int v65 = v0 + v64;
          v59 = v61;
          break;
        }
        case 0:
          {
          int v66 = 3;
          int v67 = v3 % v66;
          int v68 = 1;
          int v69;
          v69 = v68;
          switch (v67) {
            case 0:
              {
              v69 = v0;
              break;
            }
            default:
              {
              v69 = v0;
              break;
            }
            case 1:
              {
              v69 = v0;
              break;
            }
            case 2:
              {
              v69 = v0;
              break;
            }
          }
          int v70 = 0;
          v59 = v69;
        }
        case 1:
          {
          int v71 = 0;
          int v72 = 0;
          int v73;
          int v74;
          v73 = v71;
          v74 = v72;
          while (true) {
            int v75 = 4;
            int v76 = v3 % v75;
            int v77 = 1;
            int v78 = v76 + v77;
            bool v79 = v74 < v78;
            v73 = v73;
            v74 = v74;
            if (!v79) break;
            int v80 = 0;
            int v81 = v0 + v80;
            int v82 = 1;
            int v83 = v74 + v82;
            v73 = v81;
            v74 = v83;
          }
          int v84 = 4;
          int v85 = v0 + v84;
          v59 = v73;
          break;
        }
      }
      v7 = v59;
      break;
    }
  }
  bool v86 = true;
  int v87 = simt_wave_count_bits(v86);
  int v88 = 0;
  int v89 = v88 + v0;
  v1[v89] = v87;
  return;
}

kernel void kernel_main(device int* v90 [[buffer(0)]], device int* v91 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v92 = static_cast<int>(__simt_tid3.x);
  int v93 = 0;
  int v94 = v93 + v92;
  int v95 = v91[v94];
  int v96 = 4;
  int v97 = v96 + v92;
  int v98 = v91[v97];
  helper0(v92, v90, v95, v98, static_cast<int>(__simt_tid3.x));
  uint v99 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v100 = (int)(v99);
  int v101 = 1;
  int v102 = v92 + v101;
  int v103 = 8;
  int v104 = v103 + v92;
  int v105 = v91[v104];
  uint v106 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v107 = (int)(v106);
  int v108;
  v108 = v107;
  switch (v105) {
    case 0:
      {
      int v109 = 12;
      int v110 = v109 + v92;
      int v111 = v91[v110];
      int v112 = 0;
      bool v113 = v111 != v112;
      int v114;
      if (v113) {
        int v115 = 0;
        int v116 = v92 + v115;
        v114 = v116;
      } else {
        v114 = v92;
      }
      v108 = v114;
      break;
    }
    case 1:
      {
      int v117 = 3;
      v108 = v117;
      break;
    }
    case 2:
      {
      int v118 = 3;
      v108 = v118;
      break;
    }
    default:
      {
      v108 = v92;
      break;
    }
  }
  bool v119 = true;
  int v120 = 16;
  int v121 = v120 + v92;
  bool v122 = true;
  int v123 = simt_wave_count_bits(v122);
  v90[v121] = v123;
  int v124 = 16;
  int v125 = v124 + v92;
  int v126 = v91[v125];
  int v127 = 2;
  int v128 = v92 + v127;
  int v129;
  v129 = v128;
  switch (v126) {
    case 0:
      {
      v129 = v92;
      break;
    }
    default:
      {
      int v130 = 20;
      int v131 = v130 + v92;
      int v132 = v91[v131];
      int v133 = 0;
      bool v134 = v132 != v133;
      int v135;
      if (v134) {
        int v136 = 24;
        int v137 = v136 + v92;
        int v138 = v91[v137];
        int v139 = 2;
        int v140;
        v140 = v139;
        switch (v138) {
          case 0:
            {
            v140 = v92;
          }
          default:
            {
            int v141 = 4;
            int v142 = v92 + v141;
            v140 = v142;
            break;
          }
        }
        bool v143 = true;
        v135 = v140;
      } else {
        int v144 = 28;
        int v145 = v144 + v92;
        int v146 = v91[v145];
        int v147 = 0;
        bool v148 = v146 != v147;
        int v149;
        if (v148) {
          int v150 = 0;
          int v151 = v92 + v150;
          v149 = v151;
        } else {
          int v152 = 1;
          int v153 = v92 + v152;
          v149 = v153;
        }
        v135 = v149;
      }
      v129 = v135;
      break;
    }
    case 1:
      {
      int v154 = 32;
      int v155 = v154 + v92;
      int v156 = v91[v155];
      int v157 = 0;
      bool v158 = v156 != v157;
      int v159;
      if (v158) {
        int v160 = 36;
        int v161 = v160 + v92;
        int v162 = v91[v161];
        int v163 = 0;
        bool v164 = v162 != v163;
        int v165;
        if (v164) {
          int v166 = 2;
          int v167 = v92 + v166;
          v165 = v167;
        } else {
          v165 = v92;
        }
        v159 = v165;
      } else {
        int v168 = 3;
        v159 = v168;
      }
      v129 = v159;
      break;
    }
  }
  bool v169 = true;
  int v170 = 32;
  int v171 = v170 + v92;
  bool v172 = true;
  int v173 = simt_wave_count_bits(v172);
  v90[v171] = v173;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 40; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
