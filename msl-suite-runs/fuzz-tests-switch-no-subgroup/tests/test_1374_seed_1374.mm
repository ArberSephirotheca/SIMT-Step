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
  int v4 = 4;
  int v5 = v3 % v4;
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      v8 = v0;
      break;
    }
    case 1:
      {
      v8 = v0;
      break;
    }
    case 2:
      {
      int v9 = 2;
      int v10 = v3 % v9;
      int v11;
      v11 = v0;
      switch (v10) {
        case 0:
          {
          int v12 = 0;
          bool v13 = v2 != v12;
          int v14;
          if (v13) {
            int v15 = 1;
            v14 = v15;
          } else {
            int v16 = 0;
            int v17 = v0 + v16;
            v14 = v17;
          }
          v11 = v14;
          break;
        }
        case 1:
          {
          int v18 = 3;
          int v19 = v3 % v18;
          int v20 = 3;
          int v21;
          v21 = v20;
          switch (v19) {
            default:
              {
              int v22 = 0;
              v21 = v22;
              break;
            }
            case 0:
              {
              int v23 = 2;
              v21 = v23;
              break;
            }
            case 1:
              {
              v21 = v0;
              break;
            }
          }
          int v24 = 4;
          int v25 = v0 + v24;
          v11 = v21;
          break;
        }
        default:
          {
          int v26 = 3;
          int v27 = v3 % v26;
          int v28;
          v28 = v0;
          switch (v27) {
            case 0:
              {
              int v29 = 0;
              int v30 = v0 + v29;
              v28 = v30;
              break;
            }
            case 1:
              {
              v28 = v0;
            }
            default:
              {
              v28 = v0;
            }
            case 2:
              {
              int v31 = 4;
              int v32 = v0 + v31;
              v28 = v32;
              break;
            }
          }
          v11 = v28;
          break;
        }
      }
      v8 = v11;
      break;
    }
    default:
      {
      int v33 = 0;
      bool v34 = v2 != v33;
      int v35;
      if (v34) {
        int v36 = 0;
        bool v37 = v2 != v36;
        int v38;
        if (v37) {
          int v39 = 4;
          int v40 = v0 + v39;
          v38 = v40;
        } else {
          int v41 = 0;
          int v42 = v0 + v41;
          v38 = v42;
        }
        v35 = v38;
      } else {
        int v43 = 0;
        bool v44 = v2 != v43;
        int v45;
        if (v44) {
          int v46 = 3;
          int v47 = v0 + v46;
          v45 = v47;
        } else {
          int v48 = 4;
          v45 = v48;
        }
        v35 = v45;
      }
      v8 = v35;
      break;
    }
  }
  bool v49 = true;
  int v50 = simt_wave_count_bits(v49);
  int v51 = 0;
  int v52 = v51 + v0;
  v1[v52] = v50;
  return;
}

kernel void kernel_main(device int* v53 [[buffer(0)]], device int* v54 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v55 = static_cast<int>(__simt_tid3.x);
  int v56 = 0;
  int v57 = v56 + v55;
  int v58 = v54[v57];
  int v59 = 4;
  int v60 = v59 + v55;
  int v61 = v54[v60];
  helper0(v55, v53, v58, v61, static_cast<int>(__simt_tid3.x));
  int v62 = 2;
  int v63 = 8;
  int v64 = v63 + v55;
  int v65 = v54[v64];
  int v66 = 0;
  bool v67 = v65 != v66;
  int v68;
  if (v67) {
    int v69 = 12;
    int v70 = v69 + v55;
    int v71 = v54[v70];
    int v72;
    v72 = v55;
    switch (v71) {
      case 0:
        {
        int v73 = 16;
        int v74 = v73 + v55;
        int v75 = v54[v74];
        int v76 = 0;
        bool v77 = v75 != v76;
        int v78;
        if (v77) {
          int v79 = 0;
          v78 = v79;
        } else {
          int v80 = 4;
          v78 = v80;
        }
        v72 = v78;
        break;
      }
      case 1:
        {
        int v81 = 0;
        int v82 = 0;
        int v83;
        int v84;
        v83 = v81;
        v84 = v82;
        while (true) {
          int v85 = 4;
          int v86 = v84 * v85;
          int v87 = v86 + v55;
          int v88 = 20;
          int v89 = v88 + v87;
          int v90 = v54[v89];
          int v91 = 0;
          bool v92 = v90 != v91;
          v83 = v83;
          v84 = v84;
          if (!v92) break;
          int v93 = v83 + v84;
          int v94 = 1;
          int v95 = v84 + v94;
          bool v96 = true;
          v83 = v93;
          v84 = v95;
          continue;
          ;
        }
        v72 = v83;
      }
      default:
        {
        v72 = v55;
      }
      case 2:
        {
        int v97 = 40;
        int v98 = v97 + v55;
        int v99 = v54[v98];
        int v100 = 0;
        bool v101 = v99 != v100;
        int v102;
        if (v101) {
          v102 = v55;
        } else {
          v102 = v55;
        }
        v72 = v102;
        break;
      }
    }
    v68 = v72;
  } else {
    int v103 = 0;
    int v104 = 0;
    int v105;
    int v106;
    v105 = v103;
    v106 = v104;
    while (true) {
      int v107 = 4;
      int v108 = v106 * v107;
      int v109 = v108 + v55;
      int v110 = 44;
      int v111 = v110 + v109;
      int v112 = v54[v111];
      int v113 = 0;
      bool v114 = v112 != v113;
      v105 = v105;
      v106 = v106;
      if (!v114) break;
      int v115 = 64;
      int v116 = v115 + v55;
      int v117 = v54[v116];
      int v118 = 4;
      int v119;
      v119 = v118;
      switch (v117) {
        default:
          {
          v119 = v55;
          break;
        }
        case 0:
          {
          int v120 = 0;
          v119 = v120;
          break;
        }
        case 1:
          {
          int v121 = 3;
          int v122 = v55 + v121;
          v119 = v122;
          break;
        }
        case 2:
          {
          int v123 = 0;
          v119 = v123;
          break;
        }
      }
      bool v124 = true;
      int v125 = 16;
      int v126 = v125 + v55;
      bool v127 = true;
      int v128 = simt_wave_count_bits(v127);
      v53[v126] = v128;
      int v129 = v105 + v119;
      int v130 = 1;
      int v131 = v106 + v130;
      bool v132 = true;
      int v133 = 32;
      int v134 = 4;
      int v135 = v106 * v134;
      int v136 = v133 + v135;
      int v137 = v136 + v55;
      bool v138 = true;
      int v139 = simt_wave_count_bits(v138);
      v53[v137] = v139;
      v105 = v129;
      v106 = v131;
      continue;
      ;
    }
    v68 = v105;
  }
  int v140 = 48;
  int v141 = v140 + v55;
  bool v142 = true;
  int v143 = simt_wave_count_bits(v142);
  v53[v141] = v143;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
