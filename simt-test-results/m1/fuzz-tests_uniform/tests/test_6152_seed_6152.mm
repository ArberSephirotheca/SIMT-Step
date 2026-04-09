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
    int v7 = 4;
    int v8 = v3 % v7;
    uint v9 = simt_subgroup_id(__simt_tid);
    int v10 = (int)(v9);
    int v11;
    v11 = v10;
    switch (v8) {
      case 0:
        {
        int v12 = 3;
        int v13 = v3 % v12;
        int v14 = 3;
        int v15;
        v15 = v14;
        switch (v13) {
          case 0:
            {
            v15 = v0;
          }
          default:
            {
            int v16 = 1;
            v15 = v16;
          }
          case 1:
            {
            int v17 = 4;
            v15 = v17;
            break;
          }
        }
        v11 = v15;
      }
      default:
        {
        int v18 = 0;
        int v19 = 0;
        int v20;
        int v21;
        v20 = v18;
        v21 = v19;
        while (true) {
          int v22 = 4;
          int v23 = v3 % v22;
          int v24 = 1;
          int v25 = v23 + v24;
          bool v26 = v21 < v25;
          v20 = v20;
          v21 = v21;
          if (!v26) break;
          int v27 = 1;
          int v28 = v21 + v27;
          v20 = v0;
          v21 = v28;
        }
        v11 = v20;
      }
      case 1:
        {
        int v29 = 0;
        bool v30 = v2 != v29;
        int v31;
        if (v30) {
          int v32 = 2;
          int v33 = v0 + v32;
          v31 = v33;
        } else {
          int v34 = 2;
          v31 = v34;
        }
        int v35 = 2;
        v11 = v31;
      }
      case 2:
        {
        int v36 = 0;
        bool v37 = v2 != v36;
        int v38;
        if (v37) {
          int v39 = 2;
          int v40 = v0 + v39;
          v38 = v40;
        } else {
          int v41 = 3;
          v38 = v41;
        }
        int v42 = 4;
        v11 = v38;
        break;
      }
    }
    uint v43 = simt_subgroup_id(__simt_tid);
    int v44 = (int)(v43);
    v6 = v11;
  } else {
    uint v45 = simt_subgroup_id(__simt_tid);
    int v46 = (int)(v45);
    int v47;
    v47 = v46;
    switch (v3) {
      case 0:
        {
        int v48 = 3;
        int v49 = v3 % v48;
        int v50;
        v50 = v0;
        switch (v49) {
          default:
            {
            int v51 = 1;
            int v52 = v0 + v51;
            v50 = v52;
          }
          case 0:
            {
            int v53 = 4;
            int v54 = v0 + v53;
            v50 = v54;
            break;
          }
          case 1:
            {
            int v55 = 0;
            v50 = v55;
            break;
          }
        }
        int v56 = 3;
        int v57 = v0 + v56;
        v47 = v50;
      }
      default:
        {
        int v58 = 2;
        int v59 = v3 % v58;
        int v60;
        v60 = v0;
        switch (v59) {
          case 0:
            {
            int v61 = 0;
            int v62 = v0 + v61;
            v60 = v62;
            break;
          }
          case 1:
            {
            v60 = v0;
            break;
          }
          default:
            {
            int v63 = 3;
            v60 = v63;
            break;
          }
        }
        int v64 = 2;
        v47 = v60;
        break;
      }
    }
    uint v65 = simt_subgroup_id(__simt_tid);
    int v66 = (int)(v65);
    v6 = v47;
  }
  bool v67 = true;
  int v68 = simt_wave_count_bits(v67);
  int v69 = 0;
  int v70 = v69 + v0;
  v1[v70] = v68;
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
  uint v80 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v81 = (int)(v80);
  int v82 = 8;
  int v83 = v82 + v73;
  int v84 = v72[v83];
  uint v85 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v86 = (int)(v85);
  int v87;
  v87 = v86;
  switch (v84) {
    default:
      {
      int v88 = 12;
      int v89 = v88 + v73;
      int v90 = v72[v89];
      int v91 = 2;
      int v92 = v73 + v91;
      int v93;
      v93 = v92;
      switch (v90) {
        case 0:
          {
          int v94 = 0;
          int v95 = v73 + v94;
          v93 = v95;
          break;
        }
        case 1:
          {
          v93 = v73;
          break;
        }
        default:
          {
          int v96 = 0;
          int v97 = 0;
          int v98;
          int v99;
          v98 = v96;
          v99 = v97;
          while (true) {
            int v100 = 4;
            int v101 = v99 * v100;
            int v102 = v101 + v73;
            int v103 = 16;
            int v104 = v103 + v102;
            int v105 = v72[v104];
            int v106 = 0;
            bool v107 = v105 != v106;
            v98 = v98;
            v99 = v99;
            if (!v107) break;
            int v108 = v98 + v99;
            int v109 = 1;
            int v110 = v99 + v109;
            v98 = v108;
            v99 = v110;
          }
          bool v111 = true;
          v93 = v98;
          break;
        }
        case 2:
          {
          int v112 = 0;
          v93 = v112;
          break;
        }
      }
      bool v113 = true;
      v87 = v93;
    }
    case 0:
      {
      int v114 = 0;
      int v115 = 0;
      int v116;
      int v117;
      v116 = v114;
      v117 = v115;
      while (true) {
        int v118 = 4;
        int v119 = v117 * v118;
        int v120 = v119 + v73;
        int v121 = 36;
        int v122 = v121 + v120;
        int v123 = v72[v122];
        int v124 = 0;
        bool v125 = v123 != v124;
        v116 = v116;
        v117 = v117;
        if (!v125) break;
        int v126 = v116 + v117;
        int v127 = 1;
        int v128 = v117 + v127;
        v116 = v126;
        v117 = v128;
      }
      bool v129 = true;
      v87 = v116;
      break;
    }
  }
  bool v130 = true;
  int v131 = 16;
  int v132 = v131 + v73;
  bool v133 = true;
  int v134 = simt_wave_count_bits(v133);
  v71[v132] = v134;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
