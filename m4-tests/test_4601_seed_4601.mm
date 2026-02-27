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
  int v7;
  v7 = v6;
  switch (v5) {
    case 0:
      {
      int v8 = 0;
      bool v9 = v2 != v8;
      int v10;
      if (v9) {
        int v11 = 0;
        int v12 = 0;
        int v13;
        int v14;
        v13 = v11;
        v14 = v12;
        while (true) {
          int v15 = 4;
          int v16 = v3 % v15;
          int v17 = 1;
          int v18 = v16 + v17;
          bool v19 = v14 < v18;
          v13 = v13;
          v14 = v14;
          if (!v19) break;
          int v20 = 1;
          int v21 = v14 + v20;
          v13 = v0;
          v14 = v21;
        }
        v10 = v13;
      } else {
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
          int v31 = 2;
          int v32 = 1;
          int v33 = v25 + v32;
          v24 = v31;
          v25 = v33;
        }
        v10 = v24;
      }
      v7 = v10;
    }
    default:
      {
      int v34 = 0;
      int v35 = v0 + v34;
      v7 = v35;
    }
    case 1:
      {
      int v36 = 4;
      int v37 = v0 + v36;
      int v38;
      v38 = v37;
      switch (v3) {
        case 0:
          {
          int v39 = 0;
          int v40 = 0;
          int v41;
          int v42;
          v41 = v39;
          v42 = v40;
          while (true) {
            int v43 = 4;
            int v44 = v3 % v43;
            int v45 = 1;
            int v46 = v44 + v45;
            bool v47 = v42 < v46;
            v41 = v41;
            v42 = v42;
            if (!v47) break;
            int v48 = 4;
            int v49 = 1;
            int v50 = v42 + v49;
            v41 = v48;
            v42 = v50;
          }
          v38 = v41;
          break;
        }
        default:
          {
          int v51 = 2;
          int v52 = v3 % v51;
          int v53 = 2;
          int v54;
          v54 = v53;
          switch (v52) {
            case 0:
              {
              int v55 = 3;
              int v56 = v0 + v55;
              v54 = v56;
            }
            default:
              {
              int v57 = 0;
              v54 = v57;
            }
            case 1:
              {
              int v58 = 2;
              int v59 = v0 + v58;
              v54 = v59;
              break;
            }
          }
          v38 = v54;
          break;
        }
      }
      v7 = v38;
      break;
    }
  }
  bool v60 = true;
  int v61 = simt_wave_count_bits(v60);
  int v62 = 0;
  int v63 = v62 + v0;
  v1[v63] = v61;
  return;
}

kernel void kernel_main(device int* v64 [[buffer(0)]], device int* v65 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v66 = static_cast<int>(__simt_tid3.x);
  int v67 = 0;
  int v68 = v67 + v66;
  int v69 = v65[v68];
  int v70 = 4;
  int v71 = v70 + v66;
  int v72 = v65[v71];
  int v73 = 0;
  bool v74 = v69 != v73;
  if (v74) {
    int v75 = 0;
    int v76 = 0;
    int v77;
    int v78;
    v77 = v75;
    v78 = v76;
    while (true) {
      int v79 = 2;
      bool v80 = v78 < v79;
      v77 = v77;
      v78 = v78;
      if (!v80) break;
      helper0(v66, v64, v69, v72, static_cast<int>(__simt_tid3.x));
      int v81 = 1;
      int v82 = v78 + v81;
      v77 = v77;
      v78 = v82;
    }
  } else {
  }
  int v83 = 0;
  int v84 = 0;
  int v85;
  int v86;
  v85 = v83;
  v86 = v84;
  while (true) {
    int v87 = 4;
    int v88 = v86 * v87;
    int v89 = v88 + v66;
    int v90 = 8;
    int v91 = v90 + v89;
    int v92 = v65[v91];
    int v93 = 0;
    bool v94 = v92 != v93;
    v85 = v85;
    v86 = v86;
    if (!v94) break;
    int v95 = 28;
    int v96 = v95 + v66;
    int v97 = v65[v96];
    int v98 = 0;
    bool v99 = v97 != v98;
    int v100;
    if (v99) {
      int v101 = 32;
      int v102 = v101 + v66;
      int v103 = v65[v102];
      uint v104 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v105 = (int)(v104);
      int v106;
      v106 = v105;
      switch (v103) {
        case 0:
          {
          int v107 = 0;
          int v108 = v66 + v107;
          v106 = v108;
          break;
        }
        case 1:
          {
          v106 = v66;
          break;
        }
        case 2:
          {
          int v109 = 2;
          v106 = v109;
          break;
        }
        default:
          {
          v106 = v66;
          break;
        }
      }
      v100 = v106;
    } else {
      int v110 = 4;
      v100 = v110;
    }
    int v111 = 16;
    int v112 = v111 + v66;
    bool v113 = true;
    int v114 = simt_wave_count_bits(v113);
    v64[v112] = v114;
    int v115 = v85 + v100;
    int v116 = 1;
    int v117 = v86 + v116;
    bool v118 = true;
    int v119 = 32;
    int v120 = 4;
    int v121 = v86 * v120;
    int v122 = v119 + v121;
    int v123 = v122 + v66;
    bool v124 = true;
    int v125 = simt_wave_count_bits(v124);
    v64[v123] = v125;
    v85 = v115;
    v86 = v117;
    break;
    ;
  }
  int v126 = 36;
  int v127 = v126 + v66;
  int v128 = v65[v127];
  uint v129 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v130 = (int)(v129);
  int v131;
  v131 = v130;
  switch (v128) {
    case 0:
      {
      v131 = v66;
    }
    default:
      {
      int v132 = 0;
      int v133 = 0;
      int v134;
      int v135;
      v134 = v132;
      v135 = v133;
      while (true) {
        int v136 = 4;
        int v137 = v135 * v136;
        int v138 = v137 + v66;
        int v139 = 40;
        int v140 = v139 + v138;
        int v141 = v65[v140];
        int v142 = 0;
        bool v143 = v141 != v142;
        v134 = v134;
        v135 = v135;
        if (!v143) break;
        int v144 = 60;
        int v145 = v144 + v66;
        int v146 = v65[v145];
        int v147 = 1;
        int v148;
        v148 = v147;
        switch (v146) {
          default:
            {
            v148 = v66;
          }
          case 0:
            {
            int v149 = 0;
            v148 = v149;
          }
          case 1:
            {
            v148 = v66;
            break;
          }
        }
        int v150 = v134 + v148;
        int v151 = 1;
        int v152 = v135 + v151;
        bool v153 = true;
        v134 = v150;
        v135 = v152;
        break;
        ;
      }
      v131 = v134;
      break;
    }
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 64; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
