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
  int v6;
  v6 = v0;
  switch (v5) {
    case 0:
      {
      int v7 = 0;
      bool v8 = v2 != v7;
      int v9;
      if (v8) {
        int v10 = 0;
        int v11 = 0;
        int v12;
        int v13;
        v12 = v10;
        v13 = v11;
        while (true) {
          int v14 = 4;
          int v15 = v3 % v14;
          int v16 = 1;
          int v17 = v15 + v16;
          bool v18 = v13 < v17;
          v12 = v12;
          v13 = v13;
          if (!v18) break;
          int v19 = 1;
          int v20 = 1;
          int v21 = v13 + v20;
          v12 = v19;
          v13 = v21;
        }
        int v22 = 3;
        v9 = v12;
      } else {
        int v23 = 3;
        int v24 = v0 + v23;
        v9 = v24;
      }
      int v25 = 0;
      int v26 = v0 + v25;
      v6 = v9;
    }
    case 1:
      {
      int v27 = 0;
      bool v28 = v2 != v27;
      int v29;
      if (v28) {
        int v30 = 0;
        bool v31 = v2 != v30;
        int v32;
        if (v31) {
          v32 = v0;
        } else {
          int v33 = 3;
          int v34 = v0 + v33;
          v32 = v34;
        }
        int v35 = 2;
        v29 = v32;
      } else {
        int v36 = 3;
        int v37 = v3 % v36;
        int v38;
        v38 = v0;
        switch (v37) {
          case 0:
            {
            int v39 = 1;
            int v40 = v0 + v39;
            v38 = v40;
            break;
          }
          default:
            {
            int v41 = 2;
            v38 = v41;
            break;
          }
          case 1:
            {
            v38 = v0;
            break;
          }
        }
        v29 = v38;
      }
      int v42 = 2;
      int v43 = v0 + v42;
      v6 = v29;
    }
    default:
      {
      int v44 = 3;
      int v45 = v3 % v44;
      int v46 = 3;
      int v47 = v0 + v46;
      int v48;
      v48 = v47;
      switch (v45) {
        case 0:
          {
          int v49 = 4;
          int v50 = v3 % v49;
          int v51 = 0;
          int v52;
          v52 = v51;
          switch (v50) {
            case 0:
              {
              int v53 = 1;
              v52 = v53;
            }
            case 1:
              {
              int v54 = 1;
              v52 = v54;
              break;
            }
            case 2:
              {
              int v55 = 0;
              v52 = v55;
            }
            default:
              {
              v52 = v0;
              break;
            }
          }
          int v56 = 0;
          v48 = v52;
        }
        default:
          {
          int v57 = 0;
          bool v58 = v2 != v57;
          int v59;
          if (v58) {
            int v60 = 4;
            int v61 = v0 + v60;
            v59 = v61;
          } else {
            int v62 = 3;
            v59 = v62;
          }
          int v63 = 2;
          v48 = v59;
        }
        case 1:
          {
          int v64 = 4;
          int v65 = v3 % v64;
          int v66 = 0;
          int v67 = v0 + v66;
          int v68;
          v68 = v67;
          switch (v65) {
            case 0:
              {
              int v69 = 2;
              int v70 = v0 + v69;
              v68 = v70;
              break;
            }
            case 1:
              {
              v68 = v0;
            }
            case 2:
              {
              int v71 = 3;
              int v72 = v0 + v71;
              v68 = v72;
            }
            default:
              {
              v68 = v0;
              break;
            }
          }
          int v73 = 4;
          int v74 = v0 + v73;
          v48 = v68;
          break;
        }
        case 2:
          {
          int v75 = 0;
          int v76 = 0;
          int v77;
          int v78;
          v77 = v75;
          v78 = v76;
          while (true) {
            int v79 = 4;
            int v80 = v3 % v79;
            int v81 = 1;
            int v82 = v80 + v81;
            bool v83 = v78 < v82;
            v77 = v77;
            v78 = v78;
            if (!v83) break;
            int v84 = 1;
            int v85 = v78 + v84;
            v77 = v0;
            v78 = v85;
          }
          int v86 = 3;
          int v87 = v0 + v86;
          v48 = v77;
          break;
        }
      }
      int v88 = 4;
      int v89 = v0 + v88;
      v6 = v48;
    }
    case 2:
      {
      int v90 = 3;
      int v91 = v3 % v90;
      int v92 = 1;
      int v93;
      v93 = v92;
      switch (v91) {
        case 0:
          {
          int v94 = 0;
          bool v95 = v2 != v94;
          int v96;
          if (v95) {
            int v97 = 1;
            v96 = v97;
          } else {
            int v98 = 4;
            v96 = v98;
          }
          int v99 = 2;
          int v100 = v0 + v99;
          v93 = v96;
          break;
        }
        default:
          {
          int v101 = 4;
          int v102 = v3 % v101;
          int v103 = 2;
          int v104;
          v104 = v103;
          switch (v102) {
            case 0:
              {
              int v105 = 3;
              v104 = v105;
              break;
            }
            case 1:
              {
              int v106 = 3;
              v104 = v106;
              break;
            }
            case 2:
              {
              v104 = v0;
              break;
            }
            default:
              {
              int v107 = 4;
              v104 = v107;
              break;
            }
          }
          int v108 = 1;
          v93 = v104;
          break;
        }
        case 1:
          {
          int v109 = 1;
          v93 = v109;
          break;
        }
        case 2:
          {
          int v110 = 0;
          int v111 = 0;
          int v112;
          int v113;
          v112 = v110;
          v113 = v111;
          while (true) {
            int v114 = 4;
            int v115 = v3 % v114;
            int v116 = 1;
            int v117 = v115 + v116;
            bool v118 = v113 < v117;
            v112 = v112;
            v113 = v113;
            if (!v118) break;
            int v119 = 2;
            int v120 = 1;
            int v121 = v113 + v120;
            v112 = v119;
            v113 = v121;
            continue;
            ;
          }
          int v122 = 0;
          v93 = v112;
          break;
        }
      }
      v6 = v93;
      break;
    }
  }
  bool v123 = true;
  int v124 = simt_wave_count_bits(v123);
  int v125 = 0;
  int v126 = v125 + v0;
  v1[v126] = v124;
  return;
}

kernel void kernel_main(device int* v127 [[buffer(0)]], device int* v128 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v129 = static_cast<int>(__simt_tid3.x);
  int v130 = 0;
  int v131 = v130 + v129;
  int v132 = v128[v131];
  int v133 = 4;
  int v134 = v133 + v129;
  int v135 = v128[v134];
  helper0(v129, v127, v132, v135, static_cast<int>(__simt_tid3.x));
  int v136 = 8;
  int v137 = v136 + v129;
  int v138 = v128[v137];
  int v139;
  v139 = v129;
  switch (v138) {
    default:
      {
      int v140 = 4;
      int v141 = v129 + v140;
      v139 = v141;
      break;
    }
    case 0:
      {
      int v142 = 12;
      int v143 = v142 + v129;
      int v144 = v128[v143];
      int v145 = 4;
      int v146 = v129 + v145;
      int v147;
      v147 = v146;
      switch (v144) {
        default:
          {
          int v148 = 0;
          int v149 = 0;
          int v150;
          int v151;
          v150 = v148;
          v151 = v149;
          while (true) {
            int v152 = 4;
            int v153 = v151 * v152;
            int v154 = v153 + v129;
            int v155 = 16;
            int v156 = v155 + v154;
            int v157 = v128[v156];
            int v158 = 0;
            bool v159 = v157 != v158;
            v150 = v150;
            v151 = v151;
            if (!v159) break;
            int v160 = v150 + v151;
            int v161 = 1;
            int v162 = v151 + v161;
            v150 = v160;
            v151 = v162;
            continue;
            ;
          }
          bool v163 = true;
          v147 = v150;
          break;
        }
        case 0:
          {
          int v164 = 0;
          int v165 = 0;
          int v166;
          int v167;
          v166 = v164;
          v167 = v165;
          while (true) {
            int v168 = 4;
            int v169 = v167 * v168;
            int v170 = v169 + v129;
            int v171 = 36;
            int v172 = v171 + v170;
            int v173 = v128[v172];
            int v174 = 0;
            bool v175 = v173 != v174;
            v166 = v166;
            v167 = v167;
            if (!v175) break;
            int v176 = v166 + v167;
            int v177 = 1;
            int v178 = v167 + v177;
            v166 = v176;
            v167 = v178;
          }
          bool v179 = true;
          v147 = v166;
          break;
        }
      }
      bool v180 = true;
      v139 = v147;
      break;
    }
  }
  bool v181 = true;
  int v182 = 16;
  int v183 = v182 + v129;
  bool v184 = true;
  int v185 = simt_wave_count_bits(v184);
  v127[v183] = v185;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 56; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
