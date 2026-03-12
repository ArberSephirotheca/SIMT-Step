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
    int v13 = 4;
    int v14 = v0 + v13;
    int v15 = 1;
    int v16 = v7 + v15;
    v6 = v14;
    v7 = v16;
  }
  bool v17 = true;
  int v18 = simt_wave_count_bits(v17);
  int v19 = 0;
  int v20 = v19 + v0;
  v1[v20] = v18;
  int v21 = 3;
  int v22 = v3 % v21;
  uint v23 = simt_subgroup_id(__simt_tid);
  int v24 = (int)(v23);
  int v25;
  v25 = v24;
  switch (v22) {
    case 0:
      {
      int v26 = 4;
      int v27 = v3 % v26;
      int v28 = 4;
      int v29;
      v29 = v28;
      switch (v27) {
        case 0:
          {
          int v30 = 2;
          int v31 = v3 % v30;
          int v32 = 4;
          int v33;
          v33 = v32;
          switch (v31) {
            default:
              {
              int v34 = 1;
              v33 = v34;
              break;
            }
            case 0:
              {
              int v35 = 3;
              v33 = v35;
              break;
            }
            case 1:
              {
              v33 = v0;
              break;
            }
          }
          int v36 = 3;
          v29 = v33;
        }
        case 1:
          {
          v29 = v0;
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
            int v46 = 4;
            int v47 = v0 + v46;
            int v48 = 1;
            int v49 = v40 + v48;
            v39 = v47;
            v40 = v49;
          }
          int v50 = 4;
          v29 = v39;
        }
        case 2:
          {
          int v51 = 4;
          int v52 = v0 + v51;
          int v53;
          v53 = v52;
          switch (v3) {
            case 0:
              {
              v53 = v0;
            }
            default:
              {
              int v54 = 3;
              int v55 = v0 + v54;
              v53 = v55;
              break;
            }
          }
          int v56 = 3;
          int v57 = v0 + v56;
          v29 = v53;
          break;
        }
      }
      v25 = v29;
      break;
    }
    case 1:
      {
      int v58 = 3;
      int v59 = v3 % v58;
      int v60 = 3;
      int v61;
      v61 = v60;
      switch (v59) {
        case 0:
          {
          int v62 = 4;
          v61 = v62;
          break;
        }
        default:
          {
          int v63 = 0;
          bool v64 = v2 != v63;
          int v65;
          if (v64) {
            int v66 = 2;
            v65 = v66;
          } else {
            int v67 = 1;
            v65 = v67;
          }
          int v68 = 2;
          v61 = v65;
          break;
        }
        case 1:
          {
          int v69 = 0;
          int v70 = 0;
          int v71;
          int v72;
          v71 = v69;
          v72 = v70;
          while (true) {
            int v73 = 4;
            int v74 = v3 % v73;
            int v75 = 1;
            int v76 = v74 + v75;
            bool v77 = v72 < v76;
            v71 = v71;
            v72 = v72;
            if (!v77) break;
            int v78 = 2;
            int v79 = 1;
            int v80 = v72 + v79;
            v71 = v78;
            v72 = v80;
          }
          int v81 = 3;
          int v82 = v0 + v81;
          v61 = v71;
          break;
        }
      }
      int v83 = 0;
      v25 = v61;
      break;
    }
    default:
      {
      int v84 = 3;
      int v85 = v3 % v84;
      int v86;
      v86 = v0;
      switch (v85) {
        case 0:
          {
          int v87 = 4;
          int v88 = v3 % v87;
          int v89 = 4;
          int v90;
          v90 = v89;
          switch (v88) {
            case 0:
              {
              v90 = v0;
              break;
            }
            case 1:
              {
              int v91 = 1;
              v90 = v91;
              break;
            }
            case 2:
              {
              int v92 = 1;
              int v93 = v0 + v92;
              v90 = v93;
              break;
            }
            default:
              {
              int v94 = 1;
              v90 = v94;
              break;
            }
          }
          int v95 = 0;
          v86 = v90;
        }
        case 1:
          {
          int v96 = 3;
          v86 = v96;
          break;
        }
        default:
          {
          int v97;
          v97 = v0;
          switch (v3) {
            default:
              {
              int v98 = 3;
              int v99 = v0 + v98;
              v97 = v99;
            }
            case 0:
              {
              int v100 = 2;
              v97 = v100;
              break;
            }
          }
          int v101 = 2;
          v86 = v97;
          break;
        }
        case 2:
          {
          int v102 = 3;
          v86 = v102;
          break;
        }
      }
      int v103 = 4;
      v25 = v86;
      break;
    }
  }
  bool v104 = true;
  int v105 = simt_wave_count_bits(v104);
  int v106 = 16;
  int v107 = v106 + v0;
  v1[v107] = v105;
  int v108 = 0;
  bool v109 = v2 != v108;
  int v110 = v109 ? v6 : v25;
  return;
}

kernel void kernel_main(device int* v111 [[buffer(0)]], device int* v112 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v113 = static_cast<int>(__simt_tid3.x);
  int v114 = 0;
  int v115 = v114 + v113;
  int v116 = v112[v115];
  int v117 = 4;
  int v118 = v117 + v113;
  int v119 = v112[v118];
  helper0(v113, v111, v116, v119, static_cast<int>(__simt_tid3.x));
  int v120 = 0;
  int v121 = 0;
  int v122 = 0;
  int v123;
  int v124;
  v123 = v121;
  v124 = v122;
  while (true) {
    int v125 = 4;
    int v126 = v124 * v125;
    int v127 = v126 + v113;
    int v128 = 8;
    int v129 = v128 + v127;
    int v130 = v112[v129];
    int v131 = 0;
    bool v132 = v130 != v131;
    v123 = v123;
    v124 = v124;
    if (!v132) break;
    int v133 = 28;
    int v134 = v133 + v113;
    int v135 = v112[v134];
    int v136 = 3;
    int v137;
    v137 = v136;
    switch (v135) {
      case 0:
        {
        int v138 = 32;
        int v139 = v138 + v113;
        int v140 = v112[v139];
        int v141 = 1;
        int v142;
        v142 = v141;
        switch (v140) {
          case 0:
            {
            int v143 = 1;
            v142 = v143;
            break;
          }
          case 1:
            {
            v142 = v113;
            break;
          }
          default:
            {
            v142 = v113;
            break;
          }
          case 2:
            {
            int v144 = 3;
            int v145 = v113 + v144;
            v142 = v145;
            break;
          }
        }
        bool v146 = true;
        v137 = v142;
      }
      default:
        {
        int v147 = 36;
        int v148 = v147 + v113;
        int v149 = v112[v148];
        int v150 = 0;
        int v151 = v113 + v150;
        int v152;
        v152 = v151;
        switch (v149) {
          case 0:
            {
            int v153 = 0;
            int v154 = v113 + v153;
            v152 = v154;
          }
          case 1:
            {
            int v155 = 3;
            int v156 = v113 + v155;
            v152 = v156;
            break;
          }
          case 2:
            {
            int v157 = 1;
            v152 = v157;
            break;
          }
          default:
            {
            int v158 = 1;
            v152 = v158;
            break;
          }
        }
        bool v159 = true;
        v137 = v152;
        break;
      }
    }
    bool v160 = true;
    int v161 = v123 + v137;
    int v162 = 1;
    int v163 = v124 + v162;
    v123 = v161;
    v124 = v163;
  }
  bool v164 = true;
  int v165 = 32;
  int v166 = v165 + v113;
  bool v167 = true;
  int v168 = simt_wave_count_bits(v167);
  v111[v166] = v168;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 40; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
