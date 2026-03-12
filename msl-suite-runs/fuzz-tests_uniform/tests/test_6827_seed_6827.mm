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
    v6 = v7;
  } else {
    int v8 = 4;
    int v9 = v3 % v8;
    uint v10 = simt_lane_id(__simt_tid);
    int v11 = (int)(v10);
    int v12;
    v12 = v11;
    switch (v9) {
      case 0:
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
          int v22 = 2;
          int v23 = v0 + v22;
          int v24 = 1;
          int v25 = v16 + v24;
          v15 = v23;
          v16 = v25;
        }
        int v26 = 0;
        v12 = v15;
        break;
      }
      default:
        {
        int v27 = 0;
        bool v28 = v2 != v27;
        int v29;
        if (v28) {
          int v30 = 4;
          v29 = v30;
        } else {
          int v31 = 1;
          int v32 = v0 + v31;
          v29 = v32;
        }
        int v33 = 4;
        int v34 = v0 + v33;
        v12 = v29;
        break;
      }
      case 1:
        {
        int v35 = 2;
        int v36 = v0 + v35;
        int v37;
        v37 = v36;
        switch (v3) {
          case 0:
            {
            int v38 = 4;
            int v39 = v0 + v38;
            v37 = v39;
          }
          default:
            {
            int v40 = 1;
            v37 = v40;
            break;
          }
        }
        v12 = v37;
        break;
      }
      case 2:
        {
        int v41 = 0;
        int v42 = 0;
        int v43;
        int v44;
        v43 = v41;
        v44 = v42;
        while (true) {
          int v45 = 4;
          int v46 = v3 % v45;
          int v47 = 1;
          int v48 = v46 + v47;
          bool v49 = v44 < v48;
          v43 = v43;
          v44 = v44;
          if (!v49) break;
          int v50 = 0;
          int v51 = 1;
          int v52 = v44 + v51;
          v43 = v50;
          v44 = v52;
        }
        int v53 = 2;
        int v54 = v0 + v53;
        v12 = v43;
        break;
      }
    }
    v6 = v12;
  }
  bool v55 = true;
  int v56 = simt_wave_count_bits(v55);
  int v57 = 0;
  int v58 = v57 + v0;
  v1[v58] = v56;
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
  int v68 = 8;
  int v69 = v68 + v61;
  int v70 = v60[v69];
  uint v71 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v72 = (int)(v71);
  int v73;
  v73 = v72;
  switch (v70) {
    case 0:
      {
      int v74 = 12;
      int v75 = v74 + v61;
      int v76 = v60[v75];
      int v77 = 0;
      bool v78 = v76 != v77;
      int v79;
      if (v78) {
        int v80 = 0;
        int v81 = 0;
        int v82;
        int v83;
        v82 = v80;
        v83 = v81;
        while (true) {
          int v84 = 4;
          int v85 = v83 * v84;
          int v86 = v85 + v61;
          int v87 = 16;
          int v88 = v87 + v86;
          int v89 = v60[v88];
          int v90 = 0;
          bool v91 = v89 != v90;
          v82 = v82;
          v83 = v83;
          if (!v91) break;
          int v92 = v82 + v83;
          int v93 = 1;
          int v94 = v83 + v93;
          v82 = v92;
          v83 = v94;
        }
        bool v95 = true;
        v79 = v82;
      } else {
        int v96 = 0;
        int v97 = 0;
        int v98;
        int v99;
        v98 = v96;
        v99 = v97;
        while (true) {
          int v100 = 4;
          int v101 = v99 * v100;
          int v102 = v101 + v61;
          int v103 = 36;
          int v104 = v103 + v102;
          int v105 = v60[v104];
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
          continue;
          ;
        }
        bool v111 = true;
        v79 = v98;
      }
      v73 = v79;
      break;
    }
    default:
      {
      int v112 = 0;
      int v113 = 0;
      int v114;
      int v115;
      v114 = v112;
      v115 = v113;
      while (true) {
        int v116 = 4;
        int v117 = v115 * v116;
        int v118 = v117 + v61;
        int v119 = 56;
        int v120 = v119 + v118;
        int v121 = v60[v120];
        int v122 = 0;
        bool v123 = v121 != v122;
        v114 = v114;
        v115 = v115;
        if (!v123) break;
        int v124 = v114 + v115;
        int v125 = 1;
        int v126 = v115 + v125;
        v114 = v124;
        v115 = v126;
      }
      bool v127 = true;
      v73 = v114;
      break;
    }
    case 1:
      {
      v73 = v61;
      break;
    }
    case 2:
      {
      int v128 = 3;
      int v129 = v61 + v128;
      v73 = v129;
      break;
    }
  }
  bool v130 = true;
  int v131 = 16;
  int v132 = v131 + v61;
  bool v133 = true;
  int v134 = simt_wave_count_bits(v133);
  v59[v132] = v134;
  int v135 = 0;
  int v136 = 0;
  int v137;
  int v138;
  v137 = v135;
  v138 = v136;
  while (true) {
    int v139 = 4;
    int v140 = v138 * v139;
    int v141 = v140 + v61;
    int v142 = 76;
    int v143 = v142 + v141;
    int v144 = v60[v143];
    int v145 = 0;
    bool v146 = v144 != v145;
    v137 = v137;
    v138 = v138;
    if (!v146) break;
    int v147 = 96;
    int v148 = v147 + v61;
    int v149 = v60[v148];
    int v150 = 0;
    bool v151 = v149 != v150;
    int v152;
    if (v151) {
      uint v153 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v154 = (int)(v153);
      v152 = v154;
    } else {
      int v155 = 100;
      int v156 = v155 + v61;
      int v157 = v60[v156];
      int v158;
      v158 = v61;
      switch (v157) {
        default:
          {
          int v159 = 2;
          int v160 = v61 + v159;
          v158 = v160;
          break;
        }
        case 0:
          {
          int v161 = 3;
          v158 = v161;
          break;
        }
      }
      bool v162 = true;
      v152 = v158;
    }
    int v163 = v137 + v152;
    int v164 = 1;
    int v165 = v138 + v164;
    v137 = v163;
    v138 = v165;
    break;
    ;
  }
  bool v166 = true;
  int v167 = 32;
  int v168 = v167 + v61;
  bool v169 = true;
  int v170 = simt_wave_count_bits(v169);
  v59[v168] = v170;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 104; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
