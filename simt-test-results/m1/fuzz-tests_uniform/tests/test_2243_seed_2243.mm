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
      int v16 = 3;
      int v17 = v3 % v16;
      uint v18 = simt_lane_id(__simt_tid);
      int v19 = (int)(v18);
      int v20;
      v20 = v19;
      switch (v17) {
        case 0:
          {
          int v21 = 3;
          int v22 = v0 + v21;
          v20 = v22;
          break;
        }
        default:
          {
          v20 = v0;
        }
        case 1:
          {
          v20 = v0;
        }
        case 2:
          {
          v20 = v0;
          break;
        }
      }
      int v23 = 1;
      int v24 = 1;
      int v25 = v10 + v24;
      v9 = v20;
      v10 = v25;
    }
    int v26 = 3;
    int v27 = v0 + v26;
    v6 = v9;
  } else {
    int v28 = 0;
    bool v29 = v2 != v28;
    int v30;
    if (v29) {
      int v31 = 4;
      int v32 = v3 % v31;
      uint v33 = simt_subgroup_id(__simt_tid);
      int v34 = (int)(v33);
      int v35;
      v35 = v34;
      switch (v32) {
        default:
          {
          v35 = v0;
          break;
        }
        case 0:
          {
          int v36 = 2;
          int v37 = v0 + v36;
          v35 = v37;
          break;
        }
        case 1:
          {
          v35 = v0;
          break;
        }
        case 2:
          {
          int v38 = 4;
          int v39 = v0 + v38;
          v35 = v39;
          break;
        }
      }
      int v40 = 0;
      v30 = v35;
    } else {
      int v41 = 4;
      v30 = v41;
    }
    int v42 = 3;
    int v43 = v0 + v42;
    v6 = v30;
  }
  bool v44 = true;
  int v45 = simt_wave_count_bits(v44);
  int v46 = 0;
  int v47 = v46 + v0;
  v1[v47] = v45;
  return;
}

kernel void kernel_main(device int* v48 [[buffer(0)]], device int* v49 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v50 = static_cast<int>(__simt_tid3.x);
  int v51 = 0;
  int v52 = v51 + v50;
  int v53 = v49[v52];
  int v54 = 4;
  int v55 = v54 + v50;
  int v56 = v49[v55];
  helper0(v50, v48, v53, v56, static_cast<int>(__simt_tid3.x));
  int v57 = 8;
  int v58 = v57 + v50;
  int v59 = v49[v58];
  int v60 = 0;
  bool v61 = v59 != v60;
  int v62;
  if (v61) {
    uint v63 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v64 = (int)(v63);
    v62 = v64;
  } else {
    int v65 = 12;
    int v66 = v65 + v50;
    int v67 = v49[v66];
    int v68;
    v68 = v50;
    switch (v67) {
      default:
        {
        int v69 = 0;
        int v70 = 0;
        int v71;
        int v72;
        v71 = v69;
        v72 = v70;
        while (true) {
          int v73 = 4;
          int v74 = v72 * v73;
          int v75 = v74 + v50;
          int v76 = 16;
          int v77 = v76 + v75;
          int v78 = v49[v77];
          int v79 = 0;
          bool v80 = v78 != v79;
          v71 = v71;
          v72 = v72;
          if (!v80) break;
          int v81 = v71 + v72;
          int v82 = 1;
          int v83 = v72 + v82;
          v71 = v81;
          v72 = v83;
          break;
          ;
        }
        bool v84 = true;
        v68 = v71;
        break;
      }
      case 0:
        {
        int v85 = 36;
        int v86 = v85 + v50;
        int v87 = v49[v86];
        int v88 = 0;
        bool v89 = v87 != v88;
        int v90;
        if (v89) {
          int v91 = 4;
          v90 = v91;
        } else {
          int v92 = 1;
          v90 = v92;
        }
        v68 = v90;
        break;
      }
    }
    bool v93 = true;
    v62 = v68;
  }
  int v94 = 16;
  int v95 = v94 + v50;
  bool v96 = true;
  int v97 = simt_wave_count_bits(v96);
  v48[v95] = v97;
  int v98 = 1;
  int v99 = v50 + v98;
  int v100 = 40;
  int v101 = v100 + v50;
  int v102 = v49[v101];
  int v103 = 0;
  bool v104 = v102 != v103;
  int v105;
  if (v104) {
    int v106 = 44;
    int v107 = v106 + v50;
    int v108 = v49[v107];
    int v109 = 0;
    bool v110 = v108 != v109;
    int v111;
    if (v110) {
      int v112 = 0;
      int v113 = 0;
      int v114;
      int v115;
      v114 = v112;
      v115 = v113;
      while (true) {
        int v116 = 4;
        int v117 = v115 * v116;
        int v118 = v117 + v50;
        int v119 = 48;
        int v120 = v119 + v118;
        int v121 = v49[v120];
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
      v111 = v114;
    } else {
      int v128 = 68;
      int v129 = v128 + v50;
      int v130 = v49[v129];
      int v131 = 0;
      bool v132 = v130 != v131;
      int v133;
      if (v132) {
        int v134 = 2;
        int v135 = v50 + v134;
        v133 = v135;
      } else {
        int v136 = 2;
        v133 = v136;
      }
      v111 = v133;
    }
    v105 = v111;
  } else {
    int v137 = 72;
    int v138 = v137 + v50;
    int v139 = v49[v138];
    int v140 = 0;
    bool v141 = v139 != v140;
    int v142;
    if (v141) {
      int v143 = 0;
      int v144 = 0;
      int v145;
      int v146;
      v145 = v143;
      v146 = v144;
      while (true) {
        int v147 = 4;
        int v148 = v146 * v147;
        int v149 = v148 + v50;
        int v150 = 76;
        int v151 = v150 + v149;
        int v152 = v49[v151];
        int v153 = 0;
        bool v154 = v152 != v153;
        v145 = v145;
        v146 = v146;
        if (!v154) break;
        int v155 = v145 + v146;
        int v156 = 1;
        int v157 = v146 + v156;
        v145 = v155;
        v146 = v157;
      }
      bool v158 = true;
      v142 = v145;
    } else {
      int v159 = 96;
      int v160 = v159 + v50;
      int v161 = v49[v160];
      int v162 = 0;
      bool v163 = v161 != v162;
      int v164;
      if (v163) {
        v164 = v50;
      } else {
        int v165 = 3;
        int v166 = v50 + v165;
        v164 = v166;
      }
      v142 = v164;
    }
    v105 = v142;
  }
  int v167 = 32;
  int v168 = v167 + v50;
  bool v169 = true;
  int v170 = simt_wave_count_bits(v169);
  v48[v168] = v170;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 100; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
