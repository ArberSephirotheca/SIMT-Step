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
    bool v13 = true;
    int v14 = simt_wave_count_bits(v13);
    int v15 = 0;
    int v16 = 4;
    int v17 = v7 * v16;
    int v18 = v15 + v17;
    int v19 = v18 + v0;
    v1[v19] = v14;
    int v20 = 1;
    int v21 = v7 + v20;
    v6 = v14;
    v7 = v21;
    continue;
    ;
  }
  int v22 = 4;
  int v23 = v3 % v22;
  int v24 = 2;
  int v25 = v0 + v24;
  int v26;
  v26 = v25;
  switch (v23) {
    default:
      {
      int v27 = 3;
      int v28 = v3 % v27;
      int v29 = 1;
      int v30;
      v30 = v29;
      switch (v28) {
        case 0:
          {
          int v31 = 3;
          int v32 = v3 % v31;
          int v33 = 3;
          int v34 = v0 + v33;
          int v35;
          v35 = v34;
          switch (v32) {
            case 0:
              {
              int v36 = 4;
              int v37 = v0 + v36;
              v35 = v37;
              break;
            }
            case 1:
              {
              int v38 = 1;
              int v39 = v0 + v38;
              v35 = v39;
              break;
            }
            default:
              {
              int v40 = 0;
              int v41 = v0 + v40;
              v35 = v41;
              break;
            }
          }
          v30 = v35;
          break;
        }
        case 1:
          {
          int v42 = 0;
          bool v43 = v2 != v42;
          int v44;
          if (v43) {
            int v45 = 2;
            int v46 = v0 + v45;
            v44 = v46;
          } else {
            int v47 = 0;
            int v48 = v0 + v47;
            v44 = v48;
          }
          v30 = v44;
          break;
        }
        case 2:
          {
          int v49 = 0;
          v30 = v49;
          break;
        }
        default:
          {
          int v50 = 0;
          bool v51 = v2 != v50;
          int v52;
          if (v51) {
            int v53 = 3;
            v52 = v53;
          } else {
            int v54 = 4;
            v52 = v54;
          }
          v30 = v52;
          break;
        }
      }
      v26 = v30;
      break;
    }
    case 0:
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
          int v67 = 1;
          int v68 = v61 + v67;
          v60 = v0;
          v61 = v68;
        }
        v57 = v60;
      } else {
        int v69 = 3;
        int v70 = v3 % v69;
        int v71;
        v71 = v0;
        switch (v70) {
          default:
            {
            int v72 = 1;
            int v73 = v0 + v72;
            v71 = v73;
            break;
          }
          case 0:
            {
            int v74 = 1;
            int v75 = v0 + v74;
            v71 = v75;
            break;
          }
          case 1:
            {
            int v76 = 3;
            int v77 = v0 + v76;
            v71 = v77;
            break;
          }
        }
        v57 = v71;
      }
      v26 = v57;
      break;
    }
    case 1:
      {
      int v78 = 0;
      int v79 = 0;
      int v80;
      int v81;
      v80 = v78;
      v81 = v79;
      while (true) {
        int v82 = 4;
        int v83 = v3 % v82;
        int v84 = 1;
        int v85 = v83 + v84;
        bool v86 = v81 < v85;
        v80 = v80;
        v81 = v81;
        if (!v86) break;
        int v87 = 0;
        int v88 = 0;
        int v89;
        int v90;
        v89 = v87;
        v90 = v88;
        while (true) {
          int v91 = 4;
          int v92 = v3 % v91;
          int v93 = 1;
          int v94 = v92 + v93;
          bool v95 = v90 < v94;
          v89 = v89;
          v90 = v90;
          if (!v95) break;
          int v96 = 0;
          int v97 = 1;
          int v98 = v90 + v97;
          v89 = v96;
          v90 = v98;
        }
        int v99 = 1;
        int v100 = v81 + v99;
        v80 = v89;
        v81 = v100;
        break;
        ;
      }
      v26 = v80;
      break;
    }
    case 2:
      {
      int v101 = 3;
      int v102 = v3 % v101;
      int v103 = 2;
      int v104 = v0 + v103;
      int v105;
      v105 = v104;
      switch (v102) {
        case 0:
          {
          int v106 = 4;
          int v107 = v3 % v106;
          int v108 = 0;
          int v109 = v0 + v108;
          int v110;
          v110 = v109;
          switch (v107) {
            default:
              {
              v110 = v0;
            }
            case 0:
              {
              v110 = v0;
            }
            case 1:
              {
              int v111 = 2;
              int v112 = v0 + v111;
              v110 = v112;
            }
            case 2:
              {
              int v113 = 2;
              v110 = v113;
              break;
            }
          }
          v105 = v110;
        }
        default:
          {
          int v114 = 0;
          bool v115 = v2 != v114;
          int v116;
          if (v115) {
            int v117 = 0;
            v116 = v117;
          } else {
            int v118 = 4;
            int v119 = v0 + v118;
            v116 = v119;
          }
          v105 = v116;
          break;
        }
        case 1:
          {
          int v120 = 2;
          int v121 = v0 + v120;
          v105 = v121;
          break;
        }
      }
      v26 = v105;
      break;
    }
  }
  bool v122 = true;
  int v123 = simt_wave_count_bits(v122);
  int v124 = 16;
  int v125 = v124 + v0;
  v1[v125] = v123;
  int v126 = 0;
  bool v127 = v2 != v126;
  int v128 = v127 ? v6 : v26;
  return;
}

kernel void kernel_main(device int* v129 [[buffer(0)]], device int* v130 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v131 = static_cast<int>(__simt_tid3.x);
  int v132 = 0;
  int v133 = v132 + v131;
  int v134 = v130[v133];
  int v135 = 4;
  int v136 = v135 + v131;
  int v137 = v130[v136];
  helper0(v131, v129, v134, v137, static_cast<int>(__simt_tid3.x));
  int v138 = 0;
  int v139 = 0;
  int v140;
  int v141;
  v140 = v138;
  v141 = v139;
  while (true) {
    int v142 = 4;
    int v143 = v141 * v142;
    int v144 = v143 + v131;
    int v145 = 8;
    int v146 = v145 + v144;
    int v147 = v130[v146];
    int v148 = 0;
    bool v149 = v147 != v148;
    v140 = v140;
    v141 = v141;
    if (!v149) break;
    int v150 = 0;
    int v151 = 0;
    int v152;
    int v153;
    v152 = v150;
    v153 = v151;
    while (true) {
      int v154 = 4;
      int v155 = v153 * v154;
      int v156 = v155 + v131;
      int v157 = 28;
      int v158 = v157 + v156;
      int v159 = v130[v158];
      int v160 = 0;
      bool v161 = v159 != v160;
      v152 = v152;
      v153 = v153;
      if (!v161) break;
      int v162 = v152 + v153;
      int v163 = 1;
      int v164 = v153 + v163;
      bool v165 = true;
      int v166 = 32;
      int v167 = 4;
      int v168 = v153 * v167;
      int v169 = v166 + v168;
      int v170 = v169 + v131;
      bool v171 = true;
      int v172 = simt_wave_count_bits(v171);
      v129[v170] = v172;
      v152 = v162;
      v153 = v164;
    }
    int v173 = v140 + v152;
    int v174 = 1;
    int v175 = v141 + v174;
    bool v176 = true;
    int v177 = 48;
    int v178 = 4;
    int v179 = v141 * v178;
    int v180 = v177 + v179;
    int v181 = v180 + v131;
    bool v182 = true;
    int v183 = simt_wave_count_bits(v182);
    v129[v181] = v183;
    v140 = v173;
    v141 = v175;
  }
  int v184 = 48;
  int v185 = v184 + v131;
  int v186 = v130[v185];
  int v187;
  v187 = v131;
  switch (v186) {
    case 0:
      {
      int v188 = 52;
      int v189 = v188 + v131;
      int v190 = v130[v189];
      int v191;
      v191 = v131;
      switch (v190) {
        default:
          {
          int v192 = 56;
          int v193 = v192 + v131;
          int v194 = v130[v193];
          int v195 = 0;
          bool v196 = v194 != v195;
          int v197;
          if (v196) {
            v197 = v131;
          } else {
            int v198 = 2;
            int v199 = v131 + v198;
            v197 = v199;
          }
          v191 = v197;
        }
        case 0:
          {
          int v200 = 60;
          int v201 = v200 + v131;
          int v202 = v130[v201];
          int v203 = 0;
          bool v204 = v202 != v203;
          int v205;
          if (v204) {
            v205 = v131;
          } else {
            int v206 = 0;
            v205 = v206;
          }
          v191 = v205;
        }
        case 1:
          {
          int v207 = 0;
          int v208 = 0;
          int v209;
          int v210;
          v209 = v207;
          v210 = v208;
          while (true) {
            int v211 = 4;
            int v212 = v210 * v211;
            int v213 = v212 + v131;
            int v214 = 64;
            int v215 = v214 + v213;
            int v216 = v130[v215];
            int v217 = 0;
            bool v218 = v216 != v217;
            v209 = v209;
            v210 = v210;
            if (!v218) break;
            int v219 = v209 + v210;
            int v220 = 1;
            int v221 = v210 + v220;
            bool v222 = true;
            v209 = v219;
            v210 = v221;
          }
          v191 = v209;
          break;
        }
      }
      v187 = v191;
      break;
    }
    default:
      {
      int v223 = 84;
      int v224 = v223 + v131;
      int v225 = v130[v224];
      int v226 = 0;
      bool v227 = v225 != v226;
      int v228;
      if (v227) {
        int v229 = 1;
        v228 = v229;
      } else {
        int v230 = 88;
        int v231 = v230 + v131;
        int v232 = v130[v231];
        int v233 = 2;
        int v234;
        v234 = v233;
        switch (v232) {
          case 0:
            {
            v234 = v131;
            break;
          }
          default:
            {
            v234 = v131;
            break;
          }
          case 1:
            {
            int v235 = 0;
            v234 = v235;
            break;
          }
          case 2:
            {
            int v236 = 3;
            int v237 = v131 + v236;
            v234 = v237;
            break;
          }
        }
        v228 = v234;
      }
      v187 = v228;
      break;
    }
    case 1:
      {
      int v238 = 92;
      int v239 = v238 + v131;
      int v240 = v130[v239];
      int v241 = 0;
      bool v242 = v240 != v241;
      int v243;
      if (v242) {
        int v244 = 0;
        int v245 = 0;
        int v246;
        int v247;
        v246 = v244;
        v247 = v245;
        while (true) {
          int v248 = 4;
          int v249 = v247 * v248;
          int v250 = v249 + v131;
          int v251 = 96;
          int v252 = v251 + v250;
          int v253 = v130[v252];
          int v254 = 0;
          bool v255 = v253 != v254;
          v246 = v246;
          v247 = v247;
          if (!v255) break;
          int v256 = v246 + v247;
          int v257 = 1;
          int v258 = v247 + v257;
          bool v259 = true;
          v246 = v256;
          v247 = v258;
        }
        v243 = v246;
      } else {
        int v260 = 116;
        int v261 = v260 + v131;
        int v262 = v130[v261];
        int v263 = 3;
        int v264 = v131 + v263;
        int v265;
        v265 = v264;
        switch (v262) {
          case 0:
            {
            int v266 = 2;
            v265 = v266;
          }
          default:
            {
            v265 = v131;
            break;
          }
        }
        bool v267 = true;
        v243 = v265;
      }
      v187 = v243;
      break;
    }
    case 2:
      {
      int v268 = 120;
      int v269 = v268 + v131;
      int v270 = v130[v269];
      int v271 = 4;
      int v272 = v131 + v271;
      int v273;
      v273 = v272;
      switch (v270) {
        case 0:
          {
          int v274 = 2;
          int v275 = v131 + v274;
          v273 = v275;
          break;
        }
        case 1:
          {
          int v276 = 0;
          int v277 = 0;
          int v278;
          int v279;
          v278 = v276;
          v279 = v277;
          while (true) {
            int v280 = 4;
            int v281 = v279 * v280;
            int v282 = v281 + v131;
            int v283 = 124;
            int v284 = v283 + v282;
            int v285 = v130[v284];
            int v286 = 0;
            bool v287 = v285 != v286;
            v278 = v278;
            v279 = v279;
            if (!v287) break;
            int v288 = v278 + v279;
            int v289 = 1;
            int v290 = v279 + v289;
            bool v291 = true;
            v278 = v288;
            v279 = v290;
            continue;
            ;
          }
          v273 = v278;
        }
        default:
          {
          int v292 = 0;
          int v293 = 0;
          int v294;
          int v295;
          v294 = v292;
          v295 = v293;
          while (true) {
            int v296 = 4;
            int v297 = v295 * v296;
            int v298 = v297 + v131;
            int v299 = 144;
            int v300 = v299 + v298;
            int v301 = v130[v300];
            int v302 = 0;
            bool v303 = v301 != v302;
            v294 = v294;
            v295 = v295;
            if (!v303) break;
            int v304 = v294 + v295;
            int v305 = 1;
            int v306 = v295 + v305;
            bool v307 = true;
            v294 = v304;
            v295 = v306;
          }
          v273 = v294;
          break;
        }
        case 2:
          {
          int v308 = 164;
          int v309 = v308 + v131;
          int v310 = v130[v309];
          int v311 = 0;
          bool v312 = v310 != v311;
          int v313;
          if (v312) {
            v313 = v131;
          } else {
            int v314 = 1;
            int v315 = v131 + v314;
            v313 = v315;
          }
          v273 = v313;
          break;
        }
      }
      bool v316 = true;
      v187 = v273;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 64; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 168; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
