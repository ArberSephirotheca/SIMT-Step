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
    int v14 = 0;
    int v15;
    int v16;
    v15 = v13;
    v16 = v14;
    while (true) {
      int v17 = 4;
      int v18 = v3 % v17;
      int v19 = 1;
      int v20 = v18 + v19;
      bool v21 = v16 < v20;
      v15 = v15;
      v16 = v16;
      if (!v21) break;
      int v22 = 1;
      int v23 = v16 + v22;
      v15 = v0;
      v16 = v23;
      break;
      ;
    }
    int v24 = 2;
    int v25 = v0 + v24;
    int v26 = 1;
    int v27 = v7 + v26;
    v6 = v15;
    v7 = v27;
    continue;
    ;
  }
  bool v28 = true;
  int v29 = simt_wave_count_bits(v28);
  int v30 = 0;
  int v31 = v30 + v0;
  v1[v31] = v29;
  int v32 = 0;
  bool v33 = v2 != v32;
  int v34;
  if (v33) {
    int v35 = 3;
    int v36 = v3 % v35;
    int v37 = 2;
    int v38 = v0 + v37;
    int v39;
    v39 = v38;
    switch (v36) {
      case 0:
        {
        int v40 = 2;
        int v41 = v3 % v40;
        int v42 = 4;
        int v43 = v0 + v42;
        int v44;
        v44 = v43;
        switch (v41) {
          case 0:
            {
            int v45 = 4;
            int v46 = v0 + v45;
            v44 = v46;
            break;
          }
          default:
            {
            int v47 = 4;
            v44 = v47;
            break;
          }
        }
        int v48 = 0;
        int v49 = v0 + v48;
        v39 = v44;
        break;
      }
      case 1:
        {
        int v50 = 2;
        int v51 = v3 % v50;
        int v52 = 3;
        int v53;
        v53 = v52;
        switch (v51) {
          case 0:
            {
            int v54 = 2;
            int v55 = v0 + v54;
            v53 = v55;
            break;
          }
          default:
            {
            v53 = v0;
          }
          case 1:
            {
            int v56 = 2;
            int v57 = v0 + v56;
            v53 = v57;
            break;
          }
        }
        int v58 = 0;
        v39 = v53;
        break;
      }
      default:
        {
        int v59 = 0;
        int v60 = 0;
        int v61;
        int v62;
        v61 = v59;
        v62 = v60;
        while (true) {
          int v63 = 4;
          int v64 = v3 % v63;
          int v65 = 1;
          int v66 = v64 + v65;
          bool v67 = v62 < v66;
          v61 = v61;
          v62 = v62;
          if (!v67) break;
          int v68 = 1;
          int v69 = v62 + v68;
          v61 = v0;
          v62 = v69;
          break;
          ;
        }
        int v70 = 3;
        int v71 = v0 + v70;
        v39 = v61;
        break;
      }
    }
    v34 = v39;
  } else {
    int v72 = 0;
    bool v73 = v2 != v72;
    int v74;
    if (v73) {
      int v75 = 0;
      int v76 = 0;
      int v77;
      int v78;
      v77 = v75;
      v78 = v76;
      while (true) {
        int v79 = 4;
        int v80 = v3 % v79;
        int v81 = 1;
        int v82 = v80 + v81;
        bool v83 = v78 < v82;
        v77 = v77;
        v78 = v78;
        if (!v83) break;
        uint v84 = simt_lane_id(__simt_tid);
        int v85 = (int)(v84);
        int v86 = 1;
        int v87 = v78 + v86;
        v77 = v85;
        v78 = v87;
      }
      v74 = v77;
    } else {
      v74 = v0;
    }
    uint v88 = simt_subgroup_id(__simt_tid);
    int v89 = (int)(v88);
    v34 = v74;
  }
  bool v90 = true;
  int v91 = simt_wave_count_bits(v90);
  int v92 = 16;
  int v93 = v92 + v0;
  v1[v93] = v91;
  int v94 = 0;
  bool v95 = v2 != v94;
  int v96 = v95 ? v6 : v34;
  return;
}

kernel void kernel_main(device int* v97 [[buffer(0)]], device int* v98 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v99 = static_cast<int>(__simt_tid3.x);
  int v100 = 0;
  int v101 = v100 + v99;
  int v102 = v98[v101];
  int v103 = 4;
  int v104 = v103 + v99;
  int v105 = v98[v104];
  helper0(v99, v97, v102, v105, static_cast<int>(__simt_tid3.x));
  int v106 = 8;
  int v107 = v106 + v99;
  int v108 = v98[v107];
  int v109 = 0;
  bool v110 = v108 != v109;
  int v111;
  if (v110) {
    int v112 = 12;
    int v113 = v112 + v99;
    int v114 = v98[v113];
    int v115 = 0;
    bool v116 = v114 != v115;
    int v117;
    if (v116) {
      int v118 = 1;
      v117 = v118;
    } else {
      int v119 = 16;
      int v120 = v119 + v99;
      int v121 = v98[v120];
      int v122 = 1;
      int v123 = v99 + v122;
      int v124;
      v124 = v123;
      switch (v121) {
        case 0:
          {
          int v125 = 3;
          v124 = v125;
          break;
        }
        default:
          {
          int v126 = 2;
          int v127 = v99 + v126;
          v124 = v127;
          break;
        }
      }
      bool v128 = true;
      v117 = v124;
    }
    v111 = v117;
  } else {
    int v129 = 20;
    int v130 = v129 + v99;
    int v131 = v98[v130];
    int v132 = 0;
    bool v133 = v131 != v132;
    int v134;
    if (v133) {
      uint v135 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v136 = (int)(v135);
      v134 = v136;
    } else {
      int v137 = 24;
      int v138 = v137 + v99;
      int v139 = v98[v138];
      uint v140 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v141 = (int)(v140);
      int v142;
      v142 = v141;
      switch (v139) {
        case 0:
          {
          int v143 = 4;
          v142 = v143;
          break;
        }
        case 1:
          {
          v142 = v99;
          break;
        }
        default:
          {
          v142 = v99;
          break;
        }
      }
      bool v144 = true;
      v134 = v142;
    }
    v111 = v134;
  }
  int v145 = 32;
  int v146 = v145 + v99;
  bool v147 = true;
  int v148 = simt_wave_count_bits(v147);
  v97[v146] = v148;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 28; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
