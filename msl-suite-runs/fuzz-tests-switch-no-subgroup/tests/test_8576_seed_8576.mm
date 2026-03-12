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
    bool v13 = true;
    int v14 = simt_wave_count_bits(v13);
    int v15 = 0;
    int v16 = 4;
    int v17 = v7 * v16;
    int v18 = v15 + v17;
    int v19 = v18 + v0;
    v1[v19] = v14;
    int v20 = 1;
    int v21 = v7 + v20;
    v6 = v14;
    v7 = v21;
  }
  int v22 = 3;
  int v23 = v3 % v22;
  uint v24 = simt_lane_id(__simt_tid);
  int v25 = (int)(v24);
  int v26;
  v26 = v25;
  switch (v23) {
    default:
      {
      int v27 = 0;
      bool v28 = v2 != v27;
      int v29;
      if (v28) {
        int v30 = 0;
        bool v31 = v2 != v30;
        int v32;
        if (v31) {
          int v33 = 3;
          v32 = v33;
        } else {
          int v34 = 1;
          v32 = v34;
        }
        v29 = v32;
      } else {
        int v35 = 0;
        bool v36 = v2 != v35;
        int v37;
        if (v36) {
          int v38 = 0;
          v37 = v38;
        } else {
          int v39 = 1;
          v37 = v39;
        }
        v29 = v37;
      }
      v26 = v29;
      break;
    }
    case 0:
      {
      int v40 = 0;
      int v41 = 0;
      int v42;
      int v43;
      v42 = v40;
      v43 = v41;
      while (true) {
        int v44 = 4;
        int v45 = v3 % v44;
        int v46 = 1;
        int v47 = v45 + v46;
        bool v48 = v43 < v47;
        v42 = v42;
        v43 = v43;
        if (!v48) break;
        int v49 = 4;
        int v50 = v3 % v49;
        int v51;
        v51 = v0;
        switch (v50) {
          case 0:
            {
            v51 = v0;
            break;
          }
          default:
            {
            int v52 = 1;
            v51 = v52;
            break;
          }
          case 1:
            {
            int v53 = 3;
            v51 = v53;
            break;
          }
          case 2:
            {
            v51 = v0;
            break;
          }
        }
        int v54 = 1;
        int v55 = 1;
        int v56 = v43 + v55;
        v42 = v51;
        v43 = v56;
      }
      v26 = v42;
      break;
    }
    case 1:
      {
      int v57 = 0;
      int v58 = 0;
      int v59;
      int v60;
      v59 = v57;
      v60 = v58;
      while (true) {
        int v61 = 4;
        int v62 = v3 % v61;
        int v63 = 1;
        int v64 = v62 + v63;
        bool v65 = v60 < v64;
        v59 = v59;
        v60 = v60;
        if (!v65) break;
        int v66 = 1;
        int v67 = v60 + v66;
        v59 = v0;
        v60 = v67;
      }
      v26 = v59;
      break;
    }
  }
  int v68 = 0;
  bool v69 = v2 != v68;
  int v70 = v69 ? v6 : v26;
  return;
}

kernel void kernel_main(device int* v71 [[buffer(0)]], device int* v72 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v73 = static_cast<int>(__simt_tid3.x);
  int v74 = 0;
  int v75 = v74 + v73;
  int v76 = v72[v75];
  int v77 = 4;
  int v78 = v77 + v73;
  int v79 = v72[v78];
  helper0(v73, v71, v76, v79, static_cast<int>(__simt_tid3.x));
  int v80 = 8;
  int v81 = v80 + v73;
  int v82 = v72[v81];
  int v83 = 0;
  int v84;
  v84 = v83;
  switch (v82) {
    case 0:
      {
      int v85 = 12;
      int v86 = v85 + v73;
      int v87 = v72[v86];
      int v88 = 0;
      bool v89 = v87 != v88;
      int v90;
      if (v89) {
        int v91 = 2;
        v90 = v91;
      } else {
        int v92 = 0;
        int v93 = 0;
        int v94;
        int v95;
        v94 = v92;
        v95 = v93;
        while (true) {
          int v96 = 4;
          int v97 = v95 * v96;
          int v98 = v97 + v73;
          int v99 = 16;
          int v100 = v99 + v98;
          int v101 = v72[v100];
          int v102 = 0;
          bool v103 = v101 != v102;
          v94 = v94;
          v95 = v95;
          if (!v103) break;
          int v104 = v94 + v95;
          int v105 = 1;
          int v106 = v95 + v105;
          bool v107 = true;
          v94 = v104;
          v95 = v106;
          break;
          ;
        }
        v90 = v94;
      }
      v84 = v90;
      break;
    }
    default:
      {
      int v108 = 36;
      int v109 = v108 + v73;
      int v110 = v72[v109];
      int v111 = 0;
      bool v112 = v110 != v111;
      int v113;
      if (v112) {
        int v114 = 0;
        int v115 = 0;
        int v116;
        int v117;
        v116 = v114;
        v117 = v115;
        while (true) {
          int v118 = 4;
          int v119 = v117 * v118;
          int v120 = v119 + v73;
          int v121 = 40;
          int v122 = v121 + v120;
          int v123 = v72[v122];
          int v124 = 0;
          bool v125 = v123 != v124;
          v116 = v116;
          v117 = v117;
          if (!v125) break;
          int v126 = v116 + v117;
          int v127 = 1;
          int v128 = v117 + v127;
          bool v129 = true;
          v116 = v126;
          v117 = v128;
        }
        v113 = v116;
      } else {
        int v130 = 60;
        int v131 = v130 + v73;
        int v132 = v72[v131];
        int v133 = 1;
        int v134 = v73 + v133;
        int v135;
        v135 = v134;
        switch (v132) {
          default:
            {
            v135 = v73;
            break;
          }
          case 0:
            {
            int v136 = 1;
            v135 = v136;
            break;
          }
        }
        v113 = v135;
      }
      v84 = v113;
      break;
    }
  }
  uint v137 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v138 = (int)(v137);
  int v139 = 1;
  int v140 = v73 + v139;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 16; ++idx) {
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
