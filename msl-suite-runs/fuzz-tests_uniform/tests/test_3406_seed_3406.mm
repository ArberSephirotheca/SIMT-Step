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
  int v5 = 4;
  int v6 = v3 % v5;
  int v7 = 4;
  int v8 = v0 + v7;
  int v9;
  v9 = v8;
  switch (v6) {
    default:
      {
      int v10 = 2;
      int v11 = v3 % v10;
      int v12 = 0;
      int v13;
      v13 = v12;
      switch (v11) {
        case 0:
          {
          int v14 = 0;
          int v15 = 0;
          int v16;
          int v17;
          v16 = v14;
          v17 = v15;
          while (true) {
            int v18 = 4;
            int v19 = v3 % v18;
            int v20 = 1;
            int v21 = v19 + v20;
            bool v22 = v17 < v21;
            v16 = v16;
            v17 = v17;
            if (!v22) break;
            int v23 = 0;
            int v24 = 1;
            int v25 = v17 + v24;
            v16 = v23;
            v17 = v25;
          }
          int v26 = 2;
          v13 = v16;
          break;
        }
        default:
          {
          v13 = v0;
          break;
        }
      }
      int v27 = 0;
      v9 = v13;
      break;
    }
    case 0:
      {
      int v28 = 4;
      int v29 = v3 % v28;
      int v30 = 3;
      int v31;
      v31 = v30;
      switch (v29) {
        default:
          {
          int v32 = 0;
          bool v33 = v2 != v32;
          int v34;
          if (v33) {
            int v35 = 1;
            v34 = v35;
          } else {
            v34 = v0;
          }
          int v36 = 3;
          v31 = v34;
          break;
        }
        case 0:
          {
          int v37 = 0;
          bool v38 = v2 != v37;
          int v39;
          if (v38) {
            v39 = v0;
          } else {
            v39 = v0;
          }
          int v40 = 3;
          int v41 = v0 + v40;
          v31 = v39;
          break;
        }
        case 1:
          {
          int v42 = 1;
          int v43 = v0 + v42;
          int v44;
          v44 = v43;
          switch (v3) {
            case 0:
              {
              v44 = v0;
              break;
            }
            default:
              {
              v44 = v0;
              break;
            }
          }
          v31 = v44;
          break;
        }
        case 2:
          {
          int v45 = 0;
          bool v46 = v2 != v45;
          int v47;
          if (v46) {
            v47 = v0;
          } else {
            int v48 = 2;
            int v49 = v0 + v48;
            v47 = v49;
          }
          v31 = v47;
          break;
        }
      }
      v9 = v31;
      break;
    }
    case 1:
      {
      int v50 = 3;
      int v51 = v3 % v50;
      int v52 = 4;
      int v53 = v0 + v52;
      int v54;
      v54 = v53;
      switch (v51) {
        case 0:
          {
          int v55 = 0;
          bool v56 = v2 != v55;
          int v57;
          if (v56) {
            v57 = v0;
          } else {
            int v58 = 0;
            int v59 = v0 + v58;
            v57 = v59;
          }
          int v60 = 1;
          int v61 = v0 + v60;
          v54 = v57;
          break;
        }
        case 1:
          {
          int v62 = 0;
          bool v63 = v2 != v62;
          int v64;
          if (v63) {
            int v65 = 2;
            v64 = v65;
          } else {
            int v66 = 3;
            int v67 = v0 + v66;
            v64 = v67;
          }
          int v68 = 1;
          int v69 = v0 + v68;
          v54 = v64;
          break;
        }
        default:
          {
          int v70 = 4;
          int v71 = v3 % v70;
          int v72;
          v72 = v0;
          switch (v71) {
            case 0:
              {
              int v73 = 1;
              int v74 = v0 + v73;
              v72 = v74;
            }
            case 1:
              {
              int v75 = 3;
              int v76 = v0 + v75;
              v72 = v76;
              break;
            }
            case 2:
              {
              int v77 = 1;
              int v78 = v0 + v77;
              v72 = v78;
              break;
            }
            default:
              {
              v72 = v0;
              break;
            }
          }
          v54 = v72;
          break;
        }
      }
      int v79 = 1;
      int v80 = v0 + v79;
      v9 = v54;
      break;
    }
    case 2:
      {
      int v81 = 0;
      bool v82 = v2 != v81;
      int v83;
      if (v82) {
        int v84 = 2;
        int v85 = v3 % v84;
        int v86 = 3;
        int v87;
        v87 = v86;
        switch (v85) {
          case 0:
            {
            v87 = v0;
            break;
          }
          default:
            {
            v87 = v0;
            break;
          }
          case 1:
            {
            int v88 = 2;
            v87 = v88;
            break;
          }
        }
        v83 = v87;
      } else {
        int v89 = 1;
        int v90 = v0 + v89;
        v83 = v90;
      }
      v9 = v83;
      break;
    }
  }
  bool v91 = true;
  int v92 = simt_wave_count_bits(v91);
  int v93 = 0;
  int v94 = v93 + v0;
  v1[v94] = v92;
  int v95 = 0;
  bool v96 = v2 != v95;
  int v97 = v96 ? v4 : v9;
  return;
}

kernel void kernel_main(device int* v98 [[buffer(0)]], device int* v99 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v100 = static_cast<int>(__simt_tid3.x);
  int v101 = 0;
  int v102 = v101 + v100;
  int v103 = v99[v102];
  int v104 = 4;
  int v105 = v104 + v100;
  int v106 = v99[v105];
  helper0(v100, v98, v103, v106, static_cast<int>(__simt_tid3.x));
  int v107 = 8;
  int v108 = v107 + v100;
  int v109 = v99[v108];
  int v110 = 0;
  bool v111 = v109 != v110;
  int v112;
  if (v111) {
    int v113 = 12;
    int v114 = v113 + v100;
    int v115 = v99[v114];
    uint v116 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v117 = (int)(v116);
    int v118;
    v118 = v117;
    switch (v115) {
      default:
        {
        int v119 = 16;
        int v120 = v119 + v100;
        int v121 = v99[v120];
        int v122 = 0;
        bool v123 = v121 != v122;
        int v124;
        if (v123) {
          int v125 = 4;
          v124 = v125;
        } else {
          int v126 = 1;
          int v127 = v100 + v126;
          v124 = v127;
        }
        v118 = v124;
        break;
      }
      case 0:
        {
        int v128 = 20;
        int v129 = v128 + v100;
        int v130 = v99[v129];
        int v131 = 0;
        bool v132 = v130 != v131;
        int v133;
        if (v132) {
          v133 = v100;
        } else {
          v133 = v100;
        }
        v118 = v133;
        break;
      }
    }
    bool v134 = true;
    v112 = v118;
  } else {
    int v135 = 24;
    int v136 = v135 + v100;
    int v137 = v99[v136];
    int v138 = 0;
    bool v139 = v137 != v138;
    int v140;
    if (v139) {
      uint v141 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v142 = (int)(v141);
      v140 = v142;
    } else {
      int v143 = 28;
      int v144 = v143 + v100;
      int v145 = v99[v144];
      int v146 = 0;
      bool v147 = v145 != v146;
      int v148;
      if (v147) {
        int v149 = 0;
        v148 = v149;
      } else {
        v148 = v100;
      }
      v140 = v148;
    }
    v112 = v140;
  }
  int v150 = 16;
  int v151 = v150 + v100;
  bool v152 = true;
  int v153 = simt_wave_count_bits(v152);
  v98[v151] = v153;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 32; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
