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
    uint v13 = simt_subgroup_id(__simt_tid);
    int v14 = (int)(v13);
    int v15 = 1;
    int v16 = v7 + v15;
    v6 = v14;
    v7 = v16;
    continue;
    ;
  }
  bool v17 = true;
  int v18 = simt_wave_count_bits(v17);
  int v19 = 0;
  int v20 = v19 + v0;
  v1[v20] = v18;
  int v21 = 0;
  bool v22 = v2 != v21;
  int v23;
  if (v22) {
    int v24 = 2;
    int v25 = v3 % v24;
    uint v26 = simt_lane_id(__simt_tid);
    int v27 = (int)(v26);
    int v28;
    v28 = v27;
    switch (v25) {
      case 0:
        {
        int v29 = 3;
        int v30 = v3 % v29;
        int v31 = 2;
        int v32 = v0 + v31;
        int v33;
        v33 = v32;
        switch (v30) {
          case 0:
            {
            int v34 = 3;
            v33 = v34;
          }
          case 1:
            {
            int v35 = 4;
            v33 = v35;
          }
          default:
            {
            int v36 = 1;
            int v37 = v0 + v36;
            v33 = v37;
            break;
          }
        }
        int v38 = 1;
        int v39 = v0 + v38;
        v28 = v33;
        break;
      }
      default:
        {
        int v40 = 0;
        bool v41 = v2 != v40;
        int v42;
        if (v41) {
          v42 = v0;
        } else {
          v42 = v0;
        }
        int v43 = 2;
        int v44 = v0 + v43;
        v28 = v42;
        break;
      }
    }
    int v45 = 1;
    int v46 = v0 + v45;
    v23 = v28;
  } else {
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
      uint v56 = simt_lane_id(__simt_tid);
      int v57 = (int)(v56);
      int v58;
      v58 = v57;
      switch (v3) {
        case 0:
          {
          v58 = v0;
          break;
        }
        default:
          {
          v58 = v0;
          break;
        }
      }
      int v59 = 1;
      int v60 = 1;
      int v61 = v50 + v60;
      v49 = v58;
      v50 = v61;
      continue;
      ;
    }
    uint v62 = simt_lane_id(__simt_tid);
    int v63 = (int)(v62);
    v23 = v49;
  }
  bool v64 = true;
  int v65 = simt_wave_count_bits(v64);
  int v66 = 16;
  int v67 = v66 + v0;
  v1[v67] = v65;
  int v68 = 0;
  bool v69 = v2 != v68;
  int v70 = v69 ? v6 : v23;
  return;
}

kernel void kernel_main(device int* v71 [[buffer(0)]], device int* v72 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v73 = static_cast<int>(__simt_tid3.x);
  int v74 = 0;
  int v75 = v74 + v73;
  int v76 = v72[v75];
  int v77 = 4;
  int v78 = v77 + v73;
  int v79 = v72[v78];
  helper0(v73, v71, v76, v79, static_cast<int>(__simt_tid3.x));
  int v80 = 0;
  int v81 = 0;
  int v82;
  int v83;
  v82 = v80;
  v83 = v81;
  while (true) {
    int v84 = 4;
    int v85 = v83 * v84;
    int v86 = v85 + v73;
    int v87 = 8;
    int v88 = v87 + v86;
    int v89 = v72[v88];
    int v90 = 0;
    bool v91 = v89 != v90;
    v82 = v82;
    v83 = v83;
    if (!v91) break;
    int v92 = 28;
    int v93 = v92 + v73;
    int v94 = v72[v93];
    uint v95 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v96 = (int)(v95);
    int v97;
    v97 = v96;
    switch (v94) {
      case 0:
        {
        int v98 = 32;
        int v99 = v98 + v73;
        int v100 = v72[v99];
        int v101 = 0;
        bool v102 = v100 != v101;
        int v103;
        if (v102) {
          int v104 = 4;
          int v105 = v73 + v104;
          v103 = v105;
        } else {
          int v106 = 3;
          v103 = v106;
        }
        v97 = v103;
        break;
      }
      default:
        {
        int v107 = 36;
        int v108 = v107 + v73;
        int v109 = v72[v108];
        int v110 = 0;
        bool v111 = v109 != v110;
        int v112;
        if (v111) {
          int v113 = 4;
          v112 = v113;
        } else {
          int v114 = 0;
          int v115 = v73 + v114;
          v112 = v115;
        }
        v97 = v112;
        break;
      }
      case 1:
        {
        int v116 = 0;
        int v117 = v73 + v116;
        v97 = v117;
        break;
      }
      case 2:
        {
        int v118 = 40;
        int v119 = v118 + v73;
        int v120 = v72[v119];
        int v121 = 0;
        int v122;
        v122 = v121;
        switch (v120) {
          case 0:
            {
            int v123 = 2;
            int v124 = v73 + v123;
            v122 = v124;
            break;
          }
          default:
            {
            v122 = v73;
            break;
          }
          case 1:
            {
            int v125 = 4;
            v122 = v125;
            break;
          }
        }
        bool v126 = true;
        v97 = v122;
        break;
      }
    }
    bool v127 = true;
    int v128 = v82 + v97;
    int v129 = 1;
    int v130 = v83 + v129;
    v82 = v128;
    v83 = v130;
  }
  bool v131 = true;
  int v132 = 32;
  int v133 = v132 + v73;
  bool v134 = true;
  int v135 = simt_wave_count_bits(v134);
  v71[v133] = v135;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 44; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
