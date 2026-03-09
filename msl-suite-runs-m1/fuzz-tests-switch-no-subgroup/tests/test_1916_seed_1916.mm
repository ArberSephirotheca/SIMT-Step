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
    bool v7 = true;
    int v8 = simt_wave_count_bits(v7);
    int v9 = 0;
    int v10 = v9 + v0;
    v1[v10] = v8;
    v6 = v8;
  } else {
    int v11 = 0;
    bool v12 = v2 != v11;
    int v13;
    if (v12) {
      bool v14 = true;
      int v15 = simt_wave_count_bits(v14);
      int v16 = 16;
      int v17 = v16 + v0;
      v1[v17] = v15;
      v13 = v15;
    } else {
      int v18 = 3;
      int v19 = v3 % v18;
      int v20 = 0;
      int v21;
      v21 = v20;
      switch (v19) {
        case 0:
          {
          int v22 = 4;
          int v23 = v0 + v22;
          v21 = v23;
          break;
        }
        case 1:
          {
          v21 = v0;
        }
        default:
          {
          int v24 = 3;
          int v25 = v0 + v24;
          v21 = v25;
          break;
        }
      }
      v13 = v21;
    }
    v6 = v13;
  }
  return;
}

kernel void kernel_main(device int* v26 [[buffer(0)]], device int* v27 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v28 = static_cast<int>(__simt_tid3.x);
  int v29 = 0;
  int v30 = v29 + v28;
  int v31 = v27[v30];
  int v32 = 4;
  int v33 = v32 + v28;
  int v34 = v27[v33];
  int v35 = 0;
  bool v36 = v31 != v35;
  if (v36) {
  } else {
    int v37 = 8;
    int v38 = v37 + v28;
    int v39 = v27[v38];
    int v40 = 0;
    bool v41 = v39 != v40;
    if (v41) {
      helper0(v28, v26, v31, v34, static_cast<int>(__simt_tid3.x));
    } else {
    }
  }
  int v42 = 12;
  int v43 = v42 + v28;
  int v44 = v27[v43];
  uint v45 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v46 = (int)(v45);
  int v47;
  v47 = v46;
  switch (v44) {
    case 0:
      {
      int v48 = 0;
      int v49 = 0;
      int v50;
      int v51;
      v50 = v48;
      v51 = v49;
      while (true) {
        int v52 = 4;
        int v53 = v51 * v52;
        int v54 = v53 + v28;
        int v55 = 16;
        int v56 = v55 + v54;
        int v57 = v27[v56];
        int v58 = 0;
        bool v59 = v57 != v58;
        v50 = v50;
        v51 = v51;
        if (!v59) break;
        int v60 = v50 + v51;
        int v61 = 1;
        int v62 = v51 + v61;
        bool v63 = true;
        v50 = v60;
        v51 = v62;
      }
      v47 = v50;
      break;
    }
    case 1:
      {
      int v64 = 36;
      int v65 = v64 + v28;
      int v66 = v27[v65];
      int v67 = 0;
      bool v68 = v66 != v67;
      int v69;
      if (v68) {
        int v70 = 40;
        int v71 = v70 + v28;
        int v72 = v27[v71];
        int v73 = 0;
        bool v74 = v72 != v73;
        int v75;
        if (v74) {
          int v76 = 0;
          v75 = v76;
        } else {
          v75 = v28;
        }
        v69 = v75;
      } else {
        int v77 = 44;
        int v78 = v77 + v28;
        int v79 = v27[v78];
        int v80 = 3;
        int v81;
        v81 = v80;
        switch (v79) {
          case 0:
            {
            int v82 = 4;
            int v83 = v28 + v82;
            v81 = v83;
          }
          case 1:
            {
            int v84 = 0;
            int v85 = v28 + v84;
            v81 = v85;
            break;
          }
          case 2:
            {
            int v86 = 2;
            v81 = v86;
            break;
          }
          default:
            {
            int v87 = 3;
            v81 = v87;
            break;
          }
        }
        v69 = v81;
      }
      v47 = v69;
      break;
    }
    default:
      {
      int v88 = 48;
      int v89 = v88 + v28;
      int v90 = v27[v89];
      int v91;
      v91 = v28;
      switch (v90) {
        case 0:
          {
          int v92 = 52;
          int v93 = v92 + v28;
          int v94 = v27[v93];
          int v95 = 0;
          bool v96 = v94 != v95;
          int v97;
          if (v96) {
            int v98 = 2;
            int v99 = v28 + v98;
            v97 = v99;
          } else {
            v97 = v28;
          }
          v91 = v97;
          break;
        }
        case 1:
          {
          int v100 = 56;
          int v101 = v100 + v28;
          int v102 = v27[v101];
          int v103 = 2;
          int v104 = v28 + v103;
          int v105;
          v105 = v104;
          switch (v102) {
            case 0:
              {
              v105 = v28;
              break;
            }
            default:
              {
              v105 = v28;
              break;
            }
            case 1:
              {
              int v106 = 3;
              int v107 = v28 + v106;
              v105 = v107;
              break;
            }
          }
          v91 = v105;
        }
        default:
          {
          int v108 = 60;
          int v109 = v108 + v28;
          int v110 = v27[v109];
          int v111 = 0;
          bool v112 = v110 != v111;
          int v113;
          if (v112) {
            int v114 = 4;
            int v115 = v28 + v114;
            v113 = v115;
          } else {
            int v116 = 3;
            v113 = v116;
          }
          v91 = v113;
          break;
        }
      }
      bool v117 = true;
      v47 = v91;
      break;
    }
    case 2:
      {
      int v118 = 0;
      int v119 = 0;
      int v120;
      int v121;
      v120 = v118;
      v121 = v119;
      while (true) {
        int v122 = 4;
        int v123 = v121 * v122;
        int v124 = v123 + v28;
        int v125 = 64;
        int v126 = v125 + v124;
        int v127 = v27[v126];
        int v128 = 0;
        bool v129 = v127 != v128;
        v120 = v120;
        v121 = v121;
        if (!v129) break;
        int v130 = v120 + v121;
        int v131 = 1;
        int v132 = v121 + v131;
        bool v133 = true;
        v120 = v130;
        v121 = v132;
      }
      v47 = v120;
      break;
    }
  }
  int v134 = 0;
  int v135 = 0;
  int v136;
  int v137;
  v136 = v134;
  v137 = v135;
  while (true) {
    int v138 = 4;
    int v139 = v137 * v138;
    int v140 = v139 + v28;
    int v141 = 84;
    int v142 = v141 + v140;
    int v143 = v27[v142];
    int v144 = 0;
    bool v145 = v143 != v144;
    v136 = v136;
    v137 = v137;
    if (!v145) break;
    int v146 = v136 + v137;
    int v147 = 1;
    int v148 = v137 + v147;
    bool v149 = true;
    int v150 = 32;
    int v151 = 4;
    int v152 = v137 * v151;
    int v153 = v150 + v152;
    int v154 = v153 + v28;
    bool v155 = true;
    int v156 = simt_wave_count_bits(v155);
    v26[v154] = v156;
    v136 = v146;
    v137 = v148;
    continue;
    ;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 48; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 104; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
