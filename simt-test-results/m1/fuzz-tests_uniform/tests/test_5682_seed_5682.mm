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
  int v4 = 4;
  int v5 = v3 % v4;
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 0;
      bool v10 = v2 != v9;
      int v11;
      if (v10) {
        int v12 = 3;
        int v13 = v3 % v12;
        int v14 = 3;
        int v15;
        v15 = v14;
        switch (v13) {
          case 0:
            {
            v15 = v0;
            break;
          }
          default:
            {
            int v16 = 0;
            int v17 = v0 + v16;
            v15 = v17;
            break;
          }
          case 1:
            {
            int v18 = 0;
            int v19 = v0 + v18;
            v15 = v19;
            break;
          }
        }
        v11 = v15;
      } else {
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
          int v29 = 0;
          int v30 = v0 + v29;
          int v31 = 1;
          int v32 = v23 + v31;
          v22 = v30;
          v23 = v32;
        }
        int v33 = 1;
        v11 = v22;
      }
      int v34 = 1;
      int v35 = v0 + v34;
      v8 = v11;
      break;
    }
    case 0:
      {
      int v36 = 0;
      int v37 = 0;
      int v38;
      int v39;
      v38 = v36;
      v39 = v37;
      while (true) {
        int v40 = 4;
        int v41 = v3 % v40;
        int v42 = 1;
        int v43 = v41 + v42;
        bool v44 = v39 < v43;
        v38 = v38;
        v39 = v39;
        if (!v44) break;
        int v45 = 0;
        int v46 = 0;
        int v47;
        int v48;
        v47 = v45;
        v48 = v46;
        while (true) {
          int v49 = 4;
          int v50 = v3 % v49;
          int v51 = 1;
          int v52 = v50 + v51;
          bool v53 = v48 < v52;
          v47 = v47;
          v48 = v48;
          if (!v53) break;
          int v54 = 2;
          int v55 = 1;
          int v56 = v48 + v55;
          v47 = v54;
          v48 = v56;
          break;
          ;
        }
        int v57 = 2;
        int v58 = v0 + v57;
        int v59 = 1;
        int v60 = v39 + v59;
        v38 = v47;
        v39 = v60;
        continue;
        ;
      }
      v8 = v38;
      break;
    }
    case 1:
      {
      int v61 = 3;
      int v62 = v0 + v61;
      v8 = v62;
      break;
    }
    case 2:
      {
      int v63 = 0;
      bool v64 = v2 != v63;
      int v65;
      if (v64) {
        int v66 = 0;
        bool v67 = v2 != v66;
        int v68;
        if (v67) {
          v68 = v0;
        } else {
          int v69 = 0;
          int v70 = v0 + v69;
          v68 = v70;
        }
        int v71 = 3;
        v65 = v68;
      } else {
        int v72 = 0;
        bool v73 = v2 != v72;
        int v74;
        if (v73) {
          int v75 = 1;
          int v76 = v0 + v75;
          v74 = v76;
        } else {
          int v77 = 4;
          int v78 = v0 + v77;
          v74 = v78;
        }
        v65 = v74;
      }
      int v79 = 2;
      v8 = v65;
      break;
    }
  }
  bool v80 = true;
  int v81 = simt_wave_count_bits(v80);
  int v82 = 0;
  int v83 = v82 + v0;
  v1[v83] = v81;
  return;
}

kernel void kernel_main(device int* v84 [[buffer(0)]], device int* v85 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v86 = static_cast<int>(__simt_tid3.x);
  int v87 = 0;
  int v88 = v87 + v86;
  int v89 = v85[v88];
  int v90 = 4;
  int v91 = v90 + v86;
  int v92 = v85[v91];
  helper0(v86, v84, v89, v92, static_cast<int>(__simt_tid3.x));
  uint v93 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v94 = (int)(v93);
  int v95 = 8;
  int v96 = v95 + v86;
  int v97 = v85[v96];
  int v98 = 0;
  bool v99 = v97 != v98;
  int v100;
  if (v99) {
    int v101 = 12;
    int v102 = v101 + v86;
    int v103 = v85[v102];
    int v104 = 0;
    int v105 = v86 + v104;
    int v106;
    v106 = v105;
    switch (v103) {
      case 0:
        {
        int v107 = 3;
        v106 = v107;
        break;
      }
      default:
        {
        int v108 = 16;
        int v109 = v108 + v86;
        int v110 = v85[v109];
        int v111;
        v111 = v86;
        switch (v110) {
          case 0:
            {
            v111 = v86;
            break;
          }
          default:
            {
            int v112 = 3;
            int v113 = v86 + v112;
            v111 = v113;
            break;
          }
          case 1:
            {
            v111 = v86;
            break;
          }
          case 2:
            {
            int v114 = 1;
            int v115 = v86 + v114;
            v111 = v115;
            break;
          }
        }
        bool v116 = true;
        v106 = v111;
        break;
      }
      case 1:
        {
        v106 = v86;
        break;
      }
    }
    bool v117 = true;
    v100 = v106;
  } else {
    int v118 = 20;
    int v119 = v118 + v86;
    int v120 = v85[v119];
    int v121;
    v121 = v86;
    switch (v120) {
      case 0:
        {
        int v122 = 24;
        int v123 = v122 + v86;
        int v124 = v85[v123];
        int v125 = 3;
        int v126;
        v126 = v125;
        switch (v124) {
          case 0:
            {
            int v127 = 1;
            v126 = v127;
          }
          case 1:
            {
            v126 = v86;
          }
          default:
            {
            int v128 = 4;
            v126 = v128;
          }
          case 2:
            {
            int v129 = 3;
            v126 = v129;
            break;
          }
        }
        bool v130 = true;
        v121 = v126;
        break;
      }
      default:
        {
        int v131 = 0;
        int v132 = 0;
        int v133;
        int v134;
        v133 = v131;
        v134 = v132;
        while (true) {
          int v135 = 4;
          int v136 = v134 * v135;
          int v137 = v136 + v86;
          int v138 = 28;
          int v139 = v138 + v137;
          int v140 = v85[v139];
          int v141 = 0;
          bool v142 = v140 != v141;
          v133 = v133;
          v134 = v134;
          if (!v142) break;
          int v143 = v133 + v134;
          int v144 = 1;
          int v145 = v134 + v144;
          v133 = v143;
          v134 = v145;
        }
        bool v146 = true;
        v121 = v133;
        break;
      }
    }
    bool v147 = true;
    v100 = v121;
  }
  int v148 = 16;
  int v149 = v148 + v86;
  bool v150 = true;
  int v151 = simt_wave_count_bits(v150);
  v84[v149] = v151;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 48; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
