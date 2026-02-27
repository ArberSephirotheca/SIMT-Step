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
    bool v8 = v2 != v7;
    int v9;
    if (v8) {
      int v10 = 3;
      int v11 = v3 % v10;
      int v12;
      v12 = v0;
      switch (v11) {
        case 0:
          {
          int v13 = 2;
          int v14 = v0 + v13;
          v12 = v14;
          break;
        }
        case 1:
          {
          v12 = v0;
        }
        case 2:
          {
          v12 = v0;
          break;
        }
        default:
          {
          int v15 = 4;
          v12 = v15;
          break;
        }
      }
      v9 = v12;
    } else {
      bool v16 = true;
      int v17 = simt_wave_count_bits(v16);
      int v18 = 0;
      int v19 = v18 + v0;
      v1[v19] = v17;
      v9 = v17;
    }
    v6 = v9;
  } else {
    int v20 = 0;
    int v21 = 0;
    int v22;
    int v23;
    v22 = v20;
    v23 = v21;
    while (true) {
      int v24 = 4;
      int v25 = v3 % v24;
      int v26 = 1;
      int v27 = v25 + v26;
      bool v28 = v23 < v27;
      v22 = v22;
      v23 = v23;
      if (!v28) break;
      int v29 = 2;
      int v30 = v3 % v29;
      uint v31 = simt_lane_id(__simt_tid);
      int v32 = (int)(v31);
      int v33;
      v33 = v32;
      switch (v30) {
        default:
          {
          int v34 = 1;
          int v35 = v0 + v34;
          v33 = v35;
        }
        case 0:
          {
          v33 = v0;
          break;
        }
      }
      bool v36 = true;
      int v37 = simt_wave_count_bits(v36);
      int v38 = 16;
      int v39 = 4;
      int v40 = v23 * v39;
      int v41 = v38 + v40;
      int v42 = v41 + v0;
      v1[v42] = v37;
      int v43 = 1;
      int v44 = v23 + v43;
      v22 = v33;
      v23 = v44;
    }
    v6 = v22;
  }
  return;
}

kernel void kernel_main(device int* v45 [[buffer(0)]], device int* v46 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v47 = static_cast<int>(__simt_tid3.x);
  int v48 = 0;
  int v49 = v48 + v47;
  int v50 = v46[v49];
  int v51 = 4;
  int v52 = v51 + v47;
  int v53 = v46[v52];
  helper0(v47, v45, v50, v53, static_cast<int>(__simt_tid3.x));
  int v54 = 8;
  int v55 = v54 + v47;
  int v56 = v46[v55];
  uint v57 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v58 = (int)(v57);
  int v59;
  v59 = v58;
  switch (v56) {
    case 0:
      {
      int v60 = 12;
      int v61 = v60 + v47;
      int v62 = v46[v61];
      int v63 = 0;
      bool v64 = v62 != v63;
      int v65;
      if (v64) {
        int v66 = 16;
        int v67 = v66 + v47;
        int v68 = v46[v67];
        int v69 = 2;
        int v70 = v47 + v69;
        int v71;
        v71 = v70;
        switch (v68) {
          case 0:
            {
            int v72 = 2;
            v71 = v72;
          }
          default:
            {
            int v73 = 3;
            int v74 = v47 + v73;
            v71 = v74;
            break;
          }
          case 1:
            {
            int v75 = 4;
            int v76 = v47 + v75;
            v71 = v76;
            break;
          }
        }
        v65 = v71;
      } else {
        int v77 = 0;
        int v78 = 0;
        int v79;
        int v80;
        v79 = v77;
        v80 = v78;
        while (true) {
          int v81 = 4;
          int v82 = v80 * v81;
          int v83 = v82 + v47;
          int v84 = 20;
          int v85 = v84 + v83;
          int v86 = v46[v85];
          int v87 = 0;
          bool v88 = v86 != v87;
          v79 = v79;
          v80 = v80;
          if (!v88) break;
          int v89 = v79 + v80;
          int v90 = 1;
          int v91 = v80 + v90;
          bool v92 = true;
          v79 = v89;
          v80 = v91;
          continue;
          ;
        }
        v65 = v79;
      }
      v59 = v65;
    }
    default:
      {
      int v93 = 2;
      v59 = v93;
      break;
    }
  }
  int v94 = 40;
  int v95 = v94 + v47;
  int v96 = v46[v95];
  int v97 = 3;
  int v98;
  v98 = v97;
  switch (v96) {
    case 0:
      {
      int v99 = 44;
      int v100 = v99 + v47;
      int v101 = v46[v100];
      int v102;
      v102 = v47;
      switch (v101) {
        case 0:
          {
          int v103 = 2;
          int v104 = v47 + v103;
          v102 = v104;
          break;
        }
        default:
          {
          int v105 = 48;
          int v106 = v105 + v47;
          int v107 = v46[v106];
          int v108;
          v108 = v47;
          switch (v107) {
            case 0:
              {
              int v109 = 3;
              int v110 = v47 + v109;
              v108 = v110;
              break;
            }
            default:
              {
              int v111 = 1;
              v108 = v111;
              break;
            }
          }
          bool v112 = true;
          v102 = v108;
          break;
        }
      }
      v98 = v102;
      break;
    }
    default:
      {
      int v113 = 52;
      int v114 = v113 + v47;
      int v115 = v46[v114];
      int v116 = 0;
      bool v117 = v115 != v116;
      int v118;
      if (v117) {
        int v119 = 0;
        int v120 = 0;
        int v121;
        int v122;
        v121 = v119;
        v122 = v120;
        while (true) {
          int v123 = 4;
          int v124 = v122 * v123;
          int v125 = v124 + v47;
          int v126 = 56;
          int v127 = v126 + v125;
          int v128 = v46[v127];
          int v129 = 0;
          bool v130 = v128 != v129;
          v121 = v121;
          v122 = v122;
          if (!v130) break;
          int v131 = v121 + v122;
          int v132 = 1;
          int v133 = v122 + v132;
          bool v134 = true;
          v121 = v131;
          v122 = v133;
        }
        v118 = v121;
      } else {
        int v135 = 0;
        int v136 = 0;
        int v137;
        int v138;
        v137 = v135;
        v138 = v136;
        while (true) {
          int v139 = 4;
          int v140 = v138 * v139;
          int v141 = v140 + v47;
          int v142 = 76;
          int v143 = v142 + v141;
          int v144 = v46[v143];
          int v145 = 0;
          bool v146 = v144 != v145;
          v137 = v137;
          v138 = v138;
          if (!v146) break;
          int v147 = v137 + v138;
          int v148 = 1;
          int v149 = v138 + v148;
          bool v150 = true;
          v137 = v147;
          v138 = v149;
        }
        v118 = v137;
      }
      v98 = v118;
      break;
    }
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 28; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 96; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
