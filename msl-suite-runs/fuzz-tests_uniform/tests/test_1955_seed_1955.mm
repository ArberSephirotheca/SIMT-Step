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
      int v8 = 2;
      int v9 = v3 % v8;
      int v10 = 1;
      int v11 = v0 + v10;
      int v12;
      v12 = v11;
      switch (v9) {
        case 0:
          {
          int v13 = 0;
          int v14 = 0;
          int v15;
          int v16;
          v15 = v13;
          v16 = v14;
          while (true) {
            int v17 = 4;
            int v18 = v3 % v17;
            int v19 = 1;
            int v20 = v18 + v19;
            bool v21 = v16 < v20;
            v15 = v15;
            v16 = v16;
            if (!v21) break;
            int v22 = 3;
            int v23 = v0 + v22;
            int v24 = 1;
            int v25 = v16 + v24;
            v15 = v23;
            v16 = v25;
          }
          v12 = v15;
          break;
        }
        default:
          {
          v12 = v0;
          break;
        }
      }
      int v26 = 0;
      v7 = v12;
      break;
    }
    default:
      {
      int v27 = 0;
      int v28 = v0 + v27;
      v7 = v28;
      break;
    }
    case 1:
      {
      int v29 = 2;
      int v30 = v3 % v29;
      int v31 = 2;
      int v32;
      v32 = v31;
      switch (v30) {
        case 0:
          {
          int v33 = 4;
          int v34 = v3 % v33;
          int v35;
          v35 = v0;
          switch (v34) {
            case 0:
              {
              int v36 = 0;
              int v37 = v0 + v36;
              v35 = v37;
              break;
            }
            case 1:
              {
              v35 = v0;
              break;
            }
            default:
              {
              int v38 = 4;
              v35 = v38;
              break;
            }
            case 2:
              {
              int v39 = 0;
              v35 = v39;
              break;
            }
          }
          int v40 = 0;
          v32 = v35;
        }
        default:
          {
          v32 = v0;
        }
        case 1:
          {
          int v41 = 2;
          int v42 = v3 % v41;
          int v43 = 4;
          int v44;
          v44 = v43;
          switch (v42) {
            default:
              {
              v44 = v0;
            }
            case 0:
              {
              v44 = v0;
              break;
            }
            case 1:
              {
              v44 = v0;
              break;
            }
          }
          int v45 = 2;
          v32 = v44;
          break;
        }
      }
      int v46 = 0;
      int v47 = v0 + v46;
      v7 = v32;
      break;
    }
    case 2:
      {
      int v48 = 4;
      int v49 = v3 % v48;
      int v50 = 3;
      int v51;
      v51 = v50;
      switch (v49) {
        case 0:
          {
          int v52 = 4;
          int v53 = v3 % v52;
          int v54 = 0;
          int v55;
          v55 = v54;
          switch (v53) {
            case 0:
              {
              int v56 = 0;
              v55 = v56;
              break;
            }
            case 1:
              {
              int v57 = 3;
              v55 = v57;
              break;
            }
            default:
              {
              v55 = v0;
              break;
            }
            case 2:
              {
              v55 = v0;
              break;
            }
          }
          int v58 = 2;
          v51 = v55;
          break;
        }
        case 1:
          {
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
            int v68 = 1;
            int v69 = v62 + v68;
            v61 = v0;
            v62 = v69;
            break;
            ;
          }
          v51 = v61;
          break;
        }
        default:
          {
          v51 = v0;
          break;
        }
        case 2:
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
          }
          int v81 = 0;
          int v82 = v0 + v81;
          v51 = v72;
          break;
        }
      }
      v7 = v51;
      break;
    }
  }
  bool v83 = true;
  int v84 = simt_wave_count_bits(v83);
  int v85 = 0;
  int v86 = v85 + v0;
  v1[v86] = v84;
  return;
}

kernel void kernel_main(device int* v87 [[buffer(0)]], device int* v88 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v89 = static_cast<int>(__simt_tid3.x);
  int v90 = 0;
  int v91 = v90 + v89;
  int v92 = v88[v91];
  int v93 = 4;
  int v94 = v93 + v89;
  int v95 = v88[v94];
  helper0(v89, v87, v92, v95, static_cast<int>(__simt_tid3.x));
  int v96 = 8;
  int v97 = v96 + v89;
  int v98 = v88[v97];
  int v99;
  v99 = v89;
  switch (v98) {
    case 0:
      {
      int v100 = 12;
      int v101 = v100 + v89;
      int v102 = v88[v101];
      int v103 = 0;
      bool v104 = v102 != v103;
      int v105;
      if (v104) {
        v105 = v89;
      } else {
        v105 = v89;
      }
      v99 = v105;
      break;
    }
    default:
      {
      int v106 = 0;
      int v107 = v89 + v106;
      v99 = v107;
      break;
    }
  }
  bool v108 = true;
  int v109 = 16;
  int v110 = v109 + v89;
  bool v111 = true;
  int v112 = simt_wave_count_bits(v111);
  v87[v110] = v112;
  int v113 = 0;
  int v114 = v89 + v113;
  int v115 = 16;
  int v116 = v115 + v89;
  int v117 = v88[v116];
  int v118 = 0;
  bool v119 = v117 != v118;
  int v120;
  if (v119) {
    int v121 = 0;
    int v122 = 0;
    int v123;
    int v124;
    v123 = v121;
    v124 = v122;
    while (true) {
      int v125 = 4;
      int v126 = v124 * v125;
      int v127 = v126 + v89;
      int v128 = 20;
      int v129 = v128 + v127;
      int v130 = v88[v129];
      int v131 = 0;
      bool v132 = v130 != v131;
      v123 = v123;
      v124 = v124;
      if (!v132) break;
      int v133 = 3;
      int v134 = v123 + v133;
      int v135 = 1;
      int v136 = v124 + v135;
      v123 = v134;
      v124 = v136;
    }
    bool v137 = true;
    v120 = v123;
  } else {
    uint v138 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v139 = (int)(v138);
    v120 = v139;
  }
  int v140 = 32;
  int v141 = v140 + v89;
  bool v142 = true;
  int v143 = simt_wave_count_bits(v142);
  v87[v141] = v143;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
