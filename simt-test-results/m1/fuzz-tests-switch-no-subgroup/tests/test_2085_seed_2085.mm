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
    int v13 = 4;
    int v14 = v3 % v13;
    uint v15 = simt_subgroup_id(__simt_tid);
    int v16 = (int)(v15);
    int v17;
    v17 = v16;
    switch (v14) {
      case 0:
        {
        int v18 = 0;
        bool v19 = v2 != v18;
        int v20;
        if (v19) {
          int v21 = 3;
          int v22 = v0 + v21;
          v20 = v22;
        } else {
          int v23 = 1;
          v20 = v23;
        }
        v17 = v20;
        break;
      }
      case 1:
        {
        int v24 = 2;
        int v25 = v3 % v24;
        int v26 = 3;
        int v27;
        v27 = v26;
        switch (v25) {
          case 0:
            {
            int v28 = 1;
            int v29 = v0 + v28;
            v27 = v29;
            break;
          }
          default:
            {
            int v30 = 0;
            int v31 = v0 + v30;
            v27 = v31;
            break;
          }
        }
        v17 = v27;
        break;
      }
      default:
        {
        int v32 = 0;
        int v33 = 0;
        int v34;
        int v35;
        v34 = v32;
        v35 = v33;
        while (true) {
          int v36 = 4;
          int v37 = v3 % v36;
          int v38 = 1;
          int v39 = v37 + v38;
          bool v40 = v35 < v39;
          v34 = v34;
          v35 = v35;
          if (!v40) break;
          int v41 = 0;
          int v42 = 1;
          int v43 = v35 + v42;
          v34 = v41;
          v35 = v43;
          continue;
          ;
        }
        v17 = v34;
        break;
      }
      case 2:
        {
        int v44 = 0;
        int v45 = 0;
        int v46;
        int v47;
        v46 = v44;
        v47 = v45;
        while (true) {
          int v48 = 4;
          int v49 = v3 % v48;
          int v50 = 1;
          int v51 = v49 + v50;
          bool v52 = v47 < v51;
          v46 = v46;
          v47 = v47;
          if (!v52) break;
          int v53 = 2;
          int v54 = 1;
          int v55 = v47 + v54;
          v46 = v53;
          v47 = v55;
        }
        v17 = v46;
        break;
      }
    }
    bool v56 = true;
    int v57 = simt_wave_count_bits(v56);
    int v58 = 0;
    int v59 = 4;
    int v60 = v7 * v59;
    int v61 = v58 + v60;
    int v62 = v61 + v0;
    v1[v62] = v57;
    int v63 = 1;
    int v64 = v7 + v63;
    v6 = v17;
    v7 = v64;
    break;
    ;
  }
  return;
}

kernel void kernel_main(device int* v65 [[buffer(0)]], device int* v66 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v67 = static_cast<int>(__simt_tid3.x);
  int v68 = 0;
  int v69 = v68 + v67;
  int v70 = v66[v69];
  int v71 = 4;
  int v72 = v71 + v67;
  int v73 = v66[v72];
  int v74 = 0;
  bool v75 = v70 != v74;
  if (v75) {
    int v76 = 0;
    int v77 = 0;
    int v78;
    int v79;
    v78 = v76;
    v79 = v77;
    while (true) {
      int v80 = 1;
      bool v81 = v79 < v80;
      v78 = v78;
      v79 = v79;
      if (!v81) break;
      helper0(v67, v65, v70, v73, static_cast<int>(__simt_tid3.x));
      int v82 = 1;
      int v83 = v79 + v82;
      v78 = v78;
      v79 = v83;
    }
  } else {
  }
  int v84 = 8;
  int v85 = v84 + v67;
  int v86 = v66[v85];
  uint v87 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v88 = (int)(v87);
  int v89;
  v89 = v88;
  switch (v86) {
    case 0:
      {
      int v90 = 0;
      int v91 = 0;
      int v92;
      int v93;
      v92 = v90;
      v93 = v91;
      while (true) {
        int v94 = 4;
        int v95 = v93 * v94;
        int v96 = v95 + v67;
        int v97 = 12;
        int v98 = v97 + v96;
        int v99 = v66[v98];
        int v100 = 0;
        bool v101 = v99 != v100;
        v92 = v92;
        v93 = v93;
        if (!v101) break;
        int v102 = 3;
        int v103 = v92 + v102;
        int v104 = 1;
        int v105 = v93 + v104;
        bool v106 = true;
        v92 = v103;
        v93 = v105;
      }
      v89 = v92;
      break;
    }
    case 1:
      {
      int v107 = 32;
      int v108 = v107 + v67;
      int v109 = v66[v108];
      int v110 = 0;
      bool v111 = v109 != v110;
      int v112;
      if (v111) {
        int v113 = 0;
        int v114 = 0;
        int v115;
        int v116;
        v115 = v113;
        v116 = v114;
        while (true) {
          int v117 = 4;
          int v118 = v116 * v117;
          int v119 = v118 + v67;
          int v120 = 36;
          int v121 = v120 + v119;
          int v122 = v66[v121];
          int v123 = 0;
          bool v124 = v122 != v123;
          v115 = v115;
          v116 = v116;
          if (!v124) break;
          int v125 = v115 + v116;
          int v126 = 1;
          int v127 = v116 + v126;
          bool v128 = true;
          v115 = v125;
          v116 = v127;
          break;
          ;
        }
        v112 = v115;
      } else {
        int v129 = 56;
        int v130 = v129 + v67;
        int v131 = v66[v130];
        int v132 = 0;
        bool v133 = v131 != v132;
        int v134;
        if (v133) {
          v134 = v67;
        } else {
          int v135 = 2;
          int v136 = v67 + v135;
          v134 = v136;
        }
        v112 = v134;
      }
      v89 = v112;
      break;
    }
    default:
      {
      int v137 = 60;
      int v138 = v137 + v67;
      int v139 = v66[v138];
      int v140 = 2;
      int v141 = v67 + v140;
      int v142;
      v142 = v141;
      switch (v139) {
        case 0:
          {
          v142 = v67;
          break;
        }
        case 1:
          {
          int v143 = 64;
          int v144 = v143 + v67;
          int v145 = v66[v144];
          int v146 = 0;
          bool v147 = v145 != v146;
          int v148;
          if (v147) {
            int v149 = 1;
            int v150 = v67 + v149;
            v148 = v150;
          } else {
            int v151 = 1;
            int v152 = v67 + v151;
            v148 = v152;
          }
          v142 = v148;
          break;
        }
        default:
          {
          int v153 = 68;
          int v154 = v153 + v67;
          int v155 = v66[v154];
          int v156 = 1;
          int v157 = v67 + v156;
          int v158;
          v158 = v157;
          switch (v155) {
            case 0:
              {
              v158 = v67;
              break;
            }
            default:
              {
              v158 = v67;
              break;
            }
          }
          v142 = v158;
          break;
        }
        case 2:
          {
          v142 = v67;
          break;
        }
      }
      bool v159 = true;
      v89 = v142;
      break;
    }
    case 2:
      {
      int v160 = 72;
      int v161 = v160 + v67;
      int v162 = v66[v161];
      int v163 = 0;
      int v164 = v67 + v163;
      int v165;
      v165 = v164;
      switch (v162) {
        case 0:
          {
          int v166 = 76;
          int v167 = v166 + v67;
          int v168 = v66[v167];
          int v169 = 0;
          bool v170 = v168 != v169;
          int v171;
          if (v170) {
            v171 = v67;
          } else {
            v171 = v67;
          }
          v165 = v171;
          break;
        }
        default:
          {
          int v172 = 80;
          int v173 = v172 + v67;
          int v174 = v66[v173];
          int v175 = 0;
          bool v176 = v174 != v175;
          int v177;
          if (v176) {
            v177 = v67;
          } else {
            v177 = v67;
          }
          v165 = v177;
          break;
        }
        case 1:
          {
          int v178 = 0;
          int v179 = 0;
          int v180;
          int v181;
          v180 = v178;
          v181 = v179;
          while (true) {
            int v182 = 4;
            int v183 = v181 * v182;
            int v184 = v183 + v67;
            int v185 = 84;
            int v186 = v185 + v184;
            int v187 = v66[v186];
            int v188 = 0;
            bool v189 = v187 != v188;
            v180 = v180;
            v181 = v181;
            if (!v189) break;
            int v190 = v180 + v181;
            int v191 = 1;
            int v192 = v181 + v191;
            bool v193 = true;
            v180 = v190;
            v181 = v192;
          }
          v165 = v180;
          break;
        }
      }
      bool v194 = true;
      v89 = v165;
      break;
    }
  }
  bool v195 = true;
  int v196 = 16;
  int v197 = v196 + v67;
  bool v198 = true;
  int v199 = simt_wave_count_bits(v198);
  v65[v197] = v199;
  int v200 = 104;
  int v201 = v200 + v67;
  int v202 = v66[v201];
  int v203 = 4;
  int v204;
  v204 = v203;
  switch (v202) {
    default:
      {
      int v205 = 3;
      int v206 = v67 + v205;
      v204 = v206;
      break;
    }
    case 0:
      {
      int v207 = 108;
      int v208 = v207 + v67;
      int v209 = v66[v208];
      int v210 = 4;
      int v211 = v67 + v210;
      int v212;
      v212 = v211;
      switch (v209) {
        case 0:
          {
          int v213 = 0;
          int v214 = 0;
          int v215;
          int v216;
          v215 = v213;
          v216 = v214;
          while (true) {
            int v217 = 4;
            int v218 = v216 * v217;
            int v219 = v218 + v67;
            int v220 = 112;
            int v221 = v220 + v219;
            int v222 = v66[v221];
            int v223 = 0;
            bool v224 = v222 != v223;
            v215 = v215;
            v216 = v216;
            if (!v224) break;
            int v225 = v215 + v216;
            int v226 = 1;
            int v227 = v216 + v226;
            bool v228 = true;
            v215 = v225;
            v216 = v227;
            break;
            ;
          }
          v212 = v215;
          break;
        }
        default:
          {
          int v229 = 0;
          int v230 = 0;
          int v231;
          int v232;
          v231 = v229;
          v232 = v230;
          while (true) {
            int v233 = 4;
            int v234 = v232 * v233;
            int v235 = v234 + v67;
            int v236 = 132;
            int v237 = v236 + v235;
            int v238 = v66[v237];
            int v239 = 0;
            bool v240 = v238 != v239;
            v231 = v231;
            v232 = v232;
            if (!v240) break;
            int v241 = v231 + v232;
            int v242 = 1;
            int v243 = v232 + v242;
            bool v244 = true;
            v231 = v241;
            v232 = v243;
          }
          v212 = v231;
          break;
        }
      }
      bool v245 = true;
      v204 = v212;
      break;
    }
    case 1:
      {
      int v246 = 0;
      int v247 = 0;
      int v248;
      int v249;
      v248 = v246;
      v249 = v247;
      while (true) {
        int v250 = 4;
        int v251 = v249 * v250;
        int v252 = v251 + v67;
        int v253 = 152;
        int v254 = v253 + v252;
        int v255 = v66[v254];
        int v256 = 0;
        bool v257 = v255 != v256;
        v248 = v248;
        v249 = v249;
        if (!v257) break;
        int v258 = 172;
        int v259 = v258 + v67;
        int v260 = v66[v259];
        int v261 = 0;
        int v262 = v67 + v261;
        int v263;
        v263 = v262;
        switch (v260) {
          case 0:
            {
            v263 = v67;
          }
          case 1:
            {
            v263 = v67;
          }
          default:
            {
            int v264 = 0;
            int v265 = v67 + v264;
            v263 = v265;
          }
          case 2:
            {
            int v266 = 0;
            v263 = v266;
            break;
          }
        }
        int v267 = v248 + v263;
        int v268 = 1;
        int v269 = v249 + v268;
        bool v270 = true;
        v248 = v267;
        v249 = v269;
      }
      v204 = v248;
      break;
    }
    case 2:
      {
      int v271 = 176;
      int v272 = v271 + v67;
      int v273 = v66[v272];
      int v274 = 0;
      bool v275 = v273 != v274;
      int v276;
      if (v275) {
        int v277 = 180;
        int v278 = v277 + v67;
        int v279 = v66[v278];
        int v280 = 1;
        int v281;
        v281 = v280;
        switch (v279) {
          case 0:
            {
            v281 = v67;
          }
          default:
            {
            int v282 = 2;
            v281 = v282;
            break;
          }
          case 1:
            {
            int v283 = 0;
            v281 = v283;
          }
          case 2:
            {
            int v284 = 1;
            int v285 = v67 + v284;
            v281 = v285;
            break;
          }
        }
        v276 = v281;
      } else {
        int v286 = 184;
        int v287 = v286 + v67;
        int v288 = v66[v287];
        int v289 = 2;
        int v290;
        v290 = v289;
        switch (v288) {
          default:
            {
            int v291 = 1;
            v290 = v291;
          }
          case 0:
            {
            v290 = v67;
            break;
          }
          case 1:
            {
            int v292 = 1;
            int v293 = v67 + v292;
            v290 = v293;
          }
          case 2:
            {
            v290 = v67;
            break;
          }
        }
        bool v294 = true;
        v276 = v290;
      }
      v204 = v276;
      break;
    }
  }
  int v295 = 188;
  int v296 = v295 + v67;
  int v297 = v66[v296];
  int v298 = 2;
  int v299;
  v299 = v298;
  switch (v297) {
    default:
      {
      int v300 = 0;
      int v301 = 0;
      int v302;
      int v303;
      v302 = v300;
      v303 = v301;
      while (true) {
        int v304 = 4;
        int v305 = v303 * v304;
        int v306 = v305 + v67;
        int v307 = 192;
        int v308 = v307 + v306;
        int v309 = v66[v308];
        int v310 = 0;
        bool v311 = v309 != v310;
        v302 = v302;
        v303 = v303;
        if (!v311) break;
        int v312 = 212;
        int v313 = v312 + v67;
        int v314 = v66[v313];
        int v315 = 0;
        bool v316 = v314 != v315;
        int v317;
        if (v316) {
          int v318 = 2;
          int v319 = v67 + v318;
          v317 = v319;
        } else {
          int v320 = 4;
          v317 = v320;
        }
        int v321 = v302 + v317;
        int v322 = 1;
        int v323 = v303 + v322;
        bool v324 = true;
        v302 = v321;
        v303 = v323;
      }
      v299 = v302;
      break;
    }
    case 0:
      {
      int v325 = 216;
      int v326 = v325 + v67;
      int v327 = v66[v326];
      int v328 = 2;
      int v329;
      v329 = v328;
      switch (v327) {
        case 0:
          {
          int v330 = 220;
          int v331 = v330 + v67;
          int v332 = v66[v331];
          int v333 = 3;
          int v334;
          v334 = v333;
          switch (v332) {
            case 0:
              {
              int v335 = 4;
              int v336 = v67 + v335;
              v334 = v336;
              break;
            }
            case 1:
              {
              int v337 = 0;
              int v338 = v67 + v337;
              v334 = v338;
              break;
            }
            case 2:
              {
              int v339 = 2;
              v334 = v339;
              break;
            }
            default:
              {
              int v340 = 0;
              v334 = v340;
              break;
            }
          }
          bool v341 = true;
          v329 = v334;
          break;
        }
        case 1:
          {
          int v342 = 224;
          int v343 = v342 + v67;
          int v344 = v66[v343];
          int v345 = 0;
          bool v346 = v344 != v345;
          int v347;
          if (v346) {
            int v348 = 4;
            v347 = v348;
          } else {
            v347 = v67;
          }
          v329 = v347;
        }
        default:
          {
          int v349 = 228;
          int v350 = v349 + v67;
          int v351 = v66[v350];
          int v352;
          v352 = v67;
          switch (v351) {
            case 0:
              {
              v352 = v67;
              break;
            }
            default:
              {
              int v353 = 2;
              int v354 = v67 + v353;
              v352 = v354;
              break;
            }
            case 1:
              {
              v352 = v67;
              break;
            }
          }
          v329 = v352;
        }
        case 2:
          {
          int v355 = 232;
          int v356 = v355 + v67;
          int v357 = v66[v356];
          int v358 = 3;
          int v359 = v67 + v358;
          int v360;
          v360 = v359;
          switch (v357) {
            default:
              {
              int v361 = 0;
              int v362 = v67 + v361;
              v360 = v362;
              break;
            }
            case 0:
              {
              v360 = v67;
              break;
            }
          }
          v329 = v360;
          break;
        }
      }
      bool v363 = true;
      v299 = v329;
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 20; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 236; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
