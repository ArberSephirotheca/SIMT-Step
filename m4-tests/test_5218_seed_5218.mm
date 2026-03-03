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
    bool v11 = true;
    int v12 = simt_wave_count_bits(v11);
    int v13 = 16;
    int v14 = v13 + v0;
    v1[v14] = v12;
    v6 = v12;
  }
  int v15 = 3;
  int v16 = v3 % v15;
  int v17 = 0;
  int v18 = v0 + v17;
  int v19;
  v19 = v18;
  switch (v16) {
    default:
      {
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
        int v30 = 0;
        int v31;
        int v32;
        v31 = v29;
        v32 = v30;
        while (true) {
          int v33 = 4;
          int v34 = v3 % v33;
          int v35 = 1;
          int v36 = v34 + v35;
          bool v37 = v32 < v36;
          v31 = v31;
          v32 = v32;
          if (!v37) break;
          int v38 = 4;
          int v39 = v0 + v38;
          int v40 = 1;
          int v41 = v32 + v40;
          v31 = v39;
          v32 = v41;
        }
        int v42 = 1;
        int v43 = v23 + v42;
        v22 = v31;
        v23 = v43;
      }
      v19 = v22;
      break;
    }
    case 0:
      {
      int v44 = 0;
      bool v45 = v2 != v44;
      int v46;
      if (v45) {
        int v47 = 0;
        int v48 = 0;
        int v49;
        int v50;
        v49 = v47;
        v50 = v48;
        while (true) {
          int v51 = 4;
          int v52 = v3 % v51;
          int v53 = 1;
          int v54 = v52 + v53;
          bool v55 = v50 < v54;
          v49 = v49;
          v50 = v50;
          if (!v55) break;
          int v56 = 1;
          int v57 = v50 + v56;
          v49 = v0;
          v50 = v57;
        }
        v46 = v49;
      } else {
        int v58 = 4;
        int v59 = v3 % v58;
        int v60 = 1;
        int v61;
        v61 = v60;
        switch (v59) {
          case 0:
            {
            int v62 = 4;
            int v63 = v0 + v62;
            v61 = v63;
            break;
          }
          case 1:
            {
            int v64 = 0;
            int v65 = v0 + v64;
            v61 = v65;
            break;
          }
          default:
            {
            v61 = v0;
            break;
          }
          case 2:
            {
            int v66 = 0;
            int v67 = v0 + v66;
            v61 = v67;
            break;
          }
        }
        v46 = v61;
      }
      v19 = v46;
      break;
    }
    case 1:
      {
      int v68 = 0;
      v19 = v68;
      break;
    }
    case 2:
      {
      int v69 = 4;
      int v70 = v3 % v69;
      int v71 = 4;
      int v72;
      v72 = v71;
      switch (v70) {
        case 0:
          {
          int v73 = 0;
          int v74 = 0;
          int v75;
          int v76;
          v75 = v73;
          v76 = v74;
          while (true) {
            int v77 = 4;
            int v78 = v3 % v77;
            int v79 = 1;
            int v80 = v78 + v79;
            bool v81 = v76 < v80;
            v75 = v75;
            v76 = v76;
            if (!v81) break;
            int v82 = 0;
            int v83 = v0 + v82;
            int v84 = 1;
            int v85 = v76 + v84;
            v75 = v83;
            v76 = v85;
          }
          v72 = v75;
        }
        default:
          {
          int v86 = 3;
          int v87 = v3 % v86;
          int v88 = 4;
          int v89 = v0 + v88;
          int v90;
          v90 = v89;
          switch (v87) {
            default:
              {
              int v91 = 3;
              v90 = v91;
              break;
            }
            case 0:
              {
              int v92 = 3;
              int v93 = v0 + v92;
              v90 = v93;
              break;
            }
            case 1:
              {
              v90 = v0;
            }
            case 2:
              {
              int v94 = 1;
              v90 = v94;
              break;
            }
          }
          v72 = v90;
        }
        case 1:
          {
          int v95 = 4;
          v72 = v95;
          break;
        }
        case 2:
          {
          int v96 = 0;
          bool v97 = v2 != v96;
          int v98;
          if (v97) {
            int v99 = 2;
            v98 = v99;
          } else {
            int v100 = 2;
            v98 = v100;
          }
          v72 = v98;
          break;
        }
      }
      int v101 = 0;
      v19 = v72;
      break;
    }
  }
  int v102 = 0;
  bool v103 = v2 != v102;
  int v104 = v103 ? v6 : v19;
  return;
}

kernel void kernel_main(device int* v105 [[buffer(0)]], device int* v106 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v107 = static_cast<int>(__simt_tid3.x);
  int v108 = 0;
  int v109 = v108 + v107;
  int v110 = v106[v109];
  int v111 = 4;
  int v112 = v111 + v107;
  int v113 = v106[v112];
  helper0(v107, v105, v110, v113, static_cast<int>(__simt_tid3.x));
  int v114 = 3;
  int v115 = v107 + v114;
  int v116 = 8;
  int v117 = v116 + v107;
  int v118 = v106[v117];
  int v119 = 0;
  bool v120 = v118 != v119;
  int v121;
  if (v120) {
    int v122 = 0;
    int v123 = 0;
    int v124;
    int v125;
    v124 = v122;
    v125 = v123;
    while (true) {
      int v126 = 4;
      int v127 = v125 * v126;
      int v128 = v127 + v107;
      int v129 = 12;
      int v130 = v129 + v128;
      int v131 = v106[v130];
      int v132 = 0;
      bool v133 = v131 != v132;
      v124 = v124;
      v125 = v125;
      if (!v133) break;
      int v134 = v124 + v125;
      int v135 = 1;
      int v136 = v125 + v135;
      bool v137 = true;
      int v138 = 32;
      int v139 = 4;
      int v140 = v125 * v139;
      int v141 = v138 + v140;
      int v142 = v141 + v107;
      bool v143 = true;
      int v144 = simt_wave_count_bits(v143);
      v105[v142] = v144;
      v124 = v134;
      v125 = v136;
    }
    v121 = v124;
  } else {
    int v145 = 32;
    int v146 = v145 + v107;
    int v147 = v106[v146];
    uint v148 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v149 = (int)(v148);
    int v150;
    v150 = v149;
    switch (v147) {
      case 0:
        {
        int v151 = 0;
        int v152 = v107 + v151;
        v150 = v152;
      }
      default:
        {
        int v153 = 36;
        int v154 = v153 + v107;
        int v155 = v106[v154];
        int v156 = 3;
        int v157 = v107 + v156;
        int v158;
        v158 = v157;
        switch (v155) {
          case 0:
            {
            int v159 = 4;
            int v160 = v107 + v159;
            v158 = v160;
            break;
          }
          default:
            {
            v158 = v107;
            break;
          }
          case 1:
            {
            int v161 = 2;
            v158 = v161;
            break;
          }
          case 2:
            {
            int v162 = 3;
            int v163 = v107 + v162;
            v158 = v163;
            break;
          }
        }
        v150 = v158;
        break;
      }
      case 1:
        {
        int v164 = 40;
        int v165 = v164 + v107;
        int v166 = v106[v165];
        int v167 = 1;
        int v168;
        v168 = v167;
        switch (v166) {
          case 0:
            {
            int v169 = 4;
            v168 = v169;
            break;
          }
          default:
            {
            v168 = v107;
            break;
          }
        }
        bool v170 = true;
        v150 = v168;
        break;
      }
      case 2:
        {
        int v171 = 44;
        int v172 = v171 + v107;
        int v173 = v106[v172];
        int v174 = 0;
        bool v175 = v173 != v174;
        int v176;
        if (v175) {
          v176 = v107;
        } else {
          int v177 = 2;
          int v178 = v107 + v177;
          v176 = v178;
        }
        v150 = v176;
        break;
      }
    }
    v121 = v150;
  }
  int v179 = 48;
  int v180 = v179 + v107;
  bool v181 = true;
  int v182 = simt_wave_count_bits(v181);
  v105[v180] = v182;
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 52; ++idx) {
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
