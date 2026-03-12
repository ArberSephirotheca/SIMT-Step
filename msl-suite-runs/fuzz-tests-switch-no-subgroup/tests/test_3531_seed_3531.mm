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
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 3;
      int v10 = v3 % v9;
      int v11;
      v11 = v0;
      switch (v10) {
        case 0:
          {
          int v12 = 0;
          bool v13 = v2 != v12;
          int v14;
          if (v13) {
            int v15 = 4;
            v14 = v15;
          } else {
            v14 = v0;
          }
          v11 = v14;
          break;
        }
        case 1:
          {
          int v16 = 0;
          int v17 = 0;
          int v18;
          int v19;
          v18 = v16;
          v19 = v17;
          while (true) {
            int v20 = 4;
            int v21 = v3 % v20;
            int v22 = 1;
            int v23 = v21 + v22;
            bool v24 = v19 < v23;
            v18 = v18;
            v19 = v19;
            if (!v24) break;
            int v25 = 0;
            int v26 = 1;
            int v27 = v19 + v26;
            v18 = v25;
            v19 = v27;
          }
          v11 = v18;
          break;
        }
        default:
          {
          int v28 = 3;
          v11 = v28;
          break;
        }
      }
      v8 = v11;
      break;
    }
    case 0:
      {
      int v29 = 2;
      int v30 = v3 % v29;
      int v31 = 0;
      int v32;
      v32 = v31;
      switch (v30) {
        case 0:
          {
          int v33 = 0;
          bool v34 = v2 != v33;
          int v35;
          if (v34) {
            int v36 = 2;
            v35 = v36;
          } else {
            int v37 = 3;
            v35 = v37;
          }
          v32 = v35;
          break;
        }
        default:
          {
          int v38 = 0;
          int v39 = 0;
          int v40;
          int v41;
          v40 = v38;
          v41 = v39;
          while (true) {
            int v42 = 4;
            int v43 = v3 % v42;
            int v44 = 1;
            int v45 = v43 + v44;
            bool v46 = v41 < v45;
            v40 = v40;
            v41 = v41;
            if (!v46) break;
            int v47 = 1;
            int v48 = v41 + v47;
            v40 = v0;
            v41 = v48;
          }
          v32 = v40;
          break;
        }
      }
      v8 = v32;
      break;
    }
  }
  bool v49 = true;
  int v50 = simt_wave_count_bits(v49);
  int v51 = 0;
  int v52 = v51 + v0;
  v1[v52] = v50;
  return;
}

kernel void kernel_main(device int* v53 [[buffer(0)]], device int* v54 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v55 = static_cast<int>(__simt_tid3.x);
  int v56 = 0;
  int v57 = v56 + v55;
  int v58 = v54[v57];
  int v59 = 4;
  int v60 = v59 + v55;
  int v61 = v54[v60];
  helper0(v55, v53, v58, v61, static_cast<int>(__simt_tid3.x));
  int v62 = 8;
  int v63 = v62 + v55;
  int v64 = v54[v63];
  uint v65 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v66 = (int)(v65);
  int v67;
  v67 = v66;
  switch (v64) {
    default:
      {
      int v68 = 12;
      int v69 = v68 + v55;
      int v70 = v54[v69];
      int v71;
      v71 = v55;
      switch (v70) {
        case 0:
          {
          v71 = v55;
          break;
        }
        case 1:
          {
          int v72 = 4;
          int v73 = v55 + v72;
          v71 = v73;
          break;
        }
        case 2:
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
            int v80 = v79 + v55;
            int v81 = 16;
            int v82 = v81 + v80;
            int v83 = v54[v82];
            int v84 = 0;
            bool v85 = v83 != v84;
            v76 = v76;
            v77 = v77;
            if (!v85) break;
            int v86 = v76 + v77;
            int v87 = 1;
            int v88 = v77 + v87;
            bool v89 = true;
            v76 = v86;
            v77 = v88;
          }
          v71 = v76;
          break;
        }
        default:
          {
          v71 = v55;
          break;
        }
      }
      v67 = v71;
      break;
    }
    case 0:
      {
      int v90 = 3;
      int v91 = v55 + v90;
      v67 = v91;
    }
    case 1:
      {
      int v92 = 1;
      v67 = v92;
      break;
    }
  }
  bool v93 = true;
  int v94 = 16;
  int v95 = v94 + v55;
  bool v96 = true;
  int v97 = simt_wave_count_bits(v96);
  v53[v95] = v97;
  int v98 = 36;
  int v99 = v98 + v55;
  int v100 = v54[v99];
  uint v101 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v102 = (int)(v101);
  int v103;
  v103 = v102;
  switch (v100) {
    default:
      {
      int v104 = 0;
      int v105 = 0;
      int v106;
      int v107;
      v106 = v104;
      v107 = v105;
      while (true) {
        int v108 = 4;
        int v109 = v107 * v108;
        int v110 = v109 + v55;
        int v111 = 40;
        int v112 = v111 + v110;
        int v113 = v54[v112];
        int v114 = 0;
        bool v115 = v113 != v114;
        v106 = v106;
        v107 = v107;
        if (!v115) break;
        int v116 = 60;
        int v117 = v116 + v55;
        int v118 = v54[v117];
        int v119 = 0;
        bool v120 = v118 != v119;
        int v121;
        if (v120) {
          v121 = v55;
        } else {
          int v122 = 1;
          v121 = v122;
        }
        int v123 = v106 + v121;
        int v124 = 1;
        int v125 = v107 + v124;
        bool v126 = true;
        v106 = v123;
        v107 = v125;
      }
      v103 = v106;
      break;
    }
    case 0:
      {
      int v127 = 1;
      int v128 = v55 + v127;
      v103 = v128;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
