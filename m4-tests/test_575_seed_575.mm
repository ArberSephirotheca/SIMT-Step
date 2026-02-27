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
    int v7 = 0;
    int v8 = 0;
    int v9;
    int v10;
    v9 = v7;
    v10 = v8;
    while (true) {
      int v11 = 4;
      int v12 = v3 % v11;
      int v13 = 1;
      int v14 = v12 + v13;
      bool v15 = v10 < v14;
      v9 = v9;
      v10 = v10;
      if (!v15) break;
      int v16 = 0;
      bool v17 = v2 != v16;
      int v18;
      if (v17) {
        bool v19 = true;
        int v20 = simt_wave_count_bits(v19);
        int v21 = 0;
        int v22 = 4;
        int v23 = v10 * v22;
        int v24 = v21 + v23;
        int v25 = v24 + v0;
        v1[v25] = v20;
        v18 = v20;
      } else {
        bool v26 = true;
        int v27 = simt_wave_count_bits(v26);
        int v28 = 16;
        int v29 = 4;
        int v30 = v10 * v29;
        int v31 = v28 + v30;
        int v32 = v31 + v0;
        v1[v32] = v27;
        v18 = v27;
      }
      int v33 = 1;
      int v34 = v10 + v33;
      v9 = v18;
      v10 = v34;
      continue;
      ;
    }
    v6 = v9;
  } else {
    int v35 = 3;
    int v36 = v3 % v35;
    int v37 = 2;
    int v38;
    v38 = v37;
    switch (v36) {
      case 0:
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
          int v48 = 0;
          int v49 = v0 + v48;
          int v50 = 1;
          int v51 = v42 + v50;
          v41 = v49;
          v42 = v51;
          continue;
          ;
        }
        v38 = v41;
        break;
      }
      default:
        {
        int v52 = 0;
        int v53 = 0;
        int v54;
        int v55;
        v54 = v52;
        v55 = v53;
        while (true) {
          int v56 = 4;
          int v57 = v3 % v56;
          int v58 = 1;
          int v59 = v57 + v58;
          bool v60 = v55 < v59;
          v54 = v54;
          v55 = v55;
          if (!v60) break;
          int v61 = 1;
          int v62 = 1;
          int v63 = v55 + v62;
          v54 = v61;
          v55 = v63;
          break;
          ;
        }
        v38 = v54;
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
          int v73 = 1;
          int v74 = v0 + v73;
          int v75 = 1;
          int v76 = v67 + v75;
          v66 = v74;
          v67 = v76;
        }
        v38 = v66;
        break;
      }
    }
    bool v77 = true;
    int v78 = simt_wave_count_bits(v77);
    int v79 = 32;
    int v80 = v79 + v0;
    v1[v80] = v78;
    v6 = v38;
  }
  return;
}

kernel void kernel_main(device int* v81 [[buffer(0)]], device int* v82 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v83 = static_cast<int>(__simt_tid3.x);
  int v84 = 0;
  int v85 = v84 + v83;
  int v86 = v82[v85];
  int v87 = 4;
  int v88 = v87 + v83;
  int v89 = v82[v88];
  int v90 = 0;
  bool v91 = v86 != v90;
  if (v91) {
  } else {
    int v92 = 8;
    int v93 = v92 + v83;
    int v94 = v82[v93];
    int v95 = 0;
    bool v96 = v94 != v95;
    if (v96) {
    } else {
      helper0(v83, v81, v86, v89, static_cast<int>(__simt_tid3.x));
    }
  }
  int v97 = 0;
  int v98 = 0;
  int v99;
  int v100;
  v99 = v97;
  v100 = v98;
  while (true) {
    int v101 = 4;
    int v102 = v100 * v101;
    int v103 = v102 + v83;
    int v104 = 12;
    int v105 = v104 + v103;
    int v106 = v82[v105];
    int v107 = 0;
    bool v108 = v106 != v107;
    v99 = v99;
    v100 = v100;
    if (!v108) break;
    int v109 = 32;
    int v110 = v109 + v83;
    int v111 = v82[v110];
    int v112 = 0;
    bool v113 = v111 != v112;
    int v114;
    if (v113) {
      int v115 = 36;
      int v116 = v115 + v83;
      int v117 = v82[v116];
      int v118;
      v118 = v83;
      switch (v117) {
        case 0:
          {
          int v119 = 4;
          v118 = v119;
          break;
        }
        case 1:
          {
          int v120 = 4;
          int v121 = v83 + v120;
          v118 = v121;
          break;
        }
        case 2:
          {
          v118 = v83;
          break;
        }
        default:
          {
          int v122 = 3;
          v118 = v122;
          break;
        }
      }
      v114 = v118;
    } else {
      int v123 = 40;
      int v124 = v123 + v83;
      int v125 = v82[v124];
      int v126 = 2;
      int v127 = v83 + v126;
      int v128;
      v128 = v127;
      switch (v125) {
        case 0:
          {
          int v129 = 4;
          v128 = v129;
          break;
        }
        case 1:
          {
          v128 = v83;
          break;
        }
        default:
          {
          int v130 = 2;
          v128 = v130;
          break;
        }
      }
      bool v131 = true;
      int v132 = 48;
      int v133 = v132 + v83;
      bool v134 = true;
      int v135 = simt_wave_count_bits(v134);
      v81[v133] = v135;
      v114 = v128;
    }
    int v136 = 64;
    int v137 = v136 + v83;
    bool v138 = true;
    int v139 = simt_wave_count_bits(v138);
    v81[v137] = v139;
    int v140 = v99 + v114;
    int v141 = 1;
    int v142 = v100 + v141;
    bool v143 = true;
    int v144 = 80;
    int v145 = 4;
    int v146 = v100 * v145;
    int v147 = v144 + v146;
    int v148 = v147 + v83;
    bool v149 = true;
    int v150 = simt_wave_count_bits(v149);
    v81[v148] = v150;
    v99 = v140;
    v100 = v142;
  }
  uint v151 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v152 = (int)(v151);
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(2), static_cast<int32_t>(4), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 88; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 44; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
