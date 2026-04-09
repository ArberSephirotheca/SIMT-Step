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
    int v13 = 2;
    int v14 = v0 + v13;
    int v15;
    v15 = v14;
    switch (v3) {
      default:
        {
        int v16 = 0;
        bool v17 = v2 != v16;
        int v18;
        if (v17) {
          v18 = v0;
        } else {
          v18 = v0;
        }
        v15 = v18;
        break;
      }
      case 0:
        {
        int v19 = 0;
        int v20 = 0;
        int v21;
        int v22;
        v21 = v19;
        v22 = v20;
        while (true) {
          int v23 = 4;
          int v24 = v3 % v23;
          int v25 = 1;
          int v26 = v24 + v25;
          bool v27 = v22 < v26;
          v21 = v21;
          v22 = v22;
          if (!v27) break;
          int v28 = 2;
          int v29 = v0 + v28;
          int v30 = 1;
          int v31 = v22 + v30;
          v21 = v29;
          v22 = v31;
          break;
          ;
        }
        v15 = v21;
        break;
      }
    }
    int v32 = 3;
    int v33 = 1;
    int v34 = v7 + v33;
    v6 = v15;
    v7 = v34;
  }
  bool v35 = true;
  int v36 = simt_wave_count_bits(v35);
  int v37 = 0;
  int v38 = v37 + v0;
  v1[v38] = v36;
  return;
}

kernel void kernel_main(device int* v39 [[buffer(0)]], device int* v40 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v41 = static_cast<int>(__simt_tid3.x);
  int v42 = 0;
  int v43 = v42 + v41;
  int v44 = v40[v43];
  int v45 = 4;
  int v46 = v45 + v41;
  int v47 = v40[v46];
  helper0(v41, v39, v44, v47, static_cast<int>(__simt_tid3.x));
  int v48 = 8;
  int v49 = v48 + v41;
  int v50 = v40[v49];
  int v51 = 2;
  int v52 = v41 + v51;
  int v53;
  v53 = v52;
  switch (v50) {
    default:
      {
      int v54 = 4;
      v53 = v54;
      break;
    }
    case 0:
      {
      int v55 = 12;
      int v56 = v55 + v41;
      int v57 = v40[v56];
      int v58 = 1;
      int v59 = v41 + v58;
      int v60;
      v60 = v59;
      switch (v57) {
        case 0:
          {
          int v61 = 16;
          int v62 = v61 + v41;
          int v63 = v40[v62];
          int v64 = 0;
          bool v65 = v63 != v64;
          int v66;
          if (v65) {
            int v67 = 3;
            int v68 = v41 + v67;
            v66 = v68;
          } else {
            int v69 = 3;
            v66 = v69;
          }
          v60 = v66;
          break;
        }
        case 1:
          {
          int v70 = 20;
          int v71 = v70 + v41;
          int v72 = v40[v71];
          int v73 = 0;
          bool v74 = v72 != v73;
          int v75;
          if (v74) {
            v75 = v41;
          } else {
            v75 = v41;
          }
          v60 = v75;
        }
        default:
          {
          int v76 = 24;
          int v77 = v76 + v41;
          int v78 = v40[v77];
          int v79 = 0;
          int v80;
          v80 = v79;
          switch (v78) {
            default:
              {
              int v81 = 4;
              v80 = v81;
              break;
            }
            case 0:
              {
              int v82 = 3;
              v80 = v82;
              break;
            }
          }
          bool v83 = true;
          v60 = v80;
          break;
        }
        case 2:
          {
          int v84 = 0;
          v60 = v84;
          break;
        }
      }
      bool v85 = true;
      v53 = v60;
      break;
    }
  }
  bool v86 = true;
  int v87 = 16;
  int v88 = v87 + v41;
  bool v89 = true;
  int v90 = simt_wave_count_bits(v89);
  v39[v88] = v90;
  int v91 = 28;
  int v92 = v91 + v41;
  int v93 = v40[v92];
  uint v94 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v95 = (int)(v94);
  int v96;
  v96 = v95;
  switch (v93) {
    case 0:
      {
      int v97 = 32;
      int v98 = v97 + v41;
      int v99 = v40[v98];
      int v100;
      v100 = v41;
      switch (v99) {
        case 0:
          {
          v100 = v41;
        }
        default:
          {
          int v101 = 36;
          int v102 = v101 + v41;
          int v103 = v40[v102];
          int v104;
          v104 = v41;
          switch (v103) {
            case 0:
              {
              int v105 = 4;
              int v106 = v41 + v105;
              v104 = v106;
            }
            default:
              {
              v104 = v41;
              break;
            }
            case 1:
              {
              int v107 = 3;
              int v108 = v41 + v107;
              v104 = v108;
              break;
            }
          }
          bool v109 = true;
          v100 = v104;
          break;
        }
      }
      bool v110 = true;
      v96 = v100;
      break;
    }
    default:
      {
      int v111 = 0;
      int v112 = v41 + v111;
      v96 = v112;
      break;
    }
    case 1:
      {
      int v113 = 40;
      int v114 = v113 + v41;
      int v115 = v40[v114];
      int v116 = 2;
      int v117 = v41 + v116;
      int v118;
      v118 = v117;
      switch (v115) {
        default:
          {
          int v119 = 44;
          int v120 = v119 + v41;
          int v121 = v40[v120];
          int v122 = 0;
          bool v123 = v121 != v122;
          int v124;
          if (v123) {
            int v125 = 3;
            v124 = v125;
          } else {
            int v126 = 1;
            int v127 = v41 + v126;
            v124 = v127;
          }
          v118 = v124;
          break;
        }
        case 0:
          {
          int v128 = 0;
          int v129 = 0;
          int v130;
          int v131;
          v130 = v128;
          v131 = v129;
          while (true) {
            int v132 = 4;
            int v133 = v131 * v132;
            int v134 = v133 + v41;
            int v135 = 48;
            int v136 = v135 + v134;
            int v137 = v40[v136];
            int v138 = 0;
            bool v139 = v137 != v138;
            v130 = v130;
            v131 = v131;
            if (!v139) break;
            int v140 = v130 + v131;
            int v141 = 1;
            int v142 = v131 + v141;
            v130 = v140;
            v131 = v142;
            continue;
            ;
          }
          bool v143 = true;
          v118 = v130;
          break;
        }
        case 1:
          {
          v118 = v41;
          break;
        }
      }
      bool v144 = true;
      v96 = v118;
      break;
    }
    case 2:
      {
      int v145 = 1;
      int v146 = v41 + v145;
      v96 = v146;
      break;
    }
  }
  bool v147 = true;
  int v148 = 32;
  int v149 = v148 + v41;
  bool v150 = true;
  int v151 = simt_wave_count_bits(v150);
  v39[v149] = v151;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
