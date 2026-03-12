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
  bool v4 = true;
  int v5 = simt_wave_count_bits(v4);
  int v6 = 0;
  int v7 = v6 + v0;
  v1[v7] = v5;
  int v8 = 0;
  int v9 = 0;
  int v10;
  int v11;
  v10 = v8;
  v11 = v9;
  while (true) {
    int v12 = 4;
    int v13 = v3 % v12;
    int v14 = 1;
    int v15 = v13 + v14;
    bool v16 = v11 < v15;
    v10 = v10;
    v11 = v11;
    if (!v16) break;
    int v17 = 4;
    int v18 = v3 % v17;
    int v19 = 2;
    int v20 = v0 + v19;
    int v21;
    v21 = v20;
    switch (v18) {
      case 0:
        {
        int v22 = 0;
        int v23 = 0;
        int v24;
        int v25;
        v24 = v22;
        v25 = v23;
        while (true) {
          int v26 = 4;
          int v27 = v3 % v26;
          int v28 = 1;
          int v29 = v27 + v28;
          bool v30 = v25 < v29;
          v24 = v24;
          v25 = v25;
          if (!v30) break;
          int v31 = 1;
          int v32 = v25 + v31;
          v24 = v0;
          v25 = v32;
        }
        v21 = v24;
        break;
      }
      case 1:
        {
        int v33 = 2;
        int v34 = v0 + v33;
        v21 = v34;
        break;
      }
      default:
        {
        int v35 = 0;
        int v36 = 0;
        int v37;
        int v38;
        v37 = v35;
        v38 = v36;
        while (true) {
          int v39 = 4;
          int v40 = v3 % v39;
          int v41 = 1;
          int v42 = v40 + v41;
          bool v43 = v38 < v42;
          v37 = v37;
          v38 = v38;
          if (!v43) break;
          int v44 = 0;
          int v45 = v0 + v44;
          int v46 = 1;
          int v47 = v38 + v46;
          v37 = v45;
          v38 = v47;
        }
        v21 = v37;
        break;
      }
      case 2:
        {
        int v48 = 4;
        int v49 = v0 + v48;
        v21 = v49;
        break;
      }
    }
    int v50 = 1;
    int v51 = v11 + v50;
    v10 = v21;
    v11 = v51;
  }
  int v52 = 0;
  bool v53 = v2 != v52;
  int v54 = v53 ? v5 : v10;
  return;
}

kernel void kernel_main(device int* v55 [[buffer(0)]], device int* v56 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v57 = static_cast<int>(__simt_tid3.x);
  int v58 = 0;
  int v59 = v58 + v57;
  int v60 = v56[v59];
  int v61 = 4;
  int v62 = v61 + v57;
  int v63 = v56[v62];
  helper0(v57, v55, v60, v63, static_cast<int>(__simt_tid3.x));
  int v64 = 8;
  int v65 = v64 + v57;
  int v66 = v56[v65];
  int v67 = 0;
  bool v68 = v66 != v67;
  int v69;
  if (v68) {
    uint v70 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v71 = (int)(v70);
    v69 = v71;
  } else {
    int v72 = 12;
    int v73 = v72 + v57;
    int v74 = v56[v73];
    int v75 = 0;
    bool v76 = v74 != v75;
    int v77;
    if (v76) {
      int v78 = 16;
      int v79 = v78 + v57;
      int v80 = v56[v79];
      int v81 = 2;
      int v82;
      v82 = v81;
      switch (v80) {
        case 0:
          {
          int v83 = 0;
          int v84 = v57 + v83;
          v82 = v84;
          break;
        }
        case 1:
          {
          v82 = v57;
          break;
        }
        case 2:
          {
          int v85 = 0;
          int v86 = v57 + v85;
          v82 = v86;
        }
        default:
          {
          int v87 = 4;
          v82 = v87;
          break;
        }
      }
      v77 = v82;
    } else {
      int v88 = 20;
      int v89 = v88 + v57;
      int v90 = v56[v89];
      uint v91 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v92 = (int)(v91);
      int v93;
      v93 = v92;
      switch (v90) {
        case 0:
          {
          int v94 = 0;
          int v95 = v57 + v94;
          v93 = v95;
          break;
        }
        default:
          {
          int v96 = 4;
          int v97 = v57 + v96;
          v93 = v97;
          break;
        }
      }
      v77 = v93;
    }
    int v98 = 16;
    int v99 = v98 + v57;
    bool v100 = true;
    int v101 = simt_wave_count_bits(v100);
    v55[v99] = v101;
    v69 = v77;
  }
  int v102 = 32;
  int v103 = v102 + v57;
  bool v104 = true;
  int v105 = simt_wave_count_bits(v104);
  v55[v103] = v105;
  int v106 = 24;
  int v107 = v106 + v57;
  int v108 = v56[v107];
  int v109 = 0;
  bool v110 = v108 != v109;
  int v111;
  if (v110) {
    int v112 = 28;
    int v113 = v112 + v57;
    int v114 = v56[v113];
    int v115;
    v115 = v57;
    switch (v114) {
      default:
        {
        int v116 = 32;
        int v117 = v116 + v57;
        int v118 = v56[v117];
        int v119 = 1;
        int v120 = v57 + v119;
        int v121;
        v121 = v120;
        switch (v118) {
          default:
            {
            int v122 = 1;
            v121 = v122;
          }
          case 0:
            {
            int v123 = 4;
            v121 = v123;
            break;
          }
        }
        v115 = v121;
      }
      case 0:
        {
        int v124 = 36;
        int v125 = v124 + v57;
        int v126 = v56[v125];
        int v127 = 2;
        int v128 = v57 + v127;
        int v129;
        v129 = v128;
        switch (v126) {
          case 0:
            {
            int v130 = 1;
            v129 = v130;
            break;
          }
          default:
            {
            int v131 = 2;
            v129 = v131;
            break;
          }
        }
        bool v132 = true;
        v115 = v129;
        break;
      }
      case 1:
        {
        int v133 = 0;
        int v134 = 0;
        int v135;
        int v136;
        v135 = v133;
        v136 = v134;
        while (true) {
          int v137 = 4;
          int v138 = v136 * v137;
          int v139 = v138 + v57;
          int v140 = 40;
          int v141 = v140 + v139;
          int v142 = v56[v141];
          int v143 = 0;
          bool v144 = v142 != v143;
          v135 = v135;
          v136 = v136;
          if (!v144) break;
          int v145 = v135 + v136;
          int v146 = 1;
          int v147 = v136 + v146;
          bool v148 = true;
          v135 = v145;
          v136 = v147;
        }
        v115 = v135;
        break;
      }
      case 2:
        {
        int v149 = 60;
        int v150 = v149 + v57;
        int v151 = v56[v150];
        int v152;
        v152 = v57;
        switch (v151) {
          case 0:
            {
            v152 = v57;
            break;
          }
          default:
            {
            int v153 = 3;
            int v154 = v57 + v153;
            v152 = v154;
            break;
          }
        }
        v115 = v152;
        break;
      }
    }
    v111 = v115;
  } else {
    uint v155 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v156 = (int)(v155);
    v111 = v156;
  }
  int v157 = 48;
  int v158 = v157 + v57;
  bool v159 = true;
  int v160 = simt_wave_count_bits(v159);
  v55[v158] = v160;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 64; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
