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
        int v18 = 2;
        int v19 = v0 + v18;
        int v20;
        v20 = v19;
        switch (v3) {
          case 0:
            {
            v20 = v0;
          }
          default:
            {
            int v21 = 2;
            v20 = v21;
            break;
          }
        }
        int v22 = 3;
        int v23 = v0 + v22;
        int v24 = 1;
        int v25 = v12 + v24;
        v11 = v20;
        v12 = v25;
      }
      v8 = v11;
      break;
    }
    case 1:
      {
      v8 = v0;
      break;
    }
    default:
      {
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
          int v38 = 2;
          int v39 = v0 + v38;
          int v40 = 1;
          int v41 = v32 + v40;
          v31 = v39;
          v32 = v41;
        }
        int v42 = 0;
        v28 = v31;
      } else {
        int v43 = 0;
        int v44 = 0;
        int v45;
        int v46;
        v45 = v43;
        v46 = v44;
        while (true) {
          int v47 = 4;
          int v48 = v3 % v47;
          int v49 = 1;
          int v50 = v48 + v49;
          bool v51 = v46 < v50;
          v45 = v45;
          v46 = v46;
          if (!v51) break;
          int v52 = 1;
          int v53 = v46 + v52;
          v45 = v0;
          v46 = v53;
          continue;
          ;
        }
        v28 = v45;
      }
      int v54 = 4;
      v8 = v28;
      break;
    }
    case 2:
      {
      int v55 = 2;
      int v56 = v3 % v55;
      int v57;
      v57 = v0;
      switch (v56) {
        default:
          {
          int v58 = 0;
          int v59 = 0;
          int v60;
          int v61;
          v60 = v58;
          v61 = v59;
          while (true) {
            int v62 = 4;
            int v63 = v3 % v62;
            int v64 = 1;
            int v65 = v63 + v64;
            bool v66 = v61 < v65;
            v60 = v60;
            v61 = v61;
            if (!v66) break;
            int v67 = 4;
            int v68 = 1;
            int v69 = v61 + v68;
            v60 = v67;
            v61 = v69;
            continue;
            ;
          }
          int v70 = 1;
          v57 = v60;
          break;
        }
        case 0:
          {
          int v71 = 0;
          bool v72 = v2 != v71;
          int v73;
          if (v72) {
            v73 = v0;
          } else {
            v73 = v0;
          }
          int v74 = 4;
          int v75 = v0 + v74;
          v57 = v73;
          break;
        }
      }
      int v76 = 3;
      v8 = v57;
      break;
    }
  }
  bool v77 = true;
  int v78 = simt_wave_count_bits(v77);
  int v79 = 0;
  int v80 = v79 + v0;
  v1[v80] = v78;
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
    bool v100 = v98 != v99;
    int v101;
    if (v100) {
      int v102 = 16;
      int v103 = v102 + v83;
      int v104 = v82[v103];
      int v105 = 0;
      bool v106 = v104 != v105;
      int v107;
      if (v106) {
        int v108 = 2;
        int v109 = v83 + v108;
        v107 = v109;
      } else {
        uint v110 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v111 = (int)(v110);
        v107 = v111;
      }
      v101 = v107;
    } else {
      int v112 = 1;
      v101 = v112;
    }
    v95 = v101;
  } else {
    int v113 = 0;
    v95 = v113;
  }
  int v114 = 16;
  int v115 = v114 + v83;
  bool v116 = true;
  int v117 = simt_wave_count_bits(v116);
  v81[v115] = v117;
  int v118 = 0;
  int v119 = 0;
  int v120;
  int v121;
  v120 = v118;
  v121 = v119;
  while (true) {
    int v122 = 4;
    int v123 = v121 * v122;
    int v124 = v123 + v83;
    int v125 = 20;
    int v126 = v125 + v124;
    int v127 = v82[v126];
    int v128 = 0;
    bool v129 = v127 != v128;
    v120 = v120;
    v121 = v121;
    if (!v129) break;
    int v130 = v120 + v121;
    int v131 = 1;
    int v132 = v121 + v131;
    v120 = v130;
    v121 = v132;
    continue;
    ;
  }
  bool v133 = true;
  int v134 = 32;
  int v135 = v134 + v83;
  bool v136 = true;
  int v137 = simt_wave_count_bits(v136);
  v81[v135] = v137;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 40; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
