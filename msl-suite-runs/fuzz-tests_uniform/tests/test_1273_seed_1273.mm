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
    int v7 = 3;
    int v8 = v3 % v7;
    uint v9 = simt_lane_id(__simt_tid);
    int v10 = (int)(v9);
    int v11;
    v11 = v10;
    switch (v8) {
      default:
        {
        int v12 = 0;
        int v13 = 0;
        int v14;
        int v15;
        v14 = v12;
        v15 = v13;
        while (true) {
          int v16 = 4;
          int v17 = v3 % v16;
          int v18 = 1;
          int v19 = v17 + v18;
          bool v20 = v15 < v19;
          v14 = v14;
          v15 = v15;
          if (!v20) break;
          int v21 = 2;
          int v22 = 1;
          int v23 = v15 + v22;
          v14 = v21;
          v15 = v23;
          continue;
          ;
        }
        v11 = v14;
      }
      case 0:
        {
        int v24 = 2;
        int v25 = v3 % v24;
        int v26 = 4;
        int v27 = v0 + v26;
        int v28;
        v28 = v27;
        switch (v25) {
          default:
            {
            int v29 = 0;
            int v30 = v0 + v29;
            v28 = v30;
            break;
          }
          case 0:
            {
            int v31 = 3;
            int v32 = v0 + v31;
            v28 = v32;
            break;
          }
        }
        v11 = v28;
      }
      case 1:
        {
        int v33 = 0;
        bool v34 = v2 != v33;
        int v35;
        if (v34) {
          v35 = v0;
        } else {
          int v36 = 3;
          v35 = v36;
        }
        int v37 = 2;
        int v38 = v0 + v37;
        v11 = v35;
      }
      case 2:
        {
        int v39 = 4;
        int v40 = v0 + v39;
        v11 = v40;
        break;
      }
    }
    v6 = v11;
  } else {
    int v41 = 0;
    int v42 = 0;
    int v43;
    int v44;
    v43 = v41;
    v44 = v42;
    while (true) {
      int v45 = 4;
      int v46 = v3 % v45;
      int v47 = 1;
      int v48 = v46 + v47;
      bool v49 = v44 < v48;
      v43 = v43;
      v44 = v44;
      if (!v49) break;
      int v50 = 0;
      bool v51 = v2 != v50;
      int v52;
      if (v51) {
        uint v53 = simt_lane_id(__simt_tid);
        int v54 = (int)(v53);
        v52 = v54;
      } else {
        uint v55 = simt_subgroup_id(__simt_tid);
        int v56 = (int)(v55);
        v52 = v56;
      }
      int v57 = 0;
      int v58 = 1;
      int v59 = v44 + v58;
      v43 = v52;
      v44 = v59;
    }
    uint v60 = simt_subgroup_id(__simt_tid);
    int v61 = (int)(v60);
    v6 = v43;
  }
  bool v62 = true;
  int v63 = simt_wave_count_bits(v62);
  int v64 = 0;
  int v65 = v64 + v0;
  v1[v65] = v63;
  return;
}

kernel void kernel_main(device int* v66 [[buffer(0)]], device int* v67 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v68 = static_cast<int>(__simt_tid3.x);
  int v69 = 0;
  int v70 = v69 + v68;
  int v71 = v67[v70];
  int v72 = 4;
  int v73 = v72 + v68;
  int v74 = v67[v73];
  helper0(v68, v66, v71, v74, static_cast<int>(__simt_tid3.x));
  int v75 = 8;
  int v76 = v75 + v68;
  int v77 = v67[v76];
  int v78 = 0;
  int v79 = v68 + v78;
  int v80;
  v80 = v79;
  switch (v77) {
    case 0:
      {
      int v81 = 12;
      int v82 = v81 + v68;
      int v83 = v67[v82];
      int v84 = 0;
      bool v85 = v83 != v84;
      int v86;
      if (v85) {
        int v87 = 16;
        int v88 = v87 + v68;
        int v89 = v67[v88];
        int v90 = 0;
        bool v91 = v89 != v90;
        int v92;
        if (v91) {
          int v93 = 2;
          v92 = v93;
        } else {
          int v94 = 2;
          v92 = v94;
        }
        v86 = v92;
      } else {
        int v95 = 20;
        int v96 = v95 + v68;
        int v97 = v67[v96];
        int v98;
        v98 = v68;
        switch (v97) {
          case 0:
            {
            v98 = v68;
          }
          case 1:
            {
            int v99 = 4;
            int v100 = v68 + v99;
            v98 = v100;
          }
          case 2:
            {
            int v101 = 2;
            int v102 = v68 + v101;
            v98 = v102;
          }
          default:
            {
            int v103 = 2;
            int v104 = v68 + v103;
            v98 = v104;
            break;
          }
        }
        bool v105 = true;
        v86 = v98;
      }
      v80 = v86;
      break;
    }
    case 1:
      {
      v80 = v68;
    }
    default:
      {
      int v106 = 24;
      int v107 = v106 + v68;
      int v108 = v67[v107];
      int v109;
      v109 = v68;
      switch (v108) {
        case 0:
          {
          int v110 = 2;
          int v111 = v68 + v110;
          v109 = v111;
          break;
        }
        default:
          {
          int v112 = 28;
          int v113 = v112 + v68;
          int v114 = v67[v113];
          int v115 = 0;
          bool v116 = v114 != v115;
          int v117;
          if (v116) {
            v117 = v68;
          } else {
            v117 = v68;
          }
          v109 = v117;
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
            int v124 = v123 + v68;
            int v125 = 32;
            int v126 = v125 + v124;
            int v127 = v67[v126];
            int v128 = 0;
            bool v129 = v127 != v128;
            v120 = v120;
            v121 = v121;
            if (!v129) break;
            int v130 = v120 + v121;
            int v131 = 1;
            int v132 = v121 + v131;
            v120 = v130;
            v121 = v132;
          }
          bool v133 = true;
          v109 = v120;
        }
        case 2:
          {
          int v134 = 52;
          int v135 = v134 + v68;
          int v136 = v67[v135];
          int v137;
          v137 = v68;
          switch (v136) {
            default:
              {
              v137 = v68;
              break;
            }
            case 0:
              {
              int v138 = 0;
              int v139 = v68 + v138;
              v137 = v139;
            }
            case 1:
              {
              int v140 = 3;
              int v141 = v68 + v140;
              v137 = v141;
            }
            case 2:
              {
              v137 = v68;
              break;
            }
          }
          bool v142 = true;
          v109 = v137;
          break;
        }
      }
      bool v143 = true;
      v80 = v109;
      break;
    }
  }
  bool v144 = true;
  int v145 = 16;
  int v146 = v145 + v68;
  bool v147 = true;
  int v148 = simt_wave_count_bits(v147);
  v66[v146] = v148;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 56; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
