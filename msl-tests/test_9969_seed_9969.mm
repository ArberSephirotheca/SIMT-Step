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
  bool v5 = v2 != v4;
  int v6;
  if (v5) {
    int v7 = 4;
    int v8 = v3 % v7;
    int v9 = 2;
    int v10;
    v10 = v9;
    switch (v8) {
      default:
        {
        int v11 = 0;
        bool v12 = v2 != v11;
        int v13;
        if (v12) {
          v13 = v0;
        } else {
          int v14 = 0;
          v13 = v14;
        }
        int v15 = 3;
        v10 = v13;
        break;
      }
      case 0:
        {
        int v16 = 0;
        bool v17 = v2 != v16;
        int v18;
        if (v17) {
          v18 = v0;
        } else {
          int v19 = 2;
          int v20 = v0 + v19;
          v18 = v20;
        }
        int v21 = 2;
        int v22 = v0 + v21;
        v10 = v18;
        break;
      }
      case 1:
        {
        int v23 = 0;
        bool v24 = v2 != v23;
        int v25;
        if (v24) {
          int v26 = 2;
          int v27 = v0 + v26;
          v25 = v27;
        } else {
          v25 = v0;
        }
        int v28 = 1;
        int v29 = v0 + v28;
        v10 = v25;
        break;
      }
      case 2:
        {
        int v30 = 3;
        int v31 = v3 % v30;
        int v32;
        v32 = v0;
        switch (v31) {
          case 0:
            {
            int v33 = 2;
            v32 = v33;
            break;
          }
          case 1:
            {
            v32 = v0;
            break;
          }
          default:
            {
            int v34 = 2;
            int v35 = v0 + v34;
            v32 = v35;
            break;
          }
        }
        int v36 = 1;
        int v37 = v0 + v36;
        v10 = v32;
        break;
      }
    }
    uint v38 = simt_subgroup_id(__simt_tid);
    int v39 = (int)(v38);
    v6 = v10;
  } else {
    int v40 = 0;
    bool v41 = v2 != v40;
    int v42;
    if (v41) {
      int v43 = 4;
      int v44;
      v44 = v43;
      switch (v3) {
        case 0:
          {
          v44 = v0;
        }
        default:
          {
          int v45 = 1;
          int v46 = v0 + v45;
          v44 = v46;
          break;
        }
      }
      int v47 = 3;
      v42 = v44;
    } else {
      int v48 = 3;
      int v49 = v3 % v48;
      uint v50 = simt_lane_id(__simt_tid);
      int v51 = (int)(v50);
      int v52;
      v52 = v51;
      switch (v49) {
        case 0:
          {
          v52 = v0;
          break;
        }
        case 1:
          {
          int v53 = 2;
          v52 = v53;
          break;
        }
        case 2:
          {
          int v54 = 1;
          int v55 = v0 + v54;
          v52 = v55;
          break;
        }
        default:
          {
          int v56 = 4;
          v52 = v56;
          break;
        }
      }
      int v57 = 3;
      v42 = v52;
    }
    uint v58 = simt_subgroup_id(__simt_tid);
    int v59 = (int)(v58);
    v6 = v42;
  }
  bool v60 = true;
  int v61 = simt_wave_count_bits(v60);
  int v62 = 0;
  int v63 = v62 + v0;
  v1[v63] = v61;
  return;
}

kernel void kernel_main(device int* v64 [[buffer(0)]], device int* v65 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v66 = static_cast<int>(__simt_tid3.x);
  int v67 = 0;
  int v68 = v67 + v66;
  int v69 = v65[v68];
  int v70 = 4;
  int v71 = v70 + v66;
  int v72 = v65[v71];
  helper0(v66, v64, v69, v72, static_cast<int>(__simt_tid3.x));
  int v73 = 8;
  int v74 = v73 + v66;
  int v75 = v65[v74];
  int v76 = 0;
  bool v77 = v75 != v76;
  int v78;
  if (v77) {
    int v79 = 12;
    int v80 = v79 + v66;
    int v81 = v65[v80];
    int v82;
    v82 = v66;
    switch (v81) {
      case 0:
        {
        int v83 = 1;
        int v84 = v66 + v83;
        v82 = v84;
      }
      case 1:
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
          int v91 = v90 + v66;
          int v92 = 16;
          int v93 = v92 + v91;
          int v94 = v65[v93];
          int v95 = 0;
          bool v96 = v94 != v95;
          v87 = v87;
          v88 = v88;
          if (!v96) break;
          int v97 = v87 + v88;
          int v98 = 1;
          int v99 = v88 + v98;
          v87 = v97;
          v88 = v99;
        }
        bool v100 = true;
        v82 = v87;
        break;
      }
      case 2:
        {
        int v101 = 36;
        int v102 = v101 + v66;
        int v103 = v65[v102];
        int v104 = 3;
        int v105;
        v105 = v104;
        switch (v103) {
          case 0:
            {
            int v106 = 3;
            v105 = v106;
            break;
          }
          default:
            {
            v105 = v66;
            break;
          }
        }
        bool v107 = true;
        v82 = v105;
      }
      default:
        {
        int v108 = 40;
        int v109 = v108 + v66;
        int v110 = v65[v109];
        int v111 = 2;
        int v112;
        v112 = v111;
        switch (v110) {
          case 0:
            {
            int v113 = 4;
            int v114 = v66 + v113;
            v112 = v114;
            break;
          }
          case 1:
            {
            v112 = v66;
            break;
          }
          default:
            {
            int v115 = 1;
            v112 = v115;
            break;
          }
        }
        bool v116 = true;
        v82 = v112;
        break;
      }
    }
    bool v117 = true;
    v78 = v82;
  } else {
    int v118 = 3;
    v78 = v118;
  }
  int v119 = 16;
  int v120 = v119 + v66;
  bool v121 = true;
  int v122 = simt_wave_count_bits(v121);
  v64[v120] = v122;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
