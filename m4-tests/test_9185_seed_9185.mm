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
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 0;
      int v10 = 0;
      int v11;
      int v12;
      v11 = v9;
      v12 = v10;
      while (true) {
        int v13 = 4;
        int v14 = v3 % v13;
        int v15 = 1;
        int v16 = v14 + v15;
        bool v17 = v12 < v16;
        v11 = v11;
        v12 = v12;
        if (!v17) break;
        int v18 = 3;
        int v19 = v3 % v18;
        int v20 = 4;
        int v21 = v0 + v20;
        int v22;
        v22 = v21;
        switch (v19) {
          case 0:
            {
            int v23 = 4;
            v22 = v23;
            break;
          }
          case 1:
            {
            int v24 = 2;
            v22 = v24;
            break;
          }
          case 2:
            {
            int v25 = 1;
            v22 = v25;
            break;
          }
          default:
            {
            int v26 = 1;
            int v27 = v0 + v26;
            v22 = v27;
            break;
          }
        }
        int v28 = 1;
        int v29 = v12 + v28;
        v11 = v22;
        v12 = v29;
        continue;
        ;
      }
      v8 = v11;
      break;
    }
    case 0:
      {
      int v30 = 4;
      int v31 = v3 % v30;
      int v32 = 3;
      int v33 = v0 + v32;
      int v34;
      v34 = v33;
      switch (v31) {
        default:
          {
          int v35 = 3;
          int v36 = v3 % v35;
          int v37 = 4;
          int v38;
          v38 = v37;
          switch (v36) {
            default:
              {
              int v39 = 4;
              v38 = v39;
            }
            case 0:
              {
              v38 = v0;
              break;
            }
            case 1:
              {
              v38 = v0;
              break;
            }
          }
          v34 = v38;
          break;
        }
        case 0:
          {
          int v40 = 4;
          int v41 = v0 + v40;
          int v42;
          v42 = v41;
          switch (v3) {
            default:
              {
              int v43 = 0;
              int v44 = v0 + v43;
              v42 = v44;
              break;
            }
            case 0:
              {
              int v45 = 0;
              v42 = v45;
              break;
            }
          }
          v34 = v42;
          break;
        }
        case 1:
          {
          int v46 = 3;
          int v47 = v3 % v46;
          int v48;
          v48 = v0;
          switch (v47) {
            case 0:
              {
              v48 = v0;
              break;
            }
            case 1:
              {
              v48 = v0;
              break;
            }
            default:
              {
              int v49 = 3;
              v48 = v49;
              break;
            }
          }
          int v50 = 3;
          int v51 = v0 + v50;
          v34 = v48;
          break;
        }
        case 2:
          {
          int v52 = 0;
          bool v53 = v2 != v52;
          int v54;
          if (v53) {
            int v55 = 0;
            int v56 = v0 + v55;
            v54 = v56;
          } else {
            v54 = v0;
          }
          v34 = v54;
          break;
        }
      }
      v8 = v34;
      break;
    }
  }
  bool v57 = true;
  int v58 = simt_wave_count_bits(v57);
  int v59 = 0;
  int v60 = v59 + v0;
  v1[v60] = v58;
  return;
}

kernel void kernel_main(device int* v61 [[buffer(0)]], device int* v62 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v63 = static_cast<int>(__simt_tid3.x);
  int v64 = 0;
  int v65 = v64 + v63;
  int v66 = v62[v65];
  int v67 = 4;
  int v68 = v67 + v63;
  int v69 = v62[v68];
  helper0(v63, v61, v66, v69, static_cast<int>(__simt_tid3.x));
  int v70 = 3;
  int v71 = 8;
  int v72 = v71 + v63;
  int v73 = v62[v72];
  uint v74 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v75 = (int)(v74);
  int v76;
  v76 = v75;
  switch (v73) {
    case 0:
      {
      int v77 = 12;
      int v78 = v77 + v63;
      int v79 = v62[v78];
      int v80;
      v80 = v63;
      switch (v79) {
        case 0:
          {
          int v81 = 16;
          int v82 = v81 + v63;
          int v83 = v62[v82];
          int v84 = 3;
          int v85 = v63 + v84;
          int v86;
          v86 = v85;
          switch (v83) {
            case 0:
              {
              int v87 = 0;
              int v88 = v63 + v87;
              v86 = v88;
            }
            case 1:
              {
              v86 = v63;
            }
            default:
              {
              v86 = v63;
              break;
            }
          }
          bool v89 = true;
          v80 = v86;
        }
        case 1:
          {
          int v90 = 20;
          int v91 = v90 + v63;
          int v92 = v62[v91];
          int v93 = 0;
          int v94;
          v94 = v93;
          switch (v92) {
            case 0:
              {
              v94 = v63;
              break;
            }
            case 1:
              {
              int v95 = 1;
              v94 = v95;
              break;
            }
            default:
              {
              int v96 = 2;
              int v97 = v63 + v96;
              v94 = v97;
              break;
            }
            case 2:
              {
              v94 = v63;
              break;
            }
          }
          v80 = v94;
        }
        default:
          {
          int v98 = 4;
          int v99 = v63 + v98;
          v80 = v99;
          break;
        }
        case 2:
          {
          int v100 = 2;
          v80 = v100;
          break;
        }
      }
      bool v101 = true;
      v76 = v80;
      break;
    }
    default:
      {
      int v102 = 24;
      int v103 = v102 + v63;
      int v104 = v62[v103];
      int v105;
      v105 = v63;
      switch (v104) {
        default:
          {
          int v106 = 1;
          int v107 = v63 + v106;
          v105 = v107;
          break;
        }
        case 0:
          {
          int v108 = 28;
          int v109 = v108 + v63;
          int v110 = v62[v109];
          int v111 = 4;
          int v112 = v63 + v111;
          int v113;
          v113 = v112;
          switch (v110) {
            case 0:
              {
              int v114 = 2;
              v113 = v114;
            }
            case 1:
              {
              v113 = v63;
              break;
            }
            case 2:
              {
              int v115 = 4;
              v113 = v115;
            }
            default:
              {
              int v116 = 1;
              v113 = v116;
              break;
            }
          }
          bool v117 = true;
          v105 = v113;
          break;
        }
        case 1:
          {
          int v118 = 0;
          int v119 = 0;
          int v120;
          int v121;
          v120 = v118;
          v121 = v119;
          while (true) {
            int v122 = 4;
            int v123 = v121 * v122;
            int v124 = v123 + v63;
            int v125 = 32;
            int v126 = v125 + v124;
            int v127 = v62[v126];
            int v128 = 0;
            bool v129 = v127 != v128;
            v120 = v120;
            v121 = v121;
            if (!v129) break;
            int v130 = v120 + v121;
            int v131 = 1;
            int v132 = v121 + v131;
            bool v133 = true;
            v120 = v130;
            v121 = v132;
          }
          v105 = v120;
          break;
        }
      }
      v76 = v105;
      break;
    }
  }
  bool v134 = true;
  int v135 = 16;
  int v136 = v135 + v63;
  bool v137 = true;
  int v138 = simt_wave_count_bits(v137);
  v61[v136] = v138;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
