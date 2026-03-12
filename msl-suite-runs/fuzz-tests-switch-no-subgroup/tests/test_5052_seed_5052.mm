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
        int v12 = 1;
        int v13 = v0 + v12;
        v11 = v13;
      }
      case 0:
        {
        int v14 = 0;
        bool v15 = v2 != v14;
        int v16;
        if (v15) {
          int v17 = 1;
          int v18 = v0 + v17;
          v16 = v18;
        } else {
          int v19 = 2;
          v16 = v19;
        }
        v11 = v16;
        break;
      }
      case 1:
        {
        int v20 = 0;
        int v21 = 0;
        int v22;
        int v23;
        v22 = v20;
        v23 = v21;
        while (true) {
          int v24 = 4;
          int v25 = v3 % v24;
          int v26 = 1;
          int v27 = v25 + v26;
          bool v28 = v23 < v27;
          v22 = v22;
          v23 = v23;
          if (!v28) break;
          int v29 = 1;
          int v30 = 1;
          int v31 = v23 + v30;
          v22 = v29;
          v23 = v31;
        }
        v11 = v22;
        break;
      }
      case 2:
        {
        int v32 = 4;
        int v33 = v3 % v32;
        int v34;
        v34 = v0;
        switch (v33) {
          case 0:
            {
            int v35 = 4;
            v34 = v35;
            break;
          }
          default:
            {
            int v36 = 3;
            int v37 = v0 + v36;
            v34 = v37;
          }
          case 1:
            {
            int v38 = 1;
            int v39 = v0 + v38;
            v34 = v39;
            break;
          }
          case 2:
            {
            v34 = v0;
            break;
          }
        }
        int v40 = 4;
        int v41 = v0 + v40;
        v11 = v34;
        break;
      }
    }
    bool v42 = true;
    int v43 = simt_wave_count_bits(v42);
    int v44 = 0;
    int v45 = v44 + v0;
    v1[v45] = v43;
    v6 = v11;
  } else {
    int v46 = 0;
    int v47 = 0;
    int v48;
    int v49;
    v48 = v46;
    v49 = v47;
    while (true) {
      int v50 = 4;
      int v51 = v3 % v50;
      int v52 = 1;
      int v53 = v51 + v52;
      bool v54 = v49 < v53;
      v48 = v48;
      v49 = v49;
      if (!v54) break;
      bool v55 = true;
      int v56 = simt_wave_count_bits(v55);
      int v57 = 16;
      int v58 = 4;
      int v59 = v49 * v58;
      int v60 = v57 + v59;
      int v61 = v60 + v0;
      v1[v61] = v56;
      int v62 = 1;
      int v63 = v49 + v62;
      v48 = v56;
      v49 = v63;
    }
    v6 = v48;
  }
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
  helper0(v66, v64, v69, v72, static_cast<int>(__simt_tid3.x));
  int v73 = 8;
  int v74 = v73 + v66;
  int v75 = v65[v74];
  int v76 = 0;
  bool v77 = v75 != v76;
  int v78;
  if (v77) {
    int v79 = 1;
    v78 = v79;
  } else {
    int v80 = 0;
    int v81 = 0;
    int v82;
    int v83;
    v82 = v80;
    v83 = v81;
    while (true) {
      int v84 = 4;
      int v85 = v83 * v84;
      int v86 = v85 + v66;
      int v87 = 12;
      int v88 = v87 + v86;
      int v89 = v65[v88];
      int v90 = 0;
      bool v91 = v89 != v90;
      v82 = v82;
      v83 = v83;
      if (!v91) break;
      int v92 = v82 + v66;
      int v93 = 1;
      int v94 = v83 + v93;
      bool v95 = true;
      int v96 = 32;
      int v97 = 4;
      int v98 = v83 * v97;
      int v99 = v96 + v98;
      int v100 = v99 + v66;
      bool v101 = true;
      int v102 = simt_wave_count_bits(v101);
      v64[v100] = v102;
      v82 = v92;
      v83 = v94;
    }
    v78 = v82;
  }
  int v103 = 48;
  int v104 = v103 + v66;
  bool v105 = true;
  int v106 = simt_wave_count_bits(v105);
  v64[v104] = v106;
  int v107 = 0;
  int v108 = 0;
  int v109;
  int v110;
  v109 = v107;
  v110 = v108;
  while (true) {
    int v111 = 4;
    int v112 = v110 * v111;
    int v113 = v112 + v66;
    int v114 = 32;
    int v115 = v114 + v113;
    int v116 = v65[v115];
    int v117 = 0;
    bool v118 = v116 != v117;
    v109 = v109;
    v110 = v110;
    if (!v118) break;
    int v119 = 52;
    int v120 = v119 + v66;
    int v121 = v65[v120];
    uint v122 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v123 = (int)(v122);
    int v124;
    v124 = v123;
    switch (v121) {
      default:
        {
        int v125 = 56;
        int v126 = v125 + v66;
        int v127 = v65[v126];
        int v128 = 0;
        bool v129 = v127 != v128;
        int v130;
        if (v129) {
          v130 = v66;
        } else {
          int v131 = 3;
          v130 = v131;
        }
        v124 = v130;
        break;
      }
      case 0:
        {
        int v132 = 60;
        int v133 = v132 + v66;
        int v134 = v65[v133];
        int v135 = 0;
        bool v136 = v134 != v135;
        int v137;
        if (v136) {
          v137 = v66;
        } else {
          int v138 = 4;
          v137 = v138;
        }
        v124 = v137;
        break;
      }
    }
    int v139 = v109 + v124;
    int v140 = 1;
    int v141 = v110 + v140;
    bool v142 = true;
    int v143 = 64;
    int v144 = 4;
    int v145 = v110 * v144;
    int v146 = v143 + v145;
    int v147 = v146 + v66;
    bool v148 = true;
    int v149 = simt_wave_count_bits(v148);
    v64[v147] = v149;
    v109 = v139;
    v110 = v141;
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
    static int32_t expected0[] = {static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
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
