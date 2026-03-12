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
      int v7 = 0;
      int v8 = 0;
      int v9;
      int v10;
      v9 = v7;
      v10 = v8;
      while (true) {
        int v11 = 4;
        int v12 = v3 % v11;
        int v13 = 1;
        int v14 = v12 + v13;
        bool v15 = v10 < v14;
        v9 = v9;
        v10 = v10;
        if (!v15) break;
        int v16 = 1;
        int v17 = v0 + v16;
        int v18 = 1;
        int v19 = v10 + v18;
        v9 = v17;
        v10 = v19;
      }
      int v20 = 1;
      int v21 = v0 + v20;
      v6 = v9;
      break;
    }
    case 1:
      {
      int v22 = 0;
      int v23 = 0;
      int v24;
      int v25;
      v24 = v22;
      v25 = v23;
      while (true) {
        int v26 = 4;
        int v27 = v3 % v26;
        int v28 = 1;
        int v29 = v27 + v28;
        bool v30 = v25 < v29;
        v24 = v24;
        v25 = v25;
        if (!v30) break;
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
        int v45 = 1;
        int v46 = v25 + v45;
        v24 = v33;
        v25 = v46;
        continue;
        ;
      }
      int v47 = 2;
      v6 = v24;
      break;
    }
    case 2:
      {
      int v48 = 1;
      v6 = v48;
      break;
    }
    default:
      {
      int v49 = 0;
      int v50 = 0;
      int v51;
      int v52;
      v51 = v49;
      v52 = v50;
      while (true) {
        int v53 = 4;
        int v54 = v3 % v53;
        int v55 = 1;
        int v56 = v54 + v55;
        bool v57 = v52 < v56;
        v51 = v51;
        v52 = v52;
        if (!v57) break;
        int v58 = 0;
        bool v59 = v2 != v58;
        int v60;
        if (v59) {
          v60 = v0;
        } else {
          v60 = v0;
        }
        int v61 = 4;
        int v62 = v0 + v61;
        int v63 = 1;
        int v64 = v52 + v63;
        v51 = v60;
        v52 = v64;
        continue;
        ;
      }
      int v65 = 2;
      v6 = v51;
      break;
    }
  }
  bool v66 = true;
  int v67 = simt_wave_count_bits(v66);
  int v68 = 0;
  int v69 = v68 + v0;
  v1[v69] = v67;
  return;
}

kernel void kernel_main(device int* v70 [[buffer(0)]], device int* v71 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v72 = static_cast<int>(__simt_tid3.x);
  int v73 = 0;
  int v74 = v73 + v72;
  int v75 = v71[v74];
  int v76 = 4;
  int v77 = v76 + v72;
  int v78 = v71[v77];
  helper0(v72, v70, v75, v78, static_cast<int>(__simt_tid3.x));
  int v79 = 8;
  int v80 = v79 + v72;
  int v81 = v71[v80];
  uint v82 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v83 = (int)(v82);
  int v84;
  v84 = v83;
  switch (v81) {
    case 0:
      {
      int v85 = 12;
      int v86 = v85 + v72;
      int v87 = v71[v86];
      int v88 = 0;
      bool v89 = v87 != v88;
      int v90;
      if (v89) {
        int v91 = 4;
        int v92 = v72 + v91;
        v90 = v92;
      } else {
        int v93 = 16;
        int v94 = v93 + v72;
        int v95 = v71[v94];
        int v96 = 0;
        bool v97 = v95 != v96;
        int v98;
        if (v97) {
          int v99 = 1;
          v98 = v99;
        } else {
          v98 = v72;
        }
        v90 = v98;
      }
      v84 = v90;
      break;
    }
    default:
      {
      int v100 = 20;
      int v101 = v100 + v72;
      int v102 = v71[v101];
      int v103;
      v103 = v72;
      switch (v102) {
        case 0:
          {
          int v104 = 24;
          int v105 = v104 + v72;
          int v106 = v71[v105];
          int v107 = 0;
          bool v108 = v106 != v107;
          int v109;
          if (v108) {
            int v110 = 1;
            int v111 = v72 + v110;
            v109 = v111;
          } else {
            v109 = v72;
          }
          v103 = v109;
          break;
        }
        case 1:
          {
          int v112 = 28;
          int v113 = v112 + v72;
          int v114 = v71[v113];
          int v115 = 1;
          int v116;
          v116 = v115;
          switch (v114) {
            case 0:
              {
              int v117 = 0;
              int v118 = v72 + v117;
              v116 = v118;
              break;
            }
            case 1:
              {
              int v119 = 1;
              int v120 = v72 + v119;
              v116 = v120;
              break;
            }
            default:
              {
              v116 = v72;
              break;
            }
          }
          bool v121 = true;
          v103 = v116;
          break;
        }
        case 2:
          {
          int v122 = 0;
          int v123 = 0;
          int v124;
          int v125;
          v124 = v122;
          v125 = v123;
          while (true) {
            int v126 = 4;
            int v127 = v125 * v126;
            int v128 = v127 + v72;
            int v129 = 32;
            int v130 = v129 + v128;
            int v131 = v71[v130];
            int v132 = 0;
            bool v133 = v131 != v132;
            v124 = v124;
            v125 = v125;
            if (!v133) break;
            int v134 = v124 + v125;
            int v135 = 1;
            int v136 = v125 + v135;
            v124 = v134;
            v125 = v136;
          }
          bool v137 = true;
          v103 = v124;
          break;
        }
        default:
          {
          int v138 = 0;
          int v139 = v72 + v138;
          v103 = v139;
          break;
        }
      }
      bool v140 = true;
      v84 = v103;
      break;
    }
  }
  bool v141 = true;
  int v142 = 16;
  int v143 = v142 + v72;
  bool v144 = true;
  int v145 = simt_wave_count_bits(v144);
  v70[v143] = v145;
  int v146 = 52;
  int v147 = v146 + v72;
  int v148 = v71[v147];
  int v149 = 0;
  int v150 = v72 + v149;
  int v151;
  v151 = v150;
  switch (v148) {
    case 0:
      {
      int v152 = 56;
      int v153 = v152 + v72;
      int v154 = v71[v153];
      int v155 = 0;
      bool v156 = v154 != v155;
      int v157;
      if (v156) {
        int v158 = 2;
        v157 = v158;
      } else {
        int v159 = 60;
        int v160 = v159 + v72;
        int v161 = v71[v160];
        int v162 = 4;
        int v163 = v72 + v162;
        int v164;
        v164 = v163;
        switch (v161) {
          default:
            {
            int v165 = 0;
            int v166 = v72 + v165;
            v164 = v166;
            break;
          }
          case 0:
            {
            int v167 = 3;
            int v168 = v72 + v167;
            v164 = v168;
            break;
          }
        }
        bool v169 = true;
        v157 = v164;
      }
      v151 = v157;
    }
    case 1:
      {
      int v170 = 64;
      int v171 = v170 + v72;
      int v172 = v71[v171];
      int v173 = 2;
      int v174;
      v174 = v173;
      switch (v172) {
        default:
          {
          int v175 = 0;
          int v176 = 0;
          int v177;
          int v178;
          v177 = v175;
          v178 = v176;
          while (true) {
            int v179 = 4;
            int v180 = v178 * v179;
            int v181 = v180 + v72;
            int v182 = 68;
            int v183 = v182 + v181;
            int v184 = v71[v183];
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
          }
          bool v190 = true;
          v174 = v177;
          break;
        }
        case 0:
          {
          int v191 = 88;
          int v192 = v191 + v72;
          int v193 = v71[v192];
          int v194 = 3;
          int v195;
          v195 = v194;
          switch (v193) {
            case 0:
              {
              v195 = v72;
              break;
            }
            default:
              {
              v195 = v72;
            }
            case 1:
              {
              int v196 = 2;
              v195 = v196;
              break;
            }
            case 2:
              {
              v195 = v72;
              break;
            }
          }
          bool v197 = true;
          v174 = v195;
        }
        case 1:
          {
          int v198 = 92;
          int v199 = v198 + v72;
          int v200 = v71[v199];
          int v201 = 0;
          bool v202 = v200 != v201;
          int v203;
          if (v202) {
            v203 = v72;
          } else {
            int v204 = 1;
            int v205 = v72 + v204;
            v203 = v205;
          }
          v174 = v203;
          break;
        }
      }
      bool v206 = true;
      v151 = v174;
      break;
    }
    case 2:
      {
      int v207 = 4;
      int v208 = v72 + v207;
      v151 = v208;
    }
    default:
      {
      int v209 = 96;
      int v210 = v209 + v72;
      int v211 = v71[v210];
      int v212 = 0;
      bool v213 = v211 != v212;
      int v214;
      if (v213) {
        int v215 = 100;
        int v216 = v215 + v72;
        int v217 = v71[v216];
        int v218 = 0;
        bool v219 = v217 != v218;
        int v220;
        if (v219) {
          v220 = v72;
        } else {
          int v221 = 3;
          int v222 = v72 + v221;
          v220 = v222;
        }
        v214 = v220;
      } else {
        int v223 = 0;
        int v224 = 0;
        int v225;
        int v226;
        v225 = v223;
        v226 = v224;
        while (true) {
          int v227 = 4;
          int v228 = v226 * v227;
          int v229 = v228 + v72;
          int v230 = 104;
          int v231 = v230 + v229;
          int v232 = v71[v231];
          int v233 = 0;
          bool v234 = v232 != v233;
          v225 = v225;
          v226 = v226;
          if (!v234) break;
          int v235 = v225 + v226;
          int v236 = 1;
          int v237 = v226 + v236;
          v225 = v235;
          v226 = v237;
        }
        bool v238 = true;
        v214 = v225;
      }
      v151 = v214;
      break;
    }
  }
  bool v239 = true;
  int v240 = 32;
  int v241 = v240 + v72;
  bool v242 = true;
  int v243 = simt_wave_count_bits(v242);
  v70[v241] = v243;
  int v244 = 124;
  int v245 = v244 + v72;
  int v246 = v71[v245];
  int v247 = 0;
  bool v248 = v246 != v247;
  int v249;
  if (v248) {
    int v250 = 128;
    int v251 = v250 + v72;
    int v252 = v71[v251];
    int v253;
    v253 = v72;
    switch (v252) {
      default:
        {
        int v254 = 0;
        int v255 = 0;
        int v256;
        int v257;
        v256 = v254;
        v257 = v255;
        while (true) {
          int v258 = 4;
          int v259 = v257 * v258;
          int v260 = v259 + v72;
          int v261 = 132;
          int v262 = v261 + v260;
          int v263 = v71[v262];
          int v264 = 0;
          bool v265 = v263 != v264;
          v256 = v256;
          v257 = v257;
          if (!v265) break;
          int v266 = v256 + v257;
          int v267 = 1;
          int v268 = v257 + v267;
          v256 = v266;
          v257 = v268;
        }
        bool v269 = true;
        v253 = v256;
        break;
      }
      case 0:
        {
        int v270 = 152;
        int v271 = v270 + v72;
        int v272 = v71[v271];
        int v273 = 0;
        bool v274 = v272 != v273;
        int v275;
        if (v274) {
          int v276 = 3;
          int v277 = v72 + v276;
          v275 = v277;
        } else {
          int v278 = 4;
          int v279 = v72 + v278;
          v275 = v279;
        }
        v253 = v275;
        break;
      }
      case 1:
        {
        int v280 = 156;
        int v281 = v280 + v72;
        int v282 = v71[v281];
        int v283 = 0;
        bool v284 = v282 != v283;
        int v285;
        if (v284) {
          int v286 = 4;
          int v287 = v72 + v286;
          v285 = v287;
        } else {
          v285 = v72;
        }
        v253 = v285;
        break;
      }
      case 2:
        {
        int v288 = 160;
        int v289 = v288 + v72;
        int v290 = v71[v289];
        int v291 = 3;
        int v292 = v72 + v291;
        int v293;
        v293 = v292;
        switch (v290) {
          default:
            {
            v293 = v72;
            break;
          }
          case 0:
            {
            int v294 = 2;
            int v295 = v72 + v294;
            v293 = v295;
            break;
          }
        }
        bool v296 = true;
        v253 = v293;
        break;
      }
    }
    bool v297 = true;
    v249 = v253;
  } else {
    int v298 = 164;
    int v299 = v298 + v72;
    int v300 = v71[v299];
    int v301 = 0;
    bool v302 = v300 != v301;
    int v303;
    if (v302) {
      int v304 = 168;
      int v305 = v304 + v72;
      int v306 = v71[v305];
      uint v307 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v308 = (int)(v307);
      int v309;
      v309 = v308;
      switch (v306) {
        case 0:
          {
          int v310 = 1;
          int v311 = v72 + v310;
          v309 = v311;
          break;
        }
        case 1:
          {
          int v312 = 2;
          v309 = v312;
          break;
        }
        default:
          {
          int v313 = 0;
          int v314 = v72 + v313;
          v309 = v314;
          break;
        }
      }
      bool v315 = true;
      v303 = v309;
    } else {
      int v316 = 0;
      int v317 = 0;
      int v318;
      int v319;
      v318 = v316;
      v319 = v317;
      while (true) {
        int v320 = 4;
        int v321 = v319 * v320;
        int v322 = v321 + v72;
        int v323 = 172;
        int v324 = v323 + v322;
        int v325 = v71[v324];
        int v326 = 0;
        bool v327 = v325 != v326;
        v318 = v318;
        v319 = v319;
        if (!v327) break;
        int v328 = v318 + v319;
        int v329 = 1;
        int v330 = v319 + v329;
        v318 = v328;
        v319 = v330;
        break;
        ;
      }
      bool v331 = true;
      v303 = v318;
    }
    v249 = v303;
  }
  int v332 = 48;
  int v333 = v332 + v72;
  bool v334 = true;
  int v335 = simt_wave_count_bits(v334);
  v70[v333] = v335;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 192; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
