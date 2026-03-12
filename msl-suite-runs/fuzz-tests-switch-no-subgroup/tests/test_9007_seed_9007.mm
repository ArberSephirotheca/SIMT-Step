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
  uint v10 = simt_lane_id(__simt_tid);
  int v11 = (int)(v10);
  int v12;
  v12 = v11;
  switch (v9) {
    case 0:
      {
      int v13 = 4;
      int v14 = v3 % v13;
      int v15 = 1;
      int v16;
      v16 = v15;
      switch (v14) {
        default:
          {
          int v17 = 0;
          bool v18 = v2 != v17;
          int v19;
          if (v18) {
            int v20 = 4;
            int v21 = v0 + v20;
            v19 = v21;
          } else {
            int v22 = 2;
            int v23 = v0 + v22;
            v19 = v23;
          }
          v16 = v19;
        }
        case 0:
          {
          int v24 = 0;
          int v25 = 0;
          int v26;
          int v27;
          v26 = v24;
          v27 = v25;
          while (true) {
            int v28 = 4;
            int v29 = v3 % v28;
            int v30 = 1;
            int v31 = v29 + v30;
            bool v32 = v27 < v31;
            v26 = v26;
            v27 = v27;
            if (!v32) break;
            int v33 = 4;
            int v34 = v0 + v33;
            int v35 = 1;
            int v36 = v27 + v35;
            v26 = v34;
            v27 = v36;
            break;
            ;
          }
          v16 = v26;
        }
        case 1:
          {
          int v37 = 3;
          int v38 = v0 + v37;
          int v39;
          v39 = v38;
          switch (v3) {
            default:
              {
              int v40 = 2;
              int v41 = v0 + v40;
              v39 = v41;
            }
            case 0:
              {
              int v42 = 0;
              v39 = v42;
              break;
            }
          }
          int v43 = 0;
          int v44 = v0 + v43;
          v16 = v39;
        }
        case 2:
          {
          int v45 = 0;
          int v46 = 0;
          int v47;
          int v48;
          v47 = v45;
          v48 = v46;
          while (true) {
            int v49 = 4;
            int v50 = v3 % v49;
            int v51 = 1;
            int v52 = v50 + v51;
            bool v53 = v48 < v52;
            v47 = v47;
            v48 = v48;
            if (!v53) break;
            int v54 = 3;
            int v55 = 1;
            int v56 = v48 + v55;
            v47 = v54;
            v48 = v56;
          }
          v16 = v47;
          break;
        }
      }
      int v57 = 1;
      v12 = v16;
      break;
    }
    default:
      {
      int v58 = 0;
      int v59 = 0;
      int v60;
      int v61;
      v60 = v58;
      v61 = v59;
      while (true) {
        int v62 = 4;
        int v63 = v3 % v62;
        int v64 = 1;
        int v65 = v63 + v64;
        bool v66 = v61 < v65;
        v60 = v60;
        v61 = v61;
        if (!v66) break;
        int v67 = 2;
        int v68 = 1;
        int v69 = v61 + v68;
        v60 = v67;
        v61 = v69;
        break;
        ;
      }
      v12 = v60;
      break;
    }
    case 1:
      {
      int v70 = 4;
      int v71 = v3 % v70;
      int v72;
      v72 = v0;
      switch (v71) {
        case 0:
          {
          int v73 = 0;
          v72 = v73;
          break;
        }
        case 1:
          {
          int v74 = 2;
          int v75 = v3 % v74;
          int v76;
          v76 = v0;
          switch (v75) {
            default:
              {
              int v77 = 2;
              v76 = v77;
            }
            case 0:
              {
              v76 = v0;
              break;
            }
          }
          v72 = v76;
        }
        case 2:
          {
          int v78 = 4;
          int v79;
          v79 = v78;
          switch (v3) {
            case 0:
              {
              int v80 = 0;
              v79 = v80;
              break;
            }
            default:
              {
              int v81 = 3;
              int v82 = v0 + v81;
              v79 = v82;
              break;
            }
          }
          v72 = v79;
        }
        default:
          {
          int v83 = 4;
          int v84 = v3 % v83;
          int v85;
          v85 = v0;
          switch (v84) {
            case 0:
              {
              int v86 = 4;
              v85 = v86;
            }
            case 1:
              {
              int v87 = 2;
              int v88 = v0 + v87;
              v85 = v88;
            }
            default:
              {
              int v89 = 4;
              v85 = v89;
            }
            case 2:
              {
              int v90 = 4;
              v85 = v90;
              break;
            }
          }
          int v91 = 2;
          int v92 = v0 + v91;
          v72 = v85;
          break;
        }
      }
      v12 = v72;
      break;
    }
  }
  int v93 = 0;
  bool v94 = v2 != v93;
  int v95 = v94 ? v5 : v12;
  return;
}

kernel void kernel_main(device int* v96 [[buffer(0)]], device int* v97 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v98 = static_cast<int>(__simt_tid3.x);
  int v99 = 0;
  int v100 = v99 + v98;
  int v101 = v97[v100];
  int v102 = 4;
  int v103 = v102 + v98;
  int v104 = v97[v103];
  helper0(v98, v96, v101, v104, static_cast<int>(__simt_tid3.x));
  int v105 = 8;
  int v106 = v105 + v98;
  int v107 = v97[v106];
  int v108 = 1;
  int v109;
  v109 = v108;
  switch (v107) {
    default:
      {
      int v110 = 12;
      int v111 = v110 + v98;
      int v112 = v97[v111];
      int v113 = 0;
      int v114;
      v114 = v113;
      switch (v112) {
        case 0:
          {
          v114 = v98;
          break;
        }
        default:
          {
          int v115 = 16;
          int v116 = v115 + v98;
          int v117 = v97[v116];
          int v118 = 2;
          int v119 = v98 + v118;
          int v120;
          v120 = v119;
          switch (v117) {
            case 0:
              {
              int v121 = 4;
              int v122 = v98 + v121;
              v120 = v122;
              break;
            }
            default:
              {
              v120 = v98;
              break;
            }
          }
          v114 = v120;
          break;
        }
        case 1:
          {
          int v123 = 20;
          int v124 = v123 + v98;
          int v125 = v97[v124];
          int v126 = 0;
          bool v127 = v125 != v126;
          int v128;
          if (v127) {
            v128 = v98;
          } else {
            int v129 = 0;
            v128 = v129;
          }
          v114 = v128;
          break;
        }
      }
      bool v130 = true;
      v109 = v114;
    }
    case 0:
      {
      int v131 = 24;
      int v132 = v131 + v98;
      int v133 = v97[v132];
      int v134 = 0;
      bool v135 = v133 != v134;
      int v136;
      if (v135) {
        int v137 = 0;
        int v138 = 0;
        int v139;
        int v140;
        v139 = v137;
        v140 = v138;
        while (true) {
          int v141 = 4;
          int v142 = v140 * v141;
          int v143 = v142 + v98;
          int v144 = 28;
          int v145 = v144 + v143;
          int v146 = v97[v145];
          int v147 = 0;
          bool v148 = v146 != v147;
          v139 = v139;
          v140 = v140;
          if (!v148) break;
          int v149 = v139 + v140;
          int v150 = 1;
          int v151 = v140 + v150;
          bool v152 = true;
          v139 = v149;
          v140 = v151;
          continue;
          ;
        }
        v136 = v139;
      } else {
        int v153 = 0;
        int v154 = v98 + v153;
        v136 = v154;
      }
      v109 = v136;
    }
    case 1:
      {
      int v155 = 48;
      int v156 = v155 + v98;
      int v157 = v97[v156];
      int v158;
      v158 = v98;
      switch (v157) {
        case 0:
          {
          v158 = v98;
          break;
        }
        case 1:
          {
          int v159 = 52;
          int v160 = v159 + v98;
          int v161 = v97[v160];
          int v162 = 3;
          int v163 = v98 + v162;
          int v164;
          v164 = v163;
          switch (v161) {
            case 0:
              {
              int v165 = 1;
              v164 = v165;
              break;
            }
            default:
              {
              int v166 = 0;
              v164 = v166;
              break;
            }
          }
          v158 = v164;
          break;
        }
        default:
          {
          int v167 = 56;
          int v168 = v167 + v98;
          int v169 = v97[v168];
          int v170;
          v170 = v98;
          switch (v169) {
            case 0:
              {
              v170 = v98;
              break;
            }
            case 1:
              {
              int v171 = 1;
              int v172 = v98 + v171;
              v170 = v172;
            }
            default:
              {
              int v173 = 0;
              int v174 = v98 + v173;
              v170 = v174;
              break;
            }
          }
          v158 = v170;
          break;
        }
      }
      v109 = v158;
      break;
    }
  }
  bool v175 = true;
  int v176 = 16;
  int v177 = v176 + v98;
  bool v178 = true;
  int v179 = simt_wave_count_bits(v178);
  v96[v177] = v179;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 60; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
