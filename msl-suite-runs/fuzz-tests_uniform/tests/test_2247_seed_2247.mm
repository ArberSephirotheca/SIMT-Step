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
  int v6 = 4;
  int v7 = v0 + v6;
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
        int v19;
        v19 = v18;
        switch (v3) {
          default:
            {
            v19 = v0;
          }
          case 0:
            {
            v19 = v0;
            break;
          }
        }
        int v20 = 1;
        int v21 = v12 + v20;
        v11 = v19;
        v12 = v21;
        continue;
        ;
      }
      v8 = v11;
      break;
    }
    case 0:
      {
      int v22 = 0;
      int v23 = 0;
      int v24;
      int v25;
      v24 = v22;
      v25 = v23;
      while (true) {
        int v26 = 4;
        int v27 = v3 % v26;
        int v28 = 1;
        int v29 = v27 + v28;
        bool v30 = v25 < v29;
        v24 = v24;
        v25 = v25;
        if (!v30) break;
        int v31 = 3;
        int v32 = v3 % v31;
        int v33 = 0;
        int v34 = v0 + v33;
        int v35;
        v35 = v34;
        switch (v32) {
          case 0:
            {
            v35 = v0;
          }
          default:
            {
            int v36 = 0;
            v35 = v36;
            break;
          }
          case 1:
            {
            v35 = v0;
            break;
          }
          case 2:
            {
            v35 = v0;
            break;
          }
        }
        int v37 = 0;
        int v38 = 1;
        int v39 = v25 + v38;
        v24 = v35;
        v25 = v39;
        continue;
        ;
      }
      int v40 = 2;
      v8 = v24;
      break;
    }
    case 1:
      {
      int v41 = 1;
      int v42 = v0 + v41;
      v8 = v42;
      break;
    }
  }
  bool v43 = true;
  int v44 = simt_wave_count_bits(v43);
  int v45 = 0;
  int v46 = v45 + v0;
  v1[v46] = v44;
  return;
}

kernel void kernel_main(device int* v47 [[buffer(0)]], device int* v48 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v49 = static_cast<int>(__simt_tid3.x);
  int v50 = 0;
  int v51 = v50 + v49;
  int v52 = v48[v51];
  int v53 = 4;
  int v54 = v53 + v49;
  int v55 = v48[v54];
  helper0(v49, v47, v52, v55, static_cast<int>(__simt_tid3.x));
  int v56 = 8;
  int v57 = v56 + v49;
  int v58 = v48[v57];
  int v59 = 1;
  int v60;
  v60 = v59;
  switch (v58) {
    default:
      {
      int v61 = 12;
      int v62 = v61 + v49;
      int v63 = v48[v62];
      int v64;
      v64 = v49;
      switch (v63) {
        case 0:
          {
          int v65 = 4;
          int v66 = v49 + v65;
          v64 = v66;
          break;
        }
        default:
          {
          int v67 = 16;
          int v68 = v67 + v49;
          int v69 = v48[v68];
          int v70;
          v70 = v49;
          switch (v69) {
            case 0:
              {
              v70 = v49;
            }
            default:
              {
              int v71 = 0;
              v70 = v71;
              break;
            }
            case 1:
              {
              int v72 = 1;
              v70 = v72;
              break;
            }
            case 2:
              {
              int v73 = 3;
              int v74 = v49 + v73;
              v70 = v74;
              break;
            }
          }
          bool v75 = true;
          v64 = v70;
          break;
        }
        case 1:
          {
          int v76 = 20;
          int v77 = v76 + v49;
          int v78 = v48[v77];
          int v79 = 1;
          int v80 = v49 + v79;
          int v81;
          v81 = v80;
          switch (v78) {
            case 0:
              {
              v81 = v49;
              break;
            }
            default:
              {
              int v82 = 0;
              v81 = v82;
              break;
            }
            case 1:
              {
              int v83 = 1;
              v81 = v83;
              break;
            }
          }
          bool v84 = true;
          v64 = v81;
          break;
        }
      }
      bool v85 = true;
      v60 = v64;
      break;
    }
    case 0:
      {
      int v86 = 0;
      int v87 = v49 + v86;
      v60 = v87;
      break;
    }
    case 1:
      {
      int v88 = 24;
      int v89 = v88 + v49;
      int v90 = v48[v89];
      int v91;
      v91 = v49;
      switch (v90) {
        case 0:
          {
          int v92 = 0;
          int v93 = 0;
          int v94;
          int v95;
          v94 = v92;
          v95 = v93;
          while (true) {
            int v96 = 4;
            int v97 = v95 * v96;
            int v98 = v97 + v49;
            int v99 = 28;
            int v100 = v99 + v98;
            int v101 = v48[v100];
            int v102 = 0;
            bool v103 = v101 != v102;
            v94 = v94;
            v95 = v95;
            if (!v103) break;
            int v104 = v94 + v95;
            int v105 = 1;
            int v106 = v95 + v105;
            v94 = v104;
            v95 = v106;
          }
          bool v107 = true;
          v91 = v94;
          break;
        }
        case 1:
          {
          int v108 = 2;
          v91 = v108;
          break;
        }
        default:
          {
          int v109 = 48;
          int v110 = v109 + v49;
          int v111 = v48[v110];
          int v112 = 0;
          bool v113 = v111 != v112;
          int v114;
          if (v113) {
            int v115 = 0;
            v114 = v115;
          } else {
            v114 = v49;
          }
          v91 = v114;
          break;
        }
        case 2:
          {
          int v116 = 52;
          int v117 = v116 + v49;
          int v118 = v48[v117];
          int v119 = 1;
          int v120 = v49 + v119;
          int v121;
          v121 = v120;
          switch (v118) {
            default:
              {
              int v122 = 2;
              v121 = v122;
              break;
            }
            case 0:
              {
              int v123 = 4;
              int v124 = v49 + v123;
              v121 = v124;
            }
            case 1:
              {
              int v125 = 4;
              int v126 = v49 + v125;
              v121 = v126;
            }
            case 2:
              {
              int v127 = 2;
              int v128 = v49 + v127;
              v121 = v128;
              break;
            }
          }
          bool v129 = true;
          v91 = v121;
          break;
        }
      }
      bool v130 = true;
      v60 = v91;
      break;
    }
  }
  bool v131 = true;
  int v132 = 16;
  int v133 = v132 + v49;
  bool v134 = true;
  int v135 = simt_wave_count_bits(v134);
  v47[v133] = v135;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
