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
      v9 = v0;
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
        int v19 = 3;
        int v20 = 1;
        int v21 = v13 + v20;
        v12 = v19;
        v13 = v21;
      }
      int v22 = 3;
      v9 = v12;
    }
    uint v23 = simt_lane_id(__simt_tid);
    int v24 = (int)(v23);
    v6 = v9;
  } else {
    int v25 = 1;
    int v26 = v0 + v25;
    int v27;
    v27 = v26;
    switch (v3) {
      default:
        {
        v27 = v0;
        break;
      }
      case 0:
        {
        int v28 = 4;
        int v29 = v3 % v28;
        int v30;
        v30 = v0;
        switch (v29) {
          default:
            {
            int v31 = 4;
            v30 = v31;
            break;
          }
          case 0:
            {
            int v32 = 4;
            int v33 = v0 + v32;
            v30 = v33;
            break;
          }
          case 1:
            {
            v30 = v0;
            break;
          }
          case 2:
            {
            v30 = v0;
            break;
          }
        }
        int v34 = 1;
        v27 = v30;
        break;
      }
    }
    uint v35 = simt_subgroup_id(__simt_tid);
    int v36 = (int)(v35);
    v6 = v27;
  }
  bool v37 = true;
  int v38 = simt_wave_count_bits(v37);
  int v39 = 0;
  int v40 = v39 + v0;
  v1[v40] = v38;
  return;
}

kernel void kernel_main(device int* v41 [[buffer(0)]], device int* v42 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v43 = static_cast<int>(__simt_tid3.x);
  int v44 = 0;
  int v45 = v44 + v43;
  int v46 = v42[v45];
  int v47 = 4;
  int v48 = v47 + v43;
  int v49 = v42[v48];
  helper0(v43, v41, v46, v49, static_cast<int>(__simt_tid3.x));
  int v50 = 8;
  int v51 = v50 + v43;
  int v52 = v42[v51];
  int v53 = 0;
  int v54 = v43 + v53;
  int v55;
  v55 = v54;
  switch (v52) {
    case 0:
      {
      int v56 = 12;
      int v57 = v56 + v43;
      int v58 = v42[v57];
      int v59 = 0;
      int v60 = v43 + v59;
      int v61;
      v61 = v60;
      switch (v58) {
        case 0:
          {
          int v62 = 0;
          int v63 = 0;
          int v64;
          int v65;
          v64 = v62;
          v65 = v63;
          while (true) {
            int v66 = 4;
            int v67 = v65 * v66;
            int v68 = v67 + v43;
            int v69 = 16;
            int v70 = v69 + v68;
            int v71 = v42[v70];
            int v72 = 0;
            bool v73 = v71 != v72;
            v64 = v64;
            v65 = v65;
            if (!v73) break;
            int v74 = v64 + v65;
            int v75 = 1;
            int v76 = v65 + v75;
            v64 = v74;
            v65 = v76;
          }
          bool v77 = true;
          v61 = v64;
          break;
        }
        case 1:
          {
          int v78 = 36;
          int v79 = v78 + v43;
          int v80 = v42[v79];
          int v81 = 0;
          bool v82 = v80 != v81;
          int v83;
          if (v82) {
            int v84 = 0;
            v83 = v84;
          } else {
            int v85 = 1;
            int v86 = v43 + v85;
            v83 = v86;
          }
          v61 = v83;
          break;
        }
        default:
          {
          int v87 = 40;
          int v88 = v87 + v43;
          int v89 = v42[v88];
          int v90 = 3;
          int v91;
          v91 = v90;
          switch (v89) {
            default:
              {
              v91 = v43;
              break;
            }
            case 0:
              {
              v91 = v43;
              break;
            }
          }
          bool v92 = true;
          v61 = v91;
          break;
        }
        case 2:
          {
          int v93 = 0;
          int v94 = 0;
          int v95;
          int v96;
          v95 = v93;
          v96 = v94;
          while (true) {
            int v97 = 4;
            int v98 = v96 * v97;
            int v99 = v98 + v43;
            int v100 = 44;
            int v101 = v100 + v99;
            int v102 = v42[v101];
            int v103 = 0;
            bool v104 = v102 != v103;
            v95 = v95;
            v96 = v96;
            if (!v104) break;
            int v105 = v95 + v96;
            int v106 = 1;
            int v107 = v96 + v106;
            v95 = v105;
            v96 = v107;
          }
          bool v108 = true;
          v61 = v95;
          break;
        }
      }
      bool v109 = true;
      v55 = v61;
    }
    case 1:
      {
      v55 = v43;
    }
    default:
      {
      int v110 = 64;
      int v111 = v110 + v43;
      int v112 = v42[v111];
      int v113 = 1;
      int v114;
      v114 = v113;
      switch (v112) {
        default:
          {
          int v115 = 68;
          int v116 = v115 + v43;
          int v117 = v42[v116];
          int v118;
          v118 = v43;
          switch (v117) {
            case 0:
              {
              int v119 = 3;
              v118 = v119;
              break;
            }
            default:
              {
              int v120 = 2;
              int v121 = v43 + v120;
              v118 = v121;
              break;
            }
            case 1:
              {
              v118 = v43;
              break;
            }
            case 2:
              {
              v118 = v43;
              break;
            }
          }
          bool v122 = true;
          v114 = v118;
          break;
        }
        case 0:
          {
          int v123 = 2;
          int v124 = v43 + v123;
          v114 = v124;
          break;
        }
      }
      bool v125 = true;
      v55 = v114;
      break;
    }
  }
  bool v126 = true;
  int v127 = 16;
  int v128 = v127 + v43;
  bool v129 = true;
  int v130 = simt_wave_count_bits(v129);
  v41[v128] = v130;
  int v131 = 72;
  int v132 = v131 + v43;
  int v133 = v42[v132];
  int v134 = 0;
  int v135 = v43 + v134;
  int v136;
  v136 = v135;
  switch (v133) {
    default:
      {
      v136 = v43;
      break;
    }
    case 0:
      {
      v136 = v43;
      break;
    }
    case 1:
      {
      v136 = v43;
    }
    case 2:
      {
      v136 = v43;
      break;
    }
  }
  bool v137 = true;
  int v138 = 32;
  int v139 = v138 + v43;
  bool v140 = true;
  int v141 = simt_wave_count_bits(v140);
  v41[v139] = v141;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 76; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
