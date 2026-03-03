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
  int v4 = 4;
  int v5 = v3 % v4;
  uint v6 = simt_lane_id(__simt_tid);
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
        int v18 = 0;
        bool v19 = v2 != v18;
        int v20;
        if (v19) {
          v20 = v0;
        } else {
          int v21 = 0;
          int v22 = v0 + v21;
          v20 = v22;
        }
        int v23 = 2;
        int v24 = 1;
        int v25 = v12 + v24;
        v11 = v20;
        v12 = v25;
        continue;
        ;
      }
      int v26 = 3;
      v8 = v11;
    }
    default:
      {
      int v27 = 0;
      int v28 = 0;
      int v29;
      int v30;
      v29 = v27;
      v30 = v28;
      while (true) {
        int v31 = 4;
        int v32 = v3 % v31;
        int v33 = 1;
        int v34 = v32 + v33;
        bool v35 = v30 < v34;
        v29 = v29;
        v30 = v30;
        if (!v35) break;
        int v36;
        v36 = v0;
        switch (v3) {
          case 0:
            {
            v36 = v0;
            break;
          }
          default:
            {
            v36 = v0;
            break;
          }
        }
        int v37 = 2;
        int v38 = 1;
        int v39 = v30 + v38;
        v29 = v36;
        v30 = v39;
      }
      int v40 = 4;
      v8 = v29;
      break;
    }
    case 1:
      {
      int v41 = 3;
      int v42 = v3 % v41;
      int v43 = 2;
      int v44;
      v44 = v43;
      switch (v42) {
        default:
          {
          int v45 = 0;
          bool v46 = v2 != v45;
          int v47;
          if (v46) {
            int v48 = 0;
            v47 = v48;
          } else {
            int v49 = 1;
            v47 = v49;
          }
          int v50 = 2;
          int v51 = v0 + v50;
          v44 = v47;
          break;
        }
        case 0:
          {
          int v52 = 3;
          int v53 = v0 + v52;
          v44 = v53;
        }
        case 1:
          {
          v44 = v0;
          break;
        }
      }
      v8 = v44;
    }
    case 2:
      {
      v8 = v0;
      break;
    }
  }
  bool v54 = true;
  int v55 = simt_wave_count_bits(v54);
  int v56 = 0;
  int v57 = v56 + v0;
  v1[v57] = v55;
  return;
}

kernel void kernel_main(device int* v58 [[buffer(0)]], device int* v59 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v60 = static_cast<int>(__simt_tid3.x);
  int v61 = 0;
  int v62 = v61 + v60;
  int v63 = v59[v62];
  int v64 = 4;
  int v65 = v64 + v60;
  int v66 = v59[v65];
  helper0(v60, v58, v63, v66, static_cast<int>(__simt_tid3.x));
  int v67 = 8;
  int v68 = v67 + v60;
  int v69 = v59[v68];
  uint v70 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v71 = (int)(v70);
  int v72;
  v72 = v71;
  switch (v69) {
    default:
      {
      int v73 = 4;
      v72 = v73;
      break;
    }
    case 0:
      {
      int v74 = 0;
      int v75 = 0;
      int v76;
      int v77;
      v76 = v74;
      v77 = v75;
      while (true) {
        int v78 = 4;
        int v79 = v77 * v78;
        int v80 = v79 + v60;
        int v81 = 12;
        int v82 = v81 + v80;
        int v83 = v59[v82];
        int v84 = 0;
        bool v85 = v83 != v84;
        v76 = v76;
        v77 = v77;
        if (!v85) break;
        int v86 = v76 + v77;
        int v87 = 1;
        int v88 = v77 + v87;
        v76 = v86;
        v77 = v88;
      }
      bool v89 = true;
      v72 = v76;
      break;
    }
    case 1:
      {
      int v90 = 32;
      int v91 = v90 + v60;
      int v92 = v59[v91];
      int v93;
      v93 = v60;
      switch (v92) {
        case 0:
          {
          v93 = v60;
          break;
        }
        case 1:
          {
          int v94 = 3;
          int v95 = v60 + v94;
          v93 = v95;
          break;
        }
        case 2:
          {
          int v96 = 1;
          int v97 = v60 + v96;
          v93 = v97;
          break;
        }
        default:
          {
          v93 = v60;
          break;
        }
      }
      bool v98 = true;
      v72 = v93;
      break;
    }
  }
  bool v99 = true;
  int v100 = 16;
  int v101 = v100 + v60;
  bool v102 = true;
  int v103 = simt_wave_count_bits(v102);
  v58[v101] = v103;
  int v104 = 0;
  int v105 = 0;
  int v106;
  int v107;
  v106 = v104;
  v107 = v105;
  while (true) {
    int v108 = 4;
    int v109 = v107 * v108;
    int v110 = v109 + v60;
    int v111 = 36;
    int v112 = v111 + v110;
    int v113 = v59[v112];
    int v114 = 0;
    bool v115 = v113 != v114;
    v106 = v106;
    v107 = v107;
    if (!v115) break;
    int v116 = 0;
    int v117 = 0;
    int v118;
    int v119;
    v118 = v116;
    v119 = v117;
    while (true) {
      int v120 = 4;
      int v121 = v119 * v120;
      int v122 = v121 + v60;
      int v123 = 56;
      int v124 = v123 + v122;
      int v125 = v59[v124];
      int v126 = 0;
      bool v127 = v125 != v126;
      v118 = v118;
      v119 = v119;
      if (!v127) break;
      int v128 = 76;
      int v129 = v128 + v60;
      int v130 = v59[v129];
      int v131 = 1;
      int v132 = v60 + v131;
      int v133;
      v133 = v132;
      switch (v130) {
        case 0:
          {
          int v134 = 2;
          int v135 = v60 + v134;
          v133 = v135;
          break;
        }
        case 1:
          {
          v133 = v60;
          break;
        }
        case 2:
          {
          int v136 = 4;
          v133 = v136;
          break;
        }
        default:
          {
          int v137 = 4;
          int v138 = v60 + v137;
          v133 = v138;
          break;
        }
      }
      bool v139 = true;
      int v140 = v118 + v133;
      int v141 = 1;
      int v142 = v119 + v141;
      v118 = v140;
      v119 = v142;
      continue;
      ;
    }
    bool v143 = true;
    int v144 = v106 + v118;
    int v145 = 1;
    int v146 = v107 + v145;
    v106 = v144;
    v107 = v146;
  }
  bool v147 = true;
  int v148 = 32;
  int v149 = v148 + v60;
  bool v150 = true;
  int v151 = simt_wave_count_bits(v150);
  v58[v149] = v151;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 80; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
