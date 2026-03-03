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
  int v6 = 4;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 4;
      int v10 = v0 + v9;
      v8 = v10;
      break;
    }
    case 1:
      {
      int v11 = 0;
      int v12 = 0;
      int v13;
      int v14;
      v13 = v11;
      v14 = v12;
      while (true) {
        int v15 = 4;
        int v16 = v3 % v15;
        int v17 = 1;
        int v18 = v16 + v17;
        bool v19 = v14 < v18;
        v13 = v13;
        v14 = v14;
        if (!v19) break;
        int v20;
        v20 = v0;
        switch (v3) {
          default:
            {
            int v21 = 1;
            int v22 = v0 + v21;
            v20 = v22;
            break;
          }
          case 0:
            {
            int v23 = 0;
            v20 = v23;
            break;
          }
        }
        int v24 = 1;
        int v25 = v14 + v24;
        v13 = v20;
        v14 = v25;
      }
      v8 = v13;
      break;
    }
    default:
      {
      int v26 = 4;
      int v27 = v3 % v26;
      int v28;
      v28 = v0;
      switch (v27) {
        case 0:
          {
          int v29 = 3;
          int v30 = v3 % v29;
          int v31;
          v31 = v0;
          switch (v30) {
            case 0:
              {
              int v32 = 1;
              int v33 = v0 + v32;
              v31 = v33;
              break;
            }
            default:
              {
              int v34 = 0;
              int v35 = v0 + v34;
              v31 = v35;
              break;
            }
            case 1:
              {
              int v36 = 3;
              v31 = v36;
            }
            case 2:
              {
              int v37 = 1;
              int v38 = v0 + v37;
              v31 = v38;
              break;
            }
          }
          v28 = v31;
          break;
        }
        case 1:
          {
          int v39 = 0;
          bool v40 = v2 != v39;
          int v41;
          if (v40) {
            int v42 = 4;
            int v43 = v0 + v42;
            v41 = v43;
          } else {
            int v44 = 2;
            int v45 = v0 + v44;
            v41 = v45;
          }
          v28 = v41;
        }
        default:
          {
          int v46 = 0;
          int v47 = 0;
          int v48;
          int v49;
          v48 = v46;
          v49 = v47;
          while (true) {
            int v50 = 4;
            int v51 = v3 % v50;
            int v52 = 1;
            int v53 = v51 + v52;
            bool v54 = v49 < v53;
            v48 = v48;
            v49 = v49;
            if (!v54) break;
            int v55 = 2;
            int v56 = 1;
            int v57 = v49 + v56;
            v48 = v55;
            v49 = v57;
          }
          v28 = v48;
          break;
        }
        case 2:
          {
          int v58 = 2;
          int v59 = v3 % v58;
          int v60 = 4;
          int v61;
          v61 = v60;
          switch (v59) {
            case 0:
              {
              int v62 = 0;
              int v63 = v0 + v62;
              v61 = v63;
            }
            default:
              {
              v61 = v0;
            }
            case 1:
              {
              int v64 = 2;
              v61 = v64;
              break;
            }
          }
          v28 = v61;
          break;
        }
      }
      v8 = v28;
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
  int v78 = 8;
  int v79 = v78 + v71;
  int v80 = v70[v79];
  int v81 = 1;
  int v82;
  v82 = v81;
  switch (v80) {
    case 0:
      {
      int v83 = 3;
      v82 = v83;
      break;
    }
    default:
      {
      int v84 = 12;
      int v85 = v84 + v71;
      int v86 = v70[v85];
      int v87;
      v87 = v71;
      switch (v86) {
        case 0:
          {
          int v88 = 16;
          int v89 = v88 + v71;
          int v90 = v70[v89];
          int v91 = 0;
          int v92 = v71 + v91;
          int v93;
          v93 = v92;
          switch (v90) {
            case 0:
              {
              int v94 = 4;
              int v95 = v71 + v94;
              v93 = v95;
              break;
            }
            case 1:
              {
              v93 = v71;
              break;
            }
            default:
              {
              v93 = v71;
              break;
            }
          }
          bool v96 = true;
          v87 = v93;
        }
        case 1:
          {
          int v97 = 20;
          int v98 = v97 + v71;
          int v99 = v70[v98];
          int v100 = 2;
          int v101;
          v101 = v100;
          switch (v99) {
            case 0:
              {
              int v102 = 0;
              int v103 = v71 + v102;
              v101 = v103;
              break;
            }
            case 1:
              {
              int v104 = 0;
              int v105 = v71 + v104;
              v101 = v105;
            }
            default:
              {
              v101 = v71;
              break;
            }
          }
          v87 = v101;
          break;
        }
        case 2:
          {
          int v106 = 24;
          int v107 = v106 + v71;
          int v108 = v70[v107];
          int v109 = 4;
          int v110;
          v110 = v109;
          switch (v108) {
            case 0:
              {
              int v111 = 2;
              v110 = v111;
              break;
            }
            case 1:
              {
              int v112 = 0;
              int v113 = v71 + v112;
              v110 = v113;
              break;
            }
            default:
              {
              int v114 = 2;
              int v115 = v71 + v114;
              v110 = v115;
              break;
            }
          }
          bool v116 = true;
          v87 = v110;
          break;
        }
        default:
          {
          int v117 = 0;
          int v118 = v71 + v117;
          v87 = v118;
          break;
        }
      }
      v82 = v87;
    }
    case 1:
      {
      v82 = v71;
      break;
    }
  }
  bool v119 = true;
  int v120 = 16;
  int v121 = v120 + v71;
  bool v122 = true;
  int v123 = simt_wave_count_bits(v122);
  v69[v121] = v123;
  int v124 = 1;
  int v125 = v71 + v124;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 28; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
