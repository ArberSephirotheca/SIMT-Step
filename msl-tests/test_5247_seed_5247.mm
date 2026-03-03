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
  int v5;
  v5 = v4;
  switch (v3) {
    case 0:
      {
      int v6 = 0;
      int v7 = 0;
      int v8;
      int v9;
      v8 = v6;
      v9 = v7;
      while (true) {
        int v10 = 4;
        int v11 = v3 % v10;
        int v12 = 1;
        int v13 = v11 + v12;
        bool v14 = v9 < v13;
        v8 = v8;
        v9 = v9;
        if (!v14) break;
        int v15 = 2;
        int v16 = v3 % v15;
        int v17 = 0;
        int v18 = v0 + v17;
        int v19;
        v19 = v18;
        switch (v16) {
          case 0:
            {
            int v20 = 1;
            int v21 = v0 + v20;
            v19 = v21;
            break;
          }
          default:
            {
            v19 = v0;
            break;
          }
        }
        int v22 = 1;
        int v23 = v9 + v22;
        v8 = v19;
        v9 = v23;
      }
      int v24 = 3;
      v5 = v8;
      break;
    }
    default:
      {
      int v25 = 0;
      bool v26 = v2 != v25;
      int v27;
      if (v26) {
        int v28 = 0;
        int v29 = 0;
        int v30;
        int v31;
        v30 = v28;
        v31 = v29;
        while (true) {
          int v32 = 4;
          int v33 = v3 % v32;
          int v34 = 1;
          int v35 = v33 + v34;
          bool v36 = v31 < v35;
          v30 = v30;
          v31 = v31;
          if (!v36) break;
          int v37 = 3;
          int v38 = v0 + v37;
          int v39 = 1;
          int v40 = v31 + v39;
          v30 = v38;
          v31 = v40;
          break;
          ;
        }
        int v41 = 4;
        int v42 = v0 + v41;
        v27 = v30;
      } else {
        int v43 = 0;
        bool v44 = v2 != v43;
        int v45;
        if (v44) {
          v45 = v0;
        } else {
          int v46 = 1;
          v45 = v46;
        }
        v27 = v45;
      }
      int v47 = 1;
      int v48 = v0 + v47;
      v5 = v27;
      break;
    }
  }
  bool v49 = true;
  int v50 = simt_wave_count_bits(v49);
  int v51 = 0;
  int v52 = v51 + v0;
  v1[v52] = v50;
  int v53 = 0;
  bool v54 = v2 != v53;
  int v55 = v54 ? v0 : v5;
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
  uint v65 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v66 = (int)(v65);
  int v67 = 8;
  int v68 = v67 + v58;
  int v69 = v57[v68];
  uint v70 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v71 = (int)(v70);
  int v72;
  v72 = v71;
  switch (v69) {
    case 0:
      {
      int v73 = 3;
      int v74 = v58 + v73;
      v72 = v74;
    }
    case 1:
      {
      int v75 = 2;
      int v76 = v58 + v75;
      v72 = v76;
    }
    default:
      {
      int v77 = 12;
      int v78 = v77 + v58;
      int v79 = v57[v78];
      int v80 = 4;
      int v81;
      v81 = v80;
      switch (v79) {
        case 0:
          {
          int v82 = 0;
          int v83 = 0;
          int v84;
          int v85;
          v84 = v82;
          v85 = v83;
          while (true) {
            int v86 = 4;
            int v87 = v85 * v86;
            int v88 = v87 + v58;
            int v89 = 16;
            int v90 = v89 + v88;
            int v91 = v57[v90];
            int v92 = 0;
            bool v93 = v91 != v92;
            v84 = v84;
            v85 = v85;
            if (!v93) break;
            int v94 = v84 + v85;
            int v95 = 1;
            int v96 = v85 + v95;
            v84 = v94;
            v85 = v96;
            continue;
            ;
          }
          bool v97 = true;
          v81 = v84;
          break;
        }
        default:
          {
          int v98 = 36;
          int v99 = v98 + v58;
          int v100 = v57[v99];
          int v101;
          v101 = v58;
          switch (v100) {
            case 0:
              {
              int v102 = 0;
              v101 = v102;
              break;
            }
            case 1:
              {
              int v103 = 0;
              v101 = v103;
              break;
            }
            default:
              {
              int v104 = 3;
              v101 = v104;
              break;
            }
            case 2:
              {
              v101 = v58;
              break;
            }
          }
          bool v105 = true;
          v81 = v101;
          break;
        }
        case 1:
          {
          int v106 = 40;
          int v107 = v106 + v58;
          int v108 = v57[v107];
          int v109 = 1;
          int v110 = v58 + v109;
          int v111;
          v111 = v110;
          switch (v108) {
            case 0:
              {
              v111 = v58;
              break;
            }
            case 1:
              {
              int v112 = 1;
              int v113 = v58 + v112;
              v111 = v113;
            }
            default:
              {
              int v114 = 2;
              int v115 = v58 + v114;
              v111 = v115;
              break;
            }
          }
          bool v116 = true;
          v81 = v111;
          break;
        }
      }
      bool v117 = true;
      v72 = v81;
      break;
    }
  }
  bool v118 = true;
  int v119 = 16;
  int v120 = v119 + v58;
  bool v121 = true;
  int v122 = simt_wave_count_bits(v121);
  v56[v120] = v122;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
