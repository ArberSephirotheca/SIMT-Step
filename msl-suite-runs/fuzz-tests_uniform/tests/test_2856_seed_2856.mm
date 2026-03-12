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
  int v5 = 0;
  int v6 = 0;
  int v7;
  int v8;
  v7 = v5;
  v8 = v6;
  while (true) {
    int v9 = 4;
    int v10 = v3 % v9;
    int v11 = 1;
    int v12 = v10 + v11;
    bool v13 = v8 < v12;
    v7 = v7;
    v8 = v8;
    if (!v13) break;
    int v14 = 1;
    int v15 = v8 + v14;
    v7 = v0;
    v8 = v15;
  }
  bool v16 = true;
  int v17 = simt_wave_count_bits(v16);
  int v18 = 0;
  int v19 = v18 + v0;
  v1[v19] = v17;
  int v20 = 0;
  bool v21 = v2 != v20;
  int v22 = v21 ? v4 : v7;
  int v23 = 0;
  int v24 = 0;
  int v25;
  int v26;
  v25 = v23;
  v26 = v24;
  while (true) {
    int v27 = 4;
    int v28 = v3 % v27;
    int v29 = 1;
    int v30 = v28 + v29;
    bool v31 = v26 < v30;
    v25 = v25;
    v26 = v26;
    if (!v31) break;
    int v32 = 4;
    int v33 = 1;
    int v34 = v26 + v33;
    v25 = v32;
    v26 = v34;
    break;
    ;
  }
  bool v35 = true;
  int v36 = simt_wave_count_bits(v35);
  int v37 = 16;
  int v38 = v37 + v0;
  v1[v38] = v36;
  int v39 = 0;
  bool v40 = v2 != v39;
  int v41 = v40 ? v22 : v25;
  int v42 = 3;
  int v43 = v3 % v42;
  uint v44 = simt_lane_id(__simt_tid);
  int v45 = (int)(v44);
  int v46;
  v46 = v45;
  switch (v43) {
    case 0:
      {
      int v47 = 0;
      int v48 = 0;
      int v49;
      int v50;
      v49 = v47;
      v50 = v48;
      while (true) {
        int v51 = 4;
        int v52 = v3 % v51;
        int v53 = 1;
        int v54 = v52 + v53;
        bool v55 = v50 < v54;
        v49 = v49;
        v50 = v50;
        if (!v55) break;
        int v56 = 0;
        int v57 = 0;
        int v58;
        int v59;
        v58 = v56;
        v59 = v57;
        while (true) {
          int v60 = 4;
          int v61 = v3 % v60;
          int v62 = 1;
          int v63 = v61 + v62;
          bool v64 = v59 < v63;
          v58 = v58;
          v59 = v59;
          if (!v64) break;
          int v65 = 4;
          int v66 = 1;
          int v67 = v59 + v66;
          v58 = v65;
          v59 = v67;
        }
        int v68 = 1;
        int v69 = v0 + v68;
        int v70 = 1;
        int v71 = v50 + v70;
        v49 = v58;
        v50 = v71;
      }
      v46 = v49;
    }
    case 1:
      {
      int v72 = 0;
      bool v73 = v2 != v72;
      int v74;
      if (v73) {
        int v75 = 3;
        int v76 = v3 % v75;
        int v77;
        v77 = v0;
        switch (v76) {
          default:
            {
            int v78 = 1;
            v77 = v78;
            break;
          }
          case 0:
            {
            v77 = v0;
          }
          case 1:
            {
            int v79 = 3;
            int v80 = v0 + v79;
            v77 = v80;
          }
          case 2:
            {
            int v81 = 0;
            int v82 = v0 + v81;
            v77 = v82;
            break;
          }
        }
        int v83 = 0;
        int v84 = v0 + v83;
        v74 = v77;
      } else {
        int v85 = 2;
        int v86 = v3 % v85;
        int v87 = 4;
        int v88 = v0 + v87;
        int v89;
        v89 = v88;
        switch (v86) {
          case 0:
            {
            int v90 = 4;
            int v91 = v0 + v90;
            v89 = v91;
          }
          default:
            {
            int v92 = 1;
            int v93 = v0 + v92;
            v89 = v93;
            break;
          }
        }
        v74 = v89;
      }
      int v94 = 3;
      v46 = v74;
      break;
    }
    default:
      {
      int v95 = 3;
      int v96 = v3 % v95;
      int v97;
      v97 = v0;
      switch (v96) {
        case 0:
          {
          v97 = v0;
          break;
        }
        default:
          {
          int v98 = 0;
          bool v99 = v2 != v98;
          int v100;
          if (v99) {
            v100 = v0;
          } else {
            int v101 = 2;
            int v102 = v0 + v101;
            v100 = v102;
          }
          int v103 = 0;
          v97 = v100;
          break;
        }
        case 1:
          {
          int v104 = 0;
          int v105 = 0;
          int v106;
          int v107;
          v106 = v104;
          v107 = v105;
          while (true) {
            int v108 = 4;
            int v109 = v3 % v108;
            int v110 = 1;
            int v111 = v109 + v110;
            bool v112 = v107 < v111;
            v106 = v106;
            v107 = v107;
            if (!v112) break;
            int v113 = 1;
            int v114 = v107 + v113;
            v106 = v0;
            v107 = v114;
          }
          int v115 = 3;
          v97 = v106;
          break;
        }
      }
      int v116 = 3;
      int v117 = v0 + v116;
      v46 = v97;
      break;
    }
    case 2:
      {
      v46 = v0;
      break;
    }
  }
  bool v118 = true;
  int v119 = simt_wave_count_bits(v118);
  int v120 = 32;
  int v121 = v120 + v0;
  v1[v121] = v119;
  int v122 = 0;
  bool v123 = v2 != v122;
  int v124 = v123 ? v41 : v46;
  return;
}

kernel void kernel_main(device int* v125 [[buffer(0)]], device int* v126 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v127 = static_cast<int>(__simt_tid3.x);
  int v128 = 0;
  int v129 = v128 + v127;
  int v130 = v126[v129];
  int v131 = 4;
  int v132 = v131 + v127;
  int v133 = v126[v132];
  helper0(v127, v125, v130, v133, static_cast<int>(__simt_tid3.x));
  int v134 = 8;
  int v135 = v134 + v127;
  int v136 = v126[v135];
  uint v137 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v138 = (int)(v137);
  int v139;
  v139 = v138;
  switch (v136) {
    case 0:
      {
      v139 = v127;
      break;
    }
    case 1:
      {
      int v140 = 0;
      int v141 = 0;
      int v142;
      int v143;
      v142 = v140;
      v143 = v141;
      while (true) {
        int v144 = 4;
        int v145 = v143 * v144;
        int v146 = v145 + v127;
        int v147 = 12;
        int v148 = v147 + v146;
        int v149 = v126[v148];
        int v150 = 0;
        bool v151 = v149 != v150;
        v142 = v142;
        v143 = v143;
        if (!v151) break;
        int v152 = 32;
        int v153 = v152 + v127;
        int v154 = v126[v153];
        int v155;
        v155 = v127;
        switch (v154) {
          default:
            {
            v155 = v127;
            break;
          }
          case 0:
            {
            int v156 = 2;
            int v157 = v127 + v156;
            v155 = v157;
            break;
          }
        }
        bool v158 = true;
        int v159 = v142 + v155;
        int v160 = 1;
        int v161 = v143 + v160;
        v142 = v159;
        v143 = v161;
      }
      bool v162 = true;
      v139 = v142;
      break;
    }
    default:
      {
      int v163 = 4;
      int v164 = v127 + v163;
      v139 = v164;
      break;
    }
    case 2:
      {
      int v165 = 0;
      int v166 = 0;
      int v167;
      int v168;
      v167 = v165;
      v168 = v166;
      while (true) {
        int v169 = 4;
        int v170 = v168 * v169;
        int v171 = v170 + v127;
        int v172 = 36;
        int v173 = v172 + v171;
        int v174 = v126[v173];
        int v175 = 0;
        bool v176 = v174 != v175;
        v167 = v167;
        v168 = v168;
        if (!v176) break;
        int v177 = v167 + v168;
        int v178 = 1;
        int v179 = v168 + v178;
        v167 = v177;
        v168 = v179;
      }
      bool v180 = true;
      v139 = v167;
      break;
    }
  }
  bool v181 = true;
  int v182 = 48;
  int v183 = v182 + v127;
  bool v184 = true;
  int v185 = simt_wave_count_bits(v184);
  v125[v183] = v185;
  int v186 = 56;
  int v187 = v186 + v127;
  int v188 = v126[v187];
  uint v189 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v190 = (int)(v189);
  int v191;
  v191 = v190;
  switch (v188) {
    case 0:
      {
      int v192 = 0;
      int v193 = v127 + v192;
      v191 = v193;
      break;
    }
    case 1:
      {
      int v194 = 0;
      int v195 = 0;
      int v196;
      int v197;
      v196 = v194;
      v197 = v195;
      while (true) {
        int v198 = 4;
        int v199 = v197 * v198;
        int v200 = v199 + v127;
        int v201 = 60;
        int v202 = v201 + v200;
        int v203 = v126[v202];
        int v204 = 0;
        bool v205 = v203 != v204;
        v196 = v196;
        v197 = v197;
        if (!v205) break;
        int v206 = v196 + v197;
        int v207 = 1;
        int v208 = v197 + v207;
        v196 = v206;
        v197 = v208;
        break;
        ;
      }
      bool v209 = true;
      v191 = v196;
      break;
    }
    default:
      {
      int v210 = 80;
      int v211 = v210 + v127;
      int v212 = v126[v211];
      int v213 = 0;
      bool v214 = v212 != v213;
      int v215;
      if (v214) {
        int v216 = 0;
        int v217 = 0;
        int v218;
        int v219;
        v218 = v216;
        v219 = v217;
        while (true) {
          int v220 = 4;
          int v221 = v219 * v220;
          int v222 = v221 + v127;
          int v223 = 84;
          int v224 = v223 + v222;
          int v225 = v126[v224];
          int v226 = 0;
          bool v227 = v225 != v226;
          v218 = v218;
          v219 = v219;
          if (!v227) break;
          int v228 = v218 + v219;
          int v229 = 1;
          int v230 = v219 + v229;
          v218 = v228;
          v219 = v230;
          break;
          ;
        }
        bool v231 = true;
        v215 = v218;
      } else {
        int v232 = 104;
        int v233 = v232 + v127;
        int v234 = v126[v233];
        int v235 = 0;
        int v236 = v127 + v235;
        int v237;
        v237 = v236;
        switch (v234) {
          case 0:
            {
            int v238 = 4;
            int v239 = v127 + v238;
            v237 = v239;
            break;
          }
          default:
            {
            int v240 = 2;
            v237 = v240;
            break;
          }
        }
        bool v241 = true;
        v215 = v237;
      }
      v191 = v215;
      break;
    }
  }
  bool v242 = true;
  int v243 = 64;
  int v244 = v243 + v127;
  bool v245 = true;
  int v246 = simt_wave_count_bits(v245);
  v125[v244] = v246;
  int v247 = 108;
  int v248 = v247 + v127;
  int v249 = v126[v248];
  int v250;
  v250 = v127;
  switch (v249) {
    case 0:
      {
      int v251 = 112;
      int v252 = v251 + v127;
      int v253 = v126[v252];
      int v254 = 1;
      int v255;
      v255 = v254;
      switch (v253) {
        case 0:
          {
          int v256 = 3;
          int v257 = v127 + v256;
          v255 = v257;
          break;
        }
        case 1:
          {
          int v258 = 116;
          int v259 = v258 + v127;
          int v260 = v126[v259];
          int v261 = 0;
          bool v262 = v260 != v261;
          int v263;
          if (v262) {
            v263 = v127;
          } else {
            v263 = v127;
          }
          v255 = v263;
          break;
        }
        case 2:
          {
          int v264 = 0;
          int v265 = 0;
          int v266;
          int v267;
          v266 = v264;
          v267 = v265;
          while (true) {
            int v268 = 4;
            int v269 = v267 * v268;
            int v270 = v269 + v127;
            int v271 = 120;
            int v272 = v271 + v270;
            int v273 = v126[v272];
            int v274 = 0;
            bool v275 = v273 != v274;
            v266 = v266;
            v267 = v267;
            if (!v275) break;
            int v276 = v266 + v267;
            int v277 = 1;
            int v278 = v267 + v277;
            v266 = v276;
            v267 = v278;
          }
          bool v279 = true;
          v255 = v266;
          break;
        }
        default:
          {
          int v280 = 140;
          int v281 = v280 + v127;
          int v282 = v126[v281];
          int v283;
          v283 = v127;
          switch (v282) {
            case 0:
              {
              int v284 = 1;
              int v285 = v127 + v284;
              v283 = v285;
              break;
            }
            default:
              {
              int v286 = 3;
              v283 = v286;
              break;
            }
          }
          bool v287 = true;
          v255 = v283;
          break;
        }
      }
      bool v288 = true;
      v250 = v255;
      break;
    }
    default:
      {
      int v289 = 144;
      int v290 = v289 + v127;
      int v291 = v126[v290];
      int v292 = 0;
      bool v293 = v291 != v292;
      int v294;
      if (v293) {
        int v295 = 3;
        v294 = v295;
      } else {
        int v296 = 148;
        int v297 = v296 + v127;
        int v298 = v126[v297];
        int v299;
        v299 = v127;
        switch (v298) {
          case 0:
            {
            v299 = v127;
            break;
          }
          default:
            {
            v299 = v127;
            break;
          }
        }
        bool v300 = true;
        v294 = v299;
      }
      v250 = v294;
      break;
    }
    case 1:
      {
      int v301 = 152;
      int v302 = v301 + v127;
      int v303 = v126[v302];
      int v304;
      v304 = v127;
      switch (v303) {
        default:
          {
          int v305 = 156;
          int v306 = v305 + v127;
          int v307 = v126[v306];
          int v308 = 4;
          int v309 = v127 + v308;
          int v310;
          v310 = v309;
          switch (v307) {
            default:
              {
              int v311 = 2;
              int v312 = v127 + v311;
              v310 = v312;
              break;
            }
            case 0:
              {
              int v313 = 4;
              v310 = v313;
              break;
            }
            case 1:
              {
              v310 = v127;
              break;
            }
          }
          bool v314 = true;
          v304 = v310;
        }
        case 0:
          {
          int v315 = 160;
          int v316 = v315 + v127;
          int v317 = v126[v316];
          int v318 = 2;
          int v319;
          v319 = v318;
          switch (v317) {
            case 0:
              {
              v319 = v127;
              break;
            }
            case 1:
              {
              int v320 = 4;
              v319 = v320;
              break;
            }
            default:
              {
              int v321 = 0;
              int v322 = v127 + v321;
              v319 = v322;
              break;
            }
          }
          bool v323 = true;
          v304 = v319;
          break;
        }
        case 1:
          {
          int v324 = 164;
          int v325 = v324 + v127;
          int v326 = v126[v325];
          int v327 = 3;
          int v328 = v127 + v327;
          int v329;
          v329 = v328;
          switch (v326) {
            default:
              {
              int v330 = 3;
              v329 = v330;
              break;
            }
            case 0:
              {
              v329 = v127;
              break;
            }
          }
          bool v331 = true;
          v304 = v329;
        }
        case 2:
          {
          int v332 = 168;
          int v333 = v332 + v127;
          int v334 = v126[v333];
          int v335 = 4;
          int v336;
          v336 = v335;
          switch (v334) {
            default:
              {
              int v337 = 3;
              v336 = v337;
              break;
            }
            case 0:
              {
              int v338 = 1;
              v336 = v338;
              break;
            }
          }
          bool v339 = true;
          v304 = v336;
          break;
        }
      }
      bool v340 = true;
      v250 = v304;
      break;
    }
    case 2:
      {
      int v341 = 172;
      int v342 = v341 + v127;
      int v343 = v126[v342];
      int v344 = 4;
      int v345 = v127 + v344;
      int v346;
      v346 = v345;
      switch (v343) {
        case 0:
          {
          int v347 = 4;
          int v348 = v127 + v347;
          v346 = v348;
          break;
        }
        default:
          {
          int v349 = 2;
          v346 = v349;
          break;
        }
      }
      bool v350 = true;
      v250 = v346;
      break;
    }
  }
  bool v351 = true;
  int v352 = 80;
  int v353 = v352 + v127;
  bool v354 = true;
  int v355 = simt_wave_count_bits(v354);
  v125[v353] = v355;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 176; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
