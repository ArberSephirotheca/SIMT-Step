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
  int v5;
  v5 = v4;
  switch (v3) {
    default:
      {
      int v6 = 4;
      int v7 = v3 % v6;
      int v8 = 4;
      int v9 = v0 + v8;
      int v10;
      v10 = v9;
      switch (v7) {
        case 0:
          {
          int v11 = 0;
          bool v12 = v2 != v11;
          int v13;
          if (v12) {
            int v14 = 3;
            int v15 = v0 + v14;
            v13 = v15;
          } else {
            int v16 = 0;
            v13 = v16;
          }
          v10 = v13;
          break;
        }
        default:
          {
          int v17 = 0;
          int v18 = 0;
          int v19;
          int v20;
          v19 = v17;
          v20 = v18;
          while (true) {
            int v21 = 4;
            int v22 = v3 % v21;
            int v23 = 1;
            int v24 = v22 + v23;
            bool v25 = v20 < v24;
            v19 = v19;
            v20 = v20;
            if (!v25) break;
            int v26 = 1;
            int v27 = v20 + v26;
            v19 = v0;
            v20 = v27;
          }
          int v28 = 0;
          int v29 = v0 + v28;
          v10 = v19;
          break;
        }
        case 1:
          {
          int v30 = 2;
          int v31 = v3 % v30;
          int v32 = 1;
          int v33;
          v33 = v32;
          switch (v31) {
            default:
              {
              v33 = v0;
              break;
            }
            case 0:
              {
              int v34 = 1;
              int v35 = v0 + v34;
              v33 = v35;
              break;
            }
            case 1:
              {
              int v36 = 3;
              int v37 = v0 + v36;
              v33 = v37;
              break;
            }
          }
          v10 = v33;
          break;
        }
        case 2:
          {
          int v38 = 0;
          int v39 = 0;
          int v40;
          int v41;
          v40 = v38;
          v41 = v39;
          while (true) {
            int v42 = 4;
            int v43 = v3 % v42;
            int v44 = 1;
            int v45 = v43 + v44;
            bool v46 = v41 < v45;
            v40 = v40;
            v41 = v41;
            if (!v46) break;
            int v47 = 1;
            int v48 = v0 + v47;
            int v49 = 1;
            int v50 = v41 + v49;
            v40 = v48;
            v41 = v50;
            break;
            ;
          }
          v10 = v40;
          break;
        }
      }
      v5 = v10;
      break;
    }
    case 0:
      {
      int v51 = 4;
      int v52 = v3 % v51;
      int v53 = 2;
      int v54 = v0 + v53;
      int v55;
      v55 = v54;
      switch (v52) {
        case 0:
          {
          int v56 = 3;
          int v57 = v3 % v56;
          int v58 = 3;
          int v59;
          v59 = v58;
          switch (v57) {
            case 0:
              {
              v59 = v0;
            }
            default:
              {
              v59 = v0;
            }
            case 1:
              {
              int v60 = 4;
              v59 = v60;
            }
            case 2:
              {
              int v61 = 2;
              int v62 = v0 + v61;
              v59 = v62;
              break;
            }
          }
          v55 = v59;
          break;
        }
        case 1:
          {
          int v63 = 0;
          bool v64 = v2 != v63;
          int v65;
          if (v64) {
            int v66 = 4;
            int v67 = v0 + v66;
            v65 = v67;
          } else {
            int v68 = 3;
            v65 = v68;
          }
          int v69 = 2;
          int v70 = v0 + v69;
          v55 = v65;
          break;
        }
        default:
          {
          int v71 = 0;
          int v72 = 0;
          int v73;
          int v74;
          v73 = v71;
          v74 = v72;
          while (true) {
            int v75 = 4;
            int v76 = v3 % v75;
            int v77 = 1;
            int v78 = v76 + v77;
            bool v79 = v74 < v78;
            v73 = v73;
            v74 = v74;
            if (!v79) break;
            int v80 = 4;
            int v81 = v0 + v80;
            int v82 = 1;
            int v83 = v74 + v82;
            v73 = v81;
            v74 = v83;
          }
          int v84 = 0;
          int v85 = v0 + v84;
          v55 = v73;
          break;
        }
        case 2:
          {
          int v86 = 2;
          int v87 = v3 % v86;
          int v88 = 3;
          int v89 = v0 + v88;
          int v90;
          v90 = v89;
          switch (v87) {
            case 0:
              {
              int v91 = 2;
              int v92 = v0 + v91;
              v90 = v92;
              break;
            }
            case 1:
              {
              v90 = v0;
              break;
            }
            default:
              {
              int v93 = 4;
              int v94 = v0 + v93;
              v90 = v94;
              break;
            }
          }
          int v95 = 0;
          int v96 = v0 + v95;
          v55 = v90;
          break;
        }
      }
      int v97 = 3;
      int v98 = v0 + v97;
      v5 = v55;
      break;
    }
  }
  bool v99 = true;
  int v100 = simt_wave_count_bits(v99);
  int v101 = 0;
  int v102 = v101 + v0;
  v1[v102] = v100;
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
  helper0(v105, v103, v108, v111, static_cast<int>(__simt_tid3.x));
  int v112 = 8;
  int v113 = v112 + v105;
  int v114 = v104[v113];
  int v115 = 4;
  int v116 = v105 + v115;
  int v117;
  v117 = v116;
  switch (v114) {
    case 0:
      {
      int v118 = 12;
      int v119 = v118 + v105;
      int v120 = v104[v119];
      int v121 = 1;
      int v122 = v105 + v121;
      int v123;
      v123 = v122;
      switch (v120) {
        default:
          {
          int v124 = 16;
          int v125 = v124 + v105;
          int v126 = v104[v125];
          int v127 = 1;
          int v128 = v105 + v127;
          int v129;
          v129 = v128;
          switch (v126) {
            case 0:
              {
              v129 = v105;
              break;
            }
            default:
              {
              int v130 = 1;
              v129 = v130;
              break;
            }
            case 1:
              {
              int v131 = 4;
              v129 = v131;
              break;
            }
          }
          bool v132 = true;
          v123 = v129;
          break;
        }
        case 0:
          {
          v123 = v105;
          break;
        }
      }
      bool v133 = true;
      v117 = v123;
      break;
    }
    default:
      {
      int v134 = 20;
      int v135 = v134 + v105;
      int v136 = v104[v135];
      int v137 = 0;
      bool v138 = v136 != v137;
      int v139;
      if (v138) {
        v139 = v105;
      } else {
        int v140 = 0;
        int v141 = 0;
        int v142;
        int v143;
        v142 = v140;
        v143 = v141;
        while (true) {
          int v144 = 4;
          int v145 = v143 * v144;
          int v146 = v145 + v105;
          int v147 = 24;
          int v148 = v147 + v146;
          int v149 = v104[v148];
          int v150 = 0;
          bool v151 = v149 != v150;
          v142 = v142;
          v143 = v143;
          if (!v151) break;
          int v152 = v142 + v143;
          int v153 = 1;
          int v154 = v143 + v153;
          v142 = v152;
          v143 = v154;
          break;
          ;
        }
        bool v155 = true;
        v139 = v142;
      }
      v117 = v139;
      break;
    }
    case 1:
      {
      int v156 = 44;
      int v157 = v156 + v105;
      int v158 = v104[v157];
      int v159 = 0;
      bool v160 = v158 != v159;
      int v161;
      if (v160) {
        int v162 = 48;
        int v163 = v162 + v105;
        int v164 = v104[v163];
        int v165 = 0;
        bool v166 = v164 != v165;
        int v167;
        if (v166) {
          int v168 = 2;
          v167 = v168;
        } else {
          v167 = v105;
        }
        v161 = v167;
      } else {
        int v169 = 52;
        int v170 = v169 + v105;
        int v171 = v104[v170];
        int v172 = 0;
        bool v173 = v171 != v172;
        int v174;
        if (v173) {
          int v175 = 4;
          int v176 = v105 + v175;
          v174 = v176;
        } else {
          int v177 = 1;
          int v178 = v105 + v177;
          v174 = v178;
        }
        v161 = v174;
      }
      v117 = v161;
      break;
    }
  }
  bool v179 = true;
  int v180 = 16;
  int v181 = v180 + v105;
  bool v182 = true;
  int v183 = simt_wave_count_bits(v182);
  v103[v181] = v183;
  int v184 = 4;
  int v185 = v105 + v184;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
