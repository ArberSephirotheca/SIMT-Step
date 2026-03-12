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
  int v4 = 2;
  int v5 = v3 % v4;
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 2;
      int v10 = v3 % v9;
      int v11 = 1;
      int v12 = v0 + v11;
      int v13;
      v13 = v12;
      switch (v10) {
        default:
          {
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
            int v23 = 1;
            int v24 = v17 + v23;
            v16 = v0;
            v17 = v24;
          }
          v13 = v16;
          break;
        }
        case 0:
          {
          int v25 = 0;
          bool v26 = v2 != v25;
          int v27;
          if (v26) {
            v27 = v0;
          } else {
            int v28 = 0;
            v27 = v28;
          }
          v13 = v27;
          break;
        }
        case 1:
          {
          int v29 = 0;
          int v30 = 0;
          int v31;
          int v32;
          v31 = v29;
          v32 = v30;
          while (true) {
            int v33 = 4;
            int v34 = v3 % v33;
            int v35 = 1;
            int v36 = v34 + v35;
            bool v37 = v32 < v36;
            v31 = v31;
            v32 = v32;
            if (!v37) break;
            int v38 = 0;
            int v39 = 1;
            int v40 = v32 + v39;
            v31 = v38;
            v32 = v40;
          }
          v13 = v31;
          break;
        }
      }
      int v41 = 0;
      int v42 = v0 + v41;
      v8 = v13;
    }
    case 0:
      {
      v8 = v0;
      break;
    }
  }
  bool v43 = true;
  int v44 = simt_wave_count_bits(v43);
  int v45 = 0;
  int v46 = v45 + v0;
  v1[v46] = v44;
  return;
}

kernel void kernel_main(device int* v47 [[buffer(0)]], device int* v48 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v49 = static_cast<int>(__simt_tid3.x);
  int v50 = 0;
  int v51 = v50 + v49;
  int v52 = v48[v51];
  int v53 = 4;
  int v54 = v53 + v49;
  int v55 = v48[v54];
  helper0(v49, v47, v52, v55, static_cast<int>(__simt_tid3.x));
  int v56 = 8;
  int v57 = v56 + v49;
  int v58 = v48[v57];
  int v59 = 0;
  bool v60 = v58 != v59;
  int v61;
  if (v60) {
    int v62 = 0;
    int v63 = 0;
    int v64;
    int v65;
    v64 = v62;
    v65 = v63;
    while (true) {
      int v66 = 4;
      int v67 = v65 * v66;
      int v68 = v67 + v49;
      int v69 = 12;
      int v70 = v69 + v68;
      int v71 = v48[v70];
      int v72 = 0;
      bool v73 = v71 != v72;
      v64 = v64;
      v65 = v65;
      if (!v73) break;
      int v74 = v64 + v65;
      int v75 = 1;
      int v76 = v65 + v75;
      v64 = v74;
      v65 = v76;
    }
    bool v77 = true;
    v61 = v64;
  } else {
    int v78 = 0;
    int v79 = 0;
    int v80;
    int v81;
    v80 = v78;
    v81 = v79;
    while (true) {
      int v82 = 4;
      int v83 = v81 * v82;
      int v84 = v83 + v49;
      int v85 = 32;
      int v86 = v85 + v84;
      int v87 = v48[v86];
      int v88 = 0;
      bool v89 = v87 != v88;
      v80 = v80;
      v81 = v81;
      if (!v89) break;
      int v90 = 52;
      int v91 = v90 + v49;
      int v92 = v48[v91];
      uint v93 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v94 = (int)(v93);
      int v95;
      v95 = v94;
      switch (v92) {
        case 0:
          {
          v95 = v49;
        }
        case 1:
          {
          int v96 = 0;
          int v97 = v49 + v96;
          v95 = v97;
        }
        default:
          {
          int v98 = 1;
          int v99 = v49 + v98;
          v95 = v99;
          break;
        }
      }
      bool v100 = true;
      int v101 = v80 + v95;
      int v102 = 1;
      int v103 = v81 + v102;
      v80 = v101;
      v81 = v103;
    }
    bool v104 = true;
    v61 = v80;
  }
  int v105 = 16;
  int v106 = v105 + v49;
  bool v107 = true;
  int v108 = simt_wave_count_bits(v107);
  v47[v106] = v108;
  int v109 = 0;
  int v110 = 0;
  int v111;
  int v112;
  v111 = v109;
  v112 = v110;
  while (true) {
    int v113 = 4;
    int v114 = v112 * v113;
    int v115 = v114 + v49;
    int v116 = 56;
    int v117 = v116 + v115;
    int v118 = v48[v117];
    int v119 = 0;
    bool v120 = v118 != v119;
    v111 = v111;
    v112 = v112;
    if (!v120) break;
    int v121 = 76;
    int v122 = v121 + v49;
    int v123 = v48[v122];
    int v124 = 2;
    int v125 = v49 + v124;
    int v126;
    v126 = v125;
    switch (v123) {
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
          int v133 = v132 + v49;
          int v134 = 80;
          int v135 = v134 + v133;
          int v136 = v48[v135];
          int v137 = 0;
          bool v138 = v136 != v137;
          v129 = v129;
          v130 = v130;
          if (!v138) break;
          int v139 = v129 + v130;
          int v140 = 1;
          int v141 = v130 + v140;
          v129 = v139;
          v130 = v141;
        }
        bool v142 = true;
        v126 = v129;
      }
      default:
        {
        int v143 = 100;
        int v144 = v143 + v49;
        int v145 = v48[v144];
        int v146 = 0;
        bool v147 = v145 != v146;
        int v148;
        if (v147) {
          int v149 = 0;
          v148 = v149;
        } else {
          v148 = v49;
        }
        v126 = v148;
        break;
      }
      case 1:
        {
        int v150 = 104;
        int v151 = v150 + v49;
        int v152 = v48[v151];
        int v153 = 1;
        int v154 = v49 + v153;
        int v155;
        v155 = v154;
        switch (v152) {
          case 0:
            {
            int v156 = 4;
            v155 = v156;
            break;
          }
          default:
            {
            v155 = v49;
            break;
          }
        }
        bool v157 = true;
        v126 = v155;
        break;
      }
    }
    bool v158 = true;
    int v159 = v111 + v126;
    int v160 = 1;
    int v161 = v112 + v160;
    v111 = v159;
    v112 = v161;
    break;
    ;
  }
  bool v162 = true;
  int v163 = 32;
  int v164 = v163 + v49;
  bool v165 = true;
  int v166 = simt_wave_count_bits(v165);
  v47[v164] = v166;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 108; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
