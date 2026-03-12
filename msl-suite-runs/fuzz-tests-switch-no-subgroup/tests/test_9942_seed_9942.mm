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
      int v10 = 2;
      int v11 = v3 % v10;
      int v12 = 1;
      int v13;
      v13 = v12;
      switch (v11) {
        case 0:
          {
          int v14 = 3;
          int v15 = v0 + v14;
          v13 = v15;
          break;
        }
        case 1:
          {
          v13 = v0;
          break;
        }
        default:
          {
          v13 = v0;
          break;
        }
      }
      bool v16 = true;
      int v17 = simt_wave_count_bits(v16);
      int v18 = 0;
      int v19 = v18 + v0;
      v1[v19] = v17;
      v9 = v13;
    } else {
      int v20 = 0;
      bool v21 = v2 != v20;
      int v22;
      if (v21) {
        bool v23 = true;
        int v24 = simt_wave_count_bits(v23);
        int v25 = 16;
        int v26 = v25 + v0;
        v1[v26] = v24;
        v22 = v24;
      } else {
        bool v27 = true;
        int v28 = simt_wave_count_bits(v27);
        int v29 = 32;
        int v30 = v29 + v0;
        v1[v30] = v28;
        v22 = v28;
      }
      v9 = v22;
    }
    v6 = v9;
  } else {
    int v31;
    v31 = v0;
    switch (v3) {
      case 0:
        {
        int v32 = 0;
        bool v33 = v2 != v32;
        int v34;
        if (v33) {
          int v35 = 4;
          v34 = v35;
        } else {
          int v36 = 4;
          v34 = v36;
        }
        v31 = v34;
        break;
      }
      default:
        {
        int v37 = 3;
        int v38 = v3 % v37;
        int v39 = 0;
        int v40;
        v40 = v39;
        switch (v38) {
          case 0:
            {
            int v41 = 3;
            v40 = v41;
            break;
          }
          case 1:
            {
            int v42 = 2;
            int v43 = v0 + v42;
            v40 = v43;
            break;
          }
          default:
            {
            int v44 = 4;
            int v45 = v0 + v44;
            v40 = v45;
            break;
          }
          case 2:
            {
            int v46 = 4;
            v40 = v46;
            break;
          }
        }
        int v47 = 1;
        v31 = v40;
        break;
      }
    }
    bool v48 = true;
    int v49 = simt_wave_count_bits(v48);
    int v50 = 48;
    int v51 = v50 + v0;
    v1[v51] = v49;
    v6 = v31;
  }
  return;
}

kernel void kernel_main(device int* v52 [[buffer(0)]], device int* v53 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v54 = static_cast<int>(__simt_tid3.x);
  int v55 = 0;
  int v56 = v55 + v54;
  int v57 = v53[v56];
  int v58 = 4;
  int v59 = v58 + v54;
  int v60 = v53[v59];
  helper0(v54, v52, v57, v60, static_cast<int>(__simt_tid3.x));
  uint v61 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v62 = (int)(v61);
  int v63 = 8;
  int v64 = v63 + v54;
  int v65 = v53[v64];
  int v66 = 4;
  int v67;
  v67 = v66;
  switch (v65) {
    case 0:
      {
      int v68 = 12;
      int v69 = v68 + v54;
      int v70 = v53[v69];
      int v71 = 0;
      bool v72 = v70 != v71;
      int v73;
      if (v72) {
        int v74 = 16;
        int v75 = v74 + v54;
        int v76 = v53[v75];
        int v77 = 3;
        int v78 = v54 + v77;
        int v79;
        v79 = v78;
        switch (v76) {
          case 0:
            {
            v79 = v54;
            break;
          }
          case 1:
            {
            int v80 = 0;
            int v81 = v54 + v80;
            v79 = v81;
            break;
          }
          case 2:
            {
            v79 = v54;
            break;
          }
          default:
            {
            v79 = v54;
            break;
          }
        }
        v73 = v79;
      } else {
        int v82 = 20;
        int v83 = v82 + v54;
        int v84 = v53[v83];
        int v85 = 0;
        bool v86 = v84 != v85;
        int v87;
        if (v86) {
          int v88 = 3;
          int v89 = v54 + v88;
          v87 = v89;
        } else {
          int v90 = 0;
          v87 = v90;
        }
        v73 = v87;
      }
      v67 = v73;
      break;
    }
    default:
      {
      int v91 = 24;
      int v92 = v91 + v54;
      int v93 = v53[v92];
      int v94 = 3;
      int v95 = v54 + v94;
      int v96;
      v96 = v95;
      switch (v93) {
        case 0:
          {
          v96 = v54;
          break;
        }
        case 1:
          {
          int v97 = 28;
          int v98 = v97 + v54;
          int v99 = v53[v98];
          int v100 = 4;
          int v101;
          v101 = v100;
          switch (v99) {
            default:
              {
              int v102 = 3;
              v101 = v102;
              break;
            }
            case 0:
              {
              int v103 = 0;
              v101 = v103;
              break;
            }
            case 1:
              {
              int v104 = 4;
              v101 = v104;
            }
            case 2:
              {
              int v105 = 4;
              v101 = v105;
              break;
            }
          }
          bool v106 = true;
          v96 = v101;
          break;
        }
        default:
          {
          int v107 = 32;
          int v108 = v107 + v54;
          int v109 = v53[v108];
          int v110 = 2;
          int v111;
          v111 = v110;
          switch (v109) {
            default:
              {
              v111 = v54;
              break;
            }
            case 0:
              {
              int v112 = 0;
              int v113 = v54 + v112;
              v111 = v113;
              break;
            }
            case 1:
              {
              int v114 = 2;
              int v115 = v54 + v114;
              v111 = v115;
            }
            case 2:
              {
              v111 = v54;
              break;
            }
          }
          bool v116 = true;
          v96 = v111;
          break;
        }
        case 2:
          {
          int v117 = 0;
          int v118 = v54 + v117;
          v96 = v118;
          break;
        }
      }
      v67 = v96;
    }
    case 1:
      {
      int v119 = 36;
      int v120 = v119 + v54;
      int v121 = v53[v120];
      int v122 = 0;
      int v123 = v54 + v122;
      int v124;
      v124 = v123;
      switch (v121) {
        default:
          {
          int v125 = 0;
          int v126 = 0;
          int v127;
          int v128;
          v127 = v125;
          v128 = v126;
          while (true) {
            int v129 = 4;
            int v130 = v128 * v129;
            int v131 = v130 + v54;
            int v132 = 40;
            int v133 = v132 + v131;
            int v134 = v53[v133];
            int v135 = 0;
            bool v136 = v134 != v135;
            v127 = v127;
            v128 = v128;
            if (!v136) break;
            int v137 = v127 + v128;
            int v138 = 1;
            int v139 = v128 + v138;
            bool v140 = true;
            v127 = v137;
            v128 = v139;
          }
          v124 = v127;
          break;
        }
        case 0:
          {
          int v141 = 60;
          int v142 = v141 + v54;
          int v143 = v53[v142];
          int v144 = 0;
          bool v145 = v143 != v144;
          int v146;
          if (v145) {
            int v147 = 3;
            int v148 = v54 + v147;
            v146 = v148;
          } else {
            int v149 = 3;
            v146 = v149;
          }
          v124 = v146;
          break;
        }
      }
      v67 = v124;
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 64; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
