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
      bool v9 = v2 != v8;
      int v10;
      if (v9) {
        int v11 = 2;
        int v12 = v3 % v11;
        int v13 = 4;
        int v14;
        v14 = v13;
        switch (v12) {
          default:
            {
            int v15 = 2;
            v14 = v15;
            break;
          }
          case 0:
            {
            int v16 = 1;
            int v17 = v0 + v16;
            v14 = v17;
            break;
          }
        }
        v10 = v14;
      } else {
        int v18 = 2;
        int v19 = v3 % v18;
        int v20 = 3;
        int v21 = v0 + v20;
        int v22;
        v22 = v21;
        switch (v19) {
          case 0:
            {
            v22 = v0;
            break;
          }
          case 1:
            {
            int v23 = 2;
            int v24 = v0 + v23;
            v22 = v24;
          }
          default:
            {
            int v25 = 3;
            v22 = v25;
            break;
          }
        }
        v10 = v22;
      }
      v7 = v10;
    }
    case 1:
      {
      int v26 = 3;
      int v27 = v3 % v26;
      int v28;
      v28 = v0;
      switch (v27) {
        default:
          {
          int v29;
          v29 = v0;
          switch (v3) {
            default:
              {
              int v30 = 1;
              v29 = v30;
            }
            case 0:
              {
              v29 = v0;
              break;
            }
          }
          v28 = v29;
          break;
        }
        case 0:
          {
          int v31 = 0;
          int v32 = v0 + v31;
          v28 = v32;
          break;
        }
        case 1:
          {
          int v33 = 2;
          int v34 = v3 % v33;
          int v35;
          v35 = v0;
          switch (v34) {
            case 0:
              {
              int v36 = 3;
              int v37 = v0 + v36;
              v35 = v37;
            }
            default:
              {
              int v38 = 1;
              v35 = v38;
              break;
            }
          }
          int v39 = 4;
          int v40 = v0 + v39;
          v28 = v35;
          break;
        }
      }
      v7 = v28;
    }
    default:
      {
      int v41 = 3;
      int v42 = v0 + v41;
      v7 = v42;
      break;
    }
    case 2:
      {
      int v43 = 3;
      int v44 = v3 % v43;
      int v45 = 0;
      int v46;
      v46 = v45;
      switch (v44) {
        case 0:
          {
          int v47 = 0;
          bool v48 = v2 != v47;
          int v49;
          if (v48) {
            v49 = v0;
          } else {
            int v50 = 3;
            int v51 = v0 + v50;
            v49 = v51;
          }
          v46 = v49;
          break;
        }
        case 1:
          {
          int v52 = 2;
          int v53 = v3 % v52;
          int v54 = 1;
          int v55 = v0 + v54;
          int v56;
          v56 = v55;
          switch (v53) {
            case 0:
              {
              v56 = v0;
            }
            default:
              {
              v56 = v0;
            }
            case 1:
              {
              int v57 = 4;
              int v58 = v0 + v57;
              v56 = v58;
              break;
            }
          }
          v46 = v56;
          break;
        }
        case 2:
          {
          int v59 = 2;
          int v60 = v3 % v59;
          int v61 = 0;
          int v62;
          v62 = v61;
          switch (v60) {
            default:
              {
              int v63 = 4;
              v62 = v63;
              break;
            }
            case 0:
              {
              int v64 = 4;
              v62 = v64;
              break;
            }
            case 1:
              {
              int v65 = 3;
              v62 = v65;
              break;
            }
          }
          v46 = v62;
          break;
        }
        default:
          {
          int v66 = 0;
          bool v67 = v2 != v66;
          int v68;
          if (v67) {
            int v69 = 1;
            int v70 = v0 + v69;
            v68 = v70;
          } else {
            int v71 = 1;
            int v72 = v0 + v71;
            v68 = v72;
          }
          v46 = v68;
          break;
        }
      }
      v7 = v46;
      break;
    }
  }
  bool v73 = true;
  int v74 = simt_wave_count_bits(v73);
  int v75 = 0;
  int v76 = v75 + v0;
  v1[v76] = v74;
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
  int v86 = 0;
  bool v87 = v82 != v86;
  if (v87) {
  } else {
    int v88 = 8;
    int v89 = v88 + v79;
    int v90 = v78[v89];
    int v91 = 0;
    bool v92 = v90 != v91;
    if (v92) {
    } else {
      helper0(v79, v77, v82, v85, static_cast<int>(__simt_tid3.x));
    }
  }
  uint v93 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v94 = (int)(v93);
  int v95 = 12;
  int v96 = v95 + v79;
  int v97 = v78[v96];
  int v98;
  v98 = v79;
  switch (v97) {
    case 0:
      {
      v98 = v79;
      break;
    }
    case 1:
      {
      int v99 = 16;
      int v100 = v99 + v79;
      int v101 = v78[v100];
      int v102 = 0;
      bool v103 = v101 != v102;
      int v104;
      if (v103) {
        int v105 = 3;
        v104 = v105;
      } else {
        int v106 = 0;
        int v107 = 0;
        int v108;
        int v109;
        v108 = v106;
        v109 = v107;
        while (true) {
          int v110 = 4;
          int v111 = v109 * v110;
          int v112 = v111 + v79;
          int v113 = 20;
          int v114 = v113 + v112;
          int v115 = v78[v114];
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
          break;
          ;
        }
        v104 = v108;
      }
      v98 = v104;
      break;
    }
    default:
      {
      int v122 = 1;
      v98 = v122;
      break;
    }
    case 2:
      {
      int v123 = 40;
      int v124 = v123 + v79;
      int v125 = v78[v124];
      int v126;
      v126 = v79;
      switch (v125) {
        case 0:
          {
          int v127 = 44;
          int v128 = v127 + v79;
          int v129 = v78[v128];
          int v130 = 0;
          bool v131 = v129 != v130;
          int v132;
          if (v131) {
            v132 = v79;
          } else {
            v132 = v79;
          }
          v126 = v132;
        }
        default:
          {
          int v133 = 2;
          int v134 = v79 + v133;
          v126 = v134;
          break;
        }
      }
      bool v135 = true;
      v98 = v126;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 4; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 48; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
