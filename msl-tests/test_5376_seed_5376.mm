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
  int v6;
  v6 = v0;
  switch (v5) {
    default:
      {
      int v7 = 4;
      int v8 = v3 % v7;
      int v9 = 2;
      int v10 = v0 + v9;
      int v11;
      v11 = v10;
      switch (v8) {
        default:
          {
          int v12 = 2;
          int v13 = v3 % v12;
          int v14;
          v14 = v0;
          switch (v13) {
            default:
              {
              int v15 = 2;
              v14 = v15;
              break;
            }
            case 0:
              {
              int v16 = 2;
              int v17 = v0 + v16;
              v14 = v17;
              break;
            }
          }
          int v18 = 1;
          v11 = v14;
          break;
        }
        case 0:
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
            int v28 = 1;
            int v29 = v22 + v28;
            v21 = v0;
            v22 = v29;
          }
          int v30 = 3;
          v11 = v21;
        }
        case 1:
          {
          int v31 = 3;
          int v32 = v3 % v31;
          int v33 = 1;
          int v34 = v0 + v33;
          int v35;
          v35 = v34;
          switch (v32) {
            default:
              {
              v35 = v0;
            }
            case 0:
              {
              int v36 = 3;
              v35 = v36;
            }
            case 1:
              {
              int v37 = 4;
              int v38 = v0 + v37;
              v35 = v38;
              break;
            }
            case 2:
              {
              int v39 = 4;
              v35 = v39;
              break;
            }
          }
          int v40 = 0;
          int v41 = v0 + v40;
          v11 = v35;
          break;
        }
        case 2:
          {
          int v42 = 0;
          int v43 = 0;
          int v44;
          int v45;
          v44 = v42;
          v45 = v43;
          while (true) {
            int v46 = 4;
            int v47 = v3 % v46;
            int v48 = 1;
            int v49 = v47 + v48;
            bool v50 = v45 < v49;
            v44 = v44;
            v45 = v45;
            if (!v50) break;
            int v51 = 1;
            int v52 = v45 + v51;
            v44 = v0;
            v45 = v52;
          }
          int v53 = 4;
          int v54 = v0 + v53;
          v11 = v44;
          break;
        }
      }
      int v55 = 1;
      int v56 = v0 + v55;
      v6 = v11;
      break;
    }
    case 0:
      {
      int v57 = 0;
      bool v58 = v2 != v57;
      int v59;
      if (v58) {
        int v60 = 4;
        int v61 = v3 % v60;
        int v62;
        v62 = v0;
        switch (v61) {
          default:
            {
            v62 = v0;
            break;
          }
          case 0:
            {
            v62 = v0;
            break;
          }
          case 1:
            {
            int v63 = 0;
            int v64 = v0 + v63;
            v62 = v64;
            break;
          }
          case 2:
            {
            v62 = v0;
            break;
          }
        }
        v59 = v62;
      } else {
        int v65 = 0;
        int v66 = 0;
        int v67;
        int v68;
        v67 = v65;
        v68 = v66;
        while (true) {
          int v69 = 4;
          int v70 = v3 % v69;
          int v71 = 1;
          int v72 = v70 + v71;
          bool v73 = v68 < v72;
          v67 = v67;
          v68 = v68;
          if (!v73) break;
          int v74 = 1;
          int v75 = v68 + v74;
          v67 = v0;
          v68 = v75;
        }
        v59 = v67;
      }
      int v76 = 1;
      v6 = v59;
      break;
    }
    case 1:
      {
      int v77 = 2;
      int v78 = v3 % v77;
      int v79;
      v79 = v0;
      switch (v78) {
        default:
          {
          int v80 = 0;
          bool v81 = v2 != v80;
          int v82;
          if (v81) {
            v82 = v0;
          } else {
            int v83 = 0;
            v82 = v83;
          }
          v79 = v82;
          break;
        }
        case 0:
          {
          int v84 = 0;
          bool v85 = v2 != v84;
          int v86;
          if (v85) {
            int v87 = 3;
            int v88 = v0 + v87;
            v86 = v88;
          } else {
            v86 = v0;
          }
          int v89 = 3;
          int v90 = v0 + v89;
          v79 = v86;
          break;
        }
        case 1:
          {
          int v91 = 2;
          int v92 = v3 % v91;
          int v93 = 3;
          int v94;
          v94 = v93;
          switch (v92) {
            case 0:
              {
              int v95 = 3;
              int v96 = v0 + v95;
              v94 = v96;
            }
            default:
              {
              int v97 = 2;
              int v98 = v0 + v97;
              v94 = v98;
              break;
            }
          }
          int v99 = 0;
          v79 = v94;
          break;
        }
      }
      int v100 = 3;
      v6 = v79;
      break;
    }
    case 2:
      {
      int v101 = 0;
      int v102 = 0;
      int v103;
      int v104;
      v103 = v101;
      v104 = v102;
      while (true) {
        int v105 = 4;
        int v106 = v3 % v105;
        int v107 = 1;
        int v108 = v106 + v107;
        bool v109 = v104 < v108;
        v103 = v103;
        v104 = v104;
        if (!v109) break;
        int v110 = 0;
        bool v111 = v2 != v110;
        int v112;
        if (v111) {
          int v113 = 1;
          int v114 = v0 + v113;
          v112 = v114;
        } else {
          int v115 = 4;
          int v116 = v0 + v115;
          v112 = v116;
        }
        int v117 = 4;
        int v118 = 1;
        int v119 = v104 + v118;
        v103 = v112;
        v104 = v119;
      }
      v6 = v103;
      break;
    }
  }
  bool v120 = true;
  int v121 = simt_wave_count_bits(v120);
  int v122 = 0;
  int v123 = v122 + v0;
  v1[v123] = v121;
  int v124 = 0;
  bool v125 = v2 != v124;
  int v126 = v125 ? v0 : v6;
  return;
}

kernel void kernel_main(device int* v127 [[buffer(0)]], device int* v128 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v129 = static_cast<int>(__simt_tid3.x);
  int v130 = 0;
  int v131 = v130 + v129;
  int v132 = v128[v131];
  int v133 = 4;
  int v134 = v133 + v129;
  int v135 = v128[v134];
  helper0(v129, v127, v132, v135, static_cast<int>(__simt_tid3.x));
  int v136 = 8;
  int v137 = v136 + v129;
  int v138 = v128[v137];
  uint v139 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v140 = (int)(v139);
  int v141;
  v141 = v140;
  switch (v138) {
    case 0:
      {
      int v142 = 3;
      v141 = v142;
      break;
    }
    case 1:
      {
      int v143 = 12;
      int v144 = v143 + v129;
      int v145 = v128[v144];
      int v146 = 1;
      int v147 = v129 + v146;
      int v148;
      v148 = v147;
      switch (v145) {
        case 0:
          {
          int v149 = 16;
          int v150 = v149 + v129;
          int v151 = v128[v150];
          int v152 = 0;
          bool v153 = v151 != v152;
          int v154;
          if (v153) {
            v154 = v129;
          } else {
            v154 = v129;
          }
          v148 = v154;
          break;
        }
        case 1:
          {
          int v155 = 0;
          int v156 = 0;
          int v157;
          int v158;
          v157 = v155;
          v158 = v156;
          while (true) {
            int v159 = 4;
            int v160 = v158 * v159;
            int v161 = v160 + v129;
            int v162 = 20;
            int v163 = v162 + v161;
            int v164 = v128[v163];
            int v165 = 0;
            bool v166 = v164 != v165;
            v157 = v157;
            v158 = v158;
            if (!v166) break;
            int v167 = v157 + v158;
            int v168 = 1;
            int v169 = v158 + v168;
            v157 = v167;
            v158 = v169;
            break;
            ;
          }
          bool v170 = true;
          v148 = v157;
          break;
        }
        default:
          {
          int v171 = 40;
          int v172 = v171 + v129;
          int v173 = v128[v172];
          int v174 = 0;
          int v175 = v129 + v174;
          int v176;
          v176 = v175;
          switch (v173) {
            default:
              {
              int v177 = 2;
              int v178 = v129 + v177;
              v176 = v178;
              break;
            }
            case 0:
              {
              v176 = v129;
              break;
            }
          }
          bool v179 = true;
          v148 = v176;
          break;
        }
      }
      bool v180 = true;
      v141 = v148;
      break;
    }
    default:
      {
      int v181 = 44;
      int v182 = v181 + v129;
      int v183 = v128[v182];
      int v184 = 0;
      bool v185 = v183 != v184;
      int v186;
      if (v185) {
        int v187 = 48;
        int v188 = v187 + v129;
        int v189 = v128[v188];
        int v190;
        v190 = v129;
        switch (v189) {
          default:
            {
            int v191 = 3;
            int v192 = v129 + v191;
            v190 = v192;
            break;
          }
          case 0:
            {
            int v193 = 4;
            int v194 = v129 + v193;
            v190 = v194;
            break;
          }
        }
        bool v195 = true;
        v186 = v190;
      } else {
        int v196 = 0;
        int v197 = 0;
        int v198;
        int v199;
        v198 = v196;
        v199 = v197;
        while (true) {
          int v200 = 4;
          int v201 = v199 * v200;
          int v202 = v201 + v129;
          int v203 = 52;
          int v204 = v203 + v202;
          int v205 = v128[v204];
          int v206 = 0;
          bool v207 = v205 != v206;
          v198 = v198;
          v199 = v199;
          if (!v207) break;
          int v208 = v198 + v199;
          int v209 = 1;
          int v210 = v199 + v209;
          v198 = v208;
          v199 = v210;
          break;
          ;
        }
        bool v211 = true;
        v186 = v198;
      }
      v141 = v186;
      break;
    }
  }
  bool v212 = true;
  int v213 = 16;
  int v214 = v213 + v129;
  bool v215 = true;
  int v216 = simt_wave_count_bits(v215);
  v127[v214] = v216;
  int v217 = 1;
  int v218 = v129 + v217;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 72; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
