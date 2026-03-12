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
    bool v7 = true;
    int v8 = simt_wave_count_bits(v7);
    int v9 = 0;
    int v10 = v9 + v0;
    v1[v10] = v8;
    v6 = v8;
  } else {
    int v11 = 0;
    bool v12 = v2 != v11;
    int v13;
    if (v12) {
      uint v14 = simt_subgroup_id(__simt_tid);
      int v15 = (int)(v14);
      int v16;
      v16 = v15;
      switch (v3) {
        case 0:
          {
          v16 = v0;
          break;
        }
        default:
          {
          int v17 = 1;
          int v18 = v0 + v17;
          v16 = v18;
          break;
        }
      }
      bool v19 = true;
      int v20 = simt_wave_count_bits(v19);
      int v21 = 16;
      int v22 = v21 + v0;
      v1[v22] = v20;
      v13 = v16;
    } else {
      int v23 = 0;
      bool v24 = v2 != v23;
      int v25;
      if (v24) {
        bool v26 = true;
        int v27 = simt_wave_count_bits(v26);
        int v28 = 32;
        int v29 = v28 + v0;
        v1[v29] = v27;
        v25 = v27;
      } else {
        bool v30 = true;
        int v31 = simt_wave_count_bits(v30);
        int v32 = 48;
        int v33 = v32 + v0;
        v1[v33] = v31;
        v25 = v31;
      }
      v13 = v25;
    }
    v6 = v13;
  }
  return;
}

kernel void kernel_main(device int* v34 [[buffer(0)]], device int* v35 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v36 = static_cast<int>(__simt_tid3.x);
  int v37 = 0;
  int v38 = v37 + v36;
  int v39 = v35[v38];
  int v40 = 4;
  int v41 = v40 + v36;
  int v42 = v35[v41];
  int v43 = 0;
  bool v44 = v39 != v43;
  if (v44) {
    int v45 = 8;
    int v46 = v45 + v36;
    int v47 = v35[v46];
    int v48 = 0;
    bool v49 = v47 != v48;
    if (v49) {
      int v50 = 3;
      int v51 = v36 % v50;
      int v52;
      v52 = v36;
      switch (v51) {
        case 0:
          {
          int v53 = 3;
          int v54 = v52 + v53;
          v52 = v54;
          break;
        }
        case 1:
          {
          int v55 = 4;
          int v56 = v52 + v55;
          v52 = v56;
          break;
        }
        default:
          {
          int v57 = 2;
          int v58 = v52 + v57;
          v52 = v58;
          break;
        }
      }
      helper0(v36, v34, v39, v42, static_cast<int>(__simt_tid3.x));
    } else {
    }
  } else {
  }
  int v59 = 2;
  int v60 = v36 + v59;
  int v61 = 12;
  int v62 = v61 + v36;
  int v63 = v35[v62];
  int v64 = 3;
  int v65 = v36 + v64;
  int v66;
  v66 = v65;
  switch (v63) {
    default:
      {
      int v67 = 16;
      int v68 = v67 + v36;
      int v69 = v35[v68];
      int v70 = 1;
      int v71 = v36 + v70;
      int v72;
      v72 = v71;
      switch (v69) {
        case 0:
          {
          int v73 = 20;
          int v74 = v73 + v36;
          int v75 = v35[v74];
          int v76 = 0;
          bool v77 = v75 != v76;
          int v78;
          if (v77) {
            int v79 = 0;
            int v80 = v36 + v79;
            v78 = v80;
          } else {
            int v81 = 3;
            int v82 = v36 + v81;
            v78 = v82;
          }
          v72 = v78;
          break;
        }
        default:
          {
          int v83 = 0;
          v72 = v83;
          break;
        }
      }
      v66 = v72;
      break;
    }
    case 0:
      {
      int v84 = 0;
      int v85 = 0;
      int v86;
      int v87;
      v86 = v84;
      v87 = v85;
      while (true) {
        int v88 = 4;
        int v89 = v87 * v88;
        int v90 = v89 + v36;
        int v91 = 24;
        int v92 = v91 + v90;
        int v93 = v35[v92];
        int v94 = 0;
        bool v95 = v93 != v94;
        v86 = v86;
        v87 = v87;
        if (!v95) break;
        int v96 = 44;
        int v97 = v96 + v36;
        int v98 = v35[v97];
        int v99 = 3;
        int v100 = v36 + v99;
        int v101;
        v101 = v100;
        switch (v98) {
          case 0:
            {
            int v102 = 2;
            int v103 = v36 + v102;
            v101 = v103;
            break;
          }
          default:
            {
            v101 = v36;
            break;
          }
        }
        int v104 = v86 + v101;
        int v105 = 1;
        int v106 = v87 + v105;
        bool v107 = true;
        v86 = v104;
        v87 = v106;
      }
      v66 = v86;
      break;
    }
    case 1:
      {
      int v108 = 48;
      int v109 = v108 + v36;
      int v110 = v35[v109];
      int v111;
      v111 = v36;
      switch (v110) {
        case 0:
          {
          int v112 = 52;
          int v113 = v112 + v36;
          int v114 = v35[v113];
          int v115 = 0;
          bool v116 = v114 != v115;
          int v117;
          if (v116) {
            int v118 = 4;
            int v119 = v36 + v118;
            v117 = v119;
          } else {
            v117 = v36;
          }
          v111 = v117;
          break;
        }
        case 1:
          {
          int v120 = 56;
          int v121 = v120 + v36;
          int v122 = v35[v121];
          int v123 = 0;
          bool v124 = v122 != v123;
          int v125;
          if (v124) {
            int v126 = 3;
            int v127 = v36 + v126;
            v125 = v127;
          } else {
            int v128 = 3;
            int v129 = v36 + v128;
            v125 = v129;
          }
          v111 = v125;
          break;
        }
        default:
          {
          int v130 = 60;
          int v131 = v130 + v36;
          int v132 = v35[v131];
          int v133 = 0;
          bool v134 = v132 != v133;
          int v135;
          if (v134) {
            int v136 = 3;
            int v137 = v36 + v136;
            v135 = v137;
          } else {
            v135 = v36;
          }
          v111 = v135;
          break;
        }
        case 2:
          {
          int v138 = 0;
          int v139 = 0;
          int v140;
          int v141;
          v140 = v138;
          v141 = v139;
          while (true) {
            int v142 = 4;
            int v143 = v141 * v142;
            int v144 = v143 + v36;
            int v145 = 64;
            int v146 = v145 + v144;
            int v147 = v35[v146];
            int v148 = 0;
            bool v149 = v147 != v148;
            v140 = v140;
            v141 = v141;
            if (!v149) break;
            int v150 = v140 + v141;
            int v151 = 1;
            int v152 = v141 + v151;
            bool v153 = true;
            v140 = v150;
            v141 = v152;
          }
          v111 = v140;
          break;
        }
      }
      v66 = v111;
      break;
    }
    case 2:
      {
      int v154 = 84;
      int v155 = v154 + v36;
      int v156 = v35[v155];
      int v157 = 0;
      bool v158 = v156 != v157;
      int v159;
      if (v158) {
        int v160 = 88;
        int v161 = v160 + v36;
        int v162 = v35[v161];
        int v163 = 0;
        bool v164 = v162 != v163;
        int v165;
        if (v164) {
          v165 = v36;
        } else {
          int v166 = 4;
          int v167 = v36 + v166;
          v165 = v167;
        }
        v159 = v165;
      } else {
        int v168 = 3;
        v159 = v168;
      }
      v66 = v159;
      break;
    }
  }
  bool v169 = true;
  int v170 = 64;
  int v171 = v170 + v36;
  bool v172 = true;
  int v173 = simt_wave_count_bits(v172);
  v34[v171] = v173;
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
    static int32_t expected0[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 92; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
