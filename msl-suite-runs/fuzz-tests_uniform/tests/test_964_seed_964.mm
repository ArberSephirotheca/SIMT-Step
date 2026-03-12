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
  uint v4 = simt_lane_id(__simt_tid);
  int v5 = (int)(v4);
  int v6 = 3;
  int v7 = v3 % v6;
  int v8 = 2;
  int v9;
  v9 = v8;
  switch (v7) {
    case 0:
      {
      int v10 = 2;
      int v11 = v3 % v10;
      int v12 = 2;
      int v13;
      v13 = v12;
      switch (v11) {
        case 0:
          {
          int v14 = 0;
          int v15 = 0;
          int v16;
          int v17;
          v16 = v14;
          v17 = v15;
          while (true) {
            int v18 = 4;
            int v19 = v3 % v18;
            int v20 = 1;
            int v21 = v19 + v20;
            bool v22 = v17 < v21;
            v16 = v16;
            v17 = v17;
            if (!v22) break;
            int v23 = 1;
            int v24 = v17 + v23;
            v16 = v0;
            v17 = v24;
          }
          v13 = v16;
          break;
        }
        default:
          {
          int v25 = 4;
          int v26 = v3 % v25;
          int v27 = 1;
          int v28 = v0 + v27;
          int v29;
          v29 = v28;
          switch (v26) {
            case 0:
              {
              int v30 = 4;
              v29 = v30;
              break;
            }
            case 1:
              {
              int v31 = 0;
              int v32 = v0 + v31;
              v29 = v32;
              break;
            }
            case 2:
              {
              int v33 = 2;
              v29 = v33;
              break;
            }
            default:
              {
              int v34 = 4;
              int v35 = v0 + v34;
              v29 = v35;
              break;
            }
          }
          int v36 = 4;
          v13 = v29;
          break;
        }
        case 1:
          {
          int v37 = 3;
          v13 = v37;
          break;
        }
      }
      int v38 = 1;
      int v39 = v0 + v38;
      v9 = v13;
      break;
    }
    case 1:
      {
      int v40 = 0;
      int v41 = v0 + v40;
      v9 = v41;
      break;
    }
    case 2:
      {
      int v42 = 0;
      bool v43 = v2 != v42;
      int v44;
      if (v43) {
        v44 = v0;
      } else {
        int v45 = 2;
        int v46 = v3 % v45;
        int v47 = 0;
        int v48 = v0 + v47;
        int v49;
        v49 = v48;
        switch (v46) {
          default:
            {
            int v50 = 0;
            v49 = v50;
          }
          case 0:
            {
            int v51 = 2;
            v49 = v51;
            break;
          }
          case 1:
            {
            int v52 = 4;
            v49 = v52;
            break;
          }
        }
        v44 = v49;
      }
      v9 = v44;
    }
    default:
      {
      int v53 = 0;
      bool v54 = v2 != v53;
      int v55;
      if (v54) {
        int v56 = 2;
        int v57 = v3 % v56;
        int v58 = 2;
        int v59 = v0 + v58;
        int v60;
        v60 = v59;
        switch (v57) {
          default:
            {
            v60 = v0;
          }
          case 0:
            {
            int v61 = 1;
            int v62 = v0 + v61;
            v60 = v62;
          }
          case 1:
            {
            int v63 = 1;
            int v64 = v0 + v63;
            v60 = v64;
            break;
          }
        }
        int v65 = 2;
        int v66 = v0 + v65;
        v55 = v60;
      } else {
        int v67 = 0;
        bool v68 = v2 != v67;
        int v69;
        if (v68) {
          int v70 = 0;
          v69 = v70;
        } else {
          int v71 = 3;
          v69 = v71;
        }
        v55 = v69;
      }
      int v72 = 3;
      v9 = v55;
      break;
    }
  }
  bool v73 = true;
  int v74 = simt_wave_count_bits(v73);
  int v75 = 0;
  int v76 = v75 + v0;
  v1[v76] = v74;
  int v77 = 0;
  bool v78 = v2 != v77;
  int v79 = v78 ? v5 : v9;
  return;
}

kernel void kernel_main(device int* v80 [[buffer(0)]], device int* v81 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v82 = static_cast<int>(__simt_tid3.x);
  int v83 = 0;
  int v84 = v83 + v82;
  int v85 = v81[v84];
  int v86 = 4;
  int v87 = v86 + v82;
  int v88 = v81[v87];
  helper0(v82, v80, v85, v88, static_cast<int>(__simt_tid3.x));
  int v89 = 8;
  int v90 = v89 + v82;
  int v91 = v81[v90];
  int v92 = 0;
  bool v93 = v91 != v92;
  int v94;
  if (v93) {
    int v95 = 12;
    int v96 = v95 + v82;
    int v97 = v81[v96];
    int v98;
    v98 = v82;
    switch (v97) {
      case 0:
        {
        int v99 = 0;
        int v100 = 0;
        int v101;
        int v102;
        v101 = v99;
        v102 = v100;
        while (true) {
          int v103 = 4;
          int v104 = v102 * v103;
          int v105 = v104 + v82;
          int v106 = 16;
          int v107 = v106 + v105;
          int v108 = v81[v107];
          int v109 = 0;
          bool v110 = v108 != v109;
          v101 = v101;
          v102 = v102;
          if (!v110) break;
          int v111 = v101 + v102;
          int v112 = 1;
          int v113 = v102 + v112;
          v101 = v111;
          v102 = v113;
          continue;
          ;
        }
        bool v114 = true;
        v98 = v101;
        break;
      }
      case 1:
        {
        int v115 = 36;
        int v116 = v115 + v82;
        int v117 = v81[v116];
        int v118 = 0;
        bool v119 = v117 != v118;
        int v120;
        if (v119) {
          int v121 = 4;
          int v122 = v82 + v121;
          v120 = v122;
        } else {
          int v123 = 2;
          v120 = v123;
        }
        v98 = v120;
        break;
      }
      default:
        {
        v98 = v82;
        break;
      }
      case 2:
        {
        int v124 = 40;
        int v125 = v124 + v82;
        int v126 = v81[v125];
        int v127 = 1;
        int v128;
        v128 = v127;
        switch (v126) {
          default:
            {
            int v129 = 0;
            int v130 = v82 + v129;
            v128 = v130;
            break;
          }
          case 0:
            {
            int v131 = 0;
            int v132 = v82 + v131;
            v128 = v132;
            break;
          }
          case 1:
            {
            int v133 = 1;
            int v134 = v82 + v133;
            v128 = v134;
            break;
          }
          case 2:
            {
            int v135 = 3;
            int v136 = v82 + v135;
            v128 = v136;
            break;
          }
        }
        bool v137 = true;
        v98 = v128;
        break;
      }
    }
    bool v138 = true;
    v94 = v98;
  } else {
    uint v139 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v140 = (int)(v139);
    v94 = v140;
  }
  int v141 = 16;
  int v142 = v141 + v82;
  bool v143 = true;
  int v144 = simt_wave_count_bits(v143);
  v80[v142] = v144;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 44; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
