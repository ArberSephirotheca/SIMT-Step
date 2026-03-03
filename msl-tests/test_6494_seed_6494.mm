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
        int v17 = 3;
        int v18 = v3 % v17;
        int v19 = 2;
        int v20 = v0 + v19;
        int v21;
        v21 = v20;
        switch (v18) {
          case 0:
            {
            v21 = v0;
            break;
          }
          case 1:
            {
            int v22 = 1;
            int v23 = v0 + v22;
            v21 = v23;
            break;
          }
          default:
            {
            v21 = v0;
            break;
          }
        }
        int v24 = 2;
        int v25 = 1;
        int v26 = v11 + v25;
        v10 = v21;
        v11 = v26;
      }
      int v27 = 1;
      v7 = v10;
    }
    default:
      {
      int v28 = 3;
      int v29 = v3 % v28;
      int v30;
      v30 = v0;
      switch (v29) {
        case 0:
          {
          int v31;
          v31 = v0;
          switch (v3) {
            default:
              {
              int v32 = 1;
              int v33 = v0 + v32;
              v31 = v33;
              break;
            }
            case 0:
              {
              v31 = v0;
              break;
            }
          }
          int v34 = 1;
          v30 = v31;
        }
        case 1:
          {
          int v35 = 3;
          int v36 = v0 + v35;
          v30 = v36;
        }
        default:
          {
          int v37 = 0;
          bool v38 = v2 != v37;
          int v39;
          if (v38) {
            v39 = v0;
          } else {
            v39 = v0;
          }
          int v40 = 1;
          int v41 = v0 + v40;
          v30 = v39;
          break;
        }
        case 2:
          {
          int v42 = 3;
          int v43 = v3 % v42;
          int v44;
          v44 = v0;
          switch (v43) {
            case 0:
              {
              int v45 = 4;
              int v46 = v0 + v45;
              v44 = v46;
              break;
            }
            default:
              {
              v44 = v0;
              break;
            }
            case 1:
              {
              v44 = v0;
              break;
            }
            case 2:
              {
              int v47 = 2;
              int v48 = v0 + v47;
              v44 = v48;
              break;
            }
          }
          v30 = v44;
          break;
        }
      }
      int v49 = 0;
      v7 = v30;
    }
    case 1:
      {
      int v50 = 0;
      int v51 = 0;
      int v52;
      int v53;
      v52 = v50;
      v53 = v51;
      while (true) {
        int v54 = 4;
        int v55 = v3 % v54;
        int v56 = 1;
        int v57 = v55 + v56;
        bool v58 = v53 < v57;
        v52 = v52;
        v53 = v53;
        if (!v58) break;
        int v59 = 0;
        int v60 = 0;
        int v61;
        int v62;
        v61 = v59;
        v62 = v60;
        while (true) {
          int v63 = 4;
          int v64 = v3 % v63;
          int v65 = 1;
          int v66 = v64 + v65;
          bool v67 = v62 < v66;
          v61 = v61;
          v62 = v62;
          if (!v67) break;
          int v68 = 0;
          int v69 = 1;
          int v70 = v62 + v69;
          v61 = v68;
          v62 = v70;
          break;
          ;
        }
        int v71 = 4;
        int v72 = 1;
        int v73 = v53 + v72;
        v52 = v61;
        v53 = v73;
      }
      int v74 = 0;
      int v75 = v0 + v74;
      v7 = v52;
    }
    case 2:
      {
      int v76 = 0;
      bool v77 = v2 != v76;
      int v78;
      if (v77) {
        int v79 = 2;
        int v80 = v3 % v79;
        int v81 = 1;
        int v82 = v0 + v81;
        int v83;
        v83 = v82;
        switch (v80) {
          case 0:
            {
            int v84 = 0;
            int v85 = v0 + v84;
            v83 = v85;
            break;
          }
          default:
            {
            int v86 = 3;
            v83 = v86;
            break;
          }
          case 1:
            {
            int v87 = 4;
            int v88 = v0 + v87;
            v83 = v88;
            break;
          }
        }
        int v89 = 3;
        int v90 = v0 + v89;
        v78 = v83;
      } else {
        int v91 = 0;
        bool v92 = v2 != v91;
        int v93;
        if (v92) {
          int v94 = 3;
          int v95 = v0 + v94;
          v93 = v95;
        } else {
          int v96 = 1;
          int v97 = v0 + v96;
          v93 = v97;
        }
        v78 = v93;
      }
      int v98 = 1;
      int v99 = v0 + v98;
      v7 = v78;
      break;
    }
  }
  bool v100 = true;
  int v101 = simt_wave_count_bits(v100);
  int v102 = 0;
  int v103 = v102 + v0;
  v1[v103] = v101;
  return;
}

kernel void kernel_main(device int* v104 [[buffer(0)]], device int* v105 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v106 = static_cast<int>(__simt_tid3.x);
  int v107 = 0;
  int v108 = v107 + v106;
  int v109 = v105[v108];
  int v110 = 4;
  int v111 = v110 + v106;
  int v112 = v105[v111];
  helper0(v106, v104, v109, v112, static_cast<int>(__simt_tid3.x));
  int v113 = 8;
  int v114 = v113 + v106;
  int v115 = v105[v114];
  int v116;
  v116 = v106;
  switch (v115) {
    case 0:
      {
      int v117 = 12;
      int v118 = v117 + v106;
      int v119 = v105[v118];
      int v120;
      v120 = v106;
      switch (v119) {
        default:
          {
          v120 = v106;
        }
        case 0:
          {
          int v121 = 16;
          int v122 = v121 + v106;
          int v123 = v105[v122];
          int v124 = 0;
          bool v125 = v123 != v124;
          int v126;
          if (v125) {
            v126 = v106;
          } else {
            int v127 = 4;
            v126 = v127;
          }
          v120 = v126;
          break;
        }
      }
      bool v128 = true;
      v116 = v120;
      break;
    }
    case 1:
      {
      int v129 = 0;
      v116 = v129;
      break;
    }
    case 2:
      {
      int v130 = 4;
      v116 = v130;
      break;
    }
    default:
      {
      int v131 = 20;
      int v132 = v131 + v106;
      int v133 = v105[v132];
      int v134 = 3;
      int v135 = v106 + v134;
      int v136;
      v136 = v135;
      switch (v133) {
        case 0:
          {
          int v137 = 24;
          int v138 = v137 + v106;
          int v139 = v105[v138];
          int v140 = 2;
          int v141 = v106 + v140;
          int v142;
          v142 = v141;
          switch (v139) {
            default:
              {
              int v143 = 4;
              v142 = v143;
              break;
            }
            case 0:
              {
              int v144 = 0;
              int v145 = v106 + v144;
              v142 = v145;
              break;
            }
          }
          bool v146 = true;
          v136 = v142;
          break;
        }
        case 1:
          {
          int v147 = 28;
          int v148 = v147 + v106;
          int v149 = v105[v148];
          int v150 = 3;
          int v151;
          v151 = v150;
          switch (v149) {
            case 0:
              {
              int v152 = 4;
              int v153 = v106 + v152;
              v151 = v153;
              break;
            }
            case 1:
              {
              int v154 = 3;
              int v155 = v106 + v154;
              v151 = v155;
              break;
            }
            case 2:
              {
              int v156 = 2;
              v151 = v156;
              break;
            }
            default:
              {
              int v157 = 1;
              v151 = v157;
              break;
            }
          }
          bool v158 = true;
          v136 = v151;
        }
        default:
          {
          int v159 = 2;
          int v160 = v106 + v159;
          v136 = v160;
          break;
        }
      }
      bool v161 = true;
      v116 = v136;
      break;
    }
  }
  bool v162 = true;
  int v163 = 16;
  int v164 = v163 + v106;
  bool v165 = true;
  int v166 = simt_wave_count_bits(v165);
  v104[v164] = v166;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 32; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
