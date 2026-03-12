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
  int v5 = v3 % v4;
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 3;
      int v10 = v3 % v9;
      int v11 = 2;
      int v12;
      v12 = v11;
      switch (v10) {
        case 0:
          {
          int v13 = 0;
          bool v14 = v2 != v13;
          int v15;
          if (v14) {
            int v16 = 1;
            int v17 = v0 + v16;
            v15 = v17;
          } else {
            int v18 = 3;
            int v19 = v0 + v18;
            v15 = v19;
          }
          v12 = v15;
        }
        case 1:
          {
          int v20 = 2;
          int v21 = v3 % v20;
          int v22 = 4;
          int v23;
          v23 = v22;
          switch (v21) {
            case 0:
              {
              int v24 = 1;
              int v25 = v0 + v24;
              v23 = v25;
              break;
            }
            default:
              {
              int v26 = 1;
              int v27 = v0 + v26;
              v23 = v27;
              break;
            }
            case 1:
              {
              int v28 = 0;
              int v29 = v0 + v28;
              v23 = v29;
              break;
            }
          }
          v12 = v23;
          break;
        }
        case 2:
          {
          int v30 = 2;
          int v31 = v0 + v30;
          v12 = v31;
          break;
        }
        default:
          {
          int v32 = 0;
          bool v33 = v2 != v32;
          int v34;
          if (v33) {
            v34 = v0;
          } else {
            int v35 = 4;
            v34 = v35;
          }
          v12 = v34;
          break;
        }
      }
      int v36 = 2;
      int v37 = v0 + v36;
      v8 = v12;
      break;
    }
    default:
      {
      int v38 = 3;
      int v39 = v3 % v38;
      int v40;
      v40 = v0;
      switch (v39) {
        default:
          {
          int v41 = 0;
          bool v42 = v2 != v41;
          int v43;
          if (v42) {
            v43 = v0;
          } else {
            int v44 = 1;
            int v45 = v0 + v44;
            v43 = v45;
          }
          v40 = v43;
          break;
        }
        case 0:
          {
          int v46 = 3;
          int v47 = v3 % v46;
          int v48;
          v48 = v0;
          switch (v47) {
            default:
              {
              int v49 = 3;
              int v50 = v0 + v49;
              v48 = v50;
              break;
            }
            case 0:
              {
              v48 = v0;
              break;
            }
            case 1:
              {
              int v51 = 2;
              int v52 = v0 + v51;
              v48 = v52;
              break;
            }
            case 2:
              {
              v48 = v0;
              break;
            }
          }
          v40 = v48;
          break;
        }
        case 1:
          {
          int v53 = 0;
          int v54 = 0;
          int v55;
          int v56;
          v55 = v53;
          v56 = v54;
          while (true) {
            int v57 = 4;
            int v58 = v3 % v57;
            int v59 = 1;
            int v60 = v58 + v59;
            bool v61 = v56 < v60;
            v55 = v55;
            v56 = v56;
            if (!v61) break;
            int v62 = 1;
            int v63 = 1;
            int v64 = v56 + v63;
            v55 = v62;
            v56 = v64;
          }
          v40 = v55;
          break;
        }
        case 2:
          {
          int v65 = 0;
          bool v66 = v2 != v65;
          int v67;
          if (v66) {
            v67 = v0;
          } else {
            int v68 = 1;
            v67 = v68;
          }
          v40 = v67;
          break;
        }
      }
      v8 = v40;
      break;
    }
    case 1:
      {
      int v69 = 0;
      int v70 = 0;
      int v71;
      int v72;
      v71 = v69;
      v72 = v70;
      while (true) {
        int v73 = 4;
        int v74 = v3 % v73;
        int v75 = 1;
        int v76 = v74 + v75;
        bool v77 = v72 < v76;
        v71 = v71;
        v72 = v72;
        if (!v77) break;
        int v78 = 4;
        int v79 = v0 + v78;
        int v80;
        v80 = v79;
        switch (v3) {
          default:
            {
            v80 = v0;
          }
          case 0:
            {
            int v81 = 0;
            int v82 = v0 + v81;
            v80 = v82;
            break;
          }
        }
        int v83 = 1;
        int v84 = v72 + v83;
        v71 = v80;
        v72 = v84;
      }
      v8 = v71;
      break;
    }
    case 2:
      {
      int v85 = 0;
      int v86 = 0;
      int v87;
      int v88;
      v87 = v85;
      v88 = v86;
      while (true) {
        int v89 = 4;
        int v90 = v3 % v89;
        int v91 = 1;
        int v92 = v90 + v91;
        bool v93 = v88 < v92;
        v87 = v87;
        v88 = v88;
        if (!v93) break;
        int v94 = 0;
        bool v95 = v2 != v94;
        int v96;
        if (v95) {
          v96 = v0;
        } else {
          v96 = v0;
        }
        int v97 = 1;
        int v98 = v88 + v97;
        v87 = v96;
        v88 = v98;
        break;
        ;
      }
      v8 = v87;
      break;
    }
  }
  bool v99 = true;
  int v100 = simt_wave_count_bits(v99);
  int v101 = 0;
  int v102 = v101 + v0;
  v1[v102] = v100;
  return;
}

kernel void kernel_main(device int* v103 [[buffer(0)]], device int* v104 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v105 = static_cast<int>(__simt_tid3.x);
  int v106 = 0;
  int v107 = v106 + v105;
  int v108 = v104[v107];
  int v109 = 4;
  int v110 = v109 + v105;
  int v111 = v104[v110];
  int v112 = 0;
  bool v113 = v108 != v112;
  if (v113) {
    int v114 = 0;
    int v115 = 0;
    int v116;
    int v117;
    v116 = v114;
    v117 = v115;
    while (true) {
      int v118 = 2;
      bool v119 = v117 < v118;
      v116 = v116;
      v117 = v117;
      if (!v119) break;
      helper0(v105, v103, v108, v111, static_cast<int>(__simt_tid3.x));
      int v120 = 1;
      int v121 = v117 + v120;
      v116 = v116;
      v117 = v121;
    }
  } else {
  }
  int v122 = 8;
  int v123 = v122 + v105;
  int v124 = v104[v123];
  int v125 = 0;
  bool v126 = v124 != v125;
  int v127;
  if (v126) {
    int v128 = 12;
    int v129 = v128 + v105;
    int v130 = v104[v129];
    uint v131 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v132 = (int)(v131);
    int v133;
    v133 = v132;
    switch (v130) {
      case 0:
        {
        int v134 = 16;
        int v135 = v134 + v105;
        int v136 = v104[v135];
        int v137 = 0;
        bool v138 = v136 != v137;
        int v139;
        if (v138) {
          v139 = v105;
        } else {
          int v140 = 0;
          int v141 = v105 + v140;
          v139 = v141;
        }
        v133 = v139;
      }
      case 1:
        {
        int v142 = 20;
        int v143 = v142 + v105;
        int v144 = v104[v143];
        int v145 = 0;
        bool v146 = v144 != v145;
        int v147;
        if (v146) {
          int v148 = 1;
          int v149 = v105 + v148;
          v147 = v149;
        } else {
          int v150 = 3;
          int v151 = v105 + v150;
          v147 = v151;
        }
        v133 = v147;
        break;
      }
      case 2:
        {
        int v152 = 24;
        int v153 = v152 + v105;
        int v154 = v104[v153];
        int v155 = 1;
        int v156;
        v156 = v155;
        switch (v154) {
          default:
            {
            int v157 = 0;
            v156 = v157;
            break;
          }
          case 0:
            {
            v156 = v105;
            break;
          }
          case 1:
            {
            int v158 = 3;
            v156 = v158;
            break;
          }
        }
        bool v159 = true;
        v133 = v156;
      }
      default:
        {
        int v160 = 28;
        int v161 = v160 + v105;
        int v162 = v104[v161];
        int v163 = 2;
        int v164 = v105 + v163;
        int v165;
        v165 = v164;
        switch (v162) {
          default:
            {
            v165 = v105;
            break;
          }
          case 0:
            {
            v165 = v105;
            break;
          }
          case 1:
            {
            int v166 = 0;
            int v167 = v105 + v166;
            v165 = v167;
            break;
          }
          case 2:
            {
            int v168 = 4;
            v165 = v168;
            break;
          }
        }
        v133 = v165;
        break;
      }
    }
    bool v169 = true;
    int v170 = 16;
    int v171 = v170 + v105;
    bool v172 = true;
    int v173 = simt_wave_count_bits(v172);
    v103[v171] = v173;
    v127 = v133;
  } else {
    int v174 = 0;
    int v175 = 0;
    int v176;
    int v177;
    v176 = v174;
    v177 = v175;
    while (true) {
      int v178 = 4;
      int v179 = v177 * v178;
      int v180 = v179 + v105;
      int v181 = 32;
      int v182 = v181 + v180;
      int v183 = v104[v182];
      int v184 = 0;
      bool v185 = v183 != v184;
      v176 = v176;
      v177 = v177;
      if (!v185) break;
      int v186 = v176 + v177;
      int v187 = 1;
      int v188 = v177 + v187;
      bool v189 = true;
      int v190 = 32;
      int v191 = 4;
      int v192 = v177 * v191;
      int v193 = v190 + v192;
      int v194 = v193 + v105;
      bool v195 = true;
      int v196 = simt_wave_count_bits(v195);
      v103[v194] = v196;
      v176 = v186;
      v177 = v188;
    }
    v127 = v176;
  }
  int v197 = 48;
  int v198 = v197 + v105;
  bool v199 = true;
  int v200 = simt_wave_count_bits(v199);
  v103[v198] = v200;
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 52; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
