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
    int v13 = 0;
    int v14 = 0;
    int v15;
    int v16;
    v15 = v13;
    v16 = v14;
    while (true) {
      int v17 = 4;
      int v18 = v3 % v17;
      int v19 = 1;
      int v20 = v18 + v19;
      bool v21 = v16 < v20;
      v15 = v15;
      v16 = v16;
      if (!v21) break;
      bool v22 = true;
      int v23 = simt_wave_count_bits(v22);
      int v24 = 0;
      int v25 = 4;
      int v26 = v16 * v25;
      int v27 = v24 + v26;
      int v28 = v27 + v0;
      v1[v28] = v23;
      int v29 = 1;
      int v30 = v16 + v29;
      v15 = v23;
      v16 = v30;
      continue;
      ;
    }
    int v31 = 1;
    int v32 = v7 + v31;
    v6 = v15;
    v7 = v32;
    break;
    ;
  }
  int v33 = 2;
  int v34 = v3 % v33;
  int v35 = 4;
  int v36 = v0 + v35;
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
        int v47;
        v47 = v0;
        switch (v3) {
          default:
            {
            int v48 = 0;
            int v49 = v0 + v48;
            v47 = v49;
          }
          case 0:
            {
            int v50 = 1;
            v47 = v50;
            break;
          }
        }
        int v51 = 1;
        int v52 = v41 + v51;
        v40 = v47;
        v41 = v52;
      }
      v37 = v40;
      break;
    }
    case 1:
      {
      v37 = v0;
      break;
    }
    default:
      {
      int v53 = 0;
      int v54 = 0;
      int v55;
      int v56;
      v55 = v53;
      v56 = v54;
      while (true) {
        int v57 = 4;
        int v58 = v3 % v57;
        int v59 = 1;
        int v60 = v58 + v59;
        bool v61 = v56 < v60;
        v55 = v55;
        v56 = v56;
        if (!v61) break;
        int v62 = 0;
        int v63 = 0;
        int v64;
        int v65;
        v64 = v62;
        v65 = v63;
        while (true) {
          int v66 = 4;
          int v67 = v3 % v66;
          int v68 = 1;
          int v69 = v67 + v68;
          bool v70 = v65 < v69;
          v64 = v64;
          v65 = v65;
          if (!v70) break;
          int v71 = 2;
          int v72 = v0 + v71;
          int v73 = 1;
          int v74 = v65 + v73;
          v64 = v72;
          v65 = v74;
          continue;
          ;
        }
        int v75 = 1;
        int v76 = v56 + v75;
        v55 = v64;
        v56 = v76;
      }
      v37 = v55;
      break;
    }
  }
  int v77 = 0;
  bool v78 = v2 != v77;
  int v79 = v78 ? v6 : v37;
  return;
}

kernel void kernel_main(device int* v80 [[buffer(0)]], device int* v81 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v82 = static_cast<int>(__simt_tid3.x);
  int v83 = 0;
  int v84 = v83 + v82;
  int v85 = v81[v84];
  int v86 = 4;
  int v87 = v86 + v82;
  int v88 = v81[v87];
  int v89 = 0;
  bool v90 = v85 != v89;
  if (v90) {
    int v91 = 8;
    int v92 = v91 + v82;
    int v93 = v81[v92];
    int v94 = 0;
    bool v95 = v93 != v94;
    if (v95) {
    } else {
      helper0(v82, v80, v85, v88, static_cast<int>(__simt_tid3.x));
    }
  } else {
  }
  int v96 = 12;
  int v97 = v96 + v82;
  int v98 = v81[v97];
  int v99;
  v99 = v82;
  switch (v98) {
    case 0:
      {
      int v100 = 16;
      int v101 = v100 + v82;
      int v102 = v81[v101];
      int v103 = 0;
      bool v104 = v102 != v103;
      int v105;
      if (v104) {
        int v106 = 20;
        int v107 = v106 + v82;
        int v108 = v81[v107];
        int v109 = 1;
        int v110 = v82 + v109;
        int v111;
        v111 = v110;
        switch (v108) {
          case 0:
            {
            v111 = v82;
            break;
          }
          case 1:
            {
            v111 = v82;
            break;
          }
          default:
            {
            int v112 = 3;
            int v113 = v82 + v112;
            v111 = v113;
            break;
          }
        }
        v105 = v111;
      } else {
        int v114 = 24;
        int v115 = v114 + v82;
        int v116 = v81[v115];
        int v117 = 0;
        bool v118 = v116 != v117;
        int v119;
        if (v118) {
          v119 = v82;
        } else {
          v119 = v82;
        }
        v105 = v119;
      }
      v99 = v105;
      break;
    }
    case 1:
      {
      int v120 = 28;
      int v121 = v120 + v82;
      int v122 = v81[v121];
      int v123 = 0;
      int v124 = v82 + v123;
      int v125;
      v125 = v124;
      switch (v122) {
        case 0:
          {
          int v126 = 2;
          int v127 = v82 + v126;
          v125 = v127;
          break;
        }
        case 1:
          {
          v125 = v82;
          break;
        }
        case 2:
          {
          int v128 = 32;
          int v129 = v128 + v82;
          int v130 = v81[v129];
          int v131 = 2;
          int v132 = v82 + v131;
          int v133;
          v133 = v132;
          switch (v130) {
            case 0:
              {
              int v134 = 0;
              int v135 = v82 + v134;
              v133 = v135;
              break;
            }
            default:
              {
              int v136 = 4;
              v133 = v136;
              break;
            }
          }
          v125 = v133;
          break;
        }
        default:
          {
          int v137 = 36;
          int v138 = v137 + v82;
          int v139 = v81[v138];
          int v140;
          v140 = v82;
          switch (v139) {
            case 0:
              {
              v140 = v82;
              break;
            }
            case 1:
              {
              int v141 = 3;
              int v142 = v82 + v141;
              v140 = v142;
              break;
            }
            case 2:
              {
              v140 = v82;
              break;
            }
            default:
              {
              v140 = v82;
              break;
            }
          }
          v125 = v140;
          break;
        }
      }
      bool v143 = true;
      v99 = v125;
      break;
    }
    case 2:
      {
      int v144 = 1;
      v99 = v144;
    }
    default:
      {
      int v145 = 40;
      int v146 = v145 + v82;
      int v147 = v81[v146];
      int v148 = 0;
      bool v149 = v147 != v148;
      int v150;
      if (v149) {
        int v151 = 0;
        int v152 = 0;
        int v153;
        int v154;
        v153 = v151;
        v154 = v152;
        while (true) {
          int v155 = 4;
          int v156 = v154 * v155;
          int v157 = v156 + v82;
          int v158 = 44;
          int v159 = v158 + v157;
          int v160 = v81[v159];
          int v161 = 0;
          bool v162 = v160 != v161;
          v153 = v153;
          v154 = v154;
          if (!v162) break;
          int v163 = v153 + v154;
          int v164 = 1;
          int v165 = v154 + v164;
          bool v166 = true;
          v153 = v163;
          v154 = v165;
        }
        v150 = v153;
      } else {
        int v167 = 64;
        int v168 = v167 + v82;
        int v169 = v81[v168];
        int v170 = 0;
        bool v171 = v169 != v170;
        int v172;
        if (v171) {
          v172 = v82;
        } else {
          v172 = v82;
        }
        v150 = v172;
      }
      v99 = v150;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 7; ++idx) {
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
