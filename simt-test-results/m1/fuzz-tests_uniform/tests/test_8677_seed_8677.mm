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
    int v13 = 0;
    int v14 = 0;
    int v15;
    int v16;
    v15 = v13;
    v16 = v14;
    while (true) {
      int v17 = 4;
      int v18 = v3 % v17;
      int v19 = 1;
      int v20 = v18 + v19;
      bool v21 = v16 < v20;
      v15 = v15;
      v16 = v16;
      if (!v21) break;
      int v22 = 1;
      int v23 = v16 + v22;
      v15 = v0;
      v16 = v23;
    }
    int v24 = 2;
    int v25 = v0 + v24;
    int v26 = 1;
    int v27 = v7 + v26;
    v6 = v15;
    v7 = v27;
  }
  bool v28 = true;
  int v29 = simt_wave_count_bits(v28);
  int v30 = 0;
  int v31 = v30 + v0;
  v1[v31] = v29;
  int v32 = 3;
  int v33 = v3 % v32;
  uint v34 = simt_subgroup_id(__simt_tid);
  int v35 = (int)(v34);
  int v36;
  v36 = v35;
  switch (v33) {
    case 0:
      {
      int v37 = 0;
      bool v38 = v2 != v37;
      int v39;
      if (v38) {
        int v40 = 2;
        int v41 = v3 % v40;
        int v42 = 3;
        int v43;
        v43 = v42;
        switch (v41) {
          default:
            {
            int v44 = 4;
            v43 = v44;
          }
          case 0:
            {
            v43 = v0;
            break;
          }
          case 1:
            {
            v43 = v0;
            break;
          }
        }
        int v45 = 0;
        int v46 = v0 + v45;
        v39 = v43;
      } else {
        v39 = v0;
      }
      int v47 = 1;
      v36 = v39;
    }
    default:
      {
      int v48 = 0;
      int v49 = 0;
      int v50;
      int v51;
      v50 = v48;
      v51 = v49;
      while (true) {
        int v52 = 4;
        int v53 = v3 % v52;
        int v54 = 1;
        int v55 = v53 + v54;
        bool v56 = v51 < v55;
        v50 = v50;
        v51 = v51;
        if (!v56) break;
        int v57 = 0;
        bool v58 = v2 != v57;
        int v59;
        if (v58) {
          int v60 = 3;
          v59 = v60;
        } else {
          v59 = v0;
        }
        int v61 = 1;
        int v62 = v51 + v61;
        v50 = v59;
        v51 = v62;
        continue;
        ;
      }
      int v63 = 4;
      v36 = v50;
      break;
    }
    case 1:
      {
      int v64 = 0;
      int v65 = 0;
      int v66;
      int v67;
      v66 = v64;
      v67 = v65;
      while (true) {
        int v68 = 4;
        int v69 = v3 % v68;
        int v70 = 1;
        int v71 = v69 + v70;
        bool v72 = v67 < v71;
        v66 = v66;
        v67 = v67;
        if (!v72) break;
        int v73 = 0;
        bool v74 = v2 != v73;
        int v75;
        if (v74) {
          v75 = v0;
        } else {
          int v76 = 4;
          v75 = v76;
        }
        int v77 = 1;
        int v78 = 1;
        int v79 = v67 + v78;
        v66 = v75;
        v67 = v79;
        break;
        ;
      }
      int v80 = 2;
      int v81 = v0 + v80;
      v36 = v66;
      break;
    }
    case 2:
      {
      int v82 = 1;
      v36 = v82;
      break;
    }
  }
  bool v83 = true;
  int v84 = simt_wave_count_bits(v83);
  int v85 = 16;
  int v86 = v85 + v0;
  v1[v86] = v84;
  int v87 = 0;
  bool v88 = v2 != v87;
  int v89 = v88 ? v6 : v36;
  return;
}

kernel void kernel_main(device int* v90 [[buffer(0)]], device int* v91 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v92 = static_cast<int>(__simt_tid3.x);
  int v93 = 0;
  int v94 = v93 + v92;
  int v95 = v91[v94];
  int v96 = 4;
  int v97 = v96 + v92;
  int v98 = v91[v97];
  helper0(v92, v90, v95, v98, static_cast<int>(__simt_tid3.x));
  int v99 = 4;
  int v100 = 8;
  int v101 = v100 + v92;
  int v102 = v91[v101];
  int v103 = 0;
  bool v104 = v102 != v103;
  int v105;
  if (v104) {
    int v106 = 12;
    int v107 = v106 + v92;
    int v108 = v91[v107];
    int v109 = 0;
    bool v110 = v108 != v109;
    int v111;
    if (v110) {
      int v112 = 16;
      int v113 = v112 + v92;
      int v114 = v91[v113];
      int v115 = 4;
      int v116 = v92 + v115;
      int v117;
      v117 = v116;
      switch (v114) {
        default:
          {
          int v118 = 1;
          int v119 = v92 + v118;
          v117 = v119;
          break;
        }
        case 0:
          {
          int v120 = 3;
          v117 = v120;
          break;
        }
        case 1:
          {
          int v121 = 4;
          int v122 = v92 + v121;
          v117 = v122;
          break;
        }
        case 2:
          {
          int v123 = 0;
          v117 = v123;
          break;
        }
      }
      bool v124 = true;
      v111 = v117;
    } else {
      int v125 = 20;
      int v126 = v125 + v92;
      int v127 = v91[v126];
      uint v128 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v129 = (int)(v128);
      int v130;
      v130 = v129;
      switch (v127) {
        default:
          {
          v130 = v92;
        }
        case 0:
          {
          int v131 = 1;
          v130 = v131;
          break;
        }
        case 1:
          {
          int v132 = 2;
          int v133 = v92 + v132;
          v130 = v133;
          break;
        }
      }
      bool v134 = true;
      v111 = v130;
    }
    v105 = v111;
  } else {
    int v135 = 24;
    int v136 = v135 + v92;
    int v137 = v91[v136];
    int v138 = 0;
    bool v139 = v137 != v138;
    int v140;
    if (v139) {
      int v141 = 2;
      int v142 = v92 + v141;
      v140 = v142;
    } else {
      int v143 = 28;
      int v144 = v143 + v92;
      int v145 = v91[v144];
      uint v146 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v147 = (int)(v146);
      int v148;
      v148 = v147;
      switch (v145) {
        case 0:
          {
          v148 = v92;
        }
        default:
          {
          v148 = v92;
          break;
        }
      }
      bool v149 = true;
      v140 = v148;
    }
    v105 = v140;
  }
  int v150 = 32;
  int v151 = v150 + v92;
  bool v152 = true;
  int v153 = simt_wave_count_bits(v152);
  v90[v151] = v153;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
