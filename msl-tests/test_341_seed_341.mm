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
    bool v14 = v2 != v13;
    int v15;
    if (v14) {
      v15 = v0;
    } else {
      uint v16 = simt_lane_id(__simt_tid);
      int v17 = (int)(v16);
      v15 = v17;
    }
    int v18 = 2;
    int v19 = 1;
    int v20 = v7 + v19;
    v6 = v15;
    v7 = v20;
  }
  bool v21 = true;
  int v22 = simt_wave_count_bits(v21);
  int v23 = 0;
  int v24 = v23 + v0;
  v1[v24] = v22;
  int v25 = 4;
  int v26 = v3 % v25;
  uint v27 = simt_subgroup_id(__simt_tid);
  int v28 = (int)(v27);
  int v29;
  v29 = v28;
  switch (v26) {
    case 0:
      {
      int v30 = 3;
      v29 = v30;
    }
    default:
      {
      int v31 = 0;
      int v32 = 0;
      int v33;
      int v34;
      v33 = v31;
      v34 = v32;
      while (true) {
        int v35 = 4;
        int v36 = v3 % v35;
        int v37 = 1;
        int v38 = v36 + v37;
        bool v39 = v34 < v38;
        v33 = v33;
        v34 = v34;
        if (!v39) break;
        int v40 = 4;
        int v41 = v3 % v40;
        int v42 = 0;
        int v43;
        v43 = v42;
        switch (v41) {
          default:
            {
            int v44 = 1;
            v43 = v44;
            break;
          }
          case 0:
            {
            int v45 = 2;
            v43 = v45;
            break;
          }
          case 1:
            {
            int v46 = 4;
            int v47 = v0 + v46;
            v43 = v47;
            break;
          }
          case 2:
            {
            int v48 = 1;
            int v49 = v0 + v48;
            v43 = v49;
            break;
          }
        }
        int v50 = 0;
        int v51 = v0 + v50;
        int v52 = 1;
        int v53 = v34 + v52;
        v33 = v43;
        v34 = v53;
        break;
        ;
      }
      int v54 = 0;
      v29 = v33;
    }
    case 1:
      {
      int v55 = 0;
      int v56 = 0;
      int v57;
      int v58;
      v57 = v55;
      v58 = v56;
      while (true) {
        int v59 = 4;
        int v60 = v3 % v59;
        int v61 = 1;
        int v62 = v60 + v61;
        bool v63 = v58 < v62;
        v57 = v57;
        v58 = v58;
        if (!v63) break;
        int v64 = 0;
        bool v65 = v2 != v64;
        int v66;
        if (v65) {
          int v67 = 3;
          int v68 = v0 + v67;
          v66 = v68;
        } else {
          v66 = v0;
        }
        int v69 = 3;
        int v70 = v0 + v69;
        int v71 = 1;
        int v72 = v58 + v71;
        v57 = v66;
        v58 = v72;
      }
      int v73 = 3;
      int v74 = v0 + v73;
      v29 = v57;
    }
    case 2:
      {
      int v75 = 0;
      bool v76 = v2 != v75;
      int v77;
      if (v76) {
        int v78 = 2;
        int v79 = v3 % v78;
        int v80;
        v80 = v0;
        switch (v79) {
          case 0:
            {
            int v81 = 0;
            int v82 = v0 + v81;
            v80 = v82;
            break;
          }
          default:
            {
            v80 = v0;
            break;
          }
        }
        int v83 = 4;
        int v84 = v0 + v83;
        v77 = v80;
      } else {
        int v85 = 0;
        int v86 = 0;
        int v87;
        int v88;
        v87 = v85;
        v88 = v86;
        while (true) {
          int v89 = 4;
          int v90 = v3 % v89;
          int v91 = 1;
          int v92 = v90 + v91;
          bool v93 = v88 < v92;
          v87 = v87;
          v88 = v88;
          if (!v93) break;
          int v94 = 0;
          int v95 = 1;
          int v96 = v88 + v95;
          v87 = v94;
          v88 = v96;
        }
        int v97 = 4;
        v77 = v87;
      }
      v29 = v77;
      break;
    }
  }
  bool v98 = true;
  int v99 = simt_wave_count_bits(v98);
  int v100 = 16;
  int v101 = v100 + v0;
  v1[v101] = v99;
  int v102 = 0;
  bool v103 = v2 != v102;
  int v104 = v103 ? v6 : v29;
  return;
}

kernel void kernel_main(device int* v105 [[buffer(0)]], device int* v106 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v107 = static_cast<int>(__simt_tid3.x);
  int v108 = 0;
  int v109 = v108 + v107;
  int v110 = v106[v109];
  int v111 = 4;
  int v112 = v111 + v107;
  int v113 = v106[v112];
  helper0(v107, v105, v110, v113, static_cast<int>(__simt_tid3.x));
  uint v114 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v115 = (int)(v114);
  int v116 = 0;
  int v117 = 0;
  int v118;
  int v119;
  v118 = v116;
  v119 = v117;
  while (true) {
    int v120 = 4;
    int v121 = v119 * v120;
    int v122 = v121 + v107;
    int v123 = 8;
    int v124 = v123 + v122;
    int v125 = v106[v124];
    int v126 = 0;
    bool v127 = v125 != v126;
    v118 = v118;
    v119 = v119;
    if (!v127) break;
    int v128 = v118 + v119;
    int v129 = 1;
    int v130 = v119 + v129;
    v118 = v128;
    v119 = v130;
  }
  bool v131 = true;
  int v132 = 32;
  int v133 = v132 + v107;
  bool v134 = true;
  int v135 = simt_wave_count_bits(v134);
  v105[v133] = v135;
  int v136 = 28;
  int v137 = v136 + v107;
  int v138 = v106[v137];
  int v139 = 0;
  bool v140 = v138 != v139;
  int v141;
  if (v140) {
    int v142 = 32;
    int v143 = v142 + v107;
    int v144 = v106[v143];
    uint v145 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v146 = (int)(v145);
    int v147;
    v147 = v146;
    switch (v144) {
      case 0:
        {
        int v148 = 1;
        int v149 = v107 + v148;
        v147 = v149;
        break;
      }
      case 1:
        {
        int v150 = 2;
        int v151 = v107 + v150;
        v147 = v151;
      }
      default:
        {
        int v152 = 36;
        int v153 = v152 + v107;
        int v154 = v106[v153];
        int v155 = 0;
        bool v156 = v154 != v155;
        int v157;
        if (v156) {
          int v158 = 0;
          int v159 = v107 + v158;
          v157 = v159;
        } else {
          v157 = v107;
        }
        v147 = v157;
        break;
      }
    }
    bool v160 = true;
    v141 = v147;
  } else {
    uint v161 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v162 = (int)(v161);
    v141 = v162;
  }
  int v163 = 48;
  int v164 = v163 + v107;
  bool v165 = true;
  int v166 = simt_wave_count_bits(v165);
  v105[v164] = v166;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 40; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
