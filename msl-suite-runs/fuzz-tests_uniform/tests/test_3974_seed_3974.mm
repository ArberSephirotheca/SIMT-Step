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
    int v8 = 0;
    int v9;
    int v10;
    v9 = v7;
    v10 = v8;
    while (true) {
      int v11 = 4;
      int v12 = v3 % v11;
      int v13 = 1;
      int v14 = v12 + v13;
      bool v15 = v10 < v14;
      v9 = v9;
      v10 = v10;
      if (!v15) break;
      int v16 = 0;
      bool v17 = v2 != v16;
      int v18;
      if (v17) {
        int v19 = 3;
        v18 = v19;
      } else {
        uint v20 = simt_subgroup_id(__simt_tid);
        int v21 = (int)(v20);
        v18 = v21;
      }
      int v22 = 1;
      int v23 = v10 + v22;
      v9 = v18;
      v10 = v23;
    }
    int v24 = 4;
    v6 = v9;
  } else {
    int v25 = 0;
    bool v26 = v2 != v25;
    int v27;
    if (v26) {
      int v28 = 0;
      int v29 = 0;
      int v30;
      int v31;
      v30 = v28;
      v31 = v29;
      while (true) {
        int v32 = 4;
        int v33 = v3 % v32;
        int v34 = 1;
        int v35 = v33 + v34;
        bool v36 = v31 < v35;
        v30 = v30;
        v31 = v31;
        if (!v36) break;
        int v37 = 4;
        int v38 = v0 + v37;
        int v39 = 1;
        int v40 = v31 + v39;
        v30 = v38;
        v31 = v40;
      }
      int v41 = 4;
      int v42 = v0 + v41;
      v27 = v30;
    } else {
      int v43 = 3;
      int v44 = v3 % v43;
      uint v45 = simt_subgroup_id(__simt_tid);
      int v46 = (int)(v45);
      int v47;
      v47 = v46;
      switch (v44) {
        case 0:
          {
          int v48 = 0;
          int v49 = v0 + v48;
          v47 = v49;
          break;
        }
        case 1:
          {
          v47 = v0;
        }
        default:
          {
          int v50 = 2;
          int v51 = v0 + v50;
          v47 = v51;
          break;
        }
        case 2:
          {
          int v52 = 4;
          int v53 = v0 + v52;
          v47 = v53;
          break;
        }
      }
      uint v54 = simt_subgroup_id(__simt_tid);
      int v55 = (int)(v54);
      v27 = v47;
    }
    int v56 = 4;
    int v57 = v0 + v56;
    v6 = v27;
  }
  bool v58 = true;
  int v59 = simt_wave_count_bits(v58);
  int v60 = 0;
  int v61 = v60 + v0;
  v1[v61] = v59;
  return;
}

kernel void kernel_main(device int* v62 [[buffer(0)]], device int* v63 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v64 = static_cast<int>(__simt_tid3.x);
  int v65 = 0;
  int v66 = v65 + v64;
  int v67 = v63[v66];
  int v68 = 4;
  int v69 = v68 + v64;
  int v70 = v63[v69];
  helper0(v64, v62, v67, v70, static_cast<int>(__simt_tid3.x));
  int v71 = 4;
  int v72 = v64 + v71;
  int v73 = 8;
  int v74 = v73 + v64;
  int v75 = v63[v74];
  uint v76 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v77 = (int)(v76);
  int v78;
  v78 = v77;
  switch (v75) {
    case 0:
      {
      int v79 = 2;
      v78 = v79;
      break;
    }
    default:
      {
      int v80 = 4;
      int v81 = v64 + v80;
      v78 = v81;
      break;
    }
    case 1:
      {
      int v82 = 12;
      int v83 = v82 + v64;
      int v84 = v63[v83];
      int v85 = 3;
      int v86;
      v86 = v85;
      switch (v84) {
        case 0:
          {
          int v87 = 16;
          int v88 = v87 + v64;
          int v89 = v63[v88];
          int v90 = 0;
          bool v91 = v89 != v90;
          int v92;
          if (v91) {
            int v93 = 3;
            int v94 = v64 + v93;
            v92 = v94;
          } else {
            int v95 = 0;
            v92 = v95;
          }
          v86 = v92;
          break;
        }
        default:
          {
          int v96 = 0;
          int v97 = 0;
          int v98;
          int v99;
          v98 = v96;
          v99 = v97;
          while (true) {
            int v100 = 4;
            int v101 = v99 * v100;
            int v102 = v101 + v64;
            int v103 = 20;
            int v104 = v103 + v102;
            int v105 = v63[v104];
            int v106 = 0;
            bool v107 = v105 != v106;
            v98 = v98;
            v99 = v99;
            if (!v107) break;
            int v108 = v98 + v99;
            int v109 = 1;
            int v110 = v99 + v109;
            v98 = v108;
            v99 = v110;
          }
          bool v111 = true;
          v86 = v98;
          break;
        }
        case 1:
          {
          int v112 = 40;
          int v113 = v112 + v64;
          int v114 = v63[v113];
          int v115 = 0;
          bool v116 = v114 != v115;
          int v117;
          if (v116) {
            int v118 = 1;
            int v119 = v64 + v118;
            v117 = v119;
          } else {
            int v120 = 4;
            int v121 = v64 + v120;
            v117 = v121;
          }
          v86 = v117;
          break;
        }
      }
      bool v122 = true;
      v78 = v86;
      break;
    }
    case 2:
      {
      int v123 = 44;
      int v124 = v123 + v64;
      int v125 = v63[v124];
      int v126 = 0;
      bool v127 = v125 != v126;
      int v128;
      if (v127) {
        int v129 = 48;
        int v130 = v129 + v64;
        int v131 = v63[v130];
        int v132 = 2;
        int v133 = v64 + v132;
        int v134;
        v134 = v133;
        switch (v131) {
          default:
            {
            v134 = v64;
            break;
          }
          case 0:
            {
            int v135 = 3;
            int v136 = v64 + v135;
            v134 = v136;
            break;
          }
          case 1:
            {
            int v137 = 3;
            int v138 = v64 + v137;
            v134 = v138;
            break;
          }
        }
        bool v139 = true;
        v128 = v134;
      } else {
        int v140 = 52;
        int v141 = v140 + v64;
        int v142 = v63[v141];
        int v143 = 4;
        int v144 = v64 + v143;
        int v145;
        v145 = v144;
        switch (v142) {
          default:
            {
            v145 = v64;
            break;
          }
          case 0:
            {
            v145 = v64;
            break;
          }
        }
        bool v146 = true;
        v128 = v145;
      }
      v78 = v128;
      break;
    }
  }
  bool v147 = true;
  int v148 = 16;
  int v149 = v148 + v64;
  bool v150 = true;
  int v151 = simt_wave_count_bits(v150);
  v62[v149] = v151;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
