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
      int v16 = 3;
      int v17 = v3 % v16;
      uint v18 = simt_lane_id(__simt_tid);
      int v19 = (int)(v18);
      int v20;
      v20 = v19;
      switch (v17) {
        default:
          {
          int v21 = 1;
          v20 = v21;
          break;
        }
        case 0:
          {
          int v22 = 1;
          v20 = v22;
          break;
        }
        case 1:
          {
          int v23 = 1;
          int v24 = v0 + v23;
          v20 = v24;
          break;
        }
        case 2:
          {
          int v25 = 2;
          v20 = v25;
          break;
        }
      }
      int v26 = 1;
      int v27 = v0 + v26;
      int v28 = 1;
      int v29 = v10 + v28;
      v9 = v20;
      v10 = v29;
      continue;
      ;
    }
    uint v30 = simt_lane_id(__simt_tid);
    int v31 = (int)(v30);
    v6 = v9;
  } else {
    uint v32 = simt_subgroup_id(__simt_tid);
    int v33 = (int)(v32);
    v6 = v33;
  }
  bool v34 = true;
  int v35 = simt_wave_count_bits(v34);
  int v36 = 0;
  int v37 = v36 + v0;
  v1[v37] = v35;
  return;
}

kernel void kernel_main(device int* v38 [[buffer(0)]], device int* v39 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v40 = static_cast<int>(__simt_tid3.x);
  int v41 = 0;
  int v42 = v41 + v40;
  int v43 = v39[v42];
  int v44 = 4;
  int v45 = v44 + v40;
  int v46 = v39[v45];
  helper0(v40, v38, v43, v46, static_cast<int>(__simt_tid3.x));
  int v47 = 0;
  int v48 = 0;
  int v49;
  int v50;
  v49 = v47;
  v50 = v48;
  while (true) {
    int v51 = 4;
    int v52 = v50 * v51;
    int v53 = v52 + v40;
    int v54 = 8;
    int v55 = v54 + v53;
    int v56 = v39[v55];
    int v57 = 0;
    bool v58 = v56 != v57;
    v49 = v49;
    v50 = v50;
    if (!v58) break;
    int v59 = 28;
    int v60 = v59 + v40;
    int v61 = v39[v60];
    int v62;
    v62 = v40;
    switch (v61) {
      default:
        {
        int v63 = 0;
        int v64 = 0;
        int v65;
        int v66;
        v65 = v63;
        v66 = v64;
        while (true) {
          int v67 = 4;
          int v68 = v66 * v67;
          int v69 = v68 + v40;
          int v70 = 32;
          int v71 = v70 + v69;
          int v72 = v39[v71];
          int v73 = 0;
          bool v74 = v72 != v73;
          v65 = v65;
          v66 = v66;
          if (!v74) break;
          int v75 = v65 + v66;
          int v76 = 1;
          int v77 = v66 + v76;
          v65 = v75;
          v66 = v77;
        }
        bool v78 = true;
        v62 = v65;
        break;
      }
      case 0:
        {
        int v79 = 52;
        int v80 = v79 + v40;
        int v81 = v39[v80];
        int v82 = 3;
        int v83;
        v83 = v82;
        switch (v81) {
          case 0:
            {
            int v84 = 2;
            v83 = v84;
          }
          default:
            {
            int v85 = 1;
            int v86 = v40 + v85;
            v83 = v86;
          }
          case 1:
            {
            int v87 = 2;
            v83 = v87;
            break;
          }
          case 2:
            {
            int v88 = 2;
            int v89 = v40 + v88;
            v83 = v89;
            break;
          }
        }
        bool v90 = true;
        v62 = v83;
        break;
      }
      case 1:
        {
        int v91 = 56;
        int v92 = v91 + v40;
        int v93 = v39[v92];
        int v94 = 0;
        bool v95 = v93 != v94;
        int v96;
        if (v95) {
          int v97 = 0;
          int v98 = v40 + v97;
          v96 = v98;
        } else {
          v96 = v40;
        }
        v62 = v96;
        break;
      }
    }
    bool v99 = true;
    int v100 = v49 + v62;
    int v101 = 1;
    int v102 = v50 + v101;
    v49 = v100;
    v50 = v102;
  }
  bool v103 = true;
  int v104 = 16;
  int v105 = v104 + v40;
  bool v106 = true;
  int v107 = simt_wave_count_bits(v106);
  v38[v105] = v107;
  uint v108 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v109 = (int)(v108);
  int v110 = 60;
  int v111 = v110 + v40;
  int v112 = v39[v111];
  int v113 = 0;
  bool v114 = v112 != v113;
  int v115;
  if (v114) {
    v115 = v40;
  } else {
    int v116 = 64;
    int v117 = v116 + v40;
    int v118 = v39[v117];
    int v119 = 0;
    bool v120 = v118 != v119;
    int v121;
    if (v120) {
      int v122 = 0;
      int v123 = 0;
      int v124;
      int v125;
      v124 = v122;
      v125 = v123;
      while (true) {
        int v126 = 4;
        int v127 = v125 * v126;
        int v128 = v127 + v40;
        int v129 = 68;
        int v130 = v129 + v128;
        int v131 = v39[v130];
        int v132 = 0;
        bool v133 = v131 != v132;
        v124 = v124;
        v125 = v125;
        if (!v133) break;
        int v134 = v124 + v125;
        int v135 = 1;
        int v136 = v125 + v135;
        v124 = v134;
        v125 = v136;
      }
      bool v137 = true;
      v121 = v124;
    } else {
      int v138 = 0;
      int v139 = 0;
      int v140;
      int v141;
      v140 = v138;
      v141 = v139;
      while (true) {
        int v142 = 4;
        int v143 = v141 * v142;
        int v144 = v143 + v40;
        int v145 = 88;
        int v146 = v145 + v144;
        int v147 = v39[v146];
        int v148 = 0;
        bool v149 = v147 != v148;
        v140 = v140;
        v141 = v141;
        if (!v149) break;
        int v150 = v140 + v141;
        int v151 = 1;
        int v152 = v141 + v151;
        v140 = v150;
        v141 = v152;
      }
      bool v153 = true;
      v121 = v140;
    }
    v115 = v121;
  }
  int v154 = 32;
  int v155 = v154 + v40;
  bool v156 = true;
  int v157 = simt_wave_count_bits(v156);
  v38[v155] = v157;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 108; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
