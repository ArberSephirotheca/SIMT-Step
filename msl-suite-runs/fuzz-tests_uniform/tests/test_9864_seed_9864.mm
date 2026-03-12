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
    int v13 = 3;
    int v14 = v3 % v13;
    uint v15 = simt_subgroup_id(__simt_tid);
    int v16 = (int)(v15);
    int v17;
    v17 = v16;
    switch (v14) {
      case 0:
        {
        int v18 = 3;
        int v19 = v3 % v18;
        int v20;
        v20 = v0;
        switch (v19) {
          default:
            {
            int v21 = 3;
            int v22 = v0 + v21;
            v20 = v22;
            break;
          }
          case 0:
            {
            v20 = v0;
            break;
          }
          case 1:
            {
            v20 = v0;
            break;
          }
        }
        int v23 = 0;
        int v24 = v0 + v23;
        v17 = v20;
      }
      case 1:
        {
        int v25 = 0;
        int v26 = 0;
        int v27;
        int v28;
        v27 = v25;
        v28 = v26;
        while (true) {
          int v29 = 4;
          int v30 = v3 % v29;
          int v31 = 1;
          int v32 = v30 + v31;
          bool v33 = v28 < v32;
          v27 = v27;
          v28 = v28;
          if (!v33) break;
          int v34 = 1;
          int v35 = v0 + v34;
          int v36 = 1;
          int v37 = v28 + v36;
          v27 = v35;
          v28 = v37;
          continue;
          ;
        }
        int v38 = 4;
        v17 = v27;
        break;
      }
      default:
        {
        int v39 = 0;
        int v40 = 0;
        int v41;
        int v42;
        v41 = v39;
        v42 = v40;
        while (true) {
          int v43 = 4;
          int v44 = v3 % v43;
          int v45 = 1;
          int v46 = v44 + v45;
          bool v47 = v42 < v46;
          v41 = v41;
          v42 = v42;
          if (!v47) break;
          int v48 = 1;
          int v49 = v42 + v48;
          v41 = v0;
          v42 = v49;
        }
        int v50 = 1;
        int v51 = v0 + v50;
        v17 = v41;
        break;
      }
      case 2:
        {
        int v52 = 0;
        bool v53 = v2 != v52;
        int v54;
        if (v53) {
          int v55 = 3;
          int v56 = v0 + v55;
          v54 = v56;
        } else {
          int v57 = 1;
          v54 = v57;
        }
        int v58 = 0;
        v17 = v54;
        break;
      }
    }
    int v59 = 3;
    int v60 = v0 + v59;
    int v61 = 1;
    int v62 = v7 + v61;
    v6 = v17;
    v7 = v62;
    continue;
    ;
  }
  bool v63 = true;
  int v64 = simt_wave_count_bits(v63);
  int v65 = 0;
  int v66 = v65 + v0;
  v1[v66] = v64;
  return;
}

kernel void kernel_main(device int* v67 [[buffer(0)]], device int* v68 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v69 = static_cast<int>(__simt_tid3.x);
  int v70 = 0;
  int v71 = v70 + v69;
  int v72 = v68[v71];
  int v73 = 4;
  int v74 = v73 + v69;
  int v75 = v68[v74];
  helper0(v69, v67, v72, v75, static_cast<int>(__simt_tid3.x));
  int v76 = 8;
  int v77 = v76 + v69;
  int v78 = v68[v77];
  uint v79 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v80 = (int)(v79);
  int v81;
  v81 = v80;
  switch (v78) {
    case 0:
      {
      int v82 = 12;
      int v83 = v82 + v69;
      int v84 = v68[v83];
      int v85 = 0;
      bool v86 = v84 != v85;
      int v87;
      if (v86) {
        int v88 = 16;
        int v89 = v88 + v69;
        int v90 = v68[v89];
        int v91 = 4;
        int v92;
        v92 = v91;
        switch (v90) {
          case 0:
            {
            int v93 = 1;
            int v94 = v69 + v93;
            v92 = v94;
          }
          case 1:
            {
            int v95 = 2;
            int v96 = v69 + v95;
            v92 = v96;
          }
          default:
            {
            int v97 = 1;
            v92 = v97;
            break;
          }
        }
        bool v98 = true;
        v87 = v92;
      } else {
        int v99 = 20;
        int v100 = v99 + v69;
        int v101 = v68[v100];
        int v102 = 0;
        bool v103 = v101 != v102;
        int v104;
        if (v103) {
          int v105 = 0;
          v104 = v105;
        } else {
          int v106 = 1;
          v104 = v106;
        }
        v87 = v104;
      }
      v81 = v87;
      break;
    }
    default:
      {
      int v107 = 24;
      int v108 = v107 + v69;
      int v109 = v68[v108];
      int v110 = 0;
      bool v111 = v109 != v110;
      int v112;
      if (v111) {
        int v113 = 1;
        v112 = v113;
      } else {
        int v114 = 0;
        int v115 = 0;
        int v116;
        int v117;
        v116 = v114;
        v117 = v115;
        while (true) {
          int v118 = 4;
          int v119 = v117 * v118;
          int v120 = v119 + v69;
          int v121 = 28;
          int v122 = v121 + v120;
          int v123 = v68[v122];
          int v124 = 0;
          bool v125 = v123 != v124;
          v116 = v116;
          v117 = v117;
          if (!v125) break;
          int v126 = v116 + v117;
          int v127 = 1;
          int v128 = v117 + v127;
          v116 = v126;
          v117 = v128;
        }
        bool v129 = true;
        v112 = v116;
      }
      v81 = v112;
      break;
    }
  }
  bool v130 = true;
  int v131 = 16;
  int v132 = v131 + v69;
  bool v133 = true;
  int v134 = simt_wave_count_bits(v133);
  v67[v132] = v134;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 48; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
