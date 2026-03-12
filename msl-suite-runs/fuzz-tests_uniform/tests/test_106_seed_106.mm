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
  int v5 = 0;
  int v6;
  int v7;
  v6 = v4;
  v7 = v5;
  while (true) {
    int v8 = 4;
    int v9 = v3 % v8;
    int v10 = 1;
    int v11 = v9 + v10;
    bool v12 = v7 < v11;
    v6 = v6;
    v7 = v7;
    if (!v12) break;
    int v13 = 0;
    int v14 = 1;
    int v15 = v7 + v14;
    v6 = v13;
    v7 = v15;
    break;
    ;
  }
  bool v16 = true;
  int v17 = simt_wave_count_bits(v16);
  int v18 = 0;
  int v19 = v18 + v0;
  v1[v19] = v17;
  int v20 = 4;
  int v21 = v3 % v20;
  int v22 = 0;
  int v23 = v0 + v22;
  int v24;
  v24 = v23;
  switch (v21) {
    default:
      {
      int v25 = 2;
      int v26 = v3 % v25;
      int v27 = 1;
      int v28;
      v28 = v27;
      switch (v26) {
        case 0:
          {
          int v29 = 0;
          bool v30 = v2 != v29;
          int v31;
          if (v30) {
            int v32 = 0;
            int v33 = v0 + v32;
            v31 = v33;
          } else {
            int v34 = 3;
            int v35 = v0 + v34;
            v31 = v35;
          }
          int v36 = 0;
          int v37 = v0 + v36;
          v28 = v31;
          break;
        }
        default:
          {
          int v38 = 2;
          int v39 = v3 % v38;
          int v40 = 1;
          int v41 = v0 + v40;
          int v42;
          v42 = v41;
          switch (v39) {
            case 0:
              {
              v42 = v0;
            }
            default:
              {
              int v43 = 1;
              v42 = v43;
            }
            case 1:
              {
              int v44 = 2;
              v42 = v44;
              break;
            }
          }
          v28 = v42;
          break;
        }
        case 1:
          {
          int v45 = 0;
          bool v46 = v2 != v45;
          int v47;
          if (v46) {
            v47 = v0;
          } else {
            int v48 = 4;
            v47 = v48;
          }
          int v49 = 1;
          v28 = v47;
          break;
        }
      }
      int v50 = 4;
      v24 = v28;
    }
    case 0:
      {
      int v51 = 2;
      int v52 = v3 % v51;
      int v53 = 3;
      int v54;
      v54 = v53;
      switch (v52) {
        case 0:
          {
          v54 = v0;
        }
        default:
          {
          v54 = v0;
          break;
        }
      }
      int v55 = 2;
      v24 = v54;
    }
    case 1:
      {
      int v56 = 3;
      int v57 = v3 % v56;
      int v58 = 0;
      int v59;
      v59 = v58;
      switch (v57) {
        default:
          {
          int v60 = 0;
          bool v61 = v2 != v60;
          int v62;
          if (v61) {
            int v63 = 2;
            int v64 = v0 + v63;
            v62 = v64;
          } else {
            int v65 = 1;
            int v66 = v0 + v65;
            v62 = v66;
          }
          int v67 = 4;
          v59 = v62;
        }
        case 0:
          {
          int v68 = 0;
          int v69 = v0 + v68;
          v59 = v69;
        }
        case 1:
          {
          int v70 = 0;
          bool v71 = v2 != v70;
          int v72;
          if (v71) {
            v72 = v0;
          } else {
            v72 = v0;
          }
          int v73 = 2;
          v59 = v72;
        }
        case 2:
          {
          int v74 = 2;
          int v75 = v3 % v74;
          int v76 = 0;
          int v77 = v0 + v76;
          int v78;
          v78 = v77;
          switch (v75) {
            default:
              {
              v78 = v0;
            }
            case 0:
              {
              int v79 = 2;
              int v80 = v0 + v79;
              v78 = v80;
              break;
            }
          }
          int v81 = 2;
          v59 = v78;
          break;
        }
      }
      v24 = v59;
    }
    case 2:
      {
      int v82 = 3;
      int v83 = v3 % v82;
      int v84 = 3;
      int v85;
      v85 = v84;
      switch (v83) {
        case 0:
          {
          int v86 = 0;
          int v87 = 0;
          int v88;
          int v89;
          v88 = v86;
          v89 = v87;
          while (true) {
            int v90 = 4;
            int v91 = v3 % v90;
            int v92 = 1;
            int v93 = v91 + v92;
            bool v94 = v89 < v93;
            v88 = v88;
            v89 = v89;
            if (!v94) break;
            int v95 = 0;
            int v96 = v0 + v95;
            int v97 = 1;
            int v98 = v89 + v97;
            v88 = v96;
            v89 = v98;
            continue;
            ;
          }
          int v99 = 2;
          int v100 = v0 + v99;
          v85 = v88;
          break;
        }
        default:
          {
          int v101 = 4;
          int v102 = v3 % v101;
          int v103 = 4;
          int v104 = v0 + v103;
          int v105;
          v105 = v104;
          switch (v102) {
            default:
              {
              int v106 = 3;
              int v107 = v0 + v106;
              v105 = v107;
              break;
            }
            case 0:
              {
              v105 = v0;
              break;
            }
            case 1:
              {
              int v108 = 1;
              v105 = v108;
            }
            case 2:
              {
              int v109 = 1;
              int v110 = v0 + v109;
              v105 = v110;
              break;
            }
          }
          int v111 = 3;
          int v112 = v0 + v111;
          v85 = v105;
          break;
        }
        case 1:
          {
          int v113 = 0;
          bool v114 = v2 != v113;
          int v115;
          if (v114) {
            int v116 = 1;
            v115 = v116;
          } else {
            v115 = v0;
          }
          int v117 = 4;
          v85 = v115;
          break;
        }
      }
      int v118 = 2;
      v24 = v85;
      break;
    }
  }
  bool v119 = true;
  int v120 = simt_wave_count_bits(v119);
  int v121 = 16;
  int v122 = v121 + v0;
  v1[v122] = v120;
  int v123 = 0;
  bool v124 = v2 != v123;
  int v125 = v124 ? v6 : v24;
  return;
}

kernel void kernel_main(device int* v126 [[buffer(0)]], device int* v127 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v128 = static_cast<int>(__simt_tid3.x);
  int v129 = 0;
  int v130 = v129 + v128;
  int v131 = v127[v130];
  int v132 = 4;
  int v133 = v132 + v128;
  int v134 = v127[v133];
  helper0(v128, v126, v131, v134, static_cast<int>(__simt_tid3.x));
  int v135 = 8;
  int v136 = v135 + v128;
  int v137 = v127[v136];
  int v138 = 4;
  int v139;
  v139 = v138;
  switch (v137) {
    case 0:
      {
      int v140 = 12;
      int v141 = v140 + v128;
      int v142 = v127[v141];
      int v143 = 0;
      bool v144 = v142 != v143;
      int v145;
      if (v144) {
        int v146 = 16;
        int v147 = v146 + v128;
        int v148 = v127[v147];
        int v149 = 0;
        bool v150 = v148 != v149;
        int v151;
        if (v150) {
          int v152 = 1;
          v151 = v152;
        } else {
          int v153 = 1;
          v151 = v153;
        }
        v145 = v151;
      } else {
        int v154 = 20;
        int v155 = v154 + v128;
        int v156 = v127[v155];
        int v157 = 0;
        bool v158 = v156 != v157;
        int v159;
        if (v158) {
          v159 = v128;
        } else {
          int v160 = 3;
          v159 = v160;
        }
        v145 = v159;
      }
      v139 = v145;
      break;
    }
    case 1:
      {
      int v161 = 24;
      int v162 = v161 + v128;
      int v163 = v127[v162];
      int v164 = 0;
      bool v165 = v163 != v164;
      int v166;
      if (v165) {
        int v167 = 28;
        int v168 = v167 + v128;
        int v169 = v127[v168];
        int v170;
        v170 = v128;
        switch (v169) {
          default:
            {
            int v171 = 2;
            int v172 = v128 + v171;
            v170 = v172;
            break;
          }
          case 0:
            {
            int v173 = 1;
            v170 = v173;
            break;
          }
        }
        bool v174 = true;
        v166 = v170;
      } else {
        int v175 = 0;
        int v176 = 0;
        int v177;
        int v178;
        v177 = v175;
        v178 = v176;
        while (true) {
          int v179 = 4;
          int v180 = v178 * v179;
          int v181 = v180 + v128;
          int v182 = 32;
          int v183 = v182 + v181;
          int v184 = v127[v183];
          int v185 = 0;
          bool v186 = v184 != v185;
          v177 = v177;
          v178 = v178;
          if (!v186) break;
          int v187 = v177 + v178;
          int v188 = 1;
          int v189 = v178 + v188;
          v177 = v187;
          v178 = v189;
          break;
          ;
        }
        bool v190 = true;
        v166 = v177;
      }
      v139 = v166;
      break;
    }
    default:
      {
      int v191 = 52;
      int v192 = v191 + v128;
      int v193 = v127[v192];
      int v194;
      v194 = v128;
      switch (v193) {
        case 0:
          {
          int v195 = 56;
          int v196 = v195 + v128;
          int v197 = v127[v196];
          int v198;
          v198 = v128;
          switch (v197) {
            case 0:
              {
              int v199 = 3;
              v198 = v199;
              break;
            }
            default:
              {
              int v200 = 1;
              int v201 = v128 + v200;
              v198 = v201;
            }
            case 1:
              {
              int v202 = 3;
              v198 = v202;
              break;
            }
          }
          bool v203 = true;
          v194 = v198;
          break;
        }
        default:
          {
          int v204 = 60;
          int v205 = v204 + v128;
          int v206 = v127[v205];
          int v207;
          v207 = v128;
          switch (v206) {
            case 0:
              {
              int v208 = 0;
              int v209 = v128 + v208;
              v207 = v209;
              break;
            }
            case 1:
              {
              v207 = v128;
              break;
            }
            default:
              {
              v207 = v128;
              break;
            }
          }
          bool v210 = true;
          v194 = v207;
          break;
        }
      }
      bool v211 = true;
      v139 = v194;
      break;
    }
  }
  bool v212 = true;
  int v213 = 32;
  int v214 = v213 + v128;
  bool v215 = true;
  int v216 = simt_wave_count_bits(v215);
  v126[v214] = v216;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 64; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
