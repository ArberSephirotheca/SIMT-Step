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
      int v10 = 0;
      bool v11 = v2 != v10;
      int v12;
      if (v11) {
        uint v13 = simt_subgroup_id(__simt_tid);
        int v14 = (int)(v13);
        v12 = v14;
      } else {
        int v15 = 1;
        int v16 = v0 + v15;
        v12 = v16;
      }
      v9 = v12;
    } else {
      int v17 = 0;
      int v18 = 0;
      int v19;
      int v20;
      v19 = v17;
      v20 = v18;
      while (true) {
        int v21 = 4;
        int v22 = v3 % v21;
        int v23 = 1;
        int v24 = v22 + v23;
        bool v25 = v20 < v24;
        v19 = v19;
        v20 = v20;
        if (!v25) break;
        uint v26 = simt_subgroup_id(__simt_tid);
        int v27 = (int)(v26);
        int v28 = 1;
        int v29 = v20 + v28;
        v19 = v27;
        v20 = v29;
        continue;
        ;
      }
      v9 = v19;
    }
    uint v30 = simt_lane_id(__simt_tid);
    int v31 = (int)(v30);
    v6 = v9;
  } else {
    int v32 = 2;
    int v33 = v3 % v32;
    uint v34 = simt_lane_id(__simt_tid);
    int v35 = (int)(v34);
    int v36;
    v36 = v35;
    switch (v33) {
      case 0:
        {
        int v37;
        v37 = v0;
        switch (v3) {
          case 0:
            {
            v37 = v0;
          }
          default:
            {
            v37 = v0;
            break;
          }
        }
        int v38 = 0;
        int v39 = v0 + v38;
        v36 = v37;
      }
      default:
        {
        v36 = v0;
        break;
      }
      case 1:
        {
        int v40 = 0;
        int v41 = v0 + v40;
        v36 = v41;
        break;
      }
    }
    uint v42 = simt_lane_id(__simt_tid);
    int v43 = (int)(v42);
    v6 = v36;
  }
  bool v44 = true;
  int v45 = simt_wave_count_bits(v44);
  int v46 = 0;
  int v47 = v46 + v0;
  v1[v47] = v45;
  return;
}

kernel void kernel_main(device int* v48 [[buffer(0)]], device int* v49 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v50 = static_cast<int>(__simt_tid3.x);
  int v51 = 0;
  int v52 = v51 + v50;
  int v53 = v49[v52];
  int v54 = 4;
  int v55 = v54 + v50;
  int v56 = v49[v55];
  helper0(v50, v48, v53, v56, static_cast<int>(__simt_tid3.x));
  int v57 = 2;
  int v58 = v50 + v57;
  int v59 = 8;
  int v60 = v59 + v50;
  int v61 = v49[v60];
  int v62 = 0;
  bool v63 = v61 != v62;
  int v64;
  if (v63) {
    uint v65 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v66 = (int)(v65);
    v64 = v66;
  } else {
    int v67 = 12;
    int v68 = v67 + v50;
    int v69 = v49[v68];
    int v70 = 0;
    bool v71 = v69 != v70;
    int v72;
    if (v71) {
      int v73 = 16;
      int v74 = v73 + v50;
      int v75 = v49[v74];
      int v76 = 0;
      bool v77 = v75 != v76;
      int v78;
      if (v77) {
        uint v79 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v80 = (int)(v79);
        v78 = v80;
      } else {
        int v81 = 3;
        v78 = v81;
      }
      v72 = v78;
    } else {
      int v82 = 4;
      v72 = v82;
    }
    v64 = v72;
  }
  int v83 = 16;
  int v84 = v83 + v50;
  bool v85 = true;
  int v86 = simt_wave_count_bits(v85);
  v48[v84] = v86;
  int v87 = 20;
  int v88 = v87 + v50;
  int v89 = v49[v88];
  int v90 = 1;
  int v91 = v50 + v90;
  int v92;
  v92 = v91;
  switch (v89) {
    default:
      {
      int v93 = 0;
      int v94 = v50 + v93;
      v92 = v94;
      break;
    }
    case 0:
      {
      int v95 = 3;
      int v96 = v50 + v95;
      v92 = v96;
      break;
    }
    case 1:
      {
      int v97 = 24;
      int v98 = v97 + v50;
      int v99 = v49[v98];
      int v100 = 3;
      int v101 = v50 + v100;
      int v102;
      v102 = v101;
      switch (v99) {
        default:
          {
          int v103 = 4;
          v102 = v103;
        }
        case 0:
          {
          int v104 = 28;
          int v105 = v104 + v50;
          int v106 = v49[v105];
          int v107 = 3;
          int v108;
          v108 = v107;
          switch (v106) {
            case 0:
              {
              int v109 = 0;
              int v110 = v50 + v109;
              v108 = v110;
              break;
            }
            default:
              {
              int v111 = 0;
              int v112 = v50 + v111;
              v108 = v112;
              break;
            }
            case 1:
              {
              v108 = v50;
              break;
            }
            case 2:
              {
              v108 = v50;
              break;
            }
          }
          bool v113 = true;
          v102 = v108;
          break;
        }
        case 1:
          {
          int v114 = 32;
          int v115 = v114 + v50;
          int v116 = v49[v115];
          int v117 = 0;
          bool v118 = v116 != v117;
          int v119;
          if (v118) {
            int v120 = 4;
            int v121 = v50 + v120;
            v119 = v121;
          } else {
            v119 = v50;
          }
          v102 = v119;
          break;
        }
      }
      bool v122 = true;
      v92 = v102;
      break;
    }
  }
  bool v123 = true;
  int v124 = 32;
  int v125 = v124 + v50;
  bool v126 = true;
  int v127 = simt_wave_count_bits(v126);
  v48[v125] = v127;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 36; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 36; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
