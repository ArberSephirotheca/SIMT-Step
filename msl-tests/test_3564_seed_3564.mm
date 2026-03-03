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
    uint v7 = simt_lane_id(__simt_tid);
    int v8 = (int)(v7);
    v6 = v8;
  } else {
    int v9 = 3;
    int v10 = v3 % v9;
    uint v11 = simt_subgroup_id(__simt_tid);
    int v12 = (int)(v11);
    int v13;
    v13 = v12;
    switch (v10) {
      case 0:
        {
        int v14 = 0;
        bool v15 = v2 != v14;
        int v16;
        if (v15) {
          v16 = v0;
        } else {
          int v17 = 1;
          int v18 = v0 + v17;
          v16 = v18;
        }
        int v19 = 2;
        int v20 = v0 + v19;
        v13 = v16;
        break;
      }
      case 1:
        {
        int v21 = 3;
        int v22 = v3 % v21;
        int v23 = 3;
        int v24 = v0 + v23;
        int v25;
        v25 = v24;
        switch (v22) {
          case 0:
            {
            int v26 = 0;
            v25 = v26;
            break;
          }
          default:
            {
            v25 = v0;
            break;
          }
          case 1:
            {
            int v27 = 3;
            v25 = v27;
            break;
          }
          case 2:
            {
            int v28 = 1;
            v25 = v28;
            break;
          }
        }
        int v29 = 0;
        v13 = v25;
        break;
      }
      case 2:
        {
        v13 = v0;
        break;
      }
      default:
        {
        int v30 = 0;
        int v31 = 0;
        int v32;
        int v33;
        v32 = v30;
        v33 = v31;
        while (true) {
          int v34 = 4;
          int v35 = v3 % v34;
          int v36 = 1;
          int v37 = v35 + v36;
          bool v38 = v33 < v37;
          v32 = v32;
          v33 = v33;
          if (!v38) break;
          int v39 = 1;
          int v40 = v33 + v39;
          v32 = v0;
          v33 = v40;
        }
        int v41 = 2;
        v13 = v32;
        break;
      }
    }
    uint v42 = simt_subgroup_id(__simt_tid);
    int v43 = (int)(v42);
    v6 = v13;
  }
  bool v44 = true;
  int v45 = simt_wave_count_bits(v44);
  int v46 = 0;
  int v47 = v46 + v0;
  v1[v47] = v45;
  return;
}

kernel void kernel_main(device int* v48 [[buffer(0)]], device int* v49 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v50 = static_cast<int>(__simt_tid3.x);
  int v51 = 0;
  int v52 = v51 + v50;
  int v53 = v49[v52];
  int v54 = 4;
  int v55 = v54 + v50;
  int v56 = v49[v55];
  helper0(v50, v48, v53, v56, static_cast<int>(__simt_tid3.x));
  int v57 = 8;
  int v58 = v57 + v50;
  int v59 = v49[v58];
  int v60 = 2;
  int v61;
  v61 = v60;
  switch (v59) {
    case 0:
      {
      v61 = v50;
    }
    default:
      {
      int v62 = 12;
      int v63 = v62 + v50;
      int v64 = v49[v63];
      int v65;
      v65 = v50;
      switch (v64) {
        case 0:
          {
          int v66 = 16;
          int v67 = v66 + v50;
          int v68 = v49[v67];
          int v69 = 3;
          int v70;
          v70 = v69;
          switch (v68) {
            default:
              {
              int v71 = 3;
              int v72 = v50 + v71;
              v70 = v72;
              break;
            }
            case 0:
              {
              v70 = v50;
              break;
            }
          }
          bool v73 = true;
          v65 = v70;
          break;
        }
        default:
          {
          int v74 = 20;
          int v75 = v74 + v50;
          int v76 = v49[v75];
          int v77;
          v77 = v50;
          switch (v76) {
            case 0:
              {
              int v78 = 3;
              int v79 = v50 + v78;
              v77 = v79;
              break;
            }
            default:
              {
              int v80 = 2;
              v77 = v80;
              break;
            }
          }
          bool v81 = true;
          v65 = v77;
          break;
        }
        case 1:
          {
          int v82 = 24;
          int v83 = v82 + v50;
          int v84 = v49[v83];
          int v85;
          v85 = v50;
          switch (v84) {
            default:
              {
              v85 = v50;
            }
            case 0:
              {
              int v86 = 4;
              int v87 = v50 + v86;
              v85 = v87;
            }
            case 1:
              {
              int v88 = 0;
              int v89 = v50 + v88;
              v85 = v89;
              break;
            }
            case 2:
              {
              int v90 = 0;
              v85 = v90;
              break;
            }
          }
          bool v91 = true;
          v65 = v85;
          break;
        }
        case 2:
          {
          v65 = v50;
          break;
        }
      }
      bool v92 = true;
      v61 = v65;
      break;
    }
    case 1:
      {
      int v93 = 28;
      int v94 = v93 + v50;
      int v95 = v49[v94];
      int v96 = 3;
      int v97;
      v97 = v96;
      switch (v95) {
        case 0:
          {
          int v98 = 0;
          int v99 = 0;
          int v100;
          int v101;
          v100 = v98;
          v101 = v99;
          while (true) {
            int v102 = 4;
            int v103 = v101 * v102;
            int v104 = v103 + v50;
            int v105 = 32;
            int v106 = v105 + v104;
            int v107 = v49[v106];
            int v108 = 0;
            bool v109 = v107 != v108;
            v100 = v100;
            v101 = v101;
            if (!v109) break;
            int v110 = v100 + v101;
            int v111 = 1;
            int v112 = v101 + v111;
            v100 = v110;
            v101 = v112;
            continue;
            ;
          }
          bool v113 = true;
          v97 = v100;
          break;
        }
        default:
          {
          int v114 = 52;
          int v115 = v114 + v50;
          int v116 = v49[v115];
          int v117 = 0;
          bool v118 = v116 != v117;
          int v119;
          if (v118) {
            int v120 = 4;
            int v121 = v50 + v120;
            v119 = v121;
          } else {
            v119 = v50;
          }
          v97 = v119;
          break;
        }
        case 1:
          {
          int v122 = 56;
          int v123 = v122 + v50;
          int v124 = v49[v123];
          int v125 = 3;
          int v126;
          v126 = v125;
          switch (v124) {
            case 0:
              {
              int v127 = 2;
              int v128 = v50 + v127;
              v126 = v128;
              break;
            }
            case 1:
              {
              v126 = v50;
              break;
            }
            default:
              {
              v126 = v50;
              break;
            }
            case 2:
              {
              int v129 = 0;
              int v130 = v50 + v129;
              v126 = v130;
              break;
            }
          }
          bool v131 = true;
          v97 = v126;
          break;
        }
      }
      bool v132 = true;
      v61 = v97;
    }
    case 2:
      {
      int v133 = 60;
      int v134 = v133 + v50;
      int v135 = v49[v134];
      int v136 = 1;
      int v137 = v50 + v136;
      int v138;
      v138 = v137;
      switch (v135) {
        case 0:
          {
          int v139 = 64;
          int v140 = v139 + v50;
          int v141 = v49[v140];
          int v142 = 0;
          int v143;
          v143 = v142;
          switch (v141) {
            default:
              {
              v143 = v50;
            }
            case 0:
              {
              v143 = v50;
              break;
            }
          }
          bool v144 = true;
          v138 = v143;
          break;
        }
        default:
          {
          int v145 = 68;
          int v146 = v145 + v50;
          int v147 = v49[v146];
          int v148 = 0;
          bool v149 = v147 != v148;
          int v150;
          if (v149) {
            int v151 = 3;
            v150 = v151;
          } else {
            v150 = v50;
          }
          v138 = v150;
          break;
        }
        case 1:
          {
          int v152 = 0;
          int v153 = 0;
          int v154;
          int v155;
          v154 = v152;
          v155 = v153;
          while (true) {
            int v156 = 4;
            int v157 = v155 * v156;
            int v158 = v157 + v50;
            int v159 = 72;
            int v160 = v159 + v158;
            int v161 = v49[v160];
            int v162 = 0;
            bool v163 = v161 != v162;
            v154 = v154;
            v155 = v155;
            if (!v163) break;
            int v164 = v154 + v155;
            int v165 = 1;
            int v166 = v155 + v165;
            v154 = v164;
            v155 = v166;
            continue;
            ;
          }
          bool v167 = true;
          v138 = v154;
          break;
        }
      }
      bool v168 = true;
      v61 = v138;
      break;
    }
  }
  bool v169 = true;
  int v170 = 16;
  int v171 = v170 + v50;
  bool v172 = true;
  int v173 = simt_wave_count_bits(v172);
  v48[v171] = v173;
  int v174 = 92;
  int v175 = v174 + v50;
  int v176 = v49[v175];
  int v177 = 0;
  bool v178 = v176 != v177;
  int v179;
  if (v178) {
    int v180 = 96;
    int v181 = v180 + v50;
    int v182 = v49[v181];
    int v183 = 0;
    bool v184 = v182 != v183;
    int v185;
    if (v184) {
      int v186 = 0;
      int v187 = 0;
      int v188;
      int v189;
      v188 = v186;
      v189 = v187;
      while (true) {
        int v190 = 4;
        int v191 = v189 * v190;
        int v192 = v191 + v50;
        int v193 = 100;
        int v194 = v193 + v192;
        int v195 = v49[v194];
        int v196 = 0;
        bool v197 = v195 != v196;
        v188 = v188;
        v189 = v189;
        if (!v197) break;
        int v198 = v188 + v189;
        int v199 = 1;
        int v200 = v189 + v199;
        v188 = v198;
        v189 = v200;
      }
      bool v201 = true;
      v185 = v188;
    } else {
      int v202 = 120;
      int v203 = v202 + v50;
      int v204 = v49[v203];
      int v205 = 0;
      bool v206 = v204 != v205;
      int v207;
      if (v206) {
        v207 = v50;
      } else {
        uint v208 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v209 = (int)(v208);
        v207 = v209;
      }
      v185 = v207;
    }
    v179 = v185;
  } else {
    uint v210 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v211 = (int)(v210);
    v179 = v211;
  }
  int v212 = 32;
  int v213 = v212 + v50;
  bool v214 = true;
  int v215 = simt_wave_count_bits(v214);
  v48[v213] = v215;
  int v216 = 124;
  int v217 = v216 + v50;
  int v218 = v49[v217];
  int v219 = 0;
  bool v220 = v218 != v219;
  int v221;
  if (v220) {
    int v222 = 128;
    int v223 = v222 + v50;
    int v224 = v49[v223];
    int v225 = 3;
    int v226;
    v226 = v225;
    switch (v224) {
      case 0:
        {
        int v227 = 0;
        int v228 = 0;
        int v229;
        int v230;
        v229 = v227;
        v230 = v228;
        while (true) {
          int v231 = 4;
          int v232 = v230 * v231;
          int v233 = v232 + v50;
          int v234 = 132;
          int v235 = v234 + v233;
          int v236 = v49[v235];
          int v237 = 0;
          bool v238 = v236 != v237;
          v229 = v229;
          v230 = v230;
          if (!v238) break;
          int v239 = v229 + v230;
          int v240 = 1;
          int v241 = v230 + v240;
          v229 = v239;
          v230 = v241;
        }
        bool v242 = true;
        v226 = v229;
        break;
      }
      default:
        {
        int v243 = 152;
        int v244 = v243 + v50;
        int v245 = v49[v244];
        int v246 = 0;
        bool v247 = v245 != v246;
        int v248;
        if (v247) {
          int v249 = 3;
          v248 = v249;
        } else {
          int v250 = 0;
          v248 = v250;
        }
        v226 = v248;
        break;
      }
      case 1:
        {
        int v251 = 156;
        int v252 = v251 + v50;
        int v253 = v49[v252];
        int v254 = 0;
        bool v255 = v253 != v254;
        int v256;
        if (v255) {
          int v257 = 2;
          int v258 = v50 + v257;
          v256 = v258;
        } else {
          int v259 = 0;
          int v260 = v50 + v259;
          v256 = v260;
        }
        v226 = v256;
        break;
      }
    }
    bool v261 = true;
    v221 = v226;
  } else {
    int v262 = 160;
    int v263 = v262 + v50;
    int v264 = v49[v263];
    int v265 = 2;
    int v266;
    v266 = v265;
    switch (v264) {
      case 0:
        {
        int v267 = 0;
        int v268 = 0;
        int v269;
        int v270;
        v269 = v267;
        v270 = v268;
        while (true) {
          int v271 = 4;
          int v272 = v270 * v271;
          int v273 = v272 + v50;
          int v274 = 164;
          int v275 = v274 + v273;
          int v276 = v49[v275];
          int v277 = 0;
          bool v278 = v276 != v277;
          v269 = v269;
          v270 = v270;
          if (!v278) break;
          int v279 = v269 + v270;
          int v280 = 1;
          int v281 = v270 + v280;
          v269 = v279;
          v270 = v281;
        }
        bool v282 = true;
        v266 = v269;
        break;
      }
      case 1:
        {
        int v283 = 0;
        int v284 = 0;
        int v285;
        int v286;
        v285 = v283;
        v286 = v284;
        while (true) {
          int v287 = 4;
          int v288 = v286 * v287;
          int v289 = v288 + v50;
          int v290 = 184;
          int v291 = v290 + v289;
          int v292 = v49[v291];
          int v293 = 0;
          bool v294 = v292 != v293;
          v285 = v285;
          v286 = v286;
          if (!v294) break;
          int v295 = v285 + v286;
          int v296 = 1;
          int v297 = v286 + v296;
          v285 = v295;
          v286 = v297;
        }
        bool v298 = true;
        v266 = v285;
        break;
      }
      case 2:
        {
        v266 = v50;
        break;
      }
      default:
        {
        int v299 = 204;
        int v300 = v299 + v50;
        int v301 = v49[v300];
        int v302 = 0;
        bool v303 = v301 != v302;
        int v304;
        if (v303) {
          int v305 = 3;
          v304 = v305;
        } else {
          int v306 = 2;
          int v307 = v50 + v306;
          v304 = v307;
        }
        v266 = v304;
        break;
      }
    }
    bool v308 = true;
    v221 = v266;
  }
  int v309 = 48;
  int v310 = v309 + v50;
  bool v311 = true;
  int v312 = simt_wave_count_bits(v311);
  v48[v310] = v312;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 208; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
