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
  int v5 = 0;
  int v6 = 0;
  int v7;
  int v8;
  v7 = v5;
  v8 = v6;
  while (true) {
    int v9 = 4;
    int v10 = v3 % v9;
    int v11 = 1;
    int v12 = v10 + v11;
    bool v13 = v8 < v12;
    v7 = v7;
    v8 = v8;
    if (!v13) break;
    int v14 = 1;
    int v15 = v8 + v14;
    v7 = v0;
    v8 = v15;
    continue;
    ;
  }
  bool v16 = true;
  int v17 = simt_wave_count_bits(v16);
  int v18 = 0;
  int v19 = v18 + v0;
  v1[v19] = v17;
  int v20 = 0;
  bool v21 = v2 != v20;
  int v22 = v21 ? v4 : v7;
  int v23 = 2;
  int v24 = v3 % v23;
  uint v25 = simt_lane_id(__simt_tid);
  int v26 = (int)(v25);
  int v27;
  v27 = v26;
  switch (v24) {
    case 0:
      {
      int v28 = 0;
      bool v29 = v2 != v28;
      int v30;
      if (v29) {
        int v31 = 3;
        int v32 = v3 % v31;
        int v33 = 1;
        int v34 = v0 + v33;
        int v35;
        v35 = v34;
        switch (v32) {
          case 0:
            {
            int v36 = 2;
            int v37 = v0 + v36;
            v35 = v37;
            break;
          }
          default:
            {
            v35 = v0;
          }
          case 1:
            {
            int v38 = 1;
            int v39 = v0 + v38;
            v35 = v39;
            break;
          }
        }
        int v40 = 2;
        v30 = v35;
      } else {
        int v41 = 2;
        int v42 = v3 % v41;
        int v43;
        v43 = v0;
        switch (v42) {
          default:
            {
            int v44 = 2;
            int v45 = v0 + v44;
            v43 = v45;
            break;
          }
          case 0:
            {
            int v46 = 1;
            v43 = v46;
            break;
          }
        }
        int v47 = 3;
        int v48 = v0 + v47;
        v30 = v43;
      }
      int v49 = 3;
      int v50 = v0 + v49;
      v27 = v30;
    }
    default:
      {
      int v51 = 3;
      int v52 = v3 % v51;
      int v53;
      v53 = v0;
      switch (v52) {
        case 0:
          {
          int v54 = 0;
          int v55 = 0;
          int v56;
          int v57;
          v56 = v54;
          v57 = v55;
          while (true) {
            int v58 = 4;
            int v59 = v3 % v58;
            int v60 = 1;
            int v61 = v59 + v60;
            bool v62 = v57 < v61;
            v56 = v56;
            v57 = v57;
            if (!v62) break;
            int v63 = 1;
            int v64 = v57 + v63;
            v56 = v0;
            v57 = v64;
          }
          int v65 = 2;
          int v66 = v0 + v65;
          v53 = v56;
          break;
        }
        case 1:
          {
          v53 = v0;
          break;
        }
        case 2:
          {
          int v67 = 0;
          int v68 = 0;
          int v69;
          int v70;
          v69 = v67;
          v70 = v68;
          while (true) {
            int v71 = 4;
            int v72 = v3 % v71;
            int v73 = 1;
            int v74 = v72 + v73;
            bool v75 = v70 < v74;
            v69 = v69;
            v70 = v70;
            if (!v75) break;
            int v76 = 3;
            int v77 = 1;
            int v78 = v70 + v77;
            v69 = v76;
            v70 = v78;
            break;
            ;
          }
          int v79 = 0;
          v53 = v69;
        }
        default:
          {
          int v80 = 0;
          bool v81 = v2 != v80;
          int v82;
          if (v81) {
            int v83 = 3;
            int v84 = v0 + v83;
            v82 = v84;
          } else {
            int v85 = 4;
            v82 = v85;
          }
          int v86 = 4;
          v53 = v82;
          break;
        }
      }
      int v87 = 2;
      v27 = v53;
      break;
    }
  }
  bool v88 = true;
  int v89 = simt_wave_count_bits(v88);
  int v90 = 16;
  int v91 = v90 + v0;
  v1[v91] = v89;
  int v92 = 0;
  bool v93 = v2 != v92;
  int v94 = v93 ? v22 : v27;
  return;
}

kernel void kernel_main(device int* v95 [[buffer(0)]], device int* v96 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v97 = static_cast<int>(__simt_tid3.x);
  int v98 = 0;
  int v99 = v98 + v97;
  int v100 = v96[v99];
  int v101 = 4;
  int v102 = v101 + v97;
  int v103 = v96[v102];
  helper0(v97, v95, v100, v103, static_cast<int>(__simt_tid3.x));
  int v104 = 8;
  int v105 = v104 + v97;
  int v106 = v96[v105];
  int v107;
  v107 = v97;
  switch (v106) {
    case 0:
      {
      int v108 = 12;
      int v109 = v108 + v97;
      int v110 = v96[v109];
      int v111 = 0;
      bool v112 = v110 != v111;
      int v113;
      if (v112) {
        v113 = v97;
      } else {
        v113 = v97;
      }
      v107 = v113;
      break;
    }
    default:
      {
      int v114 = 16;
      int v115 = v114 + v97;
      int v116 = v96[v115];
      int v117 = 0;
      bool v118 = v116 != v117;
      int v119;
      if (v118) {
        int v120 = 20;
        int v121 = v120 + v97;
        int v122 = v96[v121];
        int v123 = 0;
        bool v124 = v122 != v123;
        int v125;
        if (v124) {
          v125 = v97;
        } else {
          int v126 = 1;
          int v127 = v97 + v126;
          v125 = v127;
        }
        v119 = v125;
      } else {
        int v128 = 24;
        int v129 = v128 + v97;
        int v130 = v96[v129];
        int v131;
        v131 = v97;
        switch (v130) {
          case 0:
            {
            int v132 = 4;
            v131 = v132;
            break;
          }
          case 1:
            {
            v131 = v97;
            break;
          }
          default:
            {
            int v133 = 1;
            int v134 = v97 + v133;
            v131 = v134;
            break;
          }
          case 2:
            {
            int v135 = 2;
            v131 = v135;
            break;
          }
        }
        bool v136 = true;
        v119 = v131;
      }
      v107 = v119;
      break;
    }
  }
  bool v137 = true;
  int v138 = 32;
  int v139 = v138 + v97;
  bool v140 = true;
  int v141 = simt_wave_count_bits(v140);
  v95[v139] = v141;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 28; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
