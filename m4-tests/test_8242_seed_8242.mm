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
  int v5 = v3 % v4;
  int v6;
  v6 = v0;
  switch (v5) {
    case 0:
      {
      int v7 = 4;
      int v8 = v3 % v7;
      int v9 = 0;
      int v10 = v0 + v9;
      int v11;
      v11 = v10;
      switch (v8) {
        case 0:
          {
          int v12 = 2;
          int v13 = v0 + v12;
          v11 = v13;
          break;
        }
        case 1:
          {
          int v14 = 0;
          bool v15 = v2 != v14;
          int v16;
          if (v15) {
            int v17 = 3;
            v16 = v17;
          } else {
            v16 = v0;
          }
          v11 = v16;
          break;
        }
        case 2:
          {
          int v18 = 3;
          int v19 = v3 % v18;
          int v20 = 2;
          int v21 = v0 + v20;
          int v22;
          v22 = v21;
          switch (v19) {
            default:
              {
              int v23 = 3;
              v22 = v23;
            }
            case 0:
              {
              int v24 = 2;
              v22 = v24;
              break;
            }
            case 1:
              {
              v22 = v0;
            }
            case 2:
              {
              int v25 = 4;
              v22 = v25;
              break;
            }
          }
          v11 = v22;
          break;
        }
        default:
          {
          int v26 = 0;
          bool v27 = v2 != v26;
          int v28;
          if (v27) {
            int v29 = 1;
            v28 = v29;
          } else {
            v28 = v0;
          }
          v11 = v28;
          break;
        }
      }
      int v30 = 4;
      int v31 = v0 + v30;
      v6 = v11;
    }
    default:
      {
      int v32 = 0;
      int v33 = 0;
      int v34;
      int v35;
      v34 = v32;
      v35 = v33;
      while (true) {
        int v36 = 4;
        int v37 = v3 % v36;
        int v38 = 1;
        int v39 = v37 + v38;
        bool v40 = v35 < v39;
        v34 = v34;
        v35 = v35;
        if (!v40) break;
        int v41 = 4;
        int v42 = v3 % v41;
        int v43 = 2;
        int v44 = v0 + v43;
        int v45;
        v45 = v44;
        switch (v42) {
          default:
            {
            int v46 = 3;
            v45 = v46;
          }
          case 0:
            {
            int v47 = 0;
            v45 = v47;
          }
          case 1:
            {
            int v48 = 3;
            v45 = v48;
          }
          case 2:
            {
            v45 = v0;
            break;
          }
        }
        int v49 = 1;
        int v50 = v35 + v49;
        v34 = v45;
        v35 = v50;
      }
      v6 = v34;
    }
    case 1:
      {
      v6 = v0;
      break;
    }
  }
  bool v51 = true;
  int v52 = simt_wave_count_bits(v51);
  int v53 = 0;
  int v54 = v53 + v0;
  v1[v54] = v52;
  return;
}

kernel void kernel_main(device int* v55 [[buffer(0)]], device int* v56 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v57 = static_cast<int>(__simt_tid3.x);
  int v58 = 0;
  int v59 = v58 + v57;
  int v60 = v56[v59];
  int v61 = 4;
  int v62 = v61 + v57;
  int v63 = v56[v62];
  helper0(v57, v55, v60, v63, static_cast<int>(__simt_tid3.x));
  int v64 = 8;
  int v65 = v64 + v57;
  int v66 = v56[v65];
  int v67 = 0;
  int v68;
  v68 = v67;
  switch (v66) {
    case 0:
      {
      int v69 = 4;
      v68 = v69;
    }
    default:
      {
      int v70 = 12;
      int v71 = v70 + v57;
      int v72 = v56[v71];
      int v73;
      v73 = v57;
      switch (v72) {
        case 0:
          {
          int v74 = 16;
          int v75 = v74 + v57;
          int v76 = v56[v75];
          int v77;
          v77 = v57;
          switch (v76) {
            default:
              {
              int v78 = 3;
              v77 = v78;
              break;
            }
            case 0:
              {
              int v79 = 0;
              int v80 = v57 + v79;
              v77 = v80;
              break;
            }
          }
          bool v81 = true;
          v73 = v77;
        }
        default:
          {
          v73 = v57;
          break;
        }
      }
      v68 = v73;
      break;
    }
  }
  int v82 = 20;
  int v83 = v82 + v57;
  int v84 = v56[v83];
  int v85 = 0;
  bool v86 = v84 != v85;
  int v87;
  if (v86) {
    int v88 = 24;
    int v89 = v88 + v57;
    int v90 = v56[v89];
    uint v91 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v92 = (int)(v91);
    int v93;
    v93 = v92;
    switch (v90) {
      default:
        {
        int v94 = 2;
        v93 = v94;
      }
      case 0:
        {
        int v95 = 28;
        int v96 = v95 + v57;
        int v97 = v56[v96];
        int v98;
        v98 = v57;
        switch (v97) {
          case 0:
            {
            int v99 = 2;
            v98 = v99;
            break;
          }
          case 1:
            {
            int v100 = 2;
            int v101 = v57 + v100;
            v98 = v101;
          }
          case 2:
            {
            v98 = v57;
            break;
          }
          default:
            {
            v98 = v57;
            break;
          }
        }
        v93 = v98;
      }
      case 1:
        {
        int v102 = 32;
        int v103 = v102 + v57;
        int v104 = v56[v103];
        int v105;
        v105 = v57;
        switch (v104) {
          case 0:
            {
            v105 = v57;
            break;
          }
          default:
            {
            int v106 = 4;
            v105 = v106;
          }
          case 1:
            {
            int v107 = 2;
            v105 = v107;
            break;
          }
        }
        v93 = v105;
        break;
      }
      case 2:
        {
        int v108 = 0;
        int v109 = 0;
        int v110;
        int v111;
        v110 = v108;
        v111 = v109;
        while (true) {
          int v112 = 4;
          int v113 = v111 * v112;
          int v114 = v113 + v57;
          int v115 = 36;
          int v116 = v115 + v114;
          int v117 = v56[v116];
          int v118 = 0;
          bool v119 = v117 != v118;
          v110 = v110;
          v111 = v111;
          if (!v119) break;
          int v120 = v110 + v111;
          int v121 = 1;
          int v122 = v111 + v121;
          bool v123 = true;
          v110 = v120;
          v111 = v122;
        }
        v93 = v110;
        break;
      }
    }
    bool v124 = true;
    int v125 = 16;
    int v126 = v125 + v57;
    bool v127 = true;
    int v128 = simt_wave_count_bits(v127);
    v55[v126] = v128;
    v87 = v93;
  } else {
    int v129 = 1;
    int v130 = v57 + v129;
    v87 = v130;
  }
  int v131 = 32;
  int v132 = v131 + v57;
  bool v133 = true;
  int v134 = simt_wave_count_bits(v133);
  v55[v132] = v134;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 56; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
