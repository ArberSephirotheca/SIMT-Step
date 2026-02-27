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
      int v16 = 2;
      int v17 = v3 % v16;
      uint v18 = simt_subgroup_id(__simt_tid);
      int v19 = (int)(v18);
      int v20;
      v20 = v19;
      switch (v17) {
        default:
          {
          int v21 = 4;
          v20 = v21;
        }
        case 0:
          {
          int v22 = 2;
          int v23 = v0 + v22;
          v20 = v23;
        }
        case 1:
          {
          int v24 = 0;
          int v25 = v0 + v24;
          v20 = v25;
          break;
        }
      }
      int v26 = 1;
      int v27 = v10 + v26;
      v9 = v20;
      v10 = v27;
      continue;
      ;
    }
    v6 = v9;
  } else {
    bool v28 = true;
    int v29 = simt_wave_count_bits(v28);
    int v30 = 0;
    int v31 = v30 + v0;
    v1[v31] = v29;
    v6 = v29;
  }
  return;
}

kernel void kernel_main(device int* v32 [[buffer(0)]], device int* v33 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v34 = static_cast<int>(__simt_tid3.x);
  int v35 = 0;
  int v36 = v35 + v34;
  int v37 = v33[v36];
  int v38 = 4;
  int v39 = v38 + v34;
  int v40 = v33[v39];
  int v41 = 0;
  bool v42 = v37 != v41;
  if (v42) {
    int v43 = 0;
    int v44 = 0;
    int v45;
    int v46;
    v45 = v43;
    v46 = v44;
    while (true) {
      int v47 = 2;
      bool v48 = v46 < v47;
      v45 = v45;
      v46 = v46;
      if (!v48) break;
      helper0(v34, v32, v37, v40, static_cast<int>(__simt_tid3.x));
      int v49 = 1;
      int v50 = v46 + v49;
      v45 = v45;
      v46 = v50;
    }
  } else {
  }
  int v51 = 8;
  int v52 = v51 + v34;
  int v53 = v33[v52];
  int v54 = 0;
  int v55;
  v55 = v54;
  switch (v53) {
    case 0:
      {
      int v56 = 12;
      int v57 = v56 + v34;
      int v58 = v33[v57];
      int v59 = 0;
      bool v60 = v58 != v59;
      int v61;
      if (v60) {
        int v62 = 16;
        int v63 = v62 + v34;
        int v64 = v33[v63];
        int v65 = 0;
        int v66 = v34 + v65;
        int v67;
        v67 = v66;
        switch (v64) {
          case 0:
            {
            v67 = v34;
            break;
          }
          default:
            {
            v67 = v34;
            break;
          }
          case 1:
            {
            int v68 = 2;
            int v69 = v34 + v68;
            v67 = v69;
            break;
          }
        }
        bool v70 = true;
        v61 = v67;
      } else {
        int v71 = 4;
        int v72 = v34 + v71;
        v61 = v72;
      }
      v55 = v61;
      break;
    }
    default:
      {
      int v73 = 20;
      int v74 = v73 + v34;
      int v75 = v33[v74];
      int v76 = 0;
      bool v77 = v75 != v76;
      int v78;
      if (v77) {
        int v79 = 0;
        int v80 = 0;
        int v81;
        int v82;
        v81 = v79;
        v82 = v80;
        while (true) {
          int v83 = 4;
          int v84 = v82 * v83;
          int v85 = v84 + v34;
          int v86 = 24;
          int v87 = v86 + v85;
          int v88 = v33[v87];
          int v89 = 0;
          bool v90 = v88 != v89;
          v81 = v81;
          v82 = v82;
          if (!v90) break;
          int v91 = v81 + v82;
          int v92 = 1;
          int v93 = v82 + v92;
          bool v94 = true;
          v81 = v91;
          v82 = v93;
        }
        v78 = v81;
      } else {
        int v95 = 44;
        int v96 = v95 + v34;
        int v97 = v33[v96];
        int v98 = 0;
        bool v99 = v97 != v98;
        int v100;
        if (v99) {
          v100 = v34;
        } else {
          v100 = v34;
        }
        v78 = v100;
      }
      v55 = v78;
      break;
    }
  }
  bool v101 = true;
  int v102 = 16;
  int v103 = v102 + v34;
  bool v104 = true;
  int v105 = simt_wave_count_bits(v104);
  v32[v103] = v105;
  int v106 = 48;
  int v107 = v106 + v34;
  int v108 = v33[v107];
  int v109 = 3;
  int v110;
  v110 = v109;
  switch (v108) {
    case 0:
      {
      int v111 = 52;
      int v112 = v111 + v34;
      int v113 = v33[v112];
      int v114 = 0;
      bool v115 = v113 != v114;
      int v116;
      if (v115) {
        int v117 = 4;
        int v118 = v34 + v117;
        v116 = v118;
      } else {
        int v119 = 3;
        v116 = v119;
      }
      v110 = v116;
      break;
    }
    case 1:
      {
      int v120 = 56;
      int v121 = v120 + v34;
      int v122 = v33[v121];
      int v123;
      v123 = v34;
      switch (v122) {
        default:
          {
          int v124 = 60;
          int v125 = v124 + v34;
          int v126 = v33[v125];
          int v127 = 0;
          bool v128 = v126 != v127;
          int v129;
          if (v128) {
            v129 = v34;
          } else {
            v129 = v34;
          }
          v123 = v129;
          break;
        }
        case 0:
          {
          int v130 = 64;
          int v131 = v130 + v34;
          int v132 = v33[v131];
          int v133 = 0;
          bool v134 = v132 != v133;
          int v135;
          if (v134) {
            v135 = v34;
          } else {
            int v136 = 2;
            v135 = v136;
          }
          v123 = v135;
          break;
        }
      }
      bool v137 = true;
      v110 = v123;
      break;
    }
    default:
      {
      int v138 = 4;
      v110 = v138;
      break;
    }
  }
  bool v139 = true;
  int v140 = 32;
  int v141 = v140 + v34;
  bool v142 = true;
  int v143 = simt_wave_count_bits(v142);
  v32[v141] = v143;
  int v144 = 0;
  int v145 = 0;
  int v146;
  int v147;
  v146 = v144;
  v147 = v145;
  while (true) {
    int v148 = 4;
    int v149 = v147 * v148;
    int v150 = v149 + v34;
    int v151 = 68;
    int v152 = v151 + v150;
    int v153 = v33[v152];
    int v154 = 0;
    bool v155 = v153 != v154;
    v146 = v146;
    v147 = v147;
    if (!v155) break;
    int v156 = v146 + v147;
    int v157 = 1;
    int v158 = v147 + v157;
    bool v159 = true;
    int v160 = 48;
    int v161 = 4;
    int v162 = v147 * v161;
    int v163 = v160 + v162;
    int v164 = v163 + v34;
    bool v165 = true;
    int v166 = simt_wave_count_bits(v165);
    v32[v164] = v166;
    v146 = v156;
    v147 = v158;
  }
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 64; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 88; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
