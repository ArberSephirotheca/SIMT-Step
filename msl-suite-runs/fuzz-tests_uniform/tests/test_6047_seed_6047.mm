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
  uint v4 = simt_subgroup_id(__simt_tid);
  int v5 = (int)(v4);
  int v6 = 0;
  int v7 = 0;
  int v8;
  int v9;
  v8 = v6;
  v9 = v7;
  while (true) {
    int v10 = 4;
    int v11 = v3 % v10;
    int v12 = 1;
    int v13 = v11 + v12;
    bool v14 = v9 < v13;
    v8 = v8;
    v9 = v9;
    if (!v14) break;
    uint v15 = simt_lane_id(__simt_tid);
    int v16 = (int)(v15);
    int v17 = 1;
    int v18 = v9 + v17;
    v8 = v16;
    v9 = v18;
  }
  bool v19 = true;
  int v20 = simt_wave_count_bits(v19);
  int v21 = 0;
  int v22 = v21 + v0;
  v1[v22] = v20;
  int v23 = 0;
  bool v24 = v2 != v23;
  int v25 = v24 ? v5 : v8;
  int v26 = 0;
  bool v27 = v2 != v26;
  int v28;
  if (v27) {
    int v29 = 0;
    int v30 = 0;
    int v31;
    int v32;
    v31 = v29;
    v32 = v30;
    while (true) {
      int v33 = 4;
      int v34 = v3 % v33;
      int v35 = 1;
      int v36 = v34 + v35;
      bool v37 = v32 < v36;
      v31 = v31;
      v32 = v32;
      if (!v37) break;
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
        uint v47 = simt_subgroup_id(__simt_tid);
        int v48 = (int)(v47);
        int v49 = 1;
        int v50 = v41 + v49;
        v40 = v48;
        v41 = v50;
        break;
        ;
      }
      int v51 = 1;
      int v52 = v32 + v51;
      v31 = v40;
      v32 = v52;
    }
    uint v53 = simt_lane_id(__simt_tid);
    int v54 = (int)(v53);
    v28 = v31;
  } else {
    int v55 = 0;
    int v56 = 0;
    int v57;
    int v58;
    v57 = v55;
    v58 = v56;
    while (true) {
      int v59 = 4;
      int v60 = v3 % v59;
      int v61 = 1;
      int v62 = v60 + v61;
      bool v63 = v58 < v62;
      v57 = v57;
      v58 = v58;
      if (!v63) break;
      int v64 = 0;
      bool v65 = v2 != v64;
      int v66;
      if (v65) {
        uint v67 = simt_subgroup_id(__simt_tid);
        int v68 = (int)(v67);
        v66 = v68;
      } else {
        uint v69 = simt_lane_id(__simt_tid);
        int v70 = (int)(v69);
        v66 = v70;
      }
      int v71 = 2;
      int v72 = 1;
      int v73 = v58 + v72;
      v57 = v66;
      v58 = v73;
    }
    v28 = v57;
  }
  bool v74 = true;
  int v75 = simt_wave_count_bits(v74);
  int v76 = 16;
  int v77 = v76 + v0;
  v1[v77] = v75;
  int v78 = 0;
  bool v79 = v2 != v78;
  int v80 = v79 ? v25 : v28;
  return;
}

kernel void kernel_main(device int* v81 [[buffer(0)]], device int* v82 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v83 = static_cast<int>(__simt_tid3.x);
  int v84 = 0;
  int v85 = v84 + v83;
  int v86 = v82[v85];
  int v87 = 4;
  int v88 = v87 + v83;
  int v89 = v82[v88];
  helper0(v83, v81, v86, v89, static_cast<int>(__simt_tid3.x));
  int v90 = 8;
  int v91 = v90 + v83;
  int v92 = v82[v91];
  int v93 = 0;
  bool v94 = v92 != v93;
  int v95;
  if (v94) {
    int v96 = 12;
    int v97 = v96 + v83;
    int v98 = v82[v97];
    int v99 = 0;
    int v100 = v83 + v99;
    int v101;
    v101 = v100;
    switch (v98) {
      case 0:
        {
        int v102 = 2;
        int v103 = v83 + v102;
        v101 = v103;
      }
      default:
        {
        int v104 = 16;
        int v105 = v104 + v83;
        int v106 = v82[v105];
        int v107;
        v107 = v83;
        switch (v106) {
          default:
            {
            v107 = v83;
            break;
          }
          case 0:
            {
            int v108 = 2;
            v107 = v108;
            break;
          }
          case 1:
            {
            v107 = v83;
            break;
          }
        }
        bool v109 = true;
        v101 = v107;
        break;
      }
    }
    bool v110 = true;
    v95 = v101;
  } else {
    int v111 = 20;
    int v112 = v111 + v83;
    int v113 = v82[v112];
    int v114 = 2;
    int v115 = v83 + v114;
    int v116;
    v116 = v115;
    switch (v113) {
      default:
        {
        int v117 = 24;
        int v118 = v117 + v83;
        int v119 = v82[v118];
        int v120 = 0;
        bool v121 = v119 != v120;
        int v122;
        if (v121) {
          v122 = v83;
        } else {
          int v123 = 1;
          int v124 = v83 + v123;
          v122 = v124;
        }
        v116 = v122;
        break;
      }
      case 0:
        {
        v116 = v83;
        break;
      }
      case 1:
        {
        int v125 = 28;
        int v126 = v125 + v83;
        int v127 = v82[v126];
        int v128 = 0;
        bool v129 = v127 != v128;
        int v130;
        if (v129) {
          int v131 = 2;
          v130 = v131;
        } else {
          int v132 = 4;
          v130 = v132;
        }
        v116 = v130;
        break;
      }
      case 2:
        {
        int v133 = 32;
        int v134 = v133 + v83;
        int v135 = v82[v134];
        int v136 = 2;
        int v137 = v83 + v136;
        int v138;
        v138 = v137;
        switch (v135) {
          default:
            {
            int v139 = 3;
            v138 = v139;
            break;
          }
          case 0:
            {
            int v140 = 4;
            int v141 = v83 + v140;
            v138 = v141;
          }
          case 1:
            {
            v138 = v83;
          }
          case 2:
            {
            int v142 = 1;
            v138 = v142;
            break;
          }
        }
        bool v143 = true;
        v116 = v138;
        break;
      }
    }
    bool v144 = true;
    v95 = v116;
  }
  int v145 = 32;
  int v146 = v145 + v83;
  bool v147 = true;
  int v148 = simt_wave_count_bits(v147);
  v81[v146] = v148;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 36; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
