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
      int v16 = 3;
      int v17 = v3 % v16;
      uint v18 = simt_subgroup_id(__simt_tid);
      int v19 = (int)(v18);
      int v20;
      v20 = v19;
      switch (v17) {
        default:
          {
          int v21 = 4;
          int v22 = v0 + v21;
          v20 = v22;
          break;
        }
        case 0:
          {
          int v23 = 0;
          int v24 = v0 + v23;
          v20 = v24;
        }
        case 1:
          {
          int v25 = 2;
          int v26 = v0 + v25;
          v20 = v26;
          break;
        }
      }
      int v27 = 1;
      int v28 = v10 + v27;
      v9 = v20;
      v10 = v28;
      continue;
      ;
    }
    v6 = v9;
  } else {
    int v29 = 2;
    int v30 = v3 % v29;
    int v31 = 0;
    int v32 = v0 + v31;
    int v33;
    v33 = v32;
    switch (v30) {
      default:
        {
        int v34 = 3;
        int v35 = v3 % v34;
        int v36 = 0;
        int v37;
        v37 = v36;
        switch (v35) {
          case 0:
            {
            int v38 = 2;
            int v39 = v0 + v38;
            v37 = v39;
            break;
          }
          default:
            {
            int v40 = 0;
            int v41 = v0 + v40;
            v37 = v41;
            break;
          }
          case 1:
            {
            int v42 = 1;
            int v43 = v0 + v42;
            v37 = v43;
            break;
          }
        }
        v33 = v37;
        break;
      }
      case 0:
        {
        int v44 = 0;
        bool v45 = v2 != v44;
        int v46;
        if (v45) {
          v46 = v0;
        } else {
          int v47 = 2;
          v46 = v47;
        }
        v33 = v46;
      }
      case 1:
        {
        int v48 = 0;
        bool v49 = v2 != v48;
        int v50;
        if (v49) {
          int v51 = 3;
          int v52 = v0 + v51;
          v50 = v52;
        } else {
          int v53 = 1;
          int v54 = v0 + v53;
          v50 = v54;
        }
        v33 = v50;
        break;
      }
    }
    bool v55 = true;
    int v56 = simt_wave_count_bits(v55);
    int v57 = 0;
    int v58 = v57 + v0;
    v1[v58] = v56;
    v6 = v33;
  }
  return;
}

kernel void kernel_main(device int* v59 [[buffer(0)]], device int* v60 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v61 = static_cast<int>(__simt_tid3.x);
  int v62 = 0;
  int v63 = v62 + v61;
  int v64 = v60[v63];
  int v65 = 4;
  int v66 = v65 + v61;
  int v67 = v60[v66];
  int v68 = 0;
  bool v69 = v64 != v68;
  if (v69) {
  } else {
    int v70 = 8;
    int v71 = v70 + v61;
    int v72 = v60[v71];
    int v73 = 0;
    bool v74 = v72 != v73;
    if (v74) {
    } else {
      int v75 = 3;
      int v76 = v61 % v75;
      int v77 = 0;
      int v78;
      v78 = v77;
      switch (v76) {
        case 0:
          {
          int v79 = 2;
          int v80 = v78 + v79;
          v78 = v80;
          break;
        }
        case 1:
          {
          int v81 = 3;
          int v82 = v78 + v81;
          v78 = v82;
          break;
        }
        default:
          {
          int v83 = 1;
          int v84 = v78 + v83;
          v78 = v84;
          break;
        }
        case 2:
          {
          int v85 = 2;
          int v86 = v78 + v85;
          v78 = v86;
          break;
        }
      }
      helper0(v61, v59, v64, v67, static_cast<int>(__simt_tid3.x));
    }
  }
  int v87 = 0;
  int v88 = 0;
  int v89;
  int v90;
  v89 = v87;
  v90 = v88;
  while (true) {
    int v91 = 4;
    int v92 = v90 * v91;
    int v93 = v92 + v61;
    int v94 = 12;
    int v95 = v94 + v93;
    int v96 = v60[v95];
    int v97 = 0;
    bool v98 = v96 != v97;
    v89 = v89;
    v90 = v90;
    if (!v98) break;
    int v99 = v89 + v90;
    int v100 = 1;
    int v101 = v90 + v100;
    bool v102 = true;
    int v103 = 16;
    int v104 = 4;
    int v105 = v90 * v104;
    int v106 = v103 + v105;
    int v107 = v106 + v61;
    bool v108 = true;
    int v109 = simt_wave_count_bits(v108);
    v59[v107] = v109;
    v89 = v99;
    v90 = v101;
  }
  int v110 = 32;
  int v111 = v110 + v61;
  int v112 = v60[v111];
  int v113 = 0;
  bool v114 = v112 != v113;
  int v115;
  if (v114) {
    uint v116 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v117 = (int)(v116);
    v115 = v117;
  } else {
    int v118 = 0;
    int v119 = 0;
    int v120;
    int v121;
    v120 = v118;
    v121 = v119;
    while (true) {
      int v122 = 4;
      int v123 = v121 * v122;
      int v124 = v123 + v61;
      int v125 = 36;
      int v126 = v125 + v124;
      int v127 = v60[v126];
      int v128 = 0;
      bool v129 = v127 != v128;
      v120 = v120;
      v121 = v121;
      if (!v129) break;
      int v130 = v120 + v121;
      int v131 = 1;
      int v132 = v121 + v131;
      bool v133 = true;
      int v134 = 32;
      int v135 = 4;
      int v136 = v121 * v135;
      int v137 = v134 + v136;
      int v138 = v137 + v61;
      bool v139 = true;
      int v140 = simt_wave_count_bits(v139);
      v59[v138] = v140;
      v120 = v130;
      v121 = v132;
    }
    v115 = v120;
  }
  int v141 = 48;
  int v142 = v141 + v61;
  bool v143 = true;
  int v144 = simt_wave_count_bits(v143);
  v59[v142] = v144;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 56; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
