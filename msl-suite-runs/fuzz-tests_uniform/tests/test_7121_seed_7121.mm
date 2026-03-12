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
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 4;
      int v10 = v3 % v9;
      int v11 = 3;
      int v12;
      v12 = v11;
      switch (v10) {
        case 0:
          {
          int v13 = 2;
          int v14 = v3 % v13;
          int v15 = 4;
          int v16;
          v16 = v15;
          switch (v14) {
            case 0:
              {
              int v17 = 4;
              int v18 = v0 + v17;
              v16 = v18;
            }
            default:
              {
              v16 = v0;
            }
            case 1:
              {
              int v19 = 1;
              int v20 = v0 + v19;
              v16 = v20;
              break;
            }
          }
          int v21 = 4;
          v12 = v16;
          break;
        }
        case 1:
          {
          int v22 = 2;
          int v23 = v3 % v22;
          int v24;
          v24 = v0;
          switch (v23) {
            default:
              {
              int v25 = 2;
              v24 = v25;
              break;
            }
            case 0:
              {
              v24 = v0;
              break;
            }
          }
          int v26 = 2;
          v12 = v24;
          break;
        }
        default:
          {
          int v27 = 1;
          v12 = v27;
          break;
        }
        case 2:
          {
          int v28 = 0;
          int v29 = 0;
          int v30;
          int v31;
          v30 = v28;
          v31 = v29;
          while (true) {
            int v32 = 4;
            int v33 = v3 % v32;
            int v34 = 1;
            int v35 = v33 + v34;
            bool v36 = v31 < v35;
            v30 = v30;
            v31 = v31;
            if (!v36) break;
            int v37 = 1;
            int v38 = v31 + v37;
            v30 = v0;
            v31 = v38;
          }
          int v39 = 2;
          int v40 = v0 + v39;
          v12 = v30;
          break;
        }
      }
      int v41 = 0;
      v8 = v12;
      break;
    }
    case 0:
      {
      int v42 = 2;
      v8 = v42;
      break;
    }
    case 1:
      {
      int v43 = 3;
      int v44 = v3 % v43;
      int v45 = 2;
      int v46 = v0 + v45;
      int v47;
      v47 = v46;
      switch (v44) {
        case 0:
          {
          v47 = v0;
        }
        default:
          {
          int v48 = 0;
          bool v49 = v2 != v48;
          int v50;
          if (v49) {
            int v51 = 4;
            v50 = v51;
          } else {
            int v52 = 3;
            int v53 = v0 + v52;
            v50 = v53;
          }
          int v54 = 1;
          int v55 = v0 + v54;
          v47 = v50;
        }
        case 1:
          {
          int v56 = 1;
          v47 = v56;
          break;
        }
      }
      int v57 = 2;
      int v58 = v0 + v57;
      v8 = v47;
      break;
    }
  }
  bool v59 = true;
  int v60 = simt_wave_count_bits(v59);
  int v61 = 0;
  int v62 = v61 + v0;
  v1[v62] = v60;
  int v63 = 0;
  bool v64 = v2 != v63;
  int v65 = v64 ? v0 : v8;
  return;
}

kernel void kernel_main(device int* v66 [[buffer(0)]], device int* v67 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v68 = static_cast<int>(__simt_tid3.x);
  int v69 = 0;
  int v70 = v69 + v68;
  int v71 = v67[v70];
  int v72 = 4;
  int v73 = v72 + v68;
  int v74 = v67[v73];
  helper0(v68, v66, v71, v74, static_cast<int>(__simt_tid3.x));
  int v75 = 3;
  int v76 = v68 + v75;
  int v77 = 0;
  int v78 = 0;
  int v79;
  int v80;
  v79 = v77;
  v80 = v78;
  while (true) {
    int v81 = 4;
    int v82 = v80 * v81;
    int v83 = v82 + v68;
    int v84 = 8;
    int v85 = v84 + v83;
    int v86 = v67[v85];
    int v87 = 0;
    bool v88 = v86 != v87;
    v79 = v79;
    v80 = v80;
    if (!v88) break;
    int v89 = 2;
    int v90 = v68 + v89;
    int v91 = v79 + v90;
    int v92 = 1;
    int v93 = v80 + v92;
    v79 = v91;
    v80 = v93;
    break;
    ;
  }
  bool v94 = true;
  int v95 = 16;
  int v96 = v95 + v68;
  bool v97 = true;
  int v98 = simt_wave_count_bits(v97);
  v66[v96] = v98;
  int v99 = 28;
  int v100 = v99 + v68;
  int v101 = v67[v100];
  uint v102 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v103 = (int)(v102);
  int v104;
  v104 = v103;
  switch (v101) {
    default:
      {
      int v105 = 32;
      int v106 = v105 + v68;
      int v107 = v67[v106];
      int v108;
      v108 = v68;
      switch (v107) {
        default:
          {
          int v109 = 36;
          int v110 = v109 + v68;
          int v111 = v67[v110];
          int v112 = 0;
          bool v113 = v111 != v112;
          int v114;
          if (v113) {
            int v115 = 0;
            v114 = v115;
          } else {
            int v116 = 1;
            v114 = v116;
          }
          v108 = v114;
          break;
        }
        case 0:
          {
          int v117 = 40;
          int v118 = v117 + v68;
          int v119 = v67[v118];
          int v120 = 1;
          int v121 = v68 + v120;
          int v122;
          v122 = v121;
          switch (v119) {
            case 0:
              {
              int v123 = 2;
              v122 = v123;
              break;
            }
            default:
              {
              v122 = v68;
              break;
            }
          }
          bool v124 = true;
          v108 = v122;
        }
        case 1:
          {
          int v125 = 44;
          int v126 = v125 + v68;
          int v127 = v67[v126];
          int v128 = 0;
          bool v129 = v127 != v128;
          int v130;
          if (v129) {
            v130 = v68;
          } else {
            int v131 = 4;
            int v132 = v68 + v131;
            v130 = v132;
          }
          v108 = v130;
        }
        case 2:
          {
          int v133 = 48;
          int v134 = v133 + v68;
          int v135 = v67[v134];
          int v136 = 1;
          int v137 = v68 + v136;
          int v138;
          v138 = v137;
          switch (v135) {
            case 0:
              {
              v138 = v68;
              break;
            }
            case 1:
              {
              int v139 = 4;
              v138 = v139;
              break;
            }
            case 2:
              {
              int v140 = 3;
              v138 = v140;
            }
            default:
              {
              int v141 = 2;
              int v142 = v68 + v141;
              v138 = v142;
              break;
            }
          }
          bool v143 = true;
          v108 = v138;
          break;
        }
      }
      bool v144 = true;
      v104 = v108;
      break;
    }
    case 0:
      {
      int v145 = 52;
      int v146 = v145 + v68;
      int v147 = v67[v146];
      int v148;
      v148 = v68;
      switch (v147) {
        case 0:
          {
          int v149 = 4;
          int v150 = v68 + v149;
          v148 = v150;
          break;
        }
        default:
          {
          int v151 = 56;
          int v152 = v151 + v68;
          int v153 = v67[v152];
          int v154 = 0;
          bool v155 = v153 != v154;
          int v156;
          if (v155) {
            v156 = v68;
          } else {
            v156 = v68;
          }
          v148 = v156;
          break;
        }
      }
      bool v157 = true;
      v104 = v148;
      break;
    }
  }
  bool v158 = true;
  int v159 = 32;
  int v160 = v159 + v68;
  bool v161 = true;
  int v162 = simt_wave_count_bits(v161);
  v66[v160] = v162;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 60; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
