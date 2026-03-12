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
  int v6 = 1;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 2;
      int v10 = v3 % v9;
      int v11 = 3;
      int v12 = v0 + v11;
      int v13;
      v13 = v12;
      switch (v10) {
        case 0:
          {
          int v14 = 3;
          int v15 = v3 % v14;
          int v16;
          v16 = v0;
          switch (v15) {
            case 0:
              {
              int v17 = 3;
              int v18 = v0 + v17;
              v16 = v18;
              break;
            }
            case 1:
              {
              v16 = v0;
              break;
            }
            default:
              {
              int v19 = 2;
              v16 = v19;
              break;
            }
          }
          int v20 = 2;
          v13 = v16;
        }
        case 1:
          {
          int v21;
          v21 = v0;
          switch (v3) {
            case 0:
              {
              v21 = v0;
              break;
            }
            default:
              {
              int v22 = 0;
              v21 = v22;
              break;
            }
          }
          v13 = v21;
        }
        default:
          {
          int v23 = 0;
          bool v24 = v2 != v23;
          int v25;
          if (v24) {
            v25 = v0;
          } else {
            int v26 = 2;
            int v27 = v0 + v26;
            v25 = v27;
          }
          int v28 = 3;
          int v29 = v0 + v28;
          v13 = v25;
          break;
        }
      }
      v8 = v13;
      break;
    }
    case 0:
      {
      int v30 = 0;
      bool v31 = v2 != v30;
      int v32;
      if (v31) {
        int v33 = 0;
        int v34 = 0;
        int v35;
        int v36;
        v35 = v33;
        v36 = v34;
        while (true) {
          int v37 = 4;
          int v38 = v3 % v37;
          int v39 = 1;
          int v40 = v38 + v39;
          bool v41 = v36 < v40;
          v35 = v35;
          v36 = v36;
          if (!v41) break;
          int v42 = 1;
          int v43 = 1;
          int v44 = v36 + v43;
          v35 = v42;
          v36 = v44;
          break;
          ;
        }
        int v45 = 2;
        int v46 = v0 + v45;
        v32 = v35;
      } else {
        int v47 = 0;
        bool v48 = v2 != v47;
        int v49;
        if (v48) {
          v49 = v0;
        } else {
          int v50 = 3;
          int v51 = v0 + v50;
          v49 = v51;
        }
        int v52 = 0;
        v32 = v49;
      }
      int v53 = 3;
      int v54 = v0 + v53;
      v8 = v32;
      break;
    }
    case 1:
      {
      int v55 = 0;
      bool v56 = v2 != v55;
      int v57;
      if (v56) {
        int v58 = 0;
        int v59 = 0;
        int v60;
        int v61;
        v60 = v58;
        v61 = v59;
        while (true) {
          int v62 = 4;
          int v63 = v3 % v62;
          int v64 = 1;
          int v65 = v63 + v64;
          bool v66 = v61 < v65;
          v60 = v60;
          v61 = v61;
          if (!v66) break;
          int v67 = 4;
          int v68 = 1;
          int v69 = v61 + v68;
          v60 = v67;
          v61 = v69;
        }
        v57 = v60;
      } else {
        int v70 = 4;
        int v71 = v3 % v70;
        int v72 = 0;
        int v73;
        v73 = v72;
        switch (v71) {
          case 0:
            {
            int v74 = 2;
            v73 = v74;
            break;
          }
          case 1:
            {
            int v75 = 3;
            v73 = v75;
            break;
          }
          default:
            {
            int v76 = 3;
            v73 = v76;
            break;
          }
          case 2:
            {
            int v77 = 0;
            v73 = v77;
            break;
          }
        }
        v57 = v73;
      }
      int v78 = 3;
      v8 = v57;
      break;
    }
    case 2:
      {
      int v79 = 0;
      int v80 = 0;
      int v81;
      int v82;
      v81 = v79;
      v82 = v80;
      while (true) {
        int v83 = 4;
        int v84 = v3 % v83;
        int v85 = 1;
        int v86 = v84 + v85;
        bool v87 = v82 < v86;
        v81 = v81;
        v82 = v82;
        if (!v87) break;
        int v88 = 0;
        bool v89 = v2 != v88;
        int v90;
        if (v89) {
          int v91 = 1;
          int v92 = v0 + v91;
          v90 = v92;
        } else {
          int v93 = 1;
          int v94 = v0 + v93;
          v90 = v94;
        }
        int v95 = 1;
        int v96 = v82 + v95;
        v81 = v90;
        v82 = v96;
      }
      int v97 = 4;
      v8 = v81;
      break;
    }
  }
  bool v98 = true;
  int v99 = simt_wave_count_bits(v98);
  int v100 = 0;
  int v101 = v100 + v0;
  v1[v101] = v99;
  return;
}

kernel void kernel_main(device int* v102 [[buffer(0)]], device int* v103 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v104 = static_cast<int>(__simt_tid3.x);
  int v105 = 0;
  int v106 = v105 + v104;
  int v107 = v103[v106];
  int v108 = 4;
  int v109 = v108 + v104;
  int v110 = v103[v109];
  helper0(v104, v102, v107, v110, static_cast<int>(__simt_tid3.x));
  int v111 = 8;
  int v112 = v111 + v104;
  int v113 = v103[v112];
  uint v114 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v115 = (int)(v114);
  int v116;
  v116 = v115;
  switch (v113) {
    case 0:
      {
      int v117 = 12;
      int v118 = v117 + v104;
      int v119 = v103[v118];
      int v120 = 0;
      bool v121 = v119 != v120;
      int v122;
      if (v121) {
        int v123 = 16;
        int v124 = v123 + v104;
        int v125 = v103[v124];
        int v126 = 0;
        int v127;
        v127 = v126;
        switch (v125) {
          case 0:
            {
            v127 = v104;
            break;
          }
          default:
            {
            int v128 = 1;
            int v129 = v104 + v128;
            v127 = v129;
            break;
          }
        }
        bool v130 = true;
        v122 = v127;
      } else {
        int v131 = 20;
        int v132 = v131 + v104;
        int v133 = v103[v132];
        int v134 = 2;
        int v135 = v104 + v134;
        int v136;
        v136 = v135;
        switch (v133) {
          case 0:
            {
            int v137 = 1;
            v136 = v137;
            break;
          }
          case 1:
            {
            int v138 = 2;
            int v139 = v104 + v138;
            v136 = v139;
            break;
          }
          default:
            {
            v136 = v104;
            break;
          }
        }
        bool v140 = true;
        v122 = v136;
      }
      v116 = v122;
      break;
    }
    case 1:
      {
      int v141 = 24;
      int v142 = v141 + v104;
      int v143 = v103[v142];
      int v144;
      v144 = v104;
      switch (v143) {
        default:
          {
          int v145 = 0;
          int v146 = 0;
          int v147;
          int v148;
          v147 = v145;
          v148 = v146;
          while (true) {
            int v149 = 4;
            int v150 = v148 * v149;
            int v151 = v150 + v104;
            int v152 = 28;
            int v153 = v152 + v151;
            int v154 = v103[v153];
            int v155 = 0;
            bool v156 = v154 != v155;
            v147 = v147;
            v148 = v148;
            if (!v156) break;
            int v157 = v147 + v148;
            int v158 = 1;
            int v159 = v148 + v158;
            v147 = v157;
            v148 = v159;
          }
          bool v160 = true;
          v144 = v147;
          break;
        }
        case 0:
          {
          int v161 = 48;
          int v162 = v161 + v104;
          int v163 = v103[v162];
          int v164 = 0;
          bool v165 = v163 != v164;
          int v166;
          if (v165) {
            int v167 = 3;
            v166 = v167;
          } else {
            int v168 = 3;
            v166 = v168;
          }
          v144 = v166;
          break;
        }
        case 1:
          {
          int v169 = 2;
          int v170 = v104 + v169;
          v144 = v170;
          break;
        }
        case 2:
          {
          int v171 = 52;
          int v172 = v171 + v104;
          int v173 = v103[v172];
          int v174 = 0;
          bool v175 = v173 != v174;
          int v176;
          if (v175) {
            v176 = v104;
          } else {
            v176 = v104;
          }
          v144 = v176;
          break;
        }
      }
      bool v177 = true;
      v116 = v144;
      break;
    }
    case 2:
      {
      int v178 = 56;
      int v179 = v178 + v104;
      int v180 = v103[v179];
      int v181 = 0;
      bool v182 = v180 != v181;
      int v183;
      if (v182) {
        int v184 = 60;
        int v185 = v184 + v104;
        int v186 = v103[v185];
        int v187 = 0;
        bool v188 = v186 != v187;
        int v189;
        if (v188) {
          int v190 = 3;
          int v191 = v104 + v190;
          v189 = v191;
        } else {
          v189 = v104;
        }
        v183 = v189;
      } else {
        int v192 = 0;
        int v193 = 0;
        int v194;
        int v195;
        v194 = v192;
        v195 = v193;
        while (true) {
          int v196 = 4;
          int v197 = v195 * v196;
          int v198 = v197 + v104;
          int v199 = 64;
          int v200 = v199 + v198;
          int v201 = v103[v200];
          int v202 = 0;
          bool v203 = v201 != v202;
          v194 = v194;
          v195 = v195;
          if (!v203) break;
          int v204 = v194 + v195;
          int v205 = 1;
          int v206 = v195 + v205;
          v194 = v204;
          v195 = v206;
        }
        bool v207 = true;
        v183 = v194;
      }
      v116 = v183;
    }
    default:
      {
      int v208 = 84;
      int v209 = v208 + v104;
      int v210 = v103[v209];
      int v211;
      v211 = v104;
      switch (v210) {
        case 0:
          {
          int v212 = 88;
          int v213 = v212 + v104;
          int v214 = v103[v213];
          int v215 = 0;
          bool v216 = v214 != v215;
          int v217;
          if (v216) {
            int v218 = 4;
            int v219 = v104 + v218;
            v217 = v219;
          } else {
            v217 = v104;
          }
          v211 = v217;
        }
        case 1:
          {
          int v220 = 2;
          v211 = v220;
          break;
        }
        default:
          {
          v211 = v104;
          break;
        }
      }
      bool v221 = true;
      v116 = v211;
      break;
    }
  }
  bool v222 = true;
  int v223 = 16;
  int v224 = v223 + v104;
  bool v225 = true;
  int v226 = simt_wave_count_bits(v225);
  v102[v224] = v226;
  int v227 = 3;
  int v228 = v104 + v227;
  int v229 = 3;
  int v230 = v104 + v229;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 92; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
