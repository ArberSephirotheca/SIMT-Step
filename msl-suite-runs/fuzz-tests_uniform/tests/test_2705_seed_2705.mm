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
  uint v4 = simt_lane_id(__simt_tid);
  int v5 = (int)(v4);
  int v6 = 0;
  bool v7 = v2 != v6;
  int v8;
  if (v7) {
    int v9 = 0;
    int v10 = 0;
    int v11;
    int v12;
    v11 = v9;
    v12 = v10;
    while (true) {
      int v13 = 4;
      int v14 = v3 % v13;
      int v15 = 1;
      int v16 = v14 + v15;
      bool v17 = v12 < v16;
      v11 = v11;
      v12 = v12;
      if (!v17) break;
      int v18 = 3;
      int v19 = 1;
      int v20 = v12 + v19;
      v11 = v18;
      v12 = v20;
      continue;
      ;
    }
    uint v21 = simt_lane_id(__simt_tid);
    int v22 = (int)(v21);
    v8 = v11;
  } else {
    int v23 = 4;
    int v24 = v3 % v23;
    int v25;
    v25 = v0;
    switch (v24) {
      default:
        {
        int v26 = 2;
        int v27 = v0 + v26;
        v25 = v27;
      }
      case 0:
        {
        int v28 = 3;
        int v29 = v0 + v28;
        int v30;
        v30 = v29;
        switch (v3) {
          default:
            {
            v30 = v0;
            break;
          }
          case 0:
            {
            int v31 = 3;
            v30 = v31;
            break;
          }
        }
        int v32 = 4;
        v25 = v30;
      }
      case 1:
        {
        int v33 = 4;
        int v34 = v3 % v33;
        int v35 = 4;
        int v36 = v0 + v35;
        int v37;
        v37 = v36;
        switch (v34) {
          case 0:
            {
            v37 = v0;
            break;
          }
          case 1:
            {
            int v38 = 1;
            int v39 = v0 + v38;
            v37 = v39;
            break;
          }
          default:
            {
            int v40 = 3;
            v37 = v40;
            break;
          }
          case 2:
            {
            int v41 = 4;
            int v42 = v0 + v41;
            v37 = v42;
            break;
          }
        }
        v25 = v37;
      }
      case 2:
        {
        int v43 = 3;
        int v44 = v3 % v43;
        int v45 = 2;
        int v46 = v0 + v45;
        int v47;
        v47 = v46;
        switch (v44) {
          default:
            {
            int v48 = 3;
            int v49 = v0 + v48;
            v47 = v49;
          }
          case 0:
            {
            int v50 = 2;
            v47 = v50;
          }
          case 1:
            {
            v47 = v0;
            break;
          }
        }
        int v51 = 3;
        int v52 = v0 + v51;
        v25 = v47;
        break;
      }
    }
    uint v53 = simt_subgroup_id(__simt_tid);
    int v54 = (int)(v53);
    v8 = v25;
  }
  bool v55 = true;
  int v56 = simt_wave_count_bits(v55);
  int v57 = 0;
  int v58 = v57 + v0;
  v1[v58] = v56;
  int v59 = 0;
  bool v60 = v2 != v59;
  int v61 = v60 ? v5 : v8;
  return;
}

kernel void kernel_main(device int* v62 [[buffer(0)]], device int* v63 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v64 = static_cast<int>(__simt_tid3.x);
  int v65 = 0;
  int v66 = v65 + v64;
  int v67 = v63[v66];
  int v68 = 4;
  int v69 = v68 + v64;
  int v70 = v63[v69];
  helper0(v64, v62, v67, v70, static_cast<int>(__simt_tid3.x));
  int v71 = 0;
  int v72 = 0;
  int v73;
  int v74;
  v73 = v71;
  v74 = v72;
  while (true) {
    int v75 = 4;
    int v76 = v74 * v75;
    int v77 = v76 + v64;
    int v78 = 8;
    int v79 = v78 + v77;
    int v80 = v63[v79];
    int v81 = 0;
    bool v82 = v80 != v81;
    v73 = v73;
    v74 = v74;
    if (!v82) break;
    int v83 = 0;
    int v84 = 0;
    int v85;
    int v86;
    v85 = v83;
    v86 = v84;
    while (true) {
      int v87 = 4;
      int v88 = v86 * v87;
      int v89 = v88 + v64;
      int v90 = 28;
      int v91 = v90 + v89;
      int v92 = v63[v91];
      int v93 = 0;
      bool v94 = v92 != v93;
      v85 = v85;
      v86 = v86;
      if (!v94) break;
      int v95 = v85 + v86;
      int v96 = 1;
      int v97 = v86 + v96;
      v85 = v95;
      v86 = v97;
    }
    bool v98 = true;
    int v99 = v73 + v85;
    int v100 = 1;
    int v101 = v74 + v100;
    v73 = v99;
    v74 = v101;
  }
  bool v102 = true;
  int v103 = 16;
  int v104 = v103 + v64;
  bool v105 = true;
  int v106 = simt_wave_count_bits(v105);
  v62[v104] = v106;
  int v107 = 48;
  int v108 = v107 + v64;
  int v109 = v63[v108];
  int v110 = 0;
  bool v111 = v109 != v110;
  int v112;
  if (v111) {
    int v113 = 52;
    int v114 = v113 + v64;
    int v115 = v63[v114];
    int v116 = 0;
    bool v117 = v115 != v116;
    int v118;
    if (v117) {
      int v119 = 56;
      int v120 = v119 + v64;
      int v121 = v63[v120];
      int v122 = 3;
      int v123 = v64 + v122;
      int v124;
      v124 = v123;
      switch (v121) {
        case 0:
          {
          int v125 = 3;
          v124 = v125;
          break;
        }
        case 1:
          {
          v124 = v64;
          break;
        }
        default:
          {
          int v126 = 0;
          int v127 = v64 + v126;
          v124 = v127;
          break;
        }
        case 2:
          {
          int v128 = 4;
          v124 = v128;
          break;
        }
      }
      bool v129 = true;
      v118 = v124;
    } else {
      int v130 = 60;
      int v131 = v130 + v64;
      int v132 = v63[v131];
      int v133 = 0;
      bool v134 = v132 != v133;
      int v135;
      if (v134) {
        uint v136 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v137 = (int)(v136);
        v135 = v137;
      } else {
        uint v138 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v139 = (int)(v138);
        v135 = v139;
      }
      v118 = v135;
    }
    v112 = v118;
  } else {
    int v140 = 64;
    int v141 = v140 + v64;
    int v142 = v63[v141];
    int v143;
    v143 = v64;
    switch (v142) {
      case 0:
        {
        int v144 = 1;
        v143 = v144;
        break;
      }
      default:
        {
        int v145 = 68;
        int v146 = v145 + v64;
        int v147 = v63[v146];
        int v148 = 3;
        int v149;
        v149 = v148;
        switch (v147) {
          case 0:
            {
            int v150 = 0;
            v149 = v150;
            break;
          }
          case 1:
            {
            v149 = v64;
            break;
          }
          default:
            {
            int v151 = 3;
            v149 = v151;
            break;
          }
        }
        bool v152 = true;
        v143 = v149;
      }
      case 1:
        {
        int v153 = 1;
        int v154 = v64 + v153;
        v143 = v154;
        break;
      }
      case 2:
        {
        int v155 = 72;
        int v156 = v155 + v64;
        int v157 = v63[v156];
        int v158 = 4;
        int v159 = v64 + v158;
        int v160;
        v160 = v159;
        switch (v157) {
          case 0:
            {
            v160 = v64;
            break;
          }
          case 1:
            {
            int v161 = 2;
            v160 = v161;
            break;
          }
          default:
            {
            v160 = v64;
            break;
          }
          case 2:
            {
            v160 = v64;
            break;
          }
        }
        bool v162 = true;
        v143 = v160;
        break;
      }
    }
    bool v163 = true;
    v112 = v143;
  }
  int v164 = 32;
  int v165 = v164 + v64;
  bool v166 = true;
  int v167 = simt_wave_count_bits(v166);
  v62[v165] = v167;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 76; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
