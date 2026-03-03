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
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 3;
      int v10 = v3 % v9;
      int v11 = 3;
      int v12;
      v12 = v11;
      switch (v10) {
        case 0:
          {
          int v13 = 3;
          int v14 = v3 % v13;
          int v15 = 2;
          int v16 = v0 + v15;
          int v17;
          v17 = v16;
          switch (v14) {
            case 0:
              {
              v17 = v0;
              break;
            }
            default:
              {
              v17 = v0;
              break;
            }
            case 1:
              {
              int v18 = 3;
              int v19 = v0 + v18;
              v17 = v19;
              break;
            }
          }
          int v20 = 4;
          int v21 = v0 + v20;
          v12 = v17;
          break;
        }
        case 1:
          {
          int v22 = 3;
          int v23 = v0 + v22;
          int v24;
          v24 = v23;
          switch (v3) {
            default:
              {
              int v25 = 0;
              v24 = v25;
              break;
            }
            case 0:
              {
              v24 = v0;
              break;
            }
          }
          v12 = v24;
          break;
        }
        case 2:
          {
          int v26 = 4;
          v12 = v26;
          break;
        }
        default:
          {
          int v27 = 3;
          int v28 = v3 % v27;
          int v29 = 0;
          int v30 = v0 + v29;
          int v31;
          v31 = v30;
          switch (v28) {
            case 0:
              {
              v31 = v0;
            }
            case 1:
              {
              v31 = v0;
            }
            default:
              {
              v31 = v0;
            }
            case 2:
              {
              v31 = v0;
              break;
            }
          }
          v12 = v31;
          break;
        }
      }
      int v32 = 3;
      int v33 = v0 + v32;
      v8 = v12;
      break;
    }
    default:
      {
      int v34 = 0;
      int v35 = 0;
      int v36;
      int v37;
      v36 = v34;
      v37 = v35;
      while (true) {
        int v38 = 4;
        int v39 = v3 % v38;
        int v40 = 1;
        int v41 = v39 + v40;
        bool v42 = v37 < v41;
        v36 = v36;
        v37 = v37;
        if (!v42) break;
        int v43 = 2;
        int v44 = v3 % v43;
        int v45 = 1;
        int v46 = v0 + v45;
        int v47;
        v47 = v46;
        switch (v44) {
          case 0:
            {
            int v48 = 3;
            v47 = v48;
            break;
          }
          case 1:
            {
            int v49 = 0;
            v47 = v49;
            break;
          }
          default:
            {
            int v50 = 2;
            v47 = v50;
            break;
          }
        }
        int v51 = 3;
        int v52 = v0 + v51;
        int v53 = 1;
        int v54 = v37 + v53;
        v36 = v47;
        v37 = v54;
      }
      int v55 = 1;
      int v56 = v0 + v55;
      v8 = v36;
      break;
    }
    case 1:
      {
      v8 = v0;
      break;
    }
    case 2:
      {
      int v57 = 0;
      bool v58 = v2 != v57;
      int v59;
      if (v58) {
        int v60 = 0;
        bool v61 = v2 != v60;
        int v62;
        if (v61) {
          int v63 = 4;
          int v64 = v0 + v63;
          v62 = v64;
        } else {
          v62 = v0;
        }
        int v65 = 1;
        v59 = v62;
      } else {
        int v66 = 0;
        v59 = v66;
      }
      int v67 = 3;
      v8 = v59;
      break;
    }
  }
  bool v68 = true;
  int v69 = simt_wave_count_bits(v68);
  int v70 = 0;
  int v71 = v70 + v0;
  v1[v71] = v69;
  int v72 = 0;
  bool v73 = v2 != v72;
  int v74 = v73 ? v0 : v8;
  return;
}

kernel void kernel_main(device int* v75 [[buffer(0)]], device int* v76 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v77 = static_cast<int>(__simt_tid3.x);
  int v78 = 0;
  int v79 = v78 + v77;
  int v80 = v76[v79];
  int v81 = 4;
  int v82 = v81 + v77;
  int v83 = v76[v82];
  helper0(v77, v75, v80, v83, static_cast<int>(__simt_tid3.x));
  int v84 = 8;
  int v85 = v84 + v77;
  int v86 = v76[v85];
  int v87 = 0;
  bool v88 = v86 != v87;
  int v89;
  if (v88) {
    int v90 = 12;
    int v91 = v90 + v77;
    int v92 = v76[v91];
    int v93 = 0;
    int v94;
    v94 = v93;
    switch (v92) {
      default:
        {
        int v95 = 16;
        int v96 = v95 + v77;
        int v97 = v76[v96];
        int v98 = 0;
        bool v99 = v97 != v98;
        int v100;
        if (v99) {
          int v101 = 3;
          v100 = v101;
        } else {
          v100 = v77;
        }
        v94 = v100;
        break;
      }
      case 0:
        {
        int v102 = 20;
        int v103 = v102 + v77;
        int v104 = v76[v103];
        int v105;
        v105 = v77;
        switch (v104) {
          case 0:
            {
            v105 = v77;
            break;
          }
          default:
            {
            int v106 = 0;
            int v107 = v77 + v106;
            v105 = v107;
            break;
          }
        }
        bool v108 = true;
        v94 = v105;
        break;
      }
    }
    bool v109 = true;
    v89 = v94;
  } else {
    int v110 = 24;
    int v111 = v110 + v77;
    int v112 = v76[v111];
    int v113 = 1;
    int v114;
    v114 = v113;
    switch (v112) {
      default:
        {
        int v115 = 28;
        int v116 = v115 + v77;
        int v117 = v76[v116];
        int v118 = 4;
        int v119 = v77 + v118;
        int v120;
        v120 = v119;
        switch (v117) {
          default:
            {
            int v121 = 3;
            int v122 = v77 + v121;
            v120 = v122;
            break;
          }
          case 0:
            {
            int v123 = 2;
            v120 = v123;
            break;
          }
          case 1:
            {
            int v124 = 2;
            int v125 = v77 + v124;
            v120 = v125;
            break;
          }
          case 2:
            {
            v120 = v77;
            break;
          }
        }
        bool v126 = true;
        v114 = v120;
        break;
      }
      case 0:
        {
        int v127 = 32;
        int v128 = v127 + v77;
        int v129 = v76[v128];
        int v130 = 0;
        bool v131 = v129 != v130;
        int v132;
        if (v131) {
          v132 = v77;
        } else {
          int v133 = 4;
          int v134 = v77 + v133;
          v132 = v134;
        }
        v114 = v132;
      }
      case 1:
        {
        int v135 = 0;
        int v136 = 0;
        int v137;
        int v138;
        v137 = v135;
        v138 = v136;
        while (true) {
          int v139 = 4;
          int v140 = v138 * v139;
          int v141 = v140 + v77;
          int v142 = 36;
          int v143 = v142 + v141;
          int v144 = v76[v143];
          int v145 = 0;
          bool v146 = v144 != v145;
          v137 = v137;
          v138 = v138;
          if (!v146) break;
          int v147 = v137 + v138;
          int v148 = 1;
          int v149 = v138 + v148;
          v137 = v147;
          v138 = v149;
        }
        bool v150 = true;
        v114 = v137;
        break;
      }
    }
    bool v151 = true;
    v89 = v114;
  }
  int v152 = 16;
  int v153 = v152 + v77;
  bool v154 = true;
  int v155 = simt_wave_count_bits(v154);
  v75[v153] = v155;
  int v156 = 56;
  int v157 = v156 + v77;
  int v158 = v76[v157];
  int v159 = 4;
  int v160;
  v160 = v159;
  switch (v158) {
    case 0:
      {
      int v161 = 60;
      int v162 = v161 + v77;
      int v163 = v76[v162];
      int v164 = 0;
      bool v165 = v163 != v164;
      int v166;
      if (v165) {
        int v167 = 0;
        int v168 = 0;
        int v169;
        int v170;
        v169 = v167;
        v170 = v168;
        while (true) {
          int v171 = 4;
          int v172 = v170 * v171;
          int v173 = v172 + v77;
          int v174 = 64;
          int v175 = v174 + v173;
          int v176 = v76[v175];
          int v177 = 0;
          bool v178 = v176 != v177;
          v169 = v169;
          v170 = v170;
          if (!v178) break;
          int v179 = v169 + v170;
          int v180 = 1;
          int v181 = v170 + v180;
          v169 = v179;
          v170 = v181;
        }
        bool v182 = true;
        v166 = v169;
      } else {
        int v183 = 84;
        int v184 = v183 + v77;
        int v185 = v76[v184];
        int v186 = 2;
        int v187;
        v187 = v186;
        switch (v185) {
          default:
            {
            v187 = v77;
            break;
          }
          case 0:
            {
            int v188 = 1;
            int v189 = v77 + v188;
            v187 = v189;
            break;
          }
          case 1:
            {
            int v190 = 3;
            v187 = v190;
            break;
          }
          case 2:
            {
            int v191 = 2;
            int v192 = v77 + v191;
            v187 = v192;
            break;
          }
        }
        bool v193 = true;
        v166 = v187;
      }
      v160 = v166;
      break;
    }
    case 1:
      {
      int v194 = 88;
      int v195 = v194 + v77;
      int v196 = v76[v195];
      int v197 = 0;
      bool v198 = v196 != v197;
      int v199;
      if (v198) {
        int v200 = 92;
        int v201 = v200 + v77;
        int v202 = v76[v201];
        int v203 = 0;
        bool v204 = v202 != v203;
        int v205;
        if (v204) {
          int v206 = 1;
          int v207 = v77 + v206;
          v205 = v207;
        } else {
          v205 = v77;
        }
        v199 = v205;
      } else {
        int v208 = 96;
        int v209 = v208 + v77;
        int v210 = v76[v209];
        int v211;
        v211 = v77;
        switch (v210) {
          case 0:
            {
            int v212 = 1;
            v211 = v212;
          }
          case 1:
            {
            int v213 = 3;
            v211 = v213;
            break;
          }
          default:
            {
            int v214 = 2;
            int v215 = v77 + v214;
            v211 = v215;
            break;
          }
        }
        bool v216 = true;
        v199 = v211;
      }
      v160 = v199;
      break;
    }
    case 2:
      {
      int v217 = 100;
      int v218 = v217 + v77;
      int v219 = v76[v218];
      int v220 = 0;
      bool v221 = v219 != v220;
      int v222;
      if (v221) {
        int v223 = 104;
        int v224 = v223 + v77;
        int v225 = v76[v224];
        int v226 = 0;
        bool v227 = v225 != v226;
        int v228;
        if (v227) {
          int v229 = 2;
          v228 = v229;
        } else {
          int v230 = 0;
          v228 = v230;
        }
        v222 = v228;
      } else {
        int v231 = 108;
        int v232 = v231 + v77;
        int v233 = v76[v232];
        int v234 = 4;
        int v235;
        v235 = v234;
        switch (v233) {
          case 0:
            {
            int v236 = 0;
            int v237 = v77 + v236;
            v235 = v237;
            break;
          }
          case 1:
            {
            int v238 = 1;
            v235 = v238;
            break;
          }
          default:
            {
            v235 = v77;
          }
          case 2:
            {
            int v239 = 0;
            v235 = v239;
            break;
          }
        }
        bool v240 = true;
        v222 = v235;
      }
      v160 = v222;
      break;
    }
    default:
      {
      v160 = v77;
      break;
    }
  }
  bool v241 = true;
  int v242 = 32;
  int v243 = v242 + v77;
  bool v244 = true;
  int v245 = simt_wave_count_bits(v244);
  v75[v243] = v245;
  int v246 = 112;
  int v247 = v246 + v77;
  int v248 = v76[v247];
  int v249 = 0;
  bool v250 = v248 != v249;
  int v251;
  if (v250) {
    int v252 = 116;
    int v253 = v252 + v77;
    int v254 = v76[v253];
    int v255 = 0;
    bool v256 = v254 != v255;
    int v257;
    if (v256) {
      int v258 = 120;
      int v259 = v258 + v77;
      int v260 = v76[v259];
      int v261 = 0;
      bool v262 = v260 != v261;
      int v263;
      if (v262) {
        uint v264 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v265 = (int)(v264);
        v263 = v265;
      } else {
        uint v266 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v267 = (int)(v266);
        v263 = v267;
      }
      v257 = v263;
    } else {
      int v268 = 124;
      int v269 = v268 + v77;
      int v270 = v76[v269];
      int v271 = 0;
      bool v272 = v270 != v271;
      int v273;
      if (v272) {
        int v274 = 1;
        v273 = v274;
      } else {
        uint v275 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v276 = (int)(v275);
        v273 = v276;
      }
      v257 = v273;
    }
    v251 = v257;
  } else {
    int v277 = 128;
    int v278 = v277 + v77;
    int v279 = v76[v278];
    int v280 = 0;
    bool v281 = v279 != v280;
    int v282;
    if (v281) {
      int v283 = 132;
      int v284 = v283 + v77;
      int v285 = v76[v284];
      int v286 = 0;
      bool v287 = v285 != v286;
      int v288;
      if (v287) {
        v288 = v77;
      } else {
        uint v289 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v290 = (int)(v289);
        v288 = v290;
      }
      v282 = v288;
    } else {
      int v291 = 1;
      int v292 = v77 + v291;
      v282 = v292;
    }
    v251 = v282;
  }
  int v293 = 48;
  int v294 = v293 + v77;
  bool v295 = true;
  int v296 = simt_wave_count_bits(v295);
  v75[v294] = v296;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 136; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
