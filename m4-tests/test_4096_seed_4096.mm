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
    bool v13 = true;
    int v14 = simt_wave_count_bits(v13);
    int v15 = 0;
    int v16 = 4;
    int v17 = v7 * v16;
    int v18 = v15 + v17;
    int v19 = v18 + v0;
    v1[v19] = v14;
    int v20 = 1;
    int v21 = v7 + v20;
    v6 = v14;
    v7 = v21;
    break;
    ;
  }
  int v22 = 4;
  int v23 = v3 % v22;
  int v24 = 3;
  int v25 = v0 + v24;
  int v26;
  v26 = v25;
  switch (v23) {
    case 0:
      {
      int v27 = 0;
      bool v28 = v2 != v27;
      int v29;
      if (v28) {
        int v30 = 3;
        int v31 = v3 % v30;
        int v32;
        v32 = v0;
        switch (v31) {
          case 0:
            {
            int v33 = 1;
            int v34 = v0 + v33;
            v32 = v34;
            break;
          }
          case 1:
            {
            int v35 = 4;
            int v36 = v0 + v35;
            v32 = v36;
            break;
          }
          default:
            {
            int v37 = 0;
            int v38 = v0 + v37;
            v32 = v38;
            break;
          }
          case 2:
            {
            int v39 = 0;
            int v40 = v0 + v39;
            v32 = v40;
            break;
          }
        }
        v29 = v32;
      } else {
        int v41 = 2;
        int v42 = v0 + v41;
        v29 = v42;
      }
      v26 = v29;
      break;
    }
    default:
      {
      int v43 = 0;
      bool v44 = v2 != v43;
      int v45;
      if (v44) {
        int v46 = 1;
        int v47 = v0 + v46;
        v45 = v47;
      } else {
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
          int v57 = 1;
          int v58 = v51 + v57;
          v50 = v0;
          v51 = v58;
        }
        v45 = v50;
      }
      v26 = v45;
    }
    case 1:
      {
      int v59 = 0;
      int v60 = 0;
      int v61;
      int v62;
      v61 = v59;
      v62 = v60;
      while (true) {
        int v63 = 4;
        int v64 = v3 % v63;
        int v65 = 1;
        int v66 = v64 + v65;
        bool v67 = v62 < v66;
        v61 = v61;
        v62 = v62;
        if (!v67) break;
        int v68 = 0;
        int v69 = 1;
        int v70 = v62 + v69;
        v61 = v68;
        v62 = v70;
        break;
        ;
      }
      v26 = v61;
      break;
    }
    case 2:
      {
      int v71 = 4;
      int v72 = v3 % v71;
      int v73 = 1;
      int v74;
      v74 = v73;
      switch (v72) {
        default:
          {
          int v75 = 0;
          bool v76 = v2 != v75;
          int v77;
          if (v76) {
            int v78 = 2;
            int v79 = v0 + v78;
            v77 = v79;
          } else {
            v77 = v0;
          }
          v74 = v77;
          break;
        }
        case 0:
          {
          int v80 = 0;
          int v81 = 0;
          int v82;
          int v83;
          v82 = v80;
          v83 = v81;
          while (true) {
            int v84 = 4;
            int v85 = v3 % v84;
            int v86 = 1;
            int v87 = v85 + v86;
            bool v88 = v83 < v87;
            v82 = v82;
            v83 = v83;
            if (!v88) break;
            int v89 = 0;
            int v90 = 1;
            int v91 = v83 + v90;
            v82 = v89;
            v83 = v91;
          }
          v74 = v82;
          break;
        }
        case 1:
          {
          int v92 = 0;
          v74 = v92;
          break;
        }
        case 2:
          {
          int v93 = 2;
          int v94 = v3 % v93;
          int v95 = 3;
          int v96;
          v96 = v95;
          switch (v94) {
            case 0:
              {
              int v97 = 3;
              int v98 = v0 + v97;
              v96 = v98;
            }
            default:
              {
              int v99 = 3;
              int v100 = v0 + v99;
              v96 = v100;
              break;
            }
          }
          v74 = v96;
          break;
        }
      }
      v26 = v74;
      break;
    }
  }
  int v101 = 0;
  bool v102 = v2 != v101;
  int v103 = v102 ? v6 : v26;
  return;
}

kernel void kernel_main(device int* v104 [[buffer(0)]], device int* v105 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v106 = static_cast<int>(__simt_tid3.x);
  int v107 = 0;
  int v108 = v107 + v106;
  int v109 = v105[v108];
  int v110 = 4;
  int v111 = v110 + v106;
  int v112 = v105[v111];
  helper0(v106, v104, v109, v112, static_cast<int>(__simt_tid3.x));
  int v113 = 0;
  int v114 = 0;
  int v115;
  int v116;
  v115 = v113;
  v116 = v114;
  while (true) {
    int v117 = 4;
    int v118 = v116 * v117;
    int v119 = v118 + v106;
    int v120 = 8;
    int v121 = v120 + v119;
    int v122 = v105[v121];
    int v123 = 0;
    bool v124 = v122 != v123;
    v115 = v115;
    v116 = v116;
    if (!v124) break;
    int v125 = v115 + v116;
    int v126 = 1;
    int v127 = v116 + v126;
    bool v128 = true;
    int v129 = 16;
    int v130 = 4;
    int v131 = v116 * v130;
    int v132 = v129 + v131;
    int v133 = v132 + v106;
    bool v134 = true;
    int v135 = simt_wave_count_bits(v134);
    v104[v133] = v135;
    v115 = v125;
    v116 = v127;
  }
  int v136 = 28;
  int v137 = v136 + v106;
  int v138 = v105[v137];
  int v139 = 0;
  bool v140 = v138 != v139;
  int v141;
  if (v140) {
    int v142 = 32;
    int v143 = v142 + v106;
    int v144 = v105[v143];
    int v145 = 0;
    bool v146 = v144 != v145;
    int v147;
    if (v146) {
      v147 = v106;
    } else {
      int v148 = 36;
      int v149 = v148 + v106;
      int v150 = v105[v149];
      int v151 = 0;
      bool v152 = v150 != v151;
      int v153;
      if (v152) {
        uint v154 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v155 = (int)(v154);
        v153 = v155;
      } else {
        v153 = v106;
      }
      int v156 = 32;
      int v157 = v156 + v106;
      bool v158 = true;
      int v159 = simt_wave_count_bits(v158);
      v104[v157] = v159;
      v147 = v153;
    }
    int v160 = 48;
    int v161 = v160 + v106;
    bool v162 = true;
    int v163 = simt_wave_count_bits(v162);
    v104[v161] = v163;
    v141 = v147;
  } else {
    int v164 = 0;
    v141 = v164;
  }
  int v165 = 64;
  int v166 = v165 + v106;
  bool v167 = true;
  int v168 = simt_wave_count_bits(v167);
  v104[v166] = v168;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
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
