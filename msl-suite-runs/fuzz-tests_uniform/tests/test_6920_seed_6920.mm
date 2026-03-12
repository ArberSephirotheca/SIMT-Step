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
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 2;
      int v10 = v3 % v9;
      int v11 = 4;
      int v12 = v0 + v11;
      int v13;
      v13 = v12;
      switch (v10) {
        default:
          {
          int v14 = 3;
          int v15 = v3 % v14;
          int v16;
          v16 = v0;
          switch (v15) {
            case 0:
              {
              v16 = v0;
              break;
            }
            default:
              {
              v16 = v0;
              break;
            }
            case 1:
              {
              v16 = v0;
              break;
            }
          }
          v13 = v16;
          break;
        }
        case 0:
          {
          int v17 = 0;
          bool v18 = v2 != v17;
          int v19;
          if (v18) {
            int v20 = 0;
            int v21 = v0 + v20;
            v19 = v21;
          } else {
            int v22 = 0;
            int v23 = v0 + v22;
            v19 = v23;
          }
          v13 = v19;
          break;
        }
      }
      int v24 = 3;
      int v25 = v0 + v24;
      v8 = v13;
      break;
    }
    case 1:
      {
      int v26 = 2;
      int v27 = v3 % v26;
      int v28 = 1;
      int v29 = v0 + v28;
      int v30;
      v30 = v29;
      switch (v27) {
        default:
          {
          int v31 = 0;
          bool v32 = v2 != v31;
          int v33;
          if (v32) {
            int v34 = 2;
            int v35 = v0 + v34;
            v33 = v35;
          } else {
            int v36 = 4;
            int v37 = v0 + v36;
            v33 = v37;
          }
          int v38 = 0;
          v30 = v33;
        }
        case 0:
          {
          int v39 = 4;
          int v40 = v3 % v39;
          int v41 = 1;
          int v42;
          v42 = v41;
          switch (v40) {
            case 0:
              {
              int v43 = 0;
              v42 = v43;
            }
            default:
              {
              int v44 = 3;
              int v45 = v0 + v44;
              v42 = v45;
            }
            case 1:
              {
              int v46 = 0;
              int v47 = v0 + v46;
              v42 = v47;
              break;
            }
            case 2:
              {
              int v48 = 4;
              int v49 = v0 + v48;
              v42 = v49;
              break;
            }
          }
          v30 = v42;
          break;
        }
        case 1:
          {
          int v50 = 0;
          bool v51 = v2 != v50;
          int v52;
          if (v51) {
            v52 = v0;
          } else {
            int v53 = 3;
            v52 = v53;
          }
          int v54 = 2;
          v30 = v52;
          break;
        }
      }
      int v55 = 2;
      int v56 = v0 + v55;
      v8 = v30;
      break;
    }
    default:
      {
      int v57 = 0;
      int v58 = 0;
      int v59;
      int v60;
      v59 = v57;
      v60 = v58;
      while (true) {
        int v61 = 4;
        int v62 = v3 % v61;
        int v63 = 1;
        int v64 = v62 + v63;
        bool v65 = v60 < v64;
        v59 = v59;
        v60 = v60;
        if (!v65) break;
        int v66 = 3;
        int v67 = 1;
        int v68 = v60 + v67;
        v59 = v66;
        v60 = v68;
        break;
        ;
      }
      int v69 = 3;
      v8 = v59;
      break;
    }
    case 2:
      {
      int v70 = 4;
      int v71;
      v71 = v70;
      switch (v3) {
        case 0:
          {
          int v72 = 0;
          bool v73 = v2 != v72;
          int v74;
          if (v73) {
            int v75 = 2;
            int v76 = v0 + v75;
            v74 = v76;
          } else {
            int v77 = 1;
            v74 = v77;
          }
          int v78 = 3;
          int v79 = v0 + v78;
          v71 = v74;
          break;
        }
        default:
          {
          int v80 = 3;
          int v81 = v3 % v80;
          int v82 = 2;
          int v83 = v0 + v82;
          int v84;
          v84 = v83;
          switch (v81) {
            default:
              {
              int v85 = 4;
              int v86 = v0 + v85;
              v84 = v86;
              break;
            }
            case 0:
              {
              int v87 = 2;
              v84 = v87;
              break;
            }
            case 1:
              {
              int v88 = 4;
              v84 = v88;
              break;
            }
          }
          int v89 = 0;
          v71 = v84;
          break;
        }
      }
      v8 = v71;
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
  int v106 = 1;
  int v107 = v96 + v106;
  int v108;
  v108 = v107;
  switch (v105) {
    case 0:
      {
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
        bool v119 = v117 != v118;
        int v120;
        if (v119) {
          int v121 = 4;
          int v122 = v96 + v121;
          v120 = v122;
        } else {
          int v123 = 3;
          int v124 = v96 + v123;
          v120 = v124;
        }
        v114 = v120;
      } else {
        int v125 = 20;
        int v126 = v125 + v96;
        int v127 = v95[v126];
        int v128 = 0;
        bool v129 = v127 != v128;
        int v130;
        if (v129) {
          int v131 = 2;
          int v132 = v96 + v131;
          v130 = v132;
        } else {
          int v133 = 4;
          int v134 = v96 + v133;
          v130 = v134;
        }
        v114 = v130;
      }
      v108 = v114;
      break;
    }
    default:
      {
      int v135 = 24;
      int v136 = v135 + v96;
      int v137 = v95[v136];
      int v138 = 0;
      bool v139 = v137 != v138;
      int v140;
      if (v139) {
        int v141 = 0;
        int v142 = 0;
        int v143;
        int v144;
        v143 = v141;
        v144 = v142;
        while (true) {
          int v145 = 4;
          int v146 = v144 * v145;
          int v147 = v146 + v96;
          int v148 = 28;
          int v149 = v148 + v147;
          int v150 = v95[v149];
          int v151 = 0;
          bool v152 = v150 != v151;
          v143 = v143;
          v144 = v144;
          if (!v152) break;
          int v153 = v143 + v144;
          int v154 = 1;
          int v155 = v144 + v154;
          v143 = v153;
          v144 = v155;
        }
        bool v156 = true;
        v140 = v143;
      } else {
        int v157 = 48;
        int v158 = v157 + v96;
        int v159 = v95[v158];
        int v160;
        v160 = v96;
        switch (v159) {
          case 0:
            {
            int v161 = 4;
            v160 = v161;
            break;
          }
          default:
            {
            int v162 = 3;
            v160 = v162;
            break;
          }
          case 1:
            {
            int v163 = 1;
            v160 = v163;
            break;
          }
          case 2:
            {
            int v164 = 4;
            int v165 = v96 + v164;
            v160 = v165;
            break;
          }
        }
        bool v166 = true;
        v140 = v160;
      }
      v108 = v140;
      break;
    }
  }
  bool v167 = true;
  int v168 = 16;
  int v169 = v168 + v96;
  bool v170 = true;
  int v171 = simt_wave_count_bits(v170);
  v94[v169] = v171;
  int v172 = 0;
  int v173 = 0;
  int v174;
  int v175;
  v174 = v172;
  v175 = v173;
  while (true) {
    int v176 = 4;
    int v177 = v175 * v176;
    int v178 = v177 + v96;
    int v179 = 52;
    int v180 = v179 + v178;
    int v181 = v95[v180];
    int v182 = 0;
    bool v183 = v181 != v182;
    v174 = v174;
    v175 = v175;
    if (!v183) break;
    int v184 = 72;
    int v185 = v184 + v96;
    int v186 = v95[v185];
    int v187 = 4;
    int v188;
    v188 = v187;
    switch (v186) {
      case 0:
        {
        int v189 = 76;
        int v190 = v189 + v96;
        int v191 = v95[v190];
        int v192 = 3;
        int v193 = v96 + v192;
        int v194;
        v194 = v193;
        switch (v191) {
          case 0:
            {
            int v195 = 2;
            v194 = v195;
          }
          case 1:
            {
            int v196 = 4;
            int v197 = v96 + v196;
            v194 = v197;
          }
          default:
            {
            int v198 = 2;
            int v199 = v96 + v198;
            v194 = v199;
            break;
          }
          case 2:
            {
            v194 = v96;
            break;
          }
        }
        bool v200 = true;
        v188 = v194;
      }
      default:
        {
        int v201 = 80;
        int v202 = v201 + v96;
        int v203 = v95[v202];
        int v204 = 3;
        int v205 = v96 + v204;
        int v206;
        v206 = v205;
        switch (v203) {
          case 0:
            {
            int v207 = 4;
            int v208 = v96 + v207;
            v206 = v208;
            break;
          }
          default:
            {
            int v209 = 3;
            v206 = v209;
            break;
          }
        }
        bool v210 = true;
        v188 = v206;
        break;
      }
      case 1:
        {
        int v211 = 84;
        int v212 = v211 + v96;
        int v213 = v95[v212];
        int v214 = 4;
        int v215 = v96 + v214;
        int v216;
        v216 = v215;
        switch (v213) {
          case 0:
            {
            int v217 = 4;
            v216 = v217;
            break;
          }
          case 1:
            {
            int v218 = 3;
            v216 = v218;
            break;
          }
          case 2:
            {
            int v219 = 2;
            int v220 = v96 + v219;
            v216 = v220;
            break;
          }
          default:
            {
            int v221 = 2;
            int v222 = v96 + v221;
            v216 = v222;
            break;
          }
        }
        bool v223 = true;
        v188 = v216;
        break;
      }
    }
    bool v224 = true;
    int v225 = v174 + v188;
    int v226 = 1;
    int v227 = v175 + v226;
    v174 = v225;
    v175 = v227;
  }
  bool v228 = true;
  int v229 = 32;
  int v230 = v229 + v96;
  bool v231 = true;
  int v232 = simt_wave_count_bits(v231);
  v94[v230] = v232;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 88; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
