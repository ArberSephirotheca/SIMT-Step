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
    int v14 = v0 + v13;
    int v15 = 1;
    int v16 = v7 + v15;
    v6 = v14;
    v7 = v16;
  }
  bool v17 = true;
  int v18 = simt_wave_count_bits(v17);
  int v19 = 0;
  int v20 = v19 + v0;
  v1[v20] = v18;
  int v21 = 0;
  int v22 = 0;
  int v23;
  int v24;
  v23 = v21;
  v24 = v22;
  while (true) {
    int v25 = 4;
    int v26 = v3 % v25;
    int v27 = 1;
    int v28 = v26 + v27;
    bool v29 = v24 < v28;
    v23 = v23;
    v24 = v24;
    if (!v29) break;
    uint v30 = simt_lane_id(__simt_tid);
    int v31 = (int)(v30);
    int v32 = 1;
    int v33 = v24 + v32;
    v23 = v31;
    v24 = v33;
  }
  bool v34 = true;
  int v35 = simt_wave_count_bits(v34);
  int v36 = 16;
  int v37 = v36 + v0;
  v1[v37] = v35;
  int v38 = 0;
  bool v39 = v2 != v38;
  int v40 = v39 ? v6 : v23;
  int v41 = 0;
  bool v42 = v2 != v41;
  int v43;
  if (v42) {
    int v44 = 0;
    bool v45 = v2 != v44;
    int v46;
    if (v45) {
      int v47 = 0;
      bool v48 = v2 != v47;
      int v49;
      if (v48) {
        int v50 = 1;
        int v51 = v0 + v50;
        v49 = v51;
      } else {
        uint v52 = simt_lane_id(__simt_tid);
        int v53 = (int)(v52);
        v49 = v53;
      }
      int v54 = 1;
      int v55 = v0 + v54;
      v46 = v49;
    } else {
      int v56 = 2;
      v46 = v56;
    }
    uint v57 = simt_subgroup_id(__simt_tid);
    int v58 = (int)(v57);
    v43 = v46;
  } else {
    int v59 = 3;
    v43 = v59;
  }
  bool v60 = true;
  int v61 = simt_wave_count_bits(v60);
  int v62 = 32;
  int v63 = v62 + v0;
  v1[v63] = v61;
  int v64 = 0;
  bool v65 = v2 != v64;
  int v66 = v65 ? v40 : v43;
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
  int v76 = 8;
  int v77 = v76 + v69;
  int v78 = v68[v77];
  int v79 = 2;
  int v80 = v69 + v79;
  int v81;
  v81 = v80;
  switch (v78) {
    case 0:
      {
      int v82 = 12;
      int v83 = v82 + v69;
      int v84 = v68[v83];
      int v85 = 0;
      bool v86 = v84 != v85;
      int v87;
      if (v86) {
        int v88 = 0;
        int v89 = 0;
        int v90;
        int v91;
        v90 = v88;
        v91 = v89;
        while (true) {
          int v92 = 4;
          int v93 = v91 * v92;
          int v94 = v93 + v69;
          int v95 = 16;
          int v96 = v95 + v94;
          int v97 = v68[v96];
          int v98 = 0;
          bool v99 = v97 != v98;
          v90 = v90;
          v91 = v91;
          if (!v99) break;
          int v100 = v90 + v91;
          int v101 = 1;
          int v102 = v91 + v101;
          v90 = v100;
          v91 = v102;
        }
        bool v103 = true;
        v87 = v90;
      } else {
        int v104 = 36;
        int v105 = v104 + v69;
        int v106 = v68[v105];
        int v107 = 0;
        bool v108 = v106 != v107;
        int v109;
        if (v108) {
          v109 = v69;
        } else {
          int v110 = 3;
          v109 = v110;
        }
        v87 = v109;
      }
      v81 = v87;
      break;
    }
    case 1:
      {
      v81 = v69;
      break;
    }
    default:
      {
      int v111 = 0;
      int v112 = 0;
      int v113;
      int v114;
      v113 = v111;
      v114 = v112;
      while (true) {
        int v115 = 4;
        int v116 = v114 * v115;
        int v117 = v116 + v69;
        int v118 = 40;
        int v119 = v118 + v117;
        int v120 = v68[v119];
        int v121 = 0;
        bool v122 = v120 != v121;
        v113 = v113;
        v114 = v114;
        if (!v122) break;
        int v123 = 0;
        int v124 = 0;
        int v125;
        int v126;
        v125 = v123;
        v126 = v124;
        while (true) {
          int v127 = 4;
          int v128 = v126 * v127;
          int v129 = v128 + v69;
          int v130 = 60;
          int v131 = v130 + v129;
          int v132 = v68[v131];
          int v133 = 0;
          bool v134 = v132 != v133;
          v125 = v125;
          v126 = v126;
          if (!v134) break;
          int v135 = v125 + v126;
          int v136 = 1;
          int v137 = v126 + v136;
          v125 = v135;
          v126 = v137;
        }
        bool v138 = true;
        int v139 = v113 + v125;
        int v140 = 1;
        int v141 = v114 + v140;
        v113 = v139;
        v114 = v141;
      }
      bool v142 = true;
      v81 = v113;
      break;
    }
  }
  bool v143 = true;
  int v144 = 48;
  int v145 = v144 + v69;
  bool v146 = true;
  int v147 = simt_wave_count_bits(v146);
  v67[v145] = v147;
  int v148 = 80;
  int v149 = v148 + v69;
  int v150 = v68[v149];
  int v151 = 0;
  bool v152 = v150 != v151;
  int v153;
  if (v152) {
    int v154 = 84;
    int v155 = v154 + v69;
    int v156 = v68[v155];
    int v157;
    v157 = v69;
    switch (v156) {
      case 0:
        {
        int v158 = 0;
        int v159 = 0;
        int v160;
        int v161;
        v160 = v158;
        v161 = v159;
        while (true) {
          int v162 = 4;
          int v163 = v161 * v162;
          int v164 = v163 + v69;
          int v165 = 88;
          int v166 = v165 + v164;
          int v167 = v68[v166];
          int v168 = 0;
          bool v169 = v167 != v168;
          v160 = v160;
          v161 = v161;
          if (!v169) break;
          int v170 = v160 + v161;
          int v171 = 1;
          int v172 = v161 + v171;
          v160 = v170;
          v161 = v172;
        }
        bool v173 = true;
        v157 = v160;
        break;
      }
      case 1:
        {
        int v174 = 108;
        int v175 = v174 + v69;
        int v176 = v68[v175];
        int v177 = 2;
        int v178;
        v178 = v177;
        switch (v176) {
          default:
            {
            v178 = v69;
            break;
          }
          case 0:
            {
            v178 = v69;
            break;
          }
          case 1:
            {
            int v179 = 3;
            int v180 = v69 + v179;
            v178 = v180;
            break;
          }
        }
        bool v181 = true;
        v157 = v178;
        break;
      }
      case 2:
        {
        int v182 = 1;
        v157 = v182;
        break;
      }
      default:
        {
        int v183 = 112;
        int v184 = v183 + v69;
        int v185 = v68[v184];
        int v186 = 0;
        bool v187 = v185 != v186;
        int v188;
        if (v187) {
          v188 = v69;
        } else {
          int v189 = 4;
          int v190 = v69 + v189;
          v188 = v190;
        }
        v157 = v188;
        break;
      }
    }
    bool v191 = true;
    v153 = v157;
  } else {
    int v192 = 116;
    int v193 = v192 + v69;
    int v194 = v68[v193];
    int v195 = 0;
    bool v196 = v194 != v195;
    int v197;
    if (v196) {
      int v198 = 120;
      int v199 = v198 + v69;
      int v200 = v68[v199];
      int v201 = 0;
      bool v202 = v200 != v201;
      int v203;
      if (v202) {
        v203 = v69;
      } else {
        uint v204 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v205 = (int)(v204);
        v203 = v205;
      }
      v197 = v203;
    } else {
      int v206 = 1;
      v197 = v206;
    }
    v153 = v197;
  }
  int v207 = 64;
  int v208 = v207 + v69;
  bool v209 = true;
  int v210 = simt_wave_count_bits(v209);
  v67[v208] = v210;
  int v211 = 124;
  int v212 = v211 + v69;
  int v213 = v68[v212];
  int v214 = 4;
  int v215 = v69 + v214;
  int v216;
  v216 = v215;
  switch (v213) {
    case 0:
      {
      int v217 = 0;
      int v218 = 0;
      int v219;
      int v220;
      v219 = v217;
      v220 = v218;
      while (true) {
        int v221 = 4;
        int v222 = v220 * v221;
        int v223 = v222 + v69;
        int v224 = 128;
        int v225 = v224 + v223;
        int v226 = v68[v225];
        int v227 = 0;
        bool v228 = v226 != v227;
        v219 = v219;
        v220 = v220;
        if (!v228) break;
        int v229 = 148;
        int v230 = v229 + v69;
        int v231 = v68[v230];
        int v232 = 4;
        int v233 = v69 + v232;
        int v234;
        v234 = v233;
        switch (v231) {
          default:
            {
            v234 = v69;
            break;
          }
          case 0:
            {
            int v235 = 4;
            v234 = v235;
            break;
          }
          case 1:
            {
            v234 = v69;
            break;
          }
        }
        bool v236 = true;
        int v237 = v219 + v234;
        int v238 = 1;
        int v239 = v220 + v238;
        v219 = v237;
        v220 = v239;
      }
      bool v240 = true;
      v216 = v219;
    }
    default:
      {
      int v241 = 152;
      int v242 = v241 + v69;
      int v243 = v68[v242];
      int v244;
      v244 = v69;
      switch (v243) {
        case 0:
          {
          int v245 = 156;
          int v246 = v245 + v69;
          int v247 = v68[v246];
          int v248 = 2;
          int v249;
          v249 = v248;
          switch (v247) {
            default:
              {
              int v250 = 3;
              v249 = v250;
              break;
            }
            case 0:
              {
              v249 = v69;
              break;
            }
          }
          bool v251 = true;
          v244 = v249;
          break;
        }
        default:
          {
          int v252 = 160;
          int v253 = v252 + v69;
          int v254 = v68[v253];
          int v255 = 0;
          bool v256 = v254 != v255;
          int v257;
          if (v256) {
            v257 = v69;
          } else {
            int v258 = 0;
            int v259 = v69 + v258;
            v257 = v259;
          }
          v244 = v257;
          break;
        }
        case 1:
          {
          int v260 = 164;
          int v261 = v260 + v69;
          int v262 = v68[v261];
          int v263 = 3;
          int v264 = v69 + v263;
          int v265;
          v265 = v264;
          switch (v262) {
            case 0:
              {
              int v266 = 4;
              v265 = v266;
              break;
            }
            case 1:
              {
              v265 = v69;
              break;
            }
            default:
              {
              int v267 = 1;
              int v268 = v69 + v267;
              v265 = v268;
            }
            case 2:
              {
              int v269 = 1;
              v265 = v269;
              break;
            }
          }
          bool v270 = true;
          v244 = v265;
          break;
        }
        case 2:
          {
          int v271 = 168;
          int v272 = v271 + v69;
          int v273 = v68[v272];
          int v274 = 0;
          bool v275 = v273 != v274;
          int v276;
          if (v275) {
            int v277 = 1;
            int v278 = v69 + v277;
            v276 = v278;
          } else {
            int v279 = 3;
            int v280 = v69 + v279;
            v276 = v280;
          }
          v244 = v276;
          break;
        }
      }
      bool v281 = true;
      v216 = v244;
      break;
    }
  }
  bool v282 = true;
  int v283 = 80;
  int v284 = v283 + v69;
  bool v285 = true;
  int v286 = simt_wave_count_bits(v285);
  v67[v284] = v286;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 84; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 172; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
