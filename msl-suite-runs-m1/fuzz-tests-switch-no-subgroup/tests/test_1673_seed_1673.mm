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
      v8 = v0;
      break;
    }
    case 1:
      {
      int v9 = 3;
      int v10 = v3 % v9;
      int v11 = 2;
      int v12;
      v12 = v11;
      switch (v10) {
        case 0:
          {
          int v13 = 0;
          bool v14 = v2 != v13;
          int v15;
          if (v14) {
            int v16 = 0;
            v15 = v16;
          } else {
            int v17 = 4;
            int v18 = v0 + v17;
            v15 = v18;
          }
          v12 = v15;
        }
        case 1:
          {
          v12 = v0;
        }
        default:
          {
          int v19 = 2;
          int v20 = v3 % v19;
          int v21 = 4;
          int v22 = v0 + v21;
          int v23;
          v23 = v22;
          switch (v20) {
            default:
              {
              int v24 = 2;
              v23 = v24;
              break;
            }
            case 0:
              {
              int v25 = 3;
              int v26 = v0 + v25;
              v23 = v26;
              break;
            }
          }
          int v27 = 4;
          int v28 = v0 + v27;
          v12 = v23;
          break;
        }
      }
      int v29 = 4;
      v8 = v12;
      break;
    }
    default:
      {
      int v30 = 1;
      int v31 = v0 + v30;
      v8 = v31;
      break;
    }
    case 2:
      {
      int v32 = 4;
      int v33 = v3 % v32;
      int v34 = 4;
      int v35 = v0 + v34;
      int v36;
      v36 = v35;
      switch (v33) {
        case 0:
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
            int v46 = 0;
            int v47 = v0 + v46;
            int v48 = 1;
            int v49 = v40 + v48;
            v39 = v47;
            v40 = v49;
            continue;
            ;
          }
          v36 = v39;
          break;
        }
        case 1:
          {
          int v50 = 3;
          int v51 = v3 % v50;
          int v52 = 0;
          int v53 = v0 + v52;
          int v54;
          v54 = v53;
          switch (v51) {
            default:
              {
              int v55 = 3;
              int v56 = v0 + v55;
              v54 = v56;
            }
            case 0:
              {
              v54 = v0;
              break;
            }
            case 1:
              {
              v54 = v0;
            }
            case 2:
              {
              v54 = v0;
              break;
            }
          }
          v36 = v54;
          break;
        }
        default:
          {
          int v57 = 2;
          int v58 = v3 % v57;
          int v59 = 1;
          int v60;
          v60 = v59;
          switch (v58) {
            case 0:
              {
              v60 = v0;
              break;
            }
            default:
              {
              int v61 = 0;
              int v62 = v0 + v61;
              v60 = v62;
              break;
            }
            case 1:
              {
              v60 = v0;
              break;
            }
          }
          v36 = v60;
          break;
        }
        case 2:
          {
          int v63 = 0;
          int v64 = 0;
          int v65;
          int v66;
          v65 = v63;
          v66 = v64;
          while (true) {
            int v67 = 4;
            int v68 = v3 % v67;
            int v69 = 1;
            int v70 = v68 + v69;
            bool v71 = v66 < v70;
            v65 = v65;
            v66 = v66;
            if (!v71) break;
            int v72 = 3;
            int v73 = 1;
            int v74 = v66 + v73;
            v65 = v72;
            v66 = v74;
          }
          v36 = v65;
          break;
        }
      }
      int v75 = 3;
      int v76 = v0 + v75;
      v8 = v36;
      break;
    }
  }
  bool v77 = true;
  int v78 = simt_wave_count_bits(v77);
  int v79 = 0;
  int v80 = v79 + v0;
  v1[v80] = v78;
  return;
}

kernel void kernel_main(device int* v81 [[buffer(0)]], device int* v82 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v83 = static_cast<int>(__simt_tid3.x);
  int v84 = 0;
  int v85 = v84 + v83;
  int v86 = v82[v85];
  int v87 = 4;
  int v88 = v87 + v83;
  int v89 = v82[v88];
  int v90 = 0;
  bool v91 = v86 != v90;
  if (v91) {
  } else {
    int v92 = 8;
    int v93 = v92 + v83;
    int v94 = v82[v93];
    int v95 = 0;
    bool v96 = v94 != v95;
    if (v96) {
      helper0(v83, v81, v86, v89, static_cast<int>(__simt_tid3.x));
    } else {
    }
  }
  int v97 = 12;
  int v98 = v97 + v83;
  int v99 = v82[v98];
  int v100 = 3;
  int v101 = v83 + v100;
  int v102;
  v102 = v101;
  switch (v99) {
    case 0:
      {
      v102 = v83;
    }
    case 1:
      {
      int v103 = 16;
      int v104 = v103 + v83;
      int v105 = v82[v104];
      int v106 = 0;
      bool v107 = v105 != v106;
      int v108;
      if (v107) {
        int v109 = 2;
        int v110 = v83 + v109;
        v108 = v110;
      } else {
        int v111 = 0;
        int v112 = 0;
        int v113;
        int v114;
        v113 = v111;
        v114 = v112;
        while (true) {
          int v115 = 4;
          int v116 = v114 * v115;
          int v117 = v116 + v83;
          int v118 = 20;
          int v119 = v118 + v117;
          int v120 = v82[v119];
          int v121 = 0;
          bool v122 = v120 != v121;
          v113 = v113;
          v114 = v114;
          if (!v122) break;
          int v123 = v113 + v114;
          int v124 = 1;
          int v125 = v114 + v124;
          bool v126 = true;
          v113 = v123;
          v114 = v125;
        }
        v108 = v113;
      }
      v102 = v108;
      break;
    }
    default:
      {
      int v127 = 40;
      int v128 = v127 + v83;
      int v129 = v82[v128];
      int v130 = 0;
      bool v131 = v129 != v130;
      int v132;
      if (v131) {
        int v133 = 44;
        int v134 = v133 + v83;
        int v135 = v82[v134];
        int v136 = 4;
        int v137;
        v137 = v136;
        switch (v135) {
          default:
            {
            v137 = v83;
          }
          case 0:
            {
            v137 = v83;
          }
          case 1:
            {
            int v138 = 2;
            int v139 = v83 + v138;
            v137 = v139;
          }
          case 2:
            {
            int v140 = 1;
            v137 = v140;
            break;
          }
        }
        v132 = v137;
      } else {
        int v141 = 48;
        int v142 = v141 + v83;
        int v143 = v82[v142];
        int v144 = 1;
        int v145;
        v145 = v144;
        switch (v143) {
          case 0:
            {
            int v146 = 0;
            int v147 = v83 + v146;
            v145 = v147;
            break;
          }
          case 1:
            {
            v145 = v83;
            break;
          }
          default:
            {
            int v148 = 2;
            int v149 = v83 + v148;
            v145 = v149;
            break;
          }
          case 2:
            {
            int v150 = 3;
            int v151 = v83 + v150;
            v145 = v151;
            break;
          }
        }
        v132 = v145;
      }
      v102 = v132;
      break;
    }
  }
  int v152 = 52;
  int v153 = v152 + v83;
  int v154 = v82[v153];
  int v155 = 0;
  int v156 = v83 + v155;
  int v157;
  v157 = v156;
  switch (v154) {
    case 0:
      {
      int v158 = 56;
      int v159 = v158 + v83;
      int v160 = v82[v159];
      int v161 = 0;
      bool v162 = v160 != v161;
      int v163;
      if (v162) {
        int v164 = 60;
        int v165 = v164 + v83;
        int v166 = v82[v165];
        int v167 = 0;
        bool v168 = v166 != v167;
        int v169;
        if (v168) {
          int v170 = 2;
          int v171 = v83 + v170;
          v169 = v171;
        } else {
          int v172 = 2;
          int v173 = v83 + v172;
          v169 = v173;
        }
        v163 = v169;
      } else {
        int v174 = 2;
        int v175 = v83 + v174;
        v163 = v175;
      }
      v157 = v163;
    }
    default:
      {
      int v176 = 64;
      int v177 = v176 + v83;
      int v178 = v82[v177];
      int v179 = 1;
      int v180;
      v180 = v179;
      switch (v178) {
        case 0:
          {
          int v181 = 68;
          int v182 = v181 + v83;
          int v183 = v82[v182];
          int v184 = 0;
          bool v185 = v183 != v184;
          int v186;
          if (v185) {
            int v187 = 0;
            int v188 = v83 + v187;
            v186 = v188;
          } else {
            int v189 = 3;
            int v190 = v83 + v189;
            v186 = v190;
          }
          v180 = v186;
          break;
        }
        case 1:
          {
          int v191 = 72;
          int v192 = v191 + v83;
          int v193 = v82[v192];
          int v194 = 1;
          int v195;
          v195 = v194;
          switch (v193) {
            case 0:
              {
              v195 = v83;
              break;
            }
            default:
              {
              int v196 = 3;
              int v197 = v83 + v196;
              v195 = v197;
              break;
            }
          }
          v180 = v195;
          break;
        }
        default:
          {
          int v198 = 0;
          int v199 = 0;
          int v200;
          int v201;
          v200 = v198;
          v201 = v199;
          while (true) {
            int v202 = 4;
            int v203 = v201 * v202;
            int v204 = v203 + v83;
            int v205 = 76;
            int v206 = v205 + v204;
            int v207 = v82[v206];
            int v208 = 0;
            bool v209 = v207 != v208;
            v200 = v200;
            v201 = v201;
            if (!v209) break;
            int v210 = v200 + v201;
            int v211 = 1;
            int v212 = v201 + v211;
            bool v213 = true;
            v200 = v210;
            v201 = v212;
          }
          v180 = v200;
          break;
        }
      }
      bool v214 = true;
      v157 = v180;
    }
    case 1:
      {
      int v215 = 96;
      int v216 = v215 + v83;
      int v217 = v82[v216];
      int v218 = 2;
      int v219 = v83 + v218;
      int v220;
      v220 = v219;
      switch (v217) {
        case 0:
          {
          int v221 = 100;
          int v222 = v221 + v83;
          int v223 = v82[v222];
          int v224 = 4;
          int v225 = v83 + v224;
          int v226;
          v226 = v225;
          switch (v223) {
            case 0:
              {
              int v227 = 4;
              v226 = v227;
              break;
            }
            default:
              {
              v226 = v83;
            }
            case 1:
              {
              v226 = v83;
              break;
            }
          }
          v220 = v226;
          break;
        }
        default:
          {
          int v228 = 0;
          int v229 = 0;
          int v230;
          int v231;
          v230 = v228;
          v231 = v229;
          while (true) {
            int v232 = 4;
            int v233 = v231 * v232;
            int v234 = v233 + v83;
            int v235 = 104;
            int v236 = v235 + v234;
            int v237 = v82[v236];
            int v238 = 0;
            bool v239 = v237 != v238;
            v230 = v230;
            v231 = v231;
            if (!v239) break;
            int v240 = v230 + v231;
            int v241 = 1;
            int v242 = v231 + v241;
            bool v243 = true;
            v230 = v240;
            v231 = v242;
          }
          v220 = v230;
          break;
        }
        case 1:
          {
          int v244 = 124;
          int v245 = v244 + v83;
          int v246 = v82[v245];
          int v247 = 0;
          bool v248 = v246 != v247;
          int v249;
          if (v248) {
            int v250 = 1;
            v249 = v250;
          } else {
            v249 = v83;
          }
          v220 = v249;
          break;
        }
      }
      v157 = v220;
      break;
    }
  }
  bool v251 = true;
  int v252 = 16;
  int v253 = v252 + v83;
  bool v254 = true;
  int v255 = simt_wave_count_bits(v254);
  v81[v253] = v255;
  int v256 = 128;
  int v257 = v256 + v83;
  int v258 = v82[v257];
  int v259 = 4;
  int v260 = v83 + v259;
  int v261;
  v261 = v260;
  switch (v258) {
    case 0:
      {
      int v262 = 0;
      int v263 = 0;
      int v264;
      int v265;
      v264 = v262;
      v265 = v263;
      while (true) {
        int v266 = 4;
        int v267 = v265 * v266;
        int v268 = v267 + v83;
        int v269 = 132;
        int v270 = v269 + v268;
        int v271 = v82[v270];
        int v272 = 0;
        bool v273 = v271 != v272;
        v264 = v264;
        v265 = v265;
        if (!v273) break;
        int v274 = 0;
        int v275 = 0;
        int v276;
        int v277;
        v276 = v274;
        v277 = v275;
        while (true) {
          int v278 = 4;
          int v279 = v277 * v278;
          int v280 = v279 + v83;
          int v281 = 152;
          int v282 = v281 + v280;
          int v283 = v82[v282];
          int v284 = 0;
          bool v285 = v283 != v284;
          v276 = v276;
          v277 = v277;
          if (!v285) break;
          int v286 = v276 + v277;
          int v287 = 1;
          int v288 = v277 + v287;
          bool v289 = true;
          v276 = v286;
          v277 = v288;
        }
        int v290 = v264 + v276;
        int v291 = 1;
        int v292 = v265 + v291;
        bool v293 = true;
        v264 = v290;
        v265 = v292;
      }
      v261 = v264;
      break;
    }
    default:
      {
      int v294 = 172;
      int v295 = v294 + v83;
      int v296 = v82[v295];
      int v297 = 0;
      bool v298 = v296 != v297;
      int v299;
      if (v298) {
        int v300 = 176;
        int v301 = v300 + v83;
        int v302 = v82[v301];
        int v303 = 0;
        int v304 = v83 + v303;
        int v305;
        v305 = v304;
        switch (v302) {
          default:
            {
            int v306 = 0;
            int v307 = v83 + v306;
            v305 = v307;
            break;
          }
          case 0:
            {
            int v308 = 3;
            v305 = v308;
            break;
          }
          case 1:
            {
            int v309 = 0;
            v305 = v309;
            break;
          }
        }
        v299 = v305;
      } else {
        int v310 = 0;
        int v311 = 0;
        int v312;
        int v313;
        v312 = v310;
        v313 = v311;
        while (true) {
          int v314 = 4;
          int v315 = v313 * v314;
          int v316 = v315 + v83;
          int v317 = 180;
          int v318 = v317 + v316;
          int v319 = v82[v318];
          int v320 = 0;
          bool v321 = v319 != v320;
          v312 = v312;
          v313 = v313;
          if (!v321) break;
          int v322 = v312 + v313;
          int v323 = 1;
          int v324 = v313 + v323;
          bool v325 = true;
          v312 = v322;
          v313 = v324;
        }
        v299 = v312;
      }
      v261 = v299;
      break;
    }
    case 1:
      {
      int v326 = 200;
      int v327 = v326 + v83;
      int v328 = v82[v327];
      int v329 = 0;
      bool v330 = v328 != v329;
      int v331;
      if (v330) {
        int v332 = 0;
        v331 = v332;
      } else {
        int v333 = 0;
        int v334 = v83 + v333;
        v331 = v334;
      }
      v261 = v331;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 204; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
