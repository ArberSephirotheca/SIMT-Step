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
  int v6 = 4;
  int v7;
  v7 = v6;
  switch (v5) {
    case 0:
      {
      int v8 = 0;
      int v9 = 0;
      int v10;
      int v11;
      v10 = v8;
      v11 = v9;
      while (true) {
        int v12 = 4;
        int v13 = v3 % v12;
        int v14 = 1;
        int v15 = v13 + v14;
        bool v16 = v11 < v15;
        v10 = v10;
        v11 = v11;
        if (!v16) break;
        int v17 = 2;
        int v18 = v3 % v17;
        int v19;
        v19 = v0;
        switch (v18) {
          case 0:
            {
            int v20 = 2;
            int v21 = v0 + v20;
            v19 = v21;
            break;
          }
          case 1:
            {
            int v22 = 2;
            int v23 = v0 + v22;
            v19 = v23;
            break;
          }
          default:
            {
            int v24 = 0;
            v19 = v24;
            break;
          }
        }
        int v25 = 1;
        int v26 = v11 + v25;
        v10 = v19;
        v11 = v26;
      }
      v7 = v10;
    }
    case 1:
      {
      int v27 = 0;
      int v28 = 0;
      int v29;
      int v30;
      v29 = v27;
      v30 = v28;
      while (true) {
        int v31 = 4;
        int v32 = v3 % v31;
        int v33 = 1;
        int v34 = v32 + v33;
        bool v35 = v30 < v34;
        v29 = v29;
        v30 = v30;
        if (!v35) break;
        int v36 = 0;
        bool v37 = v2 != v36;
        int v38;
        if (v37) {
          int v39 = 2;
          int v40 = v0 + v39;
          v38 = v40;
        } else {
          int v41 = 4;
          int v42 = v0 + v41;
          v38 = v42;
        }
        int v43 = 1;
        int v44 = v30 + v43;
        v29 = v38;
        v30 = v44;
      }
      v7 = v29;
      break;
    }
    default:
      {
      int v45 = 4;
      int v46 = v3 % v45;
      int v47;
      v47 = v0;
      switch (v46) {
        case 0:
          {
          int v48 = 4;
          int v49 = v3 % v48;
          int v50;
          v50 = v0;
          switch (v49) {
            case 0:
              {
              v50 = v0;
              break;
            }
            case 1:
              {
              int v51 = 1;
              int v52 = v0 + v51;
              v50 = v52;
              break;
            }
            case 2:
              {
              int v53 = 2;
              v50 = v53;
              break;
            }
            default:
              {
              int v54 = 1;
              int v55 = v0 + v54;
              v50 = v55;
              break;
            }
          }
          v47 = v50;
        }
        default:
          {
          int v56 = 2;
          int v57 = v3 % v56;
          int v58;
          v58 = v0;
          switch (v57) {
            case 0:
              {
              int v59 = 3;
              int v60 = v0 + v59;
              v58 = v60;
              break;
            }
            case 1:
              {
              int v61 = 4;
              v58 = v61;
              break;
            }
            default:
              {
              int v62 = 1;
              v58 = v62;
              break;
            }
          }
          v47 = v58;
        }
        case 1:
          {
          int v63 = 2;
          int v64 = v3 % v63;
          int v65;
          v65 = v0;
          switch (v64) {
            case 0:
              {
              int v66 = 2;
              v65 = v66;
              break;
            }
            case 1:
              {
              int v67 = 1;
              v65 = v67;
              break;
            }
            default:
              {
              int v68 = 1;
              int v69 = v0 + v68;
              v65 = v69;
              break;
            }
          }
          v47 = v65;
        }
        case 2:
          {
          v47 = v0;
          break;
        }
      }
      v7 = v47;
      break;
    }
    case 2:
      {
      int v70 = 3;
      int v71 = v3 % v70;
      int v72 = 2;
      int v73;
      v73 = v72;
      switch (v71) {
        case 0:
          {
          int v74 = 0;
          bool v75 = v2 != v74;
          int v76;
          if (v75) {
            v76 = v0;
          } else {
            int v77 = 1;
            int v78 = v0 + v77;
            v76 = v78;
          }
          v73 = v76;
          break;
        }
        default:
          {
          int v79 = 3;
          int v80 = v3 % v79;
          int v81 = 4;
          int v82 = v0 + v81;
          int v83;
          v83 = v82;
          switch (v80) {
            case 0:
              {
              v83 = v0;
              break;
            }
            case 1:
              {
              int v84 = 0;
              int v85 = v0 + v84;
              v83 = v85;
              break;
            }
            default:
              {
              v83 = v0;
              break;
            }
            case 2:
              {
              int v86 = 2;
              v83 = v86;
              break;
            }
          }
          v73 = v83;
          break;
        }
        case 1:
          {
          int v87 = 0;
          int v88 = 0;
          int v89;
          int v90;
          v89 = v87;
          v90 = v88;
          while (true) {
            int v91 = 4;
            int v92 = v3 % v91;
            int v93 = 1;
            int v94 = v92 + v93;
            bool v95 = v90 < v94;
            v89 = v89;
            v90 = v90;
            if (!v95) break;
            int v96 = 1;
            int v97 = v90 + v96;
            v89 = v0;
            v90 = v97;
          }
          v73 = v89;
          break;
        }
        case 2:
          {
          int v98 = 2;
          int v99 = v3 % v98;
          int v100 = 2;
          int v101 = v0 + v100;
          int v102;
          v102 = v101;
          switch (v99) {
            case 0:
              {
              v102 = v0;
              break;
            }
            default:
              {
              v102 = v0;
              break;
            }
          }
          v73 = v102;
          break;
        }
      }
      v7 = v73;
      break;
    }
  }
  bool v103 = true;
  int v104 = simt_wave_count_bits(v103);
  int v105 = 0;
  int v106 = v105 + v0;
  v1[v106] = v104;
  return;
}

kernel void kernel_main(device int* v107 [[buffer(0)]], device int* v108 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v109 = static_cast<int>(__simt_tid3.x);
  int v110 = 0;
  int v111 = v110 + v109;
  int v112 = v108[v111];
  int v113 = 4;
  int v114 = v113 + v109;
  int v115 = v108[v114];
  int v116 = 0;
  bool v117 = v112 != v116;
  if (v117) {
    int v118 = 8;
    int v119 = v118 + v109;
    int v120 = v108[v119];
    int v121 = 0;
    bool v122 = v120 != v121;
    if (v122) {
    } else {
      int v123 = 3;
      int v124 = v109 % v123;
      int v125 = 0;
      int v126;
      v126 = v125;
      switch (v124) {
        default:
          {
          int v127 = 4;
          int v128 = v126 + v127;
          v126 = v128;
          break;
        }
        case 0:
          {
          int v129 = 1;
          int v130 = v126 + v129;
          v126 = v130;
          break;
        }
        case 1:
          {
          int v131 = 1;
          int v132 = v126 + v131;
          v126 = v132;
          break;
        }
      }
      helper0(v109, v107, v112, v115, static_cast<int>(__simt_tid3.x));
    }
  } else {
  }
  int v133 = 12;
  int v134 = v133 + v109;
  int v135 = v108[v134];
  int v136 = 0;
  bool v137 = v135 != v136;
  int v138;
  if (v137) {
    int v139 = 2;
    v138 = v139;
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
      int v146 = v145 + v109;
      int v147 = 16;
      int v148 = v147 + v146;
      int v149 = v108[v148];
      int v150 = 0;
      bool v151 = v149 != v150;
      v142 = v142;
      v143 = v143;
      if (!v151) break;
      int v152 = v142 + v143;
      int v153 = 1;
      int v154 = v143 + v153;
      bool v155 = true;
      int v156 = 16;
      int v157 = 4;
      int v158 = v143 * v157;
      int v159 = v156 + v158;
      int v160 = v159 + v109;
      bool v161 = true;
      int v162 = simt_wave_count_bits(v161);
      v107[v160] = v162;
      v142 = v152;
      v143 = v154;
      break;
      ;
    }
    v138 = v142;
  }
  int v163 = 32;
  int v164 = v163 + v109;
  bool v165 = true;
  int v166 = simt_wave_count_bits(v165);
  v107[v164] = v166;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 36; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
