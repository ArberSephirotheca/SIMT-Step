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
  int v6 = 2;
  int v7;
  v7 = v6;
  switch (v5) {
    default:
      {
      int v8 = 0;
      bool v9 = v2 != v8;
      int v10;
      if (v9) {
        int v11 = 4;
        int v12 = v3 % v11;
        int v13 = 1;
        int v14;
        v14 = v13;
        switch (v12) {
          case 0:
            {
            int v15 = 4;
            v14 = v15;
          }
          case 1:
            {
            int v16 = 2;
            v14 = v16;
          }
          case 2:
            {
            v14 = v0;
          }
          default:
            {
            int v17 = 4;
            v14 = v17;
            break;
          }
        }
        int v18 = 0;
        int v19 = v0 + v18;
        v10 = v14;
      } else {
        int v20 = 4;
        int v21 = v3 % v20;
        int v22 = 3;
        int v23 = v0 + v22;
        int v24;
        v24 = v23;
        switch (v21) {
          case 0:
            {
            int v25 = 0;
            v24 = v25;
            break;
          }
          case 1:
            {
            v24 = v0;
            break;
          }
          case 2:
            {
            v24 = v0;
            break;
          }
          default:
            {
            int v26 = 0;
            v24 = v26;
            break;
          }
        }
        int v27 = 2;
        v10 = v24;
      }
      int v28 = 2;
      v7 = v10;
      break;
    }
    case 0:
      {
      int v29 = 0;
      int v30 = 0;
      int v31;
      int v32;
      v31 = v29;
      v32 = v30;
      while (true) {
        int v33 = 4;
        int v34 = v3 % v33;
        int v35 = 1;
        int v36 = v34 + v35;
        bool v37 = v32 < v36;
        v31 = v31;
        v32 = v32;
        if (!v37) break;
        int v38 = 2;
        int v39 = v3 % v38;
        int v40 = 1;
        int v41;
        v41 = v40;
        switch (v39) {
          case 0:
            {
            int v42 = 3;
            int v43 = v0 + v42;
            v41 = v43;
            break;
          }
          case 1:
            {
            int v44 = 2;
            int v45 = v0 + v44;
            v41 = v45;
            break;
          }
          default:
            {
            int v46 = 3;
            int v47 = v0 + v46;
            v41 = v47;
            break;
          }
        }
        int v48 = 4;
        int v49 = v0 + v48;
        int v50 = 1;
        int v51 = v32 + v50;
        v31 = v41;
        v32 = v51;
        break;
        ;
      }
      v7 = v31;
      break;
    }
    case 1:
      {
      int v52 = 4;
      int v53 = v3 % v52;
      int v54 = 4;
      int v55;
      v55 = v54;
      switch (v53) {
        case 0:
          {
          int v56 = 0;
          bool v57 = v2 != v56;
          int v58;
          if (v57) {
            v58 = v0;
          } else {
            v58 = v0;
          }
          int v59 = 4;
          int v60 = v0 + v59;
          v55 = v58;
          break;
        }
        case 1:
          {
          int v61 = 0;
          v55 = v61;
          break;
        }
        default:
          {
          int v62 = 3;
          int v63 = v3 % v62;
          int v64 = 0;
          int v65;
          v65 = v64;
          switch (v63) {
            case 0:
              {
              v65 = v0;
            }
            case 1:
              {
              int v66 = 0;
              v65 = v66;
              break;
            }
            default:
              {
              int v67 = 3;
              v65 = v67;
              break;
            }
          }
          int v68 = 4;
          v55 = v65;
          break;
        }
        case 2:
          {
          int v69 = 1;
          int v70 = v0 + v69;
          v55 = v70;
          break;
        }
      }
      int v71 = 4;
      v7 = v55;
      break;
    }
    case 2:
      {
      int v72 = 0;
      bool v73 = v2 != v72;
      int v74;
      if (v73) {
        v74 = v0;
      } else {
        int v75 = 1;
        v74 = v75;
      }
      int v76 = 4;
      v7 = v74;
      break;
    }
  }
  bool v77 = true;
  int v78 = simt_wave_count_bits(v77);
  int v79 = 0;
  int v80 = v79 + v0;
  v1[v80] = v78;
  return;
}

kernel void kernel_main(device int* v81 [[buffer(0)]], device int* v82 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v83 = static_cast<int>(__simt_tid3.x);
  int v84 = 0;
  int v85 = v84 + v83;
  int v86 = v82[v85];
  int v87 = 4;
  int v88 = v87 + v83;
  int v89 = v82[v88];
  helper0(v83, v81, v86, v89, static_cast<int>(__simt_tid3.x));
  int v90 = 8;
  int v91 = v90 + v83;
  int v92 = v82[v91];
  int v93 = 4;
  int v94 = v83 + v93;
  int v95;
  v95 = v94;
  switch (v92) {
    case 0:
      {
      int v96 = 3;
      int v97 = v83 + v96;
      v95 = v97;
      break;
    }
    default:
      {
      v95 = v83;
      break;
    }
  }
  bool v98 = true;
  int v99 = 16;
  int v100 = v99 + v83;
  bool v101 = true;
  int v102 = simt_wave_count_bits(v101);
  v81[v100] = v102;
  int v103 = 12;
  int v104 = v103 + v83;
  int v105 = v82[v104];
  int v106 = 0;
  bool v107 = v105 != v106;
  int v108;
  if (v107) {
    int v109 = 16;
    int v110 = v109 + v83;
    int v111 = v82[v110];
    uint v112 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v113 = (int)(v112);
    int v114;
    v114 = v113;
    switch (v111) {
      default:
        {
        int v115 = 3;
        int v116 = v83 + v115;
        v114 = v116;
        break;
      }
      case 0:
        {
        int v117 = 3;
        int v118 = v83 + v117;
        v114 = v118;
        break;
      }
      case 1:
        {
        v114 = v83;
        break;
      }
    }
    bool v119 = true;
    v108 = v114;
  } else {
    int v120 = 20;
    int v121 = v120 + v83;
    int v122 = v82[v121];
    int v123 = 0;
    bool v124 = v122 != v123;
    int v125;
    if (v124) {
      int v126 = 0;
      int v127 = 0;
      int v128;
      int v129;
      v128 = v126;
      v129 = v127;
      while (true) {
        int v130 = 4;
        int v131 = v129 * v130;
        int v132 = v131 + v83;
        int v133 = 24;
        int v134 = v133 + v132;
        int v135 = v82[v134];
        int v136 = 0;
        bool v137 = v135 != v136;
        v128 = v128;
        v129 = v129;
        if (!v137) break;
        int v138 = v128 + v129;
        int v139 = 1;
        int v140 = v129 + v139;
        v128 = v138;
        v129 = v140;
        break;
        ;
      }
      bool v141 = true;
      v125 = v128;
    } else {
      int v142 = 44;
      int v143 = v142 + v83;
      int v144 = v82[v143];
      int v145 = 0;
      bool v146 = v144 != v145;
      int v147;
      if (v146) {
        int v148 = 2;
        int v149 = v83 + v148;
        v147 = v149;
      } else {
        v147 = v83;
      }
      v125 = v147;
    }
    v108 = v125;
  }
  int v150 = 32;
  int v151 = v150 + v83;
  bool v152 = true;
  int v153 = simt_wave_count_bits(v152);
  v81[v151] = v153;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 48; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
