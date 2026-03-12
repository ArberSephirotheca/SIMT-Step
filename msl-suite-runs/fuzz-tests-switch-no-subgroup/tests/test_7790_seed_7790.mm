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
  int v8 = 4;
  int v9 = v3 % v8;
  uint v10 = simt_subgroup_id(__simt_tid);
  int v11 = (int)(v10);
  int v12;
  v12 = v11;
  switch (v9) {
    case 0:
      {
      int v13 = 3;
      int v14 = v3 % v13;
      int v15;
      v15 = v0;
      switch (v14) {
        case 0:
          {
          int v16 = 4;
          int v17 = v3 % v16;
          int v18 = 2;
          int v19;
          v19 = v18;
          switch (v17) {
            default:
              {
              int v20 = 1;
              v19 = v20;
              break;
            }
            case 0:
              {
              int v21 = 1;
              v19 = v21;
              break;
            }
            case 1:
              {
              int v22 = 1;
              v19 = v22;
              break;
            }
            case 2:
              {
              v19 = v0;
              break;
            }
          }
          v15 = v19;
          break;
        }
        default:
          {
          int v23 = 3;
          int v24 = v3 % v23;
          int v25 = 1;
          int v26;
          v26 = v25;
          switch (v24) {
            case 0:
              {
              int v27 = 4;
              int v28 = v0 + v27;
              v26 = v28;
            }
            case 1:
              {
              v26 = v0;
            }
            default:
              {
              int v29 = 4;
              int v30 = v0 + v29;
              v26 = v30;
              break;
            }
            case 2:
              {
              int v31 = 0;
              v26 = v31;
              break;
            }
          }
          v15 = v26;
          break;
        }
        case 1:
          {
          int v32 = 0;
          bool v33 = v2 != v32;
          int v34;
          if (v33) {
            int v35 = 4;
            int v36 = v0 + v35;
            v34 = v36;
          } else {
            v34 = v0;
          }
          v15 = v34;
          break;
        }
      }
      v12 = v15;
      break;
    }
    default:
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
        int v46 = 2;
        int v47 = v3 % v46;
        int v48 = 2;
        int v49 = v0 + v48;
        int v50;
        v50 = v49;
        switch (v47) {
          case 0:
            {
            int v51 = 0;
            int v52 = v0 + v51;
            v50 = v52;
          }
          default:
            {
            int v53 = 4;
            v50 = v53;
            break;
          }
          case 1:
            {
            v50 = v0;
            break;
          }
        }
        int v54 = 1;
        int v55 = v40 + v54;
        v39 = v50;
        v40 = v55;
        break;
        ;
      }
      v12 = v39;
      break;
    }
    case 1:
      {
      int v56 = 0;
      v12 = v56;
    }
    case 2:
      {
      int v57 = 0;
      bool v58 = v2 != v57;
      int v59;
      if (v58) {
        int v60 = 3;
        int v61 = v3 % v60;
        int v62;
        v62 = v0;
        switch (v61) {
          case 0:
            {
            v62 = v0;
          }
          case 1:
            {
            v62 = v0;
          }
          default:
            {
            int v63 = 3;
            int v64 = v0 + v63;
            v62 = v64;
          }
          case 2:
            {
            v62 = v0;
            break;
          }
        }
        v59 = v62;
      } else {
        int v65 = 0;
        bool v66 = v2 != v65;
        int v67;
        if (v66) {
          int v68 = 3;
          int v69 = v0 + v68;
          v67 = v69;
        } else {
          v67 = v0;
        }
        v59 = v67;
      }
      v12 = v59;
      break;
    }
  }
  bool v70 = true;
  int v71 = simt_wave_count_bits(v70);
  int v72 = 16;
  int v73 = v72 + v0;
  v1[v73] = v71;
  int v74 = 0;
  bool v75 = v2 != v74;
  int v76 = v75 ? v5 : v12;
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
  int v86 = 1;
  int v87 = v79 + v86;
  int v88 = 8;
  int v89 = v88 + v79;
  int v90 = v78[v89];
  int v91 = 3;
  int v92;
  v92 = v91;
  switch (v90) {
    case 0:
      {
      int v93 = 0;
      v92 = v93;
      break;
    }
    default:
      {
      int v94 = 12;
      int v95 = v94 + v79;
      int v96 = v78[v95];
      int v97 = 0;
      bool v98 = v96 != v97;
      int v99;
      if (v98) {
        int v100 = 16;
        int v101 = v100 + v79;
        int v102 = v78[v101];
        int v103 = 0;
        bool v104 = v102 != v103;
        int v105;
        if (v104) {
          int v106 = 0;
          v105 = v106;
        } else {
          int v107 = 4;
          int v108 = v79 + v107;
          v105 = v108;
        }
        v99 = v105;
      } else {
        int v109 = 20;
        int v110 = v109 + v79;
        int v111 = v78[v110];
        int v112 = 0;
        bool v113 = v111 != v112;
        int v114;
        if (v113) {
          int v115 = 0;
          int v116 = v79 + v115;
          v114 = v116;
        } else {
          v114 = v79;
        }
        v99 = v114;
      }
      v92 = v99;
      break;
    }
    case 1:
      {
      int v117 = 24;
      int v118 = v117 + v79;
      int v119 = v78[v118];
      int v120 = 1;
      int v121 = v79 + v120;
      int v122;
      v122 = v121;
      switch (v119) {
        case 0:
          {
          int v123 = 28;
          int v124 = v123 + v79;
          int v125 = v78[v124];
          int v126 = 0;
          bool v127 = v125 != v126;
          int v128;
          if (v127) {
            v128 = v79;
          } else {
            int v129 = 1;
            int v130 = v79 + v129;
            v128 = v130;
          }
          v122 = v128;
          break;
        }
        case 1:
          {
          int v131 = 32;
          int v132 = v131 + v79;
          int v133 = v78[v132];
          int v134 = 2;
          int v135;
          v135 = v134;
          switch (v133) {
            case 0:
              {
              v135 = v79;
              break;
            }
            case 1:
              {
              int v136 = 0;
              int v137 = v79 + v136;
              v135 = v137;
            }
            default:
              {
              int v138 = 3;
              v135 = v138;
              break;
            }
            case 2:
              {
              int v139 = 3;
              v135 = v139;
              break;
            }
          }
          bool v140 = true;
          v122 = v135;
          break;
        }
        default:
          {
          int v141 = 36;
          int v142 = v141 + v79;
          int v143 = v78[v142];
          int v144 = 3;
          int v145 = v79 + v144;
          int v146;
          v146 = v145;
          switch (v143) {
            default:
              {
              int v147 = 2;
              v146 = v147;
            }
            case 0:
              {
              v146 = v79;
            }
            case 1:
              {
              int v148 = 0;
              int v149 = v79 + v148;
              v146 = v149;
            }
            case 2:
              {
              v146 = v79;
              break;
            }
          }
          v122 = v146;
          break;
        }
        case 2:
          {
          int v150 = 0;
          int v151 = 0;
          int v152;
          int v153;
          v152 = v150;
          v153 = v151;
          while (true) {
            int v154 = 4;
            int v155 = v153 * v154;
            int v156 = v155 + v79;
            int v157 = 40;
            int v158 = v157 + v156;
            int v159 = v78[v158];
            int v160 = 0;
            bool v161 = v159 != v160;
            v152 = v152;
            v153 = v153;
            if (!v161) break;
            int v162 = v152 + v153;
            int v163 = 1;
            int v164 = v153 + v163;
            bool v165 = true;
            v152 = v162;
            v153 = v164;
          }
          v122 = v152;
          break;
        }
      }
      bool v166 = true;
      v92 = v122;
      break;
    }
    case 2:
      {
      int v167 = 3;
      v92 = v167;
      break;
    }
  }
  bool v168 = true;
  int v169 = 32;
  int v170 = v169 + v79;
  bool v171 = true;
  int v172 = simt_wave_count_bits(v171);
  v77[v170] = v172;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 36; ++idx) {
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
