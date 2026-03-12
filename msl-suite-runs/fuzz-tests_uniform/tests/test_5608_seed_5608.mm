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
  uint v4 = simt_subgroup_id(__simt_tid);
  int v5 = (int)(v4);
  int v6 = 3;
  int v7 = v3 % v6;
  uint v8 = simt_lane_id(__simt_tid);
  int v9 = (int)(v8);
  int v10;
  v10 = v9;
  switch (v7) {
    case 0:
      {
      int v11 = 0;
      bool v12 = v2 != v11;
      int v13;
      if (v12) {
        int v14 = 0;
        int v15 = 0;
        int v16;
        int v17;
        v16 = v14;
        v17 = v15;
        while (true) {
          int v18 = 4;
          int v19 = v3 % v18;
          int v20 = 1;
          int v21 = v19 + v20;
          bool v22 = v17 < v21;
          v16 = v16;
          v17 = v17;
          if (!v22) break;
          int v23 = 2;
          int v24 = v0 + v23;
          int v25 = 1;
          int v26 = v17 + v25;
          v16 = v24;
          v17 = v26;
          continue;
          ;
        }
        v13 = v16;
      } else {
        int v27 = 0;
        bool v28 = v2 != v27;
        int v29;
        if (v28) {
          v29 = v0;
        } else {
          int v30 = 2;
          v29 = v30;
        }
        int v31 = 3;
        v13 = v29;
      }
      v10 = v13;
      break;
    }
    case 1:
      {
      int v32 = 3;
      int v33 = v3 % v32;
      int v34 = 1;
      int v35 = v0 + v34;
      int v36;
      v36 = v35;
      switch (v33) {
        case 0:
          {
          int v37 = 0;
          bool v38 = v2 != v37;
          int v39;
          if (v38) {
            v39 = v0;
          } else {
            v39 = v0;
          }
          int v40 = 1;
          int v41 = v0 + v40;
          v36 = v39;
        }
        default:
          {
          int v42 = 4;
          int v43 = v3 % v42;
          int v44;
          v44 = v0;
          switch (v43) {
            case 0:
              {
              int v45 = 1;
              int v46 = v0 + v45;
              v44 = v46;
            }
            default:
              {
              int v47 = 1;
              int v48 = v0 + v47;
              v44 = v48;
              break;
            }
            case 1:
              {
              int v49 = 3;
              v44 = v49;
            }
            case 2:
              {
              int v50 = 4;
              v44 = v50;
              break;
            }
          }
          int v51 = 4;
          v36 = v44;
        }
        case 1:
          {
          int v52 = 4;
          int v53 = v3 % v52;
          int v54 = 3;
          int v55;
          v55 = v54;
          switch (v53) {
            default:
              {
              v55 = v0;
              break;
            }
            case 0:
              {
              int v56 = 2;
              int v57 = v0 + v56;
              v55 = v57;
            }
            case 1:
              {
              v55 = v0;
            }
            case 2:
              {
              int v58 = 3;
              int v59 = v0 + v58;
              v55 = v59;
              break;
            }
          }
          v36 = v55;
          break;
        }
        case 2:
          {
          v36 = v0;
          break;
        }
      }
      int v60 = 1;
      v10 = v36;
      break;
    }
    case 2:
      {
      int v61 = 0;
      bool v62 = v2 != v61;
      int v63;
      if (v62) {
        int v64 = 0;
        int v65 = 0;
        int v66;
        int v67;
        v66 = v64;
        v67 = v65;
        while (true) {
          int v68 = 4;
          int v69 = v3 % v68;
          int v70 = 1;
          int v71 = v69 + v70;
          bool v72 = v67 < v71;
          v66 = v66;
          v67 = v67;
          if (!v72) break;
          int v73 = 0;
          int v74 = 1;
          int v75 = v67 + v74;
          v66 = v73;
          v67 = v75;
        }
        int v76 = 4;
        int v77 = v0 + v76;
        v63 = v66;
      } else {
        int v78 = 2;
        int v79 = v3 % v78;
        int v80 = 1;
        int v81;
        v81 = v80;
        switch (v79) {
          default:
            {
            v81 = v0;
            break;
          }
          case 0:
            {
            int v82 = 2;
            int v83 = v0 + v82;
            v81 = v83;
            break;
          }
          case 1:
            {
            int v84 = 1;
            v81 = v84;
            break;
          }
        }
        int v85 = 4;
        int v86 = v0 + v85;
        v63 = v81;
      }
      int v87 = 2;
      v10 = v63;
      break;
    }
    default:
      {
      int v88 = 3;
      int v89 = v3 % v88;
      int v90 = 1;
      int v91;
      v91 = v90;
      switch (v89) {
        case 0:
          {
          int v92 = 1;
          v91 = v92;
          break;
        }
        case 1:
          {
          int v93 = 0;
          bool v94 = v2 != v93;
          int v95;
          if (v94) {
            int v96 = 0;
            v95 = v96;
          } else {
            int v97 = 4;
            int v98 = v0 + v97;
            v95 = v98;
          }
          int v99 = 1;
          int v100 = v0 + v99;
          v91 = v95;
          break;
        }
        case 2:
          {
          int v101 = 4;
          int v102 = v0 + v101;
          v91 = v102;
          break;
        }
        default:
          {
          int v103 = 1;
          int v104 = v0 + v103;
          v91 = v104;
          break;
        }
      }
      int v105 = 2;
      v10 = v91;
      break;
    }
  }
  bool v106 = true;
  int v107 = simt_wave_count_bits(v106);
  int v108 = 0;
  int v109 = v108 + v0;
  v1[v109] = v107;
  int v110 = 0;
  bool v111 = v2 != v110;
  int v112 = v111 ? v5 : v10;
  return;
}

kernel void kernel_main(device int* v113 [[buffer(0)]], device int* v114 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v115 = static_cast<int>(__simt_tid3.x);
  int v116 = 0;
  int v117 = v116 + v115;
  int v118 = v114[v117];
  int v119 = 4;
  int v120 = v119 + v115;
  int v121 = v114[v120];
  helper0(v115, v113, v118, v121, static_cast<int>(__simt_tid3.x));
  int v122 = 8;
  int v123 = v122 + v115;
  int v124 = v114[v123];
  int v125 = 3;
  int v126 = v115 + v125;
  int v127;
  v127 = v126;
  switch (v124) {
    case 0:
      {
      int v128 = 3;
      v127 = v128;
      break;
    }
    default:
      {
      int v129 = 12;
      int v130 = v129 + v115;
      int v131 = v114[v130];
      int v132;
      v132 = v115;
      switch (v131) {
        case 0:
          {
          int v133 = 16;
          int v134 = v133 + v115;
          int v135 = v114[v134];
          int v136 = 0;
          bool v137 = v135 != v136;
          int v138;
          if (v137) {
            int v139 = 1;
            int v140 = v115 + v139;
            v138 = v140;
          } else {
            int v141 = 1;
            v138 = v141;
          }
          v132 = v138;
          break;
        }
        default:
          {
          int v142 = 20;
          int v143 = v142 + v115;
          int v144 = v114[v143];
          int v145 = 3;
          int v146 = v115 + v145;
          int v147;
          v147 = v146;
          switch (v144) {
            default:
              {
              int v148 = 2;
              v147 = v148;
              break;
            }
            case 0:
              {
              int v149 = 1;
              v147 = v149;
              break;
            }
            case 1:
              {
              int v150 = 4;
              v147 = v150;
              break;
            }
          }
          bool v151 = true;
          v132 = v147;
          break;
        }
      }
      bool v152 = true;
      v127 = v132;
      break;
    }
    case 1:
      {
      int v153 = 0;
      int v154 = 0;
      int v155;
      int v156;
      v155 = v153;
      v156 = v154;
      while (true) {
        int v157 = 4;
        int v158 = v156 * v157;
        int v159 = v158 + v115;
        int v160 = 24;
        int v161 = v160 + v159;
        int v162 = v114[v161];
        int v163 = 0;
        bool v164 = v162 != v163;
        v155 = v155;
        v156 = v156;
        if (!v164) break;
        int v165 = 0;
        int v166 = 0;
        int v167;
        int v168;
        v167 = v165;
        v168 = v166;
        while (true) {
          int v169 = 4;
          int v170 = v168 * v169;
          int v171 = v170 + v115;
          int v172 = 44;
          int v173 = v172 + v171;
          int v174 = v114[v173];
          int v175 = 0;
          bool v176 = v174 != v175;
          v167 = v167;
          v168 = v168;
          if (!v176) break;
          int v177 = v167 + v168;
          int v178 = 1;
          int v179 = v168 + v178;
          v167 = v177;
          v168 = v179;
        }
        bool v180 = true;
        int v181 = v155 + v167;
        int v182 = 1;
        int v183 = v156 + v182;
        v155 = v181;
        v156 = v183;
      }
      bool v184 = true;
      v127 = v155;
      break;
    }
    case 2:
      {
      int v185 = 64;
      int v186 = v185 + v115;
      int v187 = v114[v186];
      int v188 = 0;
      bool v189 = v187 != v188;
      int v190;
      if (v189) {
        int v191 = 68;
        int v192 = v191 + v115;
        int v193 = v114[v192];
        int v194 = 0;
        bool v195 = v193 != v194;
        int v196;
        if (v195) {
          v196 = v115;
        } else {
          int v197 = 2;
          v196 = v197;
        }
        v190 = v196;
      } else {
        int v198 = 72;
        int v199 = v198 + v115;
        int v200 = v114[v199];
        int v201;
        v201 = v115;
        switch (v200) {
          case 0:
            {
            int v202 = 1;
            v201 = v202;
            break;
          }
          case 1:
            {
            v201 = v115;
            break;
          }
          default:
            {
            int v203 = 4;
            v201 = v203;
            break;
          }
        }
        bool v204 = true;
        v190 = v201;
      }
      v127 = v190;
      break;
    }
  }
  bool v205 = true;
  int v206 = 16;
  int v207 = v206 + v115;
  bool v208 = true;
  int v209 = simt_wave_count_bits(v208);
  v113[v207] = v209;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 20; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 76; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
