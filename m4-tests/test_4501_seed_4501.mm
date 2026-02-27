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
  bool v4 = true;
  int v5 = simt_wave_count_bits(v4);
  int v6 = 0;
  int v7 = v6 + v0;
  v1[v7] = v5;
  int v8 = 4;
  int v9 = v3 % v8;
  int v10 = 3;
  int v11;
  v11 = v10;
  switch (v9) {
    case 0:
      {
      int v12 = 3;
      int v13 = v3 % v12;
      int v14 = 4;
      int v15 = v0 + v14;
      int v16;
      v16 = v15;
      switch (v13) {
        default:
          {
          int v17 = 3;
          int v18 = v3 % v17;
          int v19;
          v19 = v0;
          switch (v18) {
            case 0:
              {
              int v20 = 4;
              int v21 = v0 + v20;
              v19 = v21;
              break;
            }
            case 1:
              {
              int v22 = 2;
              v19 = v22;
              break;
            }
            default:
              {
              int v23 = 1;
              int v24 = v0 + v23;
              v19 = v24;
              break;
            }
          }
          v16 = v19;
          break;
        }
        case 0:
          {
          int v25 = 2;
          int v26 = v3 % v25;
          int v27;
          v27 = v0;
          switch (v26) {
            default:
              {
              int v28 = 1;
              int v29 = v0 + v28;
              v27 = v29;
              break;
            }
            case 0:
              {
              int v30 = 4;
              int v31 = v0 + v30;
              v27 = v31;
            }
            case 1:
              {
              v27 = v0;
              break;
            }
          }
          v16 = v27;
          break;
        }
        case 1:
          {
          int v32 = 2;
          int v33 = v3 % v32;
          int v34 = 4;
          int v35 = v0 + v34;
          int v36;
          v36 = v35;
          switch (v33) {
            case 0:
              {
              v36 = v0;
              break;
            }
            default:
              {
              int v37 = 3;
              v36 = v37;
              break;
            }
            case 1:
              {
              int v38 = 2;
              v36 = v38;
              break;
            }
          }
          v16 = v36;
          break;
        }
      }
      v11 = v16;
    }
    case 1:
      {
      int v39 = 0;
      bool v40 = v2 != v39;
      int v41;
      if (v40) {
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
          int v51 = 4;
          int v52 = v0 + v51;
          int v53 = 1;
          int v54 = v45 + v53;
          v44 = v52;
          v45 = v54;
        }
        v41 = v44;
      } else {
        int v55 = 2;
        int v56 = v3 % v55;
        int v57 = 1;
        int v58 = v0 + v57;
        int v59;
        v59 = v58;
        switch (v56) {
          case 0:
            {
            int v60 = 3;
            int v61 = v0 + v60;
            v59 = v61;
          }
          default:
            {
            int v62 = 3;
            v59 = v62;
            break;
          }
        }
        v41 = v59;
      }
      v11 = v41;
    }
    default:
      {
      int v63 = 0;
      int v64 = 0;
      int v65;
      int v66;
      v65 = v63;
      v66 = v64;
      while (true) {
        int v67 = 4;
        int v68 = v3 % v67;
        int v69 = 1;
        int v70 = v68 + v69;
        bool v71 = v66 < v70;
        v65 = v65;
        v66 = v66;
        if (!v71) break;
        int v72 = 0;
        bool v73 = v2 != v72;
        int v74;
        if (v73) {
          v74 = v0;
        } else {
          v74 = v0;
        }
        int v75 = 1;
        int v76 = v66 + v75;
        v65 = v74;
        v66 = v76;
        continue;
        ;
      }
      v11 = v65;
      break;
    }
    case 2:
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
        int v86 = 4;
        int v87 = v0 + v86;
        int v88 = 1;
        int v89 = v80 + v88;
        v79 = v87;
        v80 = v89;
      }
      v11 = v79;
      break;
    }
  }
  int v90 = 0;
  bool v91 = v2 != v90;
  int v92 = v91 ? v5 : v11;
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
  int v105 = 4;
  int v106 = v95 + v105;
  int v107;
  v107 = v106;
  switch (v104) {
    default:
      {
      int v108 = 0;
      int v109 = 0;
      int v110;
      int v111;
      v110 = v108;
      v111 = v109;
      while (true) {
        int v112 = 4;
        int v113 = v111 * v112;
        int v114 = v113 + v95;
        int v115 = 12;
        int v116 = v115 + v114;
        int v117 = v94[v116];
        int v118 = 0;
        bool v119 = v117 != v118;
        v110 = v110;
        v111 = v111;
        if (!v119) break;
        int v120 = v110 + v111;
        int v121 = 1;
        int v122 = v111 + v121;
        bool v123 = true;
        v110 = v120;
        v111 = v122;
      }
      v107 = v110;
      break;
    }
    case 0:
      {
      int v124 = 32;
      int v125 = v124 + v95;
      int v126 = v94[v125];
      int v127 = 0;
      bool v128 = v126 != v127;
      int v129;
      if (v128) {
        int v130 = 1;
        v129 = v130;
      } else {
        int v131 = 36;
        int v132 = v131 + v95;
        int v133 = v94[v132];
        int v134 = 1;
        int v135;
        v135 = v134;
        switch (v133) {
          case 0:
            {
            int v136 = 3;
            int v137 = v95 + v136;
            v135 = v137;
            break;
          }
          default:
            {
            int v138 = 2;
            v135 = v138;
            break;
          }
        }
        v129 = v135;
      }
      v107 = v129;
      break;
    }
  }
  int v139 = 40;
  int v140 = v139 + v95;
  int v141 = v94[v140];
  uint v142 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v143 = (int)(v142);
  int v144;
  v144 = v143;
  switch (v141) {
    default:
      {
      int v145 = 44;
      int v146 = v145 + v95;
      int v147 = v94[v146];
      int v148 = 0;
      bool v149 = v147 != v148;
      int v150;
      if (v149) {
        int v151 = 48;
        int v152 = v151 + v95;
        int v153 = v94[v152];
        int v154 = 0;
        bool v155 = v153 != v154;
        int v156;
        if (v155) {
          v156 = v95;
        } else {
          int v157 = 3;
          int v158 = v95 + v157;
          v156 = v158;
        }
        v150 = v156;
      } else {
        int v159 = 52;
        int v160 = v159 + v95;
        int v161 = v94[v160];
        int v162;
        v162 = v95;
        switch (v161) {
          case 0:
            {
            int v163 = 2;
            v162 = v163;
            break;
          }
          default:
            {
            v162 = v95;
            break;
          }
          case 1:
            {
            int v164 = 2;
            v162 = v164;
            break;
          }
          case 2:
            {
            int v165 = 3;
            v162 = v165;
            break;
          }
        }
        bool v166 = true;
        v150 = v162;
      }
      v144 = v150;
      break;
    }
    case 0:
      {
      int v167 = 56;
      int v168 = v167 + v95;
      int v169 = v94[v168];
      int v170 = 0;
      int v171;
      v171 = v170;
      switch (v169) {
        case 0:
          {
          v171 = v95;
          break;
        }
        case 1:
          {
          int v172 = 60;
          int v173 = v172 + v95;
          int v174 = v94[v173];
          int v175 = 3;
          int v176 = v95 + v175;
          int v177;
          v177 = v176;
          switch (v174) {
            case 0:
              {
              int v178 = 3;
              int v179 = v95 + v178;
              v177 = v179;
            }
            case 1:
              {
              int v180 = 1;
              v177 = v180;
            }
            default:
              {
              v177 = v95;
              break;
            }
            case 2:
              {
              int v181 = 3;
              v177 = v181;
              break;
            }
          }
          bool v182 = true;
          v171 = v177;
          break;
        }
        default:
          {
          int v183 = 64;
          int v184 = v183 + v95;
          int v185 = v94[v184];
          int v186 = 0;
          bool v187 = v185 != v186;
          int v188;
          if (v187) {
            int v189 = 0;
            int v190 = v95 + v189;
            v188 = v190;
          } else {
            int v191 = 0;
            v188 = v191;
          }
          v171 = v188;
          break;
        }
      }
      v144 = v171;
      break;
    }
    case 1:
      {
      int v192 = 68;
      int v193 = v192 + v95;
      int v194 = v94[v193];
      int v195;
      v195 = v95;
      switch (v194) {
        case 0:
          {
          int v196 = 72;
          int v197 = v196 + v95;
          int v198 = v94[v197];
          int v199 = 3;
          int v200 = v95 + v199;
          int v201;
          v201 = v200;
          switch (v198) {
            default:
              {
              int v202 = 2;
              int v203 = v95 + v202;
              v201 = v203;
              break;
            }
            case 0:
              {
              int v204 = 1;
              int v205 = v95 + v204;
              v201 = v205;
              break;
            }
            case 1:
              {
              int v206 = 1;
              int v207 = v95 + v206;
              v201 = v207;
              break;
            }
            case 2:
              {
              int v208 = 3;
              int v209 = v95 + v208;
              v201 = v209;
              break;
            }
          }
          v195 = v201;
        }
        default:
          {
          int v210 = 3;
          v195 = v210;
          break;
        }
      }
      v144 = v195;
      break;
    }
    case 2:
      {
      int v211 = 76;
      int v212 = v211 + v95;
      int v213 = v94[v212];
      int v214 = 4;
      int v215 = v95 + v214;
      int v216;
      v216 = v215;
      switch (v213) {
        default:
          {
          int v217 = 80;
          int v218 = v217 + v95;
          int v219 = v94[v218];
          int v220 = 0;
          bool v221 = v219 != v220;
          int v222;
          if (v221) {
            int v223 = 3;
            v222 = v223;
          } else {
            int v224 = 4;
            v222 = v224;
          }
          v216 = v222;
          break;
        }
        case 0:
          {
          int v225 = 84;
          int v226 = v225 + v95;
          int v227 = v94[v226];
          int v228 = 2;
          int v229 = v95 + v228;
          int v230;
          v230 = v229;
          switch (v227) {
            case 0:
              {
              int v231 = 3;
              v230 = v231;
              break;
            }
            default:
              {
              int v232 = 1;
              int v233 = v95 + v232;
              v230 = v233;
              break;
            }
          }
          v216 = v230;
          break;
        }
        case 1:
          {
          int v234 = 88;
          int v235 = v234 + v95;
          int v236 = v94[v235];
          int v237;
          v237 = v95;
          switch (v236) {
            default:
              {
              int v238 = 0;
              v237 = v238;
              break;
            }
            case 0:
              {
              int v239 = 0;
              int v240 = v95 + v239;
              v237 = v240;
              break;
            }
            case 1:
              {
              int v241 = 3;
              int v242 = v95 + v241;
              v237 = v242;
              break;
            }
            case 2:
              {
              int v243 = 1;
              int v244 = v95 + v243;
              v237 = v244;
              break;
            }
          }
          v216 = v237;
          break;
        }
      }
      v144 = v216;
      break;
    }
  }
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 4; ++idx) {
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
