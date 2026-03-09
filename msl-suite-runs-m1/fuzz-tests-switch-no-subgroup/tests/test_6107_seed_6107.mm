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
  int v4 = 2;
  int v5 = v3 % v4;
  int v6 = 0;
  int v7;
  v7 = v6;
  switch (v5) {
    case 0:
      {
      int v8 = 0;
      bool v9 = v2 != v8;
      int v10;
      if (v9) {
        int v11 = 4;
        int v12 = v3 % v11;
        int v13 = 3;
        int v14;
        v14 = v13;
        switch (v12) {
          case 0:
            {
            v14 = v0;
            break;
          }
          default:
            {
            v14 = v0;
          }
          case 1:
            {
            v14 = v0;
            break;
          }
          case 2:
            {
            int v15 = 0;
            v14 = v15;
            break;
          }
        }
        v10 = v14;
      } else {
        int v16 = 0;
        v10 = v16;
      }
      v7 = v10;
      break;
    }
    default:
      {
      int v17 = 0;
      bool v18 = v2 != v17;
      int v19;
      if (v18) {
        int v20 = 3;
        v19 = v20;
      } else {
        int v21 = 3;
        int v22 = v3 % v21;
        int v23 = 3;
        int v24;
        v24 = v23;
        switch (v22) {
          case 0:
            {
            int v25 = 2;
            v24 = v25;
            break;
          }
          default:
            {
            v24 = v0;
            break;
          }
          case 1:
            {
            int v26 = 3;
            v24 = v26;
            break;
          }
          case 2:
            {
            v24 = v0;
            break;
          }
        }
        v19 = v24;
      }
      v7 = v19;
      break;
    }
  }
  bool v27 = true;
  int v28 = simt_wave_count_bits(v27);
  int v29 = 0;
  int v30 = v29 + v0;
  v1[v30] = v28;
  return;
}

kernel void kernel_main(device int* v31 [[buffer(0)]], device int* v32 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v33 = static_cast<int>(__simt_tid3.x);
  int v34 = 0;
  int v35 = v34 + v33;
  int v36 = v32[v35];
  int v37 = 4;
  int v38 = v37 + v33;
  int v39 = v32[v38];
  int v40 = 0;
  bool v41 = v36 != v40;
  if (v41) {
  } else {
    int v42 = 8;
    int v43 = v42 + v33;
    int v44 = v32[v43];
    int v45 = 0;
    bool v46 = v44 != v45;
    if (v46) {
      helper0(v33, v31, v36, v39, static_cast<int>(__simt_tid3.x));
    } else {
    }
  }
  int v47 = 1;
  int v48 = v33 + v47;
  int v49 = 12;
  int v50 = v49 + v33;
  int v51 = v32[v50];
  int v52 = 4;
  int v53;
  v53 = v52;
  switch (v51) {
    case 0:
      {
      int v54 = 16;
      int v55 = v54 + v33;
      int v56 = v32[v55];
      int v57 = 0;
      bool v58 = v56 != v57;
      int v59;
      if (v58) {
        int v60 = 20;
        int v61 = v60 + v33;
        int v62 = v32[v61];
        int v63;
        v63 = v33;
        switch (v62) {
          case 0:
            {
            v63 = v33;
            break;
          }
          case 1:
            {
            int v64 = 1;
            int v65 = v33 + v64;
            v63 = v65;
            break;
          }
          case 2:
            {
            int v66 = 4;
            v63 = v66;
            break;
          }
          default:
            {
            v63 = v33;
            break;
          }
        }
        bool v67 = true;
        v59 = v63;
      } else {
        int v68 = 24;
        int v69 = v68 + v33;
        int v70 = v32[v69];
        int v71 = 0;
        int v72;
        v72 = v71;
        switch (v70) {
          default:
            {
            v72 = v33;
            break;
          }
          case 0:
            {
            int v73 = 3;
            v72 = v73;
            break;
          }
          case 1:
            {
            int v74 = 0;
            int v75 = v33 + v74;
            v72 = v75;
            break;
          }
        }
        v59 = v72;
      }
      v53 = v59;
      break;
    }
    case 1:
      {
      int v76 = 28;
      int v77 = v76 + v33;
      int v78 = v32[v77];
      int v79 = 0;
      bool v80 = v78 != v79;
      int v81;
      if (v80) {
        int v82 = 32;
        int v83 = v82 + v33;
        int v84 = v32[v83];
        int v85;
        v85 = v33;
        switch (v84) {
          case 0:
            {
            int v86 = 0;
            int v87 = v33 + v86;
            v85 = v87;
          }
          case 1:
            {
            int v88 = 2;
            int v89 = v33 + v88;
            v85 = v89;
            break;
          }
          default:
            {
            v85 = v33;
            break;
          }
        }
        v81 = v85;
      } else {
        int v90 = 36;
        int v91 = v90 + v33;
        int v92 = v32[v91];
        int v93 = 0;
        bool v94 = v92 != v93;
        int v95;
        if (v94) {
          v95 = v33;
        } else {
          int v96 = 0;
          int v97 = v33 + v96;
          v95 = v97;
        }
        v81 = v95;
      }
      v53 = v81;
      break;
    }
    default:
      {
      int v98 = 40;
      int v99 = v98 + v33;
      int v100 = v32[v99];
      int v101 = 0;
      bool v102 = v100 != v101;
      int v103;
      if (v102) {
        int v104 = 0;
        int v105 = 0;
        int v106;
        int v107;
        v106 = v104;
        v107 = v105;
        while (true) {
          int v108 = 4;
          int v109 = v107 * v108;
          int v110 = v109 + v33;
          int v111 = 44;
          int v112 = v111 + v110;
          int v113 = v32[v112];
          int v114 = 0;
          bool v115 = v113 != v114;
          v106 = v106;
          v107 = v107;
          if (!v115) break;
          int v116 = v106 + v107;
          int v117 = 1;
          int v118 = v107 + v117;
          bool v119 = true;
          v106 = v116;
          v107 = v118;
          break;
          ;
        }
        v103 = v106;
      } else {
        v103 = v33;
      }
      v53 = v103;
      break;
    }
  }
  bool v120 = true;
  int v121 = 16;
  int v122 = v121 + v33;
  bool v123 = true;
  int v124 = simt_wave_count_bits(v123);
  v31[v122] = v124;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 64; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
