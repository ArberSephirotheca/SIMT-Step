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
  int v4 = 3;
  int v5 = v3 % v4;
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 0;
      bool v10 = v2 != v9;
      int v11;
      if (v10) {
        int v12 = 0;
        bool v13 = v2 != v12;
        int v14;
        if (v13) {
          int v15 = 0;
          v14 = v15;
        } else {
          int v16 = 4;
          v14 = v16;
        }
        v11 = v14;
      } else {
        int v17 = 0;
        bool v18 = v2 != v17;
        int v19;
        if (v18) {
          int v20 = 3;
          v19 = v20;
        } else {
          int v21 = 3;
          v19 = v21;
        }
        v11 = v19;
      }
      v8 = v11;
      break;
    }
    default:
      {
      int v22 = 3;
      int v23 = v3 % v22;
      int v24 = 4;
      int v25 = v0 + v24;
      int v26;
      v26 = v25;
      switch (v23) {
        case 0:
          {
          int v27 = 2;
          int v28 = v3 % v27;
          int v29;
          v29 = v0;
          switch (v28) {
            default:
              {
              v29 = v0;
              break;
            }
            case 0:
              {
              v29 = v0;
              break;
            }
            case 1:
              {
              int v30 = 1;
              int v31 = v0 + v30;
              v29 = v31;
              break;
            }
          }
          v26 = v29;
          break;
        }
        case 1:
          {
          int v32 = 3;
          int v33 = v3 % v32;
          int v34;
          v34 = v0;
          switch (v33) {
            case 0:
              {
              int v35 = 0;
              v34 = v35;
              break;
            }
            case 1:
              {
              v34 = v0;
              break;
            }
            default:
              {
              int v36 = 4;
              v34 = v36;
              break;
            }
          }
          v26 = v34;
          break;
        }
        case 2:
          {
          int v37 = 0;
          int v38 = 0;
          int v39;
          int v40;
          v39 = v37;
          v40 = v38;
          while (true) {
            int v41 = 4;
            int v42 = v3 % v41;
            int v43 = 1;
            int v44 = v42 + v43;
            bool v45 = v40 < v44;
            v39 = v39;
            v40 = v40;
            if (!v45) break;
            int v46 = 1;
            int v47 = v40 + v46;
            v39 = v0;
            v40 = v47;
            continue;
            ;
          }
          v26 = v39;
          break;
        }
        default:
          {
          int v48 = 0;
          bool v49 = v2 != v48;
          int v50;
          if (v49) {
            int v51 = 2;
            v50 = v51;
          } else {
            int v52 = 3;
            v50 = v52;
          }
          v26 = v50;
          break;
        }
      }
      v8 = v26;
      break;
    }
    case 1:
      {
      int v53 = 0;
      bool v54 = v2 != v53;
      int v55;
      if (v54) {
        int v56 = 4;
        v55 = v56;
      } else {
        int v57 = 1;
        int v58 = v0 + v57;
        v55 = v58;
      }
      v8 = v55;
      break;
    }
    case 2:
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
          int v71 = 0;
          int v72 = v0 + v71;
          v70 = v72;
        } else {
          int v73 = 4;
          int v74 = v0 + v73;
          v70 = v74;
        }
        int v75 = 1;
        int v76 = v62 + v75;
        v61 = v70;
        v62 = v76;
      }
      v8 = v61;
      break;
    }
  }
  bool v77 = true;
  int v78 = simt_wave_count_bits(v77);
  int v79 = 0;
  int v80 = v79 + v0;
  v1[v80] = v78;
  return;
}

kernel void kernel_main(device int* v81 [[buffer(0)]], device int* v82 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v83 = static_cast<int>(__simt_tid3.x);
  int v84 = 0;
  int v85 = v84 + v83;
  int v86 = v82[v85];
  int v87 = 4;
  int v88 = v87 + v83;
  int v89 = v82[v88];
  int v90 = 0;
  bool v91 = v86 != v90;
  if (v91) {
    int v92 = 0;
    int v93 = 0;
    int v94;
    int v95;
    v94 = v92;
    v95 = v93;
    while (true) {
      int v96 = 1;
      bool v97 = v95 < v96;
      v94 = v94;
      v95 = v95;
      if (!v97) break;
      helper0(v83, v81, v86, v89, static_cast<int>(__simt_tid3.x));
      int v98 = 1;
      int v99 = v95 + v98;
      v94 = v94;
      v95 = v99;
    }
  } else {
  }
  int v100 = 8;
  int v101 = v100 + v83;
  int v102 = v82[v101];
  int v103 = 0;
  int v104 = v83 + v103;
  int v105;
  v105 = v104;
  switch (v102) {
    case 0:
      {
      v105 = v83;
      break;
    }
    default:
      {
      int v106 = 12;
      int v107 = v106 + v83;
      int v108 = v82[v107];
      int v109 = 0;
      bool v110 = v108 != v109;
      int v111;
      if (v110) {
        int v112 = 16;
        int v113 = v112 + v83;
        int v114 = v82[v113];
        int v115 = 0;
        bool v116 = v114 != v115;
        int v117;
        if (v116) {
          int v118 = 4;
          v117 = v118;
        } else {
          int v119 = 2;
          v117 = v119;
        }
        v111 = v117;
      } else {
        int v120 = 0;
        int v121 = 0;
        int v122;
        int v123;
        v122 = v120;
        v123 = v121;
        while (true) {
          int v124 = 4;
          int v125 = v123 * v124;
          int v126 = v125 + v83;
          int v127 = 20;
          int v128 = v127 + v126;
          int v129 = v82[v128];
          int v130 = 0;
          bool v131 = v129 != v130;
          v122 = v122;
          v123 = v123;
          if (!v131) break;
          int v132 = v122 + v123;
          int v133 = 1;
          int v134 = v123 + v133;
          bool v135 = true;
          v122 = v132;
          v123 = v134;
          continue;
          ;
        }
        v111 = v122;
      }
      v105 = v111;
      break;
    }
  }
  int v136 = 0;
  int v137 = 0;
  int v138;
  int v139;
  v138 = v136;
  v139 = v137;
  while (true) {
    int v140 = 4;
    int v141 = v139 * v140;
    int v142 = v141 + v83;
    int v143 = 40;
    int v144 = v143 + v142;
    int v145 = v82[v144];
    int v146 = 0;
    bool v147 = v145 != v146;
    v138 = v138;
    v139 = v139;
    if (!v147) break;
    int v148 = 0;
    int v149 = 0;
    int v150;
    int v151;
    v150 = v148;
    v151 = v149;
    while (true) {
      int v152 = 4;
      int v153 = v151 * v152;
      int v154 = v153 + v83;
      int v155 = 60;
      int v156 = v155 + v154;
      int v157 = v82[v156];
      int v158 = 0;
      bool v159 = v157 != v158;
      v150 = v150;
      v151 = v151;
      if (!v159) break;
      int v160 = v150 + v151;
      int v161 = 1;
      int v162 = v151 + v161;
      bool v163 = true;
      int v164 = 16;
      int v165 = 4;
      int v166 = v151 * v165;
      int v167 = v164 + v166;
      int v168 = v167 + v83;
      bool v169 = true;
      int v170 = simt_wave_count_bits(v169);
      v81[v168] = v170;
      v150 = v160;
      v151 = v162;
    }
    int v171 = v138 + v150;
    int v172 = 1;
    int v173 = v139 + v172;
    bool v174 = true;
    int v175 = 32;
    int v176 = 4;
    int v177 = v139 * v176;
    int v178 = v175 + v177;
    int v179 = v178 + v83;
    bool v180 = true;
    int v181 = simt_wave_count_bits(v180);
    v81[v179] = v181;
    v138 = v171;
    v139 = v173;
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 48; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 80; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
