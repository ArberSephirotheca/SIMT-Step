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
    int v9 = 1;
    int v10 = v0 + v9;
    int v11;
    v11 = v10;
    switch (v8) {
      default:
        {
        int v12 = 3;
        int v13 = v3 % v12;
        int v14;
        v14 = v0;
        switch (v13) {
          case 0:
            {
            int v15 = 2;
            int v16 = v0 + v15;
            v14 = v16;
          }
          default:
            {
            int v17 = 0;
            int v18 = v0 + v17;
            v14 = v18;
            break;
          }
          case 1:
            {
            v14 = v0;
            break;
          }
          case 2:
            {
            int v19 = 3;
            v14 = v19;
            break;
          }
        }
        v11 = v14;
        break;
      }
      case 0:
        {
        int v20 = 0;
        bool v21 = v2 != v20;
        int v22;
        if (v21) {
          v22 = v0;
        } else {
          v22 = v0;
        }
        v11 = v22;
        break;
      }
    }
    bool v23 = true;
    int v24 = simt_wave_count_bits(v23);
    int v25 = 0;
    int v26 = v25 + v0;
    v1[v26] = v24;
    v6 = v11;
  } else {
    int v27 = 0;
    bool v28 = v2 != v27;
    int v29;
    if (v28) {
      int v30 = 0;
      int v31 = 0;
      int v32;
      int v33;
      v32 = v30;
      v33 = v31;
      while (true) {
        int v34 = 4;
        int v35 = v3 % v34;
        int v36 = 1;
        int v37 = v35 + v36;
        bool v38 = v33 < v37;
        v32 = v32;
        v33 = v33;
        if (!v38) break;
        bool v39 = true;
        int v40 = simt_wave_count_bits(v39);
        int v41 = 16;
        int v42 = 4;
        int v43 = v33 * v42;
        int v44 = v41 + v43;
        int v45 = v44 + v0;
        v1[v45] = v40;
        int v46 = 1;
        int v47 = v33 + v46;
        v32 = v40;
        v33 = v47;
        break;
        ;
      }
      v29 = v32;
    } else {
      bool v48 = true;
      int v49 = simt_wave_count_bits(v48);
      int v50 = 32;
      int v51 = v50 + v0;
      v1[v51] = v49;
      v29 = v49;
    }
    v6 = v29;
  }
  return;
}

kernel void kernel_main(device int* v52 [[buffer(0)]], device int* v53 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v54 = static_cast<int>(__simt_tid3.x);
  int v55 = 0;
  int v56 = v55 + v54;
  int v57 = v53[v56];
  int v58 = 4;
  int v59 = v58 + v54;
  int v60 = v53[v59];
  int v61 = 0;
  bool v62 = v57 != v61;
  if (v62) {
    int v63 = 8;
    int v64 = v63 + v54;
    int v65 = v53[v64];
    int v66 = 0;
    bool v67 = v65 != v66;
    if (v67) {
    } else {
      int v68;
      v68 = v54;
      switch (v54) {
        case 0:
          {
          int v69 = 2;
          int v70 = v68 + v69;
          v68 = v70;
          break;
        }
        default:
          {
          int v71 = 2;
          int v72 = v68 + v71;
          v68 = v72;
          break;
        }
      }
      helper0(v54, v52, v57, v60, static_cast<int>(__simt_tid3.x));
    }
  } else {
  }
  int v73 = 12;
  int v74 = v73 + v54;
  int v75 = v53[v74];
  int v76 = 0;
  int v77;
  v77 = v76;
  switch (v75) {
    case 0:
      {
      int v78 = 16;
      int v79 = v78 + v54;
      int v80 = v53[v79];
      int v81 = 0;
      bool v82 = v80 != v81;
      int v83;
      if (v82) {
        int v84 = 20;
        int v85 = v84 + v54;
        int v86 = v53[v85];
        int v87 = 0;
        bool v88 = v86 != v87;
        int v89;
        if (v88) {
          v89 = v54;
        } else {
          v89 = v54;
        }
        v83 = v89;
      } else {
        int v90 = 24;
        int v91 = v90 + v54;
        int v92 = v53[v91];
        int v93 = 0;
        bool v94 = v92 != v93;
        int v95;
        if (v94) {
          int v96 = 2;
          int v97 = v54 + v96;
          v95 = v97;
        } else {
          int v98 = 3;
          v95 = v98;
        }
        v83 = v95;
      }
      v77 = v83;
      break;
    }
    default:
      {
      int v99 = 0;
      int v100 = 0;
      int v101;
      int v102;
      v101 = v99;
      v102 = v100;
      while (true) {
        int v103 = 4;
        int v104 = v102 * v103;
        int v105 = v104 + v54;
        int v106 = 28;
        int v107 = v106 + v105;
        int v108 = v53[v107];
        int v109 = 0;
        bool v110 = v108 != v109;
        v101 = v101;
        v102 = v102;
        if (!v110) break;
        int v111 = 48;
        int v112 = v111 + v54;
        int v113 = v53[v112];
        int v114 = 0;
        bool v115 = v113 != v114;
        int v116;
        if (v115) {
          v116 = v54;
        } else {
          int v117 = 0;
          v116 = v117;
        }
        int v118 = v101 + v116;
        int v119 = 1;
        int v120 = v102 + v119;
        bool v121 = true;
        v101 = v118;
        v102 = v120;
      }
      v77 = v101;
      break;
    }
  }
  int v122 = 52;
  int v123 = v122 + v54;
  int v124 = v53[v123];
  int v125 = 2;
  int v126;
  v126 = v125;
  switch (v124) {
    case 0:
      {
      int v127 = 56;
      int v128 = v127 + v54;
      int v129 = v53[v128];
      int v130 = 0;
      bool v131 = v129 != v130;
      int v132;
      if (v131) {
        int v133 = 60;
        int v134 = v133 + v54;
        int v135 = v53[v134];
        int v136 = 0;
        bool v137 = v135 != v136;
        int v138;
        if (v137) {
          int v139 = 2;
          int v140 = v54 + v139;
          v138 = v140;
        } else {
          int v141 = 0;
          int v142 = v54 + v141;
          v138 = v142;
        }
        v132 = v138;
      } else {
        int v143 = 3;
        v132 = v143;
      }
      v126 = v132;
      break;
    }
    default:
      {
      int v144 = 64;
      int v145 = v144 + v54;
      int v146 = v53[v145];
      int v147 = 0;
      bool v148 = v146 != v147;
      int v149;
      if (v148) {
        v149 = v54;
      } else {
        int v150 = 3;
        v149 = v150;
      }
      v126 = v149;
      break;
    }
    case 1:
      {
      int v151 = 68;
      int v152 = v151 + v54;
      int v153 = v53[v152];
      int v154 = 0;
      bool v155 = v153 != v154;
      int v156;
      if (v155) {
        int v157 = 72;
        int v158 = v157 + v54;
        int v159 = v53[v158];
        int v160 = 0;
        bool v161 = v159 != v160;
        int v162;
        if (v161) {
          int v163 = 2;
          int v164 = v54 + v163;
          v162 = v164;
        } else {
          int v165 = 4;
          v162 = v165;
        }
        v156 = v162;
      } else {
        int v166 = 1;
        int v167 = v54 + v166;
        v156 = v167;
      }
      v126 = v156;
      break;
    }
    case 2:
      {
      int v168 = 0;
      int v169 = 0;
      int v170;
      int v171;
      v170 = v168;
      v171 = v169;
      while (true) {
        int v172 = 4;
        int v173 = v171 * v172;
        int v174 = v173 + v54;
        int v175 = 76;
        int v176 = v175 + v174;
        int v177 = v53[v176];
        int v178 = 0;
        bool v179 = v177 != v178;
        v170 = v170;
        v171 = v171;
        if (!v179) break;
        int v180 = v170 + v171;
        int v181 = 1;
        int v182 = v171 + v181;
        bool v183 = true;
        v170 = v180;
        v171 = v182;
      }
      v126 = v170;
      break;
    }
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
    static int32_t expected0[] = {};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 0; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 96; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
