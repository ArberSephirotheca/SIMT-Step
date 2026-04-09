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
  int v5 = 0;
  int v6;
  int v7;
  v6 = v4;
  v7 = v5;
  while (true) {
    int v8 = 4;
    int v9 = v3 % v8;
    int v10 = 1;
    int v11 = v9 + v10;
    bool v12 = v7 < v11;
    v6 = v6;
    v7 = v7;
    if (!v12) break;
    int v13 = 0;
    bool v14 = v2 != v13;
    int v15;
    if (v14) {
      int v16 = 0;
      bool v17 = v2 != v16;
      int v18;
      if (v17) {
        int v19 = 2;
        int v20 = v0 + v19;
        v18 = v20;
      } else {
        int v21 = 2;
        int v22 = v0 + v21;
        v18 = v22;
      }
      int v23 = 1;
      int v24 = v0 + v23;
      v15 = v18;
    } else {
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
        int v34 = 4;
        int v35 = v0 + v34;
        int v36 = 1;
        int v37 = v28 + v36;
        v27 = v35;
        v28 = v37;
        continue;
        ;
      }
      uint v38 = simt_subgroup_id(__simt_tid);
      int v39 = (int)(v38);
      v15 = v27;
    }
    uint v40 = simt_subgroup_id(__simt_tid);
    int v41 = (int)(v40);
    int v42 = 1;
    int v43 = v7 + v42;
    v6 = v15;
    v7 = v43;
  }
  bool v44 = true;
  int v45 = simt_wave_count_bits(v44);
  int v46 = 0;
  int v47 = v46 + v0;
  v1[v47] = v45;
  return;
}

kernel void kernel_main(device int* v48 [[buffer(0)]], device int* v49 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v50 = static_cast<int>(__simt_tid3.x);
  int v51 = 0;
  int v52 = v51 + v50;
  int v53 = v49[v52];
  int v54 = 4;
  int v55 = v54 + v50;
  int v56 = v49[v55];
  helper0(v50, v48, v53, v56, static_cast<int>(__simt_tid3.x));
  int v57 = 8;
  int v58 = v57 + v50;
  int v59 = v49[v58];
  int v60 = 0;
  bool v61 = v59 != v60;
  int v62;
  if (v61) {
    int v63 = 12;
    int v64 = v63 + v50;
    int v65 = v49[v64];
    int v66 = 0;
    bool v67 = v65 != v66;
    int v68;
    if (v67) {
      int v69 = 16;
      int v70 = v69 + v50;
      int v71 = v49[v70];
      int v72 = 4;
      int v73;
      v73 = v72;
      switch (v71) {
        default:
          {
          v73 = v50;
          break;
        }
        case 0:
          {
          int v74 = 1;
          v73 = v74;
          break;
        }
      }
      bool v75 = true;
      v68 = v73;
    } else {
      int v76 = 20;
      int v77 = v76 + v50;
      int v78 = v49[v77];
      int v79 = 0;
      bool v80 = v78 != v79;
      int v81;
      if (v80) {
        uint v82 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v83 = (int)(v82);
        v81 = v83;
      } else {
        v81 = v50;
      }
      v68 = v81;
    }
    v62 = v68;
  } else {
    int v84 = 24;
    int v85 = v84 + v50;
    int v86 = v49[v85];
    int v87 = 3;
    int v88 = v50 + v87;
    int v89;
    v89 = v88;
    switch (v86) {
      case 0:
        {
        int v90 = 0;
        int v91 = 0;
        int v92;
        int v93;
        v92 = v90;
        v93 = v91;
        while (true) {
          int v94 = 4;
          int v95 = v93 * v94;
          int v96 = v95 + v50;
          int v97 = 28;
          int v98 = v97 + v96;
          int v99 = v49[v98];
          int v100 = 0;
          bool v101 = v99 != v100;
          v92 = v92;
          v93 = v93;
          if (!v101) break;
          int v102 = v92 + v93;
          int v103 = 1;
          int v104 = v93 + v103;
          v92 = v102;
          v93 = v104;
          continue;
          ;
        }
        bool v105 = true;
        v89 = v92;
        break;
      }
      default:
        {
        int v106 = 48;
        int v107 = v106 + v50;
        int v108 = v49[v107];
        int v109 = 2;
        int v110;
        v110 = v109;
        switch (v108) {
          case 0:
            {
            int v111 = 0;
            int v112 = v50 + v111;
            v110 = v112;
            break;
          }
          default:
            {
            int v113 = 0;
            int v114 = v50 + v113;
            v110 = v114;
            break;
          }
          case 1:
            {
            v110 = v50;
          }
          case 2:
            {
            v110 = v50;
            break;
          }
        }
        bool v115 = true;
        v89 = v110;
        break;
      }
      case 1:
        {
        int v116 = 52;
        int v117 = v116 + v50;
        int v118 = v49[v117];
        int v119 = 0;
        bool v120 = v118 != v119;
        int v121;
        if (v120) {
          int v122 = 3;
          v121 = v122;
        } else {
          int v123 = 3;
          v121 = v123;
        }
        v89 = v121;
        break;
      }
      case 2:
        {
        int v124 = 4;
        v89 = v124;
        break;
      }
    }
    bool v125 = true;
    v62 = v89;
  }
  int v126 = 16;
  int v127 = v126 + v50;
  bool v128 = true;
  int v129 = simt_wave_count_bits(v128);
  v48[v127] = v129;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 56; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
