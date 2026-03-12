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
  int v6 = 0;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 0;
      bool v10 = v2 != v9;
      int v11;
      if (v10) {
        int v12 = 0;
        int v13 = v0 + v12;
        v11 = v13;
      } else {
        int v14 = 0;
        int v15 = 0;
        int v16;
        int v17;
        v16 = v14;
        v17 = v15;
        while (true) {
          int v18 = 4;
          int v19 = v3 % v18;
          int v20 = 1;
          int v21 = v19 + v20;
          bool v22 = v17 < v21;
          v16 = v16;
          v17 = v17;
          if (!v22) break;
          int v23 = 1;
          int v24 = 1;
          int v25 = v17 + v24;
          v16 = v23;
          v17 = v25;
        }
        v11 = v16;
      }
      v8 = v11;
      break;
    }
    case 0:
      {
      int v26 = 4;
      int v27 = v3 % v26;
      int v28 = 0;
      int v29;
      v29 = v28;
      switch (v27) {
        case 0:
          {
          int v30 = 0;
          bool v31 = v2 != v30;
          int v32;
          if (v31) {
            int v33 = 0;
            v32 = v33;
          } else {
            int v34 = 3;
            int v35 = v0 + v34;
            v32 = v35;
          }
          v29 = v32;
          break;
        }
        default:
          {
          int v36 = 3;
          int v37 = v3 % v36;
          int v38 = 1;
          int v39;
          v39 = v38;
          switch (v37) {
            case 0:
              {
              int v40 = 4;
              int v41 = v0 + v40;
              v39 = v41;
              break;
            }
            case 1:
              {
              v39 = v0;
              break;
            }
            default:
              {
              int v42 = 2;
              v39 = v42;
              break;
            }
            case 2:
              {
              v39 = v0;
              break;
            }
          }
          v29 = v39;
          break;
        }
        case 1:
          {
          int v43 = 0;
          bool v44 = v2 != v43;
          int v45;
          if (v44) {
            int v46 = 1;
            int v47 = v0 + v46;
            v45 = v47;
          } else {
            int v48 = 0;
            int v49 = v0 + v48;
            v45 = v49;
          }
          v29 = v45;
          break;
        }
        case 2:
          {
          int v50 = 3;
          int v51 = v3 % v50;
          int v52 = 2;
          int v53;
          v53 = v52;
          switch (v51) {
            case 0:
              {
              int v54 = 0;
              int v55 = v0 + v54;
              v53 = v55;
              break;
            }
            default:
              {
              int v56 = 4;
              v53 = v56;
              break;
            }
            case 1:
              {
              v53 = v0;
              break;
            }
            case 2:
              {
              int v57 = 1;
              int v58 = v0 + v57;
              v53 = v58;
              break;
            }
          }
          int v59 = 3;
          int v60 = v0 + v59;
          v29 = v53;
          break;
        }
      }
      v8 = v29;
      break;
    }
    case 1:
      {
      int v61 = 0;
      bool v62 = v2 != v61;
      int v63;
      if (v62) {
        int v64 = 0;
        bool v65 = v2 != v64;
        int v66;
        if (v65) {
          int v67 = 0;
          v66 = v67;
        } else {
          int v68 = 2;
          v66 = v68;
        }
        v63 = v66;
      } else {
        v63 = v0;
      }
      v8 = v63;
      break;
    }
  }
  bool v69 = true;
  int v70 = simt_wave_count_bits(v69);
  int v71 = 0;
  int v72 = v71 + v0;
  v1[v72] = v70;
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
  int v82 = 8;
  int v83 = v82 + v75;
  int v84 = v74[v83];
  int v85;
  v85 = v75;
  switch (v84) {
    case 0:
      {
      int v86 = 12;
      int v87 = v86 + v75;
      int v88 = v74[v87];
      int v89 = 1;
      int v90;
      v90 = v89;
      switch (v88) {
        default:
          {
          int v91 = 16;
          int v92 = v91 + v75;
          int v93 = v74[v92];
          int v94 = 1;
          int v95;
          v95 = v94;
          switch (v93) {
            case 0:
              {
              int v96 = 1;
              int v97 = v75 + v96;
              v95 = v97;
              break;
            }
            case 1:
              {
              v95 = v75;
              break;
            }
            default:
              {
              int v98 = 3;
              int v99 = v75 + v98;
              v95 = v99;
              break;
            }
          }
          v90 = v95;
        }
        case 0:
          {
          int v100 = 2;
          int v101 = v75 + v100;
          v90 = v101;
        }
        case 1:
          {
          int v102 = 20;
          int v103 = v102 + v75;
          int v104 = v74[v103];
          int v105 = 4;
          int v106;
          v106 = v105;
          switch (v104) {
            default:
              {
              v106 = v75;
              break;
            }
            case 0:
              {
              int v107 = 3;
              int v108 = v75 + v107;
              v106 = v108;
              break;
            }
            case 1:
              {
              v106 = v75;
              break;
            }
          }
          v90 = v106;
          break;
        }
        case 2:
          {
          int v109 = 24;
          int v110 = v109 + v75;
          int v111 = v74[v110];
          int v112 = 0;
          int v113;
          v113 = v112;
          switch (v111) {
            default:
              {
              int v114 = 1;
              int v115 = v75 + v114;
              v113 = v115;
              break;
            }
            case 0:
              {
              int v116 = 3;
              v113 = v116;
              break;
            }
          }
          v90 = v113;
          break;
        }
      }
      bool v117 = true;
      v85 = v90;
      break;
    }
    default:
      {
      v85 = v75;
      break;
    }
    case 1:
      {
      int v118 = 28;
      int v119 = v118 + v75;
      int v120 = v74[v119];
      int v121 = 4;
      int v122;
      v122 = v121;
      switch (v120) {
        default:
          {
          int v123 = 32;
          int v124 = v123 + v75;
          int v125 = v74[v124];
          int v126 = 1;
          int v127;
          v127 = v126;
          switch (v125) {
            default:
              {
              int v128 = 3;
              int v129 = v75 + v128;
              v127 = v129;
            }
            case 0:
              {
              int v130 = 1;
              int v131 = v75 + v130;
              v127 = v131;
            }
            case 1:
              {
              v127 = v75;
            }
            case 2:
              {
              int v132 = 4;
              v127 = v132;
              break;
            }
          }
          v122 = v127;
          break;
        }
        case 0:
          {
          int v133 = 0;
          int v134 = 0;
          int v135;
          int v136;
          v135 = v133;
          v136 = v134;
          while (true) {
            int v137 = 4;
            int v138 = v136 * v137;
            int v139 = v138 + v75;
            int v140 = 36;
            int v141 = v140 + v139;
            int v142 = v74[v141];
            int v143 = 0;
            bool v144 = v142 != v143;
            v135 = v135;
            v136 = v136;
            if (!v144) break;
            int v145 = v135 + v136;
            int v146 = 1;
            int v147 = v136 + v146;
            bool v148 = true;
            v135 = v145;
            v136 = v147;
          }
          v122 = v135;
          break;
        }
        case 1:
          {
          int v149 = 56;
          int v150 = v149 + v75;
          int v151 = v74[v150];
          int v152 = 3;
          int v153;
          v153 = v152;
          switch (v151) {
            case 0:
              {
              int v154 = 3;
              int v155 = v75 + v154;
              v153 = v155;
              break;
            }
            default:
              {
              int v156 = 4;
              v153 = v156;
              break;
            }
          }
          v122 = v153;
          break;
        }
      }
      bool v157 = true;
      v85 = v122;
      break;
    }
    case 2:
      {
      v85 = v75;
      break;
    }
  }
  bool v158 = true;
  int v159 = 16;
  int v160 = v159 + v75;
  bool v161 = true;
  int v162 = simt_wave_count_bits(v161);
  v73[v160] = v162;
  int v163 = 3;
  int v164 = v75 + v163;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 60; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
