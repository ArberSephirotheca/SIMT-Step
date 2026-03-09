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
  int v5 = 0;
  bool v6 = v2 != v5;
  int v7;
  if (v6) {
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
      int v17 = 2;
      int v18 = v3 % v17;
      int v19 = 4;
      int v20;
      v20 = v19;
      switch (v18) {
        default:
          {
          int v21 = 3;
          int v22 = v0 + v21;
          v20 = v22;
          break;
        }
        case 0:
          {
          int v23 = 3;
          int v24 = v0 + v23;
          v20 = v24;
          break;
        }
        case 1:
          {
          int v25 = 3;
          v20 = v25;
          break;
        }
      }
      uint v26 = simt_lane_id(__simt_tid);
      int v27 = (int)(v26);
      int v28 = 1;
      int v29 = v11 + v28;
      v10 = v20;
      v11 = v29;
    }
    uint v30 = simt_subgroup_id(__simt_tid);
    int v31 = (int)(v30);
    v7 = v10;
  } else {
    int v32 = 0;
    int v33 = 0;
    int v34;
    int v35;
    v34 = v32;
    v35 = v33;
    while (true) {
      int v36 = 4;
      int v37 = v3 % v36;
      int v38 = 1;
      int v39 = v37 + v38;
      bool v40 = v35 < v39;
      v34 = v34;
      v35 = v35;
      if (!v40) break;
      int v41 = 4;
      int v42 = v3 % v41;
      int v43 = 3;
      int v44;
      v44 = v43;
      switch (v42) {
        default:
          {
          int v45 = 0;
          v44 = v45;
          break;
        }
        case 0:
          {
          v44 = v0;
          break;
        }
        case 1:
          {
          int v46 = 2;
          int v47 = v0 + v46;
          v44 = v47;
          break;
        }
        case 2:
          {
          v44 = v0;
          break;
        }
      }
      int v48 = 0;
      int v49 = 1;
      int v50 = v35 + v49;
      v34 = v44;
      v35 = v50;
    }
    v7 = v34;
  }
  bool v51 = true;
  int v52 = simt_wave_count_bits(v51);
  int v53 = 0;
  int v54 = v53 + v0;
  v1[v54] = v52;
  int v55 = 0;
  bool v56 = v2 != v55;
  int v57 = v56 ? v4 : v7;
  return;
}

kernel void kernel_main(device int* v58 [[buffer(0)]], device int* v59 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v60 = static_cast<int>(__simt_tid3.x);
  int v61 = 0;
  int v62 = v61 + v60;
  int v63 = v59[v62];
  int v64 = 4;
  int v65 = v64 + v60;
  int v66 = v59[v65];
  helper0(v60, v58, v63, v66, static_cast<int>(__simt_tid3.x));
  int v67 = 8;
  int v68 = v67 + v60;
  int v69 = v59[v68];
  int v70;
  v70 = v60;
  switch (v69) {
    case 0:
      {
      int v71 = 12;
      int v72 = v71 + v60;
      int v73 = v59[v72];
      int v74 = 0;
      bool v75 = v73 != v74;
      int v76;
      if (v75) {
        v76 = v60;
      } else {
        int v77 = 16;
        int v78 = v77 + v60;
        int v79 = v59[v78];
        int v80 = 0;
        bool v81 = v79 != v80;
        int v82;
        if (v81) {
          v82 = v60;
        } else {
          v82 = v60;
        }
        v76 = v82;
      }
      v70 = v76;
      break;
    }
    case 1:
      {
      int v83 = 20;
      int v84 = v83 + v60;
      int v85 = v59[v84];
      int v86 = 3;
      int v87;
      v87 = v86;
      switch (v85) {
        case 0:
          {
          int v88 = 24;
          int v89 = v88 + v60;
          int v90 = v59[v89];
          int v91 = 0;
          bool v92 = v90 != v91;
          int v93;
          if (v92) {
            int v94 = 2;
            int v95 = v60 + v94;
            v93 = v95;
          } else {
            int v96 = 1;
            v93 = v96;
          }
          v87 = v93;
          break;
        }
        default:
          {
          v87 = v60;
        }
        case 1:
          {
          v87 = v60;
        }
        case 2:
          {
          int v97 = 28;
          int v98 = v97 + v60;
          int v99 = v59[v98];
          int v100 = 0;
          bool v101 = v99 != v100;
          int v102;
          if (v101) {
            int v103 = 4;
            int v104 = v60 + v103;
            v102 = v104;
          } else {
            v102 = v60;
          }
          v87 = v102;
          break;
        }
      }
      bool v105 = true;
      v70 = v87;
      break;
    }
    default:
      {
      int v106 = 32;
      int v107 = v106 + v60;
      int v108 = v59[v107];
      int v109 = 0;
      bool v110 = v108 != v109;
      int v111;
      if (v110) {
        v111 = v60;
      } else {
        int v112 = 36;
        int v113 = v112 + v60;
        int v114 = v59[v113];
        int v115 = 0;
        int v116 = v60 + v115;
        int v117;
        v117 = v116;
        switch (v114) {
          default:
            {
            int v118 = 4;
            int v119 = v60 + v118;
            v117 = v119;
            break;
          }
          case 0:
            {
            v117 = v60;
            break;
          }
          case 1:
            {
            v117 = v60;
            break;
          }
        }
        bool v120 = true;
        v111 = v117;
      }
      v70 = v111;
      break;
    }
    case 2:
      {
      v70 = v60;
      break;
    }
  }
  bool v121 = true;
  int v122 = 16;
  int v123 = v122 + v60;
  bool v124 = true;
  int v125 = simt_wave_count_bits(v124);
  v58[v123] = v125;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 40; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
