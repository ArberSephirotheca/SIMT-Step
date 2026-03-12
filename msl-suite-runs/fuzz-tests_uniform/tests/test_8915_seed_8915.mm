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
  int v6;
  v6 = v0;
  switch (v5) {
    case 0:
      {
      int v7 = 4;
      v6 = v7;
      break;
    }
    case 1:
      {
      int v8 = 0;
      bool v9 = v2 != v8;
      int v10;
      if (v9) {
        int v11 = 4;
        int v12 = v0 + v11;
        v10 = v12;
      } else {
        int v13 = 0;
        int v14 = v0 + v13;
        v10 = v14;
      }
      int v15 = 1;
      v6 = v10;
      break;
    }
    default:
      {
      int v16 = 1;
      int v17 = v0 + v16;
      v6 = v17;
      break;
    }
  }
  bool v18 = true;
  int v19 = simt_wave_count_bits(v18);
  int v20 = 0;
  int v21 = v20 + v0;
  v1[v21] = v19;
  int v22 = 0;
  bool v23 = v2 != v22;
  int v24;
  if (v23) {
    int v25 = 2;
    int v26 = v3 % v25;
    uint v27 = simt_subgroup_id(__simt_tid);
    int v28 = (int)(v27);
    int v29;
    v29 = v28;
    switch (v26) {
      default:
        {
        int v30 = 1;
        v29 = v30;
        break;
      }
      case 0:
        {
        v29 = v0;
      }
      case 1:
        {
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
          int v40 = 2;
          int v41 = v0 + v40;
          int v42 = 1;
          int v43 = v34 + v42;
          v33 = v41;
          v34 = v43;
        }
        int v44 = 4;
        v29 = v33;
        break;
      }
    }
    int v45 = 2;
    int v46 = v0 + v45;
    v24 = v29;
  } else {
    int v47 = 3;
    int v48 = v3 % v47;
    int v49 = 1;
    int v50;
    v50 = v49;
    switch (v48) {
      default:
        {
        int v51 = 0;
        int v52 = 0;
        int v53;
        int v54;
        v53 = v51;
        v54 = v52;
        while (true) {
          int v55 = 4;
          int v56 = v3 % v55;
          int v57 = 1;
          int v58 = v56 + v57;
          bool v59 = v54 < v58;
          v53 = v53;
          v54 = v54;
          if (!v59) break;
          int v60 = 1;
          int v61 = 1;
          int v62 = v54 + v61;
          v53 = v60;
          v54 = v62;
        }
        int v63 = 3;
        v50 = v53;
        break;
      }
      case 0:
        {
        int v64 = 0;
        v50 = v64;
        break;
      }
      case 1:
        {
        int v65 = 2;
        int v66 = v3 % v65;
        int v67 = 4;
        int v68 = v0 + v67;
        int v69;
        v69 = v68;
        switch (v66) {
          default:
            {
            int v70 = 0;
            v69 = v70;
            break;
          }
          case 0:
            {
            int v71 = 2;
            v69 = v71;
            break;
          }
        }
        v50 = v69;
      }
      case 2:
        {
        int v72 = 0;
        int v73 = 0;
        int v74;
        int v75;
        v74 = v72;
        v75 = v73;
        while (true) {
          int v76 = 4;
          int v77 = v3 % v76;
          int v78 = 1;
          int v79 = v77 + v78;
          bool v80 = v75 < v79;
          v74 = v74;
          v75 = v75;
          if (!v80) break;
          int v81 = 2;
          int v82 = v0 + v81;
          int v83 = 1;
          int v84 = v75 + v83;
          v74 = v82;
          v75 = v84;
        }
        int v85 = 4;
        v50 = v74;
        break;
      }
    }
    uint v86 = simt_subgroup_id(__simt_tid);
    int v87 = (int)(v86);
    v24 = v50;
  }
  bool v88 = true;
  int v89 = simt_wave_count_bits(v88);
  int v90 = 16;
  int v91 = v90 + v0;
  v1[v91] = v89;
  int v92 = 0;
  bool v93 = v2 != v92;
  int v94 = v93 ? v6 : v24;
  return;
}

kernel void kernel_main(device int* v95 [[buffer(0)]], device int* v96 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v97 = static_cast<int>(__simt_tid3.x);
  int v98 = 0;
  int v99 = v98 + v97;
  int v100 = v96[v99];
  int v101 = 4;
  int v102 = v101 + v97;
  int v103 = v96[v102];
  helper0(v97, v95, v100, v103, static_cast<int>(__simt_tid3.x));
  int v104 = 8;
  int v105 = v104 + v97;
  int v106 = v96[v105];
  int v107 = 0;
  bool v108 = v106 != v107;
  int v109;
  if (v108) {
    int v110 = 12;
    int v111 = v110 + v97;
    int v112 = v96[v111];
    int v113 = 0;
    bool v114 = v112 != v113;
    int v115;
    if (v114) {
      uint v116 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v117 = (int)(v116);
      v115 = v117;
    } else {
      int v118 = 16;
      int v119 = v118 + v97;
      int v120 = v96[v119];
      int v121;
      v121 = v97;
      switch (v120) {
        default:
          {
          v121 = v97;
          break;
        }
        case 0:
          {
          int v122 = 1;
          int v123 = v97 + v122;
          v121 = v123;
          break;
        }
        case 1:
          {
          v121 = v97;
          break;
        }
      }
      bool v124 = true;
      v115 = v121;
    }
    v109 = v115;
  } else {
    int v125 = 20;
    int v126 = v125 + v97;
    int v127 = v96[v126];
    int v128 = 0;
    bool v129 = v127 != v128;
    int v130;
    if (v129) {
      v130 = v97;
    } else {
      int v131 = 24;
      int v132 = v131 + v97;
      int v133 = v96[v132];
      int v134 = 0;
      bool v135 = v133 != v134;
      int v136;
      if (v135) {
        v136 = v97;
      } else {
        v136 = v97;
      }
      v130 = v136;
    }
    v109 = v130;
  }
  int v137 = 32;
  int v138 = v137 + v97;
  bool v139 = true;
  int v140 = simt_wave_count_bits(v139);
  v95[v138] = v140;
  int v141 = 0;
  int v142 = 0;
  int v143;
  int v144;
  v143 = v141;
  v144 = v142;
  while (true) {
    int v145 = 4;
    int v146 = v144 * v145;
    int v147 = v146 + v97;
    int v148 = 28;
    int v149 = v148 + v147;
    int v150 = v96[v149];
    int v151 = 0;
    bool v152 = v150 != v151;
    v143 = v143;
    v144 = v144;
    if (!v152) break;
    int v153 = 48;
    int v154 = v153 + v97;
    int v155 = v96[v154];
    int v156 = 0;
    bool v157 = v155 != v156;
    int v158;
    if (v157) {
      int v159 = 0;
      int v160 = 0;
      int v161;
      int v162;
      v161 = v159;
      v162 = v160;
      while (true) {
        int v163 = 4;
        int v164 = v162 * v163;
        int v165 = v164 + v97;
        int v166 = 52;
        int v167 = v166 + v165;
        int v168 = v96[v167];
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
    } else {
      int v175 = 0;
      int v176 = 0;
      int v177;
      int v178;
      v177 = v175;
      v178 = v176;
      while (true) {
        int v179 = 4;
        int v180 = v178 * v179;
        int v181 = v180 + v97;
        int v182 = 72;
        int v183 = v182 + v181;
        int v184 = v96[v183];
        int v185 = 0;
        bool v186 = v184 != v185;
        v177 = v177;
        v178 = v178;
        if (!v186) break;
        int v187 = v177 + v178;
        int v188 = 1;
        int v189 = v178 + v188;
        v177 = v187;
        v178 = v189;
        break;
        ;
      }
      bool v190 = true;
      v158 = v177;
    }
    int v191 = v143 + v158;
    int v192 = 1;
    int v193 = v144 + v192;
    v143 = v191;
    v144 = v193;
    continue;
    ;
  }
  bool v194 = true;
  int v195 = 48;
  int v196 = v195 + v97;
  bool v197 = true;
  int v198 = simt_wave_count_bits(v197);
  v95[v196] = v198;
  int v199 = 92;
  int v200 = v199 + v97;
  int v201 = v96[v200];
  uint v202 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v203 = (int)(v202);
  int v204;
  v204 = v203;
  switch (v201) {
    case 0:
      {
      int v205 = 96;
      int v206 = v205 + v97;
      int v207 = v96[v206];
      int v208 = 2;
      int v209 = v97 + v208;
      int v210;
      v210 = v209;
      switch (v207) {
        case 0:
          {
          int v211 = 100;
          int v212 = v211 + v97;
          int v213 = v96[v212];
          int v214 = 2;
          int v215;
          v215 = v214;
          switch (v213) {
            case 0:
              {
              int v216 = 4;
              int v217 = v97 + v216;
              v215 = v217;
            }
            default:
              {
              int v218 = 1;
              v215 = v218;
              break;
            }
            case 1:
              {
              int v219 = 1;
              v215 = v219;
              break;
            }
            case 2:
              {
              int v220 = 0;
              int v221 = v97 + v220;
              v215 = v221;
              break;
            }
          }
          bool v222 = true;
          v210 = v215;
          break;
        }
        default:
          {
          int v223 = 104;
          int v224 = v223 + v97;
          int v225 = v96[v224];
          int v226 = 0;
          bool v227 = v225 != v226;
          int v228;
          if (v227) {
            v228 = v97;
          } else {
            v228 = v97;
          }
          v210 = v228;
          break;
        }
        case 1:
          {
          int v229 = 108;
          int v230 = v229 + v97;
          int v231 = v96[v230];
          int v232;
          v232 = v97;
          switch (v231) {
            case 0:
              {
              int v233 = 0;
              int v234 = v97 + v233;
              v232 = v234;
            }
            default:
              {
              int v235 = 1;
              int v236 = v97 + v235;
              v232 = v236;
              break;
            }
          }
          bool v237 = true;
          v210 = v232;
          break;
        }
        case 2:
          {
          int v238 = 112;
          int v239 = v238 + v97;
          int v240 = v96[v239];
          int v241 = 3;
          int v242 = v97 + v241;
          int v243;
          v243 = v242;
          switch (v240) {
            case 0:
              {
              int v244 = 2;
              v243 = v244;
              break;
            }
            default:
              {
              v243 = v97;
              break;
            }
            case 1:
              {
              v243 = v97;
              break;
            }
          }
          bool v245 = true;
          v210 = v243;
          break;
        }
      }
      bool v246 = true;
      v204 = v210;
    }
    case 1:
      {
      int v247 = 116;
      int v248 = v247 + v97;
      int v249 = v96[v248];
      int v250 = 4;
      int v251 = v97 + v250;
      int v252;
      v252 = v251;
      switch (v249) {
        default:
          {
          int v253 = 120;
          int v254 = v253 + v97;
          int v255 = v96[v254];
          int v256 = 0;
          bool v257 = v255 != v256;
          int v258;
          if (v257) {
            v258 = v97;
          } else {
            int v259 = 4;
            v258 = v259;
          }
          v252 = v258;
          break;
        }
        case 0:
          {
          v252 = v97;
          break;
        }
      }
      bool v260 = true;
      v204 = v252;
    }
    default:
      {
      int v261 = 124;
      int v262 = v261 + v97;
      int v263 = v96[v262];
      int v264 = 3;
      int v265;
      v265 = v264;
      switch (v263) {
        default:
          {
          int v266 = 128;
          int v267 = v266 + v97;
          int v268 = v96[v267];
          int v269 = 0;
          bool v270 = v268 != v269;
          int v271;
          if (v270) {
            v271 = v97;
          } else {
            v271 = v97;
          }
          v265 = v271;
          break;
        }
        case 0:
          {
          int v272 = 132;
          int v273 = v272 + v97;
          int v274 = v96[v273];
          int v275 = 0;
          bool v276 = v274 != v275;
          int v277;
          if (v276) {
            v277 = v97;
          } else {
            int v278 = 4;
            int v279 = v97 + v278;
            v277 = v279;
          }
          v265 = v277;
          break;
        }
        case 1:
          {
          int v280 = 0;
          int v281 = 0;
          int v282;
          int v283;
          v282 = v280;
          v283 = v281;
          while (true) {
            int v284 = 4;
            int v285 = v283 * v284;
            int v286 = v285 + v97;
            int v287 = 136;
            int v288 = v287 + v286;
            int v289 = v96[v288];
            int v290 = 0;
            bool v291 = v289 != v290;
            v282 = v282;
            v283 = v283;
            if (!v291) break;
            int v292 = v282 + v283;
            int v293 = 1;
            int v294 = v283 + v293;
            v282 = v292;
            v283 = v294;
          }
          bool v295 = true;
          v265 = v282;
          break;
        }
      }
      bool v296 = true;
      v204 = v265;
    }
    case 2:
      {
      int v297 = 156;
      int v298 = v297 + v97;
      int v299 = v96[v298];
      int v300 = 0;
      bool v301 = v299 != v300;
      int v302;
      if (v301) {
        int v303 = 160;
        int v304 = v303 + v97;
        int v305 = v96[v304];
        int v306 = 0;
        bool v307 = v305 != v306;
        int v308;
        if (v307) {
          int v309 = 3;
          v308 = v309;
        } else {
          int v310 = 2;
          v308 = v310;
        }
        v302 = v308;
      } else {
        int v311 = 164;
        int v312 = v311 + v97;
        int v313 = v96[v312];
        int v314 = 3;
        int v315;
        v315 = v314;
        switch (v313) {
          case 0:
            {
            int v316 = 3;
            int v317 = v97 + v316;
            v315 = v317;
            break;
          }
          case 1:
            {
            int v318 = 0;
            v315 = v318;
            break;
          }
          default:
            {
            int v319 = 3;
            int v320 = v97 + v319;
            v315 = v320;
            break;
          }
        }
        bool v321 = true;
        v302 = v315;
      }
      v204 = v302;
      break;
    }
  }
  bool v322 = true;
  int v323 = 64;
  int v324 = v323 + v97;
  bool v325 = true;
  int v326 = simt_wave_count_bits(v325);
  v95[v324] = v326;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
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
