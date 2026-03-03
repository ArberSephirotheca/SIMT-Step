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
  int v5 = v0 + v4;
  int v6 = 0;
  int v7 = 0;
  int v8;
  int v9;
  v8 = v6;
  v9 = v7;
  while (true) {
    int v10 = 4;
    int v11 = v3 % v10;
    int v12 = 1;
    int v13 = v11 + v12;
    bool v14 = v9 < v13;
    v8 = v8;
    v9 = v9;
    if (!v14) break;
    int v15 = 2;
    int v16 = v3 % v15;
    int v17;
    v17 = v0;
    switch (v16) {
      default:
        {
        int v18 = 2;
        int v19 = v3 % v18;
        int v20 = 2;
        int v21 = v0 + v20;
        int v22;
        v22 = v21;
        switch (v19) {
          case 0:
            {
            v22 = v0;
            break;
          }
          default:
            {
            v22 = v0;
            break;
          }
        }
        int v23 = 2;
        int v24 = v0 + v23;
        v17 = v22;
        break;
      }
      case 0:
        {
        int v25 = 4;
        int v26 = v3 % v25;
        int v27 = 3;
        int v28;
        v28 = v27;
        switch (v26) {
          case 0:
            {
            v28 = v0;
          }
          case 1:
            {
            int v29 = 3;
            v28 = v29;
            break;
          }
          default:
            {
            int v30 = 1;
            v28 = v30;
          }
          case 2:
            {
            int v31 = 1;
            int v32 = v0 + v31;
            v28 = v32;
            break;
          }
        }
        v17 = v28;
        break;
      }
    }
    int v33 = 1;
    int v34 = v9 + v33;
    v8 = v17;
    v9 = v34;
    continue;
    ;
  }
  bool v35 = true;
  int v36 = simt_wave_count_bits(v35);
  int v37 = 0;
  int v38 = v37 + v0;
  v1[v38] = v36;
  int v39 = 0;
  bool v40 = v2 != v39;
  int v41 = v40 ? v5 : v8;
  return;
}

kernel void kernel_main(device int* v42 [[buffer(0)]], device int* v43 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v44 = static_cast<int>(__simt_tid3.x);
  int v45 = 0;
  int v46 = v45 + v44;
  int v47 = v43[v46];
  int v48 = 4;
  int v49 = v48 + v44;
  int v50 = v43[v49];
  helper0(v44, v42, v47, v50, static_cast<int>(__simt_tid3.x));
  int v51 = 8;
  int v52 = v51 + v44;
  int v53 = v43[v52];
  int v54 = 2;
  int v55;
  v55 = v54;
  switch (v53) {
    case 0:
      {
      int v56 = 12;
      int v57 = v56 + v44;
      int v58 = v43[v57];
      int v59 = 1;
      int v60;
      v60 = v59;
      switch (v58) {
        case 0:
          {
          int v61 = 1;
          int v62 = v44 + v61;
          v60 = v62;
          break;
        }
        case 1:
          {
          int v63 = 16;
          int v64 = v63 + v44;
          int v65 = v43[v64];
          int v66;
          v66 = v44;
          switch (v65) {
            default:
              {
              int v67 = 1;
              v66 = v67;
            }
            case 0:
              {
              v66 = v44;
              break;
            }
          }
          bool v68 = true;
          v60 = v66;
          break;
        }
        case 2:
          {
          int v69 = 1;
          int v70 = v44 + v69;
          v60 = v70;
          break;
        }
        default:
          {
          int v71 = 2;
          v60 = v71;
          break;
        }
      }
      bool v72 = true;
      v55 = v60;
      break;
    }
    case 1:
      {
      int v73 = 20;
      int v74 = v73 + v44;
      int v75 = v43[v74];
      int v76 = 0;
      bool v77 = v75 != v76;
      int v78;
      if (v77) {
        int v79 = 24;
        int v80 = v79 + v44;
        int v81 = v43[v80];
        int v82;
        v82 = v44;
        switch (v81) {
          case 0:
            {
            v82 = v44;
          }
          default:
            {
            v82 = v44;
          }
          case 1:
            {
            int v83 = 2;
            v82 = v83;
          }
          case 2:
            {
            v82 = v44;
            break;
          }
        }
        bool v84 = true;
        v78 = v82;
      } else {
        int v85 = 28;
        int v86 = v85 + v44;
        int v87 = v43[v86];
        int v88 = 0;
        bool v89 = v87 != v88;
        int v90;
        if (v89) {
          int v91 = 1;
          int v92 = v44 + v91;
          v90 = v92;
        } else {
          int v93 = 1;
          int v94 = v44 + v93;
          v90 = v94;
        }
        v78 = v90;
      }
      v55 = v78;
      break;
    }
    default:
      {
      int v95 = 32;
      int v96 = v95 + v44;
      int v97 = v43[v96];
      int v98 = 0;
      bool v99 = v97 != v98;
      int v100;
      if (v99) {
        int v101 = 36;
        int v102 = v101 + v44;
        int v103 = v43[v102];
        int v104 = 0;
        bool v105 = v103 != v104;
        int v106;
        if (v105) {
          int v107 = 3;
          int v108 = v44 + v107;
          v106 = v108;
        } else {
          int v109 = 2;
          int v110 = v44 + v109;
          v106 = v110;
        }
        v100 = v106;
      } else {
        v100 = v44;
      }
      v55 = v100;
      break;
    }
    case 2:
      {
      int v111 = 40;
      int v112 = v111 + v44;
      int v113 = v43[v112];
      int v114 = 2;
      int v115 = v44 + v114;
      int v116;
      v116 = v115;
      switch (v113) {
        case 0:
          {
          int v117 = 44;
          int v118 = v117 + v44;
          int v119 = v43[v118];
          int v120 = 3;
          int v121 = v44 + v120;
          int v122;
          v122 = v121;
          switch (v119) {
            default:
              {
              v122 = v44;
            }
            case 0:
              {
              v122 = v44;
            }
            case 1:
              {
              int v123 = 2;
              int v124 = v44 + v123;
              v122 = v124;
              break;
            }
          }
          bool v125 = true;
          v116 = v122;
          break;
        }
        default:
          {
          int v126 = 48;
          int v127 = v126 + v44;
          int v128 = v43[v127];
          int v129 = 0;
          bool v130 = v128 != v129;
          int v131;
          if (v130) {
            int v132 = 0;
            v131 = v132;
          } else {
            int v133 = 3;
            v131 = v133;
          }
          v116 = v131;
          break;
        }
        case 1:
          {
          int v134 = 4;
          v116 = v134;
          break;
        }
        case 2:
          {
          v116 = v44;
          break;
        }
      }
      bool v135 = true;
      v55 = v116;
      break;
    }
  }
  bool v136 = true;
  int v137 = 16;
  int v138 = v137 + v44;
  bool v139 = true;
  int v140 = simt_wave_count_bits(v139);
  v42[v138] = v140;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
