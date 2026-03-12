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
  int v4 = 4;
  int v5;
  v5 = v4;
  switch (v3) {
    case 0:
      {
      v5 = v0;
      break;
    }
    default:
      {
      int v6 = 2;
      int v7 = v3 % v6;
      int v8;
      v8 = v0;
      switch (v7) {
        case 0:
          {
          int v9 = 0;
          int v10 = 0;
          int v11;
          int v12;
          v11 = v9;
          v12 = v10;
          while (true) {
            int v13 = 4;
            int v14 = v3 % v13;
            int v15 = 1;
            int v16 = v14 + v15;
            bool v17 = v12 < v16;
            v11 = v11;
            v12 = v12;
            if (!v17) break;
            int v18 = 4;
            int v19 = v0 + v18;
            int v20 = 1;
            int v21 = v12 + v20;
            v11 = v19;
            v12 = v21;
            continue;
            ;
          }
          v8 = v11;
        }
        default:
          {
          int v22 = 0;
          bool v23 = v2 != v22;
          int v24;
          if (v23) {
            v24 = v0;
          } else {
            v24 = v0;
          }
          v8 = v24;
          break;
        }
      }
      v5 = v8;
      break;
    }
  }
  bool v25 = true;
  int v26 = simt_wave_count_bits(v25);
  int v27 = 0;
  int v28 = v27 + v0;
  v1[v28] = v26;
  return;
}

kernel void kernel_main(device int* v29 [[buffer(0)]], device int* v30 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v31 = static_cast<int>(__simt_tid3.x);
  int v32 = 0;
  int v33 = v32 + v31;
  int v34 = v30[v33];
  int v35 = 4;
  int v36 = v35 + v31;
  int v37 = v30[v36];
  int v38 = 0;
  bool v39 = v34 != v38;
  if (v39) {
    int v40 = 0;
    int v41 = 0;
    int v42;
    int v43;
    v42 = v40;
    v43 = v41;
    while (true) {
      int v44 = 2;
      bool v45 = v43 < v44;
      v42 = v42;
      v43 = v43;
      if (!v45) break;
      helper0(v31, v29, v34, v37, static_cast<int>(__simt_tid3.x));
      int v46 = 1;
      int v47 = v43 + v46;
      v42 = v42;
      v43 = v47;
    }
  } else {
  }
  int v48 = 8;
  int v49 = v48 + v31;
  int v50 = v30[v49];
  int v51 = 0;
  bool v52 = v50 != v51;
  int v53;
  if (v52) {
    int v54 = 12;
    int v55 = v54 + v31;
    int v56 = v30[v55];
    int v57 = 0;
    bool v58 = v56 != v57;
    int v59;
    if (v58) {
      int v60 = 16;
      int v61 = v60 + v31;
      int v62 = v30[v61];
      int v63 = 0;
      bool v64 = v62 != v63;
      int v65;
      if (v64) {
        int v66 = 4;
        int v67 = v31 + v66;
        v65 = v67;
      } else {
        uint v68 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v69 = (int)(v68);
        v65 = v69;
      }
      int v70 = 16;
      int v71 = v70 + v31;
      bool v72 = true;
      int v73 = simt_wave_count_bits(v72);
      v29[v71] = v73;
      v59 = v65;
    } else {
      int v74 = 20;
      int v75 = v74 + v31;
      int v76 = v30[v75];
      int v77;
      v77 = v31;
      switch (v76) {
        case 0:
          {
          int v78 = 2;
          v77 = v78;
          break;
        }
        default:
          {
          v77 = v31;
          break;
        }
        case 1:
          {
          v77 = v31;
          break;
        }
        case 2:
          {
          int v79 = 2;
          int v80 = v31 + v79;
          v77 = v80;
          break;
        }
      }
      v59 = v77;
    }
    int v81 = 32;
    int v82 = v81 + v31;
    bool v83 = true;
    int v84 = simt_wave_count_bits(v83);
    v29[v82] = v84;
    v53 = v59;
  } else {
    int v85 = 24;
    int v86 = v85 + v31;
    int v87 = v30[v86];
    int v88 = 2;
    int v89;
    v89 = v88;
    switch (v87) {
      case 0:
        {
        int v90 = 28;
        int v91 = v90 + v31;
        int v92 = v30[v91];
        int v93 = 0;
        int v94;
        v94 = v93;
        switch (v92) {
          case 0:
            {
            int v95 = 3;
            v94 = v95;
            break;
          }
          default:
            {
            int v96 = 2;
            int v97 = v31 + v96;
            v94 = v97;
          }
          case 1:
            {
            int v98 = 2;
            int v99 = v31 + v98;
            v94 = v99;
            break;
          }
        }
        v89 = v94;
        break;
      }
      case 1:
        {
        int v100 = 4;
        int v101 = v31 + v100;
        v89 = v101;
        break;
      }
      case 2:
        {
        int v102 = 32;
        int v103 = v102 + v31;
        int v104 = v30[v103];
        int v105 = 3;
        int v106;
        v106 = v105;
        switch (v104) {
          case 0:
            {
            int v107 = 3;
            v106 = v107;
            break;
          }
          default:
            {
            v106 = v31;
            break;
          }
          case 1:
            {
            int v108 = 4;
            int v109 = v31 + v108;
            v106 = v109;
            break;
          }
        }
        v89 = v106;
        break;
      }
      default:
        {
        int v110 = 36;
        int v111 = v110 + v31;
        int v112 = v30[v111];
        int v113 = 3;
        int v114;
        v114 = v113;
        switch (v112) {
          case 0:
            {
            int v115 = 3;
            v114 = v115;
            break;
          }
          case 1:
            {
            int v116 = 0;
            int v117 = v31 + v116;
            v114 = v117;
          }
          default:
            {
            int v118 = 3;
            int v119 = v31 + v118;
            v114 = v119;
            break;
          }
        }
        bool v120 = true;
        v89 = v114;
        break;
      }
    }
    bool v121 = true;
    int v122 = 48;
    int v123 = v122 + v31;
    bool v124 = true;
    int v125 = simt_wave_count_bits(v124);
    v29[v123] = v125;
    v53 = v89;
  }
  int v126 = 64;
  int v127 = v126 + v31;
  bool v128 = true;
  int v129 = simt_wave_count_bits(v128);
  v29[v127] = v129;
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
    static int32_t expected0[] = {static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
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
