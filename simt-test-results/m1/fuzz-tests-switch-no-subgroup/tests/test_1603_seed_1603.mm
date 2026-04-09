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
      bool v16 = true;
      int v17 = simt_wave_count_bits(v16);
      int v18 = 0;
      int v19 = 4;
      int v20 = v10 * v19;
      int v21 = v18 + v20;
      int v22 = v21 + v0;
      v1[v22] = v17;
      int v23 = 1;
      int v24 = v10 + v23;
      v9 = v17;
      v10 = v24;
    }
    v6 = v9;
  } else {
    int v25 = 3;
    int v26 = v3 % v25;
    uint v27 = simt_subgroup_id(__simt_tid);
    int v28 = (int)(v27);
    int v29;
    v29 = v28;
    switch (v26) {
      case 0:
        {
        int v30 = 3;
        int v31 = v3 % v30;
        int v32;
        v32 = v0;
        switch (v31) {
          case 0:
            {
            int v33 = 1;
            v32 = v33;
          }
          case 1:
            {
            int v34 = 4;
            int v35 = v0 + v34;
            v32 = v35;
          }
          case 2:
            {
            int v36 = 2;
            v32 = v36;
          }
          default:
            {
            int v37 = 2;
            int v38 = v0 + v37;
            v32 = v38;
            break;
          }
        }
        v29 = v32;
      }
      case 1:
        {
        int v39 = 3;
        int v40 = v3 % v39;
        int v41;
        v41 = v0;
        switch (v40) {
          case 0:
            {
            int v42 = 4;
            v41 = v42;
            break;
          }
          default:
            {
            int v43 = 2;
            v41 = v43;
            break;
          }
          case 1:
            {
            int v44 = 2;
            int v45 = v0 + v44;
            v41 = v45;
            break;
          }
          case 2:
            {
            int v46 = 1;
            v41 = v46;
            break;
          }
        }
        v29 = v41;
        break;
      }
      default:
        {
        int v47 = 1;
        v29 = v47;
        break;
      }
    }
    bool v48 = true;
    int v49 = simt_wave_count_bits(v48);
    int v50 = 16;
    int v51 = v50 + v0;
    v1[v51] = v49;
    v6 = v29;
  }
  return;
}

kernel void kernel_main(device int* v52 [[buffer(0)]], device int* v53 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v54 = static_cast<int>(__simt_tid3.x);
  int v55 = 0;
  int v56 = v55 + v54;
  int v57 = v53[v56];
  int v58 = 4;
  int v59 = v58 + v54;
  int v60 = v53[v59];
  int v61 = 0;
  bool v62 = v57 != v61;
  if (v62) {
  } else {
    int v63 = 8;
    int v64 = v63 + v54;
    int v65 = v53[v64];
    int v66 = 0;
    bool v67 = v65 != v66;
    if (v67) {
      int v68 = 2;
      int v69 = v54 % v68;
      uint v70 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v71 = (int)(v70);
      int v72;
      v72 = v71;
      switch (v69) {
        case 0:
          {
          int v73 = 0;
          int v74 = v72 + v73;
          v72 = v74;
          break;
        }
        default:
          {
          int v75 = 1;
          int v76 = v72 + v75;
          v72 = v76;
          break;
        }
        case 1:
          {
          int v77 = 1;
          int v78 = v72 + v77;
          v72 = v78;
          break;
        }
      }
      helper0(v54, v52, v57, v60, static_cast<int>(__simt_tid3.x));
    } else {
    }
  }
  int v79 = 12;
  int v80 = v79 + v54;
  int v81 = v53[v80];
  int v82 = 3;
  int v83;
  v83 = v82;
  switch (v81) {
    case 0:
      {
      int v84 = 16;
      int v85 = v84 + v54;
      int v86 = v53[v85];
      int v87 = 0;
      bool v88 = v86 != v87;
      int v89;
      if (v88) {
        int v90 = 20;
        int v91 = v90 + v54;
        int v92 = v53[v91];
        int v93 = 0;
        int v94;
        v94 = v93;
        switch (v92) {
          case 0:
            {
            int v95 = 2;
            int v96 = v54 + v95;
            v94 = v96;
            break;
          }
          default:
            {
            int v97 = 0;
            v94 = v97;
            break;
          }
          case 1:
            {
            v94 = v54;
            break;
          }
        }
        v89 = v94;
      } else {
        int v98 = 1;
        v89 = v98;
      }
      v83 = v89;
      break;
    }
    case 1:
      {
      int v99 = 0;
      int v100 = 0;
      int v101;
      int v102;
      v101 = v99;
      v102 = v100;
      while (true) {
        int v103 = 4;
        int v104 = v102 * v103;
        int v105 = v104 + v54;
        int v106 = 24;
        int v107 = v106 + v105;
        int v108 = v53[v107];
        int v109 = 0;
        bool v110 = v108 != v109;
        v101 = v101;
        v102 = v102;
        if (!v110) break;
        int v111 = v101 + v102;
        int v112 = 1;
        int v113 = v102 + v112;
        bool v114 = true;
        v101 = v111;
        v102 = v113;
        break;
        ;
      }
      v83 = v101;
      break;
    }
    default:
      {
      int v115 = 44;
      int v116 = v115 + v54;
      int v117 = v53[v116];
      int v118 = 2;
      int v119 = v54 + v118;
      int v120;
      v120 = v119;
      switch (v117) {
        case 0:
          {
          int v121 = 1;
          v120 = v121;
          break;
        }
        default:
          {
          int v122 = 48;
          int v123 = v122 + v54;
          int v124 = v53[v123];
          int v125 = 0;
          bool v126 = v124 != v125;
          int v127;
          if (v126) {
            int v128 = 1;
            int v129 = v54 + v128;
            v127 = v129;
          } else {
            int v130 = 4;
            int v131 = v54 + v130;
            v127 = v131;
          }
          v120 = v127;
        }
        case 1:
          {
          v120 = v54;
          break;
        }
        case 2:
          {
          int v132 = 52;
          int v133 = v132 + v54;
          int v134 = v53[v133];
          int v135 = 0;
          bool v136 = v134 != v135;
          int v137;
          if (v136) {
            v137 = v54;
          } else {
            int v138 = 3;
            int v139 = v54 + v138;
            v137 = v139;
          }
          v120 = v137;
          break;
        }
      }
      v83 = v120;
      break;
    }
  }
  bool v140 = true;
  int v141 = 32;
  int v142 = v141 + v54;
  bool v143 = true;
  int v144 = simt_wave_count_bits(v143);
  v52[v142] = v144;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 56; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
