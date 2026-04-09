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
  int v22 = 4;
  int v23 = v3 % v22;
  uint v24 = simt_lane_id(__simt_tid);
  int v25 = (int)(v24);
  int v26;
  v26 = v25;
  switch (v23) {
    default:
      {
      int v27 = 4;
      v26 = v27;
      break;
    }
    case 0:
      {
      int v28 = 3;
      int v29 = v3 % v28;
      int v30 = 4;
      int v31 = v0 + v30;
      int v32;
      v32 = v31;
      switch (v29) {
        default:
          {
          v32 = v0;
          break;
        }
        case 0:
          {
          int v33 = 0;
          int v34 = 0;
          int v35;
          int v36;
          v35 = v33;
          v36 = v34;
          while (true) {
            int v37 = 4;
            int v38 = v3 % v37;
            int v39 = 1;
            int v40 = v38 + v39;
            bool v41 = v36 < v40;
            v35 = v35;
            v36 = v36;
            if (!v41) break;
            int v42 = 1;
            int v43 = v36 + v42;
            v35 = v0;
            v36 = v43;
          }
          v32 = v35;
          break;
        }
        case 1:
          {
          int v44 = 0;
          int v45 = 0;
          int v46;
          int v47;
          v46 = v44;
          v47 = v45;
          while (true) {
            int v48 = 4;
            int v49 = v3 % v48;
            int v50 = 1;
            int v51 = v49 + v50;
            bool v52 = v47 < v51;
            v46 = v46;
            v47 = v47;
            if (!v52) break;
            int v53 = 2;
            int v54 = v0 + v53;
            int v55 = 1;
            int v56 = v47 + v55;
            v46 = v54;
            v47 = v56;
            break;
            ;
          }
          v32 = v46;
          break;
        }
        case 2:
          {
          int v57 = 2;
          v32 = v57;
          break;
        }
      }
      v26 = v32;
      break;
    }
    case 1:
      {
      int v58 = 0;
      int v59 = 0;
      int v60;
      int v61;
      v60 = v58;
      v61 = v59;
      while (true) {
        int v62 = 4;
        int v63 = v3 % v62;
        int v64 = 1;
        int v65 = v63 + v64;
        bool v66 = v61 < v65;
        v60 = v60;
        v61 = v61;
        if (!v66) break;
        int v67 = 1;
        int v68 = v61 + v67;
        v60 = v0;
        v61 = v68;
      }
      v26 = v60;
      break;
    }
    case 2:
      {
      int v69 = 4;
      int v70 = v0 + v69;
      int v71;
      v71 = v70;
      switch (v3) {
        default:
          {
          int v72 = 2;
          v71 = v72;
          break;
        }
        case 0:
          {
          int v73 = 0;
          int v74 = 0;
          int v75;
          int v76;
          v75 = v73;
          v76 = v74;
          while (true) {
            int v77 = 4;
            int v78 = v3 % v77;
            int v79 = 1;
            int v80 = v78 + v79;
            bool v81 = v76 < v80;
            v75 = v75;
            v76 = v76;
            if (!v81) break;
            int v82 = 2;
            int v83 = v0 + v82;
            int v84 = 1;
            int v85 = v76 + v84;
            v75 = v83;
            v76 = v85;
          }
          v71 = v75;
          break;
        }
      }
      v26 = v71;
      break;
    }
  }
  int v86 = 0;
  bool v87 = v2 != v86;
  int v88 = v87 ? v6 : v26;
  return;
}

kernel void kernel_main(device int* v89 [[buffer(0)]], device int* v90 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v91 = static_cast<int>(__simt_tid3.x);
  int v92 = 0;
  int v93 = v92 + v91;
  int v94 = v90[v93];
  int v95 = 4;
  int v96 = v95 + v91;
  int v97 = v90[v96];
  int v98 = 0;
  bool v99 = v94 != v98;
  if (v99) {
    int v100 = 8;
    int v101 = v100 + v91;
    int v102 = v90[v101];
    int v103 = 0;
    bool v104 = v102 != v103;
    if (v104) {
    } else {
      helper0(v91, v89, v94, v97, static_cast<int>(__simt_tid3.x));
    }
  } else {
  }
  int v105 = 12;
  int v106 = v105 + v91;
  int v107 = v90[v106];
  int v108 = 0;
  bool v109 = v107 != v108;
  int v110;
  if (v109) {
    int v111 = 0;
    v110 = v111;
  } else {
    int v112 = 16;
    int v113 = v112 + v91;
    int v114 = v90[v113];
    int v115 = 4;
    int v116 = v91 + v115;
    int v117;
    v117 = v116;
    switch (v114) {
      case 0:
        {
        int v118 = 0;
        int v119 = v91 + v118;
        v117 = v119;
      }
      case 1:
        {
        int v120 = 20;
        int v121 = v120 + v91;
        int v122 = v90[v121];
        int v123 = 0;
        bool v124 = v122 != v123;
        int v125;
        if (v124) {
          int v126 = 1;
          int v127 = v91 + v126;
          v125 = v127;
        } else {
          v125 = v91;
        }
        v117 = v125;
      }
      default:
        {
        int v128 = 24;
        int v129 = v128 + v91;
        int v130 = v90[v129];
        int v131 = 0;
        bool v132 = v130 != v131;
        int v133;
        if (v132) {
          int v134 = 3;
          v133 = v134;
        } else {
          int v135 = 2;
          int v136 = v91 + v135;
          v133 = v136;
        }
        v117 = v133;
        break;
      }
    }
    v110 = v117;
  }
  int v137 = 16;
  int v138 = v137 + v91;
  bool v139 = true;
  int v140 = simt_wave_count_bits(v139);
  v89[v138] = v140;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 28; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
