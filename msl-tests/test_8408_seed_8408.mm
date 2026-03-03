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
    int v13 = 3;
    int v14 = v3 % v13;
    int v15 = 0;
    int v16;
    v16 = v15;
    switch (v14) {
      case 0:
        {
        int v17 = 0;
        bool v18 = v2 != v17;
        int v19;
        if (v18) {
          int v20 = 4;
          int v21 = v0 + v20;
          v19 = v21;
        } else {
          v19 = v0;
        }
        int v22 = 0;
        int v23 = v0 + v22;
        v16 = v19;
        break;
      }
      case 1:
        {
        int v24 = 3;
        int v25 = v3 % v24;
        int v26;
        v26 = v0;
        switch (v25) {
          case 0:
            {
            v26 = v0;
            break;
          }
          case 1:
            {
            int v27 = 0;
            int v28 = v0 + v27;
            v26 = v28;
            break;
          }
          default:
            {
            int v29 = 3;
            int v30 = v0 + v29;
            v26 = v30;
            break;
          }
        }
        int v31 = 4;
        int v32 = v0 + v31;
        v16 = v26;
        break;
      }
      default:
        {
        v16 = v0;
        break;
      }
    }
    int v33 = 1;
    int v34 = 1;
    int v35 = v7 + v34;
    v6 = v16;
    v7 = v35;
    break;
    ;
  }
  bool v36 = true;
  int v37 = simt_wave_count_bits(v36);
  int v38 = 0;
  int v39 = v38 + v0;
  v1[v39] = v37;
  return;
}

kernel void kernel_main(device int* v40 [[buffer(0)]], device int* v41 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v42 = static_cast<int>(__simt_tid3.x);
  int v43 = 0;
  int v44 = v43 + v42;
  int v45 = v41[v44];
  int v46 = 4;
  int v47 = v46 + v42;
  int v48 = v41[v47];
  helper0(v42, v40, v45, v48, static_cast<int>(__simt_tid3.x));
  int v49 = 8;
  int v50 = v49 + v42;
  int v51 = v41[v50];
  int v52 = 0;
  int v53;
  v53 = v52;
  switch (v51) {
    case 0:
      {
      int v54 = 1;
      v53 = v54;
      break;
    }
    case 1:
      {
      int v55 = 12;
      int v56 = v55 + v42;
      int v57 = v41[v56];
      int v58 = 1;
      int v59;
      v59 = v58;
      switch (v57) {
        case 0:
          {
          int v60 = 16;
          int v61 = v60 + v42;
          int v62 = v41[v61];
          int v63;
          v63 = v42;
          switch (v62) {
            case 0:
              {
              int v64 = 0;
              v63 = v64;
            }
            default:
              {
              int v65 = 4;
              int v66 = v42 + v65;
              v63 = v66;
              break;
            }
            case 1:
              {
              int v67 = 4;
              v63 = v67;
              break;
            }
            case 2:
              {
              int v68 = 1;
              int v69 = v42 + v68;
              v63 = v69;
              break;
            }
          }
          bool v70 = true;
          v59 = v63;
        }
        case 1:
          {
          v59 = v42;
          break;
        }
        case 2:
          {
          int v71 = 3;
          v59 = v71;
          break;
        }
        default:
          {
          int v72 = 20;
          int v73 = v72 + v42;
          int v74 = v41[v73];
          int v75 = 0;
          bool v76 = v74 != v75;
          int v77;
          if (v76) {
            v77 = v42;
          } else {
            int v78 = 2;
            int v79 = v42 + v78;
            v77 = v79;
          }
          v59 = v77;
          break;
        }
      }
      bool v80 = true;
      v53 = v59;
      break;
    }
    default:
      {
      int v81 = 24;
      int v82 = v81 + v42;
      int v83 = v41[v82];
      int v84;
      v84 = v42;
      switch (v83) {
        case 0:
          {
          int v85 = 0;
          int v86 = v42 + v85;
          v84 = v86;
        }
        default:
          {
          int v87 = 28;
          int v88 = v87 + v42;
          int v89 = v41[v88];
          int v90 = 0;
          int v91 = v42 + v90;
          int v92;
          v92 = v91;
          switch (v89) {
            default:
              {
              v92 = v42;
              break;
            }
            case 0:
              {
              int v93 = 0;
              v92 = v93;
              break;
            }
          }
          bool v94 = true;
          v84 = v92;
          break;
        }
        case 1:
          {
          int v95 = 32;
          int v96 = v95 + v42;
          int v97 = v41[v96];
          int v98 = 0;
          bool v99 = v97 != v98;
          int v100;
          if (v99) {
            v100 = v42;
          } else {
            int v101 = 3;
            v100 = v101;
          }
          v84 = v100;
          break;
        }
        case 2:
          {
          int v102 = 1;
          v84 = v102;
          break;
        }
      }
      bool v103 = true;
      v53 = v84;
      break;
    }
    case 2:
      {
      int v104 = 36;
      int v105 = v104 + v42;
      int v106 = v41[v105];
      int v107 = 1;
      int v108;
      v108 = v107;
      switch (v106) {
        default:
          {
          int v109 = 40;
          int v110 = v109 + v42;
          int v111 = v41[v110];
          int v112 = 1;
          int v113 = v42 + v112;
          int v114;
          v114 = v113;
          switch (v111) {
            default:
              {
              int v115 = 1;
              v114 = v115;
              break;
            }
            case 0:
              {
              v114 = v42;
              break;
            }
            case 1:
              {
              v114 = v42;
              break;
            }
          }
          bool v116 = true;
          v108 = v114;
          break;
        }
        case 0:
          {
          int v117 = 44;
          int v118 = v117 + v42;
          int v119 = v41[v118];
          int v120 = 0;
          bool v121 = v119 != v120;
          int v122;
          if (v121) {
            int v123 = 4;
            int v124 = v42 + v123;
            v122 = v124;
          } else {
            v122 = v42;
          }
          v108 = v122;
        }
        case 1:
          {
          int v125 = 48;
          int v126 = v125 + v42;
          int v127 = v41[v126];
          int v128 = 0;
          bool v129 = v127 != v128;
          int v130;
          if (v129) {
            int v131 = 1;
            int v132 = v42 + v131;
            v130 = v132;
          } else {
            v130 = v42;
          }
          v108 = v130;
        }
        case 2:
          {
          v108 = v42;
          break;
        }
      }
      bool v133 = true;
      v53 = v108;
      break;
    }
  }
  bool v134 = true;
  int v135 = 16;
  int v136 = v135 + v42;
  bool v137 = true;
  int v138 = simt_wave_count_bits(v137);
  v40[v136] = v138;
  int v139 = 3;
  int v140 = v42 + v139;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 52; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
