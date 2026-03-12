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
  bool v5 = v2 != v4;
  int v6;
  if (v5) {
    int v7 = 2;
    int v8 = v3 % v7;
    int v9;
    v9 = v0;
    switch (v8) {
      case 0:
        {
        int v10 = 0;
        bool v11 = v2 != v10;
        int v12;
        if (v11) {
          int v13 = 3;
          v12 = v13;
        } else {
          int v14 = 1;
          v12 = v14;
        }
        v9 = v12;
        break;
      }
      default:
        {
        int v15 = 0;
        int v16 = 0;
        int v17;
        int v18;
        v17 = v15;
        v18 = v16;
        while (true) {
          int v19 = 4;
          int v20 = v3 % v19;
          int v21 = 1;
          int v22 = v20 + v21;
          bool v23 = v18 < v22;
          v17 = v17;
          v18 = v18;
          if (!v23) break;
          int v24 = 1;
          int v25 = v18 + v24;
          v17 = v0;
          v18 = v25;
        }
        v9 = v17;
        break;
      }
    }
    bool v26 = true;
    int v27 = simt_wave_count_bits(v26);
    int v28 = 0;
    int v29 = v28 + v0;
    v1[v29] = v27;
    v6 = v9;
  } else {
    int v30 = 2;
    int v31 = v3 % v30;
    uint v32 = simt_subgroup_id(__simt_tid);
    int v33 = (int)(v32);
    int v34;
    v34 = v33;
    switch (v31) {
      case 0:
        {
        int v35 = 0;
        int v36 = 0;
        int v37;
        int v38;
        v37 = v35;
        v38 = v36;
        while (true) {
          int v39 = 4;
          int v40 = v3 % v39;
          int v41 = 1;
          int v42 = v40 + v41;
          bool v43 = v38 < v42;
          v37 = v37;
          v38 = v38;
          if (!v43) break;
          int v44 = 1;
          int v45 = v38 + v44;
          v37 = v0;
          v38 = v45;
        }
        v34 = v37;
        break;
      }
      default:
        {
        int v46 = 3;
        int v47 = v3 % v46;
        int v48 = 1;
        int v49;
        v49 = v48;
        switch (v47) {
          case 0:
            {
            int v50 = 4;
            int v51 = v0 + v50;
            v49 = v51;
            break;
          }
          case 1:
            {
            int v52 = 3;
            v49 = v52;
            break;
          }
          default:
            {
            v49 = v0;
            break;
          }
          case 2:
            {
            v49 = v0;
            break;
          }
        }
        v34 = v49;
        break;
      }
    }
    v6 = v34;
  }
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
  int v65 = 0;
  int v66 = v55 + v65;
  int v67;
  v67 = v66;
  switch (v64) {
    case 0:
      {
      int v68 = 0;
      int v69 = 0;
      int v70;
      int v71;
      v70 = v68;
      v71 = v69;
      while (true) {
        int v72 = 4;
        int v73 = v71 * v72;
        int v74 = v73 + v55;
        int v75 = 12;
        int v76 = v75 + v74;
        int v77 = v54[v76];
        int v78 = 0;
        bool v79 = v77 != v78;
        v70 = v70;
        v71 = v71;
        if (!v79) break;
        int v80 = 0;
        int v81 = 0;
        int v82;
        int v83;
        v82 = v80;
        v83 = v81;
        while (true) {
          int v84 = 4;
          int v85 = v83 * v84;
          int v86 = v85 + v55;
          int v87 = 32;
          int v88 = v87 + v86;
          int v89 = v54[v88];
          int v90 = 0;
          bool v91 = v89 != v90;
          v82 = v82;
          v83 = v83;
          if (!v91) break;
          int v92 = v82 + v83;
          int v93 = 1;
          int v94 = v83 + v93;
          bool v95 = true;
          v82 = v92;
          v83 = v94;
          continue;
          ;
        }
        int v96 = v70 + v82;
        int v97 = 1;
        int v98 = v71 + v97;
        bool v99 = true;
        v70 = v96;
        v71 = v98;
      }
      v67 = v70;
      break;
    }
    default:
      {
      int v100 = 52;
      int v101 = v100 + v55;
      int v102 = v54[v101];
      int v103;
      v103 = v55;
      switch (v102) {
        default:
          {
          int v104 = 3;
          int v105 = v55 + v104;
          v103 = v105;
          break;
        }
        case 0:
          {
          int v106 = 56;
          int v107 = v106 + v55;
          int v108 = v54[v107];
          int v109 = 0;
          bool v110 = v108 != v109;
          int v111;
          if (v110) {
            int v112 = 1;
            v111 = v112;
          } else {
            v111 = v55;
          }
          v103 = v111;
          break;
        }
      }
      v67 = v103;
    }
    case 1:
      {
      int v113 = 60;
      int v114 = v113 + v55;
      int v115 = v54[v114];
      int v116 = 0;
      bool v117 = v115 != v116;
      int v118;
      if (v117) {
        int v119 = 64;
        int v120 = v119 + v55;
        int v121 = v54[v120];
        int v122;
        v122 = v55;
        switch (v121) {
          case 0:
            {
            v122 = v55;
          }
          case 1:
            {
            int v123 = 4;
            int v124 = v55 + v123;
            v122 = v124;
            break;
          }
          case 2:
            {
            int v125 = 1;
            v122 = v125;
          }
          default:
            {
            int v126 = 2;
            v122 = v126;
            break;
          }
        }
        v118 = v122;
      } else {
        v118 = v55;
      }
      v67 = v118;
    }
    case 2:
      {
      v67 = v55;
      break;
    }
  }
  int v127 = 2;
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 3; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 68; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
