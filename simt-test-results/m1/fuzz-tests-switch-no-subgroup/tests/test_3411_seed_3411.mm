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
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 0;
      bool v10 = v2 != v9;
      int v11;
      if (v10) {
        int v12 = 3;
        int v13 = v3 % v12;
        int v14;
        v14 = v0;
        switch (v13) {
          default:
            {
            int v15 = 3;
            v14 = v15;
            break;
          }
          case 0:
            {
            v14 = v0;
            break;
          }
          case 1:
            {
            int v16 = 2;
            int v17 = v0 + v16;
            v14 = v17;
            break;
          }
        }
        v11 = v14;
      } else {
        v11 = v0;
      }
      v8 = v11;
      break;
    }
    case 0:
      {
      int v18 = 1;
      v8 = v18;
      break;
    }
    case 1:
      {
      int v19 = 0;
      int v20 = 0;
      int v21;
      int v22;
      v21 = v19;
      v22 = v20;
      while (true) {
        int v23 = 4;
        int v24 = v3 % v23;
        int v25 = 1;
        int v26 = v24 + v25;
        bool v27 = v22 < v26;
        v21 = v21;
        v22 = v22;
        if (!v27) break;
        int v28 = 3;
        int v29 = v3 % v28;
        int v30 = 2;
        int v31 = v0 + v30;
        int v32;
        v32 = v31;
        switch (v29) {
          case 0:
            {
            v32 = v0;
            break;
          }
          default:
            {
            int v33 = 2;
            int v34 = v0 + v33;
            v32 = v34;
          }
          case 1:
            {
            int v35 = 0;
            v32 = v35;
            break;
          }
        }
        int v36 = 1;
        int v37 = v22 + v36;
        v21 = v32;
        v22 = v37;
      }
      v8 = v21;
      break;
    }
    case 2:
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
        int v47 = 3;
        int v48 = v3 % v47;
        int v49;
        v49 = v0;
        switch (v48) {
          default:
            {
            int v50 = 0;
            v49 = v50;
            break;
          }
          case 0:
            {
            v49 = v0;
            break;
          }
          case 1:
            {
            v49 = v0;
            break;
          }
        }
        int v51 = 1;
        int v52 = v41 + v51;
        v40 = v49;
        v41 = v52;
        continue;
        ;
      }
      v8 = v40;
      break;
    }
  }
  bool v53 = true;
  int v54 = simt_wave_count_bits(v53);
  int v55 = 0;
  int v56 = v55 + v0;
  v1[v56] = v54;
  return;
}

kernel void kernel_main(device int* v57 [[buffer(0)]], device int* v58 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v59 = static_cast<int>(__simt_tid3.x);
  int v60 = 0;
  int v61 = v60 + v59;
  int v62 = v58[v61];
  int v63 = 4;
  int v64 = v63 + v59;
  int v65 = v58[v64];
  helper0(v59, v57, v62, v65, static_cast<int>(__simt_tid3.x));
  int v66 = 8;
  int v67 = v66 + v59;
  int v68 = v58[v67];
  int v69 = 2;
  int v70 = v59 + v69;
  int v71;
  v71 = v70;
  switch (v68) {
    case 0:
      {
      int v72 = 0;
      int v73 = 0;
      int v74;
      int v75;
      v74 = v72;
      v75 = v73;
      while (true) {
        int v76 = 4;
        int v77 = v75 * v76;
        int v78 = v77 + v59;
        int v79 = 12;
        int v80 = v79 + v78;
        int v81 = v58[v80];
        int v82 = 0;
        bool v83 = v81 != v82;
        v74 = v74;
        v75 = v75;
        if (!v83) break;
        int v84 = v74 + v75;
        int v85 = 1;
        int v86 = v75 + v85;
        bool v87 = true;
        v74 = v84;
        v75 = v86;
        break;
        ;
      }
      v71 = v74;
      break;
    }
    default:
      {
      int v88 = 32;
      int v89 = v88 + v59;
      int v90 = v58[v89];
      int v91 = 0;
      bool v92 = v90 != v91;
      int v93;
      if (v92) {
        int v94 = 36;
        int v95 = v94 + v59;
        int v96 = v58[v95];
        int v97 = 0;
        bool v98 = v96 != v97;
        int v99;
        if (v98) {
          int v100 = 3;
          int v101 = v59 + v100;
          v99 = v101;
        } else {
          int v102 = 2;
          int v103 = v59 + v102;
          v99 = v103;
        }
        v93 = v99;
      } else {
        int v104 = 0;
        int v105 = 0;
        int v106;
        int v107;
        v106 = v104;
        v107 = v105;
        while (true) {
          int v108 = 4;
          int v109 = v107 * v108;
          int v110 = v109 + v59;
          int v111 = 40;
          int v112 = v111 + v110;
          int v113 = v58[v112];
          int v114 = 0;
          bool v115 = v113 != v114;
          v106 = v106;
          v107 = v107;
          if (!v115) break;
          int v116 = v106 + v107;
          int v117 = 1;
          int v118 = v107 + v117;
          bool v119 = true;
          v106 = v116;
          v107 = v118;
          continue;
          ;
        }
        v93 = v106;
      }
      v71 = v93;
      break;
    }
    case 1:
      {
      v71 = v59;
      break;
    }
  }
  int v120 = 0;
  int v121 = 0;
  int v122;
  int v123;
  v122 = v120;
  v123 = v121;
  while (true) {
    int v124 = 4;
    int v125 = v123 * v124;
    int v126 = v125 + v59;
    int v127 = 60;
    int v128 = v127 + v126;
    int v129 = v58[v128];
    int v130 = 0;
    bool v131 = v129 != v130;
    v122 = v122;
    v123 = v123;
    if (!v131) break;
    int v132 = v122 + v123;
    int v133 = 1;
    int v134 = v123 + v133;
    bool v135 = true;
    int v136 = 16;
    int v137 = 4;
    int v138 = v123 * v137;
    int v139 = v136 + v138;
    int v140 = v139 + v59;
    bool v141 = true;
    int v142 = simt_wave_count_bits(v141);
    v57[v140] = v142;
    v122 = v132;
    v123 = v134;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 27; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 80; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
