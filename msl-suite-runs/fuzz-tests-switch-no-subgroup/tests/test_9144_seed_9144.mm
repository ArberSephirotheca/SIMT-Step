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
  int v4;
  v4 = v0;
  switch (v3) {
    default:
      {
      int v5 = 0;
      bool v6 = v2 != v5;
      int v7;
      if (v6) {
        int v8 = 1;
        int v9 = v0 + v8;
        v7 = v9;
      } else {
        int v10 = 0;
        int v11 = 0;
        int v12;
        int v13;
        v12 = v10;
        v13 = v11;
        while (true) {
          int v14 = 4;
          int v15 = v3 % v14;
          int v16 = 1;
          int v17 = v15 + v16;
          bool v18 = v13 < v17;
          v12 = v12;
          v13 = v13;
          if (!v18) break;
          int v19 = 4;
          int v20 = 1;
          int v21 = v13 + v20;
          v12 = v19;
          v13 = v21;
        }
        v7 = v12;
      }
      v4 = v7;
      break;
    }
    case 0:
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
        int v31 = 0;
        int v32 = 1;
        int v33 = v25 + v32;
        v24 = v31;
        v25 = v33;
      }
      v4 = v24;
      break;
    }
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
  int v47 = 0;
  bool v48 = v43 != v47;
  if (v48) {
  } else {
    int v49 = 0;
    int v50 = 0;
    int v51;
    int v52;
    v51 = v49;
    v52 = v50;
    while (true) {
      int v53 = 1;
      bool v54 = v52 < v53;
      v51 = v51;
      v52 = v52;
      if (!v54) break;
      helper0(v40, v38, v43, v46, static_cast<int>(__simt_tid3.x));
      int v55 = 1;
      int v56 = v52 + v55;
      v51 = v51;
      v52 = v56;
    }
  }
  uint v57 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v58 = (int)(v57);
  int v59 = 0;
  int v60 = 8;
  int v61 = v60 + v40;
  int v62 = v39[v61];
  int v63 = 3;
  int v64 = v40 + v63;
  int v65;
  v65 = v64;
  switch (v62) {
    case 0:
      {
      int v66 = 12;
      int v67 = v66 + v40;
      int v68 = v39[v67];
      int v69;
      v69 = v40;
      switch (v68) {
        default:
          {
          int v70 = 16;
          int v71 = v70 + v40;
          int v72 = v39[v71];
          int v73 = 0;
          bool v74 = v72 != v73;
          int v75;
          if (v74) {
            v75 = v40;
          } else {
            int v76 = 3;
            int v77 = v40 + v76;
            v75 = v77;
          }
          v69 = v75;
          break;
        }
        case 0:
          {
          int v78 = 0;
          int v79 = 0;
          int v80;
          int v81;
          v80 = v78;
          v81 = v79;
          while (true) {
            int v82 = 4;
            int v83 = v81 * v82;
            int v84 = v83 + v40;
            int v85 = 20;
            int v86 = v85 + v84;
            int v87 = v39[v86];
            int v88 = 0;
            bool v89 = v87 != v88;
            v80 = v80;
            v81 = v81;
            if (!v89) break;
            int v90 = v80 + v81;
            int v91 = 1;
            int v92 = v81 + v91;
            bool v93 = true;
            v80 = v90;
            v81 = v92;
            break;
            ;
          }
          v69 = v80;
          break;
        }
      }
      v65 = v69;
      break;
    }
    case 1:
      {
      int v94 = 40;
      int v95 = v94 + v40;
      int v96 = v39[v95];
      int v97 = 0;
      bool v98 = v96 != v97;
      int v99;
      if (v98) {
        int v100 = 44;
        int v101 = v100 + v40;
        int v102 = v39[v101];
        int v103 = 3;
        int v104;
        v104 = v103;
        switch (v102) {
          case 0:
            {
            int v105 = 1;
            int v106 = v40 + v105;
            v104 = v106;
          }
          default:
            {
            int v107 = 2;
            v104 = v107;
            break;
          }
        }
        v99 = v104;
      } else {
        int v108 = 48;
        int v109 = v108 + v40;
        int v110 = v39[v109];
        int v111;
        v111 = v40;
        switch (v110) {
          case 0:
            {
            int v112 = 2;
            v111 = v112;
            break;
          }
          default:
            {
            v111 = v40;
            break;
          }
          case 1:
            {
            v111 = v40;
            break;
          }
          case 2:
            {
            int v113 = 0;
            v111 = v113;
            break;
          }
        }
        v99 = v111;
      }
      v65 = v99;
      break;
    }
    default:
      {
      int v114 = 52;
      int v115 = v114 + v40;
      int v116 = v39[v115];
      int v117 = 2;
      int v118 = v40 + v117;
      int v119;
      v119 = v118;
      switch (v116) {
        default:
          {
          int v120 = 56;
          int v121 = v120 + v40;
          int v122 = v39[v121];
          int v123 = 2;
          int v124 = v40 + v123;
          int v125;
          v125 = v124;
          switch (v122) {
            case 0:
              {
              int v126 = 3;
              int v127 = v40 + v126;
              v125 = v127;
            }
            default:
              {
              v125 = v40;
              break;
            }
          }
          v119 = v125;
          break;
        }
        case 0:
          {
          int v128 = 60;
          int v129 = v128 + v40;
          int v130 = v39[v129];
          int v131 = 0;
          bool v132 = v130 != v131;
          int v133;
          if (v132) {
            v133 = v40;
          } else {
            int v134 = 0;
            v133 = v134;
          }
          v119 = v133;
        }
        case 1:
          {
          int v135 = 1;
          int v136 = v40 + v135;
          v119 = v136;
          break;
        }
        case 2:
          {
          int v137 = 64;
          int v138 = v137 + v40;
          int v139 = v39[v138];
          int v140;
          v140 = v40;
          switch (v139) {
            case 0:
              {
              int v141 = 1;
              v140 = v141;
              break;
            }
            default:
              {
              v140 = v40;
            }
            case 1:
              {
              int v142 = 3;
              v140 = v142;
              break;
            }
          }
          bool v143 = true;
          v119 = v140;
          break;
        }
      }
      bool v144 = true;
      v65 = v119;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 4; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 68; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
