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
  int v6 = 4;
  int v7 = v3 % v6;
  int v8 = 4;
  int v9;
  v9 = v8;
  switch (v7) {
    default:
      {
      int v10 = 0;
      bool v11 = v2 != v10;
      int v12;
      if (v11) {
        int v13 = 1;
        int v14 = v0 + v13;
        int v15;
        v15 = v14;
        switch (v3) {
          default:
            {
            int v16 = 0;
            int v17 = v0 + v16;
            v15 = v17;
            break;
          }
          case 0:
            {
            int v18 = 3;
            v15 = v18;
            break;
          }
        }
        int v19 = 4;
        v12 = v15;
      } else {
        int v20 = 1;
        v12 = v20;
      }
      int v21 = 0;
      v9 = v12;
      break;
    }
    case 0:
      {
      int v22 = 4;
      int v23 = v0 + v22;
      int v24;
      v24 = v23;
      switch (v3) {
        default:
          {
          int v25 = 0;
          bool v26 = v2 != v25;
          int v27;
          if (v26) {
            v27 = v0;
          } else {
            v27 = v0;
          }
          v24 = v27;
          break;
        }
        case 0:
          {
          int v28 = 2;
          int v29 = v0 + v28;
          v24 = v29;
          break;
        }
      }
      int v30 = 3;
      int v31 = v0 + v30;
      v9 = v24;
    }
    case 1:
      {
      int v32 = 0;
      int v33 = v0 + v32;
      v9 = v33;
    }
    case 2:
      {
      int v34 = 0;
      int v35 = 0;
      int v36;
      int v37;
      v36 = v34;
      v37 = v35;
      while (true) {
        int v38 = 4;
        int v39 = v3 % v38;
        int v40 = 1;
        int v41 = v39 + v40;
        bool v42 = v37 < v41;
        v36 = v36;
        v37 = v37;
        if (!v42) break;
        int v43 = 2;
        int v44 = v3 % v43;
        int v45;
        v45 = v0;
        switch (v44) {
          case 0:
            {
            int v46 = 1;
            v45 = v46;
            break;
          }
          default:
            {
            v45 = v0;
            break;
          }
          case 1:
            {
            int v47 = 4;
            v45 = v47;
            break;
          }
        }
        int v48 = 3;
        int v49 = 1;
        int v50 = v37 + v49;
        v36 = v45;
        v37 = v50;
      }
      int v51 = 0;
      v9 = v36;
      break;
    }
  }
  bool v52 = true;
  int v53 = simt_wave_count_bits(v52);
  int v54 = 0;
  int v55 = v54 + v0;
  v1[v55] = v53;
  int v56 = 0;
  bool v57 = v2 != v56;
  int v58 = v57 ? v5 : v9;
  return;
}

kernel void kernel_main(device int* v59 [[buffer(0)]], device int* v60 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v61 = static_cast<int>(__simt_tid3.x);
  int v62 = 0;
  int v63 = v62 + v61;
  int v64 = v60[v63];
  int v65 = 4;
  int v66 = v65 + v61;
  int v67 = v60[v66];
  helper0(v61, v59, v64, v67, static_cast<int>(__simt_tid3.x));
  int v68 = 4;
  int v69 = 8;
  int v70 = v69 + v61;
  int v71 = v60[v70];
  int v72 = 0;
  bool v73 = v71 != v72;
  int v74;
  if (v73) {
    v74 = v61;
  } else {
    int v75 = 0;
    int v76 = 0;
    int v77;
    int v78;
    v77 = v75;
    v78 = v76;
    while (true) {
      int v79 = 4;
      int v80 = v78 * v79;
      int v81 = v80 + v61;
      int v82 = 12;
      int v83 = v82 + v81;
      int v84 = v60[v83];
      int v85 = 0;
      bool v86 = v84 != v85;
      v77 = v77;
      v78 = v78;
      if (!v86) break;
      int v87 = v77 + v78;
      int v88 = 1;
      int v89 = v78 + v88;
      v77 = v87;
      v78 = v89;
    }
    bool v90 = true;
    v74 = v77;
  }
  int v91 = 16;
  int v92 = v91 + v61;
  bool v93 = true;
  int v94 = simt_wave_count_bits(v93);
  v59[v92] = v94;
  int v95 = 32;
  int v96 = v95 + v61;
  int v97 = v60[v96];
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
      int v107 = v106 + v61;
      int v108 = 36;
      int v109 = v108 + v107;
      int v110 = v60[v109];
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
    }
    bool v116 = true;
    v100 = v103;
  } else {
    int v117 = 56;
    int v118 = v117 + v61;
    int v119 = v60[v118];
    int v120 = 0;
    int v121 = v61 + v120;
    int v122;
    v122 = v121;
    switch (v119) {
      case 0:
        {
        int v123 = 60;
        int v124 = v123 + v61;
        int v125 = v60[v124];
        int v126 = 0;
        bool v127 = v125 != v126;
        int v128;
        if (v127) {
          int v129 = 1;
          v128 = v129;
        } else {
          v128 = v61;
        }
        v122 = v128;
        break;
      }
      case 1:
        {
        int v130 = 64;
        int v131 = v130 + v61;
        int v132 = v60[v131];
        int v133 = 0;
        bool v134 = v132 != v133;
        int v135;
        if (v134) {
          int v136 = 0;
          int v137 = v61 + v136;
          v135 = v137;
        } else {
          int v138 = 4;
          int v139 = v61 + v138;
          v135 = v139;
        }
        v122 = v135;
        break;
      }
      default:
        {
        int v140 = 68;
        int v141 = v140 + v61;
        int v142 = v60[v141];
        int v143 = 0;
        bool v144 = v142 != v143;
        int v145;
        if (v144) {
          int v146 = 3;
          int v147 = v61 + v146;
          v145 = v147;
        } else {
          v145 = v61;
        }
        v122 = v145;
        break;
      }
    }
    bool v148 = true;
    v100 = v122;
  }
  int v149 = 32;
  int v150 = v149 + v61;
  bool v151 = true;
  int v152 = simt_wave_count_bits(v151);
  v59[v150] = v152;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 72; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
