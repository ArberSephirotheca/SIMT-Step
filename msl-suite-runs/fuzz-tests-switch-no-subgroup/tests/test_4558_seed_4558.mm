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
  bool v4 = true;
  int v5 = simt_wave_count_bits(v4);
  int v6 = 0;
  int v7 = v6 + v0;
  v1[v7] = v5;
  int v8 = 0;
  bool v9 = v2 != v8;
  int v10;
  if (v9) {
    int v11 = 0;
    int v12 = 0;
    int v13;
    int v14;
    v13 = v11;
    v14 = v12;
    while (true) {
      int v15 = 4;
      int v16 = v3 % v15;
      int v17 = 1;
      int v18 = v16 + v17;
      bool v19 = v14 < v18;
      v13 = v13;
      v14 = v14;
      if (!v19) break;
      int v20 = 0;
      int v21 = 0;
      int v22;
      int v23;
      v22 = v20;
      v23 = v21;
      while (true) {
        int v24 = 4;
        int v25 = v3 % v24;
        int v26 = 1;
        int v27 = v25 + v26;
        bool v28 = v23 < v27;
        v22 = v22;
        v23 = v23;
        if (!v28) break;
        bool v29 = true;
        int v30 = simt_wave_count_bits(v29);
        int v31 = 16;
        int v32 = 4;
        int v33 = v23 * v32;
        int v34 = v31 + v33;
        int v35 = v34 + v0;
        v1[v35] = v30;
        int v36 = 1;
        int v37 = v23 + v36;
        v22 = v30;
        v23 = v37;
        break;
        ;
      }
      int v38 = 1;
      int v39 = v14 + v38;
      v13 = v22;
      v14 = v39;
      break;
      ;
    }
    v10 = v13;
  } else {
    bool v40 = true;
    int v41 = simt_wave_count_bits(v40);
    int v42 = 32;
    int v43 = v42 + v0;
    v1[v43] = v41;
    v10 = v41;
  }
  int v44 = 0;
  bool v45 = v2 != v44;
  int v46 = v45 ? v5 : v10;
  return;
}

kernel void kernel_main(device int* v47 [[buffer(0)]], device int* v48 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v49 = static_cast<int>(__simt_tid3.x);
  int v50 = 0;
  int v51 = v50 + v49;
  int v52 = v48[v51];
  int v53 = 4;
  int v54 = v53 + v49;
  int v55 = v48[v54];
  helper0(v49, v47, v52, v55, static_cast<int>(__simt_tid3.x));
  uint v56 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v57 = (int)(v56);
  int v58 = 8;
  int v59 = v58 + v49;
  int v60 = v48[v59];
  int v61 = 3;
  int v62;
  v62 = v61;
  switch (v60) {
    case 0:
      {
      int v63 = 3;
      int v64 = v49 + v63;
      v62 = v64;
      break;
    }
    default:
      {
      int v65 = 12;
      int v66 = v65 + v49;
      int v67 = v48[v66];
      int v68 = 3;
      int v69;
      v69 = v68;
      switch (v67) {
        case 0:
          {
          int v70 = 16;
          int v71 = v70 + v49;
          int v72 = v48[v71];
          int v73 = 0;
          bool v74 = v72 != v73;
          int v75;
          if (v74) {
            int v76 = 1;
            int v77 = v49 + v76;
            v75 = v77;
          } else {
            int v78 = 3;
            v75 = v78;
          }
          v69 = v75;
          break;
        }
        default:
          {
          int v79 = 0;
          int v80 = 0;
          int v81;
          int v82;
          v81 = v79;
          v82 = v80;
          while (true) {
            int v83 = 4;
            int v84 = v82 * v83;
            int v85 = v84 + v49;
            int v86 = 20;
            int v87 = v86 + v85;
            int v88 = v48[v87];
            int v89 = 0;
            bool v90 = v88 != v89;
            v81 = v81;
            v82 = v82;
            if (!v90) break;
            int v91 = v81 + v82;
            int v92 = 1;
            int v93 = v82 + v92;
            bool v94 = true;
            v81 = v91;
            v82 = v93;
          }
          v69 = v81;
          break;
        }
        case 1:
          {
          int v95 = 40;
          int v96 = v95 + v49;
          int v97 = v48[v96];
          int v98 = 0;
          bool v99 = v97 != v98;
          int v100;
          if (v99) {
            v100 = v49;
          } else {
            v100 = v49;
          }
          v69 = v100;
          break;
        }
        case 2:
          {
          int v101 = 44;
          int v102 = v101 + v49;
          int v103 = v48[v102];
          int v104 = 0;
          int v105;
          v105 = v104;
          switch (v103) {
            case 0:
              {
              v105 = v49;
              break;
            }
            default:
              {
              int v106 = 3;
              int v107 = v49 + v106;
              v105 = v107;
              break;
            }
          }
          v69 = v105;
          break;
        }
      }
      v62 = v69;
      break;
    }
    case 1:
      {
      int v108 = 48;
      int v109 = v108 + v49;
      int v110 = v48[v109];
      int v111 = 2;
      int v112 = v49 + v111;
      int v113;
      v113 = v112;
      switch (v110) {
        case 0:
          {
          int v114 = 52;
          int v115 = v114 + v49;
          int v116 = v48[v115];
          int v117 = 0;
          int v118;
          v118 = v117;
          switch (v116) {
            case 0:
              {
              int v119 = 0;
              int v120 = v49 + v119;
              v118 = v120;
            }
            default:
              {
              int v121 = 1;
              v118 = v121;
            }
            case 1:
              {
              int v122 = 3;
              int v123 = v49 + v122;
              v118 = v123;
              break;
            }
            case 2:
              {
              int v124 = 1;
              v118 = v124;
              break;
            }
          }
          v113 = v118;
          break;
        }
        case 1:
          {
          int v125 = 0;
          int v126 = 0;
          int v127;
          int v128;
          v127 = v125;
          v128 = v126;
          while (true) {
            int v129 = 4;
            int v130 = v128 * v129;
            int v131 = v130 + v49;
            int v132 = 56;
            int v133 = v132 + v131;
            int v134 = v48[v133];
            int v135 = 0;
            bool v136 = v134 != v135;
            v127 = v127;
            v128 = v128;
            if (!v136) break;
            int v137 = v127 + v128;
            int v138 = 1;
            int v139 = v128 + v138;
            bool v140 = true;
            v127 = v137;
            v128 = v139;
          }
          v113 = v127;
          break;
        }
        default:
          {
          int v141 = 76;
          int v142 = v141 + v49;
          int v143 = v48[v142];
          int v144;
          v144 = v49;
          switch (v143) {
            case 0:
              {
              int v145 = 4;
              int v146 = v49 + v145;
              v144 = v146;
              break;
            }
            case 1:
              {
              v144 = v49;
              break;
            }
            default:
              {
              int v147 = 1;
              int v148 = v49 + v147;
              v144 = v148;
              break;
            }
            case 2:
              {
              int v149 = 1;
              int v150 = v49 + v149;
              v144 = v150;
              break;
            }
          }
          v113 = v144;
          break;
        }
        case 2:
          {
          v113 = v49;
          break;
        }
      }
      bool v151 = true;
      v62 = v113;
      break;
    }
    case 2:
      {
      int v152 = 0;
      int v153 = v49 + v152;
      v62 = v153;
      break;
    }
  }
  bool v154 = true;
  int v155 = 48;
  int v156 = v155 + v49;
  bool v157 = true;
  int v158 = simt_wave_count_bits(v157);
  v47[v156] = v158;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 52; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 80; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
