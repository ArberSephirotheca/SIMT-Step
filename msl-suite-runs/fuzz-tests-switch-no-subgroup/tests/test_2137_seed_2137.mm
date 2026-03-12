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
  int v6 = 2;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 3;
      int v10 = v3 % v9;
      int v11 = 4;
      int v12 = v0 + v11;
      int v13;
      v13 = v12;
      switch (v10) {
        case 0:
          {
          int v14 = 0;
          int v15 = 0;
          int v16;
          int v17;
          v16 = v14;
          v17 = v15;
          while (true) {
            int v18 = 4;
            int v19 = v3 % v18;
            int v20 = 1;
            int v21 = v19 + v20;
            bool v22 = v17 < v21;
            v16 = v16;
            v17 = v17;
            if (!v22) break;
            int v23 = 2;
            int v24 = 1;
            int v25 = v17 + v24;
            v16 = v23;
            v17 = v25;
          }
          v13 = v16;
        }
        case 1:
          {
          int v26 = 3;
          int v27 = v3 % v26;
          int v28;
          v28 = v0;
          switch (v27) {
            case 0:
              {
              v28 = v0;
              break;
            }
            default:
              {
              int v29 = 1;
              int v30 = v0 + v29;
              v28 = v30;
              break;
            }
            case 1:
              {
              int v31 = 4;
              int v32 = v0 + v31;
              v28 = v32;
              break;
            }
          }
          v13 = v28;
        }
        default:
          {
          int v33 = 0;
          int v34 = 0;
          int v35;
          int v36;
          v35 = v33;
          v36 = v34;
          while (true) {
            int v37 = 4;
            int v38 = v3 % v37;
            int v39 = 1;
            int v40 = v38 + v39;
            bool v41 = v36 < v40;
            v35 = v35;
            v36 = v36;
            if (!v41) break;
            int v42 = 1;
            int v43 = 1;
            int v44 = v36 + v43;
            v35 = v42;
            v36 = v44;
          }
          v13 = v35;
          break;
        }
        case 2:
          {
          int v45 = 3;
          int v46 = v0 + v45;
          v13 = v46;
          break;
        }
      }
      v8 = v13;
    }
    case 1:
      {
      int v47 = 0;
      int v48 = 0;
      int v49;
      int v50;
      v49 = v47;
      v50 = v48;
      while (true) {
        int v51 = 4;
        int v52 = v3 % v51;
        int v53 = 1;
        int v54 = v52 + v53;
        bool v55 = v50 < v54;
        v49 = v49;
        v50 = v50;
        if (!v55) break;
        int v56 = 0;
        bool v57 = v2 != v56;
        int v58;
        if (v57) {
          int v59 = 3;
          int v60 = v0 + v59;
          v58 = v60;
        } else {
          int v61 = 1;
          int v62 = v0 + v61;
          v58 = v62;
        }
        int v63 = 1;
        int v64 = v50 + v63;
        v49 = v58;
        v50 = v64;
      }
      v8 = v49;
      break;
    }
    default:
      {
      int v65 = 0;
      v8 = v65;
      break;
    }
  }
  bool v66 = true;
  int v67 = simt_wave_count_bits(v66);
  int v68 = 0;
  int v69 = v68 + v0;
  v1[v69] = v67;
  return;
}

kernel void kernel_main(device int* v70 [[buffer(0)]], device int* v71 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v72 = static_cast<int>(__simt_tid3.x);
  int v73 = 0;
  int v74 = v73 + v72;
  int v75 = v71[v74];
  int v76 = 4;
  int v77 = v76 + v72;
  int v78 = v71[v77];
  int v79 = 0;
  bool v80 = v75 != v79;
  if (v80) {
    int v81 = 8;
    int v82 = v81 + v72;
    int v83 = v71[v82];
    int v84 = 0;
    bool v85 = v83 != v84;
    if (v85) {
    } else {
      helper0(v72, v70, v75, v78, static_cast<int>(__simt_tid3.x));
    }
  } else {
  }
  int v86 = 12;
  int v87 = v86 + v72;
  int v88 = v71[v87];
  uint v89 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v90 = (int)(v89);
  int v91;
  v91 = v90;
  switch (v88) {
    case 0:
      {
      int v92 = 16;
      int v93 = v92 + v72;
      int v94 = v71[v93];
      int v95 = 0;
      bool v96 = v94 != v95;
      int v97;
      if (v96) {
        int v98 = 20;
        int v99 = v98 + v72;
        int v100 = v71[v99];
        int v101 = 0;
        bool v102 = v100 != v101;
        int v103;
        if (v102) {
          int v104 = 3;
          v103 = v104;
        } else {
          v103 = v72;
        }
        v97 = v103;
      } else {
        int v105 = 0;
        int v106 = 0;
        int v107;
        int v108;
        v107 = v105;
        v108 = v106;
        while (true) {
          int v109 = 4;
          int v110 = v108 * v109;
          int v111 = v110 + v72;
          int v112 = 24;
          int v113 = v112 + v111;
          int v114 = v71[v113];
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
        v97 = v107;
      }
      v91 = v97;
    }
    default:
      {
      int v121 = 2;
      int v122 = v72 + v121;
      v91 = v122;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 2; ++idx) {
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
