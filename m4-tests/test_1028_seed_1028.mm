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
    int v7 = 0;
    bool v8 = v2 != v7;
    int v9;
    if (v8) {
      int v10 = 4;
      int v11 = v3 % v10;
      int v12 = 2;
      int v13 = v0 + v12;
      int v14;
      v14 = v13;
      switch (v11) {
        case 0:
          {
          v14 = v0;
          break;
        }
        case 1:
          {
          int v15 = 2;
          int v16 = v0 + v15;
          v14 = v16;
          break;
        }
        case 2:
          {
          v14 = v0;
          break;
        }
        default:
          {
          int v17 = 2;
          int v18 = v0 + v17;
          v14 = v18;
          break;
        }
      }
      v9 = v14;
    } else {
      int v19 = 2;
      int v20 = v3 % v19;
      uint v21 = simt_lane_id(__simt_tid);
      int v22 = (int)(v21);
      int v23;
      v23 = v22;
      switch (v20) {
        default:
          {
          int v24 = 3;
          v23 = v24;
          break;
        }
        case 0:
          {
          v23 = v0;
          break;
        }
        case 1:
          {
          int v25 = 0;
          v23 = v25;
          break;
        }
      }
      v9 = v23;
    }
    v6 = v9;
  } else {
    bool v26 = true;
    int v27 = simt_wave_count_bits(v26);
    int v28 = 0;
    int v29 = v28 + v0;
    v1[v29] = v27;
    v6 = v27;
  }
  return;
}

kernel void kernel_main(device int* v30 [[buffer(0)]], device int* v31 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v32 = static_cast<int>(__simt_tid3.x);
  int v33 = 0;
  int v34 = v33 + v32;
  int v35 = v31[v34];
  int v36 = 4;
  int v37 = v36 + v32;
  int v38 = v31[v37];
  helper0(v32, v30, v35, v38, static_cast<int>(__simt_tid3.x));
  uint v39 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v40 = (int)(v39);
  uint v41 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v42 = (int)(v41);
  int v43 = 8;
  int v44 = v43 + v32;
  int v45 = v31[v44];
  uint v46 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v47 = (int)(v46);
  int v48;
  v48 = v47;
  switch (v45) {
    default:
      {
      int v49 = 12;
      int v50 = v49 + v32;
      int v51 = v31[v50];
      int v52 = 0;
      bool v53 = v51 != v52;
      int v54;
      if (v53) {
        int v55 = 16;
        int v56 = v55 + v32;
        int v57 = v31[v56];
        int v58 = 2;
        int v59;
        v59 = v58;
        switch (v57) {
          case 0:
            {
            v59 = v32;
            break;
          }
          default:
            {
            int v60 = 3;
            v59 = v60;
            break;
          }
          case 1:
            {
            v59 = v32;
            break;
          }
          case 2:
            {
            int v61 = 0;
            int v62 = v32 + v61;
            v59 = v62;
            break;
          }
        }
        v54 = v59;
      } else {
        int v63 = 20;
        int v64 = v63 + v32;
        int v65 = v31[v64];
        int v66 = 0;
        int v67 = v32 + v66;
        int v68;
        v68 = v67;
        switch (v65) {
          default:
            {
            int v69 = 0;
            int v70 = v32 + v69;
            v68 = v70;
            break;
          }
          case 0:
            {
            int v71 = 1;
            v68 = v71;
            break;
          }
          case 1:
            {
            int v72 = 4;
            v68 = v72;
            break;
          }
        }
        bool v73 = true;
        v54 = v68;
      }
      v48 = v54;
      break;
    }
    case 0:
      {
      int v74 = 0;
      int v75 = 0;
      int v76;
      int v77;
      v76 = v74;
      v77 = v75;
      while (true) {
        int v78 = 4;
        int v79 = v77 * v78;
        int v80 = v79 + v32;
        int v81 = 24;
        int v82 = v81 + v80;
        int v83 = v31[v82];
        int v84 = 0;
        bool v85 = v83 != v84;
        v76 = v76;
        v77 = v77;
        if (!v85) break;
        int v86 = 44;
        int v87 = v86 + v32;
        int v88 = v31[v87];
        int v89 = 0;
        bool v90 = v88 != v89;
        int v91;
        if (v90) {
          int v92 = 0;
          int v93 = v32 + v92;
          v91 = v93;
        } else {
          int v94 = 2;
          int v95 = v32 + v94;
          v91 = v95;
        }
        int v96 = v76 + v91;
        int v97 = 1;
        int v98 = v77 + v97;
        bool v99 = true;
        v76 = v96;
        v77 = v98;
      }
      v48 = v76;
      break;
    }
    case 1:
      {
      int v100 = 48;
      int v101 = v100 + v32;
      int v102 = v31[v101];
      int v103 = 0;
      bool v104 = v102 != v103;
      int v105;
      if (v104) {
        int v106 = 2;
        v105 = v106;
      } else {
        int v107 = 0;
        int v108 = 0;
        int v109;
        int v110;
        v109 = v107;
        v110 = v108;
        while (true) {
          int v111 = 4;
          int v112 = v110 * v111;
          int v113 = v112 + v32;
          int v114 = 52;
          int v115 = v114 + v113;
          int v116 = v31[v115];
          int v117 = 0;
          bool v118 = v116 != v117;
          v109 = v109;
          v110 = v110;
          if (!v118) break;
          int v119 = v109 + v110;
          int v120 = 1;
          int v121 = v110 + v120;
          bool v122 = true;
          v109 = v119;
          v110 = v121;
        }
        v105 = v109;
      }
      v48 = v105;
      break;
    }
    case 2:
      {
      int v123 = 1;
      int v124 = v32 + v123;
      v48 = v124;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 72; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
