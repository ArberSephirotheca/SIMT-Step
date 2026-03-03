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
  int v4;
  v4 = v0;
  switch (v3) {
    case 0:
      {
      int v5 = 0;
      v4 = v5;
      break;
    }
    default:
      {
      int v6 = 0;
      int v7 = 0;
      int v8;
      int v9;
      v8 = v6;
      v9 = v7;
      while (true) {
        int v10 = 4;
        int v11 = v3 % v10;
        int v12 = 1;
        int v13 = v11 + v12;
        bool v14 = v9 < v13;
        v8 = v8;
        v9 = v9;
        if (!v14) break;
        int v15 = 2;
        int v16 = v0 + v15;
        int v17 = 1;
        int v18 = v9 + v17;
        v8 = v16;
        v9 = v18;
        break;
        ;
      }
      int v19 = 2;
      int v20 = v0 + v19;
      v4 = v8;
      break;
    }
  }
  bool v21 = true;
  int v22 = simt_wave_count_bits(v21);
  int v23 = 0;
  int v24 = v23 + v0;
  v1[v24] = v22;
  int v25 = 0;
  bool v26 = v2 != v25;
  int v27;
  if (v26) {
    int v28 = 0;
    bool v29 = v2 != v28;
    int v30;
    if (v29) {
      int v31 = 0;
      bool v32 = v2 != v31;
      int v33;
      if (v32) {
        v33 = v0;
      } else {
        v33 = v0;
      }
      v30 = v33;
    } else {
      int v34 = 2;
      int v35 = v3 % v34;
      int v36;
      v36 = v0;
      switch (v35) {
        case 0:
          {
          int v37 = 2;
          int v38 = v0 + v37;
          v36 = v38;
          break;
        }
        default:
          {
          int v39 = 4;
          v36 = v39;
          break;
        }
        case 1:
          {
          v36 = v0;
          break;
        }
      }
      uint v40 = simt_subgroup_id(__simt_tid);
      int v41 = (int)(v40);
      v30 = v36;
    }
    uint v42 = simt_lane_id(__simt_tid);
    int v43 = (int)(v42);
    v27 = v30;
  } else {
    int v44 = 0;
    bool v45 = v2 != v44;
    int v46;
    if (v45) {
      int v47 = 0;
      int v48 = 0;
      int v49;
      int v50;
      v49 = v47;
      v50 = v48;
      while (true) {
        int v51 = 4;
        int v52 = v3 % v51;
        int v53 = 1;
        int v54 = v52 + v53;
        bool v55 = v50 < v54;
        v49 = v49;
        v50 = v50;
        if (!v55) break;
        int v56 = 1;
        int v57 = v50 + v56;
        v49 = v0;
        v50 = v57;
      }
      int v58 = 0;
      v46 = v49;
    } else {
      int v59 = 3;
      int v60 = v3 % v59;
      uint v61 = simt_lane_id(__simt_tid);
      int v62 = (int)(v61);
      int v63;
      v63 = v62;
      switch (v60) {
        case 0:
          {
          v63 = v0;
          break;
        }
        case 1:
          {
          int v64 = 3;
          v63 = v64;
          break;
        }
        case 2:
          {
          int v65 = 2;
          int v66 = v0 + v65;
          v63 = v66;
          break;
        }
        default:
          {
          v63 = v0;
          break;
        }
      }
      int v67 = 2;
      v46 = v63;
    }
    uint v68 = simt_lane_id(__simt_tid);
    int v69 = (int)(v68);
    v27 = v46;
  }
  bool v70 = true;
  int v71 = simt_wave_count_bits(v70);
  int v72 = 16;
  int v73 = v72 + v0;
  v1[v73] = v71;
  int v74 = 0;
  bool v75 = v2 != v74;
  int v76 = v75 ? v4 : v27;
  return;
}

kernel void kernel_main(device int* v77 [[buffer(0)]], device int* v78 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v79 = static_cast<int>(__simt_tid3.x);
  int v80 = 0;
  int v81 = v80 + v79;
  int v82 = v78[v81];
  int v83 = 4;
  int v84 = v83 + v79;
  int v85 = v78[v84];
  helper0(v79, v77, v82, v85, static_cast<int>(__simt_tid3.x));
  uint v86 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v87 = (int)(v86);
  int v88 = 8;
  int v89 = v88 + v79;
  int v90 = v78[v89];
  uint v91 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v92 = (int)(v91);
  int v93;
  v93 = v92;
  switch (v90) {
    default:
      {
      int v94 = 12;
      int v95 = v94 + v79;
      int v96 = v78[v95];
      int v97 = 0;
      bool v98 = v96 != v97;
      int v99;
      if (v98) {
        int v100 = 16;
        int v101 = v100 + v79;
        int v102 = v78[v101];
        int v103 = 0;
        bool v104 = v102 != v103;
        int v105;
        if (v104) {
          int v106 = 0;
          int v107 = v79 + v106;
          v105 = v107;
        } else {
          int v108 = 1;
          int v109 = v79 + v108;
          v105 = v109;
        }
        v99 = v105;
      } else {
        int v110 = 20;
        int v111 = v110 + v79;
        int v112 = v78[v111];
        int v113 = 2;
        int v114 = v79 + v113;
        int v115;
        v115 = v114;
        switch (v112) {
          default:
            {
            int v116 = 2;
            v115 = v116;
            break;
          }
          case 0:
            {
            int v117 = 0;
            v115 = v117;
            break;
          }
          case 1:
            {
            int v118 = 2;
            v115 = v118;
            break;
          }
          case 2:
            {
            int v119 = 0;
            v115 = v119;
            break;
          }
        }
        bool v120 = true;
        v99 = v115;
      }
      v93 = v99;
      break;
    }
    case 0:
      {
      int v121 = 24;
      int v122 = v121 + v79;
      int v123 = v78[v122];
      int v124 = 0;
      bool v125 = v123 != v124;
      int v126;
      if (v125) {
        int v127 = 28;
        int v128 = v127 + v79;
        int v129 = v78[v128];
        int v130 = 1;
        int v131;
        v131 = v130;
        switch (v129) {
          case 0:
            {
            v131 = v79;
            break;
          }
          case 1:
            {
            int v132 = 0;
            v131 = v132;
            break;
          }
          default:
            {
            int v133 = 2;
            v131 = v133;
            break;
          }
          case 2:
            {
            int v134 = 1;
            v131 = v134;
            break;
          }
        }
        bool v135 = true;
        v126 = v131;
      } else {
        v126 = v79;
      }
      v93 = v126;
      break;
    }
  }
  bool v136 = true;
  int v137 = 32;
  int v138 = v137 + v79;
  bool v139 = true;
  int v140 = simt_wave_count_bits(v139);
  v77[v138] = v140;
  int v141 = 3;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 32; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
