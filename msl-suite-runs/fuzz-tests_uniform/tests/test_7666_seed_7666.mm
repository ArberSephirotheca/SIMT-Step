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
  int v6;
  v6 = v0;
  switch (v5) {
    case 0:
      {
      int v7 = 3;
      int v8 = v3 % v7;
      int v9 = 4;
      int v10 = v0 + v9;
      int v11;
      v11 = v10;
      switch (v8) {
        case 0:
          {
          v11 = v0;
        }
        case 1:
          {
          int v12 = 2;
          int v13 = v3 % v12;
          int v14;
          v14 = v0;
          switch (v13) {
            default:
              {
              int v15 = 1;
              v14 = v15;
              break;
            }
            case 0:
              {
              int v16 = 1;
              v14 = v16;
              break;
            }
            case 1:
              {
              v14 = v0;
              break;
            }
          }
          int v17 = 0;
          int v18 = v0 + v17;
          v11 = v14;
          break;
        }
        default:
          {
          int v19 = 0;
          int v20 = 0;
          int v21;
          int v22;
          v21 = v19;
          v22 = v20;
          while (true) {
            int v23 = 4;
            int v24 = v3 % v23;
            int v25 = 1;
            int v26 = v24 + v25;
            bool v27 = v22 < v26;
            v21 = v21;
            v22 = v22;
            if (!v27) break;
            int v28 = 0;
            int v29 = v0 + v28;
            int v30 = 1;
            int v31 = v22 + v30;
            v21 = v29;
            v22 = v31;
          }
          v11 = v21;
          break;
        }
      }
      int v32 = 2;
      int v33 = v0 + v32;
      v6 = v11;
      break;
    }
    case 1:
      {
      int v34 = 0;
      bool v35 = v2 != v34;
      int v36;
      if (v35) {
        int v37 = 3;
        int v38 = v3 % v37;
        int v39 = 3;
        int v40 = v0 + v39;
        int v41;
        v41 = v40;
        switch (v38) {
          case 0:
            {
            int v42 = 2;
            int v43 = v0 + v42;
            v41 = v43;
            break;
          }
          case 1:
            {
            v41 = v0;
            break;
          }
          default:
            {
            v41 = v0;
            break;
          }
          case 2:
            {
            v41 = v0;
            break;
          }
        }
        int v44 = 2;
        int v45 = v0 + v44;
        v36 = v41;
      } else {
        int v46 = 0;
        bool v47 = v2 != v46;
        int v48;
        if (v47) {
          v48 = v0;
        } else {
          int v49 = 3;
          int v50 = v0 + v49;
          v48 = v50;
        }
        int v51 = 2;
        int v52 = v0 + v51;
        v36 = v48;
      }
      int v53 = 2;
      v6 = v36;
      break;
    }
    default:
      {
      int v54 = 3;
      int v55 = v3 % v54;
      int v56 = 1;
      int v57 = v0 + v56;
      int v58;
      v58 = v57;
      switch (v55) {
        case 0:
          {
          int v59 = 3;
          int v60 = v3 % v59;
          int v61;
          v61 = v0;
          switch (v60) {
            case 0:
              {
              int v62 = 1;
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
              int v66 = 2;
              v61 = v66;
              break;
            }
            case 2:
              {
              int v67 = 3;
              v61 = v67;
              break;
            }
          }
          v58 = v61;
          break;
        }
        case 1:
          {
          int v68 = 2;
          int v69 = v3 % v68;
          int v70 = 4;
          int v71 = v0 + v70;
          int v72;
          v72 = v71;
          switch (v69) {
            case 0:
              {
              int v73 = 1;
              int v74 = v0 + v73;
              v72 = v74;
            }
            default:
              {
              v72 = v0;
            }
            case 1:
              {
              int v75 = 0;
              int v76 = v0 + v75;
              v72 = v76;
              break;
            }
          }
          v58 = v72;
          break;
        }
        default:
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
            int v86 = 3;
            int v87 = 1;
            int v88 = v80 + v87;
            v79 = v86;
            v80 = v88;
          }
          v58 = v79;
          break;
        }
      }
      int v89 = 2;
      v6 = v58;
      break;
    }
  }
  bool v90 = true;
  int v91 = simt_wave_count_bits(v90);
  int v92 = 0;
  int v93 = v92 + v0;
  v1[v93] = v91;
  return;
}

kernel void kernel_main(device int* v94 [[buffer(0)]], device int* v95 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v96 = static_cast<int>(__simt_tid3.x);
  int v97 = 0;
  int v98 = v97 + v96;
  int v99 = v95[v98];
  int v100 = 4;
  int v101 = v100 + v96;
  int v102 = v95[v101];
  helper0(v96, v94, v99, v102, static_cast<int>(__simt_tid3.x));
  int v103 = 8;
  int v104 = v103 + v96;
  int v105 = v95[v104];
  int v106 = 0;
  bool v107 = v105 != v106;
  int v108;
  if (v107) {
    int v109 = 12;
    int v110 = v109 + v96;
    int v111 = v95[v110];
    int v112 = 0;
    bool v113 = v111 != v112;
    int v114;
    if (v113) {
      int v115 = 16;
      int v116 = v115 + v96;
      int v117 = v95[v116];
      int v118 = 0;
      int v119 = v96 + v118;
      int v120;
      v120 = v119;
      switch (v117) {
        case 0:
          {
          v120 = v96;
        }
        case 1:
          {
          int v121 = 3;
          v120 = v121;
        }
        default:
          {
          int v122 = 3;
          v120 = v122;
        }
        case 2:
          {
          int v123 = 4;
          int v124 = v96 + v123;
          v120 = v124;
          break;
        }
      }
      bool v125 = true;
      v114 = v120;
    } else {
      int v126 = 20;
      int v127 = v126 + v96;
      int v128 = v95[v127];
      int v129 = 0;
      bool v130 = v128 != v129;
      int v131;
      if (v130) {
        v131 = v96;
      } else {
        uint v132 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v133 = (int)(v132);
        v131 = v133;
      }
      v114 = v131;
    }
    v108 = v114;
  } else {
    int v134 = 24;
    int v135 = v134 + v96;
    int v136 = v95[v135];
    int v137 = 0;
    bool v138 = v136 != v137;
    int v139;
    if (v138) {
      int v140 = 28;
      int v141 = v140 + v96;
      int v142 = v95[v141];
      int v143;
      v143 = v96;
      switch (v142) {
        case 0:
          {
          v143 = v96;
          break;
        }
        default:
          {
          int v144 = 2;
          int v145 = v96 + v144;
          v143 = v145;
        }
        case 1:
          {
          int v146 = 0;
          v143 = v146;
          break;
        }
      }
      bool v147 = true;
      v139 = v143;
    } else {
      int v148 = 32;
      int v149 = v148 + v96;
      int v150 = v95[v149];
      int v151 = 0;
      bool v152 = v150 != v151;
      int v153;
      if (v152) {
        int v154 = 4;
        v153 = v154;
      } else {
        uint v155 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v156 = (int)(v155);
        v153 = v156;
      }
      v139 = v153;
    }
    v108 = v139;
  }
  int v157 = 16;
  int v158 = v157 + v96;
  bool v159 = true;
  int v160 = simt_wave_count_bits(v159);
  v94[v158] = v160;
  int v161 = 36;
  int v162 = v161 + v96;
  int v163 = v95[v162];
  int v164 = 0;
  bool v165 = v163 != v164;
  int v166;
  if (v165) {
    int v167 = 0;
    int v168 = 0;
    int v169;
    int v170;
    v169 = v167;
    v170 = v168;
    while (true) {
      int v171 = 4;
      int v172 = v170 * v171;
      int v173 = v172 + v96;
      int v174 = 40;
      int v175 = v174 + v173;
      int v176 = v95[v175];
      int v177 = 0;
      bool v178 = v176 != v177;
      v169 = v169;
      v170 = v170;
      if (!v178) break;
      int v179 = v169 + v170;
      int v180 = 1;
      int v181 = v170 + v180;
      v169 = v179;
      v170 = v181;
    }
    bool v182 = true;
    v166 = v169;
  } else {
    int v183 = 0;
    int v184 = 0;
    int v185;
    int v186;
    v185 = v183;
    v186 = v184;
    while (true) {
      int v187 = 4;
      int v188 = v186 * v187;
      int v189 = v188 + v96;
      int v190 = 60;
      int v191 = v190 + v189;
      int v192 = v95[v191];
      int v193 = 0;
      bool v194 = v192 != v193;
      v185 = v185;
      v186 = v186;
      if (!v194) break;
      int v195 = 80;
      int v196 = v195 + v96;
      int v197 = v95[v196];
      int v198 = 0;
      bool v199 = v197 != v198;
      int v200;
      if (v199) {
        int v201 = 4;
        int v202 = v96 + v201;
        v200 = v202;
      } else {
        int v203 = 0;
        v200 = v203;
      }
      int v204 = v185 + v200;
      int v205 = 1;
      int v206 = v186 + v205;
      v185 = v204;
      v186 = v206;
      break;
      ;
    }
    bool v207 = true;
    v166 = v185;
  }
  int v208 = 32;
  int v209 = v208 + v96;
  bool v210 = true;
  int v211 = simt_wave_count_bits(v210);
  v94[v209] = v211;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 84; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
