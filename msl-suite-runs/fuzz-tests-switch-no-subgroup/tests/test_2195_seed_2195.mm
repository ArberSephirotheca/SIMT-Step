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
    int v7 = 4;
    int v8 = v3 % v7;
    int v9;
    v9 = v0;
    switch (v8) {
      case 0:
        {
        int v10 = 0;
        bool v11 = v2 != v10;
        int v12;
        if (v11) {
          int v13 = 0;
          int v14 = v0 + v13;
          v12 = v14;
        } else {
          int v15 = 3;
          v12 = v15;
        }
        v9 = v12;
        break;
      }
      default:
        {
        int v16 = 2;
        int v17 = v0 + v16;
        v9 = v17;
      }
      case 1:
        {
        int v18 = 4;
        int v19 = v3 % v18;
        int v20 = 3;
        int v21;
        v21 = v20;
        switch (v19) {
          case 0:
            {
            v21 = v0;
          }
          default:
            {
            int v22 = 0;
            int v23 = v0 + v22;
            v21 = v23;
          }
          case 1:
            {
            int v24 = 3;
            int v25 = v0 + v24;
            v21 = v25;
            break;
          }
          case 2:
            {
            v21 = v0;
            break;
          }
        }
        int v26 = 1;
        int v27 = v0 + v26;
        v9 = v21;
      }
      case 2:
        {
        int v28 = 2;
        int v29 = v3 % v28;
        int v30 = 3;
        int v31;
        v31 = v30;
        switch (v29) {
          case 0:
            {
            int v32 = 1;
            int v33 = v0 + v32;
            v31 = v33;
          }
          default:
            {
            int v34 = 1;
            v31 = v34;
            break;
          }
        }
        v9 = v31;
        break;
      }
    }
    v6 = v9;
  } else {
    bool v35 = true;
    int v36 = simt_wave_count_bits(v35);
    int v37 = 0;
    int v38 = v37 + v0;
    v1[v38] = v36;
    v6 = v36;
  }
  return;
}

kernel void kernel_main(device int* v39 [[buffer(0)]], device int* v40 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v41 = static_cast<int>(__simt_tid3.x);
  int v42 = 0;
  int v43 = v42 + v41;
  int v44 = v40[v43];
  int v45 = 4;
  int v46 = v45 + v41;
  int v47 = v40[v46];
  helper0(v41, v39, v44, v47, static_cast<int>(__simt_tid3.x));
  int v48 = 8;
  int v49 = v48 + v41;
  int v50 = v40[v49];
  int v51 = 0;
  int v52 = v41 + v51;
  int v53;
  v53 = v52;
  switch (v50) {
    case 0:
      {
      int v54 = 12;
      int v55 = v54 + v41;
      int v56 = v40[v55];
      int v57 = 0;
      bool v58 = v56 != v57;
      int v59;
      if (v58) {
        int v60 = 16;
        int v61 = v60 + v41;
        int v62 = v40[v61];
        int v63 = 0;
        bool v64 = v62 != v63;
        int v65;
        if (v64) {
          int v66 = 3;
          v65 = v66;
        } else {
          int v67 = 3;
          v65 = v67;
        }
        v59 = v65;
      } else {
        int v68 = 20;
        int v69 = v68 + v41;
        int v70 = v40[v69];
        int v71 = 0;
        bool v72 = v70 != v71;
        int v73;
        if (v72) {
          int v74 = 1;
          int v75 = v41 + v74;
          v73 = v75;
        } else {
          int v76 = 2;
          v73 = v76;
        }
        v59 = v73;
      }
      v53 = v59;
      break;
    }
    case 1:
      {
      int v77 = 24;
      int v78 = v77 + v41;
      int v79 = v40[v78];
      int v80;
      v80 = v41;
      switch (v79) {
        case 0:
          {
          v80 = v41;
          break;
        }
        default:
          {
          int v81 = 2;
          v80 = v81;
        }
        case 1:
          {
          v80 = v41;
          break;
        }
      }
      v53 = v80;
      break;
    }
    case 2:
      {
      int v82 = 2;
      v53 = v82;
      break;
    }
    default:
      {
      int v83 = 0;
      int v84 = 0;
      int v85;
      int v86;
      v85 = v83;
      v86 = v84;
      while (true) {
        int v87 = 4;
        int v88 = v86 * v87;
        int v89 = v88 + v41;
        int v90 = 28;
        int v91 = v90 + v89;
        int v92 = v40[v91];
        int v93 = 0;
        bool v94 = v92 != v93;
        v85 = v85;
        v86 = v86;
        if (!v94) break;
        int v95 = v85 + v86;
        int v96 = 1;
        int v97 = v86 + v96;
        bool v98 = true;
        v85 = v95;
        v86 = v97;
        break;
        ;
      }
      v53 = v85;
      break;
    }
  }
  int v99 = 48;
  int v100 = v99 + v41;
  int v101 = v40[v100];
  int v102 = 0;
  bool v103 = v101 != v102;
  int v104;
  if (v103) {
    int v105 = 0;
    int v106 = 0;
    int v107;
    int v108;
    v107 = v105;
    v108 = v106;
    while (true) {
      int v109 = 4;
      int v110 = v108 * v109;
      int v111 = v110 + v41;
      int v112 = 52;
      int v113 = v112 + v111;
      int v114 = v40[v113];
      int v115 = 0;
      bool v116 = v114 != v115;
      v107 = v107;
      v108 = v108;
      if (!v116) break;
      int v117 = 72;
      int v118 = v117 + v41;
      int v119 = v40[v118];
      int v120;
      v120 = v41;
      switch (v119) {
        default:
          {
          v120 = v41;
          break;
        }
        case 0:
          {
          int v121 = 0;
          int v122 = v41 + v121;
          v120 = v122;
          break;
        }
      }
      int v123 = v107 + v120;
      int v124 = 1;
      int v125 = v108 + v124;
      bool v126 = true;
      int v127 = 16;
      int v128 = 4;
      int v129 = v108 * v128;
      int v130 = v127 + v129;
      int v131 = v130 + v41;
      bool v132 = true;
      int v133 = simt_wave_count_bits(v132);
      v39[v131] = v133;
      v107 = v123;
      v108 = v125;
    }
    v104 = v107;
  } else {
    int v134 = 0;
    int v135 = 0;
    int v136;
    int v137;
    v136 = v134;
    v137 = v135;
    while (true) {
      int v138 = 4;
      int v139 = v137 * v138;
      int v140 = v139 + v41;
      int v141 = 76;
      int v142 = v141 + v140;
      int v143 = v40[v142];
      int v144 = 0;
      bool v145 = v143 != v144;
      v136 = v136;
      v137 = v137;
      if (!v145) break;
      int v146 = 96;
      int v147 = v146 + v41;
      int v148 = v40[v147];
      int v149 = 0;
      bool v150 = v148 != v149;
      int v151;
      if (v150) {
        int v152 = 4;
        int v153 = v41 + v152;
        v151 = v153;
      } else {
        uint v154 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v155 = (int)(v154);
        v151 = v155;
      }
      int v156 = 32;
      int v157 = v156 + v41;
      bool v158 = true;
      int v159 = simt_wave_count_bits(v158);
      v39[v157] = v159;
      int v160 = v136 + v151;
      int v161 = 1;
      int v162 = v137 + v161;
      bool v163 = true;
      int v164 = 48;
      int v165 = 4;
      int v166 = v137 * v165;
      int v167 = v164 + v166;
      int v168 = v167 + v41;
      bool v169 = true;
      int v170 = simt_wave_count_bits(v169);
      v39[v168] = v170;
      v136 = v160;
      v137 = v162;
      continue;
      ;
    }
    v104 = v136;
  }
  int v171 = 64;
  int v172 = v171 + v41;
  bool v173 = true;
  int v174 = simt_wave_count_bits(v173);
  v39[v172] = v174;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 100; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
