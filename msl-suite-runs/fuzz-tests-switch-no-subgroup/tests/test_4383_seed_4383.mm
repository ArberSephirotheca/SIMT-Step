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
    int v7 = 4;
    int v8 = v3 % v7;
    uint v9 = simt_subgroup_id(__simt_tid);
    int v10 = (int)(v9);
    int v11;
    v11 = v10;
    switch (v8) {
      default:
        {
        int v12 = 0;
        bool v13 = v2 != v12;
        int v14;
        if (v13) {
          int v15 = 0;
          int v16 = v0 + v15;
          v14 = v16;
        } else {
          int v17 = 0;
          v14 = v17;
        }
        v11 = v14;
      }
      case 0:
        {
        int v18 = 0;
        bool v19 = v2 != v18;
        int v20;
        if (v19) {
          v20 = v0;
        } else {
          int v21 = 4;
          int v22 = v0 + v21;
          v20 = v22;
        }
        v11 = v20;
      }
      case 1:
        {
        int v23 = 3;
        int v24 = v3 % v23;
        int v25;
        v25 = v0;
        switch (v24) {
          case 0:
            {
            int v26 = 2;
            v25 = v26;
          }
          default:
            {
            v25 = v0;
          }
          case 1:
            {
            v25 = v0;
            break;
          }
        }
        int v27 = 1;
        v11 = v25;
      }
      case 2:
        {
        int v28 = 2;
        int v29 = v0 + v28;
        v11 = v29;
        break;
      }
    }
    v6 = v11;
  } else {
    int v30 = 3;
    int v31 = v3 % v30;
    uint v32 = simt_subgroup_id(__simt_tid);
    int v33 = (int)(v32);
    int v34;
    v34 = v33;
    switch (v31) {
      default:
        {
        int v35 = 2;
        int v36;
        v36 = v35;
        switch (v3) {
          default:
            {
            int v37 = 2;
            int v38 = v0 + v37;
            v36 = v38;
            break;
          }
          case 0:
            {
            int v39 = 0;
            int v40 = v0 + v39;
            v36 = v40;
            break;
          }
        }
        v34 = v36;
      }
      case 0:
        {
        int v41 = 0;
        bool v42 = v2 != v41;
        int v43;
        if (v42) {
          int v44 = 1;
          int v45 = v0 + v44;
          v43 = v45;
        } else {
          int v46 = 4;
          int v47 = v0 + v46;
          v43 = v47;
        }
        v34 = v43;
        break;
      }
      case 1:
        {
        int v48 = 1;
        int v49 = v0 + v48;
        v34 = v49;
        break;
      }
    }
    v6 = v34;
  }
  bool v50 = true;
  int v51 = simt_wave_count_bits(v50);
  int v52 = 0;
  int v53 = v52 + v0;
  v1[v53] = v51;
  return;
}

kernel void kernel_main(device int* v54 [[buffer(0)]], device int* v55 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v56 = static_cast<int>(__simt_tid3.x);
  int v57 = 0;
  int v58 = v57 + v56;
  int v59 = v55[v58];
  int v60 = 4;
  int v61 = v60 + v56;
  int v62 = v55[v61];
  int v63 = 0;
  bool v64 = v59 != v63;
  if (v64) {
  } else {
    int v65 = 8;
    int v66 = v65 + v56;
    int v67 = v55[v66];
    int v68 = 0;
    bool v69 = v67 != v68;
    if (v69) {
    } else {
      helper0(v56, v54, v59, v62, static_cast<int>(__simt_tid3.x));
    }
  }
  int v70 = 2;
  int v71 = v56 + v70;
  int v72 = 0;
  int v73 = 0;
  int v74;
  int v75;
  v74 = v72;
  v75 = v73;
  while (true) {
    int v76 = 4;
    int v77 = v75 * v76;
    int v78 = v77 + v56;
    int v79 = 12;
    int v80 = v79 + v78;
    int v81 = v55[v80];
    int v82 = 0;
    bool v83 = v81 != v82;
    v74 = v74;
    v75 = v75;
    if (!v83) break;
    int v84 = 32;
    int v85 = v84 + v56;
    int v86 = v55[v85];
    int v87 = 4;
    int v88;
    v88 = v87;
    switch (v86) {
      case 0:
        {
        int v89 = 36;
        int v90 = v89 + v56;
        int v91 = v55[v90];
        int v92 = 0;
        int v93;
        v93 = v92;
        switch (v91) {
          default:
            {
            v93 = v56;
            break;
          }
          case 0:
            {
            v93 = v56;
            break;
          }
          case 1:
            {
            int v94 = 2;
            int v95 = v56 + v94;
            v93 = v95;
            break;
          }
        }
        v88 = v93;
      }
      default:
        {
        int v96 = 40;
        int v97 = v96 + v56;
        int v98 = v55[v97];
        int v99 = 4;
        int v100;
        v100 = v99;
        switch (v98) {
          case 0:
            {
            v100 = v56;
          }
          case 1:
            {
            v100 = v56;
            break;
          }
          default:
            {
            int v101 = 2;
            v100 = v101;
            break;
          }
          case 2:
            {
            v100 = v56;
            break;
          }
        }
        v88 = v100;
        break;
      }
      case 1:
        {
        int v102 = 3;
        int v103 = v56 + v102;
        v88 = v103;
        break;
      }
    }
    int v104 = v74 + v88;
    int v105 = 1;
    int v106 = v75 + v105;
    bool v107 = true;
    int v108 = 16;
    int v109 = 4;
    int v110 = v75 * v109;
    int v111 = v108 + v110;
    int v112 = v111 + v56;
    bool v113 = true;
    int v114 = simt_wave_count_bits(v113);
    v54[v112] = v114;
    v74 = v104;
    v75 = v106;
    continue;
    ;
  }
  int v115 = 44;
  int v116 = v115 + v56;
  int v117 = v55[v116];
  int v118 = 0;
  bool v119 = v117 != v118;
  int v120;
  if (v119) {
    int v121 = 1;
    v120 = v121;
  } else {
    int v122 = 48;
    int v123 = v122 + v56;
    int v124 = v55[v123];
    int v125 = 4;
    int v126;
    v126 = v125;
    switch (v124) {
      case 0:
        {
        int v127 = 0;
        int v128 = 0;
        int v129;
        int v130;
        v129 = v127;
        v130 = v128;
        while (true) {
          int v131 = 4;
          int v132 = v130 * v131;
          int v133 = v132 + v56;
          int v134 = 52;
          int v135 = v134 + v133;
          int v136 = v55[v135];
          int v137 = 0;
          bool v138 = v136 != v137;
          v129 = v129;
          v130 = v130;
          if (!v138) break;
          int v139 = v129 + v130;
          int v140 = 1;
          int v141 = v130 + v140;
          bool v142 = true;
          v129 = v139;
          v130 = v141;
        }
        v126 = v129;
      }
      case 1:
        {
        int v143 = 1;
        v126 = v143;
        break;
      }
      default:
        {
        int v144 = 72;
        int v145 = v144 + v56;
        int v146 = v55[v145];
        int v147 = 0;
        bool v148 = v146 != v147;
        int v149;
        if (v148) {
          int v150 = 4;
          v149 = v150;
        } else {
          int v151 = 2;
          v149 = v151;
        }
        v126 = v149;
        break;
      }
    }
    bool v152 = true;
    int v153 = 32;
    int v154 = v153 + v56;
    bool v155 = true;
    int v156 = simt_wave_count_bits(v155);
    v54[v154] = v156;
    v120 = v126;
  }
  int v157 = 48;
  int v158 = v157 + v56;
  bool v159 = true;
  int v160 = simt_wave_count_bits(v159);
  v54[v158] = v160;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 76; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
