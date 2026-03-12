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
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 0;
      bool v10 = v2 != v9;
      int v11;
      if (v10) {
        int v12 = 0;
        bool v13 = v2 != v12;
        int v14;
        if (v13) {
          int v15 = 2;
          v14 = v15;
        } else {
          v14 = v0;
        }
        int v16 = 1;
        int v17 = v0 + v16;
        v11 = v14;
      } else {
        int v18 = 3;
        int v19 = v3 % v18;
        int v20;
        v20 = v0;
        switch (v19) {
          case 0:
            {
            int v21 = 3;
            int v22 = v0 + v21;
            v20 = v22;
            break;
          }
          case 1:
            {
            v20 = v0;
            break;
          }
          default:
            {
            v20 = v0;
            break;
          }
          case 2:
            {
            int v23 = 4;
            int v24 = v0 + v23;
            v20 = v24;
            break;
          }
        }
        v11 = v20;
      }
      v8 = v11;
      break;
    }
    case 1:
      {
      int v25 = 0;
      bool v26 = v2 != v25;
      int v27;
      if (v26) {
        int v28 = 3;
        int v29 = v3 % v28;
        int v30;
        v30 = v0;
        switch (v29) {
          case 0:
            {
            int v31 = 1;
            int v32 = v0 + v31;
            v30 = v32;
            break;
          }
          default:
            {
            int v33 = 4;
            int v34 = v0 + v33;
            v30 = v34;
            break;
          }
          case 1:
            {
            v30 = v0;
            break;
          }
          case 2:
            {
            v30 = v0;
            break;
          }
        }
        int v35 = 0;
        int v36 = v0 + v35;
        v27 = v30;
      } else {
        int v37 = 2;
        int v38 = v3 % v37;
        int v39 = 4;
        int v40;
        v40 = v39;
        switch (v38) {
          default:
            {
            int v41 = 2;
            v40 = v41;
            break;
          }
          case 0:
            {
            int v42 = 3;
            v40 = v42;
            break;
          }
          case 1:
            {
            int v43 = 4;
            int v44 = v0 + v43;
            v40 = v44;
            break;
          }
        }
        int v45 = 0;
        int v46 = v0 + v45;
        v27 = v40;
      }
      int v47 = 2;
      v8 = v27;
    }
    default:
      {
      int v48 = 2;
      int v49 = v3 % v48;
      int v50 = 4;
      int v51;
      v51 = v50;
      switch (v49) {
        case 0:
          {
          int v52 = 2;
          int v53 = v3 % v52;
          int v54;
          v54 = v0;
          switch (v53) {
            case 0:
              {
              v54 = v0;
            }
            default:
              {
              int v55 = 3;
              v54 = v55;
            }
            case 1:
              {
              int v56 = 2;
              v54 = v56;
              break;
            }
          }
          int v57 = 1;
          int v58 = v0 + v57;
          v51 = v54;
          break;
        }
        case 1:
          {
          int v59 = 0;
          v51 = v59;
        }
        default:
          {
          int v60 = 4;
          int v61 = v3 % v60;
          int v62;
          v62 = v0;
          switch (v61) {
            default:
              {
              int v63 = 0;
              int v64 = v0 + v63;
              v62 = v64;
              break;
            }
            case 0:
              {
              v62 = v0;
            }
            case 1:
              {
              int v65 = 3;
              v62 = v65;
            }
            case 2:
              {
              int v66 = 0;
              int v67 = v0 + v66;
              v62 = v67;
              break;
            }
          }
          int v68 = 1;
          v51 = v62;
          break;
        }
      }
      int v69 = 4;
      v8 = v51;
      break;
    }
    case 2:
      {
      int v70 = 0;
      int v71 = v0 + v70;
      int v72;
      v72 = v71;
      switch (v3) {
        default:
          {
          int v73 = 0;
          int v74 = 0;
          int v75;
          int v76;
          v75 = v73;
          v76 = v74;
          while (true) {
            int v77 = 4;
            int v78 = v3 % v77;
            int v79 = 1;
            int v80 = v78 + v79;
            bool v81 = v76 < v80;
            v75 = v75;
            v76 = v76;
            if (!v81) break;
            int v82 = 4;
            int v83 = v0 + v82;
            int v84 = 1;
            int v85 = v76 + v84;
            v75 = v83;
            v76 = v85;
          }
          int v86 = 2;
          v72 = v75;
          break;
        }
        case 0:
          {
          int v87 = 4;
          v72 = v87;
          break;
        }
      }
      int v88 = 3;
      v8 = v72;
      break;
    }
  }
  bool v89 = true;
  int v90 = simt_wave_count_bits(v89);
  int v91 = 0;
  int v92 = v91 + v0;
  v1[v92] = v90;
  return;
}

kernel void kernel_main(device int* v93 [[buffer(0)]], device int* v94 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v95 = static_cast<int>(__simt_tid3.x);
  int v96 = 0;
  int v97 = v96 + v95;
  int v98 = v94[v97];
  int v99 = 4;
  int v100 = v99 + v95;
  int v101 = v94[v100];
  helper0(v95, v93, v98, v101, static_cast<int>(__simt_tid3.x));
  int v102 = 8;
  int v103 = v102 + v95;
  int v104 = v94[v103];
  int v105 = 0;
  bool v106 = v104 != v105;
  int v107;
  if (v106) {
    int v108 = 0;
    int v109 = 0;
    int v110;
    int v111;
    v110 = v108;
    v111 = v109;
    while (true) {
      int v112 = 4;
      int v113 = v111 * v112;
      int v114 = v113 + v95;
      int v115 = 12;
      int v116 = v115 + v114;
      int v117 = v94[v116];
      int v118 = 0;
      bool v119 = v117 != v118;
      v110 = v110;
      v111 = v111;
      if (!v119) break;
      int v120 = v110 + v111;
      int v121 = 1;
      int v122 = v111 + v121;
      v110 = v120;
      v111 = v122;
    }
    bool v123 = true;
    v107 = v110;
  } else {
    int v124 = 32;
    int v125 = v124 + v95;
    int v126 = v94[v125];
    uint v127 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v128 = (int)(v127);
    int v129;
    v129 = v128;
    switch (v126) {
      case 0:
        {
        v129 = v95;
        break;
      }
      case 1:
        {
        int v130 = 4;
        int v131 = v95 + v130;
        v129 = v131;
        break;
      }
      default:
        {
        int v132 = 36;
        int v133 = v132 + v95;
        int v134 = v94[v133];
        int v135 = 1;
        int v136 = v95 + v135;
        int v137;
        v137 = v136;
        switch (v134) {
          default:
            {
            v137 = v95;
          }
          case 0:
            {
            int v138 = 0;
            int v139 = v95 + v138;
            v137 = v139;
            break;
          }
        }
        bool v140 = true;
        v129 = v137;
        break;
      }
    }
    bool v141 = true;
    v107 = v129;
  }
  int v142 = 16;
  int v143 = v142 + v95;
  bool v144 = true;
  int v145 = simt_wave_count_bits(v144);
  v93[v143] = v145;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 40; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
