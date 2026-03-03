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
    case 0:
      {
      int v9 = 4;
      int v10 = v3 % v9;
      int v11;
      v11 = v0;
      switch (v10) {
        case 0:
          {
          int v12 = 2;
          int v13 = v3 % v12;
          int v14;
          v14 = v0;
          switch (v13) {
            default:
              {
              int v15 = 4;
              v14 = v15;
              break;
            }
            case 0:
              {
              v14 = v0;
            }
            case 1:
              {
              v14 = v0;
              break;
            }
          }
          v11 = v14;
          break;
        }
        default:
          {
          int v16 = 3;
          int v17 = v3 % v16;
          int v18 = 2;
          int v19;
          v19 = v18;
          switch (v17) {
            case 0:
              {
              int v20 = 0;
              int v21 = v0 + v20;
              v19 = v21;
              break;
            }
            case 1:
              {
              int v22 = 2;
              v19 = v22;
              break;
            }
            case 2:
              {
              int v23 = 0;
              v19 = v23;
              break;
            }
            default:
              {
              int v24 = 4;
              int v25 = v0 + v24;
              v19 = v25;
              break;
            }
          }
          v11 = v19;
          break;
        }
        case 1:
          {
          int v26 = 3;
          int v27 = v3 % v26;
          int v28 = 2;
          int v29;
          v29 = v28;
          switch (v27) {
            case 0:
              {
              int v30 = 3;
              int v31 = v0 + v30;
              v29 = v31;
            }
            default:
              {
              int v32 = 3;
              v29 = v32;
            }
            case 1:
              {
              int v33 = 1;
              int v34 = v0 + v33;
              v29 = v34;
              break;
            }
          }
          int v35 = 1;
          int v36 = v0 + v35;
          v11 = v29;
          break;
        }
        case 2:
          {
          int v37 = 2;
          int v38 = v3 % v37;
          int v39;
          v39 = v0;
          switch (v38) {
            case 0:
              {
              int v40 = 3;
              v39 = v40;
              break;
            }
            default:
              {
              int v41 = 2;
              v39 = v41;
              break;
            }
          }
          int v42 = 4;
          int v43 = v0 + v42;
          v11 = v39;
          break;
        }
      }
      int v44 = 0;
      int v45 = v0 + v44;
      v8 = v11;
      break;
    }
    default:
      {
      int v46 = 0;
      int v47 = 0;
      int v48;
      int v49;
      v48 = v46;
      v49 = v47;
      while (true) {
        int v50 = 4;
        int v51 = v3 % v50;
        int v52 = 1;
        int v53 = v51 + v52;
        bool v54 = v49 < v53;
        v48 = v48;
        v49 = v49;
        if (!v54) break;
        int v55 = 0;
        int v56 = 0;
        int v57;
        int v58;
        v57 = v55;
        v58 = v56;
        while (true) {
          int v59 = 4;
          int v60 = v3 % v59;
          int v61 = 1;
          int v62 = v60 + v61;
          bool v63 = v58 < v62;
          v57 = v57;
          v58 = v58;
          if (!v63) break;
          int v64 = 1;
          int v65 = 1;
          int v66 = v58 + v65;
          v57 = v64;
          v58 = v66;
          continue;
          ;
        }
        int v67 = 1;
        int v68 = v0 + v67;
        int v69 = 1;
        int v70 = v49 + v69;
        v48 = v57;
        v49 = v70;
      }
      int v71 = 2;
      int v72 = v0 + v71;
      v8 = v48;
      break;
    }
    case 1:
      {
      int v73 = 3;
      int v74 = v0 + v73;
      v8 = v74;
      break;
    }
  }
  bool v75 = true;
  int v76 = simt_wave_count_bits(v75);
  int v77 = 0;
  int v78 = v77 + v0;
  v1[v78] = v76;
  return;
}

kernel void kernel_main(device int* v79 [[buffer(0)]], device int* v80 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v81 = static_cast<int>(__simt_tid3.x);
  int v82 = 0;
  int v83 = v82 + v81;
  int v84 = v80[v83];
  int v85 = 4;
  int v86 = v85 + v81;
  int v87 = v80[v86];
  helper0(v81, v79, v84, v87, static_cast<int>(__simt_tid3.x));
  uint v88 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v89 = (int)(v88);
  int v90 = 0;
  int v91 = 0;
  int v92;
  int v93;
  v92 = v90;
  v93 = v91;
  while (true) {
    int v94 = 4;
    int v95 = v93 * v94;
    int v96 = v95 + v81;
    int v97 = 8;
    int v98 = v97 + v96;
    int v99 = v80[v98];
    int v100 = 0;
    bool v101 = v99 != v100;
    v92 = v92;
    v93 = v93;
    if (!v101) break;
    int v102 = v92 + v93;
    int v103 = 1;
    int v104 = v93 + v103;
    v92 = v102;
    v93 = v104;
  }
  bool v105 = true;
  int v106 = 16;
  int v107 = v106 + v81;
  bool v108 = true;
  int v109 = simt_wave_count_bits(v108);
  v79[v107] = v109;
  int v110 = 28;
  int v111 = v110 + v81;
  int v112 = v80[v111];
  uint v113 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v114 = (int)(v113);
  int v115;
  v115 = v114;
  switch (v112) {
    case 0:
      {
      int v116 = 4;
      int v117 = v81 + v116;
      v115 = v117;
    }
    case 1:
      {
      int v118 = 32;
      int v119 = v118 + v81;
      int v120 = v80[v119];
      int v121 = 0;
      int v122 = v81 + v121;
      int v123;
      v123 = v122;
      switch (v120) {
        default:
          {
          int v124 = 36;
          int v125 = v124 + v81;
          int v126 = v80[v125];
          int v127 = 3;
          int v128;
          v128 = v127;
          switch (v126) {
            case 0:
              {
              int v129 = 3;
              int v130 = v81 + v129;
              v128 = v130;
              break;
            }
            case 1:
              {
              int v131 = 3;
              v128 = v131;
              break;
            }
            case 2:
              {
              int v132 = 4;
              int v133 = v81 + v132;
              v128 = v133;
              break;
            }
            default:
              {
              v128 = v81;
              break;
            }
          }
          bool v134 = true;
          v123 = v128;
          break;
        }
        case 0:
          {
          int v135 = 40;
          int v136 = v135 + v81;
          int v137 = v80[v136];
          int v138 = 0;
          bool v139 = v137 != v138;
          int v140;
          if (v139) {
            int v141 = 4;
            v140 = v141;
          } else {
            int v142 = 4;
            v140 = v142;
          }
          v123 = v140;
          break;
        }
      }
      bool v143 = true;
      v115 = v123;
    }
    default:
      {
      int v144 = 0;
      int v145 = 0;
      int v146;
      int v147;
      v146 = v144;
      v147 = v145;
      while (true) {
        int v148 = 4;
        int v149 = v147 * v148;
        int v150 = v149 + v81;
        int v151 = 44;
        int v152 = v151 + v150;
        int v153 = v80[v152];
        int v154 = 0;
        bool v155 = v153 != v154;
        v146 = v146;
        v147 = v147;
        if (!v155) break;
        int v156 = v146 + v147;
        int v157 = 1;
        int v158 = v147 + v157;
        v146 = v156;
        v147 = v158;
        continue;
        ;
      }
      bool v159 = true;
      v115 = v146;
      break;
    }
  }
  bool v160 = true;
  int v161 = 32;
  int v162 = v161 + v81;
  bool v163 = true;
  int v164 = simt_wave_count_bits(v163);
  v79[v162] = v164;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 64; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
