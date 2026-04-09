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
      int v9 = 0;
      int v10 = 0;
      int v11;
      int v12;
      v11 = v9;
      v12 = v10;
      while (true) {
        int v13 = 4;
        int v14 = v3 % v13;
        int v15 = 1;
        int v16 = v14 + v15;
        bool v17 = v12 < v16;
        v11 = v11;
        v12 = v12;
        if (!v17) break;
        int v18;
        v18 = v0;
        switch (v3) {
          default:
            {
            int v19 = 0;
            int v20 = v0 + v19;
            v18 = v20;
            break;
          }
          case 0:
            {
            int v21 = 0;
            int v22 = v0 + v21;
            v18 = v22;
            break;
          }
        }
        int v23 = 1;
        int v24 = v12 + v23;
        v11 = v18;
        v12 = v24;
        break;
        ;
      }
      v8 = v11;
      break;
    }
    case 1:
      {
      int v25 = 3;
      int v26 = v3 % v25;
      int v27 = 1;
      int v28 = v0 + v27;
      int v29;
      v29 = v28;
      switch (v26) {
        case 0:
          {
          int v30 = 4;
          int v31 = v3 % v30;
          int v32 = 3;
          int v33;
          v33 = v32;
          switch (v31) {
            case 0:
              {
              int v34 = 3;
              v33 = v34;
            }
            default:
              {
              int v35 = 3;
              int v36 = v0 + v35;
              v33 = v36;
              break;
            }
            case 1:
              {
              int v37 = 1;
              int v38 = v0 + v37;
              v33 = v38;
            }
            case 2:
              {
              int v39 = 4;
              v33 = v39;
              break;
            }
          }
          v29 = v33;
          break;
        }
        case 1:
          {
          int v40 = 4;
          int v41 = v3 % v40;
          int v42 = 1;
          int v43;
          v43 = v42;
          switch (v41) {
            case 0:
              {
              int v44 = 3;
              v43 = v44;
              break;
            }
            case 1:
              {
              int v45 = 4;
              int v46 = v0 + v45;
              v43 = v46;
              break;
            }
            case 2:
              {
              v43 = v0;
              break;
            }
            default:
              {
              v43 = v0;
              break;
            }
          }
          v29 = v43;
        }
        default:
          {
          int v47 = 3;
          v29 = v47;
          break;
        }
        case 2:
          {
          v29 = v0;
          break;
        }
      }
      int v48 = 3;
      int v49 = v0 + v48;
      v8 = v29;
      break;
    }
    default:
      {
      int v50 = 0;
      int v51 = 0;
      int v52;
      int v53;
      v52 = v50;
      v53 = v51;
      while (true) {
        int v54 = 4;
        int v55 = v3 % v54;
        int v56 = 1;
        int v57 = v55 + v56;
        bool v58 = v53 < v57;
        v52 = v52;
        v53 = v53;
        if (!v58) break;
        int v59 = 0;
        int v60 = 0;
        int v61;
        int v62;
        v61 = v59;
        v62 = v60;
        while (true) {
          int v63 = 4;
          int v64 = v3 % v63;
          int v65 = 1;
          int v66 = v64 + v65;
          bool v67 = v62 < v66;
          v61 = v61;
          v62 = v62;
          if (!v67) break;
          int v68 = 1;
          int v69 = v62 + v68;
          v61 = v0;
          v62 = v69;
        }
        int v70 = 1;
        int v71 = v53 + v70;
        v52 = v61;
        v53 = v71;
        break;
        ;
      }
      v8 = v52;
      break;
    }
    case 2:
      {
      v8 = v0;
      break;
    }
  }
  bool v72 = true;
  int v73 = simt_wave_count_bits(v72);
  int v74 = 0;
  int v75 = v74 + v0;
  v1[v75] = v73;
  return;
}

kernel void kernel_main(device int* v76 [[buffer(0)]], device int* v77 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v78 = static_cast<int>(__simt_tid3.x);
  int v79 = 0;
  int v80 = v79 + v78;
  int v81 = v77[v80];
  int v82 = 4;
  int v83 = v82 + v78;
  int v84 = v77[v83];
  helper0(v78, v76, v81, v84, static_cast<int>(__simt_tid3.x));
  int v85 = 8;
  int v86 = v85 + v78;
  int v87 = v77[v86];
  int v88 = 0;
  bool v89 = v87 != v88;
  int v90;
  if (v89) {
    int v91 = 1;
    int v92 = v78 + v91;
    v90 = v92;
  } else {
    int v93 = 0;
    int v94 = 0;
    int v95;
    int v96;
    v95 = v93;
    v96 = v94;
    while (true) {
      int v97 = 4;
      int v98 = v96 * v97;
      int v99 = v98 + v78;
      int v100 = 12;
      int v101 = v100 + v99;
      int v102 = v77[v101];
      int v103 = 0;
      bool v104 = v102 != v103;
      v95 = v95;
      v96 = v96;
      if (!v104) break;
      int v105 = v95 + v96;
      int v106 = 1;
      int v107 = v96 + v106;
      bool v108 = true;
      int v109 = 16;
      int v110 = 4;
      int v111 = v96 * v110;
      int v112 = v109 + v111;
      int v113 = v112 + v78;
      bool v114 = true;
      int v115 = simt_wave_count_bits(v114);
      v76[v113] = v115;
      v95 = v105;
      v96 = v107;
      break;
      ;
    }
    v90 = v95;
  }
  int v116 = 32;
  int v117 = v116 + v78;
  bool v118 = true;
  int v119 = simt_wave_count_bits(v118);
  v76[v117] = v119;
  int v120 = 32;
  int v121 = v120 + v78;
  int v122 = v77[v121];
  uint v123 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v124 = (int)(v123);
  int v125;
  v125 = v124;
  switch (v122) {
    case 0:
      {
      int v126 = 36;
      int v127 = v126 + v78;
      int v128 = v77[v127];
      int v129 = 4;
      int v130;
      v130 = v129;
      switch (v128) {
        case 0:
          {
          int v131 = 40;
          int v132 = v131 + v78;
          int v133 = v77[v132];
          int v134;
          v134 = v78;
          switch (v133) {
            default:
              {
              int v135 = 2;
              int v136 = v78 + v135;
              v134 = v136;
              break;
            }
            case 0:
              {
              int v137 = 2;
              int v138 = v78 + v137;
              v134 = v138;
              break;
            }
          }
          v130 = v134;
          break;
        }
        default:
          {
          v130 = v78;
          break;
        }
        case 1:
          {
          int v139 = 44;
          int v140 = v139 + v78;
          int v141 = v77[v140];
          int v142 = 2;
          int v143 = v78 + v142;
          int v144;
          v144 = v143;
          switch (v141) {
            case 0:
              {
              int v145 = 3;
              v144 = v145;
              break;
            }
            default:
              {
              int v146 = 4;
              v144 = v146;
              break;
            }
            case 1:
              {
              v144 = v78;
              break;
            }
          }
          v130 = v144;
          break;
        }
        case 2:
          {
          int v147 = 48;
          int v148 = v147 + v78;
          int v149 = v77[v148];
          int v150;
          v150 = v78;
          switch (v149) {
            default:
              {
              int v151 = 2;
              int v152 = v78 + v151;
              v150 = v152;
              break;
            }
            case 0:
              {
              int v153 = 4;
              int v154 = v78 + v153;
              v150 = v154;
              break;
            }
          }
          v130 = v150;
          break;
        }
      }
      v125 = v130;
    }
    case 1:
      {
      int v155 = 52;
      int v156 = v155 + v78;
      int v157 = v77[v156];
      int v158;
      v158 = v78;
      switch (v157) {
        default:
          {
          int v159 = 0;
          int v160 = 0;
          int v161;
          int v162;
          v161 = v159;
          v162 = v160;
          while (true) {
            int v163 = 4;
            int v164 = v162 * v163;
            int v165 = v164 + v78;
            int v166 = 56;
            int v167 = v166 + v165;
            int v168 = v77[v167];
            int v169 = 0;
            bool v170 = v168 != v169;
            v161 = v161;
            v162 = v162;
            if (!v170) break;
            int v171 = v161 + v162;
            int v172 = 1;
            int v173 = v162 + v172;
            bool v174 = true;
            v161 = v171;
            v162 = v173;
          }
          v158 = v161;
        }
        case 0:
          {
          int v175 = 4;
          int v176 = v78 + v175;
          v158 = v176;
          break;
        }
      }
      v125 = v158;
      break;
    }
    case 2:
      {
      int v177 = 76;
      int v178 = v177 + v78;
      int v179 = v77[v178];
      int v180 = 0;
      bool v181 = v179 != v180;
      int v182;
      if (v181) {
        int v183 = 80;
        int v184 = v183 + v78;
        int v185 = v77[v184];
        int v186 = 0;
        bool v187 = v185 != v186;
        int v188;
        if (v187) {
          int v189 = 2;
          v188 = v189;
        } else {
          v188 = v78;
        }
        v182 = v188;
      } else {
        int v190 = 0;
        int v191 = 0;
        int v192;
        int v193;
        v192 = v190;
        v193 = v191;
        while (true) {
          int v194 = 4;
          int v195 = v193 * v194;
          int v196 = v195 + v78;
          int v197 = 84;
          int v198 = v197 + v196;
          int v199 = v77[v198];
          int v200 = 0;
          bool v201 = v199 != v200;
          v192 = v192;
          v193 = v193;
          if (!v201) break;
          int v202 = v192 + v193;
          int v203 = 1;
          int v204 = v193 + v203;
          bool v205 = true;
          v192 = v202;
          v193 = v204;
        }
        v182 = v192;
      }
      v125 = v182;
    }
    default:
      {
      int v206 = 104;
      int v207 = v206 + v78;
      int v208 = v77[v207];
      int v209;
      v209 = v78;
      switch (v208) {
        case 0:
          {
          int v210 = 108;
          int v211 = v210 + v78;
          int v212 = v77[v211];
          int v213 = 4;
          int v214;
          v214 = v213;
          switch (v212) {
            case 0:
              {
              v214 = v78;
              break;
            }
            default:
              {
              int v215 = 4;
              v214 = v215;
              break;
            }
            case 1:
              {
              int v216 = 4;
              v214 = v216;
            }
            case 2:
              {
              int v217 = 0;
              int v218 = v78 + v217;
              v214 = v218;
              break;
            }
          }
          bool v219 = true;
          v209 = v214;
          break;
        }
        case 1:
          {
          int v220 = 2;
          int v221 = v78 + v220;
          v209 = v221;
          break;
        }
        default:
          {
          int v222 = 112;
          int v223 = v222 + v78;
          int v224 = v77[v223];
          int v225 = 3;
          int v226 = v78 + v225;
          int v227;
          v227 = v226;
          switch (v224) {
            default:
              {
              int v228 = 1;
              int v229 = v78 + v228;
              v227 = v229;
              break;
            }
            case 0:
              {
              v227 = v78;
              break;
            }
          }
          v209 = v227;
          break;
        }
        case 2:
          {
          int v230 = 116;
          int v231 = v230 + v78;
          int v232 = v77[v231];
          int v233 = 0;
          bool v234 = v232 != v233;
          int v235;
          if (v234) {
            v235 = v78;
          } else {
            int v236 = 1;
            v235 = v236;
          }
          v209 = v235;
          break;
        }
      }
      v125 = v209;
      break;
    }
  }
  bool v237 = true;
  int v238 = 48;
  int v239 = v238 + v78;
  bool v240 = true;
  int v241 = simt_wave_count_bits(v240);
  v76[v239] = v241;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 120; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
