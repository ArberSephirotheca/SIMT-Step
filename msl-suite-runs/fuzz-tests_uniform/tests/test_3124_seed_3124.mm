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
      int v9 = 4;
      int v10 = v3 % v9;
      int v11 = 3;
      int v12;
      v12 = v11;
      switch (v10) {
        default:
          {
          int v13;
          v13 = v0;
          switch (v3) {
            case 0:
              {
              int v14 = 3;
              v13 = v14;
              break;
            }
            default:
              {
              int v15 = 0;
              int v16 = v0 + v15;
              v13 = v16;
              break;
            }
          }
          v12 = v13;
          break;
        }
        case 0:
          {
          int v17 = 0;
          bool v18 = v2 != v17;
          int v19;
          if (v18) {
            int v20 = 0;
            int v21 = v0 + v20;
            v19 = v21;
          } else {
            int v22 = 3;
            int v23 = v0 + v22;
            v19 = v23;
          }
          int v24 = 4;
          int v25 = v0 + v24;
          v12 = v19;
        }
        case 1:
          {
          int v26 = 0;
          bool v27 = v2 != v26;
          int v28;
          if (v27) {
            int v29 = 1;
            int v30 = v0 + v29;
            v28 = v30;
          } else {
            int v31 = 2;
            v28 = v31;
          }
          v12 = v28;
        }
        case 2:
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
            int v41 = 1;
            int v42 = v35 + v41;
            v34 = v0;
            v35 = v42;
          }
          int v43 = 4;
          v12 = v34;
          break;
        }
      }
      v8 = v12;
      break;
    }
    case 0:
      {
      int v44 = 2;
      int v45 = v3 % v44;
      int v46;
      v46 = v0;
      switch (v45) {
        case 0:
          {
          int v47 = 2;
          int v48 = v3 % v47;
          int v49;
          v49 = v0;
          switch (v48) {
            case 0:
              {
              int v50 = 2;
              v49 = v50;
              break;
            }
            case 1:
              {
              int v51 = 4;
              int v52 = v0 + v51;
              v49 = v52;
              break;
            }
            default:
              {
              int v53 = 4;
              v49 = v53;
              break;
            }
          }
          int v54 = 4;
          v46 = v49;
          break;
        }
        default:
          {
          int v55 = 0;
          bool v56 = v2 != v55;
          int v57;
          if (v56) {
            int v58 = 1;
            v57 = v58;
          } else {
            int v59 = 3;
            int v60 = v0 + v59;
            v57 = v60;
          }
          v46 = v57;
          break;
        }
        case 1:
          {
          int v61 = 3;
          int v62 = v3 % v61;
          int v63 = 3;
          int v64 = v0 + v63;
          int v65;
          v65 = v64;
          switch (v62) {
            default:
              {
              int v66 = 1;
              int v67 = v0 + v66;
              v65 = v67;
              break;
            }
            case 0:
              {
              v65 = v0;
              break;
            }
            case 1:
              {
              v65 = v0;
              break;
            }
          }
          int v68 = 2;
          int v69 = v0 + v68;
          v46 = v65;
          break;
        }
      }
      int v70 = 2;
      v8 = v46;
      break;
    }
    case 1:
      {
      int v71 = 0;
      int v72 = 0;
      int v73;
      int v74;
      v73 = v71;
      v74 = v72;
      while (true) {
        int v75 = 4;
        int v76 = v3 % v75;
        int v77 = 1;
        int v78 = v76 + v77;
        bool v79 = v74 < v78;
        v73 = v73;
        v74 = v74;
        if (!v79) break;
        int v80 = 4;
        int v81 = v3 % v80;
        int v82 = 3;
        int v83 = v0 + v82;
        int v84;
        v84 = v83;
        switch (v81) {
          default:
            {
            int v85 = 3;
            int v86 = v0 + v85;
            v84 = v86;
            break;
          }
          case 0:
            {
            v84 = v0;
            break;
          }
          case 1:
            {
            int v87 = 2;
            v84 = v87;
          }
          case 2:
            {
            int v88 = 3;
            v84 = v88;
            break;
          }
        }
        int v89 = 0;
        int v90 = 1;
        int v91 = v74 + v90;
        v73 = v84;
        v74 = v91;
      }
      int v92 = 1;
      v8 = v73;
      break;
    }
  }
  bool v93 = true;
  int v94 = simt_wave_count_bits(v93);
  int v95 = 0;
  int v96 = v95 + v0;
  v1[v96] = v94;
  return;
}

kernel void kernel_main(device int* v97 [[buffer(0)]], device int* v98 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v99 = static_cast<int>(__simt_tid3.x);
  int v100 = 0;
  int v101 = v100 + v99;
  int v102 = v98[v101];
  int v103 = 4;
  int v104 = v103 + v99;
  int v105 = v98[v104];
  helper0(v99, v97, v102, v105, static_cast<int>(__simt_tid3.x));
  int v106 = 8;
  int v107 = v106 + v99;
  int v108 = v98[v107];
  int v109 = 3;
  int v110 = v99 + v109;
  int v111;
  v111 = v110;
  switch (v108) {
    case 0:
      {
      int v112 = 0;
      int v113 = v99 + v112;
      v111 = v113;
      break;
    }
    case 1:
      {
      int v114 = 12;
      int v115 = v114 + v99;
      int v116 = v98[v115];
      int v117 = 0;
      bool v118 = v116 != v117;
      int v119;
      if (v118) {
        int v120 = 16;
        int v121 = v120 + v99;
        int v122 = v98[v121];
        int v123 = 2;
        int v124 = v99 + v123;
        int v125;
        v125 = v124;
        switch (v122) {
          default:
            {
            int v126 = 1;
            v125 = v126;
            break;
          }
          case 0:
            {
            int v127 = 1;
            v125 = v127;
            break;
          }
          case 1:
            {
            v125 = v99;
          }
          case 2:
            {
            int v128 = 4;
            v125 = v128;
            break;
          }
        }
        bool v129 = true;
        v119 = v125;
      } else {
        int v130 = 4;
        v119 = v130;
      }
      v111 = v119;
      break;
    }
    default:
      {
      int v131 = 20;
      int v132 = v131 + v99;
      int v133 = v98[v132];
      int v134 = 0;
      bool v135 = v133 != v134;
      int v136;
      if (v135) {
        int v137 = 24;
        int v138 = v137 + v99;
        int v139 = v98[v138];
        int v140 = 1;
        int v141;
        v141 = v140;
        switch (v139) {
          case 0:
            {
            v141 = v99;
          }
          case 1:
            {
            v141 = v99;
            break;
          }
          default:
            {
            int v142 = 0;
            v141 = v142;
            break;
          }
        }
        bool v143 = true;
        v136 = v141;
      } else {
        v136 = v99;
      }
      v111 = v136;
      break;
    }
  }
  bool v144 = true;
  int v145 = 16;
  int v146 = v145 + v99;
  bool v147 = true;
  int v148 = simt_wave_count_bits(v147);
  v97[v146] = v148;
  uint v149 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v150 = (int)(v149);
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 20; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 28; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
