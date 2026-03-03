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
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 0;
      int v10 = 0;
      int v11;
      int v12;
      v11 = v9;
      v12 = v10;
      while (true) {
        int v13 = 4;
        int v14 = v3 % v13;
        int v15 = 1;
        int v16 = v14 + v15;
        bool v17 = v12 < v16;
        v11 = v11;
        v12 = v12;
        if (!v17) break;
        int v18 = 3;
        int v19 = v3 % v18;
        int v20 = 0;
        int v21 = v0 + v20;
        int v22;
        v22 = v21;
        switch (v19) {
          default:
            {
            int v23 = 0;
            v22 = v23;
          }
          case 0:
            {
            int v24 = 4;
            v22 = v24;
            break;
          }
          case 1:
            {
            v22 = v0;
            break;
          }
          case 2:
            {
            int v25 = 0;
            v22 = v25;
            break;
          }
        }
        int v26 = 0;
        int v27 = v0 + v26;
        int v28 = 1;
        int v29 = v12 + v28;
        v11 = v22;
        v12 = v29;
        break;
        ;
      }
      v8 = v11;
      break;
    }
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
          int v34 = v3 % v33;
          int v35 = 0;
          int v36;
          v36 = v35;
          switch (v34) {
            case 0:
              {
              int v37 = 2;
              v36 = v37;
              break;
            }
            default:
              {
              int v38 = 2;
              v36 = v38;
            }
            case 1:
              {
              int v39 = 1;
              v36 = v39;
            }
            case 2:
              {
              v36 = v0;
              break;
            }
          }
          v32 = v36;
        }
        case 0:
          {
          int v40 = 0;
          int v41 = 0;
          int v42;
          int v43;
          v42 = v40;
          v43 = v41;
          while (true) {
            int v44 = 4;
            int v45 = v3 % v44;
            int v46 = 1;
            int v47 = v45 + v46;
            bool v48 = v43 < v47;
            v42 = v42;
            v43 = v43;
            if (!v48) break;
            int v49 = 3;
            int v50 = 1;
            int v51 = v43 + v50;
            v42 = v49;
            v43 = v51;
          }
          int v52 = 3;
          v32 = v42;
        }
        case 1:
          {
          int v53 = 4;
          int v54 = v3 % v53;
          int v55;
          v55 = v0;
          switch (v54) {
            default:
              {
              v55 = v0;
              break;
            }
            case 0:
              {
              int v56 = 1;
              int v57 = v0 + v56;
              v55 = v57;
              break;
            }
            case 1:
              {
              int v58 = 1;
              int v59 = v0 + v58;
              v55 = v59;
              break;
            }
            case 2:
              {
              int v60 = 3;
              v55 = v60;
              break;
            }
          }
          int v61 = 3;
          v32 = v55;
          break;
        }
      }
      int v62 = 2;
      int v63 = v0 + v62;
      v8 = v32;
      break;
    }
    case 1:
      {
      int v64 = 4;
      int v65 = v3 % v64;
      int v66 = 3;
      int v67 = v0 + v66;
      int v68;
      v68 = v67;
      switch (v65) {
        case 0:
          {
          int v69 = 2;
          int v70 = v3 % v69;
          int v71 = 4;
          int v72;
          v72 = v71;
          switch (v70) {
            case 0:
              {
              int v73 = 4;
              int v74 = v0 + v73;
              v72 = v74;
              break;
            }
            default:
              {
              int v75 = 3;
              v72 = v75;
              break;
            }
          }
          int v76 = 3;
          v68 = v72;
          break;
        }
        case 1:
          {
          int v77 = 0;
          int v78 = 0;
          int v79;
          int v80;
          v79 = v77;
          v80 = v78;
          while (true) {
            int v81 = 4;
            int v82 = v3 % v81;
            int v83 = 1;
            int v84 = v82 + v83;
            bool v85 = v80 < v84;
            v79 = v79;
            v80 = v80;
            if (!v85) break;
            int v86 = 2;
            int v87 = v0 + v86;
            int v88 = 1;
            int v89 = v80 + v88;
            v79 = v87;
            v80 = v89;
          }
          int v90 = 0;
          int v91 = v0 + v90;
          v68 = v79;
          break;
        }
        case 2:
          {
          int v92 = 0;
          bool v93 = v2 != v92;
          int v94;
          if (v93) {
            int v95 = 2;
            int v96 = v0 + v95;
            v94 = v96;
          } else {
            int v97 = 0;
            int v98 = v0 + v97;
            v94 = v98;
          }
          int v99 = 1;
          v68 = v94;
          break;
        }
        default:
          {
          int v100 = 0;
          bool v101 = v2 != v100;
          int v102;
          if (v101) {
            v102 = v0;
          } else {
            int v103 = 2;
            v102 = v103;
          }
          int v104 = 1;
          v68 = v102;
          break;
        }
      }
      v8 = v68;
      break;
    }
    case 2:
      {
      int v105 = 2;
      int v106 = v3 % v105;
      int v107 = 0;
      int v108 = v0 + v107;
      int v109;
      v109 = v108;
      switch (v106) {
        default:
          {
          int v110 = 4;
          int v111 = v0 + v110;
          v109 = v111;
          break;
        }
        case 0:
          {
          v109 = v0;
          break;
        }
      }
      v8 = v109;
      break;
    }
  }
  bool v112 = true;
  int v113 = simt_wave_count_bits(v112);
  int v114 = 0;
  int v115 = v114 + v0;
  v1[v115] = v113;
  return;
}

kernel void kernel_main(device int* v116 [[buffer(0)]], device int* v117 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v118 = static_cast<int>(__simt_tid3.x);
  int v119 = 0;
  int v120 = v119 + v118;
  int v121 = v117[v120];
  int v122 = 4;
  int v123 = v122 + v118;
  int v124 = v117[v123];
  helper0(v118, v116, v121, v124, static_cast<int>(__simt_tid3.x));
  int v125 = 0;
  int v126 = 0;
  int v127;
  int v128;
  v127 = v125;
  v128 = v126;
  while (true) {
    int v129 = 4;
    int v130 = v128 * v129;
    int v131 = v130 + v118;
    int v132 = 8;
    int v133 = v132 + v131;
    int v134 = v117[v133];
    int v135 = 0;
    bool v136 = v134 != v135;
    v127 = v127;
    v128 = v128;
    if (!v136) break;
    int v137 = v127 + v128;
    int v138 = 1;
    int v139 = v128 + v138;
    v127 = v137;
    v128 = v139;
    break;
    ;
  }
  bool v140 = true;
  int v141 = 16;
  int v142 = v141 + v118;
  bool v143 = true;
  int v144 = simt_wave_count_bits(v143);
  v116[v142] = v144;
  uint v145 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v146 = (int)(v145);
  int v147 = 28;
  int v148 = v147 + v118;
  int v149 = v117[v148];
  int v150 = 0;
  bool v151 = v149 != v150;
  int v152;
  if (v151) {
    int v153 = 32;
    int v154 = v153 + v118;
    int v155 = v117[v154];
    int v156 = 0;
    bool v157 = v155 != v156;
    int v158;
    if (v157) {
      int v159 = 36;
      int v160 = v159 + v118;
      int v161 = v117[v160];
      int v162 = 0;
      bool v163 = v161 != v162;
      int v164;
      if (v163) {
        int v165 = 3;
        int v166 = v118 + v165;
        v164 = v166;
      } else {
        int v167 = 2;
        int v168 = v118 + v167;
        v164 = v168;
      }
      v158 = v164;
    } else {
      int v169 = 40;
      int v170 = v169 + v118;
      int v171 = v117[v170];
      int v172 = 0;
      bool v173 = v171 != v172;
      int v174;
      if (v173) {
        int v175 = 3;
        v174 = v175;
      } else {
        int v176 = 1;
        v174 = v176;
      }
      v158 = v174;
    }
    v152 = v158;
  } else {
    int v177 = 44;
    int v178 = v177 + v118;
    int v179 = v117[v178];
    int v180 = 0;
    bool v181 = v179 != v180;
    int v182;
    if (v181) {
      uint v183 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v184 = (int)(v183);
      v182 = v184;
    } else {
      int v185 = 0;
      int v186 = 0;
      int v187;
      int v188;
      v187 = v185;
      v188 = v186;
      while (true) {
        int v189 = 4;
        int v190 = v188 * v189;
        int v191 = v190 + v118;
        int v192 = 48;
        int v193 = v192 + v191;
        int v194 = v117[v193];
        int v195 = 0;
        bool v196 = v194 != v195;
        v187 = v187;
        v188 = v188;
        if (!v196) break;
        int v197 = v187 + v188;
        int v198 = 1;
        int v199 = v188 + v198;
        v187 = v197;
        v188 = v199;
      }
      bool v200 = true;
      v182 = v187;
    }
    v152 = v182;
  }
  int v201 = 32;
  int v202 = v201 + v118;
  bool v203 = true;
  int v204 = simt_wave_count_bits(v203);
  v116[v202] = v204;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
