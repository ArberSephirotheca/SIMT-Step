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
  int v6 = 3;
  int v7;
  v7 = v6;
  switch (v5) {
    default:
      {
      int v8 = 0;
      bool v9 = v2 != v8;
      int v10;
      if (v9) {
        int v11 = 2;
        int v12 = v0 + v11;
        int v13;
        v13 = v12;
        switch (v3) {
          default:
            {
            v13 = v0;
            break;
          }
          case 0:
            {
            int v14 = 4;
            v13 = v14;
            break;
          }
        }
        v10 = v13;
      } else {
        int v15 = 0;
        bool v16 = v2 != v15;
        int v17;
        if (v16) {
          int v18 = 2;
          v17 = v18;
        } else {
          v17 = v0;
        }
        v10 = v17;
      }
      v7 = v10;
      break;
    }
    case 0:
      {
      int v19 = 2;
      int v20 = v3 % v19;
      int v21 = 1;
      int v22 = v0 + v21;
      int v23;
      v23 = v22;
      switch (v20) {
        case 0:
          {
          int v24 = 2;
          v23 = v24;
        }
        default:
          {
          int v25 = 0;
          bool v26 = v2 != v25;
          int v27;
          if (v26) {
            int v28 = 4;
            v27 = v28;
          } else {
            int v29 = 2;
            int v30 = v0 + v29;
            v27 = v30;
          }
          v23 = v27;
        }
        case 1:
          {
          int v31 = 0;
          bool v32 = v2 != v31;
          int v33;
          if (v32) {
            int v34 = 4;
            int v35 = v0 + v34;
            v33 = v35;
          } else {
            int v36 = 1;
            int v37 = v0 + v36;
            v33 = v37;
          }
          v23 = v33;
          break;
        }
      }
      v7 = v23;
      break;
    }
  }
  bool v38 = true;
  int v39 = simt_wave_count_bits(v38);
  int v40 = 0;
  int v41 = v40 + v0;
  v1[v41] = v39;
  return;
}

kernel void kernel_main(device int* v42 [[buffer(0)]], device int* v43 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v44 = static_cast<int>(__simt_tid3.x);
  int v45 = 0;
  int v46 = v45 + v44;
  int v47 = v43[v46];
  int v48 = 4;
  int v49 = v48 + v44;
  int v50 = v43[v49];
  helper0(v44, v42, v47, v50, static_cast<int>(__simt_tid3.x));
  int v51 = 2;
  int v52 = v44 + v51;
  int v53 = 8;
  int v54 = v53 + v44;
  int v55 = v43[v54];
  int v56 = 0;
  bool v57 = v55 != v56;
  int v58;
  if (v57) {
    int v59 = 12;
    int v60 = v59 + v44;
    int v61 = v43[v60];
    int v62 = 4;
    int v63;
    v63 = v62;
    switch (v61) {
      case 0:
        {
        int v64 = 16;
        int v65 = v64 + v44;
        int v66 = v43[v65];
        int v67;
        v67 = v44;
        switch (v66) {
          default:
            {
            int v68 = 2;
            int v69 = v44 + v68;
            v67 = v69;
            break;
          }
          case 0:
            {
            int v70 = 3;
            v67 = v70;
            break;
          }
          case 1:
            {
            int v71 = 3;
            v67 = v71;
            break;
          }
          case 2:
            {
            int v72 = 0;
            int v73 = v44 + v72;
            v67 = v73;
            break;
          }
        }
        v63 = v67;
        break;
      }
      default:
        {
        int v74 = 1;
        v63 = v74;
      }
      case 1:
        {
        int v75 = 0;
        int v76 = 0;
        int v77;
        int v78;
        v77 = v75;
        v78 = v76;
        while (true) {
          int v79 = 4;
          int v80 = v78 * v79;
          int v81 = v80 + v44;
          int v82 = 20;
          int v83 = v82 + v81;
          int v84 = v43[v83];
          int v85 = 0;
          bool v86 = v84 != v85;
          v77 = v77;
          v78 = v78;
          if (!v86) break;
          int v87 = v77 + v78;
          int v88 = 1;
          int v89 = v78 + v88;
          bool v90 = true;
          v77 = v87;
          v78 = v89;
        }
        v63 = v77;
        break;
      }
    }
    bool v91 = true;
    int v92 = 16;
    int v93 = v92 + v44;
    bool v94 = true;
    int v95 = simt_wave_count_bits(v94);
    v42[v93] = v95;
    v58 = v63;
  } else {
    int v96 = 40;
    int v97 = v96 + v44;
    int v98 = v43[v97];
    int v99 = 0;
    bool v100 = v98 != v99;
    int v101;
    if (v100) {
      int v102 = 44;
      int v103 = v102 + v44;
      int v104 = v43[v103];
      uint v105 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v106 = (int)(v105);
      int v107;
      v107 = v106;
      switch (v104) {
        case 0:
          {
          int v108 = 1;
          int v109 = v44 + v108;
          v107 = v109;
          break;
        }
        default:
          {
          int v110 = 4;
          int v111 = v44 + v110;
          v107 = v111;
        }
        case 1:
          {
          v107 = v44;
          break;
        }
        case 2:
          {
          int v112 = 3;
          v107 = v112;
          break;
        }
      }
      v101 = v107;
    } else {
      v101 = v44;
    }
    int v113 = 32;
    int v114 = v113 + v44;
    bool v115 = true;
    int v116 = simt_wave_count_bits(v115);
    v42[v114] = v116;
    v58 = v101;
  }
  int v117 = 48;
  int v118 = v117 + v44;
  bool v119 = true;
  int v120 = simt_wave_count_bits(v119);
  v42[v118] = v120;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 52; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 48; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
