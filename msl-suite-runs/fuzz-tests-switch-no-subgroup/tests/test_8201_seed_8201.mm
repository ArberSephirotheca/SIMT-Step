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
  int v6 = 2;
  int v7;
  v7 = v6;
  switch (v5) {
    default:
      {
      int v8 = 0;
      int v9 = 0;
      int v10;
      int v11;
      v10 = v8;
      v11 = v9;
      while (true) {
        int v12 = 4;
        int v13 = v3 % v12;
        int v14 = 1;
        int v15 = v13 + v14;
        bool v16 = v11 < v15;
        v10 = v10;
        v11 = v11;
        if (!v16) break;
        int v17 = 3;
        int v18 = v3 % v17;
        int v19 = 1;
        int v20;
        v20 = v19;
        switch (v18) {
          case 0:
            {
            v20 = v0;
            break;
          }
          case 1:
            {
            int v21 = 4;
            int v22 = v0 + v21;
            v20 = v22;
            break;
          }
          case 2:
            {
            int v23 = 0;
            v20 = v23;
            break;
          }
          default:
            {
            int v24 = 3;
            int v25 = v0 + v24;
            v20 = v25;
            break;
          }
        }
        int v26 = 2;
        int v27 = v0 + v26;
        int v28 = 1;
        int v29 = v11 + v28;
        v10 = v20;
        v11 = v29;
        break;
        ;
      }
      v7 = v10;
      break;
    }
    case 0:
      {
      int v30 = 3;
      v7 = v30;
      break;
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
        int v40 = 0;
        int v41 = 0;
        int v42;
        int v43;
        v42 = v40;
        v43 = v41;
        while (true) {
          int v44 = 4;
          int v45 = v3 % v44;
          int v46 = 1;
          int v47 = v45 + v46;
          bool v48 = v43 < v47;
          v42 = v42;
          v43 = v43;
          if (!v48) break;
          int v49 = 2;
          int v50 = v0 + v49;
          int v51 = 1;
          int v52 = v43 + v51;
          v42 = v50;
          v43 = v52;
        }
        int v53 = 1;
        int v54 = v34 + v53;
        v33 = v42;
        v34 = v54;
      }
      v7 = v33;
      break;
    }
    case 2:
      {
      v7 = v0;
      break;
    }
  }
  bool v55 = true;
  int v56 = simt_wave_count_bits(v55);
  int v57 = 0;
  int v58 = v57 + v0;
  v1[v58] = v56;
  return;
}

kernel void kernel_main(device int* v59 [[buffer(0)]], device int* v60 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v61 = static_cast<int>(__simt_tid3.x);
  int v62 = 0;
  int v63 = v62 + v61;
  int v64 = v60[v63];
  int v65 = 4;
  int v66 = v65 + v61;
  int v67 = v60[v66];
  helper0(v61, v59, v64, v67, static_cast<int>(__simt_tid3.x));
  int v68 = 8;
  int v69 = v68 + v61;
  int v70 = v60[v69];
  int v71 = 2;
  int v72;
  v72 = v71;
  switch (v70) {
    default:
      {
      int v73 = 12;
      int v74 = v73 + v61;
      int v75 = v60[v74];
      int v76 = 0;
      bool v77 = v75 != v76;
      int v78;
      if (v77) {
        int v79 = 16;
        int v80 = v79 + v61;
        int v81 = v60[v80];
        int v82 = 2;
        int v83 = v61 + v82;
        int v84;
        v84 = v83;
        switch (v81) {
          default:
            {
            v84 = v61;
            break;
          }
          case 0:
            {
            int v85 = 2;
            int v86 = v61 + v85;
            v84 = v86;
            break;
          }
        }
        bool v87 = true;
        v78 = v84;
      } else {
        int v88 = 0;
        int v89 = 0;
        int v90;
        int v91;
        v90 = v88;
        v91 = v89;
        while (true) {
          int v92 = 4;
          int v93 = v91 * v92;
          int v94 = v93 + v61;
          int v95 = 20;
          int v96 = v95 + v94;
          int v97 = v60[v96];
          int v98 = 0;
          bool v99 = v97 != v98;
          v90 = v90;
          v91 = v91;
          if (!v99) break;
          int v100 = v90 + v91;
          int v101 = 1;
          int v102 = v91 + v101;
          bool v103 = true;
          v90 = v100;
          v91 = v102;
        }
        v78 = v90;
      }
      v72 = v78;
    }
    case 0:
      {
      int v104 = 40;
      int v105 = v104 + v61;
      int v106 = v60[v105];
      int v107;
      v107 = v61;
      switch (v106) {
        case 0:
          {
          int v108 = 0;
          int v109 = 0;
          int v110;
          int v111;
          v110 = v108;
          v111 = v109;
          while (true) {
            int v112 = 4;
            int v113 = v111 * v112;
            int v114 = v113 + v61;
            int v115 = 44;
            int v116 = v115 + v114;
            int v117 = v60[v116];
            int v118 = 0;
            bool v119 = v117 != v118;
            v110 = v110;
            v111 = v111;
            if (!v119) break;
            int v120 = v110 + v111;
            int v121 = 1;
            int v122 = v111 + v121;
            bool v123 = true;
            v110 = v120;
            v111 = v122;
            continue;
            ;
          }
          v107 = v110;
          break;
        }
        default:
          {
          int v124 = 0;
          int v125 = 0;
          int v126;
          int v127;
          v126 = v124;
          v127 = v125;
          while (true) {
            int v128 = 4;
            int v129 = v127 * v128;
            int v130 = v129 + v61;
            int v131 = 64;
            int v132 = v131 + v130;
            int v133 = v60[v132];
            int v134 = 0;
            bool v135 = v133 != v134;
            v126 = v126;
            v127 = v127;
            if (!v135) break;
            int v136 = v126 + v127;
            int v137 = 1;
            int v138 = v127 + v137;
            bool v139 = true;
            v126 = v136;
            v127 = v138;
          }
          v107 = v126;
          break;
        }
        case 1:
          {
          int v140 = 84;
          int v141 = v140 + v61;
          int v142 = v60[v141];
          int v143 = 4;
          int v144 = v61 + v143;
          int v145;
          v145 = v144;
          switch (v142) {
            case 0:
              {
              int v146 = 2;
              int v147 = v61 + v146;
              v145 = v147;
              break;
            }
            default:
              {
              int v148 = 3;
              int v149 = v61 + v148;
              v145 = v149;
              break;
            }
          }
          v107 = v145;
          break;
        }
        case 2:
          {
          int v150 = 88;
          int v151 = v150 + v61;
          int v152 = v60[v151];
          int v153 = 0;
          bool v154 = v152 != v153;
          int v155;
          if (v154) {
            int v156 = 1;
            int v157 = v61 + v156;
            v155 = v157;
          } else {
            int v158 = 1;
            v155 = v158;
          }
          v107 = v155;
          break;
        }
      }
      v72 = v107;
    }
    case 1:
      {
      int v159 = 92;
      int v160 = v159 + v61;
      int v161 = v60[v160];
      int v162 = 0;
      int v163;
      v163 = v162;
      switch (v161) {
        case 0:
          {
          int v164 = 2;
          v163 = v164;
        }
        case 1:
          {
          int v165 = 96;
          int v166 = v165 + v61;
          int v167 = v60[v166];
          int v168 = 3;
          int v169;
          v169 = v168;
          switch (v167) {
            default:
              {
              v169 = v61;
            }
            case 0:
              {
              int v170 = 4;
              int v171 = v61 + v170;
              v169 = v171;
              break;
            }
            case 1:
              {
              int v172 = 4;
              int v173 = v61 + v172;
              v169 = v173;
              break;
            }
          }
          bool v174 = true;
          v163 = v169;
        }
        case 2:
          {
          int v175 = 100;
          int v176 = v175 + v61;
          int v177 = v60[v176];
          int v178 = 0;
          bool v179 = v177 != v178;
          int v180;
          if (v179) {
            int v181 = 3;
            v180 = v181;
          } else {
            int v182 = 0;
            v180 = v182;
          }
          v163 = v180;
          break;
        }
        default:
          {
          int v183 = 0;
          int v184 = 0;
          int v185;
          int v186;
          v185 = v183;
          v186 = v184;
          while (true) {
            int v187 = 4;
            int v188 = v186 * v187;
            int v189 = v188 + v61;
            int v190 = 104;
            int v191 = v190 + v189;
            int v192 = v60[v191];
            int v193 = 0;
            bool v194 = v192 != v193;
            v185 = v185;
            v186 = v186;
            if (!v194) break;
            int v195 = v185 + v186;
            int v196 = 1;
            int v197 = v186 + v196;
            bool v198 = true;
            v185 = v195;
            v186 = v197;
            break;
            ;
          }
          v163 = v185;
          break;
        }
      }
      v72 = v163;
      break;
    }
    case 2:
      {
      int v199 = 124;
      int v200 = v199 + v61;
      int v201 = v60[v200];
      int v202 = 0;
      bool v203 = v201 != v202;
      int v204;
      if (v203) {
        int v205 = 4;
        v204 = v205;
      } else {
        int v206 = 0;
        int v207 = 0;
        int v208;
        int v209;
        v208 = v206;
        v209 = v207;
        while (true) {
          int v210 = 4;
          int v211 = v209 * v210;
          int v212 = v211 + v61;
          int v213 = 128;
          int v214 = v213 + v212;
          int v215 = v60[v214];
          int v216 = 0;
          bool v217 = v215 != v216;
          v208 = v208;
          v209 = v209;
          if (!v217) break;
          int v218 = v208 + v209;
          int v219 = 1;
          int v220 = v209 + v219;
          bool v221 = true;
          v208 = v218;
          v209 = v220;
        }
        v204 = v208;
      }
      v72 = v204;
      break;
    }
  }
  bool v222 = true;
  int v223 = 16;
  int v224 = v223 + v61;
  bool v225 = true;
  int v226 = simt_wave_count_bits(v225);
  v59[v224] = v226;
  int v227 = 148;
  int v228 = v227 + v61;
  int v229 = v60[v228];
  uint v230 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v231 = (int)(v230);
  int v232;
  v232 = v231;
  switch (v229) {
    case 0:
      {
      int v233 = 152;
      int v234 = v233 + v61;
      int v235 = v60[v234];
      int v236 = 1;
      int v237;
      v237 = v236;
      switch (v235) {
        case 0:
          {
          int v238 = 3;
          v237 = v238;
          break;
        }
        default:
          {
          int v239 = 0;
          int v240 = 0;
          int v241;
          int v242;
          v241 = v239;
          v242 = v240;
          while (true) {
            int v243 = 4;
            int v244 = v242 * v243;
            int v245 = v244 + v61;
            int v246 = 156;
            int v247 = v246 + v245;
            int v248 = v60[v247];
            int v249 = 0;
            bool v250 = v248 != v249;
            v241 = v241;
            v242 = v242;
            if (!v250) break;
            int v251 = v241 + v242;
            int v252 = 1;
            int v253 = v242 + v252;
            bool v254 = true;
            v241 = v251;
            v242 = v253;
          }
          v237 = v241;
          break;
        }
        case 1:
          {
          int v255 = 176;
          int v256 = v255 + v61;
          int v257 = v60[v256];
          int v258 = 1;
          int v259 = v61 + v258;
          int v260;
          v260 = v259;
          switch (v257) {
            case 0:
              {
              int v261 = 1;
              v260 = v261;
              break;
            }
            default:
              {
              int v262 = 2;
              v260 = v262;
            }
            case 1:
              {
              int v263 = 3;
              int v264 = v61 + v263;
              v260 = v264;
            }
            case 2:
              {
              v260 = v61;
              break;
            }
          }
          bool v265 = true;
          v237 = v260;
          break;
        }
        case 2:
          {
          int v266 = 180;
          int v267 = v266 + v61;
          int v268 = v60[v267];
          int v269 = 0;
          bool v270 = v268 != v269;
          int v271;
          if (v270) {
            int v272 = 4;
            int v273 = v61 + v272;
            v271 = v273;
          } else {
            int v274 = 3;
            v271 = v274;
          }
          v237 = v271;
          break;
        }
      }
      v232 = v237;
      break;
    }
    case 1:
      {
      int v275 = 184;
      int v276 = v275 + v61;
      int v277 = v60[v276];
      int v278 = 4;
      int v279 = v61 + v278;
      int v280;
      v280 = v279;
      switch (v277) {
        case 0:
          {
          int v281 = 188;
          int v282 = v281 + v61;
          int v283 = v60[v282];
          int v284 = 2;
          int v285 = v61 + v284;
          int v286;
          v286 = v285;
          switch (v283) {
            case 0:
              {
              int v287 = 1;
              int v288 = v61 + v287;
              v286 = v288;
              break;
            }
            case 1:
              {
              int v289 = 0;
              int v290 = v61 + v289;
              v286 = v290;
              break;
            }
            default:
              {
              v286 = v61;
              break;
            }
            case 2:
              {
              v286 = v61;
              break;
            }
          }
          bool v291 = true;
          v280 = v286;
          break;
        }
        default:
          {
          int v292 = 192;
          int v293 = v292 + v61;
          int v294 = v60[v293];
          int v295 = 0;
          int v296 = v61 + v295;
          int v297;
          v297 = v296;
          switch (v294) {
            case 0:
              {
              v297 = v61;
              break;
            }
            case 1:
              {
              v297 = v61;
              break;
            }
            default:
              {
              v297 = v61;
            }
            case 2:
              {
              int v298 = 4;
              v297 = v298;
              break;
            }
          }
          v280 = v297;
          break;
        }
        case 1:
          {
          v280 = v61;
          break;
        }
        case 2:
          {
          int v299 = 196;
          int v300 = v299 + v61;
          int v301 = v60[v300];
          int v302 = 0;
          bool v303 = v301 != v302;
          int v304;
          if (v303) {
            v304 = v61;
          } else {
            int v305 = 0;
            int v306 = v61 + v305;
            v304 = v306;
          }
          v280 = v304;
          break;
        }
      }
      v232 = v280;
      break;
    }
    default:
      {
      int v307 = 200;
      int v308 = v307 + v61;
      int v309 = v60[v308];
      int v310 = 0;
      bool v311 = v309 != v310;
      int v312;
      if (v311) {
        int v313 = 204;
        int v314 = v313 + v61;
        int v315 = v60[v314];
        int v316 = 0;
        bool v317 = v315 != v316;
        int v318;
        if (v317) {
          int v319 = 0;
          v318 = v319;
        } else {
          v318 = v61;
        }
        v312 = v318;
      } else {
        int v320 = 208;
        int v321 = v320 + v61;
        int v322 = v60[v321];
        int v323 = 0;
        bool v324 = v322 != v323;
        int v325;
        if (v324) {
          int v326 = 3;
          int v327 = v61 + v326;
          v325 = v327;
        } else {
          int v328 = 1;
          int v329 = v61 + v328;
          v325 = v329;
        }
        v312 = v325;
      }
      v232 = v312;
      break;
    }
  }
  bool v330 = true;
  int v331 = 32;
  int v332 = v331 + v61;
  bool v333 = true;
  int v334 = simt_wave_count_bits(v333);
  v59[v332] = v334;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 212; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
