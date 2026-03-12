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
  bool v7 = v2 != v6;
  int v8;
  if (v7) {
    v8 = v0;
  } else {
    uint v9 = simt_subgroup_id(__simt_tid);
    int v10 = (int)(v9);
    v8 = v10;
  }
  bool v11 = true;
  int v12 = simt_wave_count_bits(v11);
  int v13 = 0;
  int v14 = v13 + v0;
  v1[v14] = v12;
  int v15 = 0;
  bool v16 = v2 != v15;
  int v17 = v16 ? v5 : v8;
  int v18 = 4;
  int v19 = v3 % v18;
  uint v20 = simt_lane_id(__simt_tid);
  int v21 = (int)(v20);
  int v22;
  v22 = v21;
  switch (v19) {
    default:
      {
      int v23 = 0;
      bool v24 = v2 != v23;
      int v25;
      if (v24) {
        int v26 = 4;
        v25 = v26;
      } else {
        v25 = v0;
      }
      v22 = v25;
      break;
    }
    case 0:
      {
      int v27 = 0;
      bool v28 = v2 != v27;
      int v29;
      if (v28) {
        v29 = v0;
      } else {
        int v30 = 2;
        int v31 = v0 + v30;
        v29 = v31;
      }
      int v32 = 3;
      int v33 = v0 + v32;
      v22 = v29;
      break;
    }
    case 1:
      {
      int v34 = 0;
      int v35 = 0;
      int v36;
      int v37;
      v36 = v34;
      v37 = v35;
      while (true) {
        int v38 = 4;
        int v39 = v3 % v38;
        int v40 = 1;
        int v41 = v39 + v40;
        bool v42 = v37 < v41;
        v36 = v36;
        v37 = v37;
        if (!v42) break;
        int v43 = 1;
        int v44 = v37 + v43;
        v36 = v0;
        v37 = v44;
        continue;
        ;
      }
      int v45 = 4;
      int v46 = v0 + v45;
      v22 = v36;
      break;
    }
    case 2:
      {
      int v47 = 2;
      int v48 = v3 % v47;
      int v49 = 0;
      int v50 = v0 + v49;
      int v51;
      v51 = v50;
      switch (v48) {
        case 0:
          {
          int v52 = 0;
          int v53 = 0;
          int v54;
          int v55;
          v54 = v52;
          v55 = v53;
          while (true) {
            int v56 = 4;
            int v57 = v3 % v56;
            int v58 = 1;
            int v59 = v57 + v58;
            bool v60 = v55 < v59;
            v54 = v54;
            v55 = v55;
            if (!v60) break;
            int v61 = 4;
            int v62 = v0 + v61;
            int v63 = 1;
            int v64 = v55 + v63;
            v54 = v62;
            v55 = v64;
            continue;
            ;
          }
          int v65 = 0;
          v51 = v54;
          break;
        }
        default:
          {
          int v66 = 3;
          int v67 = v3 % v66;
          int v68 = 3;
          int v69 = v0 + v68;
          int v70;
          v70 = v69;
          switch (v67) {
            default:
              {
              v70 = v0;
              break;
            }
            case 0:
              {
              int v71 = 4;
              v70 = v71;
              break;
            }
            case 1:
              {
              v70 = v0;
              break;
            }
          }
          int v72 = 2;
          v51 = v70;
          break;
        }
      }
      int v73 = 3;
      v22 = v51;
      break;
    }
  }
  bool v74 = true;
  int v75 = simt_wave_count_bits(v74);
  int v76 = 16;
  int v77 = v76 + v0;
  v1[v77] = v75;
  int v78 = 0;
  bool v79 = v2 != v78;
  int v80 = v79 ? v17 : v22;
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
  uint v90 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v91 = (int)(v90);
  int v92 = 8;
  int v93 = v92 + v83;
  int v94 = v82[v93];
  uint v95 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v96 = (int)(v95);
  int v97;
  v97 = v96;
  switch (v94) {
    case 0:
      {
      int v98 = 1;
      v97 = v98;
      break;
    }
    default:
      {
      int v99 = 4;
      v97 = v99;
      break;
    }
  }
  bool v100 = true;
  int v101 = 32;
  int v102 = v101 + v83;
  bool v103 = true;
  int v104 = simt_wave_count_bits(v103);
  v81[v102] = v104;
  int v105 = 12;
  int v106 = v105 + v83;
  int v107 = v82[v106];
  int v108 = 0;
  bool v109 = v107 != v108;
  int v110;
  if (v109) {
    int v111 = 16;
    int v112 = v111 + v83;
    int v113 = v82[v112];
    int v114 = 0;
    bool v115 = v113 != v114;
    int v116;
    if (v115) {
      int v117 = 20;
      int v118 = v117 + v83;
      int v119 = v82[v118];
      int v120;
      v120 = v83;
      switch (v119) {
        case 0:
          {
          int v121 = 4;
          v120 = v121;
          break;
        }
        default:
          {
          int v122 = 1;
          v120 = v122;
        }
        case 1:
          {
          v120 = v83;
          break;
        }
        case 2:
          {
          int v123 = 4;
          v120 = v123;
          break;
        }
      }
      bool v124 = true;
      v116 = v120;
    } else {
      int v125 = 2;
      int v126 = v83 + v125;
      v116 = v126;
    }
    v110 = v116;
  } else {
    int v127 = 24;
    int v128 = v127 + v83;
    int v129 = v82[v128];
    int v130 = 0;
    bool v131 = v129 != v130;
    int v132;
    if (v131) {
      int v133 = 28;
      int v134 = v133 + v83;
      int v135 = v82[v134];
      int v136 = 0;
      bool v137 = v135 != v136;
      int v138;
      if (v137) {
        int v139 = 1;
        int v140 = v83 + v139;
        v138 = v140;
      } else {
        uint v141 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v142 = (int)(v141);
        v138 = v142;
      }
      v132 = v138;
    } else {
      int v143 = 32;
      int v144 = v143 + v83;
      int v145 = v82[v144];
      int v146 = 0;
      bool v147 = v145 != v146;
      int v148;
      if (v147) {
        int v149 = 3;
        int v150 = v83 + v149;
        v148 = v150;
      } else {
        v148 = v83;
      }
      v132 = v148;
    }
    v110 = v132;
  }
  int v151 = 48;
  int v152 = v151 + v83;
  bool v153 = true;
  int v154 = simt_wave_count_bits(v153);
  v81[v152] = v154;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 52; ++idx) {
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
