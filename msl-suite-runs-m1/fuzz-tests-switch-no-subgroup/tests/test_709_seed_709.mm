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
  int v8 = 2;
  int v9 = v3 % v8;
  int v10;
  v10 = v0;
  switch (v9) {
    default:
      {
      int v11 = 3;
      int v12 = v3 % v11;
      int v13 = 4;
      int v14;
      v14 = v13;
      switch (v12) {
        default:
          {
          int v15 = 1;
          int v16;
          v16 = v15;
          switch (v3) {
            case 0:
              {
              int v17 = 1;
              int v18 = v0 + v17;
              v16 = v18;
              break;
            }
            default:
              {
              int v19 = 3;
              v16 = v19;
              break;
            }
          }
          v14 = v16;
          break;
        }
        case 0:
          {
          int v20 = 0;
          bool v21 = v2 != v20;
          int v22;
          if (v21) {
            int v23 = 4;
            v22 = v23;
          } else {
            v22 = v0;
          }
          v14 = v22;
          break;
        }
        case 1:
          {
          int v24 = 2;
          int v25 = v0 + v24;
          int v26;
          v26 = v25;
          switch (v3) {
            default:
              {
              v26 = v0;
              break;
            }
            case 0:
              {
              int v27 = 1;
              v26 = v27;
              break;
            }
          }
          int v28 = 3;
          v14 = v26;
          break;
        }
        case 2:
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
            int v38 = 1;
            int v39 = v32 + v38;
            v31 = v0;
            v32 = v39;
          }
          v14 = v31;
          break;
        }
      }
      v10 = v14;
      break;
    }
    case 0:
      {
      int v40 = 0;
      bool v41 = v2 != v40;
      int v42;
      if (v41) {
        int v43 = 3;
        v42 = v43;
      } else {
        int v44;
        v44 = v0;
        switch (v3) {
          case 0:
            {
            int v45 = 3;
            int v46 = v0 + v45;
            v44 = v46;
          }
          default:
            {
            v44 = v0;
            break;
          }
        }
        v42 = v44;
      }
      v10 = v42;
      break;
    }
  }
  bool v47 = true;
  int v48 = simt_wave_count_bits(v47);
  int v49 = 16;
  int v50 = v49 + v0;
  v1[v50] = v48;
  int v51 = 0;
  bool v52 = v2 != v51;
  int v53 = v52 ? v5 : v10;
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
  helper0(v56, v54, v59, v62, static_cast<int>(__simt_tid3.x));
  int v63 = 8;
  int v64 = v63 + v56;
  int v65 = v55[v64];
  int v66 = 2;
  int v67;
  v67 = v66;
  switch (v65) {
    case 0:
      {
      v67 = v56;
    }
    case 1:
      {
      int v68 = 2;
      v67 = v68;
    }
    default:
      {
      int v69 = 12;
      int v70 = v69 + v56;
      int v71 = v55[v70];
      int v72 = 0;
      bool v73 = v71 != v72;
      int v74;
      if (v73) {
        int v75 = 16;
        int v76 = v75 + v56;
        int v77 = v55[v76];
        int v78;
        v78 = v56;
        switch (v77) {
          default:
            {
            v78 = v56;
            break;
          }
          case 0:
            {
            int v79 = 4;
            v78 = v79;
            break;
          }
          case 1:
            {
            v78 = v56;
            break;
          }
        }
        v74 = v78;
      } else {
        int v80 = 20;
        int v81 = v80 + v56;
        int v82 = v55[v81];
        int v83 = 0;
        bool v84 = v82 != v83;
        int v85;
        if (v84) {
          v85 = v56;
        } else {
          int v86 = 1;
          int v87 = v56 + v86;
          v85 = v87;
        }
        v74 = v85;
      }
      v67 = v74;
      break;
    }
  }
  int v88 = 24;
  int v89 = v88 + v56;
  int v90 = v55[v89];
  uint v91 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v92 = (int)(v91);
  int v93;
  v93 = v92;
  switch (v90) {
    case 0:
      {
      int v94 = 28;
      int v95 = v94 + v56;
      int v96 = v55[v95];
      int v97 = 2;
      int v98 = v56 + v97;
      int v99;
      v99 = v98;
      switch (v96) {
        case 0:
          {
          int v100 = 0;
          v99 = v100;
          break;
        }
        default:
          {
          int v101 = 2;
          v99 = v101;
          break;
        }
      }
      v93 = v99;
      break;
    }
    case 1:
      {
      int v102 = 32;
      int v103 = v102 + v56;
      int v104 = v55[v103];
      int v105 = 0;
      bool v106 = v104 != v105;
      int v107;
      if (v106) {
        int v108 = 0;
        int v109 = 0;
        int v110;
        int v111;
        v110 = v108;
        v111 = v109;
        while (true) {
          int v112 = 4;
          int v113 = v111 * v112;
          int v114 = v113 + v56;
          int v115 = 36;
          int v116 = v115 + v114;
          int v117 = v55[v116];
          int v118 = 0;
          bool v119 = v117 != v118;
          v110 = v110;
          v111 = v111;
          if (!v119) break;
          int v120 = v110 + v111;
          int v121 = 1;
          int v122 = v111 + v121;
          bool v123 = true;
          v110 = v120;
          v111 = v122;
        }
        v107 = v110;
      } else {
        int v124 = 56;
        int v125 = v124 + v56;
        int v126 = v55[v125];
        int v127 = 0;
        bool v128 = v126 != v127;
        int v129;
        if (v128) {
          v129 = v56;
        } else {
          int v130 = 4;
          v129 = v130;
        }
        v107 = v129;
      }
      v93 = v107;
      break;
    }
    case 2:
      {
      int v131 = 0;
      int v132 = 0;
      int v133;
      int v134;
      v133 = v131;
      v134 = v132;
      while (true) {
        int v135 = 4;
        int v136 = v134 * v135;
        int v137 = v136 + v56;
        int v138 = 60;
        int v139 = v138 + v137;
        int v140 = v55[v139];
        int v141 = 0;
        bool v142 = v140 != v141;
        v133 = v133;
        v134 = v134;
        if (!v142) break;
        int v143 = v133 + v134;
        int v144 = 1;
        int v145 = v134 + v144;
        bool v146 = true;
        v133 = v143;
        v134 = v145;
      }
      v93 = v133;
      break;
    }
    default:
      {
      int v147 = 80;
      int v148 = v147 + v56;
      int v149 = v55[v148];
      int v150;
      v150 = v56;
      switch (v149) {
        case 0:
          {
          int v151 = 84;
          int v152 = v151 + v56;
          int v153 = v55[v152];
          int v154 = 0;
          bool v155 = v153 != v154;
          int v156;
          if (v155) {
            int v157 = 3;
            v156 = v157;
          } else {
            int v158 = 2;
            int v159 = v56 + v158;
            v156 = v159;
          }
          v150 = v156;
          break;
        }
        case 1:
          {
          int v160 = 88;
          int v161 = v160 + v56;
          int v162 = v55[v161];
          int v163 = 0;
          bool v164 = v162 != v163;
          int v165;
          if (v164) {
            v165 = v56;
          } else {
            v165 = v56;
          }
          v150 = v165;
          break;
        }
        default:
          {
          int v166 = 92;
          int v167 = v166 + v56;
          int v168 = v55[v167];
          int v169 = 0;
          bool v170 = v168 != v169;
          int v171;
          if (v170) {
            int v172 = 4;
            v171 = v172;
          } else {
            v171 = v56;
          }
          v150 = v171;
          break;
        }
        case 2:
          {
          int v173 = 96;
          int v174 = v173 + v56;
          int v175 = v55[v174];
          int v176 = 3;
          int v177 = v56 + v176;
          int v178;
          v178 = v177;
          switch (v175) {
            case 0:
              {
              int v179 = 0;
              v178 = v179;
              break;
            }
            case 1:
              {
              int v180 = 2;
              int v181 = v56 + v180;
              v178 = v181;
              break;
            }
            default:
              {
              int v182 = 3;
              int v183 = v56 + v182;
              v178 = v183;
              break;
            }
          }
          bool v184 = true;
          v150 = v178;
          break;
        }
      }
      v93 = v150;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 20; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 100; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
