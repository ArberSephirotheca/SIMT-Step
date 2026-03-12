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
  int v6;
  v6 = v0;
  switch (v5) {
    default:
      {
      int v7 = 0;
      int v8 = 0;
      int v9;
      int v10;
      v9 = v7;
      v10 = v8;
      while (true) {
        int v11 = 4;
        int v12 = v3 % v11;
        int v13 = 1;
        int v14 = v12 + v13;
        bool v15 = v10 < v14;
        v9 = v9;
        v10 = v10;
        if (!v15) break;
        int v16 = 2;
        int v17 = v3 % v16;
        int v18;
        v18 = v0;
        switch (v17) {
          case 0:
            {
            v18 = v0;
          }
          default:
            {
            int v19 = 1;
            int v20 = v0 + v19;
            v18 = v20;
          }
          case 1:
            {
            int v21 = 1;
            v18 = v21;
            break;
          }
        }
        int v22 = 2;
        int v23 = 1;
        int v24 = v10 + v23;
        v9 = v18;
        v10 = v24;
      }
      v6 = v9;
      break;
    }
    case 0:
      {
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
        int v34 = 3;
        int v35 = v3 % v34;
        int v36 = 1;
        int v37 = v0 + v36;
        int v38;
        v38 = v37;
        switch (v35) {
          case 0:
            {
            v38 = v0;
          }
          case 1:
            {
            int v39 = 1;
            v38 = v39;
            break;
          }
          default:
            {
            v38 = v0;
            break;
          }
        }
        int v40 = 1;
        int v41 = v28 + v40;
        v27 = v38;
        v28 = v41;
        continue;
        ;
      }
      int v42 = 4;
      v6 = v27;
      break;
    }
    case 1:
      {
      int v43 = 3;
      int v44 = v0 + v43;
      v6 = v44;
      break;
    }
  }
  bool v45 = true;
  int v46 = simt_wave_count_bits(v45);
  int v47 = 0;
  int v48 = v47 + v0;
  v1[v48] = v46;
  return;
}

kernel void kernel_main(device int* v49 [[buffer(0)]], device int* v50 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v51 = static_cast<int>(__simt_tid3.x);
  int v52 = 0;
  int v53 = v52 + v51;
  int v54 = v50[v53];
  int v55 = 4;
  int v56 = v55 + v51;
  int v57 = v50[v56];
  helper0(v51, v49, v54, v57, static_cast<int>(__simt_tid3.x));
  int v58 = 0;
  int v59 = 0;
  int v60;
  int v61;
  v60 = v58;
  v61 = v59;
  while (true) {
    int v62 = 4;
    int v63 = v61 * v62;
    int v64 = v63 + v51;
    int v65 = 8;
    int v66 = v65 + v64;
    int v67 = v50[v66];
    int v68 = 0;
    bool v69 = v67 != v68;
    v60 = v60;
    v61 = v61;
    if (!v69) break;
    int v70 = 28;
    int v71 = v70 + v51;
    int v72 = v50[v71];
    int v73 = 0;
    bool v74 = v72 != v73;
    int v75;
    if (v74) {
      int v76 = 32;
      int v77 = v76 + v51;
      int v78 = v50[v77];
      int v79 = 1;
      int v80;
      v80 = v79;
      switch (v78) {
        case 0:
          {
          int v81 = 4;
          int v82 = v51 + v81;
          v80 = v82;
          break;
        }
        default:
          {
          int v83 = 0;
          int v84 = v51 + v83;
          v80 = v84;
        }
        case 1:
          {
          int v85 = 1;
          int v86 = v51 + v85;
          v80 = v86;
          break;
        }
        case 2:
          {
          int v87 = 0;
          int v88 = v51 + v87;
          v80 = v88;
          break;
        }
      }
      bool v89 = true;
      v75 = v80;
    } else {
      int v90 = 4;
      v75 = v90;
    }
    int v91 = v60 + v75;
    int v92 = 1;
    int v93 = v61 + v92;
    v60 = v91;
    v61 = v93;
  }
  bool v94 = true;
  int v95 = 16;
  int v96 = v95 + v51;
  bool v97 = true;
  int v98 = simt_wave_count_bits(v97);
  v49[v96] = v98;
  int v99 = 36;
  int v100 = v99 + v51;
  int v101 = v50[v100];
  int v102 = 0;
  bool v103 = v101 != v102;
  int v104;
  if (v103) {
    int v105 = 0;
    int v106 = 0;
    int v107;
    int v108;
    v107 = v105;
    v108 = v106;
    while (true) {
      int v109 = 4;
      int v110 = v108 * v109;
      int v111 = v110 + v51;
      int v112 = 40;
      int v113 = v112 + v111;
      int v114 = v50[v113];
      int v115 = 0;
      bool v116 = v114 != v115;
      v107 = v107;
      v108 = v108;
      if (!v116) break;
      int v117 = 3;
      int v118 = v51 + v117;
      int v119 = v107 + v118;
      int v120 = 1;
      int v121 = v108 + v120;
      v107 = v119;
      v108 = v121;
    }
    bool v122 = true;
    v104 = v107;
  } else {
    int v123 = 60;
    int v124 = v123 + v51;
    int v125 = v50[v124];
    int v126 = 0;
    bool v127 = v125 != v126;
    int v128;
    if (v127) {
      int v129 = 64;
      int v130 = v129 + v51;
      int v131 = v50[v130];
      int v132 = 0;
      bool v133 = v131 != v132;
      int v134;
      if (v133) {
        int v135 = 0;
        int v136 = v51 + v135;
        v134 = v136;
      } else {
        uint v137 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v138 = (int)(v137);
        v134 = v138;
      }
      v128 = v134;
    } else {
      v128 = v51;
    }
    v104 = v128;
  }
  int v139 = 32;
  int v140 = v139 + v51;
  bool v141 = true;
  int v142 = simt_wave_count_bits(v141);
  v49[v140] = v142;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
