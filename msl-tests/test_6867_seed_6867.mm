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
  int v6 = 4;
  int v7;
  v7 = v6;
  switch (v5) {
    case 0:
      {
      int v8 = 4;
      int v9 = v3 % v8;
      int v10;
      v10 = v0;
      switch (v9) {
        case 0:
          {
          v10 = v0;
          break;
        }
        case 1:
          {
          int v11 = 0;
          int v12 = 0;
          int v13;
          int v14;
          v13 = v11;
          v14 = v12;
          while (true) {
            int v15 = 4;
            int v16 = v3 % v15;
            int v17 = 1;
            int v18 = v16 + v17;
            bool v19 = v14 < v18;
            v13 = v13;
            v14 = v14;
            if (!v19) break;
            int v20 = 1;
            int v21 = v14 + v20;
            v13 = v0;
            v14 = v21;
          }
          v10 = v13;
          break;
        }
        default:
          {
          int v22 = 4;
          int v23 = v3 % v22;
          int v24 = 1;
          int v25 = v0 + v24;
          int v26;
          v26 = v25;
          switch (v23) {
            default:
              {
              int v27 = 4;
              int v28 = v0 + v27;
              v26 = v28;
              break;
            }
            case 0:
              {
              int v29 = 3;
              v26 = v29;
              break;
            }
            case 1:
              {
              int v30 = 1;
              int v31 = v0 + v30;
              v26 = v31;
              break;
            }
            case 2:
              {
              int v32 = 1;
              v26 = v32;
              break;
            }
          }
          int v33 = 2;
          int v34 = v0 + v33;
          v10 = v26;
          break;
        }
        case 2:
          {
          v10 = v0;
          break;
        }
      }
      int v35 = 1;
      v7 = v10;
    }
    case 1:
      {
      int v36 = 1;
      int v37 = v0 + v36;
      int v38;
      v38 = v37;
      switch (v3) {
        default:
          {
          int v39 = 0;
          bool v40 = v2 != v39;
          int v41;
          if (v40) {
            int v42 = 0;
            v41 = v42;
          } else {
            int v43 = 3;
            v41 = v43;
          }
          int v44 = 3;
          int v45 = v0 + v44;
          v38 = v41;
          break;
        }
        case 0:
          {
          int v46 = 0;
          int v47 = 0;
          int v48;
          int v49;
          v48 = v46;
          v49 = v47;
          while (true) {
            int v50 = 4;
            int v51 = v3 % v50;
            int v52 = 1;
            int v53 = v51 + v52;
            bool v54 = v49 < v53;
            v48 = v48;
            v49 = v49;
            if (!v54) break;
            int v55 = 1;
            int v56 = v49 + v55;
            v48 = v0;
            v49 = v56;
          }
          v38 = v48;
          break;
        }
      }
      v7 = v38;
      break;
    }
    default:
      {
      int v57;
      v57 = v0;
      switch (v3) {
        case 0:
          {
          v57 = v0;
        }
        default:
          {
          int v58 = 0;
          int v59 = 0;
          int v60;
          int v61;
          v60 = v58;
          v61 = v59;
          while (true) {
            int v62 = 4;
            int v63 = v3 % v62;
            int v64 = 1;
            int v65 = v63 + v64;
            bool v66 = v61 < v65;
            v60 = v60;
            v61 = v61;
            if (!v66) break;
            int v67 = 1;
            int v68 = v61 + v67;
            v60 = v0;
            v61 = v68;
            continue;
            ;
          }
          v57 = v60;
          break;
        }
      }
      v7 = v57;
    }
    case 2:
      {
      int v69 = 2;
      int v70 = v3 % v69;
      int v71 = 2;
      int v72;
      v72 = v71;
      switch (v70) {
        case 0:
          {
          v72 = v0;
        }
        case 1:
          {
          int v73;
          v73 = v0;
          switch (v3) {
            case 0:
              {
              int v74 = 2;
              int v75 = v0 + v74;
              v73 = v75;
            }
            default:
              {
              v73 = v0;
              break;
            }
          }
          int v76 = 0;
          v72 = v73;
          break;
        }
        default:
          {
          v72 = v0;
          break;
        }
      }
      v7 = v72;
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
  int v90 = 0;
  int v91 = 0;
  int v92;
  int v93;
  v92 = v90;
  v93 = v91;
  while (true) {
    int v94 = 4;
    int v95 = v93 * v94;
    int v96 = v95 + v83;
    int v97 = 8;
    int v98 = v97 + v96;
    int v99 = v82[v98];
    int v100 = 0;
    bool v101 = v99 != v100;
    v92 = v92;
    v93 = v93;
    if (!v101) break;
    int v102 = v92 + v93;
    int v103 = 1;
    int v104 = v93 + v103;
    v92 = v102;
    v93 = v104;
  }
  bool v105 = true;
  int v106 = 16;
  int v107 = v106 + v83;
  bool v108 = true;
  int v109 = simt_wave_count_bits(v108);
  v81[v107] = v109;
  int v110 = 28;
  int v111 = v110 + v83;
  int v112 = v82[v111];
  int v113 = 0;
  int v114;
  v114 = v113;
  switch (v112) {
    default:
      {
      int v115 = 3;
      v114 = v115;
      break;
    }
    case 0:
      {
      int v116 = 0;
      int v117 = 0;
      int v118;
      int v119;
      v118 = v116;
      v119 = v117;
      while (true) {
        int v120 = 4;
        int v121 = v119 * v120;
        int v122 = v121 + v83;
        int v123 = 32;
        int v124 = v123 + v122;
        int v125 = v82[v124];
        int v126 = 0;
        bool v127 = v125 != v126;
        v118 = v118;
        v119 = v119;
        if (!v127) break;
        int v128 = 52;
        int v129 = v128 + v83;
        int v130 = v82[v129];
        int v131 = 4;
        int v132;
        v132 = v131;
        switch (v130) {
          case 0:
            {
            v132 = v83;
            break;
          }
          case 1:
            {
            int v133 = 1;
            v132 = v133;
            break;
          }
          case 2:
            {
            v132 = v83;
            break;
          }
          default:
            {
            v132 = v83;
            break;
          }
        }
        bool v134 = true;
        int v135 = v118 + v132;
        int v136 = 1;
        int v137 = v119 + v136;
        v118 = v135;
        v119 = v137;
      }
      bool v138 = true;
      v114 = v118;
      break;
    }
    case 1:
      {
      int v139 = 0;
      v114 = v139;
      break;
    }
    case 2:
      {
      int v140 = 56;
      int v141 = v140 + v83;
      int v142 = v82[v141];
      int v143 = 0;
      bool v144 = v142 != v143;
      int v145;
      if (v144) {
        int v146 = 3;
        int v147 = v83 + v146;
        v145 = v147;
      } else {
        v145 = v83;
      }
      v114 = v145;
      break;
    }
  }
  bool v148 = true;
  int v149 = 32;
  int v150 = v149 + v83;
  bool v151 = true;
  int v152 = simt_wave_count_bits(v151);
  v81[v150] = v152;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
