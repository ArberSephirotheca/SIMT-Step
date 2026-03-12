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
    int v7 = 0;
    bool v8 = v2 != v7;
    int v9;
    if (v8) {
      int v10 = 0;
      int v11 = 0;
      int v12;
      int v13;
      v12 = v10;
      v13 = v11;
      while (true) {
        int v14 = 4;
        int v15 = v3 % v14;
        int v16 = 1;
        int v17 = v15 + v16;
        bool v18 = v13 < v17;
        v12 = v12;
        v13 = v13;
        if (!v18) break;
        int v19 = 2;
        int v20 = 1;
        int v21 = v13 + v20;
        v12 = v19;
        v13 = v21;
      }
      uint v22 = simt_lane_id(__simt_tid);
      int v23 = (int)(v22);
      v9 = v12;
    } else {
      int v24 = 4;
      int v25 = v0 + v24;
      v9 = v25;
    }
    uint v26 = simt_lane_id(__simt_tid);
    int v27 = (int)(v26);
    v6 = v9;
  } else {
    int v28 = 0;
    bool v29 = v2 != v28;
    int v30;
    if (v29) {
      int v31 = 0;
      int v32 = 0;
      int v33;
      int v34;
      v33 = v31;
      v34 = v32;
      while (true) {
        int v35 = 4;
        int v36 = v3 % v35;
        int v37 = 1;
        int v38 = v36 + v37;
        bool v39 = v34 < v38;
        v33 = v33;
        v34 = v34;
        if (!v39) break;
        uint v40 = simt_subgroup_id(__simt_tid);
        int v41 = (int)(v40);
        int v42 = 1;
        int v43 = v34 + v42;
        v33 = v41;
        v34 = v43;
        break;
        ;
      }
      int v44 = 2;
      int v45 = v0 + v44;
      v30 = v33;
    } else {
      int v46 = 0;
      int v47 = 0;
      int v48;
      int v49;
      v48 = v46;
      v49 = v47;
      while (true) {
        int v50 = 4;
        int v51 = v3 % v50;
        int v52 = 1;
        int v53 = v51 + v52;
        bool v54 = v49 < v53;
        v48 = v48;
        v49 = v49;
        if (!v54) break;
        int v55 = 3;
        int v56 = v0 + v55;
        int v57 = 1;
        int v58 = v49 + v57;
        v48 = v56;
        v49 = v58;
        break;
        ;
      }
      uint v59 = simt_subgroup_id(__simt_tid);
      int v60 = (int)(v59);
      v30 = v48;
    }
    int v61 = 4;
    int v62 = v0 + v61;
    v6 = v30;
  }
  bool v63 = true;
  int v64 = simt_wave_count_bits(v63);
  int v65 = 0;
  int v66 = v65 + v0;
  v1[v66] = v64;
  return;
}

kernel void kernel_main(device int* v67 [[buffer(0)]], device int* v68 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v69 = static_cast<int>(__simt_tid3.x);
  int v70 = 0;
  int v71 = v70 + v69;
  int v72 = v68[v71];
  int v73 = 4;
  int v74 = v73 + v69;
  int v75 = v68[v74];
  helper0(v69, v67, v72, v75, static_cast<int>(__simt_tid3.x));
  int v76 = 0;
  int v77 = v69 + v76;
  int v78 = 0;
  int v79 = v69 + v78;
  int v80 = 0;
  int v81 = 0;
  int v82;
  int v83;
  v82 = v80;
  v83 = v81;
  while (true) {
    int v84 = 4;
    int v85 = v83 * v84;
    int v86 = v85 + v69;
    int v87 = 8;
    int v88 = v87 + v86;
    int v89 = v68[v88];
    int v90 = 0;
    bool v91 = v89 != v90;
    v82 = v82;
    v83 = v83;
    if (!v91) break;
    int v92 = 3;
    int v93 = v82 + v92;
    int v94 = 1;
    int v95 = v83 + v94;
    v82 = v93;
    v83 = v95;
    break;
    ;
  }
  bool v96 = true;
  int v97 = 16;
  int v98 = v97 + v69;
  bool v99 = true;
  int v100 = simt_wave_count_bits(v99);
  v67[v98] = v100;
  int v101 = 0;
  int v102 = 0;
  int v103;
  int v104;
  v103 = v101;
  v104 = v102;
  while (true) {
    int v105 = 4;
    int v106 = v104 * v105;
    int v107 = v106 + v69;
    int v108 = 28;
    int v109 = v108 + v107;
    int v110 = v68[v109];
    int v111 = 0;
    bool v112 = v110 != v111;
    v103 = v103;
    v104 = v104;
    if (!v112) break;
    int v113 = v103 + v104;
    int v114 = 1;
    int v115 = v104 + v114;
    v103 = v113;
    v104 = v115;
  }
  bool v116 = true;
  int v117 = 32;
  int v118 = v117 + v69;
  bool v119 = true;
  int v120 = simt_wave_count_bits(v119);
  v67[v118] = v120;
  int v121 = 48;
  int v122 = v121 + v69;
  int v123 = v68[v122];
  int v124 = 2;
  int v125 = v69 + v124;
  int v126;
  v126 = v125;
  switch (v123) {
    case 0:
      {
      int v127 = 52;
      int v128 = v127 + v69;
      int v129 = v68[v128];
      int v130;
      v130 = v69;
      switch (v129) {
        case 0:
          {
          int v131 = 1;
          int v132 = v69 + v131;
          v130 = v132;
        }
        case 1:
          {
          int v133 = 56;
          int v134 = v133 + v69;
          int v135 = v68[v134];
          int v136;
          v136 = v69;
          switch (v135) {
            case 0:
              {
              int v137 = 2;
              int v138 = v69 + v137;
              v136 = v138;
              break;
            }
            default:
              {
              int v139 = 0;
              int v140 = v69 + v139;
              v136 = v140;
              break;
            }
            case 1:
              {
              v136 = v69;
              break;
            }
            case 2:
              {
              int v141 = 2;
              v136 = v141;
              break;
            }
          }
          bool v142 = true;
          v130 = v136;
        }
        default:
          {
          int v143 = 0;
          int v144 = 0;
          int v145;
          int v146;
          v145 = v143;
          v146 = v144;
          while (true) {
            int v147 = 4;
            int v148 = v146 * v147;
            int v149 = v148 + v69;
            int v150 = 60;
            int v151 = v150 + v149;
            int v152 = v68[v151];
            int v153 = 0;
            bool v154 = v152 != v153;
            v145 = v145;
            v146 = v146;
            if (!v154) break;
            int v155 = v145 + v146;
            int v156 = 1;
            int v157 = v146 + v156;
            v145 = v155;
            v146 = v157;
          }
          bool v158 = true;
          v130 = v145;
          break;
        }
        case 2:
          {
          int v159 = 80;
          int v160 = v159 + v69;
          int v161 = v68[v160];
          int v162 = 0;
          bool v163 = v161 != v162;
          int v164;
          if (v163) {
            v164 = v69;
          } else {
            v164 = v69;
          }
          v130 = v164;
          break;
        }
      }
      bool v165 = true;
      v126 = v130;
      break;
    }
    default:
      {
      int v166 = 84;
      int v167 = v166 + v69;
      int v168 = v68[v167];
      int v169 = 1;
      int v170 = v69 + v169;
      int v171;
      v171 = v170;
      switch (v168) {
        default:
          {
          int v172 = 88;
          int v173 = v172 + v69;
          int v174 = v68[v173];
          int v175 = 0;
          int v176 = v69 + v175;
          int v177;
          v177 = v176;
          switch (v174) {
            default:
              {
              v177 = v69;
              break;
            }
            case 0:
              {
              int v178 = 2;
              v177 = v178;
              break;
            }
            case 1:
              {
              int v179 = 4;
              v177 = v179;
              break;
            }
          }
          bool v180 = true;
          v171 = v177;
          break;
        }
        case 0:
          {
          int v181 = 92;
          int v182 = v181 + v69;
          int v183 = v68[v182];
          int v184 = 0;
          bool v185 = v183 != v184;
          int v186;
          if (v185) {
            v186 = v69;
          } else {
            v186 = v69;
          }
          v171 = v186;
          break;
        }
      }
      bool v187 = true;
      v126 = v171;
      break;
    }
    case 1:
      {
      int v188 = 96;
      int v189 = v188 + v69;
      int v190 = v68[v189];
      int v191 = 4;
      int v192 = v69 + v191;
      int v193;
      v193 = v192;
      switch (v190) {
        case 0:
          {
          int v194 = 100;
          int v195 = v194 + v69;
          int v196 = v68[v195];
          int v197 = 4;
          int v198;
          v198 = v197;
          switch (v196) {
            case 0:
              {
              int v199 = 4;
              int v200 = v69 + v199;
              v198 = v200;
            }
            default:
              {
              int v201 = 4;
              v198 = v201;
            }
            case 1:
              {
              int v202 = 1;
              v198 = v202;
            }
            case 2:
              {
              int v203 = 1;
              v198 = v203;
              break;
            }
          }
          bool v204 = true;
          v193 = v198;
          break;
        }
        case 1:
          {
          int v205 = 104;
          int v206 = v205 + v69;
          int v207 = v68[v206];
          int v208 = 0;
          bool v209 = v207 != v208;
          int v210;
          if (v209) {
            int v211 = 3;
            v210 = v211;
          } else {
            int v212 = 0;
            v210 = v212;
          }
          v193 = v210;
          break;
        }
        default:
          {
          int v213 = 108;
          int v214 = v213 + v69;
          int v215 = v68[v214];
          int v216 = 0;
          bool v217 = v215 != v216;
          int v218;
          if (v217) {
            int v219 = 0;
            int v220 = v69 + v219;
            v218 = v220;
          } else {
            int v221 = 2;
            v218 = v221;
          }
          v193 = v218;
          break;
        }
      }
      bool v222 = true;
      v126 = v193;
      break;
    }
    case 2:
      {
      int v223 = 112;
      int v224 = v223 + v69;
      int v225 = v68[v224];
      int v226;
      v226 = v69;
      switch (v225) {
        case 0:
          {
          int v227 = 116;
          int v228 = v227 + v69;
          int v229 = v68[v228];
          int v230 = 0;
          bool v231 = v229 != v230;
          int v232;
          if (v231) {
            v232 = v69;
          } else {
            int v233 = 1;
            v232 = v233;
          }
          v226 = v232;
        }
        case 1:
          {
          int v234 = 0;
          int v235 = 0;
          int v236;
          int v237;
          v236 = v234;
          v237 = v235;
          while (true) {
            int v238 = 4;
            int v239 = v237 * v238;
            int v240 = v239 + v69;
            int v241 = 120;
            int v242 = v241 + v240;
            int v243 = v68[v242];
            int v244 = 0;
            bool v245 = v243 != v244;
            v236 = v236;
            v237 = v237;
            if (!v245) break;
            int v246 = v236 + v237;
            int v247 = 1;
            int v248 = v237 + v247;
            v236 = v246;
            v237 = v248;
            continue;
            ;
          }
          bool v249 = true;
          v226 = v236;
        }
        default:
          {
          int v250 = 140;
          int v251 = v250 + v69;
          int v252 = v68[v251];
          int v253 = 0;
          bool v254 = v252 != v253;
          int v255;
          if (v254) {
            int v256 = 0;
            int v257 = v69 + v256;
            v255 = v257;
          } else {
            int v258 = 2;
            v255 = v258;
          }
          v226 = v255;
        }
        case 2:
          {
          v226 = v69;
          break;
        }
      }
      bool v259 = true;
      v126 = v226;
      break;
    }
  }
  bool v260 = true;
  int v261 = 48;
  int v262 = v261 + v69;
  bool v263 = true;
  int v264 = simt_wave_count_bits(v263);
  v67[v262] = v264;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 144; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
