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
    default:
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
        int v18 = 0;
        int v19;
        int v20;
        v19 = v17;
        v20 = v18;
        while (true) {
          int v21 = 4;
          int v22 = v3 % v21;
          int v23 = 1;
          int v24 = v22 + v23;
          bool v25 = v20 < v24;
          v19 = v19;
          v20 = v20;
          if (!v25) break;
          int v26 = 1;
          int v27 = v20 + v26;
          v19 = v0;
          v20 = v27;
        }
        int v28 = 1;
        int v29 = v11 + v28;
        v10 = v19;
        v11 = v29;
      }
      int v30 = 1;
      v7 = v10;
    }
    case 0:
      {
      int v31 = 4;
      v7 = v31;
    }
    case 1:
      {
      int v32 = 4;
      int v33 = v0 + v32;
      v7 = v33;
      break;
    }
  }
  bool v34 = true;
  int v35 = simt_wave_count_bits(v34);
  int v36 = 0;
  int v37 = v36 + v0;
  v1[v37] = v35;
  return;
}

kernel void kernel_main(device int* v38 [[buffer(0)]], device int* v39 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v40 = static_cast<int>(__simt_tid3.x);
  int v41 = 0;
  int v42 = v41 + v40;
  int v43 = v39[v42];
  int v44 = 4;
  int v45 = v44 + v40;
  int v46 = v39[v45];
  helper0(v40, v38, v43, v46, static_cast<int>(__simt_tid3.x));
  int v47 = 8;
  int v48 = v47 + v40;
  int v49 = v39[v48];
  int v50 = 0;
  int v51;
  v51 = v50;
  switch (v49) {
    case 0:
      {
      int v52 = 12;
      int v53 = v52 + v40;
      int v54 = v39[v53];
      int v55;
      v55 = v40;
      switch (v54) {
        case 0:
          {
          int v56 = 16;
          int v57 = v56 + v40;
          int v58 = v39[v57];
          int v59 = 2;
          int v60 = v40 + v59;
          int v61;
          v61 = v60;
          switch (v58) {
            case 0:
              {
              int v62 = 1;
              v61 = v62;
              break;
            }
            default:
              {
              int v63 = 0;
              int v64 = v40 + v63;
              v61 = v64;
              break;
            }
            case 1:
              {
              v61 = v40;
              break;
            }
            case 2:
              {
              v61 = v40;
              break;
            }
          }
          bool v65 = true;
          v55 = v61;
          break;
        }
        case 1:
          {
          int v66 = 20;
          int v67 = v66 + v40;
          int v68 = v39[v67];
          int v69 = 0;
          bool v70 = v68 != v69;
          int v71;
          if (v70) {
            int v72 = 1;
            int v73 = v40 + v72;
            v71 = v73;
          } else {
            int v74 = 1;
            v71 = v74;
          }
          v55 = v71;
          break;
        }
        case 2:
          {
          int v75 = 24;
          int v76 = v75 + v40;
          int v77 = v39[v76];
          int v78 = 0;
          bool v79 = v77 != v78;
          int v80;
          if (v79) {
            int v81 = 0;
            int v82 = v40 + v81;
            v80 = v82;
          } else {
            int v83 = 3;
            int v84 = v40 + v83;
            v80 = v84;
          }
          v55 = v80;
          break;
        }
        default:
          {
          int v85 = 28;
          int v86 = v85 + v40;
          int v87 = v39[v86];
          int v88 = 0;
          bool v89 = v87 != v88;
          int v90;
          if (v89) {
            v90 = v40;
          } else {
            int v91 = 4;
            v90 = v91;
          }
          v55 = v90;
          break;
        }
      }
      bool v92 = true;
      v51 = v55;
      break;
    }
    case 1:
      {
      int v93 = 32;
      int v94 = v93 + v40;
      int v95 = v39[v94];
      int v96;
      v96 = v40;
      switch (v95) {
        case 0:
          {
          int v97 = 36;
          int v98 = v97 + v40;
          int v99 = v39[v98];
          int v100 = 0;
          bool v101 = v99 != v100;
          int v102;
          if (v101) {
            v102 = v40;
          } else {
            v102 = v40;
          }
          v96 = v102;
          break;
        }
        default:
          {
          int v103 = 3;
          int v104 = v40 + v103;
          v96 = v104;
          break;
        }
        case 1:
          {
          int v105 = 40;
          int v106 = v105 + v40;
          int v107 = v39[v106];
          int v108 = 0;
          int v109;
          v109 = v108;
          switch (v107) {
            default:
              {
              v109 = v40;
              break;
            }
            case 0:
              {
              int v110 = 4;
              int v111 = v40 + v110;
              v109 = v111;
              break;
            }
            case 1:
              {
              int v112 = 3;
              int v113 = v40 + v112;
              v109 = v113;
              break;
            }
          }
          bool v114 = true;
          v96 = v109;
          break;
        }
        case 2:
          {
          int v115 = 44;
          int v116 = v115 + v40;
          int v117 = v39[v116];
          int v118;
          v118 = v40;
          switch (v117) {
            case 0:
              {
              v118 = v40;
              break;
            }
            case 1:
              {
              int v119 = 1;
              int v120 = v40 + v119;
              v118 = v120;
              break;
            }
            default:
              {
              v118 = v40;
              break;
            }
          }
          bool v121 = true;
          v96 = v118;
          break;
        }
      }
      bool v122 = true;
      v51 = v96;
      break;
    }
    default:
      {
      int v123 = 48;
      int v124 = v123 + v40;
      int v125 = v39[v124];
      int v126 = 3;
      int v127 = v40 + v126;
      int v128;
      v128 = v127;
      switch (v125) {
        case 0:
          {
          int v129 = 52;
          int v130 = v129 + v40;
          int v131 = v39[v130];
          int v132 = 0;
          bool v133 = v131 != v132;
          int v134;
          if (v133) {
            int v135 = 3;
            int v136 = v40 + v135;
            v134 = v136;
          } else {
            int v137 = 3;
            int v138 = v40 + v137;
            v134 = v138;
          }
          v128 = v134;
        }
        case 1:
          {
          int v139 = 56;
          int v140 = v139 + v40;
          int v141 = v39[v140];
          int v142 = 2;
          int v143;
          v143 = v142;
          switch (v141) {
            default:
              {
              v143 = v40;
              break;
            }
            case 0:
              {
              v143 = v40;
              break;
            }
            case 1:
              {
              int v144 = 2;
              int v145 = v40 + v144;
              v143 = v145;
              break;
            }
          }
          bool v146 = true;
          v128 = v143;
          break;
        }
        default:
          {
          int v147 = 60;
          int v148 = v147 + v40;
          int v149 = v39[v148];
          int v150;
          v150 = v40;
          switch (v149) {
            case 0:
              {
              int v151 = 2;
              int v152 = v40 + v151;
              v150 = v152;
              break;
            }
            case 1:
              {
              v150 = v40;
              break;
            }
            default:
              {
              v150 = v40;
            }
            case 2:
              {
              v150 = v40;
              break;
            }
          }
          bool v153 = true;
          v128 = v150;
        }
        case 2:
          {
          int v154 = 4;
          v128 = v154;
          break;
        }
      }
      bool v155 = true;
      v51 = v128;
      break;
    }
  }
  bool v156 = true;
  int v157 = 16;
  int v158 = v157 + v40;
  bool v159 = true;
  int v160 = simt_wave_count_bits(v159);
  v38[v158] = v160;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 64; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
