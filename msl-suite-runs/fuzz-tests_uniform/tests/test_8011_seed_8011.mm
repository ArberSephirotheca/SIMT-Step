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
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 0;
      bool v10 = v2 != v9;
      int v11;
      if (v10) {
        int v12 = 0;
        bool v13 = v2 != v12;
        int v14;
        if (v13) {
          v14 = v0;
        } else {
          int v15 = 4;
          v14 = v15;
        }
        v11 = v14;
      } else {
        int v16 = 0;
        int v17 = 0;
        int v18;
        int v19;
        v18 = v16;
        v19 = v17;
        while (true) {
          int v20 = 4;
          int v21 = v3 % v20;
          int v22 = 1;
          int v23 = v21 + v22;
          bool v24 = v19 < v23;
          v18 = v18;
          v19 = v19;
          if (!v24) break;
          int v25 = 4;
          int v26 = v0 + v25;
          int v27 = 1;
          int v28 = v19 + v27;
          v18 = v26;
          v19 = v28;
          continue;
          ;
        }
        v11 = v18;
      }
      int v29 = 3;
      v8 = v11;
      break;
    }
    default:
      {
      int v30 = 0;
      bool v31 = v2 != v30;
      int v32;
      if (v31) {
        int v33 = 0;
        bool v34 = v2 != v33;
        int v35;
        if (v34) {
          int v36 = 1;
          v35 = v36;
        } else {
          int v37 = 0;
          int v38 = v0 + v37;
          v35 = v38;
        }
        v32 = v35;
      } else {
        int v39 = 0;
        bool v40 = v2 != v39;
        int v41;
        if (v40) {
          v41 = v0;
        } else {
          int v42 = 4;
          v41 = v42;
        }
        int v43 = 1;
        v32 = v41;
      }
      int v44 = 0;
      v8 = v32;
      break;
    }
    case 1:
      {
      int v45 = 4;
      int v46 = v3 % v45;
      int v47 = 4;
      int v48;
      v48 = v47;
      switch (v46) {
        default:
          {
          int v49 = 0;
          bool v50 = v2 != v49;
          int v51;
          if (v50) {
            int v52 = 4;
            int v53 = v0 + v52;
            v51 = v53;
          } else {
            int v54 = 4;
            v51 = v54;
          }
          v48 = v51;
          break;
        }
        case 0:
          {
          int v55 = 3;
          int v56 = v3 % v55;
          int v57 = 3;
          int v58;
          v58 = v57;
          switch (v56) {
            default:
              {
              int v59 = 4;
              int v60 = v0 + v59;
              v58 = v60;
              break;
            }
            case 0:
              {
              int v61 = 0;
              v58 = v61;
              break;
            }
            case 1:
              {
              int v62 = 3;
              int v63 = v0 + v62;
              v58 = v63;
              break;
            }
            case 2:
              {
              v58 = v0;
              break;
            }
          }
          int v64 = 3;
          v48 = v58;
          break;
        }
        case 1:
          {
          int v65 = 0;
          bool v66 = v2 != v65;
          int v67;
          if (v66) {
            v67 = v0;
          } else {
            int v68 = 4;
            int v69 = v0 + v68;
            v67 = v69;
          }
          v48 = v67;
          break;
        }
        case 2:
          {
          v48 = v0;
          break;
        }
      }
      int v70 = 0;
      int v71 = v0 + v70;
      v8 = v48;
      break;
    }
  }
  bool v72 = true;
  int v73 = simt_wave_count_bits(v72);
  int v74 = 0;
  int v75 = v74 + v0;
  v1[v75] = v73;
  int v76 = 0;
  bool v77 = v2 != v76;
  int v78 = v77 ? v0 : v8;
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
  int v88 = 0;
  int v89 = 0;
  int v90;
  int v91;
  v90 = v88;
  v91 = v89;
  while (true) {
    int v92 = 4;
    int v93 = v91 * v92;
    int v94 = v93 + v81;
    int v95 = 8;
    int v96 = v95 + v94;
    int v97 = v80[v96];
    int v98 = 0;
    bool v99 = v97 != v98;
    v90 = v90;
    v91 = v91;
    if (!v99) break;
    uint v100 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v101 = (int)(v100);
    int v102 = v90 + v101;
    int v103 = 1;
    int v104 = v91 + v103;
    v90 = v102;
    v91 = v104;
    continue;
    ;
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
  int v113 = 2;
  int v114;
  v114 = v113;
  switch (v112) {
    default:
      {
      int v115 = 1;
      v114 = v115;
      break;
    }
    case 0:
      {
      int v116 = 32;
      int v117 = v116 + v81;
      int v118 = v80[v117];
      int v119 = 0;
      bool v120 = v118 != v119;
      int v121;
      if (v120) {
        int v122 = 1;
        int v123 = v81 + v122;
        v121 = v123;
      } else {
        int v124 = 36;
        int v125 = v124 + v81;
        int v126 = v80[v125];
        int v127 = 0;
        bool v128 = v126 != v127;
        int v129;
        if (v128) {
          int v130 = 4;
          v129 = v130;
        } else {
          int v131 = 4;
          int v132 = v81 + v131;
          v129 = v132;
        }
        v121 = v129;
      }
      v114 = v121;
      break;
    }
  }
  bool v133 = true;
  int v134 = 32;
  int v135 = v134 + v81;
  bool v136 = true;
  int v137 = simt_wave_count_bits(v136);
  v79[v135] = v137;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
