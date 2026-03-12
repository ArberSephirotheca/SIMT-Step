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
    int v7 = 2;
    int v8 = v3 % v7;
    uint v9 = simt_lane_id(__simt_tid);
    int v10 = (int)(v9);
    int v11;
    v11 = v10;
    switch (v8) {
      default:
        {
        int v12 = 0;
        int v13 = 0;
        int v14;
        int v15;
        v14 = v12;
        v15 = v13;
        while (true) {
          int v16 = 4;
          int v17 = v3 % v16;
          int v18 = 1;
          int v19 = v17 + v18;
          bool v20 = v15 < v19;
          v14 = v14;
          v15 = v15;
          if (!v20) break;
          int v21 = 1;
          int v22 = v15 + v21;
          v14 = v0;
          v15 = v22;
        }
        int v23 = 1;
        v11 = v14;
      }
      case 0:
        {
        int v24 = 0;
        int v25 = 0;
        int v26;
        int v27;
        v26 = v24;
        v27 = v25;
        while (true) {
          int v28 = 4;
          int v29 = v3 % v28;
          int v30 = 1;
          int v31 = v29 + v30;
          bool v32 = v27 < v31;
          v26 = v26;
          v27 = v27;
          if (!v32) break;
          int v33 = 3;
          int v34 = 1;
          int v35 = v27 + v34;
          v26 = v33;
          v27 = v35;
        }
        int v36 = 0;
        v11 = v26;
        break;
      }
    }
    int v37 = 1;
    int v38 = v0 + v37;
    v6 = v11;
  } else {
    int v39 = 4;
    int v40 = v3 % v39;
    int v41 = 4;
    int v42;
    v42 = v41;
    switch (v40) {
      default:
        {
        int v43 = 2;
        int v44 = v3 % v43;
        int v45 = 1;
        int v46 = v0 + v45;
        int v47;
        v47 = v46;
        switch (v44) {
          case 0:
            {
            int v48 = 2;
            v47 = v48;
            break;
          }
          default:
            {
            int v49 = 0;
            int v50 = v0 + v49;
            v47 = v50;
            break;
          }
        }
        v42 = v47;
      }
      case 0:
        {
        int v51 = 0;
        bool v52 = v2 != v51;
        int v53;
        if (v52) {
          v53 = v0;
        } else {
          v53 = v0;
        }
        int v54 = 0;
        v42 = v53;
        break;
      }
      case 1:
        {
        int v55 = 3;
        int v56 = v3 % v55;
        int v57 = 1;
        int v58 = v0 + v57;
        int v59;
        v59 = v58;
        switch (v56) {
          case 0:
            {
            int v60 = 0;
            int v61 = v0 + v60;
            v59 = v61;
            break;
          }
          case 1:
            {
            v59 = v0;
            break;
          }
          case 2:
            {
            int v62 = 2;
            int v63 = v0 + v62;
            v59 = v63;
            break;
          }
          default:
            {
            int v64 = 1;
            v59 = v64;
            break;
          }
        }
        int v65 = 2;
        v42 = v59;
        break;
      }
      case 2:
        {
        v42 = v0;
        break;
      }
    }
    v6 = v42;
  }
  bool v66 = true;
  int v67 = simt_wave_count_bits(v66);
  int v68 = 0;
  int v69 = v68 + v0;
  v1[v69] = v67;
  int v70 = 0;
  bool v71 = v2 != v70;
  int v72 = v71 ? v0 : v6;
  return;
}

kernel void kernel_main(device int* v73 [[buffer(0)]], device int* v74 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v75 = static_cast<int>(__simt_tid3.x);
  int v76 = 0;
  int v77 = v76 + v75;
  int v78 = v74[v77];
  int v79 = 4;
  int v80 = v79 + v75;
  int v81 = v74[v80];
  helper0(v75, v73, v78, v81, static_cast<int>(__simt_tid3.x));
  int v82 = 4;
  int v83 = 8;
  int v84 = v83 + v75;
  int v85 = v74[v84];
  int v86 = 0;
  bool v87 = v85 != v86;
  int v88;
  if (v87) {
    int v89 = 12;
    int v90 = v89 + v75;
    int v91 = v74[v90];
    int v92 = 3;
    int v93 = v75 + v92;
    int v94;
    v94 = v93;
    switch (v91) {
      case 0:
        {
        int v95 = 16;
        int v96 = v95 + v75;
        int v97 = v74[v96];
        int v98;
        v98 = v75;
        switch (v97) {
          default:
            {
            v98 = v75;
            break;
          }
          case 0:
            {
            int v99 = 3;
            int v100 = v75 + v99;
            v98 = v100;
            break;
          }
        }
        bool v101 = true;
        v94 = v98;
      }
      default:
        {
        int v102 = 0;
        int v103 = 0;
        int v104;
        int v105;
        v104 = v102;
        v105 = v103;
        while (true) {
          int v106 = 4;
          int v107 = v105 * v106;
          int v108 = v107 + v75;
          int v109 = 20;
          int v110 = v109 + v108;
          int v111 = v74[v110];
          int v112 = 0;
          bool v113 = v111 != v112;
          v104 = v104;
          v105 = v105;
          if (!v113) break;
          int v114 = v104 + v105;
          int v115 = 1;
          int v116 = v105 + v115;
          v104 = v114;
          v105 = v116;
        }
        bool v117 = true;
        v94 = v104;
        break;
      }
      case 1:
        {
        int v118 = 40;
        int v119 = v118 + v75;
        int v120 = v74[v119];
        int v121;
        v121 = v75;
        switch (v120) {
          default:
            {
            int v122 = 1;
            v121 = v122;
            break;
          }
          case 0:
            {
            int v123 = 4;
            int v124 = v75 + v123;
            v121 = v124;
            break;
          }
        }
        bool v125 = true;
        v94 = v121;
        break;
      }
      case 2:
        {
        int v126 = 44;
        int v127 = v126 + v75;
        int v128 = v74[v127];
        int v129 = 0;
        bool v130 = v128 != v129;
        int v131;
        if (v130) {
          int v132 = 4;
          int v133 = v75 + v132;
          v131 = v133;
        } else {
          int v134 = 0;
          v131 = v134;
        }
        v94 = v131;
        break;
      }
    }
    bool v135 = true;
    v88 = v94;
  } else {
    int v136 = 0;
    int v137 = 0;
    int v138;
    int v139;
    v138 = v136;
    v139 = v137;
    while (true) {
      int v140 = 4;
      int v141 = v139 * v140;
      int v142 = v141 + v75;
      int v143 = 48;
      int v144 = v143 + v142;
      int v145 = v74[v144];
      int v146 = 0;
      bool v147 = v145 != v146;
      v138 = v138;
      v139 = v139;
      if (!v147) break;
      int v148 = v138 + v139;
      int v149 = 1;
      int v150 = v139 + v149;
      v138 = v148;
      v139 = v150;
    }
    bool v151 = true;
    v88 = v138;
  }
  int v152 = 16;
  int v153 = v152 + v75;
  bool v154 = true;
  int v155 = simt_wave_count_bits(v154);
  v73[v153] = v155;
  int v156 = 1;
  int v157 = v75 + v156;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
