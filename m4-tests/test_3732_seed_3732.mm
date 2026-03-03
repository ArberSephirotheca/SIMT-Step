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
      int v9 = 4;
      int v10 = v3 % v9;
      int v11;
      v11 = v0;
      switch (v10) {
        case 0:
          {
          v11 = v0;
          break;
        }
        case 1:
          {
          int v12 = 2;
          int v13 = v3 % v12;
          int v14 = 4;
          int v15 = v0 + v14;
          int v16;
          v16 = v15;
          switch (v13) {
            case 0:
              {
              int v17 = 4;
              int v18 = v0 + v17;
              v16 = v18;
            }
            default:
              {
              v16 = v0;
              break;
            }
            case 1:
              {
              int v19 = 4;
              v16 = v19;
              break;
            }
          }
          v11 = v16;
        }
        case 2:
          {
          int v20 = 2;
          int v21 = v3 % v20;
          int v22 = 0;
          int v23;
          v23 = v22;
          switch (v21) {
            case 0:
              {
              int v24 = 1;
              int v25 = v0 + v24;
              v23 = v25;
              break;
            }
            default:
              {
              int v26 = 1;
              int v27 = v0 + v26;
              v23 = v27;
              break;
            }
            case 1:
              {
              v23 = v0;
              break;
            }
          }
          v11 = v23;
        }
        default:
          {
          int v28 = 3;
          int v29 = v3 % v28;
          int v30 = 1;
          int v31 = v0 + v30;
          int v32;
          v32 = v31;
          switch (v29) {
            case 0:
              {
              int v33 = 3;
              int v34 = v0 + v33;
              v32 = v34;
              break;
            }
            case 1:
              {
              int v35 = 2;
              v32 = v35;
              break;
            }
            default:
              {
              v32 = v0;
              break;
            }
            case 2:
              {
              v32 = v0;
              break;
            }
          }
          v11 = v32;
          break;
        }
      }
      v8 = v11;
      break;
    }
    case 1:
      {
      v8 = v0;
    }
    case 2:
      {
      int v36 = 4;
      int v37 = v3 % v36;
      int v38 = 2;
      int v39;
      v39 = v38;
      switch (v37) {
        case 0:
          {
          int v40 = 2;
          int v41 = v3 % v40;
          int v42;
          v42 = v0;
          switch (v41) {
            case 0:
              {
              int v43 = 3;
              int v44 = v0 + v43;
              v42 = v44;
              break;
            }
            default:
              {
              v42 = v0;
              break;
            }
            case 1:
              {
              v42 = v0;
              break;
            }
          }
          v39 = v42;
          break;
        }
        default:
          {
          int v45 = 2;
          int v46 = v3 % v45;
          int v47;
          v47 = v0;
          switch (v46) {
            default:
              {
              int v48 = 1;
              v47 = v48;
              break;
            }
            case 0:
              {
              int v49 = 2;
              v47 = v49;
              break;
            }
          }
          v39 = v47;
        }
        case 1:
          {
          int v50 = 2;
          int v51 = v3 % v50;
          int v52 = 1;
          int v53 = v0 + v52;
          int v54;
          v54 = v53;
          switch (v51) {
            case 0:
              {
              int v55 = 0;
              int v56 = v0 + v55;
              v54 = v56;
              break;
            }
            default:
              {
              int v57 = 1;
              int v58 = v0 + v57;
              v54 = v58;
              break;
            }
          }
          int v59 = 0;
          int v60 = v0 + v59;
          v39 = v54;
        }
        case 2:
          {
          int v61 = 2;
          int v62 = v3 % v61;
          int v63;
          v63 = v0;
          switch (v62) {
            case 0:
              {
              int v64 = 2;
              v63 = v64;
            }
            default:
              {
              int v65 = 2;
              v63 = v65;
              break;
            }
          }
          v39 = v63;
          break;
        }
      }
      v8 = v39;
    }
    default:
      {
      v8 = v0;
      break;
    }
  }
  bool v66 = true;
  int v67 = simt_wave_count_bits(v66);
  int v68 = 0;
  int v69 = v68 + v0;
  v1[v69] = v67;
  return;
}

kernel void kernel_main(device int* v70 [[buffer(0)]], device int* v71 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v72 = static_cast<int>(__simt_tid3.x);
  int v73 = 0;
  int v74 = v73 + v72;
  int v75 = v71[v74];
  int v76 = 4;
  int v77 = v76 + v72;
  int v78 = v71[v77];
  int v79 = 0;
  bool v80 = v75 != v79;
  if (v80) {
    int v81 = 8;
    int v82 = v81 + v72;
    int v83 = v71[v82];
    int v84 = 0;
    bool v85 = v83 != v84;
    if (v85) {
    } else {
      helper0(v72, v70, v75, v78, static_cast<int>(__simt_tid3.x));
    }
  } else {
  }
  int v86 = 0;
  int v87 = 0;
  int v88;
  int v89;
  v88 = v86;
  v89 = v87;
  while (true) {
    int v90 = 4;
    int v91 = v89 * v90;
    int v92 = v91 + v72;
    int v93 = 12;
    int v94 = v93 + v92;
    int v95 = v71[v94];
    int v96 = 0;
    bool v97 = v95 != v96;
    v88 = v88;
    v89 = v89;
    if (!v97) break;
    int v98 = 32;
    int v99 = v98 + v72;
    int v100 = v71[v99];
    int v101 = 0;
    int v102;
    v102 = v101;
    switch (v100) {
      default:
        {
        int v103 = 0;
        int v104 = 0;
        int v105;
        int v106;
        v105 = v103;
        v106 = v104;
        while (true) {
          int v107 = 4;
          int v108 = v106 * v107;
          int v109 = v108 + v72;
          int v110 = 36;
          int v111 = v110 + v109;
          int v112 = v71[v111];
          int v113 = 0;
          bool v114 = v112 != v113;
          v105 = v105;
          v106 = v106;
          if (!v114) break;
          int v115 = v105 + v106;
          int v116 = 1;
          int v117 = v106 + v116;
          bool v118 = true;
          v105 = v115;
          v106 = v117;
        }
        v102 = v105;
        break;
      }
      case 0:
        {
        int v119 = 56;
        int v120 = v119 + v72;
        int v121 = v71[v120];
        int v122 = 4;
        int v123;
        v123 = v122;
        switch (v121) {
          case 0:
            {
            int v124 = 0;
            int v125 = v72 + v124;
            v123 = v125;
            break;
          }
          default:
            {
            int v126 = 3;
            v123 = v126;
          }
          case 1:
            {
            v123 = v72;
            break;
          }
          case 2:
            {
            int v127 = 3;
            int v128 = v72 + v127;
            v123 = v128;
            break;
          }
        }
        v102 = v123;
        break;
      }
    }
    int v129 = v88 + v102;
    int v130 = 1;
    int v131 = v89 + v130;
    bool v132 = true;
    int v133 = 16;
    int v134 = 4;
    int v135 = v89 * v134;
    int v136 = v133 + v135;
    int v137 = v136 + v72;
    bool v138 = true;
    int v139 = simt_wave_count_bits(v138);
    v70[v137] = v139;
    v88 = v129;
    v89 = v131;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 24; ++idx) {
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
