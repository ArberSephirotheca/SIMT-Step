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
  bool v5 = v2 != v4;
  int v6;
  if (v5) {
    int v7 = 2;
    int v8 = v0 + v7;
    v6 = v8;
  } else {
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
      uint v18 = simt_subgroup_id(__simt_tid);
      int v19 = (int)(v18);
      int v20 = 1;
      int v21 = v12 + v20;
      v11 = v19;
      v12 = v21;
    }
    v6 = v11;
  }
  bool v22 = true;
  int v23 = simt_wave_count_bits(v22);
  int v24 = 0;
  int v25 = v24 + v0;
  v1[v25] = v23;
  int v26 = 4;
  int v27 = v3 % v26;
  uint v28 = simt_lane_id(__simt_tid);
  int v29 = (int)(v28);
  int v30;
  v30 = v29;
  switch (v27) {
    case 0:
      {
      int v31 = 2;
      int v32 = v3 % v31;
      int v33 = 1;
      int v34;
      v34 = v33;
      switch (v32) {
        case 0:
          {
          int v35 = 2;
          int v36 = v3 % v35;
          int v37;
          v37 = v0;
          switch (v36) {
            default:
              {
              v37 = v0;
              break;
            }
            case 0:
              {
              int v38 = 3;
              v37 = v38;
              break;
            }
            case 1:
              {
              v37 = v0;
              break;
            }
          }
          int v39 = 1;
          v34 = v37;
          break;
        }
        default:
          {
          int v40 = 3;
          int v41 = v3 % v40;
          int v42;
          v42 = v0;
          switch (v41) {
            case 0:
              {
              int v43 = 0;
              v42 = v43;
            }
            case 1:
              {
              v42 = v0;
            }
            case 2:
              {
              int v44 = 1;
              v42 = v44;
              break;
            }
            default:
              {
              int v45 = 0;
              v42 = v45;
              break;
            }
          }
          v34 = v42;
          break;
        }
      }
      int v46 = 0;
      v30 = v34;
    }
    case 1:
      {
      int v47 = 2;
      int v48 = v3 % v47;
      int v49;
      v49 = v0;
      switch (v48) {
        default:
          {
          int v50 = 0;
          bool v51 = v2 != v50;
          int v52;
          if (v51) {
            v52 = v0;
          } else {
            v52 = v0;
          }
          int v53 = 4;
          v49 = v52;
          break;
        }
        case 0:
          {
          int v54 = 0;
          int v55 = 0;
          int v56;
          int v57;
          v56 = v54;
          v57 = v55;
          while (true) {
            int v58 = 4;
            int v59 = v3 % v58;
            int v60 = 1;
            int v61 = v59 + v60;
            bool v62 = v57 < v61;
            v56 = v56;
            v57 = v57;
            if (!v62) break;
            int v63 = 2;
            int v64 = 1;
            int v65 = v57 + v64;
            v56 = v63;
            v57 = v65;
          }
          v49 = v56;
          break;
        }
      }
      int v66 = 4;
      v30 = v49;
      break;
    }
    default:
      {
      int v67 = 1;
      int v68 = v0 + v67;
      int v69;
      v69 = v68;
      switch (v3) {
        default:
          {
          int v70 = 0;
          int v71 = 0;
          int v72;
          int v73;
          v72 = v70;
          v73 = v71;
          while (true) {
            int v74 = 4;
            int v75 = v3 % v74;
            int v76 = 1;
            int v77 = v75 + v76;
            bool v78 = v73 < v77;
            v72 = v72;
            v73 = v73;
            if (!v78) break;
            int v79 = 2;
            int v80 = 1;
            int v81 = v73 + v80;
            v72 = v79;
            v73 = v81;
          }
          v69 = v72;
          break;
        }
        case 0:
          {
          int v82 = 0;
          bool v83 = v2 != v82;
          int v84;
          if (v83) {
            v84 = v0;
          } else {
            int v85 = 0;
            v84 = v85;
          }
          v69 = v84;
          break;
        }
      }
      int v86 = 3;
      v30 = v69;
      break;
    }
    case 2:
      {
      int v87 = 2;
      int v88 = v3 % v87;
      int v89;
      v89 = v0;
      switch (v88) {
        case 0:
          {
          int v90 = 0;
          bool v91 = v2 != v90;
          int v92;
          if (v91) {
            int v93 = 0;
            v92 = v93;
          } else {
            v92 = v0;
          }
          int v94 = 4;
          int v95 = v0 + v94;
          v89 = v92;
        }
        default:
          {
          v89 = v0;
        }
        case 1:
          {
          int v96 = 0;
          int v97 = 0;
          int v98;
          int v99;
          v98 = v96;
          v99 = v97;
          while (true) {
            int v100 = 4;
            int v101 = v3 % v100;
            int v102 = 1;
            int v103 = v101 + v102;
            bool v104 = v99 < v103;
            v98 = v98;
            v99 = v99;
            if (!v104) break;
            int v105 = 4;
            int v106 = v0 + v105;
            int v107 = 1;
            int v108 = v99 + v107;
            v98 = v106;
            v99 = v108;
            break;
            ;
          }
          v89 = v98;
          break;
        }
      }
      int v109 = 2;
      int v110 = v0 + v109;
      v30 = v89;
      break;
    }
  }
  bool v111 = true;
  int v112 = simt_wave_count_bits(v111);
  int v113 = 16;
  int v114 = v113 + v0;
  v1[v114] = v112;
  int v115 = 0;
  bool v116 = v2 != v115;
  int v117 = v116 ? v6 : v30;
  return;
}

kernel void kernel_main(device int* v118 [[buffer(0)]], device int* v119 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v120 = static_cast<int>(__simt_tid3.x);
  int v121 = 0;
  int v122 = v121 + v120;
  int v123 = v119[v122];
  int v124 = 4;
  int v125 = v124 + v120;
  int v126 = v119[v125];
  helper0(v120, v118, v123, v126, static_cast<int>(__simt_tid3.x));
  int v127 = 8;
  int v128 = v127 + v120;
  int v129 = v119[v128];
  int v130 = 3;
  int v131 = v120 + v130;
  int v132;
  v132 = v131;
  switch (v129) {
    case 0:
      {
      int v133 = 12;
      int v134 = v133 + v120;
      int v135 = v119[v134];
      int v136;
      v136 = v120;
      switch (v135) {
        case 0:
          {
          int v137 = 16;
          int v138 = v137 + v120;
          int v139 = v119[v138];
          int v140 = 0;
          bool v141 = v139 != v140;
          int v142;
          if (v141) {
            int v143 = 0;
            v142 = v143;
          } else {
            int v144 = 1;
            int v145 = v120 + v144;
            v142 = v145;
          }
          v136 = v142;
          break;
        }
        default:
          {
          int v146 = 20;
          int v147 = v146 + v120;
          int v148 = v119[v147];
          int v149;
          v149 = v120;
          switch (v148) {
            default:
              {
              v149 = v120;
              break;
            }
            case 0:
              {
              int v150 = 0;
              v149 = v150;
              break;
            }
            case 1:
              {
              v149 = v120;
              break;
            }
            case 2:
              {
              v149 = v120;
              break;
            }
          }
          bool v151 = true;
          v136 = v149;
          break;
        }
      }
      bool v152 = true;
      v132 = v136;
    }
    default:
      {
      int v153 = 24;
      int v154 = v153 + v120;
      int v155 = v119[v154];
      int v156 = 1;
      int v157 = v120 + v156;
      int v158;
      v158 = v157;
      switch (v155) {
        case 0:
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
            int v165 = v164 + v120;
            int v166 = 28;
            int v167 = v166 + v165;
            int v168 = v119[v167];
            int v169 = 0;
            bool v170 = v168 != v169;
            v161 = v161;
            v162 = v162;
            if (!v170) break;
            int v171 = v161 + v162;
            int v172 = 1;
            int v173 = v162 + v172;
            v161 = v171;
            v162 = v173;
          }
          bool v174 = true;
          v158 = v161;
          break;
        }
        case 1:
          {
          int v175 = 2;
          int v176 = v120 + v175;
          v158 = v176;
          break;
        }
        default:
          {
          int v177 = 48;
          int v178 = v177 + v120;
          int v179 = v119[v178];
          int v180 = 0;
          bool v181 = v179 != v180;
          int v182;
          if (v181) {
            v182 = v120;
          } else {
            v182 = v120;
          }
          v158 = v182;
          break;
        }
      }
      bool v183 = true;
      v132 = v158;
      break;
    }
  }
  bool v184 = true;
  int v185 = 32;
  int v186 = v185 + v120;
  bool v187 = true;
  int v188 = simt_wave_count_bits(v187);
  v118[v186] = v188;
  int v189 = 52;
  int v190 = v189 + v120;
  int v191 = v119[v190];
  uint v192 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v193 = (int)(v192);
  int v194;
  v194 = v193;
  switch (v191) {
    case 0:
      {
      v194 = v120;
      break;
    }
    case 1:
      {
      int v195 = 56;
      int v196 = v195 + v120;
      int v197 = v119[v196];
      int v198 = 2;
      int v199 = v120 + v198;
      int v200;
      v200 = v199;
      switch (v197) {
        default:
          {
          int v201 = 60;
          int v202 = v201 + v120;
          int v203 = v119[v202];
          int v204;
          v204 = v120;
          switch (v203) {
            case 0:
              {
              int v205 = 0;
              int v206 = v120 + v205;
              v204 = v206;
              break;
            }
            default:
              {
              int v207 = 2;
              v204 = v207;
              break;
            }
            case 1:
              {
              v204 = v120;
              break;
            }
            case 2:
              {
              int v208 = 1;
              int v209 = v120 + v208;
              v204 = v209;
              break;
            }
          }
          bool v210 = true;
          v200 = v204;
          break;
        }
        case 0:
          {
          int v211 = 64;
          int v212 = v211 + v120;
          int v213 = v119[v212];
          int v214 = 0;
          bool v215 = v213 != v214;
          int v216;
          if (v215) {
            v216 = v120;
          } else {
            int v217 = 3;
            v216 = v217;
          }
          v200 = v216;
          break;
        }
        case 1:
          {
          int v218 = 1;
          int v219 = v120 + v218;
          v200 = v219;
          break;
        }
      }
      bool v220 = true;
      v194 = v200;
      break;
    }
    default:
      {
      int v221 = 68;
      int v222 = v221 + v120;
      int v223 = v119[v222];
      int v224 = 0;
      bool v225 = v223 != v224;
      int v226;
      if (v225) {
        int v227 = 72;
        int v228 = v227 + v120;
        int v229 = v119[v228];
        int v230 = 0;
        bool v231 = v229 != v230;
        int v232;
        if (v231) {
          int v233 = 2;
          v232 = v233;
        } else {
          int v234 = 2;
          int v235 = v120 + v234;
          v232 = v235;
        }
        v226 = v232;
      } else {
        int v236 = 76;
        int v237 = v236 + v120;
        int v238 = v119[v237];
        int v239 = 4;
        int v240 = v120 + v239;
        int v241;
        v241 = v240;
        switch (v238) {
          case 0:
            {
            int v242 = 2;
            v241 = v242;
          }
          default:
            {
            v241 = v120;
          }
          case 1:
            {
            int v243 = 4;
            int v244 = v120 + v243;
            v241 = v244;
            break;
          }
        }
        bool v245 = true;
        v226 = v241;
      }
      v194 = v226;
      break;
    }
  }
  bool v246 = true;
  int v247 = 48;
  int v248 = v247 + v120;
  bool v249 = true;
  int v250 = simt_wave_count_bits(v249);
  v118[v248] = v250;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 80; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
