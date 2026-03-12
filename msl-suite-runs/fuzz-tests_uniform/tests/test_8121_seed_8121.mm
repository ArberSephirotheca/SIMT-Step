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
  int v4 = 2;
  int v5 = v3 % v4;
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 1;
      v8 = v9;
      break;
    }
    default:
      {
      int v10 = 3;
      v8 = v10;
      break;
    }
    case 1:
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
        int v20 = 1;
        int v21 = v14 + v20;
        v13 = v0;
        v14 = v21;
      }
      v8 = v13;
      break;
    }
  }
  bool v22 = true;
  int v23 = simt_wave_count_bits(v22);
  int v24 = 0;
  int v25 = v24 + v0;
  v1[v25] = v23;
  int v26 = 2;
  int v27 = v3 % v26;
  int v28;
  v28 = v0;
  switch (v27) {
    case 0:
      {
      int v29 = 4;
      int v30 = v3 % v29;
      int v31 = 1;
      int v32;
      v32 = v31;
      switch (v30) {
        case 0:
          {
          int v33 = 0;
          int v34 = 0;
          int v35;
          int v36;
          v35 = v33;
          v36 = v34;
          while (true) {
            int v37 = 4;
            int v38 = v3 % v37;
            int v39 = 1;
            int v40 = v38 + v39;
            bool v41 = v36 < v40;
            v35 = v35;
            v36 = v36;
            if (!v41) break;
            int v42 = 1;
            int v43 = v0 + v42;
            int v44 = 1;
            int v45 = v36 + v44;
            v35 = v43;
            v36 = v45;
          }
          v32 = v35;
          break;
        }
        default:
          {
          int v46 = 0;
          bool v47 = v2 != v46;
          int v48;
          if (v47) {
            int v49 = 2;
            int v50 = v0 + v49;
            v48 = v50;
          } else {
            int v51 = 2;
            int v52 = v0 + v51;
            v48 = v52;
          }
          int v53 = 0;
          int v54 = v0 + v53;
          v32 = v48;
          break;
        }
        case 1:
          {
          int v55 = 2;
          v32 = v55;
          break;
        }
        case 2:
          {
          int v56 = 2;
          int v57 = v3 % v56;
          int v58;
          v58 = v0;
          switch (v57) {
            case 0:
              {
              int v59 = 0;
              v58 = v59;
              break;
            }
            default:
              {
              v58 = v0;
              break;
            }
          }
          int v60 = 2;
          v32 = v58;
          break;
        }
      }
      int v61 = 4;
      int v62 = v0 + v61;
      v28 = v32;
      break;
    }
    default:
      {
      int v63 = 0;
      bool v64 = v2 != v63;
      int v65;
      if (v64) {
        int v66 = 0;
        int v67 = 0;
        int v68;
        int v69;
        v68 = v66;
        v69 = v67;
        while (true) {
          int v70 = 4;
          int v71 = v3 % v70;
          int v72 = 1;
          int v73 = v71 + v72;
          bool v74 = v69 < v73;
          v68 = v68;
          v69 = v69;
          if (!v74) break;
          int v75 = 1;
          int v76 = v69 + v75;
          v68 = v0;
          v69 = v76;
          continue;
          ;
        }
        v65 = v68;
      } else {
        int v77 = 0;
        bool v78 = v2 != v77;
        int v79;
        if (v78) {
          v79 = v0;
        } else {
          int v80 = 0;
          int v81 = v0 + v80;
          v79 = v81;
        }
        int v82 = 2;
        int v83 = v0 + v82;
        v65 = v79;
      }
      int v84 = 1;
      int v85 = v0 + v84;
      v28 = v65;
      break;
    }
  }
  bool v86 = true;
  int v87 = simt_wave_count_bits(v86);
  int v88 = 16;
  int v89 = v88 + v0;
  v1[v89] = v87;
  int v90 = 0;
  bool v91 = v2 != v90;
  int v92 = v91 ? v8 : v28;
  return;
}

kernel void kernel_main(device int* v93 [[buffer(0)]], device int* v94 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v95 = static_cast<int>(__simt_tid3.x);
  int v96 = 0;
  int v97 = v96 + v95;
  int v98 = v94[v97];
  int v99 = 4;
  int v100 = v99 + v95;
  int v101 = v94[v100];
  helper0(v95, v93, v98, v101, static_cast<int>(__simt_tid3.x));
  int v102 = 8;
  int v103 = v102 + v95;
  int v104 = v94[v103];
  uint v105 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v106 = (int)(v105);
  int v107;
  v107 = v106;
  switch (v104) {
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
        int v114 = v113 + v95;
        int v115 = 12;
        int v116 = v115 + v114;
        int v117 = v94[v116];
        int v118 = 0;
        bool v119 = v117 != v118;
        v110 = v110;
        v111 = v111;
        if (!v119) break;
        int v120 = 32;
        int v121 = v120 + v95;
        int v122 = v94[v121];
        int v123 = 0;
        bool v124 = v122 != v123;
        int v125;
        if (v124) {
          int v126 = 4;
          int v127 = v95 + v126;
          v125 = v127;
        } else {
          v125 = v95;
        }
        int v128 = v110 + v125;
        int v129 = 1;
        int v130 = v111 + v129;
        v110 = v128;
        v111 = v130;
      }
      bool v131 = true;
      v107 = v110;
      break;
    }
    default:
      {
      int v132 = 36;
      int v133 = v132 + v95;
      int v134 = v94[v133];
      int v135 = 0;
      bool v136 = v134 != v135;
      int v137;
      if (v136) {
        v137 = v95;
      } else {
        v137 = v95;
      }
      v107 = v137;
    }
    case 1:
      {
      int v138 = 40;
      int v139 = v138 + v95;
      int v140 = v94[v139];
      int v141;
      v141 = v95;
      switch (v140) {
        case 0:
          {
          int v142 = 0;
          int v143 = 0;
          int v144;
          int v145;
          v144 = v142;
          v145 = v143;
          while (true) {
            int v146 = 4;
            int v147 = v145 * v146;
            int v148 = v147 + v95;
            int v149 = 44;
            int v150 = v149 + v148;
            int v151 = v94[v150];
            int v152 = 0;
            bool v153 = v151 != v152;
            v144 = v144;
            v145 = v145;
            if (!v153) break;
            int v154 = v144 + v145;
            int v155 = 1;
            int v156 = v145 + v155;
            v144 = v154;
            v145 = v156;
            break;
            ;
          }
          bool v157 = true;
          v141 = v144;
          break;
        }
        default:
          {
          int v158 = 64;
          int v159 = v158 + v95;
          int v160 = v94[v159];
          int v161 = 4;
          int v162 = v95 + v161;
          int v163;
          v163 = v162;
          switch (v160) {
            case 0:
              {
              int v164 = 3;
              v163 = v164;
            }
            default:
              {
              v163 = v95;
              break;
            }
          }
          bool v165 = true;
          v141 = v163;
          break;
        }
      }
      bool v166 = true;
      v107 = v141;
      break;
    }
  }
  bool v167 = true;
  int v168 = 32;
  int v169 = v168 + v95;
  bool v170 = true;
  int v171 = simt_wave_count_bits(v170);
  v93[v169] = v171;
  int v172 = 0;
  int v173 = 0;
  int v174;
  int v175;
  v174 = v172;
  v175 = v173;
  while (true) {
    int v176 = 4;
    int v177 = v175 * v176;
    int v178 = v177 + v95;
    int v179 = 68;
    int v180 = v179 + v178;
    int v181 = v94[v180];
    int v182 = 0;
    bool v183 = v181 != v182;
    v174 = v174;
    v175 = v175;
    if (!v183) break;
    uint v184 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v185 = (int)(v184);
    int v186 = v174 + v185;
    int v187 = 1;
    int v188 = v175 + v187;
    v174 = v186;
    v175 = v188;
  }
  bool v189 = true;
  int v190 = 48;
  int v191 = v190 + v95;
  bool v192 = true;
  int v193 = simt_wave_count_bits(v192);
  v93[v191] = v193;
  int v194 = 88;
  int v195 = v194 + v95;
  int v196 = v94[v195];
  uint v197 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v198 = (int)(v197);
  int v199;
  v199 = v198;
  switch (v196) {
    case 0:
      {
      int v200 = 92;
      int v201 = v200 + v95;
      int v202 = v94[v201];
      int v203 = 0;
      bool v204 = v202 != v203;
      int v205;
      if (v204) {
        int v206 = 1;
        int v207 = v95 + v206;
        v205 = v207;
      } else {
        int v208 = 96;
        int v209 = v208 + v95;
        int v210 = v94[v209];
        int v211 = 0;
        bool v212 = v210 != v211;
        int v213;
        if (v212) {
          v213 = v95;
        } else {
          int v214 = 2;
          int v215 = v95 + v214;
          v213 = v215;
        }
        v205 = v213;
      }
      v199 = v205;
      break;
    }
    case 1:
      {
      int v216 = 100;
      int v217 = v216 + v95;
      int v218 = v94[v217];
      int v219 = 1;
      int v220;
      v220 = v219;
      switch (v218) {
        case 0:
          {
          int v221 = 104;
          int v222 = v221 + v95;
          int v223 = v94[v222];
          int v224 = 0;
          bool v225 = v223 != v224;
          int v226;
          if (v225) {
            v226 = v95;
          } else {
            v226 = v95;
          }
          v220 = v226;
        }
        default:
          {
          int v227 = 108;
          int v228 = v227 + v95;
          int v229 = v94[v228];
          int v230 = 0;
          bool v231 = v229 != v230;
          int v232;
          if (v231) {
            int v233 = 2;
            v232 = v233;
          } else {
            int v234 = 2;
            v232 = v234;
          }
          v220 = v232;
          break;
        }
        case 1:
          {
          int v235 = 2;
          v220 = v235;
          break;
        }
      }
      bool v236 = true;
      v199 = v220;
      break;
    }
    case 2:
      {
      int v237 = 0;
      int v238 = 0;
      int v239;
      int v240;
      v239 = v237;
      v240 = v238;
      while (true) {
        int v241 = 4;
        int v242 = v240 * v241;
        int v243 = v242 + v95;
        int v244 = 112;
        int v245 = v244 + v243;
        int v246 = v94[v245];
        int v247 = 0;
        bool v248 = v246 != v247;
        v239 = v239;
        v240 = v240;
        if (!v248) break;
        int v249 = 0;
        int v250 = 0;
        int v251;
        int v252;
        v251 = v249;
        v252 = v250;
        while (true) {
          int v253 = 4;
          int v254 = v252 * v253;
          int v255 = v254 + v95;
          int v256 = 132;
          int v257 = v256 + v255;
          int v258 = v94[v257];
          int v259 = 0;
          bool v260 = v258 != v259;
          v251 = v251;
          v252 = v252;
          if (!v260) break;
          int v261 = v251 + v252;
          int v262 = 1;
          int v263 = v252 + v262;
          v251 = v261;
          v252 = v263;
          break;
          ;
        }
        bool v264 = true;
        int v265 = v239 + v251;
        int v266 = 1;
        int v267 = v240 + v266;
        v239 = v265;
        v240 = v267;
        continue;
        ;
      }
      bool v268 = true;
      v199 = v239;
    }
    default:
      {
      int v269 = 152;
      int v270 = v269 + v95;
      int v271 = v94[v270];
      int v272 = 1;
      int v273 = v95 + v272;
      int v274;
      v274 = v273;
      switch (v271) {
        case 0:
          {
          int v275 = 156;
          int v276 = v275 + v95;
          int v277 = v94[v276];
          int v278 = 2;
          int v279 = v95 + v278;
          int v280;
          v280 = v279;
          switch (v277) {
            case 0:
              {
              int v281 = 1;
              int v282 = v95 + v281;
              v280 = v282;
              break;
            }
            case 1:
              {
              v280 = v95;
              break;
            }
            default:
              {
              int v283 = 0;
              v280 = v283;
              break;
            }
            case 2:
              {
              int v284 = 0;
              v280 = v284;
              break;
            }
          }
          bool v285 = true;
          v274 = v280;
          break;
        }
        default:
          {
          int v286 = 160;
          int v287 = v286 + v95;
          int v288 = v94[v287];
          int v289 = 0;
          bool v290 = v288 != v289;
          int v291;
          if (v290) {
            int v292 = 3;
            v291 = v292;
          } else {
            int v293 = 4;
            int v294 = v95 + v293;
            v291 = v294;
          }
          v274 = v291;
          break;
        }
      }
      bool v295 = true;
      v199 = v274;
      break;
    }
  }
  bool v296 = true;
  int v297 = 64;
  int v298 = v297 + v95;
  bool v299 = true;
  int v300 = simt_wave_count_bits(v299);
  v93[v298] = v300;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 164; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
