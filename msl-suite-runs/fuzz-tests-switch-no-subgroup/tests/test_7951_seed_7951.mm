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
  int v6 = 0;
  int v7;
  v7 = v6;
  switch (v5) {
    case 0:
      {
      int v8 = 2;
      int v9 = v3 % v8;
      int v10;
      v10 = v0;
      switch (v9) {
        case 0:
          {
          int v11 = 0;
          bool v12 = v2 != v11;
          int v13;
          if (v12) {
            int v14 = 3;
            v13 = v14;
          } else {
            int v15 = 1;
            v13 = v15;
          }
          v10 = v13;
        }
        default:
          {
          v10 = v0;
          break;
        }
      }
      int v16 = 1;
      v7 = v10;
      break;
    }
    case 1:
      {
      int v17 = 4;
      v7 = v17;
      break;
    }
    default:
      {
      int v18 = 2;
      int v19 = v3 % v18;
      int v20 = 4;
      int v21;
      v21 = v20;
      switch (v19) {
        case 0:
          {
          int v22 = 0;
          bool v23 = v2 != v22;
          int v24;
          if (v23) {
            int v25 = 1;
            int v26 = v0 + v25;
            v24 = v26;
          } else {
            int v27 = 1;
            v24 = v27;
          }
          v21 = v24;
          break;
        }
        default:
          {
          int v28 = 4;
          int v29 = v3 % v28;
          int v30 = 3;
          int v31 = v0 + v30;
          int v32;
          v32 = v31;
          switch (v29) {
            case 0:
              {
              int v33 = 4;
              int v34 = v0 + v33;
              v32 = v34;
            }
            case 1:
              {
              v32 = v0;
            }
            default:
              {
              int v35 = 1;
              int v36 = v0 + v35;
              v32 = v36;
            }
            case 2:
              {
              int v37 = 0;
              int v38 = v0 + v37;
              v32 = v38;
              break;
            }
          }
          v21 = v32;
          break;
        }
      }
      v7 = v21;
      break;
    }
    case 2:
      {
      int v39 = 4;
      int v40 = v3 % v39;
      int v41;
      v41 = v0;
      switch (v40) {
        default:
          {
          int v42 = 0;
          v41 = v42;
          break;
        }
        case 0:
          {
          int v43 = 3;
          int v44 = v3 % v43;
          int v45 = 3;
          int v46;
          v46 = v45;
          switch (v44) {
            case 0:
              {
              v46 = v0;
              break;
            }
            default:
              {
              v46 = v0;
              break;
            }
            case 1:
              {
              v46 = v0;
              break;
            }
          }
          int v47 = 0;
          v41 = v46;
          break;
        }
        case 1:
          {
          int v48 = 0;
          int v49 = 0;
          int v50;
          int v51;
          v50 = v48;
          v51 = v49;
          while (true) {
            int v52 = 4;
            int v53 = v3 % v52;
            int v54 = 1;
            int v55 = v53 + v54;
            bool v56 = v51 < v55;
            v50 = v50;
            v51 = v51;
            if (!v56) break;
            int v57 = 3;
            int v58 = 1;
            int v59 = v51 + v58;
            v50 = v57;
            v51 = v59;
          }
          v41 = v50;
          break;
        }
        case 2:
          {
          int v60 = 0;
          int v61 = 0;
          int v62;
          int v63;
          v62 = v60;
          v63 = v61;
          while (true) {
            int v64 = 4;
            int v65 = v3 % v64;
            int v66 = 1;
            int v67 = v65 + v66;
            bool v68 = v63 < v67;
            v62 = v62;
            v63 = v63;
            if (!v68) break;
            int v69 = 2;
            int v70 = 1;
            int v71 = v63 + v70;
            v62 = v69;
            v63 = v71;
          }
          v41 = v62;
          break;
        }
      }
      v7 = v41;
      break;
    }
  }
  bool v72 = true;
  int v73 = simt_wave_count_bits(v72);
  int v74 = 0;
  int v75 = v74 + v0;
  v1[v75] = v73;
  return;
}

kernel void kernel_main(device int* v76 [[buffer(0)]], device int* v77 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v78 = static_cast<int>(__simt_tid3.x);
  int v79 = 0;
  int v80 = v79 + v78;
  int v81 = v77[v80];
  int v82 = 4;
  int v83 = v82 + v78;
  int v84 = v77[v83];
  helper0(v78, v76, v81, v84, static_cast<int>(__simt_tid3.x));
  int v85 = 8;
  int v86 = v85 + v78;
  int v87 = v77[v86];
  int v88 = 0;
  bool v89 = v87 != v88;
  int v90;
  if (v89) {
    int v91 = 12;
    int v92 = v91 + v78;
    int v93 = v77[v92];
    int v94 = 1;
    int v95;
    v95 = v94;
    switch (v93) {
      case 0:
        {
        int v96 = 16;
        int v97 = v96 + v78;
        int v98 = v77[v97];
        int v99 = 1;
        int v100 = v78 + v99;
        int v101;
        v101 = v100;
        switch (v98) {
          default:
            {
            int v102 = 4;
            int v103 = v78 + v102;
            v101 = v103;
            break;
          }
          case 0:
            {
            int v104 = 3;
            v101 = v104;
            break;
          }
          case 1:
            {
            v101 = v78;
            break;
          }
        }
        v95 = v101;
        break;
      }
      default:
        {
        int v105 = 20;
        int v106 = v105 + v78;
        int v107 = v77[v106];
        int v108 = 0;
        bool v109 = v107 != v108;
        int v110;
        if (v109) {
          int v111 = 4;
          int v112 = v78 + v111;
          v110 = v112;
        } else {
          int v113 = 2;
          v110 = v113;
        }
        v95 = v110;
        break;
      }
      case 1:
        {
        int v114 = 1;
        v95 = v114;
        break;
      }
      case 2:
        {
        int v115 = 0;
        v95 = v115;
        break;
      }
    }
    bool v116 = true;
    int v117 = 16;
    int v118 = v117 + v78;
    bool v119 = true;
    int v120 = simt_wave_count_bits(v119);
    v76[v118] = v120;
    v90 = v95;
  } else {
    uint v121 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v122 = (int)(v121);
    v90 = v122;
  }
  int v123 = 32;
  int v124 = v123 + v78;
  bool v125 = true;
  int v126 = simt_wave_count_bits(v125);
  v76[v124] = v126;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 24; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
