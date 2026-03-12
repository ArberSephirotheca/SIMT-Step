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
  int v4 = 2;
  int v5 = v3 % v4;
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 3;
      int v10 = v3 % v9;
      int v11 = 1;
      int v12 = v0 + v11;
      int v13;
      v13 = v12;
      switch (v10) {
        default:
          {
          int v14 = 0;
          bool v15 = v2 != v14;
          int v16;
          if (v15) {
            v16 = v0;
          } else {
            int v17 = 3;
            int v18 = v0 + v17;
            v16 = v18;
          }
          v13 = v16;
          break;
        }
        case 0:
          {
          int v19 = 0;
          bool v20 = v2 != v19;
          int v21;
          if (v20) {
            int v22 = 3;
            v21 = v22;
          } else {
            v21 = v0;
          }
          v13 = v21;
          break;
        }
        case 1:
          {
          int v23 = 0;
          int v24 = 0;
          int v25;
          int v26;
          v25 = v23;
          v26 = v24;
          while (true) {
            int v27 = 4;
            int v28 = v3 % v27;
            int v29 = 1;
            int v30 = v28 + v29;
            bool v31 = v26 < v30;
            v25 = v25;
            v26 = v26;
            if (!v31) break;
            int v32 = 0;
            int v33 = 1;
            int v34 = v26 + v33;
            v25 = v32;
            v26 = v34;
            continue;
            ;
          }
          v13 = v25;
          break;
        }
        case 2:
          {
          int v35 = 0;
          int v36 = 0;
          int v37;
          int v38;
          v37 = v35;
          v38 = v36;
          while (true) {
            int v39 = 4;
            int v40 = v3 % v39;
            int v41 = 1;
            int v42 = v40 + v41;
            bool v43 = v38 < v42;
            v37 = v37;
            v38 = v38;
            if (!v43) break;
            int v44 = 1;
            int v45 = v38 + v44;
            v37 = v0;
            v38 = v45;
          }
          v13 = v37;
          break;
        }
      }
      int v46 = 2;
      int v47 = v0 + v46;
      v8 = v13;
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
          int v53 = 3;
          int v54 = v3 % v53;
          int v55 = 2;
          int v56;
          v56 = v55;
          switch (v54) {
            case 0:
              {
              v56 = v0;
            }
            default:
              {
              int v57 = 1;
              int v58 = v0 + v57;
              v56 = v58;
            }
            case 1:
              {
              int v59 = 4;
              v56 = v59;
              break;
            }
          }
          int v60 = 0;
          int v61 = v0 + v60;
          v52 = v56;
          break;
        }
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
            int v67 = v3 % v66;
            int v68 = 1;
            int v69 = v67 + v68;
            bool v70 = v65 < v69;
            v64 = v64;
            v65 = v65;
            if (!v70) break;
            int v71 = 1;
            int v72 = v65 + v71;
            v64 = v0;
            v65 = v72;
          }
          v52 = v64;
          break;
        }
      }
      v8 = v52;
      break;
    }
  }
  bool v73 = true;
  int v74 = simt_wave_count_bits(v73);
  int v75 = 0;
  int v76 = v75 + v0;
  v1[v76] = v74;
  return;
}

kernel void kernel_main(device int* v77 [[buffer(0)]], device int* v78 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v79 = static_cast<int>(__simt_tid3.x);
  int v80 = 0;
  int v81 = v80 + v79;
  int v82 = v78[v81];
  int v83 = 4;
  int v84 = v83 + v79;
  int v85 = v78[v84];
  helper0(v79, v77, v82, v85, static_cast<int>(__simt_tid3.x));
  int v86 = 8;
  int v87 = v86 + v79;
  int v88 = v78[v87];
  int v89 = 0;
  bool v90 = v88 != v89;
  int v91;
  if (v90) {
    int v92 = 0;
    int v93 = 0;
    int v94;
    int v95;
    v94 = v92;
    v95 = v93;
    while (true) {
      int v96 = 4;
      int v97 = v95 * v96;
      int v98 = v97 + v79;
      int v99 = 12;
      int v100 = v99 + v98;
      int v101 = v78[v100];
      int v102 = 0;
      bool v103 = v101 != v102;
      v94 = v94;
      v95 = v95;
      if (!v103) break;
      int v104 = v94 + v95;
      int v105 = 1;
      int v106 = v95 + v105;
      bool v107 = true;
      int v108 = 16;
      int v109 = 4;
      int v110 = v95 * v109;
      int v111 = v108 + v110;
      int v112 = v111 + v79;
      bool v113 = true;
      int v114 = simt_wave_count_bits(v113);
      v77[v112] = v114;
      v94 = v104;
      v95 = v106;
      continue;
      ;
    }
    v91 = v94;
  } else {
    int v115 = 32;
    int v116 = v115 + v79;
    int v117 = v78[v116];
    int v118;
    v118 = v79;
    switch (v117) {
      case 0:
        {
        int v119 = 36;
        int v120 = v119 + v79;
        int v121 = v78[v120];
        int v122;
        v122 = v79;
        switch (v121) {
          case 0:
            {
            v122 = v79;
            break;
          }
          default:
            {
            int v123 = 0;
            int v124 = v79 + v123;
            v122 = v124;
            break;
          }
          case 1:
            {
            int v125 = 4;
            int v126 = v79 + v125;
            v122 = v126;
            break;
          }
        }
        v118 = v122;
        break;
      }
      default:
        {
        int v127 = 0;
        int v128 = 0;
        int v129;
        int v130;
        v129 = v127;
        v130 = v128;
        while (true) {
          int v131 = 4;
          int v132 = v130 * v131;
          int v133 = v132 + v79;
          int v134 = 40;
          int v135 = v134 + v133;
          int v136 = v78[v135];
          int v137 = 0;
          bool v138 = v136 != v137;
          v129 = v129;
          v130 = v130;
          if (!v138) break;
          int v139 = v129 + v130;
          int v140 = 1;
          int v141 = v130 + v140;
          bool v142 = true;
          v129 = v139;
          v130 = v141;
        }
        v118 = v129;
        break;
      }
    }
    v91 = v118;
  }
  int v143 = 32;
  int v144 = v143 + v79;
  bool v145 = true;
  int v146 = simt_wave_count_bits(v145);
  v77[v144] = v146;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 60; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
