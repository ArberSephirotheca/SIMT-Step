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
  int v6;
  v6 = v0;
  switch (v5) {
    case 0:
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
        int v16 = 3;
        int v17 = v0 + v16;
        int v18 = 1;
        int v19 = v10 + v18;
        v9 = v17;
        v10 = v19;
      }
      int v20 = 0;
      int v21 = v0 + v20;
      v6 = v9;
      break;
    }
    default:
      {
      int v22 = 0;
      int v23 = 0;
      int v24;
      int v25;
      v24 = v22;
      v25 = v23;
      while (true) {
        int v26 = 4;
        int v27 = v3 % v26;
        int v28 = 1;
        int v29 = v27 + v28;
        bool v30 = v25 < v29;
        v24 = v24;
        v25 = v25;
        if (!v30) break;
        int v31 = 2;
        int v32 = 1;
        int v33 = v25 + v32;
        v24 = v31;
        v25 = v33;
      }
      v6 = v24;
      break;
    }
    case 1:
      {
      int v34 = 3;
      int v35 = v3 % v34;
      int v36 = 2;
      int v37 = v0 + v36;
      int v38;
      v38 = v37;
      switch (v35) {
        case 0:
          {
          int v39 = 1;
          int v40 = v0 + v39;
          v38 = v40;
        }
        case 1:
          {
          int v41 = 0;
          bool v42 = v2 != v41;
          int v43;
          if (v42) {
            int v44 = 2;
            v43 = v44;
          } else {
            int v45 = 1;
            int v46 = v0 + v45;
            v43 = v46;
          }
          int v47 = 0;
          v38 = v43;
        }
        default:
          {
          int v48 = 0;
          int v49 = 0;
          int v50;
          int v51;
          v50 = v48;
          v51 = v49;
          while (true) {
            int v52 = 4;
            int v53 = v3 % v52;
            int v54 = 1;
            int v55 = v53 + v54;
            bool v56 = v51 < v55;
            v50 = v50;
            v51 = v51;
            if (!v56) break;
            int v57 = 1;
            int v58 = v51 + v57;
            v50 = v0;
            v51 = v58;
            break;
            ;
          }
          int v59 = 4;
          v38 = v50;
          break;
        }
        case 2:
          {
          int v60 = 0;
          bool v61 = v2 != v60;
          int v62;
          if (v61) {
            int v63 = 4;
            int v64 = v0 + v63;
            v62 = v64;
          } else {
            int v65 = 1;
            int v66 = v0 + v65;
            v62 = v66;
          }
          v38 = v62;
          break;
        }
      }
      int v67 = 1;
      int v68 = v0 + v67;
      v6 = v38;
      break;
    }
    case 2:
      {
      int v69 = 0;
      bool v70 = v2 != v69;
      int v71;
      if (v70) {
        int v72 = 0;
        bool v73 = v2 != v72;
        int v74;
        if (v73) {
          int v75 = 4;
          v74 = v75;
        } else {
          int v76 = 4;
          v74 = v76;
        }
        int v77 = 2;
        int v78 = v0 + v77;
        v71 = v74;
      } else {
        int v79 = 4;
        int v80 = v3 % v79;
        int v81 = 0;
        int v82 = v0 + v81;
        int v83;
        v83 = v82;
        switch (v80) {
          case 0:
            {
            int v84 = 1;
            int v85 = v0 + v84;
            v83 = v85;
            break;
          }
          case 1:
            {
            v83 = v0;
          }
          case 2:
            {
            int v86 = 4;
            int v87 = v0 + v86;
            v83 = v87;
            break;
          }
          default:
            {
            int v88 = 0;
            int v89 = v0 + v88;
            v83 = v89;
            break;
          }
        }
        int v90 = 0;
        int v91 = v0 + v90;
        v71 = v83;
      }
      v6 = v71;
      break;
    }
  }
  bool v92 = true;
  int v93 = simt_wave_count_bits(v92);
  int v94 = 0;
  int v95 = v94 + v0;
  v1[v95] = v93;
  return;
}

kernel void kernel_main(device int* v96 [[buffer(0)]], device int* v97 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v98 = static_cast<int>(__simt_tid3.x);
  int v99 = 0;
  int v100 = v99 + v98;
  int v101 = v97[v100];
  int v102 = 4;
  int v103 = v102 + v98;
  int v104 = v97[v103];
  helper0(v98, v96, v101, v104, static_cast<int>(__simt_tid3.x));
  int v105 = 2;
  uint v106 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v107 = (int)(v106);
  int v108 = 0;
  int v109 = 0;
  int v110;
  int v111;
  v110 = v108;
  v111 = v109;
  while (true) {
    int v112 = 4;
    int v113 = v111 * v112;
    int v114 = v113 + v98;
    int v115 = 8;
    int v116 = v115 + v114;
    int v117 = v97[v116];
    int v118 = 0;
    bool v119 = v117 != v118;
    v110 = v110;
    v111 = v111;
    if (!v119) break;
    int v120 = 28;
    int v121 = v120 + v98;
    int v122 = v97[v121];
    int v123 = 0;
    bool v124 = v122 != v123;
    int v125;
    if (v124) {
      int v126 = 32;
      int v127 = v126 + v98;
      int v128 = v97[v127];
      int v129 = 0;
      bool v130 = v128 != v129;
      int v131;
      if (v130) {
        int v132 = 4;
        int v133 = v98 + v132;
        v131 = v133;
      } else {
        uint v134 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v135 = (int)(v134);
        v131 = v135;
      }
      v125 = v131;
    } else {
      int v136 = 36;
      int v137 = v136 + v98;
      int v138 = v97[v137];
      int v139 = 0;
      bool v140 = v138 != v139;
      int v141;
      if (v140) {
        uint v142 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v143 = (int)(v142);
        v141 = v143;
      } else {
        int v144 = 0;
        int v145 = v98 + v144;
        v141 = v145;
      }
      v125 = v141;
    }
    int v146 = v110 + v125;
    int v147 = 1;
    int v148 = v111 + v147;
    v110 = v146;
    v111 = v148;
  }
  bool v149 = true;
  int v150 = 16;
  int v151 = v150 + v98;
  bool v152 = true;
  int v153 = simt_wave_count_bits(v152);
  v96[v151] = v153;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 40; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
