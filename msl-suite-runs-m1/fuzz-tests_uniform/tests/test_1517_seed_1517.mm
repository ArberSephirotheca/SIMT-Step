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
      int v18 = 0;
      int v19 = 0;
      int v20;
      int v21;
      v20 = v18;
      v21 = v19;
      while (true) {
        int v22 = 4;
        int v23 = v3 % v22;
        int v24 = 1;
        int v25 = v23 + v24;
        bool v26 = v21 < v25;
        v20 = v20;
        v21 = v21;
        if (!v26) break;
        int v27 = 0;
        int v28 = v0 + v27;
        int v29 = 1;
        int v30 = v21 + v29;
        v20 = v28;
        v21 = v30;
      }
      int v31 = 0;
      int v32 = v0 + v31;
      int v33 = 1;
      int v34 = v12 + v33;
      v11 = v20;
      v12 = v34;
    }
    v8 = v11;
  } else {
    int v35 = 2;
    int v36 = v3 % v35;
    int v37 = 1;
    int v38 = v0 + v37;
    int v39;
    v39 = v38;
    switch (v36) {
      default:
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
          int v50 = 1;
          int v51 = v43 + v50;
          v42 = v49;
          v43 = v51;
          break;
          ;
        }
        int v52 = 4;
        int v53 = v0 + v52;
        v39 = v42;
      }
      case 0:
        {
        int v54 = 2;
        int v55 = v3 % v54;
        int v56;
        v56 = v0;
        switch (v55) {
          case 0:
            {
            v56 = v0;
            break;
          }
          default:
            {
            v56 = v0;
            break;
          }
        }
        v39 = v56;
      }
      case 1:
        {
        int v57 = 2;
        int v58 = v3 % v57;
        int v59;
        v59 = v0;
        switch (v58) {
          case 0:
            {
            int v60 = 0;
            int v61 = v0 + v60;
            v59 = v61;
            break;
          }
          default:
            {
            int v62 = 0;
            v59 = v62;
            break;
          }
        }
        int v63 = 3;
        int v64 = v0 + v63;
        v39 = v59;
        break;
      }
    }
    v8 = v39;
  }
  bool v65 = true;
  int v66 = simt_wave_count_bits(v65);
  int v67 = 0;
  int v68 = v67 + v0;
  v1[v68] = v66;
  int v69 = 0;
  bool v70 = v2 != v69;
  int v71 = v70 ? v5 : v8;
  return;
}

kernel void kernel_main(device int* v72 [[buffer(0)]], device int* v73 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v74 = static_cast<int>(__simt_tid3.x);
  int v75 = 0;
  int v76 = v75 + v74;
  int v77 = v73[v76];
  int v78 = 4;
  int v79 = v78 + v74;
  int v80 = v73[v79];
  helper0(v74, v72, v77, v80, static_cast<int>(__simt_tid3.x));
  int v81 = 0;
  int v82 = 0;
  int v83;
  int v84;
  v83 = v81;
  v84 = v82;
  while (true) {
    int v85 = 4;
    int v86 = v84 * v85;
    int v87 = v86 + v74;
    int v88 = 8;
    int v89 = v88 + v87;
    int v90 = v73[v89];
    int v91 = 0;
    bool v92 = v90 != v91;
    v83 = v83;
    v84 = v84;
    if (!v92) break;
    int v93 = v83 + v84;
    int v94 = 1;
    int v95 = v84 + v94;
    v83 = v93;
    v84 = v95;
  }
  bool v96 = true;
  int v97 = 16;
  int v98 = v97 + v74;
  bool v99 = true;
  int v100 = simt_wave_count_bits(v99);
  v72[v98] = v100;
  int v101 = 28;
  int v102 = v101 + v74;
  int v103 = v73[v102];
  int v104 = 0;
  bool v105 = v103 != v104;
  int v106;
  if (v105) {
    int v107 = 32;
    int v108 = v107 + v74;
    int v109 = v73[v108];
    uint v110 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v111 = (int)(v110);
    int v112;
    v112 = v111;
    switch (v109) {
      default:
        {
        int v113 = 36;
        int v114 = v113 + v74;
        int v115 = v73[v114];
        int v116 = 0;
        bool v117 = v115 != v116;
        int v118;
        if (v117) {
          int v119 = 0;
          v118 = v119;
        } else {
          int v120 = 3;
          v118 = v120;
        }
        v112 = v118;
        break;
      }
      case 0:
        {
        int v121 = 40;
        int v122 = v121 + v74;
        int v123 = v73[v122];
        int v124 = 3;
        int v125;
        v125 = v124;
        switch (v123) {
          case 0:
            {
            int v126 = 1;
            int v127 = v74 + v126;
            v125 = v127;
            break;
          }
          case 1:
            {
            int v128 = 0;
            v125 = v128;
            break;
          }
          default:
            {
            int v129 = 1;
            v125 = v129;
            break;
          }
          case 2:
            {
            int v130 = 2;
            int v131 = v74 + v130;
            v125 = v131;
            break;
          }
        }
        bool v132 = true;
        v112 = v125;
        break;
      }
      case 1:
        {
        int v133 = 44;
        int v134 = v133 + v74;
        int v135 = v73[v134];
        int v136 = 0;
        int v137 = v74 + v136;
        int v138;
        v138 = v137;
        switch (v135) {
          default:
            {
            v138 = v74;
          }
          case 0:
            {
            v138 = v74;
            break;
          }
          case 1:
            {
            int v139 = 3;
            int v140 = v74 + v139;
            v138 = v140;
          }
          case 2:
            {
            int v141 = 0;
            int v142 = v74 + v141;
            v138 = v142;
            break;
          }
        }
        bool v143 = true;
        v112 = v138;
        break;
      }
      case 2:
        {
        int v144 = 3;
        int v145 = v74 + v144;
        v112 = v145;
        break;
      }
    }
    bool v146 = true;
    v106 = v112;
  } else {
    int v147 = 48;
    int v148 = v147 + v74;
    int v149 = v73[v148];
    int v150 = 0;
    bool v151 = v149 != v150;
    int v152;
    if (v151) {
      uint v153 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v154 = (int)(v153);
      v152 = v154;
    } else {
      int v155 = 52;
      int v156 = v155 + v74;
      int v157 = v73[v156];
      int v158;
      v158 = v74;
      switch (v157) {
        case 0:
          {
          int v159 = 4;
          v158 = v159;
          break;
        }
        default:
          {
          int v160 = 0;
          v158 = v160;
          break;
        }
        case 1:
          {
          v158 = v74;
          break;
        }
        case 2:
          {
          v158 = v74;
          break;
        }
      }
      bool v161 = true;
      v152 = v158;
    }
    v106 = v152;
  }
  int v162 = 32;
  int v163 = v162 + v74;
  bool v164 = true;
  int v165 = simt_wave_count_bits(v164);
  v72[v163] = v165;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 56; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
