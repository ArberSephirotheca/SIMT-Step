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
    bool v13 = true;
    int v14 = simt_wave_count_bits(v13);
    int v15 = 0;
    int v16 = 4;
    int v17 = v7 * v16;
    int v18 = v15 + v17;
    int v19 = v18 + v0;
    v1[v19] = v14;
    int v20 = 1;
    int v21 = v7 + v20;
    v6 = v14;
    v7 = v21;
  }
  int v22 = 3;
  int v23 = v3 % v22;
  int v24 = 2;
  int v25 = v0 + v24;
  int v26;
  v26 = v25;
  switch (v23) {
    case 0:
      {
      int v27 = 3;
      v26 = v27;
      break;
    }
    case 1:
      {
      int v28 = 2;
      v26 = v28;
      break;
    }
    case 2:
      {
      int v29 = 0;
      v26 = v29;
      break;
    }
    default:
      {
      int v30 = 3;
      int v31 = v3 % v30;
      int v32 = 2;
      int v33;
      v33 = v32;
      switch (v31) {
        default:
          {
          int v34 = 0;
          bool v35 = v2 != v34;
          int v36;
          if (v35) {
            int v37 = 3;
            int v38 = v0 + v37;
            v36 = v38;
          } else {
            v36 = v0;
          }
          v33 = v36;
          break;
        }
        case 0:
          {
          int v39 = 0;
          bool v40 = v2 != v39;
          int v41;
          if (v40) {
            int v42 = 4;
            v41 = v42;
          } else {
            int v43 = 0;
            int v44 = v0 + v43;
            v41 = v44;
          }
          v33 = v41;
          break;
        }
        case 1:
          {
          int v45 = 1;
          int v46 = v0 + v45;
          v33 = v46;
          break;
        }
        case 2:
          {
          int v47 = 0;
          int v48 = 0;
          int v49;
          int v50;
          v49 = v47;
          v50 = v48;
          while (true) {
            int v51 = 4;
            int v52 = v3 % v51;
            int v53 = 1;
            int v54 = v52 + v53;
            bool v55 = v50 < v54;
            v49 = v49;
            v50 = v50;
            if (!v55) break;
            int v56 = 2;
            int v57 = 1;
            int v58 = v50 + v57;
            v49 = v56;
            v50 = v58;
          }
          v33 = v49;
          break;
        }
      }
      v26 = v33;
      break;
    }
  }
  int v59 = 0;
  bool v60 = v2 != v59;
  int v61 = v60 ? v6 : v26;
  return;
}

kernel void kernel_main(device int* v62 [[buffer(0)]], device int* v63 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v64 = static_cast<int>(__simt_tid3.x);
  int v65 = 0;
  int v66 = v65 + v64;
  int v67 = v63[v66];
  int v68 = 4;
  int v69 = v68 + v64;
  int v70 = v63[v69];
  int v71 = 0;
  bool v72 = v67 != v71;
  if (v72) {
    int v73 = 8;
    int v74 = v73 + v64;
    int v75 = v63[v74];
    int v76 = 0;
    bool v77 = v75 != v76;
    if (v77) {
    } else {
      helper0(v64, v62, v67, v70, static_cast<int>(__simt_tid3.x));
    }
  } else {
  }
  int v78 = 12;
  int v79 = v78 + v64;
  int v80 = v63[v79];
  uint v81 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v82 = (int)(v81);
  int v83;
  v83 = v82;
  switch (v80) {
    case 0:
      {
      int v84 = 16;
      int v85 = v84 + v64;
      int v86 = v63[v85];
      int v87 = 2;
      int v88;
      v88 = v87;
      switch (v86) {
        case 0:
          {
          int v89 = 0;
          int v90 = 0;
          int v91;
          int v92;
          v91 = v89;
          v92 = v90;
          while (true) {
            int v93 = 4;
            int v94 = v92 * v93;
            int v95 = v94 + v64;
            int v96 = 20;
            int v97 = v96 + v95;
            int v98 = v63[v97];
            int v99 = 0;
            bool v100 = v98 != v99;
            v91 = v91;
            v92 = v92;
            if (!v100) break;
            int v101 = v91 + v92;
            int v102 = 1;
            int v103 = v92 + v102;
            bool v104 = true;
            v91 = v101;
            v92 = v103;
            continue;
            ;
          }
          v88 = v91;
        }
        default:
          {
          int v105 = 40;
          int v106 = v105 + v64;
          int v107 = v63[v106];
          int v108 = 0;
          int v109;
          v109 = v108;
          switch (v107) {
            case 0:
              {
              int v110 = 3;
              int v111 = v64 + v110;
              v109 = v111;
              break;
            }
            case 1:
              {
              v109 = v64;
            }
            case 2:
              {
              int v112 = 0;
              int v113 = v64 + v112;
              v109 = v113;
            }
            default:
              {
              int v114 = 2;
              v109 = v114;
              break;
            }
          }
          v88 = v109;
          break;
        }
      }
      v83 = v88;
      break;
    }
    default:
      {
      int v115 = 44;
      int v116 = v115 + v64;
      int v117 = v63[v116];
      int v118 = 0;
      bool v119 = v117 != v118;
      int v120;
      if (v119) {
        int v121 = 48;
        int v122 = v121 + v64;
        int v123 = v63[v122];
        int v124;
        v124 = v64;
        switch (v123) {
          case 0:
            {
            v124 = v64;
            break;
          }
          case 1:
            {
            int v125 = 2;
            int v126 = v64 + v125;
            v124 = v126;
            break;
          }
          default:
            {
            int v127 = 4;
            int v128 = v64 + v127;
            v124 = v128;
            break;
          }
          case 2:
            {
            int v129 = 3;
            v124 = v129;
            break;
          }
        }
        bool v130 = true;
        v120 = v124;
      } else {
        v120 = v64;
      }
      v83 = v120;
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
    static int32_t expected0[] = {};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 0; ++idx) {
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
