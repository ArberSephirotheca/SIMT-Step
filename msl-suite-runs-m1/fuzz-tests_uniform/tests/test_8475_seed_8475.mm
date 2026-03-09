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
      int v9 = 0;
      int v10 = v0 + v9;
      v8 = v10;
    }
    case 1:
      {
      int v11 = 4;
      int v12 = v3 % v11;
      int v13 = 2;
      int v14;
      v14 = v13;
      switch (v12) {
        case 0:
          {
          int v15 = 0;
          int v16 = 0;
          int v17;
          int v18;
          v17 = v15;
          v18 = v16;
          while (true) {
            int v19 = 4;
            int v20 = v3 % v19;
            int v21 = 1;
            int v22 = v20 + v21;
            bool v23 = v18 < v22;
            v17 = v17;
            v18 = v18;
            if (!v23) break;
            int v24 = 1;
            int v25 = v0 + v24;
            int v26 = 1;
            int v27 = v18 + v26;
            v17 = v25;
            v18 = v27;
          }
          int v28 = 4;
          int v29 = v0 + v28;
          v14 = v17;
          break;
        }
        case 1:
          {
          int v30 = 0;
          bool v31 = v2 != v30;
          int v32;
          if (v31) {
            v32 = v0;
          } else {
            v32 = v0;
          }
          v14 = v32;
        }
        case 2:
          {
          int v33 = 2;
          int v34 = v3 % v33;
          int v35;
          v35 = v0;
          switch (v34) {
            default:
              {
              int v36 = 4;
              v35 = v36;
              break;
            }
            case 0:
              {
              int v37 = 4;
              int v38 = v0 + v37;
              v35 = v38;
              break;
            }
            case 1:
              {
              int v39 = 1;
              v35 = v39;
              break;
            }
          }
          int v40 = 2;
          v14 = v35;
        }
        default:
          {
          int v41 = 0;
          int v42 = 0;
          int v43;
          int v44;
          v43 = v41;
          v44 = v42;
          while (true) {
            int v45 = 4;
            int v46 = v3 % v45;
            int v47 = 1;
            int v48 = v46 + v47;
            bool v49 = v44 < v48;
            v43 = v43;
            v44 = v44;
            if (!v49) break;
            int v50 = 4;
            int v51 = v0 + v50;
            int v52 = 1;
            int v53 = v44 + v52;
            v43 = v51;
            v44 = v53;
            break;
            ;
          }
          int v54 = 2;
          int v55 = v0 + v54;
          v14 = v43;
          break;
        }
      }
      v8 = v14;
      break;
    }
    case 2:
      {
      int v56 = 4;
      int v57 = v3 % v56;
      int v58 = 3;
      int v59;
      v59 = v58;
      switch (v57) {
        default:
          {
          int v60 = 0;
          bool v61 = v2 != v60;
          int v62;
          if (v61) {
            v62 = v0;
          } else {
            int v63 = 2;
            v62 = v63;
          }
          int v64 = 4;
          v59 = v62;
          break;
        }
        case 0:
          {
          int v65 = 2;
          v59 = v65;
          break;
        }
        case 1:
          {
          int v66 = 0;
          bool v67 = v2 != v66;
          int v68;
          if (v67) {
            v68 = v0;
          } else {
            int v69 = 1;
            int v70 = v0 + v69;
            v68 = v70;
          }
          v59 = v68;
          break;
        }
        case 2:
          {
          int v71 = 0;
          bool v72 = v2 != v71;
          int v73;
          if (v72) {
            int v74 = 3;
            int v75 = v0 + v74;
            v73 = v75;
          } else {
            int v76 = 3;
            int v77 = v0 + v76;
            v73 = v77;
          }
          int v78 = 2;
          int v79 = v0 + v78;
          v59 = v73;
          break;
        }
      }
      int v80 = 2;
      int v81 = v0 + v80;
      v8 = v59;
      break;
    }
    default:
      {
      int v82 = 0;
      bool v83 = v2 != v82;
      int v84;
      if (v83) {
        int v85 = 0;
        v84 = v85;
      } else {
        int v86 = 0;
        int v87 = 0;
        int v88;
        int v89;
        v88 = v86;
        v89 = v87;
        while (true) {
          int v90 = 4;
          int v91 = v3 % v90;
          int v92 = 1;
          int v93 = v91 + v92;
          bool v94 = v89 < v93;
          v88 = v88;
          v89 = v89;
          if (!v94) break;
          int v95 = 2;
          int v96 = v0 + v95;
          int v97 = 1;
          int v98 = v89 + v97;
          v88 = v96;
          v89 = v98;
        }
        int v99 = 1;
        v84 = v88;
      }
      int v100 = 1;
      int v101 = v0 + v100;
      v8 = v84;
      break;
    }
  }
  bool v102 = true;
  int v103 = simt_wave_count_bits(v102);
  int v104 = 0;
  int v105 = v104 + v0;
  v1[v105] = v103;
  return;
}

kernel void kernel_main(device int* v106 [[buffer(0)]], device int* v107 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v108 = static_cast<int>(__simt_tid3.x);
  int v109 = 0;
  int v110 = v109 + v108;
  int v111 = v107[v110];
  int v112 = 4;
  int v113 = v112 + v108;
  int v114 = v107[v113];
  helper0(v108, v106, v111, v114, static_cast<int>(__simt_tid3.x));
  int v115 = 8;
  int v116 = v115 + v108;
  int v117 = v107[v116];
  int v118 = 0;
  bool v119 = v117 != v118;
  int v120;
  if (v119) {
    int v121 = 12;
    int v122 = v121 + v108;
    int v123 = v107[v122];
    int v124 = 0;
    bool v125 = v123 != v124;
    int v126;
    if (v125) {
      uint v127 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v128 = (int)(v127);
      v126 = v128;
    } else {
      int v129 = 16;
      int v130 = v129 + v108;
      int v131 = v107[v130];
      int v132 = 0;
      bool v133 = v131 != v132;
      int v134;
      if (v133) {
        v134 = v108;
      } else {
        int v135 = 1;
        int v136 = v108 + v135;
        v134 = v136;
      }
      v126 = v134;
    }
    v120 = v126;
  } else {
    int v137 = 20;
    int v138 = v137 + v108;
    int v139 = v107[v138];
    int v140 = 0;
    bool v141 = v139 != v140;
    int v142;
    if (v141) {
      int v143 = 24;
      int v144 = v143 + v108;
      int v145 = v107[v144];
      int v146 = 2;
      int v147;
      v147 = v146;
      switch (v145) {
        default:
          {
          int v148 = 2;
          int v149 = v108 + v148;
          v147 = v149;
          break;
        }
        case 0:
          {
          int v150 = 4;
          int v151 = v108 + v150;
          v147 = v151;
          break;
        }
      }
      bool v152 = true;
      v142 = v147;
    } else {
      int v153 = 28;
      int v154 = v153 + v108;
      int v155 = v107[v154];
      int v156 = 0;
      bool v157 = v155 != v156;
      int v158;
      if (v157) {
        uint v159 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v160 = (int)(v159);
        v158 = v160;
      } else {
        int v161 = 2;
        v158 = v161;
      }
      v142 = v158;
    }
    v120 = v142;
  }
  int v162 = 16;
  int v163 = v162 + v108;
  bool v164 = true;
  int v165 = simt_wave_count_bits(v164);
  v106[v163] = v165;
  int v166 = 32;
  int v167 = v166 + v108;
  int v168 = v107[v167];
  uint v169 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v170 = (int)(v169);
  int v171;
  v171 = v170;
  switch (v168) {
    case 0:
      {
      int v172 = 0;
      int v173 = v108 + v172;
      v171 = v173;
      break;
    }
    case 1:
      {
      int v174 = 36;
      int v175 = v174 + v108;
      int v176 = v107[v175];
      int v177 = 0;
      bool v178 = v176 != v177;
      int v179;
      if (v178) {
        int v180 = 0;
        int v181 = 0;
        int v182;
        int v183;
        v182 = v180;
        v183 = v181;
        while (true) {
          int v184 = 4;
          int v185 = v183 * v184;
          int v186 = v185 + v108;
          int v187 = 40;
          int v188 = v187 + v186;
          int v189 = v107[v188];
          int v190 = 0;
          bool v191 = v189 != v190;
          v182 = v182;
          v183 = v183;
          if (!v191) break;
          int v192 = v182 + v183;
          int v193 = 1;
          int v194 = v183 + v193;
          v182 = v192;
          v183 = v194;
          continue;
          ;
        }
        bool v195 = true;
        v179 = v182;
      } else {
        int v196 = 60;
        int v197 = v196 + v108;
        int v198 = v107[v197];
        int v199 = 0;
        bool v200 = v198 != v199;
        int v201;
        if (v200) {
          v201 = v108;
        } else {
          int v202 = 4;
          int v203 = v108 + v202;
          v201 = v203;
        }
        v179 = v201;
      }
      v171 = v179;
    }
    case 2:
      {
      int v204 = 64;
      int v205 = v204 + v108;
      int v206 = v107[v205];
      int v207 = 0;
      bool v208 = v206 != v207;
      int v209;
      if (v208) {
        int v210 = 68;
        int v211 = v210 + v108;
        int v212 = v107[v211];
        int v213 = 0;
        bool v214 = v212 != v213;
        int v215;
        if (v214) {
          int v216 = 2;
          int v217 = v108 + v216;
          v215 = v217;
        } else {
          int v218 = 2;
          int v219 = v108 + v218;
          v215 = v219;
        }
        v209 = v215;
      } else {
        int v220 = 0;
        int v221 = 0;
        int v222;
        int v223;
        v222 = v220;
        v223 = v221;
        while (true) {
          int v224 = 4;
          int v225 = v223 * v224;
          int v226 = v225 + v108;
          int v227 = 72;
          int v228 = v227 + v226;
          int v229 = v107[v228];
          int v230 = 0;
          bool v231 = v229 != v230;
          v222 = v222;
          v223 = v223;
          if (!v231) break;
          int v232 = v222 + v223;
          int v233 = 1;
          int v234 = v223 + v233;
          v222 = v232;
          v223 = v234;
          continue;
          ;
        }
        bool v235 = true;
        v209 = v222;
      }
      v171 = v209;
    }
    default:
      {
      int v236 = 92;
      int v237 = v236 + v108;
      int v238 = v107[v237];
      int v239 = 3;
      int v240 = v108 + v239;
      int v241;
      v241 = v240;
      switch (v238) {
        case 0:
          {
          int v242 = 96;
          int v243 = v242 + v108;
          int v244 = v107[v243];
          int v245 = 0;
          bool v246 = v244 != v245;
          int v247;
          if (v246) {
            int v248 = 4;
            int v249 = v108 + v248;
            v247 = v249;
          } else {
            int v250 = 1;
            int v251 = v108 + v250;
            v247 = v251;
          }
          v241 = v247;
          break;
        }
        default:
          {
          int v252 = 100;
          int v253 = v252 + v108;
          int v254 = v107[v253];
          int v255 = 0;
          bool v256 = v254 != v255;
          int v257;
          if (v256) {
            v257 = v108;
          } else {
            int v258 = 4;
            v257 = v258;
          }
          v241 = v257;
          break;
        }
        case 1:
          {
          int v259 = 104;
          int v260 = v259 + v108;
          int v261 = v107[v260];
          int v262 = 3;
          int v263 = v108 + v262;
          int v264;
          v264 = v263;
          switch (v261) {
            case 0:
              {
              int v265 = 1;
              v264 = v265;
              break;
            }
            case 1:
              {
              int v266 = 2;
              int v267 = v108 + v266;
              v264 = v267;
            }
            default:
              {
              int v268 = 3;
              v264 = v268;
            }
            case 2:
              {
              int v269 = 3;
              int v270 = v108 + v269;
              v264 = v270;
              break;
            }
          }
          bool v271 = true;
          v241 = v264;
          break;
        }
        case 2:
          {
          int v272 = 108;
          int v273 = v272 + v108;
          int v274 = v107[v273];
          int v275 = 0;
          int v276;
          v276 = v275;
          switch (v274) {
            default:
              {
              v276 = v108;
              break;
            }
            case 0:
              {
              v276 = v108;
              break;
            }
            case 1:
              {
              int v277 = 3;
              v276 = v277;
              break;
            }
            case 2:
              {
              int v278 = 2;
              int v279 = v108 + v278;
              v276 = v279;
              break;
            }
          }
          bool v280 = true;
          v241 = v276;
          break;
        }
      }
      bool v281 = true;
      v171 = v241;
      break;
    }
  }
  bool v282 = true;
  int v283 = 32;
  int v284 = v283 + v108;
  bool v285 = true;
  int v286 = simt_wave_count_bits(v285);
  v106[v284] = v286;
  int v287 = 0;
  int v288 = 0;
  int v289;
  int v290;
  v289 = v287;
  v290 = v288;
  while (true) {
    int v291 = 4;
    int v292 = v290 * v291;
    int v293 = v292 + v108;
    int v294 = 112;
    int v295 = v294 + v293;
    int v296 = v107[v295];
    int v297 = 0;
    bool v298 = v296 != v297;
    v289 = v289;
    v290 = v290;
    if (!v298) break;
    int v299 = v289 + v290;
    int v300 = 1;
    int v301 = v290 + v300;
    v289 = v299;
    v290 = v301;
  }
  bool v302 = true;
  int v303 = 48;
  int v304 = v303 + v108;
  bool v305 = true;
  int v306 = simt_wave_count_bits(v305);
  v106[v304] = v306;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 132; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
