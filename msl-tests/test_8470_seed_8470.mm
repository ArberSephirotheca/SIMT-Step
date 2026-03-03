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
  int v4 = 1;
  int v5 = v0 + v4;
  int v6 = 0;
  bool v7 = v2 != v6;
  int v8;
  if (v7) {
    int v9 = 0;
    bool v10 = v2 != v9;
    int v11;
    if (v10) {
      uint v12 = simt_subgroup_id(__simt_tid);
      int v13 = (int)(v12);
      v11 = v13;
    } else {
      int v14 = 0;
      int v15 = 0;
      int v16;
      int v17;
      v16 = v14;
      v17 = v15;
      while (true) {
        int v18 = 4;
        int v19 = v3 % v18;
        int v20 = 1;
        int v21 = v19 + v20;
        bool v22 = v17 < v21;
        v16 = v16;
        v17 = v17;
        if (!v22) break;
        uint v23 = simt_subgroup_id(__simt_tid);
        int v24 = (int)(v23);
        int v25 = 1;
        int v26 = v17 + v25;
        v16 = v24;
        v17 = v26;
      }
      uint v27 = simt_subgroup_id(__simt_tid);
      int v28 = (int)(v27);
      v11 = v16;
    }
    int v29 = 1;
    v8 = v11;
  } else {
    int v30 = 0;
    int v31 = 0;
    int v32;
    int v33;
    v32 = v30;
    v33 = v31;
    while (true) {
      int v34 = 4;
      int v35 = v3 % v34;
      int v36 = 1;
      int v37 = v35 + v36;
      bool v38 = v33 < v37;
      v32 = v32;
      v33 = v33;
      if (!v38) break;
      int v39 = 3;
      int v40 = v3 % v39;
      int v41 = 0;
      int v42 = v0 + v41;
      int v43;
      v43 = v42;
      switch (v40) {
        case 0:
          {
          v43 = v0;
          break;
        }
        case 1:
          {
          int v44 = 1;
          int v45 = v0 + v44;
          v43 = v45;
          break;
        }
        default:
          {
          int v46 = 4;
          int v47 = v0 + v46;
          v43 = v47;
          break;
        }
        case 2:
          {
          v43 = v0;
          break;
        }
      }
      uint v48 = simt_lane_id(__simt_tid);
      int v49 = (int)(v48);
      int v50 = 1;
      int v51 = v33 + v50;
      v32 = v43;
      v33 = v51;
    }
    int v52 = 1;
    int v53 = v0 + v52;
    v8 = v32;
  }
  bool v54 = true;
  int v55 = simt_wave_count_bits(v54);
  int v56 = 0;
  int v57 = v56 + v0;
  v1[v57] = v55;
  int v58 = 0;
  bool v59 = v2 != v58;
  int v60 = v59 ? v5 : v8;
  return;
}

kernel void kernel_main(device int* v61 [[buffer(0)]], device int* v62 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v63 = static_cast<int>(__simt_tid3.x);
  int v64 = 0;
  int v65 = v64 + v63;
  int v66 = v62[v65];
  int v67 = 4;
  int v68 = v67 + v63;
  int v69 = v62[v68];
  helper0(v63, v61, v66, v69, static_cast<int>(__simt_tid3.x));
  int v70 = 8;
  int v71 = v70 + v63;
  int v72 = v62[v71];
  uint v73 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v74 = (int)(v73);
  int v75;
  v75 = v74;
  switch (v72) {
    default:
      {
      int v76 = 12;
      int v77 = v76 + v63;
      int v78 = v62[v77];
      int v79 = 3;
      int v80;
      v80 = v79;
      switch (v78) {
        default:
          {
          int v81 = 16;
          int v82 = v81 + v63;
          int v83 = v62[v82];
          int v84 = 0;
          bool v85 = v83 != v84;
          int v86;
          if (v85) {
            v86 = v63;
          } else {
            int v87 = 2;
            v86 = v87;
          }
          v80 = v86;
          break;
        }
        case 0:
          {
          int v88 = 0;
          int v89 = 0;
          int v90;
          int v91;
          v90 = v88;
          v91 = v89;
          while (true) {
            int v92 = 4;
            int v93 = v91 * v92;
            int v94 = v93 + v63;
            int v95 = 20;
            int v96 = v95 + v94;
            int v97 = v62[v96];
            int v98 = 0;
            bool v99 = v97 != v98;
            v90 = v90;
            v91 = v91;
            if (!v99) break;
            int v100 = v90 + v91;
            int v101 = 1;
            int v102 = v91 + v101;
            v90 = v100;
            v91 = v102;
          }
          bool v103 = true;
          v80 = v90;
          break;
        }
      }
      bool v104 = true;
      v75 = v80;
      break;
    }
    case 0:
      {
      int v105 = 40;
      int v106 = v105 + v63;
      int v107 = v62[v106];
      int v108 = 0;
      int v109;
      v109 = v108;
      switch (v107) {
        default:
          {
          int v110 = 0;
          v109 = v110;
        }
        case 0:
          {
          int v111 = 44;
          int v112 = v111 + v63;
          int v113 = v62[v112];
          int v114 = 0;
          bool v115 = v113 != v114;
          int v116;
          if (v115) {
            int v117 = 3;
            v116 = v117;
          } else {
            int v118 = 0;
            v116 = v118;
          }
          v109 = v116;
        }
        case 1:
          {
          int v119 = 0;
          int v120 = 0;
          int v121;
          int v122;
          v121 = v119;
          v122 = v120;
          while (true) {
            int v123 = 4;
            int v124 = v122 * v123;
            int v125 = v124 + v63;
            int v126 = 48;
            int v127 = v126 + v125;
            int v128 = v62[v127];
            int v129 = 0;
            bool v130 = v128 != v129;
            v121 = v121;
            v122 = v122;
            if (!v130) break;
            int v131 = v121 + v122;
            int v132 = 1;
            int v133 = v122 + v132;
            v121 = v131;
            v122 = v133;
          }
          bool v134 = true;
          v109 = v121;
          break;
        }
      }
      bool v135 = true;
      v75 = v109;
      break;
    }
  }
  bool v136 = true;
  int v137 = 16;
  int v138 = v137 + v63;
  bool v139 = true;
  int v140 = simt_wave_count_bits(v139);
  v61[v138] = v140;
  int v141 = 4;
  int v142 = v63 + v141;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
