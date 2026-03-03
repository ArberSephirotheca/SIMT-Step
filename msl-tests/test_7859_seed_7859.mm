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
    int v7 = 4;
    int v8 = v3 % v7;
    int v9 = 2;
    int v10;
    v10 = v9;
    switch (v8) {
      case 0:
        {
        int v11 = 0;
        int v12 = 0;
        int v13;
        int v14;
        v13 = v11;
        v14 = v12;
        while (true) {
          int v15 = 4;
          int v16 = v3 % v15;
          int v17 = 1;
          int v18 = v16 + v17;
          bool v19 = v14 < v18;
          v13 = v13;
          v14 = v14;
          if (!v19) break;
          int v20 = 3;
          int v21 = 1;
          int v22 = v14 + v21;
          v13 = v20;
          v14 = v22;
        }
        int v23 = 3;
        int v24 = v0 + v23;
        v10 = v13;
        break;
      }
      default:
        {
        int v25 = 3;
        int v26 = v3 % v25;
        int v27 = 2;
        int v28 = v0 + v27;
        int v29;
        v29 = v28;
        switch (v26) {
          case 0:
            {
            int v30 = 4;
            int v31 = v0 + v30;
            v29 = v31;
          }
          default:
            {
            int v32 = 3;
            int v33 = v0 + v32;
            v29 = v33;
            break;
          }
          case 1:
            {
            int v34 = 0;
            int v35 = v0 + v34;
            v29 = v35;
            break;
          }
          case 2:
            {
            int v36 = 2;
            v29 = v36;
            break;
          }
        }
        v10 = v29;
        break;
      }
      case 1:
        {
        int v37 = 0;
        int v38 = 0;
        int v39;
        int v40;
        v39 = v37;
        v40 = v38;
        while (true) {
          int v41 = 4;
          int v42 = v3 % v41;
          int v43 = 1;
          int v44 = v42 + v43;
          bool v45 = v40 < v44;
          v39 = v39;
          v40 = v40;
          if (!v45) break;
          int v46 = 1;
          int v47 = v40 + v46;
          v39 = v0;
          v40 = v47;
          continue;
          ;
        }
        int v48 = 4;
        v10 = v39;
        break;
      }
      case 2:
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
          int v58 = 4;
          int v59 = 1;
          int v60 = v52 + v59;
          v51 = v58;
          v52 = v60;
        }
        int v61 = 2;
        v10 = v51;
        break;
      }
    }
    v6 = v10;
  } else {
    uint v62 = simt_subgroup_id(__simt_tid);
    int v63 = (int)(v62);
    int v64;
    v64 = v63;
    switch (v3) {
      default:
        {
        int v65 = 4;
        int v66;
        v66 = v65;
        switch (v3) {
          case 0:
            {
            int v67 = 2;
            v66 = v67;
            break;
          }
          default:
            {
            int v68 = 1;
            int v69 = v0 + v68;
            v66 = v69;
            break;
          }
        }
        int v70 = 2;
        v64 = v66;
        break;
      }
      case 0:
        {
        int v71 = 0;
        int v72 = 0;
        int v73;
        int v74;
        v73 = v71;
        v74 = v72;
        while (true) {
          int v75 = 4;
          int v76 = v3 % v75;
          int v77 = 1;
          int v78 = v76 + v77;
          bool v79 = v74 < v78;
          v73 = v73;
          v74 = v74;
          if (!v79) break;
          int v80 = 1;
          int v81 = v74 + v80;
          v73 = v0;
          v74 = v81;
        }
        int v82 = 1;
        v64 = v73;
        break;
      }
    }
    int v83 = 1;
    v6 = v64;
  }
  bool v84 = true;
  int v85 = simt_wave_count_bits(v84);
  int v86 = 0;
  int v87 = v86 + v0;
  v1[v87] = v85;
  return;
}

kernel void kernel_main(device int* v88 [[buffer(0)]], device int* v89 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v90 = static_cast<int>(__simt_tid3.x);
  int v91 = 0;
  int v92 = v91 + v90;
  int v93 = v89[v92];
  int v94 = 4;
  int v95 = v94 + v90;
  int v96 = v89[v95];
  helper0(v90, v88, v93, v96, static_cast<int>(__simt_tid3.x));
  int v97 = 8;
  int v98 = v97 + v90;
  int v99 = v89[v98];
  int v100;
  v100 = v90;
  switch (v99) {
    case 0:
      {
      int v101 = 12;
      int v102 = v101 + v90;
      int v103 = v89[v102];
      int v104 = 0;
      bool v105 = v103 != v104;
      int v106;
      if (v105) {
        int v107 = 16;
        int v108 = v107 + v90;
        int v109 = v89[v108];
        int v110 = 0;
        bool v111 = v109 != v110;
        int v112;
        if (v111) {
          v112 = v90;
        } else {
          int v113 = 3;
          v112 = v113;
        }
        v106 = v112;
      } else {
        int v114 = 1;
        int v115 = v90 + v114;
        v106 = v115;
      }
      v100 = v106;
      break;
    }
    case 1:
      {
      int v116 = 20;
      int v117 = v116 + v90;
      int v118 = v89[v117];
      int v119 = 4;
      int v120 = v90 + v119;
      int v121;
      v121 = v120;
      switch (v118) {
        case 0:
          {
          int v122 = 1;
          v121 = v122;
          break;
        }
        default:
          {
          int v123 = 24;
          int v124 = v123 + v90;
          int v125 = v89[v124];
          int v126 = 0;
          bool v127 = v125 != v126;
          int v128;
          if (v127) {
            int v129 = 4;
            int v130 = v90 + v129;
            v128 = v130;
          } else {
            v128 = v90;
          }
          v121 = v128;
          break;
        }
      }
      bool v131 = true;
      v100 = v121;
      break;
    }
    default:
      {
      int v132 = 28;
      int v133 = v132 + v90;
      int v134 = v89[v133];
      int v135 = 0;
      bool v136 = v134 != v135;
      int v137;
      if (v136) {
        v137 = v90;
      } else {
        int v138 = 32;
        int v139 = v138 + v90;
        int v140 = v89[v139];
        int v141 = 1;
        int v142 = v90 + v141;
        int v143;
        v143 = v142;
        switch (v140) {
          default:
            {
            v143 = v90;
            break;
          }
          case 0:
            {
            int v144 = 2;
            int v145 = v90 + v144;
            v143 = v145;
            break;
          }
        }
        bool v146 = true;
        v137 = v143;
      }
      v100 = v137;
      break;
    }
    case 2:
      {
      int v147 = 36;
      int v148 = v147 + v90;
      int v149 = v89[v148];
      int v150;
      v150 = v90;
      switch (v149) {
        case 0:
          {
          int v151 = 40;
          int v152 = v151 + v90;
          int v153 = v89[v152];
          int v154 = 0;
          bool v155 = v153 != v154;
          int v156;
          if (v155) {
            int v157 = 3;
            v156 = v157;
          } else {
            v156 = v90;
          }
          v150 = v156;
          break;
        }
        default:
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
            int v164 = v163 + v90;
            int v165 = 44;
            int v166 = v165 + v164;
            int v167 = v89[v166];
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
          v150 = v160;
          break;
        }
      }
      bool v174 = true;
      v100 = v150;
      break;
    }
  }
  bool v175 = true;
  int v176 = 16;
  int v177 = v176 + v90;
  bool v178 = true;
  int v179 = simt_wave_count_bits(v178);
  v88[v177] = v179;
  int v180 = 64;
  int v181 = v180 + v90;
  int v182 = v89[v181];
  int v183 = 3;
  int v184 = v90 + v183;
  int v185;
  v185 = v184;
  switch (v182) {
    default:
      {
      int v186 = 68;
      int v187 = v186 + v90;
      int v188 = v89[v187];
      int v189 = 0;
      bool v190 = v188 != v189;
      int v191;
      if (v190) {
        int v192 = 72;
        int v193 = v192 + v90;
        int v194 = v89[v193];
        int v195 = 0;
        bool v196 = v194 != v195;
        int v197;
        if (v196) {
          int v198 = 1;
          int v199 = v90 + v198;
          v197 = v199;
        } else {
          int v200 = 4;
          v197 = v200;
        }
        v191 = v197;
      } else {
        int v201 = 0;
        int v202 = 0;
        int v203;
        int v204;
        v203 = v201;
        v204 = v202;
        while (true) {
          int v205 = 4;
          int v206 = v204 * v205;
          int v207 = v206 + v90;
          int v208 = 76;
          int v209 = v208 + v207;
          int v210 = v89[v209];
          int v211 = 0;
          bool v212 = v210 != v211;
          v203 = v203;
          v204 = v204;
          if (!v212) break;
          int v213 = v203 + v204;
          int v214 = 1;
          int v215 = v204 + v214;
          v203 = v213;
          v204 = v215;
          continue;
          ;
        }
        bool v216 = true;
        v191 = v203;
      }
      v185 = v191;
    }
    case 0:
      {
      int v217 = 96;
      int v218 = v217 + v90;
      int v219 = v89[v218];
      int v220 = 4;
      int v221;
      v221 = v220;
      switch (v219) {
        case 0:
          {
          int v222 = 100;
          int v223 = v222 + v90;
          int v224 = v89[v223];
          int v225;
          v225 = v90;
          switch (v224) {
            default:
              {
              int v226 = 1;
              int v227 = v90 + v226;
              v225 = v227;
              break;
            }
            case 0:
              {
              int v228 = 4;
              v225 = v228;
              break;
            }
            case 1:
              {
              int v229 = 4;
              int v230 = v90 + v229;
              v225 = v230;
              break;
            }
            case 2:
              {
              int v231 = 0;
              v225 = v231;
              break;
            }
          }
          bool v232 = true;
          v221 = v225;
          break;
        }
        default:
          {
          int v233 = 2;
          v221 = v233;
          break;
        }
      }
      bool v234 = true;
      v185 = v221;
      break;
    }
    case 1:
      {
      int v235 = 0;
      int v236 = 0;
      int v237;
      int v238;
      v237 = v235;
      v238 = v236;
      while (true) {
        int v239 = 4;
        int v240 = v238 * v239;
        int v241 = v240 + v90;
        int v242 = 104;
        int v243 = v242 + v241;
        int v244 = v89[v243];
        int v245 = 0;
        bool v246 = v244 != v245;
        v237 = v237;
        v238 = v238;
        if (!v246) break;
        int v247 = 0;
        int v248 = 0;
        int v249;
        int v250;
        v249 = v247;
        v250 = v248;
        while (true) {
          int v251 = 4;
          int v252 = v250 * v251;
          int v253 = v252 + v90;
          int v254 = 124;
          int v255 = v254 + v253;
          int v256 = v89[v255];
          int v257 = 0;
          bool v258 = v256 != v257;
          v249 = v249;
          v250 = v250;
          if (!v258) break;
          int v259 = v249 + v250;
          int v260 = 1;
          int v261 = v250 + v260;
          v249 = v259;
          v250 = v261;
        }
        bool v262 = true;
        int v263 = v237 + v249;
        int v264 = 1;
        int v265 = v238 + v264;
        v237 = v263;
        v238 = v265;
      }
      bool v266 = true;
      v185 = v237;
      break;
    }
    case 2:
      {
      v185 = v90;
      break;
    }
  }
  bool v267 = true;
  int v268 = 32;
  int v269 = v268 + v90;
  bool v270 = true;
  int v271 = simt_wave_count_bits(v270);
  v88[v269] = v271;
  int v272 = 144;
  int v273 = v272 + v90;
  int v274 = v89[v273];
  int v275 = 0;
  bool v276 = v274 != v275;
  int v277;
  if (v276) {
    int v278 = 148;
    int v279 = v278 + v90;
    int v280 = v89[v279];
    int v281 = 0;
    int v282;
    v282 = v281;
    switch (v280) {
      case 0:
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
          int v289 = v288 + v90;
          int v290 = 152;
          int v291 = v290 + v289;
          int v292 = v89[v291];
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
          continue;
          ;
        }
        bool v298 = true;
        v282 = v285;
        break;
      }
      default:
        {
        int v299 = 172;
        int v300 = v299 + v90;
        int v301 = v89[v300];
        int v302 = 3;
        int v303 = v90 + v302;
        int v304;
        v304 = v303;
        switch (v301) {
          case 0:
            {
            int v305 = 3;
            int v306 = v90 + v305;
            v304 = v306;
            break;
          }
          case 1:
            {
            int v307 = 1;
            v304 = v307;
            break;
          }
          case 2:
            {
            int v308 = 1;
            int v309 = v90 + v308;
            v304 = v309;
            break;
          }
          default:
            {
            int v310 = 3;
            int v311 = v90 + v310;
            v304 = v311;
            break;
          }
        }
        bool v312 = true;
        v282 = v304;
        break;
      }
    }
    bool v313 = true;
    v277 = v282;
  } else {
    int v314 = 176;
    int v315 = v314 + v90;
    int v316 = v89[v315];
    int v317 = 0;
    bool v318 = v316 != v317;
    int v319;
    if (v318) {
      int v320 = 180;
      int v321 = v320 + v90;
      int v322 = v89[v321];
      int v323 = 1;
      int v324;
      v324 = v323;
      switch (v322) {
        case 0:
          {
          v324 = v90;
        }
        default:
          {
          v324 = v90;
          break;
        }
      }
      bool v325 = true;
      v319 = v324;
    } else {
      int v326 = 184;
      int v327 = v326 + v90;
      int v328 = v89[v327];
      int v329 = 0;
      bool v330 = v328 != v329;
      int v331;
      if (v330) {
        v331 = v90;
      } else {
        int v332 = 4;
        v331 = v332;
      }
      v319 = v331;
    }
    v277 = v319;
  }
  int v333 = 48;
  int v334 = v333 + v90;
  bool v335 = true;
  int v336 = simt_wave_count_bits(v335);
  v88[v334] = v336;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 188; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
