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
  int v4 = 3;
  int v5 = v3 % v4;
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 2;
      int v10 = v3 % v9;
      int v11 = 3;
      int v12;
      v12 = v11;
      switch (v10) {
        default:
          {
          int v13 = 0;
          int v14 = 0;
          int v15;
          int v16;
          v15 = v13;
          v16 = v14;
          while (true) {
            int v17 = 4;
            int v18 = v3 % v17;
            int v19 = 1;
            int v20 = v18 + v19;
            bool v21 = v16 < v20;
            v15 = v15;
            v16 = v16;
            if (!v21) break;
            int v22 = 3;
            int v23 = v0 + v22;
            int v24 = 1;
            int v25 = v16 + v24;
            v15 = v23;
            v16 = v25;
          }
          v12 = v15;
          break;
        }
        case 0:
          {
          int v26 = 1;
          int v27 = v0 + v26;
          v12 = v27;
          break;
        }
      }
      v8 = v12;
      break;
    }
    case 1:
      {
      int v28 = 3;
      int v29 = v3 % v28;
      int v30 = 0;
      int v31 = v0 + v30;
      int v32;
      v32 = v31;
      switch (v29) {
        default:
          {
          int v33 = 0;
          int v34 = 0;
          int v35;
          int v36;
          v35 = v33;
          v36 = v34;
          while (true) {
            int v37 = 4;
            int v38 = v3 % v37;
            int v39 = 1;
            int v40 = v38 + v39;
            bool v41 = v36 < v40;
            v35 = v35;
            v36 = v36;
            if (!v41) break;
            int v42 = 2;
            int v43 = 1;
            int v44 = v36 + v43;
            v35 = v42;
            v36 = v44;
            break;
            ;
          }
          v32 = v35;
          break;
        }
        case 0:
          {
          int v45 = 2;
          int v46 = v3 % v45;
          int v47 = 2;
          int v48;
          v48 = v47;
          switch (v46) {
            default:
              {
              int v49 = 4;
              v48 = v49;
            }
            case 0:
              {
              int v50 = 3;
              v48 = v50;
              break;
            }
          }
          int v51 = 3;
          v32 = v48;
          break;
        }
        case 1:
          {
          v32 = v0;
          break;
        }
        case 2:
          {
          int v52 = 0;
          bool v53 = v2 != v52;
          int v54;
          if (v53) {
            v54 = v0;
          } else {
            int v55 = 0;
            v54 = v55;
          }
          v32 = v54;
          break;
        }
      }
      int v56 = 0;
      v8 = v32;
    }
    default:
      {
      int v57 = 0;
      bool v58 = v2 != v57;
      int v59;
      if (v58) {
        v59 = v0;
      } else {
        int v60 = 0;
        int v61 = 0;
        int v62;
        int v63;
        v62 = v60;
        v63 = v61;
        while (true) {
          int v64 = 4;
          int v65 = v3 % v64;
          int v66 = 1;
          int v67 = v65 + v66;
          bool v68 = v63 < v67;
          v62 = v62;
          v63 = v63;
          if (!v68) break;
          int v69 = 4;
          int v70 = 1;
          int v71 = v63 + v70;
          v62 = v69;
          v63 = v71;
        }
        v59 = v62;
      }
      int v72 = 2;
      int v73 = v0 + v72;
      v8 = v59;
      break;
    }
  }
  bool v74 = true;
  int v75 = simt_wave_count_bits(v74);
  int v76 = 0;
  int v77 = v76 + v0;
  v1[v77] = v75;
  return;
}

kernel void kernel_main(device int* v78 [[buffer(0)]], device int* v79 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v80 = static_cast<int>(__simt_tid3.x);
  int v81 = 0;
  int v82 = v81 + v80;
  int v83 = v79[v82];
  int v84 = 4;
  int v85 = v84 + v80;
  int v86 = v79[v85];
  helper0(v80, v78, v83, v86, static_cast<int>(__simt_tid3.x));
  int v87 = 8;
  int v88 = v87 + v80;
  int v89 = v79[v88];
  int v90 = 0;
  bool v91 = v89 != v90;
  int v92;
  if (v91) {
    uint v93 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v94 = (int)(v93);
    v92 = v94;
  } else {
    int v95 = 12;
    int v96 = v95 + v80;
    int v97 = v79[v96];
    int v98 = 0;
    bool v99 = v97 != v98;
    int v100;
    if (v99) {
      int v101 = 0;
      int v102 = 0;
      int v103;
      int v104;
      v103 = v101;
      v104 = v102;
      while (true) {
        int v105 = 4;
        int v106 = v104 * v105;
        int v107 = v106 + v80;
        int v108 = 16;
        int v109 = v108 + v107;
        int v110 = v79[v109];
        int v111 = 0;
        bool v112 = v110 != v111;
        v103 = v103;
        v104 = v104;
        if (!v112) break;
        int v113 = v103 + v104;
        int v114 = 1;
        int v115 = v104 + v114;
        v103 = v113;
        v104 = v115;
        break;
        ;
      }
      bool v116 = true;
      v100 = v103;
    } else {
      int v117 = 36;
      int v118 = v117 + v80;
      int v119 = v79[v118];
      uint v120 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v121 = (int)(v120);
      int v122;
      v122 = v121;
      switch (v119) {
        case 0:
          {
          int v123 = 1;
          int v124 = v80 + v123;
          v122 = v124;
          break;
        }
        default:
          {
          int v125 = 4;
          v122 = v125;
          break;
        }
        case 1:
          {
          v122 = v80;
          break;
        }
      }
      bool v126 = true;
      v100 = v122;
    }
    v92 = v100;
  }
  int v127 = 16;
  int v128 = v127 + v80;
  bool v129 = true;
  int v130 = simt_wave_count_bits(v129);
  v78[v128] = v130;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
