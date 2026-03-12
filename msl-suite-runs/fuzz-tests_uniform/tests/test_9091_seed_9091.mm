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
    int v9 = 2;
    int v10;
    v10 = v9;
    switch (v8) {
      case 0:
        {
        int v11 = 0;
        bool v12 = v2 != v11;
        int v13;
        if (v12) {
          v13 = v0;
        } else {
          int v14 = 2;
          v13 = v14;
        }
        v10 = v13;
        break;
      }
      default:
        {
        int v15 = 0;
        bool v16 = v2 != v15;
        int v17;
        if (v16) {
          int v18 = 1;
          v17 = v18;
        } else {
          v17 = v0;
        }
        int v19 = 0;
        v10 = v17;
        break;
      }
      case 1:
        {
        int v20 = 0;
        bool v21 = v2 != v20;
        int v22;
        if (v21) {
          v22 = v0;
        } else {
          int v23 = 2;
          int v24 = v0 + v23;
          v22 = v24;
        }
        v10 = v22;
        break;
      }
      case 2:
        {
        v10 = v0;
        break;
      }
    }
    v6 = v10;
  } else {
    int v25 = 4;
    int v26 = v3 % v25;
    int v27 = 3;
    int v28 = v0 + v27;
    int v29;
    v29 = v28;
    switch (v26) {
      default:
        {
        int v30 = 2;
        int v31 = v3 % v30;
        int v32;
        v32 = v0;
        switch (v31) {
          default:
            {
            int v33 = 3;
            int v34 = v0 + v33;
            v32 = v34;
            break;
          }
          case 0:
            {
            int v35 = 1;
            v32 = v35;
            break;
          }
        }
        v29 = v32;
        break;
      }
      case 0:
        {
        int v36 = 2;
        int v37 = v3 % v36;
        int v38;
        v38 = v0;
        switch (v37) {
          default:
            {
            int v39 = 2;
            int v40 = v0 + v39;
            v38 = v40;
            break;
          }
          case 0:
            {
            int v41 = 3;
            int v42 = v0 + v41;
            v38 = v42;
            break;
          }
          case 1:
            {
            int v43 = 3;
            v38 = v43;
            break;
          }
        }
        int v44 = 0;
        int v45 = v0 + v44;
        v29 = v38;
        break;
      }
      case 1:
        {
        int v46 = 2;
        int v47 = v3 % v46;
        int v48;
        v48 = v0;
        switch (v47) {
          default:
            {
            int v49 = 2;
            v48 = v49;
            break;
          }
          case 0:
            {
            int v50 = 1;
            v48 = v50;
            break;
          }
          case 1:
            {
            int v51 = 1;
            v48 = v51;
            break;
          }
        }
        int v52 = 4;
        int v53 = v0 + v52;
        v29 = v48;
        break;
      }
      case 2:
        {
        int v54 = 0;
        bool v55 = v2 != v54;
        int v56;
        if (v55) {
          int v57 = 0;
          v56 = v57;
        } else {
          int v58 = 2;
          v56 = v58;
        }
        int v59 = 0;
        int v60 = v0 + v59;
        v29 = v56;
        break;
      }
    }
    int v61 = 0;
    int v62 = v0 + v61;
    v6 = v29;
  }
  bool v63 = true;
  int v64 = simt_wave_count_bits(v63);
  int v65 = 0;
  int v66 = v65 + v0;
  v1[v66] = v64;
  return;
}

kernel void kernel_main(device int* v67 [[buffer(0)]], device int* v68 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v69 = static_cast<int>(__simt_tid3.x);
  int v70 = 0;
  int v71 = v70 + v69;
  int v72 = v68[v71];
  int v73 = 4;
  int v74 = v73 + v69;
  int v75 = v68[v74];
  helper0(v69, v67, v72, v75, static_cast<int>(__simt_tid3.x));
  int v76 = 1;
  int v77 = v69 + v76;
  int v78 = 0;
  int v79 = 0;
  int v80;
  int v81;
  v80 = v78;
  v81 = v79;
  while (true) {
    int v82 = 4;
    int v83 = v81 * v82;
    int v84 = v83 + v69;
    int v85 = 8;
    int v86 = v85 + v84;
    int v87 = v68[v86];
    int v88 = 0;
    bool v89 = v87 != v88;
    v80 = v80;
    v81 = v81;
    if (!v89) break;
    int v90 = 0;
    int v91 = 0;
    int v92;
    int v93;
    v92 = v90;
    v93 = v91;
    while (true) {
      int v94 = 4;
      int v95 = v93 * v94;
      int v96 = v95 + v69;
      int v97 = 28;
      int v98 = v97 + v96;
      int v99 = v68[v98];
      int v100 = 0;
      bool v101 = v99 != v100;
      v92 = v92;
      v93 = v93;
      if (!v101) break;
      int v102 = 48;
      int v103 = v102 + v69;
      int v104 = v68[v103];
      int v105;
      v105 = v69;
      switch (v104) {
        default:
          {
          int v106 = 0;
          int v107 = v69 + v106;
          v105 = v107;
          break;
        }
        case 0:
          {
          int v108 = 3;
          v105 = v108;
          break;
        }
      }
      bool v109 = true;
      int v110 = v92 + v105;
      int v111 = 1;
      int v112 = v93 + v111;
      v92 = v110;
      v93 = v112;
    }
    bool v113 = true;
    int v114 = v80 + v92;
    int v115 = 1;
    int v116 = v81 + v115;
    v80 = v114;
    v81 = v116;
  }
  bool v117 = true;
  int v118 = 16;
  int v119 = v118 + v69;
  bool v120 = true;
  int v121 = simt_wave_count_bits(v120);
  v67[v119] = v121;
  int v122 = 52;
  int v123 = v122 + v69;
  int v124 = v68[v123];
  int v125 = 0;
  bool v126 = v124 != v125;
  int v127;
  if (v126) {
    int v128 = 0;
    int v129 = 0;
    int v130;
    int v131;
    v130 = v128;
    v131 = v129;
    while (true) {
      int v132 = 4;
      int v133 = v131 * v132;
      int v134 = v133 + v69;
      int v135 = 56;
      int v136 = v135 + v134;
      int v137 = v68[v136];
      int v138 = 0;
      bool v139 = v137 != v138;
      v130 = v130;
      v131 = v131;
      if (!v139) break;
      int v140 = v130 + v131;
      int v141 = 1;
      int v142 = v131 + v141;
      v130 = v140;
      v131 = v142;
      continue;
      ;
    }
    bool v143 = true;
    v127 = v130;
  } else {
    int v144 = 76;
    int v145 = v144 + v69;
    int v146 = v68[v145];
    uint v147 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v148 = (int)(v147);
    int v149;
    v149 = v148;
    switch (v146) {
      default:
        {
        int v150 = 80;
        int v151 = v150 + v69;
        int v152 = v68[v151];
        int v153 = 2;
        int v154;
        v154 = v153;
        switch (v152) {
          case 0:
            {
            v154 = v69;
            break;
          }
          default:
            {
            int v155 = 1;
            int v156 = v69 + v155;
            v154 = v156;
            break;
          }
        }
        bool v157 = true;
        v149 = v154;
        break;
      }
      case 0:
        {
        int v158 = 1;
        int v159 = v69 + v158;
        v149 = v159;
      }
      case 1:
        {
        int v160 = 84;
        int v161 = v160 + v69;
        int v162 = v68[v161];
        int v163 = 0;
        bool v164 = v162 != v163;
        int v165;
        if (v164) {
          int v166 = 1;
          int v167 = v69 + v166;
          v165 = v167;
        } else {
          v165 = v69;
        }
        v149 = v165;
        break;
      }
      case 2:
        {
        int v168 = 3;
        int v169 = v69 + v168;
        v149 = v169;
        break;
      }
    }
    bool v170 = true;
    v127 = v149;
  }
  int v171 = 32;
  int v172 = v171 + v69;
  bool v173 = true;
  int v174 = simt_wave_count_bits(v173);
  v67[v172] = v174;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 88; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
