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
    int v13 = 2;
    int v14 = v3 % v13;
    uint v15 = simt_lane_id(__simt_tid);
    int v16 = (int)(v15);
    int v17;
    v17 = v16;
    switch (v14) {
      default:
        {
        int v18 = 3;
        int v19 = v3 % v18;
        int v20 = 1;
        int v21;
        v21 = v20;
        switch (v19) {
          case 0:
            {
            v21 = v0;
            break;
          }
          case 1:
            {
            int v22 = 1;
            v21 = v22;
          }
          default:
            {
            v21 = v0;
            break;
          }
        }
        v17 = v21;
        break;
      }
      case 0:
        {
        int v23 = 2;
        int v24 = v3 % v23;
        int v25 = 3;
        int v26 = v0 + v25;
        int v27;
        v27 = v26;
        switch (v24) {
          case 0:
            {
            int v28 = 0;
            v27 = v28;
          }
          default:
            {
            v27 = v0;
            break;
          }
          case 1:
            {
            int v29 = 0;
            v27 = v29;
            break;
          }
        }
        v17 = v27;
        break;
      }
      case 1:
        {
        int v30 = 0;
        bool v31 = v2 != v30;
        int v32;
        if (v31) {
          int v33 = 3;
          v32 = v33;
        } else {
          int v34 = 1;
          int v35 = v0 + v34;
          v32 = v35;
        }
        v17 = v32;
        break;
      }
    }
    int v36 = 1;
    int v37 = v7 + v36;
    v6 = v17;
    v7 = v37;
    break;
    ;
  }
  bool v38 = true;
  int v39 = simt_wave_count_bits(v38);
  int v40 = 0;
  int v41 = v40 + v0;
  v1[v41] = v39;
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
  int v51 = 0;
  bool v52 = v47 != v51;
  if (v52) {
  } else {
    int v53 = 0;
    int v54 = 0;
    int v55;
    int v56;
    v55 = v53;
    v56 = v54;
    while (true) {
      int v57 = 2;
      bool v58 = v56 < v57;
      v55 = v55;
      v56 = v56;
      if (!v58) break;
      helper0(v44, v42, v47, v50, static_cast<int>(__simt_tid3.x));
      int v59 = 1;
      int v60 = v56 + v59;
      v55 = v55;
      v56 = v60;
    }
  }
  int v61 = 8;
  int v62 = v61 + v44;
  int v63 = v43[v62];
  int v64;
  v64 = v44;
  switch (v63) {
    default:
      {
      int v65 = 12;
      int v66 = v65 + v44;
      int v67 = v43[v66];
      int v68 = 1;
      int v69 = v44 + v68;
      int v70;
      v70 = v69;
      switch (v67) {
        case 0:
          {
          int v71 = 2;
          int v72 = v44 + v71;
          v70 = v72;
          break;
        }
        case 1:
          {
          int v73 = 16;
          int v74 = v73 + v44;
          int v75 = v43[v74];
          int v76 = 0;
          bool v77 = v75 != v76;
          int v78;
          if (v77) {
            int v79 = 3;
            v78 = v79;
          } else {
            int v80 = 3;
            int v81 = v44 + v80;
            v78 = v81;
          }
          v70 = v78;
          break;
        }
        default:
          {
          int v82 = 20;
          int v83 = v82 + v44;
          int v84 = v43[v83];
          int v85 = 0;
          bool v86 = v84 != v85;
          int v87;
          if (v86) {
            v87 = v44;
          } else {
            v87 = v44;
          }
          v70 = v87;
          break;
        }
        case 2:
          {
          int v88 = 0;
          int v89 = 0;
          int v90;
          int v91;
          v90 = v88;
          v91 = v89;
          while (true) {
            int v92 = 4;
            int v93 = v91 * v92;
            int v94 = v93 + v44;
            int v95 = 24;
            int v96 = v95 + v94;
            int v97 = v43[v96];
            int v98 = 0;
            bool v99 = v97 != v98;
            v90 = v90;
            v91 = v91;
            if (!v99) break;
            int v100 = v90 + v91;
            int v101 = 1;
            int v102 = v91 + v101;
            bool v103 = true;
            v90 = v100;
            v91 = v102;
            continue;
            ;
          }
          v70 = v90;
          break;
        }
      }
      v64 = v70;
      break;
    }
    case 0:
      {
      v64 = v44;
      break;
    }
    case 1:
      {
      int v104 = 0;
      int v105 = 0;
      int v106;
      int v107;
      v106 = v104;
      v107 = v105;
      while (true) {
        int v108 = 4;
        int v109 = v107 * v108;
        int v110 = v109 + v44;
        int v111 = 44;
        int v112 = v111 + v110;
        int v113 = v43[v112];
        int v114 = 0;
        bool v115 = v113 != v114;
        v106 = v106;
        v107 = v107;
        if (!v115) break;
        int v116 = v106 + v107;
        int v117 = 1;
        int v118 = v107 + v117;
        bool v119 = true;
        v106 = v116;
        v107 = v118;
      }
      v64 = v106;
      break;
    }
    case 2:
      {
      v64 = v44;
      break;
    }
  }
  uint v120 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v121 = (int)(v120);
  int v122 = 0;
  int v123 = 0;
  int v124;
  int v125;
  v124 = v122;
  v125 = v123;
  while (true) {
    int v126 = 4;
    int v127 = v125 * v126;
    int v128 = v127 + v44;
    int v129 = 64;
    int v130 = v129 + v128;
    int v131 = v43[v130];
    int v132 = 0;
    bool v133 = v131 != v132;
    v124 = v124;
    v125 = v125;
    if (!v133) break;
    int v134 = 3;
    int v135 = v124 + v134;
    int v136 = 1;
    int v137 = v125 + v136;
    bool v138 = true;
    int v139 = 16;
    int v140 = 4;
    int v141 = v125 * v140;
    int v142 = v139 + v141;
    int v143 = v142 + v44;
    bool v144 = true;
    int v145 = simt_wave_count_bits(v144);
    v42[v143] = v145;
    v124 = v135;
    v125 = v137;
    break;
    ;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 84; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
