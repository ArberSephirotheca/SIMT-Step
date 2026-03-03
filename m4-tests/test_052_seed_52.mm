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
  int v8;
  v8 = v0;
  switch (v3) {
    default:
      {
      int v9 = 0;
      int v10 = v0 + v9;
      v8 = v10;
      break;
    }
    case 0:
      {
      int v11 = 2;
      v8 = v11;
      break;
    }
  }
  bool v12 = true;
  int v13 = simt_wave_count_bits(v12);
  int v14 = 16;
  int v15 = v14 + v0;
  v1[v15] = v13;
  int v16 = 0;
  bool v17 = v2 != v16;
  int v18 = v17 ? v5 : v8;
  int v19 = 0;
  int v20 = 0;
  int v21;
  int v22;
  v21 = v19;
  v22 = v20;
  while (true) {
    int v23 = 4;
    int v24 = v3 % v23;
    int v25 = 1;
    int v26 = v24 + v25;
    bool v27 = v22 < v26;
    v21 = v21;
    v22 = v22;
    if (!v27) break;
    bool v28 = true;
    int v29 = simt_wave_count_bits(v28);
    int v30 = 32;
    int v31 = 4;
    int v32 = v22 * v31;
    int v33 = v30 + v32;
    int v34 = v33 + v0;
    v1[v34] = v29;
    int v35 = 1;
    int v36 = v22 + v35;
    v21 = v29;
    v22 = v36;
  }
  int v37 = 0;
  bool v38 = v2 != v37;
  int v39 = v38 ? v18 : v21;
  int v40 = 3;
  int v41 = v3 % v40;
  uint v42 = simt_lane_id(__simt_tid);
  int v43 = (int)(v42);
  int v44;
  v44 = v43;
  switch (v41) {
    default:
      {
      int v45 = 0;
      bool v46 = v2 != v45;
      int v47;
      if (v46) {
        int v48 = 0;
        bool v49 = v2 != v48;
        int v50;
        if (v49) {
          v50 = v0;
        } else {
          int v51 = 2;
          int v52 = v0 + v51;
          v50 = v52;
        }
        v47 = v50;
      } else {
        int v53 = 0;
        bool v54 = v2 != v53;
        int v55;
        if (v54) {
          int v56 = 4;
          v55 = v56;
        } else {
          int v57 = 4;
          int v58 = v0 + v57;
          v55 = v58;
        }
        v47 = v55;
      }
      v44 = v47;
      break;
    }
    case 0:
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
        bool v69 = v2 != v68;
        int v70;
        if (v69) {
          int v71 = 3;
          int v72 = v0 + v71;
          v70 = v72;
        } else {
          v70 = v0;
        }
        int v73 = 1;
        int v74 = v62 + v73;
        v61 = v70;
        v62 = v74;
      }
      v44 = v61;
      break;
    }
    case 1:
      {
      int v75 = 2;
      int v76 = v3 % v75;
      int v77 = 3;
      int v78 = v0 + v77;
      int v79;
      v79 = v78;
      switch (v76) {
        default:
          {
          int v80 = 2;
          int v81 = v3 % v80;
          int v82 = 1;
          int v83;
          v83 = v82;
          switch (v81) {
            case 0:
              {
              v83 = v0;
              break;
            }
            case 1:
              {
              int v84 = 1;
              v83 = v84;
              break;
            }
            default:
              {
              int v85 = 2;
              v83 = v85;
              break;
            }
          }
          v79 = v83;
          break;
        }
        case 0:
          {
          int v86 = 3;
          int v87 = v3 % v86;
          int v88 = 4;
          int v89;
          v89 = v88;
          switch (v87) {
            case 0:
              {
              int v90 = 4;
              int v91 = v0 + v90;
              v89 = v91;
              break;
            }
            default:
              {
              int v92 = 1;
              v89 = v92;
              break;
            }
            case 1:
              {
              v89 = v0;
              break;
            }
          }
          v79 = v89;
          break;
        }
        case 1:
          {
          int v93 = 3;
          int v94 = v3 % v93;
          int v95 = 2;
          int v96;
          v96 = v95;
          switch (v94) {
            case 0:
              {
              v96 = v0;
              break;
            }
            default:
              {
              int v97 = 2;
              int v98 = v0 + v97;
              v96 = v98;
              break;
            }
            case 1:
              {
              int v99 = 1;
              v96 = v99;
              break;
            }
          }
          v79 = v96;
          break;
        }
      }
      v44 = v79;
      break;
    }
  }
  int v100 = 0;
  bool v101 = v2 != v100;
  int v102 = v101 ? v39 : v44;
  return;
}

kernel void kernel_main(device int* v103 [[buffer(0)]], device int* v104 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v105 = static_cast<int>(__simt_tid3.x);
  int v106 = 0;
  int v107 = v106 + v105;
  int v108 = v104[v107];
  int v109 = 4;
  int v110 = v109 + v105;
  int v111 = v104[v110];
  int v112 = 0;
  bool v113 = v108 != v112;
  if (v113) {
    int v114 = 8;
    int v115 = v114 + v105;
    int v116 = v104[v115];
    int v117 = 0;
    bool v118 = v116 != v117;
    if (v118) {
      helper0(v105, v103, v108, v111, static_cast<int>(__simt_tid3.x));
    } else {
    }
  } else {
  }
  uint v119 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v120 = (int)(v119);
  int v121 = 12;
  int v122 = v121 + v105;
  int v123 = v104[v122];
  uint v124 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v125 = (int)(v124);
  int v126;
  v126 = v125;
  switch (v123) {
    case 0:
      {
      int v127 = 16;
      int v128 = v127 + v105;
      int v129 = v104[v128];
      int v130 = 0;
      bool v131 = v129 != v130;
      int v132;
      if (v131) {
        v132 = v105;
      } else {
        int v133 = 20;
        int v134 = v133 + v105;
        int v135 = v104[v134];
        int v136 = 0;
        int v137 = v105 + v136;
        int v138;
        v138 = v137;
        switch (v135) {
          default:
            {
            int v139 = 1;
            v138 = v139;
            break;
          }
          case 0:
            {
            v138 = v105;
            break;
          }
        }
        v132 = v138;
      }
      v126 = v132;
      break;
    }
    default:
      {
      int v140 = 24;
      int v141 = v140 + v105;
      int v142 = v104[v141];
      int v143 = 0;
      bool v144 = v142 != v143;
      int v145;
      if (v144) {
        int v146 = 28;
        int v147 = v146 + v105;
        int v148 = v104[v147];
        int v149 = 0;
        bool v150 = v148 != v149;
        int v151;
        if (v150) {
          int v152 = 3;
          int v153 = v105 + v152;
          v151 = v153;
        } else {
          int v154 = 2;
          v151 = v154;
        }
        v145 = v151;
      } else {
        int v155 = 32;
        int v156 = v155 + v105;
        int v157 = v104[v156];
        int v158;
        v158 = v105;
        switch (v157) {
          case 0:
            {
            v158 = v105;
          }
          default:
            {
            v158 = v105;
            break;
          }
          case 1:
            {
            v158 = v105;
          }
          case 2:
            {
            int v159 = 2;
            int v160 = v105 + v159;
            v158 = v160;
            break;
          }
        }
        v145 = v158;
      }
      v126 = v145;
      break;
    }
    case 1:
      {
      int v161 = 36;
      int v162 = v161 + v105;
      int v163 = v104[v162];
      int v164 = 2;
      int v165;
      v165 = v164;
      switch (v163) {
        default:
          {
          v165 = v105;
        }
        case 0:
          {
          int v166 = 3;
          v165 = v166;
          break;
        }
      }
      v126 = v165;
      break;
    }
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
    static int32_t expected0[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 41; ++idx) {
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
