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
  int v5;
  v5 = v4;
  switch (v3) {
    case 0:
      {
      int v6 = 0;
      bool v7 = v2 != v6;
      int v8;
      if (v7) {
        int v9 = 2;
        int v10 = v3 % v9;
        int v11 = 0;
        int v12 = v0 + v11;
        int v13;
        v13 = v12;
        switch (v10) {
          default:
            {
            v13 = v0;
            break;
          }
          case 0:
            {
            int v14 = 4;
            int v15 = v0 + v14;
            v13 = v15;
            break;
          }
        }
        int v16 = 0;
        v8 = v13;
      } else {
        int v17 = 2;
        int v18 = v3 % v17;
        int v19 = 0;
        int v20;
        v20 = v19;
        switch (v18) {
          case 0:
            {
            int v21 = 1;
            v20 = v21;
            break;
          }
          default:
            {
            v20 = v0;
            break;
          }
        }
        int v22 = 2;
        v8 = v20;
      }
      v5 = v8;
      break;
    }
    default:
      {
      int v23 = 3;
      int v24 = v3 % v23;
      int v25;
      v25 = v0;
      switch (v24) {
        case 0:
          {
          int v26 = 0;
          bool v27 = v2 != v26;
          int v28;
          if (v27) {
            v28 = v0;
          } else {
            int v29 = 1;
            v28 = v29;
          }
          v25 = v28;
          break;
        }
        case 1:
          {
          int v30 = 0;
          bool v31 = v2 != v30;
          int v32;
          if (v31) {
            v32 = v0;
          } else {
            int v33 = 3;
            v32 = v33;
          }
          v25 = v32;
        }
        case 2:
          {
          int v34 = 0;
          bool v35 = v2 != v34;
          int v36;
          if (v35) {
            v36 = v0;
          } else {
            v36 = v0;
          }
          v25 = v36;
          break;
        }
        default:
          {
          int v37 = 3;
          int v38 = v3 % v37;
          int v39;
          v39 = v0;
          switch (v38) {
            case 0:
              {
              int v40 = 4;
              int v41 = v0 + v40;
              v39 = v41;
              break;
            }
            case 1:
              {
              int v42 = 3;
              v39 = v42;
              break;
            }
            default:
              {
              int v43 = 4;
              int v44 = v0 + v43;
              v39 = v44;
              break;
            }
          }
          v25 = v39;
          break;
        }
      }
      v5 = v25;
      break;
    }
  }
  bool v45 = true;
  int v46 = simt_wave_count_bits(v45);
  int v47 = 0;
  int v48 = v47 + v0;
  v1[v48] = v46;
  return;
}

kernel void kernel_main(device int* v49 [[buffer(0)]], device int* v50 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v51 = static_cast<int>(__simt_tid3.x);
  int v52 = 0;
  int v53 = v52 + v51;
  int v54 = v50[v53];
  int v55 = 4;
  int v56 = v55 + v51;
  int v57 = v50[v56];
  int v58 = 0;
  bool v59 = v54 != v58;
  if (v59) {
    int v60 = 0;
    int v61 = 0;
    int v62;
    int v63;
    v62 = v60;
    v63 = v61;
    while (true) {
      int v64 = 1;
      bool v65 = v63 < v64;
      v62 = v62;
      v63 = v63;
      if (!v65) break;
      int v66 = 3;
      int v67 = v51 % v66;
      int v68;
      v68 = v51;
      switch (v67) {
        case 0:
          {
          int v69 = 3;
          int v70 = v68 + v69;
          v68 = v70;
          break;
        }
        case 1:
          {
          int v71 = 0;
          int v72 = v68 + v71;
          v68 = v72;
          break;
        }
        case 2:
          {
          int v73 = 0;
          int v74 = v68 + v73;
          v68 = v74;
          break;
        }
        default:
          {
          int v75 = 3;
          int v76 = v68 + v75;
          v68 = v76;
          break;
        }
      }
      helper0(v51, v49, v54, v57, static_cast<int>(__simt_tid3.x));
      int v77 = 1;
      int v78 = v63 + v77;
      v62 = v62;
      v63 = v78;
    }
  } else {
  }
  int v79 = 8;
  int v80 = v79 + v51;
  int v81 = v50[v80];
  uint v82 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v83 = (int)(v82);
  int v84;
  v84 = v83;
  switch (v81) {
    default:
      {
      int v85 = 0;
      int v86 = 0;
      int v87;
      int v88;
      v87 = v85;
      v88 = v86;
      while (true) {
        int v89 = 4;
        int v90 = v88 * v89;
        int v91 = v90 + v51;
        int v92 = 12;
        int v93 = v92 + v91;
        int v94 = v50[v93];
        int v95 = 0;
        bool v96 = v94 != v95;
        v87 = v87;
        v88 = v88;
        if (!v96) break;
        int v97 = v87 + v88;
        int v98 = 1;
        int v99 = v88 + v98;
        bool v100 = true;
        v87 = v97;
        v88 = v99;
      }
      v84 = v87;
      break;
    }
    case 0:
      {
      int v101 = 0;
      v84 = v101;
      break;
    }
    case 1:
      {
      int v102 = 32;
      int v103 = v102 + v51;
      int v104 = v50[v103];
      int v105 = 0;
      bool v106 = v104 != v105;
      int v107;
      if (v106) {
        int v108 = 36;
        int v109 = v108 + v51;
        int v110 = v50[v109];
        int v111 = 3;
        int v112 = v51 + v111;
        int v113;
        v113 = v112;
        switch (v110) {
          case 0:
            {
            int v114 = 1;
            int v115 = v51 + v114;
            v113 = v115;
            break;
          }
          case 1:
            {
            int v116 = 4;
            int v117 = v51 + v116;
            v113 = v117;
            break;
          }
          case 2:
            {
            int v118 = 3;
            int v119 = v51 + v118;
            v113 = v119;
            break;
          }
          default:
            {
            int v120 = 1;
            v113 = v120;
            break;
          }
        }
        v107 = v113;
      } else {
        int v121 = 40;
        int v122 = v121 + v51;
        int v123 = v50[v122];
        int v124;
        v124 = v51;
        switch (v123) {
          case 0:
            {
            v124 = v51;
            break;
          }
          default:
            {
            int v125 = 4;
            v124 = v125;
            break;
          }
          case 1:
            {
            v124 = v51;
            break;
          }
          case 2:
            {
            int v126 = 3;
            int v127 = v51 + v126;
            v124 = v127;
            break;
          }
        }
        v107 = v124;
      }
      v84 = v107;
      break;
    }
    case 2:
      {
      int v128 = 4;
      int v129 = v51 + v128;
      v84 = v129;
      break;
    }
  }
  bool v130 = true;
  int v131 = 16;
  int v132 = v131 + v51;
  bool v133 = true;
  int v134 = simt_wave_count_bits(v133);
  v49[v132] = v134;
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 44; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
