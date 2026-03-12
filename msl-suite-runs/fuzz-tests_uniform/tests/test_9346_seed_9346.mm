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
  int v6;
  v6 = v0;
  switch (v5) {
    default:
      {
      int v7 = 4;
      int v8;
      v8 = v7;
      switch (v3) {
        case 0:
          {
          int v9 = 3;
          int v10 = v3 % v9;
          int v11 = 0;
          int v12 = v0 + v11;
          int v13;
          v13 = v12;
          switch (v10) {
            case 0:
              {
              int v14 = 4;
              v13 = v14;
            }
            default:
              {
              int v15 = 1;
              v13 = v15;
              break;
            }
            case 1:
              {
              v13 = v0;
              break;
            }
          }
          v8 = v13;
        }
        default:
          {
          int v16 = 0;
          bool v17 = v2 != v16;
          int v18;
          if (v17) {
            v18 = v0;
          } else {
            v18 = v0;
          }
          int v19 = 3;
          v8 = v18;
          break;
        }
      }
      int v20 = 1;
      v6 = v8;
      break;
    }
    case 0:
      {
      int v21 = 3;
      int v22;
      v22 = v21;
      switch (v3) {
        default:
          {
          int v23 = 4;
          int v24 = v0 + v23;
          v22 = v24;
          break;
        }
        case 0:
          {
          int v25 = 0;
          int v26 = 0;
          int v27;
          int v28;
          v27 = v25;
          v28 = v26;
          while (true) {
            int v29 = 4;
            int v30 = v3 % v29;
            int v31 = 1;
            int v32 = v30 + v31;
            bool v33 = v28 < v32;
            v27 = v27;
            v28 = v28;
            if (!v33) break;
            int v34 = 1;
            int v35 = v28 + v34;
            v27 = v0;
            v28 = v35;
          }
          int v36 = 2;
          v22 = v27;
          break;
        }
      }
      v6 = v22;
    }
    case 1:
      {
      int v37 = 3;
      int v38;
      v38 = v37;
      switch (v3) {
        case 0:
          {
          int v39 = 0;
          bool v40 = v2 != v39;
          int v41;
          if (v40) {
            int v42 = 0;
            int v43 = v0 + v42;
            v41 = v43;
          } else {
            int v44 = 3;
            int v45 = v0 + v44;
            v41 = v45;
          }
          v38 = v41;
          break;
        }
        default:
          {
          int v46 = 0;
          bool v47 = v2 != v46;
          int v48;
          if (v47) {
            int v49 = 3;
            v48 = v49;
          } else {
            int v50 = 1;
            int v51 = v0 + v50;
            v48 = v51;
          }
          v38 = v48;
          break;
        }
      }
      v6 = v38;
      break;
    }
  }
  bool v52 = true;
  int v53 = simt_wave_count_bits(v52);
  int v54 = 0;
  int v55 = v54 + v0;
  v1[v55] = v53;
  return;
}

kernel void kernel_main(device int* v56 [[buffer(0)]], device int* v57 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v58 = static_cast<int>(__simt_tid3.x);
  int v59 = 0;
  int v60 = v59 + v58;
  int v61 = v57[v60];
  int v62 = 4;
  int v63 = v62 + v58;
  int v64 = v57[v63];
  helper0(v58, v56, v61, v64, static_cast<int>(__simt_tid3.x));
  int v65 = 4;
  int v66 = 8;
  int v67 = v66 + v58;
  int v68 = v57[v67];
  int v69 = 0;
  bool v70 = v68 != v69;
  int v71;
  if (v70) {
    int v72 = 12;
    int v73 = v72 + v58;
    int v74 = v57[v73];
    uint v75 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v76 = (int)(v75);
    int v77;
    v77 = v76;
    switch (v74) {
      default:
        {
        int v78 = 16;
        int v79 = v78 + v58;
        int v80 = v57[v79];
        int v81 = 1;
        int v82;
        v82 = v81;
        switch (v80) {
          case 0:
            {
            int v83 = 2;
            int v84 = v58 + v83;
            v82 = v84;
            break;
          }
          default:
            {
            v82 = v58;
            break;
          }
          case 1:
            {
            int v85 = 1;
            int v86 = v58 + v85;
            v82 = v86;
            break;
          }
          case 2:
            {
            v82 = v58;
            break;
          }
        }
        bool v87 = true;
        v77 = v82;
      }
      case 0:
        {
        int v88 = 20;
        int v89 = v88 + v58;
        int v90 = v57[v89];
        int v91 = 0;
        bool v92 = v90 != v91;
        int v93;
        if (v92) {
          int v94 = 1;
          int v95 = v58 + v94;
          v93 = v95;
        } else {
          int v96 = 4;
          v93 = v96;
        }
        v77 = v93;
        break;
      }
    }
    bool v97 = true;
    v71 = v77;
  } else {
    int v98 = 24;
    int v99 = v98 + v58;
    int v100 = v57[v99];
    int v101 = 1;
    int v102;
    v102 = v101;
    switch (v100) {
      default:
        {
        int v103 = 28;
        int v104 = v103 + v58;
        int v105 = v57[v104];
        int v106 = 3;
        int v107;
        v107 = v106;
        switch (v105) {
          default:
            {
            int v108 = 2;
            v107 = v108;
          }
          case 0:
            {
            v107 = v58;
            break;
          }
        }
        bool v109 = true;
        v102 = v107;
        break;
      }
      case 0:
        {
        int v110 = 32;
        int v111 = v110 + v58;
        int v112 = v57[v111];
        int v113 = 2;
        int v114 = v58 + v113;
        int v115;
        v115 = v114;
        switch (v112) {
          default:
            {
            int v116 = 1;
            v115 = v116;
            break;
          }
          case 0:
            {
            int v117 = 0;
            v115 = v117;
            break;
          }
          case 1:
            {
            int v118 = 2;
            int v119 = v58 + v118;
            v115 = v119;
            break;
          }
        }
        bool v120 = true;
        v102 = v115;
      }
      case 1:
        {
        v102 = v58;
        break;
      }
    }
    bool v121 = true;
    v71 = v102;
  }
  int v122 = 16;
  int v123 = v122 + v58;
  bool v124 = true;
  int v125 = simt_wave_count_bits(v124);
  v56[v123] = v125;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 36; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
