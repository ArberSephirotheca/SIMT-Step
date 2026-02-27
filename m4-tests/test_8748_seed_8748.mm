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
    int v13 = 2;
    int v14 = v3 % v13;
    int v15 = 3;
    int v16 = v0 + v15;
    int v17;
    v17 = v16;
    switch (v14) {
      case 0:
        {
        int v18 = 2;
        int v19 = v3 % v18;
        int v20 = 1;
        int v21 = v0 + v20;
        int v22;
        v22 = v21;
        switch (v19) {
          default:
            {
            int v23 = 4;
            int v24 = v0 + v23;
            v22 = v24;
            break;
          }
          case 0:
            {
            int v25 = 1;
            int v26 = v0 + v25;
            v22 = v26;
            break;
          }
        }
        v17 = v22;
        break;
      }
      default:
        {
        int v27 = 4;
        v17 = v27;
        break;
      }
    }
    bool v28 = true;
    int v29 = simt_wave_count_bits(v28);
    int v30 = 0;
    int v31 = 4;
    int v32 = v7 * v31;
    int v33 = v30 + v32;
    int v34 = v33 + v0;
    v1[v34] = v29;
    int v35 = 1;
    int v36 = v7 + v35;
    v6 = v17;
    v7 = v36;
  }
  return;
}

kernel void kernel_main(device int* v37 [[buffer(0)]], device int* v38 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v39 = static_cast<int>(__simt_tid3.x);
  int v40 = 0;
  int v41 = v40 + v39;
  int v42 = v38[v41];
  int v43 = 4;
  int v44 = v43 + v39;
  int v45 = v38[v44];
  helper0(v39, v37, v42, v45, static_cast<int>(__simt_tid3.x));
  int v46 = 0;
  int v47 = 0;
  int v48;
  int v49;
  v48 = v46;
  v49 = v47;
  while (true) {
    int v50 = 4;
    int v51 = v49 * v50;
    int v52 = v51 + v39;
    int v53 = 8;
    int v54 = v53 + v52;
    int v55 = v38[v54];
    int v56 = 0;
    bool v57 = v55 != v56;
    v48 = v48;
    v49 = v49;
    if (!v57) break;
    int v58 = v48 + v49;
    int v59 = 1;
    int v60 = v49 + v59;
    bool v61 = true;
    int v62 = 16;
    int v63 = 4;
    int v64 = v49 * v63;
    int v65 = v62 + v64;
    int v66 = v65 + v39;
    bool v67 = true;
    int v68 = simt_wave_count_bits(v67);
    v37[v66] = v68;
    v48 = v58;
    v49 = v60;
  }
  int v69 = 28;
  int v70 = v69 + v39;
  int v71 = v38[v70];
  int v72 = 3;
  int v73;
  v73 = v72;
  switch (v71) {
    default:
      {
      int v74 = 32;
      int v75 = v74 + v39;
      int v76 = v38[v75];
      int v77 = 0;
      bool v78 = v76 != v77;
      int v79;
      if (v78) {
        int v80 = 36;
        int v81 = v80 + v39;
        int v82 = v38[v81];
        int v83;
        v83 = v39;
        switch (v82) {
          case 0:
            {
            int v84 = 0;
            v83 = v84;
            break;
          }
          case 1:
            {
            int v85 = 0;
            v83 = v85;
          }
          default:
            {
            int v86 = 1;
            int v87 = v39 + v86;
            v83 = v87;
            break;
          }
          case 2:
            {
            v83 = v39;
            break;
          }
        }
        v79 = v83;
      } else {
        int v88 = 3;
        v79 = v88;
      }
      v73 = v79;
      break;
    }
    case 0:
      {
      int v89 = 40;
      int v90 = v89 + v39;
      int v91 = v38[v90];
      int v92 = 1;
      int v93 = v39 + v92;
      int v94;
      v94 = v93;
      switch (v91) {
        case 0:
          {
          int v95 = 44;
          int v96 = v95 + v39;
          int v97 = v38[v96];
          int v98 = 0;
          bool v99 = v97 != v98;
          int v100;
          if (v99) {
            int v101 = 3;
            int v102 = v39 + v101;
            v100 = v102;
          } else {
            int v103 = 2;
            int v104 = v39 + v103;
            v100 = v104;
          }
          v94 = v100;
        }
        case 1:
          {
          int v105 = 0;
          int v106 = 0;
          int v107;
          int v108;
          v107 = v105;
          v108 = v106;
          while (true) {
            int v109 = 4;
            int v110 = v108 * v109;
            int v111 = v110 + v39;
            int v112 = 48;
            int v113 = v112 + v111;
            int v114 = v38[v113];
            int v115 = 0;
            bool v116 = v114 != v115;
            v107 = v107;
            v108 = v108;
            if (!v116) break;
            int v117 = v107 + v108;
            int v118 = 1;
            int v119 = v108 + v118;
            bool v120 = true;
            v107 = v117;
            v108 = v119;
          }
          v94 = v107;
        }
        default:
          {
          int v121 = 68;
          int v122 = v121 + v39;
          int v123 = v38[v122];
          int v124 = 3;
          int v125 = v39 + v124;
          int v126;
          v126 = v125;
          switch (v123) {
            default:
              {
              int v127 = 4;
              v126 = v127;
            }
            case 0:
              {
              int v128 = 2;
              int v129 = v39 + v128;
              v126 = v129;
            }
            case 1:
              {
              v126 = v39;
              break;
            }
          }
          v94 = v126;
          break;
        }
      }
      bool v130 = true;
      v73 = v94;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 27; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 72; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
