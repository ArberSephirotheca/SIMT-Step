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
      int v10 = 0;
      int v11;
      int v12;
      v11 = v9;
      v12 = v10;
      while (true) {
        int v13 = 4;
        int v14 = v3 % v13;
        int v15 = 1;
        int v16 = v14 + v15;
        bool v17 = v12 < v16;
        v11 = v11;
        v12 = v12;
        if (!v17) break;
        int v18 = 3;
        int v19 = 1;
        int v20 = v12 + v19;
        v11 = v18;
        v12 = v20;
      }
      v8 = v11;
      break;
    }
    default:
      {
      int v21 = 2;
      int v22 = v3 % v21;
      int v23 = 2;
      int v24;
      v24 = v23;
      switch (v22) {
        case 0:
          {
          int v25 = 0;
          int v26 = 0;
          int v27;
          int v28;
          v27 = v25;
          v28 = v26;
          while (true) {
            int v29 = 4;
            int v30 = v3 % v29;
            int v31 = 1;
            int v32 = v30 + v31;
            bool v33 = v28 < v32;
            v27 = v27;
            v28 = v28;
            if (!v33) break;
            int v34 = 4;
            int v35 = v0 + v34;
            int v36 = 1;
            int v37 = v28 + v36;
            v27 = v35;
            v28 = v37;
          }
          v24 = v27;
          break;
        }
        default:
          {
          int v38 = 0;
          v24 = v38;
          break;
        }
      }
      v8 = v24;
      break;
    }
    case 1:
      {
      int v39 = 2;
      int v40 = v3 % v39;
      int v41 = 0;
      int v42;
      v42 = v41;
      switch (v40) {
        case 0:
          {
          int v43 = 4;
          int v44 = v0 + v43;
          v42 = v44;
          break;
        }
        default:
          {
          int v45 = 0;
          int v46 = v0 + v45;
          v42 = v46;
          break;
        }
        case 1:
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
            int v57 = v0 + v56;
            int v58 = 1;
            int v59 = v50 + v58;
            v49 = v57;
            v50 = v59;
          }
          v42 = v49;
          break;
        }
      }
      v8 = v42;
      break;
    }
  }
  bool v60 = true;
  int v61 = simt_wave_count_bits(v60);
  int v62 = 0;
  int v63 = v62 + v0;
  v1[v63] = v61;
  return;
}

kernel void kernel_main(device int* v64 [[buffer(0)]], device int* v65 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v66 = static_cast<int>(__simt_tid3.x);
  int v67 = 0;
  int v68 = v67 + v66;
  int v69 = v65[v68];
  int v70 = 4;
  int v71 = v70 + v66;
  int v72 = v65[v71];
  helper0(v66, v64, v69, v72, static_cast<int>(__simt_tid3.x));
  int v73 = 8;
  int v74 = v73 + v66;
  int v75 = v65[v74];
  int v76;
  v76 = v66;
  switch (v75) {
    default:
      {
      int v77 = 12;
      int v78 = v77 + v66;
      int v79 = v65[v78];
      int v80;
      v80 = v66;
      switch (v79) {
        case 0:
          {
          int v81 = 4;
          int v82 = v66 + v81;
          v80 = v82;
          break;
        }
        case 1:
          {
          int v83 = 16;
          int v84 = v83 + v66;
          int v85 = v65[v84];
          int v86;
          v86 = v66;
          switch (v85) {
            case 0:
              {
              int v87 = 4;
              v86 = v87;
            }
            default:
              {
              int v88 = 3;
              v86 = v88;
              break;
            }
          }
          bool v89 = true;
          v80 = v86;
          break;
        }
        case 2:
          {
          v80 = v66;
          break;
        }
        default:
          {
          int v90 = 20;
          int v91 = v90 + v66;
          int v92 = v65[v91];
          int v93 = 3;
          int v94 = v66 + v93;
          int v95;
          v95 = v94;
          switch (v92) {
            case 0:
              {
              v95 = v66;
            }
            case 1:
              {
              int v96 = 2;
              int v97 = v66 + v96;
              v95 = v97;
            }
            case 2:
              {
              int v98 = 3;
              int v99 = v66 + v98;
              v95 = v99;
            }
            default:
              {
              v95 = v66;
              break;
            }
          }
          v80 = v95;
          break;
        }
      }
      v76 = v80;
    }
    case 0:
      {
      int v100 = 24;
      int v101 = v100 + v66;
      int v102 = v65[v101];
      int v103 = 3;
      int v104;
      v104 = v103;
      switch (v102) {
        default:
          {
          int v105 = 1;
          v104 = v105;
          break;
        }
        case 0:
          {
          int v106 = 0;
          int v107 = 0;
          int v108;
          int v109;
          v108 = v106;
          v109 = v107;
          while (true) {
            int v110 = 4;
            int v111 = v109 * v110;
            int v112 = v111 + v66;
            int v113 = 28;
            int v114 = v113 + v112;
            int v115 = v65[v114];
            int v116 = 0;
            bool v117 = v115 != v116;
            v108 = v108;
            v109 = v109;
            if (!v117) break;
            int v118 = v108 + v109;
            int v119 = 1;
            int v120 = v109 + v119;
            bool v121 = true;
            v108 = v118;
            v109 = v120;
          }
          v104 = v108;
        }
        case 1:
          {
          int v122 = 48;
          int v123 = v122 + v66;
          int v124 = v65[v123];
          int v125 = 3;
          int v126;
          v126 = v125;
          switch (v124) {
            case 0:
              {
              int v127 = 4;
              int v128 = v66 + v127;
              v126 = v128;
              break;
            }
            default:
              {
              int v129 = 2;
              int v130 = v66 + v129;
              v126 = v130;
              break;
            }
          }
          v104 = v126;
          break;
        }
        case 2:
          {
          int v131 = 2;
          int v132 = v66 + v131;
          v104 = v132;
          break;
        }
      }
      v76 = v104;
      break;
    }
    case 1:
      {
      int v133 = 52;
      int v134 = v133 + v66;
      int v135 = v65[v134];
      int v136 = 2;
      int v137 = v66 + v136;
      int v138;
      v138 = v137;
      switch (v135) {
        case 0:
          {
          int v139 = 56;
          int v140 = v139 + v66;
          int v141 = v65[v140];
          int v142 = 0;
          int v143 = v66 + v142;
          int v144;
          v144 = v143;
          switch (v141) {
            default:
              {
              v144 = v66;
              break;
            }
            case 0:
              {
              int v145 = 0;
              v144 = v145;
            }
            case 1:
              {
              int v146 = 0;
              int v147 = v66 + v146;
              v144 = v147;
              break;
            }
            case 2:
              {
              v144 = v66;
              break;
            }
          }
          v138 = v144;
          break;
        }
        case 1:
          {
          int v148 = 60;
          int v149 = v148 + v66;
          int v150 = v65[v149];
          int v151 = 4;
          int v152;
          v152 = v151;
          switch (v150) {
            case 0:
              {
              v152 = v66;
              break;
            }
            default:
              {
              v152 = v66;
              break;
            }
            case 1:
              {
              int v153 = 1;
              int v154 = v66 + v153;
              v152 = v154;
              break;
            }
          }
          v138 = v152;
          break;
        }
        case 2:
          {
          int v155 = 64;
          int v156 = v155 + v66;
          int v157 = v65[v156];
          int v158 = 2;
          int v159 = v66 + v158;
          int v160;
          v160 = v159;
          switch (v157) {
            default:
              {
              int v161 = 4;
              int v162 = v66 + v161;
              v160 = v162;
              break;
            }
            case 0:
              {
              int v163 = 1;
              int v164 = v66 + v163;
              v160 = v164;
              break;
            }
            case 1:
              {
              int v165 = 0;
              int v166 = v66 + v165;
              v160 = v166;
              break;
            }
            case 2:
              {
              int v167 = 3;
              v160 = v167;
              break;
            }
          }
          v138 = v160;
          break;
        }
        default:
          {
          int v168 = 68;
          int v169 = v168 + v66;
          int v170 = v65[v169];
          int v171 = 0;
          bool v172 = v170 != v171;
          int v173;
          if (v172) {
            v173 = v66;
          } else {
            v173 = v66;
          }
          v138 = v173;
          break;
        }
      }
      bool v174 = true;
      v76 = v138;
      break;
    }
  }
  bool v175 = true;
  int v176 = 16;
  int v177 = v176 + v66;
  bool v178 = true;
  int v179 = simt_wave_count_bits(v178);
  v64[v177] = v179;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 72; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
