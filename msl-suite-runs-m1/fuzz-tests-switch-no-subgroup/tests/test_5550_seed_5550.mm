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
    int v13 = 2;
    int v14 = v3 % v13;
    int v15 = 4;
    int v16 = v0 + v15;
    int v17;
    v17 = v16;
    switch (v14) {
      case 0:
        {
        int v18 = 3;
        int v19 = v3 % v18;
        int v20 = 1;
        int v21;
        v21 = v20;
        switch (v19) {
          case 0:
            {
            int v22 = 3;
            int v23 = v0 + v22;
            v21 = v23;
            break;
          }
          default:
            {
            v21 = v0;
            break;
          }
          case 1:
            {
            int v24 = 1;
            int v25 = v0 + v24;
            v21 = v25;
            break;
          }
        }
        v17 = v21;
        break;
      }
      case 1:
        {
        int v26 = 0;
        bool v27 = v2 != v26;
        int v28;
        if (v27) {
          int v29 = 4;
          v28 = v29;
        } else {
          int v30 = 1;
          int v31 = v0 + v30;
          v28 = v31;
        }
        v17 = v28;
        break;
      }
      default:
        {
        int v32 = 2;
        int v33 = v3 % v32;
        int v34 = 2;
        int v35;
        v35 = v34;
        switch (v33) {
          case 0:
            {
            int v36 = 4;
            v35 = v36;
          }
          default:
            {
            int v37 = 4;
            int v38 = v0 + v37;
            v35 = v38;
            break;
          }
        }
        v17 = v35;
        break;
      }
    }
    int v39 = 1;
    int v40 = v7 + v39;
    v6 = v17;
    v7 = v40;
  }
  bool v41 = true;
  int v42 = simt_wave_count_bits(v41);
  int v43 = 0;
  int v44 = v43 + v0;
  v1[v44] = v42;
  return;
}

kernel void kernel_main(device int* v45 [[buffer(0)]], device int* v46 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v47 = static_cast<int>(__simt_tid3.x);
  int v48 = 0;
  int v49 = v48 + v47;
  int v50 = v46[v49];
  int v51 = 4;
  int v52 = v51 + v47;
  int v53 = v46[v52];
  helper0(v47, v45, v50, v53, static_cast<int>(__simt_tid3.x));
  int v54 = 8;
  int v55 = v54 + v47;
  int v56 = v46[v55];
  int v57 = 0;
  int v58 = v47 + v57;
  int v59;
  v59 = v58;
  switch (v56) {
    case 0:
      {
      int v60 = 12;
      int v61 = v60 + v47;
      int v62 = v46[v61];
      int v63 = 1;
      int v64;
      v64 = v63;
      switch (v62) {
        default:
          {
          int v65 = 16;
          int v66 = v65 + v47;
          int v67 = v46[v66];
          int v68;
          v68 = v47;
          switch (v67) {
            default:
              {
              v68 = v47;
              break;
            }
            case 0:
              {
              int v69 = 3;
              int v70 = v47 + v69;
              v68 = v70;
              break;
            }
          }
          v64 = v68;
        }
        case 0:
          {
          v64 = v47;
        }
        case 1:
          {
          int v71 = 0;
          int v72 = v47 + v71;
          v64 = v72;
        }
        case 2:
          {
          int v73 = 20;
          int v74 = v73 + v47;
          int v75 = v46[v74];
          int v76;
          v76 = v47;
          switch (v75) {
            case 0:
              {
              v76 = v47;
              break;
            }
            case 1:
              {
              int v77 = 4;
              v76 = v77;
              break;
            }
            case 2:
              {
              v76 = v47;
              break;
            }
            default:
              {
              int v78 = 0;
              v76 = v78;
              break;
            }
          }
          bool v79 = true;
          v64 = v76;
          break;
        }
      }
      bool v80 = true;
      v59 = v64;
    }
    default:
      {
      int v81 = 0;
      int v82 = 0;
      int v83;
      int v84;
      v83 = v81;
      v84 = v82;
      while (true) {
        int v85 = 4;
        int v86 = v84 * v85;
        int v87 = v86 + v47;
        int v88 = 24;
        int v89 = v88 + v87;
        int v90 = v46[v89];
        int v91 = 0;
        bool v92 = v90 != v91;
        v83 = v83;
        v84 = v84;
        if (!v92) break;
        int v93 = v83 + v84;
        int v94 = 1;
        int v95 = v84 + v94;
        bool v96 = true;
        v83 = v93;
        v84 = v95;
        break;
        ;
      }
      v59 = v83;
    }
    case 1:
      {
      int v97 = 44;
      int v98 = v97 + v47;
      int v99 = v46[v98];
      int v100 = 0;
      bool v101 = v99 != v100;
      int v102;
      if (v101) {
        int v103 = 0;
        int v104 = v47 + v103;
        v102 = v104;
      } else {
        int v105 = 48;
        int v106 = v105 + v47;
        int v107 = v46[v106];
        int v108 = 0;
        bool v109 = v107 != v108;
        int v110;
        if (v109) {
          int v111 = 2;
          v110 = v111;
        } else {
          int v112 = 1;
          int v113 = v47 + v112;
          v110 = v113;
        }
        v102 = v110;
      }
      v59 = v102;
      break;
    }
  }
  int v114 = 52;
  int v115 = v114 + v47;
  int v116 = v46[v115];
  int v117;
  v117 = v47;
  switch (v116) {
    default:
      {
      int v118 = 56;
      int v119 = v118 + v47;
      int v120 = v46[v119];
      int v121;
      v121 = v47;
      switch (v120) {
        case 0:
          {
          int v122 = 60;
          int v123 = v122 + v47;
          int v124 = v46[v123];
          int v125 = 1;
          int v126 = v47 + v125;
          int v127;
          v127 = v126;
          switch (v124) {
            case 0:
              {
              int v128 = 0;
              v127 = v128;
              break;
            }
            default:
              {
              v127 = v47;
              break;
            }
            case 1:
              {
              int v129 = 4;
              v127 = v129;
              break;
            }
            case 2:
              {
              int v130 = 4;
              v127 = v130;
              break;
            }
          }
          bool v131 = true;
          v121 = v127;
        }
        case 1:
          {
          int v132 = 64;
          int v133 = v132 + v47;
          int v134 = v46[v133];
          int v135;
          v135 = v47;
          switch (v134) {
            case 0:
              {
              int v136 = 3;
              v135 = v136;
              break;
            }
            case 1:
              {
              int v137 = 4;
              int v138 = v47 + v137;
              v135 = v138;
              break;
            }
            default:
              {
              v135 = v47;
              break;
            }
            case 2:
              {
              int v139 = 3;
              int v140 = v47 + v139;
              v135 = v140;
              break;
            }
          }
          v121 = v135;
          break;
        }
        default:
          {
          v121 = v47;
          break;
        }
      }
      v117 = v121;
    }
    case 0:
      {
      int v141 = 68;
      int v142 = v141 + v47;
      int v143 = v46[v142];
      int v144 = 0;
      int v145;
      v145 = v144;
      switch (v143) {
        default:
          {
          int v146 = 1;
          int v147 = v47 + v146;
          v145 = v147;
          break;
        }
        case 0:
          {
          int v148 = 72;
          int v149 = v148 + v47;
          int v150 = v46[v149];
          int v151;
          v151 = v47;
          switch (v150) {
            case 0:
              {
              int v152 = 1;
              v151 = v152;
              break;
            }
            default:
              {
              int v153 = 1;
              v151 = v153;
              break;
            }
            case 1:
              {
              int v154 = 0;
              int v155 = v47 + v154;
              v151 = v155;
              break;
            }
            case 2:
              {
              int v156 = 2;
              v151 = v156;
              break;
            }
          }
          v145 = v151;
          break;
        }
        case 1:
          {
          int v157 = 76;
          int v158 = v157 + v47;
          int v159 = v46[v158];
          int v160 = 0;
          bool v161 = v159 != v160;
          int v162;
          if (v161) {
            v162 = v47;
          } else {
            int v163 = 3;
            int v164 = v47 + v163;
            v162 = v164;
          }
          v145 = v162;
          break;
        }
        case 2:
          {
          v145 = v47;
          break;
        }
      }
      bool v165 = true;
      v117 = v145;
    }
    case 1:
      {
      int v166 = 3;
      v117 = v166;
      break;
    }
  }
  int v167 = 80;
  int v168 = v167 + v47;
  int v169 = v46[v168];
  uint v170 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v171 = (int)(v170);
  int v172;
  v172 = v171;
  switch (v169) {
    case 0:
      {
      int v173 = 84;
      int v174 = v173 + v47;
      int v175 = v46[v174];
      int v176 = 0;
      int v177 = v47 + v176;
      int v178;
      v178 = v177;
      switch (v175) {
        case 0:
          {
          int v179 = 88;
          int v180 = v179 + v47;
          int v181 = v46[v180];
          int v182 = 2;
          int v183 = v47 + v182;
          int v184;
          v184 = v183;
          switch (v181) {
            default:
              {
              int v185 = 3;
              int v186 = v47 + v185;
              v184 = v186;
              break;
            }
            case 0:
              {
              int v187 = 2;
              int v188 = v47 + v187;
              v184 = v188;
              break;
            }
          }
          v178 = v184;
          break;
        }
        default:
          {
          int v189 = 92;
          int v190 = v189 + v47;
          int v191 = v46[v190];
          int v192 = 0;
          int v193;
          v193 = v192;
          switch (v191) {
            default:
              {
              int v194 = 2;
              v193 = v194;
            }
            case 0:
              {
              int v195 = 1;
              int v196 = v47 + v195;
              v193 = v196;
            }
            case 1:
              {
              int v197 = 2;
              v193 = v197;
            }
            case 2:
              {
              v193 = v47;
              break;
            }
          }
          v178 = v193;
          break;
        }
        case 1:
          {
          int v198 = 1;
          v178 = v198;
          break;
        }
      }
      bool v199 = true;
      v172 = v178;
      break;
    }
    default:
      {
      int v200 = 0;
      int v201 = 0;
      int v202;
      int v203;
      v202 = v200;
      v203 = v201;
      while (true) {
        int v204 = 4;
        int v205 = v203 * v204;
        int v206 = v205 + v47;
        int v207 = 96;
        int v208 = v207 + v206;
        int v209 = v46[v208];
        int v210 = 0;
        bool v211 = v209 != v210;
        v202 = v202;
        v203 = v203;
        if (!v211) break;
        int v212 = v202 + v203;
        int v213 = 1;
        int v214 = v203 + v213;
        bool v215 = true;
        v202 = v212;
        v203 = v214;
        continue;
        ;
      }
      v172 = v202;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 116; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
