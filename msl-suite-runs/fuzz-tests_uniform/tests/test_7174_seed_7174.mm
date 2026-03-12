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
  uint v4 = simt_lane_id(__simt_tid);
  int v5 = (int)(v4);
  int v6 = 3;
  int v7 = v3 % v6;
  int v8 = 2;
  int v9;
  v9 = v8;
  switch (v7) {
    default:
      {
      int v10 = 4;
      int v11 = v3 % v10;
      int v12;
      v12 = v0;
      switch (v11) {
        case 0:
          {
          int v13 = 0;
          int v14 = 0;
          int v15;
          int v16;
          v15 = v13;
          v16 = v14;
          while (true) {
            int v17 = 4;
            int v18 = v3 % v17;
            int v19 = 1;
            int v20 = v18 + v19;
            bool v21 = v16 < v20;
            v15 = v15;
            v16 = v16;
            if (!v21) break;
            int v22 = 1;
            int v23 = v16 + v22;
            v15 = v0;
            v16 = v23;
          }
          v12 = v15;
        }
        default:
          {
          int v24 = 3;
          int v25 = v3 % v24;
          int v26 = 2;
          int v27 = v0 + v26;
          int v28;
          v28 = v27;
          switch (v25) {
            default:
              {
              int v29 = 0;
              v28 = v29;
              break;
            }
            case 0:
              {
              int v30 = 4;
              v28 = v30;
              break;
            }
            case 1:
              {
              int v31 = 3;
              int v32 = v0 + v31;
              v28 = v32;
            }
            case 2:
              {
              v28 = v0;
              break;
            }
          }
          int v33 = 0;
          v12 = v28;
          break;
        }
        case 1:
          {
          int v34 = 0;
          int v35 = 0;
          int v36;
          int v37;
          v36 = v34;
          v37 = v35;
          while (true) {
            int v38 = 4;
            int v39 = v3 % v38;
            int v40 = 1;
            int v41 = v39 + v40;
            bool v42 = v37 < v41;
            v36 = v36;
            v37 = v37;
            if (!v42) break;
            int v43 = 3;
            int v44 = 1;
            int v45 = v37 + v44;
            v36 = v43;
            v37 = v45;
            continue;
            ;
          }
          int v46 = 3;
          v12 = v36;
        }
        case 2:
          {
          int v47 = 2;
          int v48 = v3 % v47;
          int v49 = 3;
          int v50 = v0 + v49;
          int v51;
          v51 = v50;
          switch (v48) {
            case 0:
              {
              v51 = v0;
              break;
            }
            default:
              {
              v51 = v0;
              break;
            }
            case 1:
              {
              v51 = v0;
              break;
            }
          }
          int v52 = 4;
          v12 = v51;
          break;
        }
      }
      v9 = v12;
      break;
    }
    case 0:
      {
      int v53 = 2;
      int v54 = v3 % v53;
      int v55 = 1;
      int v56;
      v56 = v55;
      switch (v54) {
        default:
          {
          int v57 = 4;
          int v58 = v3 % v57;
          int v59;
          v59 = v0;
          switch (v58) {
            case 0:
              {
              int v60 = 3;
              v59 = v60;
              break;
            }
            default:
              {
              v59 = v0;
              break;
            }
            case 1:
              {
              int v61 = 3;
              int v62 = v0 + v61;
              v59 = v62;
              break;
            }
            case 2:
              {
              int v63 = 4;
              v59 = v63;
              break;
            }
          }
          v56 = v59;
          break;
        }
        case 0:
          {
          int v64 = 4;
          int v65 = v3 % v64;
          int v66 = 2;
          int v67 = v0 + v66;
          int v68;
          v68 = v67;
          switch (v65) {
            case 0:
              {
              int v69 = 4;
              int v70 = v0 + v69;
              v68 = v70;
            }
            default:
              {
              int v71 = 1;
              v68 = v71;
              break;
            }
            case 1:
              {
              int v72 = 3;
              int v73 = v0 + v72;
              v68 = v73;
              break;
            }
            case 2:
              {
              int v74 = 1;
              int v75 = v0 + v74;
              v68 = v75;
              break;
            }
          }
          int v76 = 0;
          int v77 = v0 + v76;
          v56 = v68;
          break;
        }
      }
      int v78 = 2;
      v9 = v56;
    }
    case 1:
      {
      int v79 = 2;
      int v80 = v3 % v79;
      int v81 = 4;
      int v82 = v0 + v81;
      int v83;
      v83 = v82;
      switch (v80) {
        case 0:
          {
          int v84 = 0;
          int v85 = 0;
          int v86;
          int v87;
          v86 = v84;
          v87 = v85;
          while (true) {
            int v88 = 4;
            int v89 = v3 % v88;
            int v90 = 1;
            int v91 = v89 + v90;
            bool v92 = v87 < v91;
            v86 = v86;
            v87 = v87;
            if (!v92) break;
            int v93 = 0;
            int v94 = 1;
            int v95 = v87 + v94;
            v86 = v93;
            v87 = v95;
          }
          int v96 = 4;
          int v97 = v0 + v96;
          v83 = v86;
          break;
        }
        default:
          {
          int v98 = 2;
          int v99;
          v99 = v98;
          switch (v3) {
            case 0:
              {
              int v100 = 1;
              int v101 = v0 + v100;
              v99 = v101;
            }
            default:
              {
              v99 = v0;
              break;
            }
          }
          int v102 = 3;
          v83 = v99;
          break;
        }
      }
      int v103 = 3;
      int v104 = v0 + v103;
      v9 = v83;
    }
    case 2:
      {
      int v105 = 0;
      int v106 = 0;
      int v107;
      int v108;
      v107 = v105;
      v108 = v106;
      while (true) {
        int v109 = 4;
        int v110 = v3 % v109;
        int v111 = 1;
        int v112 = v110 + v111;
        bool v113 = v108 < v112;
        v107 = v107;
        v108 = v108;
        if (!v113) break;
        int v114 = 1;
        int v115 = v108 + v114;
        v107 = v0;
        v108 = v115;
        break;
        ;
      }
      v9 = v107;
      break;
    }
  }
  bool v116 = true;
  int v117 = simt_wave_count_bits(v116);
  int v118 = 0;
  int v119 = v118 + v0;
  v1[v119] = v117;
  int v120 = 0;
  bool v121 = v2 != v120;
  int v122 = v121 ? v5 : v9;
  return;
}

kernel void kernel_main(device int* v123 [[buffer(0)]], device int* v124 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v125 = static_cast<int>(__simt_tid3.x);
  int v126 = 0;
  int v127 = v126 + v125;
  int v128 = v124[v127];
  int v129 = 4;
  int v130 = v129 + v125;
  int v131 = v124[v130];
  helper0(v125, v123, v128, v131, static_cast<int>(__simt_tid3.x));
  int v132 = 2;
  int v133 = v125 + v132;
  int v134 = 8;
  int v135 = v134 + v125;
  int v136 = v124[v135];
  int v137 = 0;
  bool v138 = v136 != v137;
  int v139;
  if (v138) {
    int v140 = 12;
    int v141 = v140 + v125;
    int v142 = v124[v141];
    int v143 = 3;
    int v144 = v125 + v143;
    int v145;
    v145 = v144;
    switch (v142) {
      default:
        {
        int v146 = 16;
        int v147 = v146 + v125;
        int v148 = v124[v147];
        int v149 = 0;
        bool v150 = v148 != v149;
        int v151;
        if (v150) {
          int v152 = 1;
          int v153 = v125 + v152;
          v151 = v153;
        } else {
          int v154 = 2;
          v151 = v154;
        }
        v145 = v151;
      }
      case 0:
        {
        int v155 = 20;
        int v156 = v155 + v125;
        int v157 = v124[v156];
        int v158 = 0;
        bool v159 = v157 != v158;
        int v160;
        if (v159) {
          v160 = v125;
        } else {
          int v161 = 0;
          int v162 = v125 + v161;
          v160 = v162;
        }
        v145 = v160;
        break;
      }
      case 1:
        {
        int v163 = 24;
        int v164 = v163 + v125;
        int v165 = v124[v164];
        int v166 = 0;
        bool v167 = v165 != v166;
        int v168;
        if (v167) {
          int v169 = 1;
          int v170 = v125 + v169;
          v168 = v170;
        } else {
          int v171 = 0;
          v168 = v171;
        }
        v145 = v168;
        break;
      }
    }
    bool v172 = true;
    v139 = v145;
  } else {
    int v173 = 28;
    int v174 = v173 + v125;
    int v175 = v124[v174];
    int v176 = 0;
    bool v177 = v175 != v176;
    int v178;
    if (v177) {
      int v179 = 32;
      int v180 = v179 + v125;
      int v181 = v124[v180];
      uint v182 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v183 = (int)(v182);
      int v184;
      v184 = v183;
      switch (v181) {
        case 0:
          {
          int v185 = 3;
          int v186 = v125 + v185;
          v184 = v186;
          break;
        }
        case 1:
          {
          int v187 = 0;
          v184 = v187;
          break;
        }
        default:
          {
          int v188 = 4;
          int v189 = v125 + v188;
          v184 = v189;
          break;
        }
        case 2:
          {
          int v190 = 1;
          v184 = v190;
          break;
        }
      }
      bool v191 = true;
      v178 = v184;
    } else {
      uint v192 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v193 = (int)(v192);
      v178 = v193;
    }
    v139 = v178;
  }
  int v194 = 16;
  int v195 = v194 + v125;
  bool v196 = true;
  int v197 = simt_wave_count_bits(v196);
  v123[v195] = v197;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 36; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
