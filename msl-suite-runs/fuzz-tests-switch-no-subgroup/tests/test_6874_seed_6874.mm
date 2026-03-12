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
      bool v22 = true;
      int v23 = simt_wave_count_bits(v22);
      int v24 = 0;
      int v25 = 4;
      int v26 = v16 * v25;
      int v27 = v24 + v26;
      int v28 = v27 + v0;
      v1[v28] = v23;
      int v29 = 1;
      int v30 = v16 + v29;
      v15 = v23;
      v16 = v30;
      continue;
      ;
    }
    int v31 = 1;
    int v32 = v7 + v31;
    v6 = v15;
    v7 = v32;
  }
  int v33 = 0;
  int v34 = 0;
  int v35;
  int v36;
  v35 = v33;
  v36 = v34;
  while (true) {
    int v37 = 4;
    int v38 = v3 % v37;
    int v39 = 1;
    int v40 = v38 + v39;
    bool v41 = v36 < v40;
    v35 = v35;
    v36 = v36;
    if (!v41) break;
    int v42 = 4;
    int v43 = v3 % v42;
    uint v44 = simt_lane_id(__simt_tid);
    int v45 = (int)(v44);
    int v46;
    v46 = v45;
    switch (v43) {
      case 0:
        {
        int v47 = 0;
        int v48 = 0;
        int v49;
        int v50;
        v49 = v47;
        v50 = v48;
        while (true) {
          int v51 = 4;
          int v52 = v3 % v51;
          int v53 = 1;
          int v54 = v52 + v53;
          bool v55 = v50 < v54;
          v49 = v49;
          v50 = v50;
          if (!v55) break;
          int v56 = 2;
          int v57 = 1;
          int v58 = v50 + v57;
          v49 = v56;
          v50 = v58;
        }
        v46 = v49;
        break;
      }
      default:
        {
        v46 = v0;
        break;
      }
      case 1:
        {
        int v59 = 2;
        int v60 = v0 + v59;
        v46 = v60;
        break;
      }
      case 2:
        {
        int v61 = 3;
        int v62 = v3 % v61;
        int v63 = 2;
        int v64 = v0 + v63;
        int v65;
        v65 = v64;
        switch (v62) {
          case 0:
            {
            v65 = v0;
          }
          default:
            {
            int v66 = 0;
            int v67 = v0 + v66;
            v65 = v67;
            break;
          }
          case 1:
            {
            int v68 = 2;
            v65 = v68;
          }
          case 2:
            {
            int v69 = 2;
            int v70 = v0 + v69;
            v65 = v70;
            break;
          }
        }
        int v71 = 2;
        v46 = v65;
        break;
      }
    }
    int v72 = 1;
    int v73 = v36 + v72;
    v35 = v46;
    v36 = v73;
  }
  int v74 = 0;
  bool v75 = v2 != v74;
  int v76 = v75 ? v6 : v35;
  return;
}

kernel void kernel_main(device int* v77 [[buffer(0)]], device int* v78 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v79 = static_cast<int>(__simt_tid3.x);
  int v80 = 0;
  int v81 = v80 + v79;
  int v82 = v78[v81];
  int v83 = 4;
  int v84 = v83 + v79;
  int v85 = v78[v84];
  helper0(v79, v77, v82, v85, static_cast<int>(__simt_tid3.x));
  int v86 = 8;
  int v87 = v86 + v79;
  int v88 = v78[v87];
  int v89 = 4;
  int v90 = v79 + v89;
  int v91;
  v91 = v90;
  switch (v88) {
    case 0:
      {
      int v92 = 12;
      int v93 = v92 + v79;
      int v94 = v78[v93];
      int v95;
      v95 = v79;
      switch (v94) {
        default:
          {
          v95 = v79;
          break;
        }
        case 0:
          {
          int v96 = 16;
          int v97 = v96 + v79;
          int v98 = v78[v97];
          int v99 = 0;
          int v100 = v79 + v99;
          int v101;
          v101 = v100;
          switch (v98) {
            case 0:
              {
              int v102 = 2;
              int v103 = v79 + v102;
              v101 = v103;
            }
            default:
              {
              int v104 = 1;
              v101 = v104;
              break;
            }
            case 1:
              {
              v101 = v79;
              break;
            }
          }
          bool v105 = true;
          v95 = v101;
          break;
        }
        case 1:
          {
          int v106 = 20;
          int v107 = v106 + v79;
          int v108 = v78[v107];
          int v109 = 0;
          int v110 = v79 + v109;
          int v111;
          v111 = v110;
          switch (v108) {
            case 0:
              {
              int v112 = 1;
              v111 = v112;
              break;
            }
            case 1:
              {
              v111 = v79;
              break;
            }
            default:
              {
              int v113 = 2;
              v111 = v113;
              break;
            }
          }
          v95 = v111;
          break;
        }
      }
      v91 = v95;
      break;
    }
    default:
      {
      int v114 = 0;
      int v115 = 0;
      int v116;
      int v117;
      v116 = v114;
      v117 = v115;
      while (true) {
        int v118 = 4;
        int v119 = v117 * v118;
        int v120 = v119 + v79;
        int v121 = 24;
        int v122 = v121 + v120;
        int v123 = v78[v122];
        int v124 = 0;
        bool v125 = v123 != v124;
        v116 = v116;
        v117 = v117;
        if (!v125) break;
        int v126 = 2;
        int v127 = v116 + v126;
        int v128 = 1;
        int v129 = v117 + v128;
        bool v130 = true;
        v116 = v127;
        v117 = v129;
      }
      v91 = v116;
    }
    case 1:
      {
      int v131 = 44;
      int v132 = v131 + v79;
      int v133 = v78[v132];
      int v134 = 1;
      int v135 = v79 + v134;
      int v136;
      v136 = v135;
      switch (v133) {
        case 0:
          {
          int v137 = 48;
          int v138 = v137 + v79;
          int v139 = v78[v138];
          int v140 = 1;
          int v141 = v79 + v140;
          int v142;
          v142 = v141;
          switch (v139) {
            case 0:
              {
              int v143 = 2;
              int v144 = v79 + v143;
              v142 = v144;
              break;
            }
            default:
              {
              int v145 = 2;
              v142 = v145;
              break;
            }
          }
          v136 = v142;
          break;
        }
        case 1:
          {
          int v146 = 52;
          int v147 = v146 + v79;
          int v148 = v78[v147];
          int v149 = 0;
          int v150 = v79 + v149;
          int v151;
          v151 = v150;
          switch (v148) {
            case 0:
              {
              int v152 = 0;
              v151 = v152;
              break;
            }
            default:
              {
              int v153 = 1;
              v151 = v153;
              break;
            }
            case 1:
              {
              int v154 = 0;
              int v155 = v79 + v154;
              v151 = v155;
              break;
            }
          }
          v136 = v151;
          break;
        }
        default:
          {
          int v156 = 56;
          int v157 = v156 + v79;
          int v158 = v78[v157];
          int v159;
          v159 = v79;
          switch (v158) {
            default:
              {
              v159 = v79;
              break;
            }
            case 0:
              {
              v159 = v79;
              break;
            }
            case 1:
              {
              int v160 = 3;
              v159 = v160;
              break;
            }
            case 2:
              {
              v159 = v79;
              break;
            }
          }
          v136 = v159;
          break;
        }
      }
      bool v161 = true;
      v91 = v136;
    }
    case 2:
      {
      int v162 = 60;
      int v163 = v162 + v79;
      int v164 = v78[v163];
      int v165 = 0;
      int v166;
      v166 = v165;
      switch (v164) {
        case 0:
          {
          int v167 = 64;
          int v168 = v167 + v79;
          int v169 = v78[v168];
          int v170 = 2;
          int v171;
          v171 = v170;
          switch (v169) {
            case 0:
              {
              v171 = v79;
              break;
            }
            default:
              {
              int v172 = 0;
              int v173 = v79 + v172;
              v171 = v173;
              break;
            }
          }
          bool v174 = true;
          v166 = v171;
        }
        case 1:
          {
          int v175 = 68;
          int v176 = v175 + v79;
          int v177 = v78[v176];
          int v178 = 0;
          int v179;
          v179 = v178;
          switch (v177) {
            case 0:
              {
              v179 = v79;
              break;
            }
            default:
              {
              int v180 = 3;
              int v181 = v79 + v180;
              v179 = v181;
              break;
            }
          }
          v166 = v179;
        }
        default:
          {
          int v182 = 72;
          int v183 = v182 + v79;
          int v184 = v78[v183];
          int v185 = 2;
          int v186 = v79 + v185;
          int v187;
          v187 = v186;
          switch (v184) {
            default:
              {
              int v188 = 3;
              int v189 = v79 + v188;
              v187 = v189;
            }
            case 0:
              {
              int v190 = 4;
              int v191 = v79 + v190;
              v187 = v191;
              break;
            }
            case 1:
              {
              v187 = v79;
              break;
            }
          }
          v166 = v187;
          break;
        }
      }
      v91 = v166;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 16; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 76; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
