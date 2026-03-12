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
  int v4 = 2;
  int v5 = v3 % v4;
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    default:
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
        int v18 = 0;
        int v19 = 0;
        int v20;
        int v21;
        v20 = v18;
        v21 = v19;
        while (true) {
          int v22 = 4;
          int v23 = v3 % v22;
          int v24 = 1;
          int v25 = v23 + v24;
          bool v26 = v21 < v25;
          v20 = v20;
          v21 = v21;
          if (!v26) break;
          int v27 = 1;
          int v28 = v21 + v27;
          v20 = v0;
          v21 = v28;
        }
        int v29 = 2;
        int v30 = v0 + v29;
        int v31 = 1;
        int v32 = v12 + v31;
        v11 = v20;
        v12 = v32;
      }
      int v33 = 2;
      v8 = v11;
      break;
    }
    case 0:
      {
      int v34 = 0;
      bool v35 = v2 != v34;
      int v36;
      if (v35) {
        int v37 = 0;
        int v38 = 0;
        int v39;
        int v40;
        v39 = v37;
        v40 = v38;
        while (true) {
          int v41 = 4;
          int v42 = v3 % v41;
          int v43 = 1;
          int v44 = v42 + v43;
          bool v45 = v40 < v44;
          v39 = v39;
          v40 = v40;
          if (!v45) break;
          int v46 = 0;
          int v47 = 1;
          int v48 = v40 + v47;
          v39 = v46;
          v40 = v48;
        }
        v36 = v39;
      } else {
        int v49 = 0;
        bool v50 = v2 != v49;
        int v51;
        if (v50) {
          int v52 = 1;
          v51 = v52;
        } else {
          v51 = v0;
        }
        int v53 = 3;
        int v54 = v0 + v53;
        v36 = v51;
      }
      int v55 = 4;
      int v56 = v0 + v55;
      v8 = v36;
      break;
    }
  }
  bool v57 = true;
  int v58 = simt_wave_count_bits(v57);
  int v59 = 0;
  int v60 = v59 + v0;
  v1[v60] = v58;
  return;
}

kernel void kernel_main(device int* v61 [[buffer(0)]], device int* v62 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v63 = static_cast<int>(__simt_tid3.x);
  int v64 = 0;
  int v65 = v64 + v63;
  int v66 = v62[v65];
  int v67 = 4;
  int v68 = v67 + v63;
  int v69 = v62[v68];
  helper0(v63, v61, v66, v69, static_cast<int>(__simt_tid3.x));
  int v70 = 8;
  int v71 = v70 + v63;
  int v72 = v62[v71];
  int v73 = 2;
  int v74 = v63 + v73;
  int v75;
  v75 = v74;
  switch (v72) {
    case 0:
      {
      int v76 = 0;
      v75 = v76;
      break;
    }
    case 1:
      {
      int v77 = 12;
      int v78 = v77 + v63;
      int v79 = v62[v78];
      int v80 = 4;
      int v81;
      v81 = v80;
      switch (v79) {
        default:
          {
          int v82 = 16;
          int v83 = v82 + v63;
          int v84 = v62[v83];
          int v85 = 2;
          int v86 = v63 + v85;
          int v87;
          v87 = v86;
          switch (v84) {
            default:
              {
              int v88 = 3;
              v87 = v88;
              break;
            }
            case 0:
              {
              int v89 = 4;
              int v90 = v63 + v89;
              v87 = v90;
            }
            case 1:
              {
              int v91 = 4;
              int v92 = v63 + v91;
              v87 = v92;
              break;
            }
          }
          bool v93 = true;
          v81 = v87;
          break;
        }
        case 0:
          {
          int v94 = 0;
          int v95 = 0;
          int v96;
          int v97;
          v96 = v94;
          v97 = v95;
          while (true) {
            int v98 = 4;
            int v99 = v97 * v98;
            int v100 = v99 + v63;
            int v101 = 20;
            int v102 = v101 + v100;
            int v103 = v62[v102];
            int v104 = 0;
            bool v105 = v103 != v104;
            v96 = v96;
            v97 = v97;
            if (!v105) break;
            int v106 = v96 + v97;
            int v107 = 1;
            int v108 = v97 + v107;
            v96 = v106;
            v97 = v108;
            break;
            ;
          }
          bool v109 = true;
          v81 = v96;
          break;
        }
      }
      bool v110 = true;
      v75 = v81;
      break;
    }
    default:
      {
      int v111 = 0;
      int v112 = 0;
      int v113;
      int v114;
      v113 = v111;
      v114 = v112;
      while (true) {
        int v115 = 4;
        int v116 = v114 * v115;
        int v117 = v116 + v63;
        int v118 = 40;
        int v119 = v118 + v117;
        int v120 = v62[v119];
        int v121 = 0;
        bool v122 = v120 != v121;
        v113 = v113;
        v114 = v114;
        if (!v122) break;
        int v123 = v113 + v114;
        int v124 = 1;
        int v125 = v114 + v124;
        v113 = v123;
        v114 = v125;
        continue;
        ;
      }
      bool v126 = true;
      v75 = v113;
      break;
    }
    case 2:
      {
      int v127 = 60;
      int v128 = v127 + v63;
      int v129 = v62[v128];
      int v130;
      v130 = v63;
      switch (v129) {
        case 0:
          {
          int v131 = 64;
          int v132 = v131 + v63;
          int v133 = v62[v132];
          int v134 = 1;
          int v135 = v63 + v134;
          int v136;
          v136 = v135;
          switch (v133) {
            case 0:
              {
              int v137 = 4;
              v136 = v137;
            }
            case 1:
              {
              v136 = v63;
              break;
            }
            default:
              {
              v136 = v63;
            }
            case 2:
              {
              int v138 = 2;
              int v139 = v63 + v138;
              v136 = v139;
              break;
            }
          }
          bool v140 = true;
          v130 = v136;
        }
        default:
          {
          int v141 = 68;
          int v142 = v141 + v63;
          int v143 = v62[v142];
          int v144 = 4;
          int v145 = v63 + v144;
          int v146;
          v146 = v145;
          switch (v143) {
            default:
              {
              int v147 = 2;
              int v148 = v63 + v147;
              v146 = v148;
              break;
            }
            case 0:
              {
              int v149 = 1;
              v146 = v149;
              break;
            }
          }
          bool v150 = true;
          v130 = v146;
        }
        case 1:
          {
          int v151 = 72;
          int v152 = v151 + v63;
          int v153 = v62[v152];
          int v154;
          v154 = v63;
          switch (v153) {
            default:
              {
              int v155 = 0;
              int v156 = v63 + v155;
              v154 = v156;
              break;
            }
            case 0:
              {
              int v157 = 4;
              int v158 = v63 + v157;
              v154 = v158;
              break;
            }
            case 1:
              {
              v154 = v63;
              break;
            }
            case 2:
              {
              int v159 = 4;
              v154 = v159;
              break;
            }
          }
          bool v160 = true;
          v130 = v154;
          break;
        }
      }
      bool v161 = true;
      v75 = v130;
      break;
    }
  }
  bool v162 = true;
  int v163 = 16;
  int v164 = v163 + v63;
  bool v165 = true;
  int v166 = simt_wave_count_bits(v165);
  v61[v164] = v166;
  int v167 = 76;
  int v168 = v167 + v63;
  int v169 = v62[v168];
  int v170;
  v170 = v63;
  switch (v169) {
    default:
      {
      int v171 = 80;
      int v172 = v171 + v63;
      int v173 = v62[v172];
      int v174;
      v174 = v63;
      switch (v173) {
        case 0:
          {
          v174 = v63;
          break;
        }
        case 1:
          {
          int v175 = 1;
          v174 = v175;
          break;
        }
        default:
          {
          int v176 = 2;
          v174 = v176;
          break;
        }
        case 2:
          {
          int v177 = 84;
          int v178 = v177 + v63;
          int v179 = v62[v178];
          int v180 = 0;
          bool v181 = v179 != v180;
          int v182;
          if (v181) {
            int v183 = 0;
            int v184 = v63 + v183;
            v182 = v184;
          } else {
            v182 = v63;
          }
          v174 = v182;
          break;
        }
      }
      bool v185 = true;
      v170 = v174;
      break;
    }
    case 0:
      {
      int v186 = 88;
      int v187 = v186 + v63;
      int v188 = v62[v187];
      int v189 = 0;
      bool v190 = v188 != v189;
      int v191;
      if (v190) {
        int v192 = 92;
        int v193 = v192 + v63;
        int v194 = v62[v193];
        int v195 = 1;
        int v196 = v63 + v195;
        int v197;
        v197 = v196;
        switch (v194) {
          case 0:
            {
            v197 = v63;
            break;
          }
          default:
            {
            int v198 = 4;
            v197 = v198;
            break;
          }
          case 1:
            {
            v197 = v63;
          }
          case 2:
            {
            int v199 = 3;
            v197 = v199;
            break;
          }
        }
        bool v200 = true;
        v191 = v197;
      } else {
        int v201 = 0;
        int v202 = v63 + v201;
        v191 = v202;
      }
      v170 = v191;
      break;
    }
  }
  bool v203 = true;
  int v204 = 32;
  int v205 = v204 + v63;
  bool v206 = true;
  int v207 = simt_wave_count_bits(v206);
  v61[v205] = v207;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 96; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
