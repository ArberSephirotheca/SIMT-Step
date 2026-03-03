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
    uint v13 = simt_lane_id(__simt_tid);
    int v14 = (int)(v13);
    int v15 = 1;
    int v16 = v7 + v15;
    v6 = v14;
    v7 = v16;
    continue;
    ;
  }
  bool v17 = true;
  int v18 = simt_wave_count_bits(v17);
  int v19 = 0;
  int v20 = v19 + v0;
  v1[v20] = v18;
  int v21 = 0;
  bool v22 = v2 != v21;
  int v23 = v22 ? v0 : v6;
  int v24 = 3;
  int v25;
  v25 = v24;
  switch (v3) {
    default:
      {
      int v26 = 3;
      int v27 = v3 % v26;
      int v28 = 0;
      int v29;
      v29 = v28;
      switch (v27) {
        case 0:
          {
          int v30 = 2;
          int v31 = v3 % v30;
          int v32;
          v32 = v0;
          switch (v31) {
            case 0:
              {
              int v33 = 1;
              int v34 = v0 + v33;
              v32 = v34;
              break;
            }
            default:
              {
              v32 = v0;
              break;
            }
            case 1:
              {
              v32 = v0;
              break;
            }
          }
          int v35 = 0;
          int v36 = v0 + v35;
          v29 = v32;
          break;
        }
        default:
          {
          int v37 = 0;
          bool v38 = v2 != v37;
          int v39;
          if (v38) {
            int v40 = 3;
            v39 = v40;
          } else {
            int v41 = 1;
            v39 = v41;
          }
          int v42 = 0;
          int v43 = v0 + v42;
          v29 = v39;
          break;
        }
        case 1:
          {
          int v44 = 0;
          bool v45 = v2 != v44;
          int v46;
          if (v45) {
            v46 = v0;
          } else {
            int v47 = 2;
            v46 = v47;
          }
          v29 = v46;
          break;
        }
      }
      v25 = v29;
      break;
    }
    case 0:
      {
      int v48 = 2;
      int v49 = v3 % v48;
      int v50 = 0;
      int v51 = v0 + v50;
      int v52;
      v52 = v51;
      switch (v49) {
        default:
          {
          int v53 = 0;
          int v54 = 0;
          int v55;
          int v56;
          v55 = v53;
          v56 = v54;
          while (true) {
            int v57 = 4;
            int v58 = v3 % v57;
            int v59 = 1;
            int v60 = v58 + v59;
            bool v61 = v56 < v60;
            v55 = v55;
            v56 = v56;
            if (!v61) break;
            int v62 = 1;
            int v63 = v56 + v62;
            v55 = v0;
            v56 = v63;
            break;
            ;
          }
          int v64 = 3;
          v52 = v55;
          break;
        }
        case 0:
          {
          int v65 = 2;
          v52 = v65;
          break;
        }
        case 1:
          {
          int v66 = 0;
          bool v67 = v2 != v66;
          int v68;
          if (v67) {
            v68 = v0;
          } else {
            int v69 = 1;
            v68 = v69;
          }
          int v70 = 2;
          v52 = v68;
          break;
        }
      }
      int v71 = 2;
      v25 = v52;
      break;
    }
  }
  bool v72 = true;
  int v73 = simt_wave_count_bits(v72);
  int v74 = 16;
  int v75 = v74 + v0;
  v1[v75] = v73;
  int v76 = 0;
  bool v77 = v2 != v76;
  int v78 = v77 ? v23 : v25;
  return;
}

kernel void kernel_main(device int* v79 [[buffer(0)]], device int* v80 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v81 = static_cast<int>(__simt_tid3.x);
  int v82 = 0;
  int v83 = v82 + v81;
  int v84 = v80[v83];
  int v85 = 4;
  int v86 = v85 + v81;
  int v87 = v80[v86];
  helper0(v81, v79, v84, v87, static_cast<int>(__simt_tid3.x));
  int v88 = 8;
  int v89 = v88 + v81;
  int v90 = v80[v89];
  int v91 = 1;
  int v92 = v81 + v91;
  int v93;
  v93 = v92;
  switch (v90) {
    case 0:
      {
      int v94 = 12;
      int v95 = v94 + v81;
      int v96 = v80[v95];
      int v97 = 0;
      bool v98 = v96 != v97;
      int v99;
      if (v98) {
        int v100 = 16;
        int v101 = v100 + v81;
        int v102 = v80[v101];
        int v103;
        v103 = v81;
        switch (v102) {
          case 0:
            {
            v103 = v81;
            break;
          }
          case 1:
            {
            int v104 = 4;
            v103 = v104;
            break;
          }
          case 2:
            {
            v103 = v81;
            break;
          }
          default:
            {
            int v105 = 1;
            int v106 = v81 + v105;
            v103 = v106;
            break;
          }
        }
        bool v107 = true;
        v99 = v103;
      } else {
        int v108 = 20;
        int v109 = v108 + v81;
        int v110 = v80[v109];
        int v111;
        v111 = v81;
        switch (v110) {
          case 0:
            {
            int v112 = 4;
            v111 = v112;
          }
          default:
            {
            v111 = v81;
            break;
          }
        }
        bool v113 = true;
        v99 = v111;
      }
      v93 = v99;
      break;
    }
    default:
      {
      int v114 = 24;
      int v115 = v114 + v81;
      int v116 = v80[v115];
      int v117 = 1;
      int v118;
      v118 = v117;
      switch (v116) {
        case 0:
          {
          int v119 = 28;
          int v120 = v119 + v81;
          int v121 = v80[v120];
          int v122;
          v122 = v81;
          switch (v121) {
            case 0:
              {
              v122 = v81;
              break;
            }
            default:
              {
              int v123 = 4;
              int v124 = v81 + v123;
              v122 = v124;
              break;
            }
          }
          bool v125 = true;
          v118 = v122;
          break;
        }
        case 1:
          {
          int v126 = 32;
          int v127 = v126 + v81;
          int v128 = v80[v127];
          int v129 = 0;
          bool v130 = v128 != v129;
          int v131;
          if (v130) {
            int v132 = 0;
            v131 = v132;
          } else {
            int v133 = 1;
            int v134 = v81 + v133;
            v131 = v134;
          }
          v118 = v131;
          break;
        }
        case 2:
          {
          int v135 = 36;
          int v136 = v135 + v81;
          int v137 = v80[v136];
          int v138 = 0;
          bool v139 = v137 != v138;
          int v140;
          if (v139) {
            int v141 = 0;
            v140 = v141;
          } else {
            int v142 = 1;
            v140 = v142;
          }
          v118 = v140;
        }
        default:
          {
          int v143 = 4;
          v118 = v143;
          break;
        }
      }
      bool v144 = true;
      v93 = v118;
    }
    case 1:
      {
      v93 = v81;
      break;
    }
  }
  bool v145 = true;
  int v146 = 32;
  int v147 = v146 + v81;
  bool v148 = true;
  int v149 = simt_wave_count_bits(v148);
  v79[v147] = v149;
  int v150 = 2;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 40; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
