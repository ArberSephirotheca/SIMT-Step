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
  int v4 = 4;
  int v5 = v3 % v4;
  int v6 = 2;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 0;
      bool v10 = v2 != v9;
      int v11;
      if (v10) {
        int v12 = 2;
        int v13 = v3 % v12;
        int v14;
        v14 = v0;
        switch (v13) {
          default:
            {
            int v15 = 1;
            int v16 = v0 + v15;
            v14 = v16;
            break;
          }
          case 0:
            {
            v14 = v0;
            break;
          }
          case 1:
            {
            int v17 = 1;
            int v18 = v0 + v17;
            v14 = v18;
            break;
          }
        }
        v11 = v14;
      } else {
        v11 = v0;
      }
      v8 = v11;
      break;
    }
    case 1:
      {
      int v19 = 3;
      int v20 = v3 % v19;
      int v21;
      v21 = v0;
      switch (v20) {
        default:
          {
          int v22 = 0;
          bool v23 = v2 != v22;
          int v24;
          if (v23) {
            int v25 = 4;
            v24 = v25;
          } else {
            int v26 = 1;
            int v27 = v0 + v26;
            v24 = v27;
          }
          v21 = v24;
          break;
        }
        case 0:
          {
          int v28 = 0;
          bool v29 = v2 != v28;
          int v30;
          if (v29) {
            int v31 = 0;
            int v32 = v0 + v31;
            v30 = v32;
          } else {
            int v33 = 1;
            v30 = v33;
          }
          v21 = v30;
        }
        case 1:
          {
          int v34 = 2;
          int v35 = v0 + v34;
          v21 = v35;
          break;
        }
        case 2:
          {
          int v36 = 0;
          bool v37 = v2 != v36;
          int v38;
          if (v37) {
            int v39 = 1;
            int v40 = v0 + v39;
            v38 = v40;
          } else {
            int v41 = 3;
            int v42 = v0 + v41;
            v38 = v42;
          }
          v21 = v38;
          break;
        }
      }
      int v43 = 1;
      int v44 = v0 + v43;
      v8 = v21;
    }
    default:
      {
      int v45 = 4;
      int v46 = v3 % v45;
      int v47 = 0;
      int v48;
      v48 = v47;
      switch (v46) {
        case 0:
          {
          int v49 = 0;
          int v50 = 0;
          int v51;
          int v52;
          v51 = v49;
          v52 = v50;
          while (true) {
            int v53 = 4;
            int v54 = v3 % v53;
            int v55 = 1;
            int v56 = v54 + v55;
            bool v57 = v52 < v56;
            v51 = v51;
            v52 = v52;
            if (!v57) break;
            int v58 = 4;
            int v59 = v0 + v58;
            int v60 = 1;
            int v61 = v52 + v60;
            v51 = v59;
            v52 = v61;
          }
          v48 = v51;
          break;
        }
        default:
          {
          int v62 = 3;
          int v63 = v3 % v62;
          int v64;
          v64 = v0;
          switch (v63) {
            default:
              {
              v64 = v0;
              break;
            }
            case 0:
              {
              int v65 = 4;
              int v66 = v0 + v65;
              v64 = v66;
              break;
            }
            case 1:
              {
              int v67 = 4;
              v64 = v67;
              break;
            }
            case 2:
              {
              int v68 = 1;
              int v69 = v0 + v68;
              v64 = v69;
              break;
            }
          }
          v48 = v64;
          break;
        }
        case 1:
          {
          int v70 = 0;
          int v71 = 0;
          int v72;
          int v73;
          v72 = v70;
          v73 = v71;
          while (true) {
            int v74 = 4;
            int v75 = v3 % v74;
            int v76 = 1;
            int v77 = v75 + v76;
            bool v78 = v73 < v77;
            v72 = v72;
            v73 = v73;
            if (!v78) break;
            int v79 = 1;
            int v80 = v73 + v79;
            v72 = v0;
            v73 = v80;
            continue;
            ;
          }
          v48 = v72;
          break;
        }
        case 2:
          {
          int v81 = 3;
          int v82 = v3 % v81;
          int v83;
          v83 = v0;
          switch (v82) {
            case 0:
              {
              v83 = v0;
              break;
            }
            case 1:
              {
              int v84 = 3;
              int v85 = v0 + v84;
              v83 = v85;
              break;
            }
            default:
              {
              int v86 = 2;
              int v87 = v0 + v86;
              v83 = v87;
              break;
            }
          }
          v48 = v83;
          break;
        }
      }
      v8 = v48;
    }
    case 2:
      {
      int v88 = 0;
      bool v89 = v2 != v88;
      int v90;
      if (v89) {
        int v91 = 0;
        bool v92 = v2 != v91;
        int v93;
        if (v92) {
          int v94 = 0;
          v93 = v94;
        } else {
          v93 = v0;
        }
        v90 = v93;
      } else {
        v90 = v0;
      }
      v8 = v90;
      break;
    }
  }
  bool v95 = true;
  int v96 = simt_wave_count_bits(v95);
  int v97 = 0;
  int v98 = v97 + v0;
  v1[v98] = v96;
  return;
}

kernel void kernel_main(device int* v99 [[buffer(0)]], device int* v100 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v101 = static_cast<int>(__simt_tid3.x);
  int v102 = 0;
  int v103 = v102 + v101;
  int v104 = v100[v103];
  int v105 = 4;
  int v106 = v105 + v101;
  int v107 = v100[v106];
  helper0(v101, v99, v104, v107, static_cast<int>(__simt_tid3.x));
  int v108 = 3;
  int v109 = v101 + v108;
  uint v110 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v111 = (int)(v110);
  int v112 = 0;
  int v113 = 0;
  int v114;
  int v115;
  v114 = v112;
  v115 = v113;
  while (true) {
    int v116 = 4;
    int v117 = v115 * v116;
    int v118 = v117 + v101;
    int v119 = 8;
    int v120 = v119 + v118;
    int v121 = v100[v120];
    int v122 = 0;
    bool v123 = v121 != v122;
    v114 = v114;
    v115 = v115;
    if (!v123) break;
    int v124 = v114 + v101;
    int v125 = 1;
    int v126 = v115 + v125;
    bool v127 = true;
    int v128 = 16;
    int v129 = 4;
    int v130 = v115 * v129;
    int v131 = v128 + v130;
    int v132 = v131 + v101;
    bool v133 = true;
    int v134 = simt_wave_count_bits(v133);
    v99[v132] = v134;
    v114 = v124;
    v115 = v126;
  }
  int v135 = 28;
  int v136 = v135 + v101;
  int v137 = v100[v136];
  int v138 = 0;
  bool v139 = v137 != v138;
  int v140;
  if (v139) {
    int v141 = 32;
    int v142 = v141 + v101;
    int v143 = v100[v142];
    int v144 = 2;
    int v145;
    v145 = v144;
    switch (v143) {
      default:
        {
        v145 = v101;
        break;
      }
      case 0:
        {
        int v146 = 0;
        int v147 = 0;
        int v148;
        int v149;
        v148 = v146;
        v149 = v147;
        while (true) {
          int v150 = 4;
          int v151 = v149 * v150;
          int v152 = v151 + v101;
          int v153 = 36;
          int v154 = v153 + v152;
          int v155 = v100[v154];
          int v156 = 0;
          bool v157 = v155 != v156;
          v148 = v148;
          v149 = v149;
          if (!v157) break;
          int v158 = v148 + v149;
          int v159 = 1;
          int v160 = v149 + v159;
          bool v161 = true;
          v148 = v158;
          v149 = v160;
        }
        v145 = v148;
        break;
      }
    }
    v140 = v145;
  } else {
    uint v162 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v163 = (int)(v162);
    v140 = v163;
  }
  int v164 = 32;
  int v165 = v164 + v101;
  bool v166 = true;
  int v167 = simt_wave_count_bits(v166);
  v99[v165] = v167;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 56; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
