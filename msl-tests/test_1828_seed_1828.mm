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
  int v6 = 2;
  int v7;
  v7 = v6;
  switch (v5) {
    default:
      {
      int v8 = 0;
      bool v9 = v2 != v8;
      int v10;
      if (v9) {
        int v11 = 0;
        bool v12 = v2 != v11;
        int v13;
        if (v12) {
          int v14 = 3;
          int v15 = v0 + v14;
          v13 = v15;
        } else {
          int v16 = 0;
          v13 = v16;
        }
        v10 = v13;
      } else {
        int v17 = 0;
        bool v18 = v2 != v17;
        int v19;
        if (v18) {
          int v20 = 0;
          v19 = v20;
        } else {
          v19 = v0;
        }
        v10 = v19;
      }
      int v21 = 0;
      v7 = v10;
      break;
    }
    case 0:
      {
      int v22 = 4;
      int v23 = v3 % v22;
      int v24 = 3;
      int v25;
      v25 = v24;
      switch (v23) {
        case 0:
          {
          int v26 = 2;
          int v27 = v3 % v26;
          int v28 = 1;
          int v29 = v0 + v28;
          int v30;
          v30 = v29;
          switch (v27) {
            case 0:
              {
              v30 = v0;
              break;
            }
            default:
              {
              int v31 = 4;
              int v32 = v0 + v31;
              v30 = v32;
              break;
            }
            case 1:
              {
              int v33 = 1;
              v30 = v33;
              break;
            }
          }
          int v34 = 0;
          int v35 = v0 + v34;
          v25 = v30;
          break;
        }
        case 1:
          {
          int v36 = 0;
          bool v37 = v2 != v36;
          int v38;
          if (v37) {
            v38 = v0;
          } else {
            v38 = v0;
          }
          v25 = v38;
          break;
        }
        default:
          {
          int v39 = 3;
          v25 = v39;
          break;
        }
        case 2:
          {
          int v40 = 0;
          bool v41 = v2 != v40;
          int v42;
          if (v41) {
            int v43 = 1;
            v42 = v43;
          } else {
            int v44 = 1;
            v42 = v44;
          }
          int v45 = 0;
          v25 = v42;
          break;
        }
      }
      int v46 = 1;
      v7 = v25;
      break;
    }
    case 1:
      {
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
        int v56 = 0;
        bool v57 = v2 != v56;
        int v58;
        if (v57) {
          v58 = v0;
        } else {
          int v59 = 3;
          int v60 = v0 + v59;
          v58 = v60;
        }
        int v61 = 4;
        int v62 = 1;
        int v63 = v50 + v62;
        v49 = v58;
        v50 = v63;
      }
      int v64 = 1;
      v7 = v49;
    }
    case 2:
      {
      int v65 = 0;
      bool v66 = v2 != v65;
      int v67;
      if (v66) {
        int v68 = 2;
        int v69 = v3 % v68;
        int v70 = 0;
        int v71 = v0 + v70;
        int v72;
        v72 = v71;
        switch (v69) {
          case 0:
            {
            v72 = v0;
            break;
          }
          default:
            {
            v72 = v0;
            break;
          }
          case 1:
            {
            int v73 = 1;
            v72 = v73;
            break;
          }
        }
        int v74 = 3;
        int v75 = v0 + v74;
        v67 = v72;
      } else {
        int v76 = 0;
        int v77 = 0;
        int v78;
        int v79;
        v78 = v76;
        v79 = v77;
        while (true) {
          int v80 = 4;
          int v81 = v3 % v80;
          int v82 = 1;
          int v83 = v81 + v82;
          bool v84 = v79 < v83;
          v78 = v78;
          v79 = v79;
          if (!v84) break;
          int v85 = 1;
          int v86 = 1;
          int v87 = v79 + v86;
          v78 = v85;
          v79 = v87;
        }
        v67 = v78;
      }
      int v88 = 4;
      v7 = v67;
      break;
    }
  }
  bool v89 = true;
  int v90 = simt_wave_count_bits(v89);
  int v91 = 0;
  int v92 = v91 + v0;
  v1[v92] = v90;
  return;
}

kernel void kernel_main(device int* v93 [[buffer(0)]], device int* v94 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v95 = static_cast<int>(__simt_tid3.x);
  int v96 = 0;
  int v97 = v96 + v95;
  int v98 = v94[v97];
  int v99 = 4;
  int v100 = v99 + v95;
  int v101 = v94[v100];
  helper0(v95, v93, v98, v101, static_cast<int>(__simt_tid3.x));
  int v102 = 8;
  int v103 = v102 + v95;
  int v104 = v94[v103];
  uint v105 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v106 = (int)(v105);
  int v107;
  v107 = v106;
  switch (v104) {
    default:
      {
      int v108 = 12;
      int v109 = v108 + v95;
      int v110 = v94[v109];
      int v111 = 1;
      int v112 = v95 + v111;
      int v113;
      v113 = v112;
      switch (v110) {
        case 0:
          {
          int v114 = 0;
          int v115 = 0;
          int v116;
          int v117;
          v116 = v114;
          v117 = v115;
          while (true) {
            int v118 = 4;
            int v119 = v117 * v118;
            int v120 = v119 + v95;
            int v121 = 16;
            int v122 = v121 + v120;
            int v123 = v94[v122];
            int v124 = 0;
            bool v125 = v123 != v124;
            v116 = v116;
            v117 = v117;
            if (!v125) break;
            int v126 = v116 + v117;
            int v127 = 1;
            int v128 = v117 + v127;
            v116 = v126;
            v117 = v128;
          }
          bool v129 = true;
          v113 = v116;
          break;
        }
        case 1:
          {
          int v130 = 4;
          int v131 = v95 + v130;
          v113 = v131;
          break;
        }
        default:
          {
          int v132 = 36;
          int v133 = v132 + v95;
          int v134 = v94[v133];
          int v135 = 0;
          bool v136 = v134 != v135;
          int v137;
          if (v136) {
            int v138 = 1;
            int v139 = v95 + v138;
            v137 = v139;
          } else {
            int v140 = 0;
            int v141 = v95 + v140;
            v137 = v141;
          }
          v113 = v137;
          break;
        }
      }
      bool v142 = true;
      v107 = v113;
      break;
    }
    case 0:
      {
      int v143 = 0;
      int v144 = 0;
      int v145;
      int v146;
      v145 = v143;
      v146 = v144;
      while (true) {
        int v147 = 4;
        int v148 = v146 * v147;
        int v149 = v148 + v95;
        int v150 = 40;
        int v151 = v150 + v149;
        int v152 = v94[v151];
        int v153 = 0;
        bool v154 = v152 != v153;
        v145 = v145;
        v146 = v146;
        if (!v154) break;
        int v155 = 60;
        int v156 = v155 + v95;
        int v157 = v94[v156];
        int v158 = 0;
        bool v159 = v157 != v158;
        int v160;
        if (v159) {
          int v161 = 3;
          int v162 = v95 + v161;
          v160 = v162;
        } else {
          int v163 = 0;
          v160 = v163;
        }
        int v164 = v145 + v160;
        int v165 = 1;
        int v166 = v146 + v165;
        v145 = v164;
        v146 = v166;
      }
      bool v167 = true;
      v107 = v145;
      break;
    }
  }
  bool v168 = true;
  int v169 = 16;
  int v170 = v169 + v95;
  bool v171 = true;
  int v172 = simt_wave_count_bits(v171);
  v93[v170] = v172;
  int v173 = 0;
  int v174 = 0;
  int v175;
  int v176;
  v175 = v173;
  v176 = v174;
  while (true) {
    int v177 = 4;
    int v178 = v176 * v177;
    int v179 = v178 + v95;
    int v180 = 64;
    int v181 = v180 + v179;
    int v182 = v94[v181];
    int v183 = 0;
    bool v184 = v182 != v183;
    v175 = v175;
    v176 = v176;
    if (!v184) break;
    uint v185 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v186 = (int)(v185);
    int v187 = v175 + v186;
    int v188 = 1;
    int v189 = v176 + v188;
    v175 = v187;
    v176 = v189;
  }
  bool v190 = true;
  int v191 = 32;
  int v192 = v191 + v95;
  bool v193 = true;
  int v194 = simt_wave_count_bits(v193);
  v93[v192] = v194;
  int v195 = 84;
  int v196 = v195 + v95;
  int v197 = v94[v196];
  int v198;
  v198 = v95;
  switch (v197) {
    default:
      {
      int v199 = 0;
      v198 = v199;
      break;
    }
    case 0:
      {
      int v200 = 0;
      v198 = v200;
      break;
    }
  }
  bool v201 = true;
  int v202 = 48;
  int v203 = v202 + v95;
  bool v204 = true;
  int v205 = simt_wave_count_bits(v204);
  v93[v203] = v205;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 88; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
