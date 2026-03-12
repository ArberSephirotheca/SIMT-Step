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
  int v6 = 4;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 4;
      int v10 = v3 % v9;
      int v11 = 3;
      int v12;
      v12 = v11;
      switch (v10) {
        default:
          {
          int v13 = 0;
          bool v14 = v2 != v13;
          int v15;
          if (v14) {
            v15 = v0;
          } else {
            int v16 = 0;
            int v17 = v0 + v16;
            v15 = v17;
          }
          v12 = v15;
          break;
        }
        case 0:
          {
          int v18 = 3;
          int v19 = v3 % v18;
          int v20 = 2;
          int v21;
          v21 = v20;
          switch (v19) {
            default:
              {
              int v22 = 1;
              int v23 = v0 + v22;
              v21 = v23;
              break;
            }
            case 0:
              {
              int v24 = 1;
              int v25 = v0 + v24;
              v21 = v25;
              break;
            }
            case 1:
              {
              int v26 = 1;
              v21 = v26;
              break;
            }
            case 2:
              {
              v21 = v0;
              break;
            }
          }
          v12 = v21;
        }
        case 1:
          {
          int v27 = 0;
          bool v28 = v2 != v27;
          int v29;
          if (v28) {
            int v30 = 4;
            int v31 = v0 + v30;
            v29 = v31;
          } else {
            int v32 = 1;
            int v33 = v0 + v32;
            v29 = v33;
          }
          v12 = v29;
        }
        case 2:
          {
          int v34 = 3;
          int v35 = v3 % v34;
          int v36 = 2;
          int v37;
          v37 = v36;
          switch (v35) {
            case 0:
              {
              v37 = v0;
              break;
            }
            case 1:
              {
              v37 = v0;
              break;
            }
            case 2:
              {
              int v38 = 4;
              v37 = v38;
              break;
            }
            default:
              {
              int v39 = 4;
              int v40 = v0 + v39;
              v37 = v40;
              break;
            }
          }
          v12 = v37;
          break;
        }
      }
      v8 = v12;
      break;
    }
    case 0:
      {
      int v41 = 0;
      bool v42 = v2 != v41;
      int v43;
      if (v42) {
        int v44 = 3;
        int v45 = v3 % v44;
        int v46 = 0;
        int v47 = v0 + v46;
        int v48;
        v48 = v47;
        switch (v45) {
          case 0:
            {
            v48 = v0;
          }
          default:
            {
            v48 = v0;
            break;
          }
          case 1:
            {
            int v49 = 2;
            v48 = v49;
          }
          case 2:
            {
            int v50 = 4;
            v48 = v50;
            break;
          }
        }
        int v51 = 2;
        int v52 = v0 + v51;
        v43 = v48;
      } else {
        int v53 = 0;
        bool v54 = v2 != v53;
        int v55;
        if (v54) {
          v55 = v0;
        } else {
          v55 = v0;
        }
        v43 = v55;
      }
      v8 = v43;
      break;
    }
  }
  bool v56 = true;
  int v57 = simt_wave_count_bits(v56);
  int v58 = 0;
  int v59 = v58 + v0;
  v1[v59] = v57;
  return;
}

kernel void kernel_main(device int* v60 [[buffer(0)]], device int* v61 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v62 = static_cast<int>(__simt_tid3.x);
  int v63 = 0;
  int v64 = v63 + v62;
  int v65 = v61[v64];
  int v66 = 4;
  int v67 = v66 + v62;
  int v68 = v61[v67];
  helper0(v62, v60, v65, v68, static_cast<int>(__simt_tid3.x));
  int v69 = 8;
  int v70 = v69 + v62;
  int v71 = v61[v70];
  uint v72 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v73 = (int)(v72);
  int v74;
  v74 = v73;
  switch (v71) {
    case 0:
      {
      int v75 = 12;
      int v76 = v75 + v62;
      int v77 = v61[v76];
      int v78;
      v78 = v62;
      switch (v77) {
        default:
          {
          int v79 = 16;
          int v80 = v79 + v62;
          int v81 = v61[v80];
          int v82 = 0;
          bool v83 = v81 != v82;
          int v84;
          if (v83) {
            int v85 = 0;
            int v86 = v62 + v85;
            v84 = v86;
          } else {
            int v87 = 1;
            v84 = v87;
          }
          v78 = v84;
          break;
        }
        case 0:
          {
          int v88 = 20;
          int v89 = v88 + v62;
          int v90 = v61[v89];
          int v91 = 0;
          bool v92 = v90 != v91;
          int v93;
          if (v92) {
            int v94 = 4;
            int v95 = v62 + v94;
            v93 = v95;
          } else {
            int v96 = 4;
            v93 = v96;
          }
          v78 = v93;
          break;
        }
      }
      v74 = v78;
      break;
    }
    default:
      {
      int v97 = 1;
      v74 = v97;
      break;
    }
  }
  int v98 = 24;
  int v99 = v98 + v62;
  int v100 = v61[v99];
  uint v101 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v102 = (int)(v101);
  int v103;
  v103 = v102;
  switch (v100) {
    default:
      {
      int v104 = 28;
      int v105 = v104 + v62;
      int v106 = v61[v105];
      int v107 = 0;
      int v108;
      v108 = v107;
      switch (v106) {
        case 0:
          {
          int v109 = 32;
          int v110 = v109 + v62;
          int v111 = v61[v110];
          int v112 = 0;
          bool v113 = v111 != v112;
          int v114;
          if (v113) {
            int v115 = 3;
            int v116 = v62 + v115;
            v114 = v116;
          } else {
            v114 = v62;
          }
          v108 = v114;
          break;
        }
        case 1:
          {
          int v117 = 0;
          int v118 = 0;
          int v119;
          int v120;
          v119 = v117;
          v120 = v118;
          while (true) {
            int v121 = 4;
            int v122 = v120 * v121;
            int v123 = v122 + v62;
            int v124 = 36;
            int v125 = v124 + v123;
            int v126 = v61[v125];
            int v127 = 0;
            bool v128 = v126 != v127;
            v119 = v119;
            v120 = v120;
            if (!v128) break;
            int v129 = v119 + v120;
            int v130 = 1;
            int v131 = v120 + v130;
            bool v132 = true;
            v119 = v129;
            v120 = v131;
          }
          v108 = v119;
          break;
        }
        case 2:
          {
          int v133 = 56;
          int v134 = v133 + v62;
          int v135 = v61[v134];
          int v136 = 1;
          int v137 = v62 + v136;
          int v138;
          v138 = v137;
          switch (v135) {
            case 0:
              {
              int v139 = 2;
              v138 = v139;
              break;
            }
            case 1:
              {
              int v140 = 2;
              int v141 = v62 + v140;
              v138 = v141;
            }
            default:
              {
              int v142 = 3;
              v138 = v142;
              break;
            }
          }
          bool v143 = true;
          v108 = v138;
          break;
        }
        default:
          {
          int v144 = 60;
          int v145 = v144 + v62;
          int v146 = v61[v145];
          int v147;
          v147 = v62;
          switch (v146) {
            case 0:
              {
              int v148 = 4;
              int v149 = v62 + v148;
              v147 = v149;
              break;
            }
            default:
              {
              v147 = v62;
              break;
            }
            case 1:
              {
              int v150 = 1;
              v147 = v150;
              break;
            }
            case 2:
              {
              int v151 = 1;
              v147 = v151;
              break;
            }
          }
          bool v152 = true;
          v108 = v147;
          break;
        }
      }
      v103 = v108;
    }
    case 0:
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
        int v159 = v158 + v62;
        int v160 = 64;
        int v161 = v160 + v159;
        int v162 = v61[v161];
        int v163 = 0;
        bool v164 = v162 != v163;
        v155 = v155;
        v156 = v156;
        if (!v164) break;
        int v165 = v155 + v62;
        int v166 = 1;
        int v167 = v156 + v166;
        bool v168 = true;
        v155 = v165;
        v156 = v167;
      }
      v103 = v155;
      break;
    }
    case 1:
      {
      int v169 = 0;
      int v170 = 0;
      int v171;
      int v172;
      v171 = v169;
      v172 = v170;
      while (true) {
        int v173 = 4;
        int v174 = v172 * v173;
        int v175 = v174 + v62;
        int v176 = 84;
        int v177 = v176 + v175;
        int v178 = v61[v177];
        int v179 = 0;
        bool v180 = v178 != v179;
        v171 = v171;
        v172 = v172;
        if (!v180) break;
        int v181 = 104;
        int v182 = v181 + v62;
        int v183 = v61[v182];
        int v184 = 2;
        int v185;
        v185 = v184;
        switch (v183) {
          default:
            {
            int v186 = 2;
            v185 = v186;
            break;
          }
          case 0:
            {
            int v187 = 3;
            int v188 = v62 + v187;
            v185 = v188;
            break;
          }
          case 1:
            {
            int v189 = 2;
            v185 = v189;
            break;
          }
        }
        int v190 = v171 + v185;
        int v191 = 1;
        int v192 = v172 + v191;
        bool v193 = true;
        v171 = v190;
        v172 = v192;
        continue;
        ;
      }
      v103 = v171;
      break;
    }
    case 2:
      {
      int v194 = 3;
      int v195 = v62 + v194;
      v103 = v195;
      break;
    }
  }
  bool v196 = true;
  int v197 = 16;
  int v198 = v197 + v62;
  bool v199 = true;
  int v200 = simt_wave_count_bits(v199);
  v60[v198] = v200;
  int v201 = 108;
  int v202 = v201 + v62;
  int v203 = v61[v202];
  uint v204 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v205 = (int)(v204);
  int v206;
  v206 = v205;
  switch (v203) {
    case 0:
      {
      int v207 = 2;
      v206 = v207;
    }
    default:
      {
      int v208 = 112;
      int v209 = v208 + v62;
      int v210 = v61[v209];
      int v211 = 0;
      bool v212 = v210 != v211;
      int v213;
      if (v212) {
        int v214 = 0;
        int v215 = 0;
        int v216;
        int v217;
        v216 = v214;
        v217 = v215;
        while (true) {
          int v218 = 4;
          int v219 = v217 * v218;
          int v220 = v219 + v62;
          int v221 = 116;
          int v222 = v221 + v220;
          int v223 = v61[v222];
          int v224 = 0;
          bool v225 = v223 != v224;
          v216 = v216;
          v217 = v217;
          if (!v225) break;
          int v226 = v216 + v217;
          int v227 = 1;
          int v228 = v217 + v227;
          bool v229 = true;
          v216 = v226;
          v217 = v228;
        }
        v213 = v216;
      } else {
        int v230 = 3;
        int v231 = v62 + v230;
        v213 = v231;
      }
      v206 = v213;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 136; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
