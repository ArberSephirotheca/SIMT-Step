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
    bool v14 = v2 != v13;
    int v15;
    if (v14) {
      int v16 = 4;
      int v17 = v3 % v16;
      int v18;
      v18 = v0;
      switch (v17) {
        case 0:
          {
          int v19 = 3;
          v18 = v19;
          break;
        }
        case 1:
          {
          v18 = v0;
          break;
        }
        case 2:
          {
          int v20 = 4;
          int v21 = v0 + v20;
          v18 = v21;
          break;
        }
        default:
          {
          v18 = v0;
          break;
        }
      }
      v15 = v18;
    } else {
      int v22 = 3;
      int v23 = v3 % v22;
      int v24;
      v24 = v0;
      switch (v23) {
        case 0:
          {
          int v25 = 2;
          v24 = v25;
          break;
        }
        default:
          {
          int v26 = 0;
          int v27 = v0 + v26;
          v24 = v27;
          break;
        }
        case 1:
          {
          v24 = v0;
          break;
        }
      }
      v15 = v24;
    }
    int v28 = 1;
    int v29 = v7 + v28;
    v6 = v15;
    v7 = v29;
    continue;
    ;
  }
  bool v30 = true;
  int v31 = simt_wave_count_bits(v30);
  int v32 = 0;
  int v33 = v32 + v0;
  v1[v33] = v31;
  return;
}

kernel void kernel_main(device int* v34 [[buffer(0)]], device int* v35 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v36 = static_cast<int>(__simt_tid3.x);
  int v37 = 0;
  int v38 = v37 + v36;
  int v39 = v35[v38];
  int v40 = 4;
  int v41 = v40 + v36;
  int v42 = v35[v41];
  helper0(v36, v34, v39, v42, static_cast<int>(__simt_tid3.x));
  int v43 = 8;
  int v44 = v43 + v36;
  int v45 = v35[v44];
  int v46 = 3;
  int v47;
  v47 = v46;
  switch (v45) {
    case 0:
      {
      int v48 = 12;
      int v49 = v48 + v36;
      int v50 = v35[v49];
      int v51 = 0;
      bool v52 = v50 != v51;
      int v53;
      if (v52) {
        int v54 = 16;
        int v55 = v54 + v36;
        int v56 = v35[v55];
        int v57 = 0;
        int v58;
        v58 = v57;
        switch (v56) {
          case 0:
            {
            v58 = v36;
            break;
          }
          default:
            {
            int v59 = 1;
            int v60 = v36 + v59;
            v58 = v60;
            break;
          }
          case 1:
            {
            int v61 = 0;
            int v62 = v36 + v61;
            v58 = v62;
            break;
          }
          case 2:
            {
            int v63 = 2;
            v58 = v63;
            break;
          }
        }
        v53 = v58;
      } else {
        int v64 = 20;
        int v65 = v64 + v36;
        int v66 = v35[v65];
        int v67 = 0;
        bool v68 = v66 != v67;
        int v69;
        if (v68) {
          int v70 = 0;
          int v71 = v36 + v70;
          v69 = v71;
        } else {
          int v72 = 2;
          v69 = v72;
        }
        v53 = v69;
      }
      v47 = v53;
      break;
    }
    case 1:
      {
      int v73 = 24;
      int v74 = v73 + v36;
      int v75 = v35[v74];
      int v76;
      v76 = v36;
      switch (v75) {
        case 0:
          {
          int v77 = 28;
          int v78 = v77 + v36;
          int v79 = v35[v78];
          int v80 = 0;
          bool v81 = v79 != v80;
          int v82;
          if (v81) {
            int v83 = 0;
            v82 = v83;
          } else {
            v82 = v36;
          }
          v76 = v82;
          break;
        }
        case 1:
          {
          int v84 = 0;
          int v85 = 0;
          int v86;
          int v87;
          v86 = v84;
          v87 = v85;
          while (true) {
            int v88 = 4;
            int v89 = v87 * v88;
            int v90 = v89 + v36;
            int v91 = 32;
            int v92 = v91 + v90;
            int v93 = v35[v92];
            int v94 = 0;
            bool v95 = v93 != v94;
            v86 = v86;
            v87 = v87;
            if (!v95) break;
            int v96 = v86 + v87;
            int v97 = 1;
            int v98 = v87 + v97;
            bool v99 = true;
            v86 = v96;
            v87 = v98;
          }
          v76 = v86;
          break;
        }
        default:
          {
          int v100 = 52;
          int v101 = v100 + v36;
          int v102 = v35[v101];
          int v103 = 0;
          int v104;
          v104 = v103;
          switch (v102) {
            case 0:
              {
              int v105 = 2;
              v104 = v105;
              break;
            }
            default:
              {
              int v106 = 3;
              int v107 = v36 + v106;
              v104 = v107;
              break;
            }
            case 1:
              {
              int v108 = 2;
              int v109 = v36 + v108;
              v104 = v109;
              break;
            }
          }
          v76 = v104;
          break;
        }
        case 2:
          {
          int v110 = 56;
          int v111 = v110 + v36;
          int v112 = v35[v111];
          int v113 = 0;
          int v114;
          v114 = v113;
          switch (v112) {
            case 0:
              {
              int v115 = 4;
              v114 = v115;
              break;
            }
            case 1:
              {
              v114 = v36;
              break;
            }
            default:
              {
              v114 = v36;
              break;
            }
          }
          bool v116 = true;
          v76 = v114;
          break;
        }
      }
      v47 = v76;
      break;
    }
    default:
      {
      int v117 = 60;
      int v118 = v117 + v36;
      int v119 = v35[v118];
      int v120;
      v120 = v36;
      switch (v119) {
        default:
          {
          int v121 = 64;
          int v122 = v121 + v36;
          int v123 = v35[v122];
          int v124 = 0;
          bool v125 = v123 != v124;
          int v126;
          if (v125) {
            int v127 = 3;
            v126 = v127;
          } else {
            int v128 = 1;
            v126 = v128;
          }
          v120 = v126;
        }
        case 0:
          {
          int v129 = 68;
          int v130 = v129 + v36;
          int v131 = v35[v130];
          int v132 = 0;
          int v133;
          v133 = v132;
          switch (v131) {
            case 0:
              {
              int v134 = 3;
              v133 = v134;
              break;
            }
            default:
              {
              int v135 = 0;
              v133 = v135;
              break;
            }
          }
          v120 = v133;
          break;
        }
        case 1:
          {
          int v136 = 72;
          int v137 = v136 + v36;
          int v138 = v35[v137];
          int v139 = 0;
          bool v140 = v138 != v139;
          int v141;
          if (v140) {
            int v142 = 2;
            int v143 = v36 + v142;
            v141 = v143;
          } else {
            v141 = v36;
          }
          v120 = v141;
        }
        case 2:
          {
          int v144 = 76;
          int v145 = v144 + v36;
          int v146 = v35[v145];
          int v147 = 2;
          int v148 = v36 + v147;
          int v149;
          v149 = v148;
          switch (v146) {
            case 0:
              {
              int v150 = 0;
              int v151 = v36 + v150;
              v149 = v151;
              break;
            }
            case 1:
              {
              v149 = v36;
              break;
            }
            default:
              {
              int v152 = 2;
              v149 = v152;
              break;
            }
          }
          v120 = v149;
          break;
        }
      }
      v47 = v120;
      break;
    }
  }
  int v153 = 80;
  int v154 = v153 + v36;
  int v155 = v35[v154];
  int v156 = 0;
  bool v157 = v155 != v156;
  int v158;
  if (v157) {
    int v159 = 4;
    int v160 = v36 + v159;
    v158 = v160;
  } else {
    uint v161 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v162 = (int)(v161);
    v158 = v162;
  }
  int v163 = 16;
  int v164 = v163 + v36;
  bool v165 = true;
  int v166 = simt_wave_count_bits(v165);
  v34[v164] = v166;
  uint v167 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v168 = (int)(v167);
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 84; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
