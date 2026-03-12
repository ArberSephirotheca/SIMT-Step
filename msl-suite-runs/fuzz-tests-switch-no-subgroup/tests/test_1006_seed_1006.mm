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
  int v6;
  v6 = v0;
  switch (v5) {
    case 0:
      {
      int v7 = 0;
      bool v8 = v2 != v7;
      int v9;
      if (v8) {
        int v10 = 4;
        v9 = v10;
      } else {
        int v11 = 0;
        bool v12 = v2 != v11;
        int v13;
        if (v12) {
          int v14 = 4;
          v13 = v14;
        } else {
          int v15 = 2;
          v13 = v15;
        }
        v9 = v13;
      }
      v6 = v9;
      break;
    }
    case 1:
      {
      int v16 = 2;
      int v17 = v3 % v16;
      int v18 = 4;
      int v19;
      v19 = v18;
      switch (v17) {
        default:
          {
          int v20 = 0;
          int v21 = v0 + v20;
          v19 = v21;
          break;
        }
        case 0:
          {
          int v22 = 3;
          int v23 = v3 % v22;
          int v24 = 2;
          int v25 = v0 + v24;
          int v26;
          v26 = v25;
          switch (v23) {
            case 0:
              {
              int v27 = 3;
              v26 = v27;
              break;
            }
            default:
              {
              int v28 = 1;
              int v29 = v0 + v28;
              v26 = v29;
            }
            case 1:
              {
              int v30 = 1;
              v26 = v30;
            }
            case 2:
              {
              v26 = v0;
              break;
            }
          }
          v19 = v26;
          break;
        }
      }
      int v31 = 4;
      int v32 = v0 + v31;
      v6 = v19;
      break;
    }
    case 2:
      {
      int v33 = 4;
      int v34 = v0 + v33;
      int v35;
      v35 = v34;
      switch (v3) {
        case 0:
          {
          int v36 = 3;
          int v37 = v3 % v36;
          int v38 = 1;
          int v39 = v0 + v38;
          int v40;
          v40 = v39;
          switch (v37) {
            case 0:
              {
              v40 = v0;
              break;
            }
            default:
              {
              int v41 = 1;
              v40 = v41;
              break;
            }
            case 1:
              {
              int v42 = 1;
              int v43 = v0 + v42;
              v40 = v43;
              break;
            }
          }
          v35 = v40;
          break;
        }
        default:
          {
          int v44 = 0;
          v35 = v44;
          break;
        }
      }
      v6 = v35;
      break;
    }
    default:
      {
      int v45 = 0;
      int v46 = 0;
      int v47;
      int v48;
      v47 = v45;
      v48 = v46;
      while (true) {
        int v49 = 4;
        int v50 = v3 % v49;
        int v51 = 1;
        int v52 = v50 + v51;
        bool v53 = v48 < v52;
        v47 = v47;
        v48 = v48;
        if (!v53) break;
        int v54 = 3;
        int v55 = v3 % v54;
        int v56;
        v56 = v0;
        switch (v55) {
          default:
            {
            int v57 = 1;
            v56 = v57;
            break;
          }
          case 0:
            {
            int v58 = 3;
            v56 = v58;
            break;
          }
          case 1:
            {
            int v59 = 4;
            int v60 = v0 + v59;
            v56 = v60;
            break;
          }
          case 2:
            {
            int v61 = 1;
            int v62 = v0 + v61;
            v56 = v62;
            break;
          }
        }
        int v63 = 1;
        int v64 = v48 + v63;
        v47 = v56;
        v48 = v64;
        break;
        ;
      }
      v6 = v47;
      break;
    }
  }
  bool v65 = true;
  int v66 = simt_wave_count_bits(v65);
  int v67 = 0;
  int v68 = v67 + v0;
  v1[v68] = v66;
  return;
}

kernel void kernel_main(device int* v69 [[buffer(0)]], device int* v70 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v71 = static_cast<int>(__simt_tid3.x);
  int v72 = 0;
  int v73 = v72 + v71;
  int v74 = v70[v73];
  int v75 = 4;
  int v76 = v75 + v71;
  int v77 = v70[v76];
  helper0(v71, v69, v74, v77, static_cast<int>(__simt_tid3.x));
  int v78 = 0;
  int v79 = 0;
  int v80;
  int v81;
  v80 = v78;
  v81 = v79;
  while (true) {
    int v82 = 4;
    int v83 = v81 * v82;
    int v84 = v83 + v71;
    int v85 = 8;
    int v86 = v85 + v84;
    int v87 = v70[v86];
    int v88 = 0;
    bool v89 = v87 != v88;
    v80 = v80;
    v81 = v81;
    if (!v89) break;
    int v90 = 28;
    int v91 = v90 + v71;
    int v92 = v70[v91];
    int v93 = 0;
    bool v94 = v92 != v93;
    int v95;
    if (v94) {
      int v96 = 32;
      int v97 = v96 + v71;
      int v98 = v70[v97];
      uint v99 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v100 = (int)(v99);
      int v101;
      v101 = v100;
      switch (v98) {
        default:
          {
          int v102 = 1;
          v101 = v102;
          break;
        }
        case 0:
          {
          int v103 = 4;
          int v104 = v71 + v103;
          v101 = v104;
        }
        case 1:
          {
          int v105 = 4;
          int v106 = v71 + v105;
          v101 = v106;
        }
        case 2:
          {
          int v107 = 3;
          int v108 = v71 + v107;
          v101 = v108;
          break;
        }
      }
      v95 = v101;
    } else {
      int v109 = 36;
      int v110 = v109 + v71;
      int v111 = v70[v110];
      int v112 = 2;
      int v113 = v71 + v112;
      int v114;
      v114 = v113;
      switch (v111) {
        default:
          {
          v114 = v71;
          break;
        }
        case 0:
          {
          int v115 = 2;
          int v116 = v71 + v115;
          v114 = v116;
          break;
        }
      }
      v95 = v114;
    }
    int v117 = 16;
    int v118 = v117 + v71;
    bool v119 = true;
    int v120 = simt_wave_count_bits(v119);
    v69[v118] = v120;
    int v121 = v80 + v95;
    int v122 = 1;
    int v123 = v81 + v122;
    bool v124 = true;
    int v125 = 32;
    int v126 = 4;
    int v127 = v81 * v126;
    int v128 = v125 + v127;
    int v129 = v128 + v71;
    bool v130 = true;
    int v131 = simt_wave_count_bits(v130);
    v69[v129] = v131;
    v80 = v121;
    v81 = v123;
  }
  int v132 = 1;
  int v133 = v71 + v132;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 43; ++idx) {
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
