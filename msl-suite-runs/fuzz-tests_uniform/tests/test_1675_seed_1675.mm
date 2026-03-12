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
    case 0:
      {
      int v7 = 3;
      int v8 = v3 % v7;
      int v9 = 0;
      int v10 = v0 + v9;
      int v11;
      v11 = v10;
      switch (v8) {
        case 0:
          {
          int v12 = 1;
          v11 = v12;
          break;
        }
        case 1:
          {
          int v13 = 0;
          int v14 = 0;
          int v15;
          int v16;
          v15 = v13;
          v16 = v14;
          while (true) {
            int v17 = 4;
            int v18 = v3 % v17;
            int v19 = 1;
            int v20 = v18 + v19;
            bool v21 = v16 < v20;
            v15 = v15;
            v16 = v16;
            if (!v21) break;
            int v22 = 3;
            int v23 = 1;
            int v24 = v16 + v23;
            v15 = v22;
            v16 = v24;
            continue;
            ;
          }
          v11 = v15;
          break;
        }
        default:
          {
          int v25 = 0;
          int v26 = 0;
          int v27;
          int v28;
          v27 = v25;
          v28 = v26;
          while (true) {
            int v29 = 4;
            int v30 = v3 % v29;
            int v31 = 1;
            int v32 = v30 + v31;
            bool v33 = v28 < v32;
            v27 = v27;
            v28 = v28;
            if (!v33) break;
            int v34 = 1;
            int v35 = v28 + v34;
            v27 = v0;
            v28 = v35;
          }
          v11 = v27;
          break;
        }
      }
      v6 = v11;
      break;
    }
    case 1:
      {
      int v36 = 4;
      int v37 = v0 + v36;
      v6 = v37;
      break;
    }
    case 2:
      {
      int v38 = 0;
      bool v39 = v2 != v38;
      int v40;
      if (v39) {
        int v41 = 0;
        bool v42 = v2 != v41;
        int v43;
        if (v42) {
          int v44 = 1;
          v43 = v44;
        } else {
          int v45 = 4;
          v43 = v45;
        }
        int v46 = 0;
        int v47 = v0 + v46;
        v40 = v43;
      } else {
        int v48 = 3;
        int v49 = v3 % v48;
        int v50 = 1;
        int v51;
        v51 = v50;
        switch (v49) {
          case 0:
            {
            v51 = v0;
            break;
          }
          case 1:
            {
            v51 = v0;
            break;
          }
          default:
            {
            v51 = v0;
            break;
          }
        }
        int v52 = 2;
        int v53 = v0 + v52;
        v40 = v51;
      }
      int v54 = 2;
      v6 = v40;
      break;
    }
    default:
      {
      int v55 = 1;
      v6 = v55;
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
  int v72 = 0;
  bool v73 = v71 != v72;
  int v74;
  if (v73) {
    int v75 = 12;
    int v76 = v75 + v62;
    int v77 = v61[v76];
    int v78 = 0;
    bool v79 = v77 != v78;
    int v80;
    if (v79) {
      int v81 = 16;
      int v82 = v81 + v62;
      int v83 = v61[v82];
      int v84 = 2;
      int v85 = v62 + v84;
      int v86;
      v86 = v85;
      switch (v83) {
        default:
          {
          v86 = v62;
          break;
        }
        case 0:
          {
          int v87 = 1;
          int v88 = v62 + v87;
          v86 = v88;
          break;
        }
      }
      bool v89 = true;
      v80 = v86;
    } else {
      int v90 = 20;
      int v91 = v90 + v62;
      int v92 = v61[v91];
      int v93 = 0;
      bool v94 = v92 != v93;
      int v95;
      if (v94) {
        int v96 = 1;
        int v97 = v62 + v96;
        v95 = v97;
      } else {
        uint v98 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v99 = (int)(v98);
        v95 = v99;
      }
      v80 = v95;
    }
    v74 = v80;
  } else {
    int v100 = 0;
    int v101 = 0;
    int v102;
    int v103;
    v102 = v100;
    v103 = v101;
    while (true) {
      int v104 = 4;
      int v105 = v103 * v104;
      int v106 = v105 + v62;
      int v107 = 24;
      int v108 = v107 + v106;
      int v109 = v61[v108];
      int v110 = 0;
      bool v111 = v109 != v110;
      v102 = v102;
      v103 = v103;
      if (!v111) break;
      int v112 = 44;
      int v113 = v112 + v62;
      int v114 = v61[v113];
      int v115 = 0;
      bool v116 = v114 != v115;
      int v117;
      if (v116) {
        uint v118 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v119 = (int)(v118);
        v117 = v119;
      } else {
        uint v120 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v121 = (int)(v120);
        v117 = v121;
      }
      int v122 = v102 + v117;
      int v123 = 1;
      int v124 = v103 + v123;
      v102 = v122;
      v103 = v124;
      break;
      ;
    }
    bool v125 = true;
    v74 = v102;
  }
  int v126 = 16;
  int v127 = v126 + v62;
  bool v128 = true;
  int v129 = simt_wave_count_bits(v128);
  v60[v127] = v129;
  int v130 = 48;
  int v131 = v130 + v62;
  int v132 = v61[v131];
  int v133;
  v133 = v62;
  switch (v132) {
    case 0:
      {
      int v134 = 52;
      int v135 = v134 + v62;
      int v136 = v61[v135];
      int v137 = 0;
      bool v138 = v136 != v137;
      int v139;
      if (v138) {
        int v140 = 56;
        int v141 = v140 + v62;
        int v142 = v61[v141];
        int v143 = 4;
        int v144 = v62 + v143;
        int v145;
        v145 = v144;
        switch (v142) {
          case 0:
            {
            int v146 = 0;
            v145 = v146;
            break;
          }
          case 1:
            {
            int v147 = 3;
            v145 = v147;
            break;
          }
          case 2:
            {
            v145 = v62;
            break;
          }
          default:
            {
            int v148 = 2;
            int v149 = v62 + v148;
            v145 = v149;
            break;
          }
        }
        bool v150 = true;
        v139 = v145;
      } else {
        int v151 = 0;
        int v152 = 0;
        int v153;
        int v154;
        v153 = v151;
        v154 = v152;
        while (true) {
          int v155 = 4;
          int v156 = v154 * v155;
          int v157 = v156 + v62;
          int v158 = 60;
          int v159 = v158 + v157;
          int v160 = v61[v159];
          int v161 = 0;
          bool v162 = v160 != v161;
          v153 = v153;
          v154 = v154;
          if (!v162) break;
          int v163 = v153 + v154;
          int v164 = 1;
          int v165 = v154 + v164;
          v153 = v163;
          v154 = v165;
        }
        bool v166 = true;
        v139 = v153;
      }
      v133 = v139;
      break;
    }
    default:
      {
      int v167 = 80;
      int v168 = v167 + v62;
      int v169 = v61[v168];
      int v170 = 1;
      int v171;
      v171 = v170;
      switch (v169) {
        case 0:
          {
          int v172 = 84;
          int v173 = v172 + v62;
          int v174 = v61[v173];
          int v175;
          v175 = v62;
          switch (v174) {
            default:
              {
              int v176 = 1;
              v175 = v176;
              break;
            }
            case 0:
              {
              v175 = v62;
              break;
            }
          }
          bool v177 = true;
          v171 = v175;
        }
        case 1:
          {
          int v178 = 88;
          int v179 = v178 + v62;
          int v180 = v61[v179];
          int v181 = 2;
          int v182;
          v182 = v181;
          switch (v180) {
            case 0:
              {
              int v183 = 0;
              v182 = v183;
            }
            default:
              {
              int v184 = 0;
              v182 = v184;
              break;
            }
          }
          bool v185 = true;
          v171 = v182;
        }
        default:
          {
          int v186 = 92;
          int v187 = v186 + v62;
          int v188 = v61[v187];
          int v189 = 0;
          bool v190 = v188 != v189;
          int v191;
          if (v190) {
            int v192 = 1;
            int v193 = v62 + v192;
            v191 = v193;
          } else {
            int v194 = 2;
            int v195 = v62 + v194;
            v191 = v195;
          }
          v171 = v191;
          break;
        }
      }
      bool v196 = true;
      v133 = v171;
      break;
    }
    case 1:
      {
      int v197 = 96;
      int v198 = v197 + v62;
      int v199 = v61[v198];
      int v200 = 3;
      int v201 = v62 + v200;
      int v202;
      v202 = v201;
      switch (v199) {
        case 0:
          {
          int v203 = 100;
          int v204 = v203 + v62;
          int v205 = v61[v204];
          int v206 = 2;
          int v207;
          v207 = v206;
          switch (v205) {
            case 0:
              {
              int v208 = 1;
              int v209 = v62 + v208;
              v207 = v209;
              break;
            }
            default:
              {
              int v210 = 4;
              int v211 = v62 + v210;
              v207 = v211;
              break;
            }
            case 1:
              {
              int v212 = 0;
              v207 = v212;
            }
            case 2:
              {
              v207 = v62;
              break;
            }
          }
          bool v213 = true;
          v202 = v207;
          break;
        }
        default:
          {
          int v214 = 104;
          int v215 = v214 + v62;
          int v216 = v61[v215];
          int v217 = 0;
          bool v218 = v216 != v217;
          int v219;
          if (v218) {
            v219 = v62;
          } else {
            int v220 = 3;
            v219 = v220;
          }
          v202 = v219;
          break;
        }
        case 1:
          {
          int v221 = 108;
          int v222 = v221 + v62;
          int v223 = v61[v222];
          int v224 = 1;
          int v225 = v62 + v224;
          int v226;
          v226 = v225;
          switch (v223) {
            default:
              {
              v226 = v62;
              break;
            }
            case 0:
              {
              int v227 = 4;
              int v228 = v62 + v227;
              v226 = v228;
              break;
            }
            case 1:
              {
              v226 = v62;
              break;
            }
            case 2:
              {
              int v229 = 3;
              int v230 = v62 + v229;
              v226 = v230;
              break;
            }
          }
          bool v231 = true;
          v202 = v226;
          break;
        }
      }
      bool v232 = true;
      v133 = v202;
    }
    case 2:
      {
      int v233 = 112;
      int v234 = v233 + v62;
      int v235 = v61[v234];
      int v236 = 0;
      int v237;
      v237 = v236;
      switch (v235) {
        default:
          {
          int v238 = 116;
          int v239 = v238 + v62;
          int v240 = v61[v239];
          int v241 = 0;
          bool v242 = v240 != v241;
          int v243;
          if (v242) {
            v243 = v62;
          } else {
            int v244 = 0;
            v243 = v244;
          }
          v237 = v243;
          break;
        }
        case 0:
          {
          v237 = v62;
          break;
        }
        case 1:
          {
          int v245 = 0;
          int v246 = 0;
          int v247;
          int v248;
          v247 = v245;
          v248 = v246;
          while (true) {
            int v249 = 4;
            int v250 = v248 * v249;
            int v251 = v250 + v62;
            int v252 = 120;
            int v253 = v252 + v251;
            int v254 = v61[v253];
            int v255 = 0;
            bool v256 = v254 != v255;
            v247 = v247;
            v248 = v248;
            if (!v256) break;
            int v257 = v247 + v248;
            int v258 = 1;
            int v259 = v248 + v258;
            v247 = v257;
            v248 = v259;
          }
          bool v260 = true;
          v237 = v247;
        }
        case 2:
          {
          int v261 = 140;
          int v262 = v261 + v62;
          int v263 = v61[v262];
          int v264 = 0;
          bool v265 = v263 != v264;
          int v266;
          if (v265) {
            v266 = v62;
          } else {
            int v267 = 1;
            v266 = v267;
          }
          v237 = v266;
          break;
        }
      }
      bool v268 = true;
      v133 = v237;
      break;
    }
  }
  bool v269 = true;
  int v270 = 32;
  int v271 = v270 + v62;
  bool v272 = true;
  int v273 = simt_wave_count_bits(v272);
  v60[v271] = v273;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 144; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
