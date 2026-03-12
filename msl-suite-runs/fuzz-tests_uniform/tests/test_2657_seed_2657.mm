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
    int v9 = 0;
    bool v10 = v2 != v9;
    int v11;
    if (v10) {
      int v12 = 1;
      v11 = v12;
    } else {
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
        uint v22 = simt_lane_id(__simt_tid);
        int v23 = (int)(v22);
        int v24 = 1;
        int v25 = v16 + v24;
        v15 = v23;
        v16 = v25;
      }
      int v26 = 0;
      v11 = v15;
    }
    uint v27 = simt_subgroup_id(__simt_tid);
    int v28 = (int)(v27);
    v8 = v11;
  } else {
    int v29 = 0;
    bool v30 = v2 != v29;
    int v31;
    if (v30) {
      int v32 = 4;
      v31 = v32;
    } else {
      int v33 = 2;
      int v34 = v3 % v33;
      int v35 = 0;
      int v36;
      v36 = v35;
      switch (v34) {
        default:
          {
          int v37 = 4;
          int v38 = v0 + v37;
          v36 = v38;
          break;
        }
        case 0:
          {
          v36 = v0;
        }
        case 1:
          {
          v36 = v0;
          break;
        }
      }
      uint v39 = simt_lane_id(__simt_tid);
      int v40 = (int)(v39);
      v31 = v36;
    }
    uint v41 = simt_subgroup_id(__simt_tid);
    int v42 = (int)(v41);
    v8 = v31;
  }
  bool v43 = true;
  int v44 = simt_wave_count_bits(v43);
  int v45 = 0;
  int v46 = v45 + v0;
  v1[v46] = v44;
  int v47 = 0;
  bool v48 = v2 != v47;
  int v49 = v48 ? v5 : v8;
  return;
}

kernel void kernel_main(device int* v50 [[buffer(0)]], device int* v51 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v52 = static_cast<int>(__simt_tid3.x);
  int v53 = 0;
  int v54 = v53 + v52;
  int v55 = v51[v54];
  int v56 = 4;
  int v57 = v56 + v52;
  int v58 = v51[v57];
  helper0(v52, v50, v55, v58, static_cast<int>(__simt_tid3.x));
  uint v59 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v60 = (int)(v59);
  int v61 = 8;
  int v62 = v61 + v52;
  int v63 = v51[v62];
  int v64 = 3;
  int v65;
  v65 = v64;
  switch (v63) {
    case 0:
      {
      int v66 = 4;
      int v67 = v52 + v66;
      v65 = v67;
    }
    default:
      {
      int v68 = 12;
      int v69 = v68 + v52;
      int v70 = v51[v69];
      int v71 = 4;
      int v72 = v52 + v71;
      int v73;
      v73 = v72;
      switch (v70) {
        case 0:
          {
          int v74 = 16;
          int v75 = v74 + v52;
          int v76 = v51[v75];
          int v77;
          v77 = v52;
          switch (v76) {
            case 0:
              {
              v77 = v52;
              break;
            }
            default:
              {
              int v78 = 3;
              v77 = v78;
              break;
            }
          }
          bool v79 = true;
          v73 = v77;
          break;
        }
        default:
          {
          int v80 = 20;
          int v81 = v80 + v52;
          int v82 = v51[v81];
          int v83 = 1;
          int v84;
          v84 = v83;
          switch (v82) {
            default:
              {
              int v85 = 3;
              int v86 = v52 + v85;
              v84 = v86;
            }
            case 0:
              {
              v84 = v52;
              break;
            }
          }
          bool v87 = true;
          v73 = v84;
          break;
        }
        case 1:
          {
          int v88 = 24;
          int v89 = v88 + v52;
          int v90 = v51[v89];
          int v91 = 0;
          bool v92 = v90 != v91;
          int v93;
          if (v92) {
            int v94 = 4;
            v93 = v94;
          } else {
            v93 = v52;
          }
          v73 = v93;
          break;
        }
      }
      bool v95 = true;
      v65 = v73;
    }
    case 1:
      {
      int v96 = 28;
      int v97 = v96 + v52;
      int v98 = v51[v97];
      int v99 = 0;
      bool v100 = v98 != v99;
      int v101;
      if (v100) {
        int v102 = 32;
        int v103 = v102 + v52;
        int v104 = v51[v103];
        int v105 = 0;
        bool v106 = v104 != v105;
        int v107;
        if (v106) {
          int v108 = 0;
          v107 = v108;
        } else {
          int v109 = 4;
          v107 = v109;
        }
        v101 = v107;
      } else {
        int v110 = 36;
        int v111 = v110 + v52;
        int v112 = v51[v111];
        int v113 = 1;
        int v114;
        v114 = v113;
        switch (v112) {
          default:
            {
            int v115 = 3;
            v114 = v115;
            break;
          }
          case 0:
            {
            int v116 = 3;
            int v117 = v52 + v116;
            v114 = v117;
            break;
          }
        }
        bool v118 = true;
        v101 = v114;
      }
      v65 = v101;
    }
    case 2:
      {
      int v119 = 40;
      int v120 = v119 + v52;
      int v121 = v51[v120];
      int v122 = 0;
      bool v123 = v121 != v122;
      int v124;
      if (v123) {
        int v125 = 44;
        int v126 = v125 + v52;
        int v127 = v51[v126];
        int v128 = 1;
        int v129;
        v129 = v128;
        switch (v127) {
          default:
            {
            int v130 = 3;
            v129 = v130;
            break;
          }
          case 0:
            {
            int v131 = 0;
            int v132 = v52 + v131;
            v129 = v132;
          }
          case 1:
            {
            int v133 = 0;
            v129 = v133;
            break;
          }
        }
        bool v134 = true;
        v124 = v129;
      } else {
        int v135 = 48;
        int v136 = v135 + v52;
        int v137 = v51[v136];
        int v138 = 0;
        bool v139 = v137 != v138;
        int v140;
        if (v139) {
          v140 = v52;
        } else {
          int v141 = 0;
          int v142 = v52 + v141;
          v140 = v142;
        }
        v124 = v140;
      }
      v65 = v124;
      break;
    }
  }
  bool v143 = true;
  int v144 = 16;
  int v145 = v144 + v52;
  bool v146 = true;
  int v147 = simt_wave_count_bits(v146);
  v50[v145] = v147;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 52; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
