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
      bool v16 = true;
      int v17 = simt_wave_count_bits(v16);
      int v18 = 0;
      int v19 = 4;
      int v20 = v10 * v19;
      int v21 = v18 + v20;
      int v22 = v21 + v0;
      v1[v22] = v17;
      int v23 = 1;
      int v24 = v10 + v23;
      v9 = v17;
      v10 = v24;
    }
    v6 = v9;
  } else {
    bool v25 = true;
    int v26 = simt_wave_count_bits(v25);
    int v27 = 16;
    int v28 = v27 + v0;
    v1[v28] = v26;
    v6 = v26;
  }
  int v29 = 4;
  int v30 = v3 % v29;
  int v31;
  v31 = v0;
  switch (v30) {
    case 0:
      {
      int v32 = 3;
      int v33 = v3 % v32;
      int v34 = 0;
      int v35;
      v35 = v34;
      switch (v33) {
        case 0:
          {
          int v36 = 2;
          int v37 = v3 % v36;
          int v38 = 0;
          int v39;
          v39 = v38;
          switch (v37) {
            case 0:
              {
              int v40 = 2;
              int v41 = v0 + v40;
              v39 = v41;
              break;
            }
            default:
              {
              int v42 = 2;
              int v43 = v0 + v42;
              v39 = v43;
              break;
            }
          }
          v35 = v39;
        }
        default:
          {
          int v44 = 3;
          int v45 = v3 % v44;
          int v46 = 4;
          int v47;
          v47 = v46;
          switch (v45) {
            default:
              {
              v47 = v0;
              break;
            }
            case 0:
              {
              v47 = v0;
              break;
            }
            case 1:
              {
              int v48 = 4;
              int v49 = v0 + v48;
              v47 = v49;
              break;
            }
            case 2:
              {
              int v50 = 1;
              int v51 = v0 + v50;
              v47 = v51;
              break;
            }
          }
          v35 = v47;
        }
        case 1:
          {
          int v52 = 0;
          int v53 = 0;
          int v54;
          int v55;
          v54 = v52;
          v55 = v53;
          while (true) {
            int v56 = 4;
            int v57 = v3 % v56;
            int v58 = 1;
            int v59 = v57 + v58;
            bool v60 = v55 < v59;
            v54 = v54;
            v55 = v55;
            if (!v60) break;
            int v61 = 3;
            int v62 = v0 + v61;
            int v63 = 1;
            int v64 = v55 + v63;
            v54 = v62;
            v55 = v64;
          }
          v35 = v54;
        }
        case 2:
          {
          int v65 = 0;
          bool v66 = v2 != v65;
          int v67;
          if (v66) {
            v67 = v0;
          } else {
            int v68 = 0;
            int v69 = v0 + v68;
            v67 = v69;
          }
          v35 = v67;
          break;
        }
      }
      v31 = v35;
      break;
    }
    default:
      {
      int v70 = 3;
      int v71 = v3 % v70;
      int v72;
      v72 = v0;
      switch (v71) {
        default:
          {
          int v73 = 0;
          int v74 = 0;
          int v75;
          int v76;
          v75 = v73;
          v76 = v74;
          while (true) {
            int v77 = 4;
            int v78 = v3 % v77;
            int v79 = 1;
            int v80 = v78 + v79;
            bool v81 = v76 < v80;
            v75 = v75;
            v76 = v76;
            if (!v81) break;
            int v82 = 1;
            int v83 = v76 + v82;
            v75 = v0;
            v76 = v83;
          }
          v72 = v75;
        }
        case 0:
          {
          int v84 = 0;
          bool v85 = v2 != v84;
          int v86;
          if (v85) {
            int v87 = 1;
            v86 = v87;
          } else {
            int v88 = 0;
            int v89 = v0 + v88;
            v86 = v89;
          }
          v72 = v86;
        }
        case 1:
          {
          int v90 = 4;
          int v91 = v3 % v90;
          int v92 = 3;
          int v93;
          v93 = v92;
          switch (v91) {
            case 0:
              {
              int v94 = 3;
              int v95 = v0 + v94;
              v93 = v95;
              break;
            }
            case 1:
              {
              int v96 = 2;
              v93 = v96;
              break;
            }
            default:
              {
              int v97 = 3;
              int v98 = v0 + v97;
              v93 = v98;
              break;
            }
            case 2:
              {
              int v99 = 4;
              v93 = v99;
              break;
            }
          }
          v72 = v93;
          break;
        }
      }
      int v100 = 2;
      v31 = v72;
    }
    case 1:
      {
      int v101 = 0;
      bool v102 = v2 != v101;
      int v103;
      if (v102) {
        int v104 = 0;
        bool v105 = v2 != v104;
        int v106;
        if (v105) {
          v106 = v0;
        } else {
          int v107 = 0;
          v106 = v107;
        }
        v103 = v106;
      } else {
        int v108 = 0;
        int v109 = 0;
        int v110;
        int v111;
        v110 = v108;
        v111 = v109;
        while (true) {
          int v112 = 4;
          int v113 = v3 % v112;
          int v114 = 1;
          int v115 = v113 + v114;
          bool v116 = v111 < v115;
          v110 = v110;
          v111 = v111;
          if (!v116) break;
          int v117 = 1;
          int v118 = v0 + v117;
          int v119 = 1;
          int v120 = v111 + v119;
          v110 = v118;
          v111 = v120;
          break;
          ;
        }
        v103 = v110;
      }
      v31 = v103;
      break;
    }
    case 2:
      {
      int v121 = 2;
      int v122 = v3 % v121;
      int v123;
      v123 = v0;
      switch (v122) {
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
            int v129 = v3 % v128;
            int v130 = 1;
            int v131 = v129 + v130;
            bool v132 = v127 < v131;
            v126 = v126;
            v127 = v127;
            if (!v132) break;
            int v133 = 1;
            int v134 = v127 + v133;
            v126 = v0;
            v127 = v134;
          }
          v123 = v126;
          break;
        }
        case 0:
          {
          int v135 = 3;
          int v136 = v0 + v135;
          v123 = v136;
          break;
        }
      }
      v31 = v123;
      break;
    }
  }
  int v137 = 0;
  bool v138 = v2 != v137;
  int v139 = v138 ? v6 : v31;
  return;
}

kernel void kernel_main(device int* v140 [[buffer(0)]], device int* v141 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v142 = static_cast<int>(__simt_tid3.x);
  int v143 = 0;
  int v144 = v143 + v142;
  int v145 = v141[v144];
  int v146 = 4;
  int v147 = v146 + v142;
  int v148 = v141[v147];
  helper0(v142, v140, v145, v148, static_cast<int>(__simt_tid3.x));
  uint v149 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v150 = (int)(v149);
  int v151 = 8;
  int v152 = v151 + v142;
  int v153 = v141[v152];
  int v154 = 0;
  bool v155 = v153 != v154;
  int v156;
  if (v155) {
    int v157 = 0;
    int v158 = 0;
    int v159;
    int v160;
    v159 = v157;
    v160 = v158;
    while (true) {
      int v161 = 4;
      int v162 = v160 * v161;
      int v163 = v162 + v142;
      int v164 = 12;
      int v165 = v164 + v163;
      int v166 = v141[v165];
      int v167 = 0;
      bool v168 = v166 != v167;
      v159 = v159;
      v160 = v160;
      if (!v168) break;
      int v169 = 0;
      int v170 = 0;
      int v171;
      int v172;
      v171 = v169;
      v172 = v170;
      while (true) {
        int v173 = 4;
        int v174 = v172 * v173;
        int v175 = v174 + v142;
        int v176 = 32;
        int v177 = v176 + v175;
        int v178 = v141[v177];
        int v179 = 0;
        bool v180 = v178 != v179;
        v171 = v171;
        v172 = v172;
        if (!v180) break;
        int v181 = v171 + v172;
        int v182 = 1;
        int v183 = v172 + v182;
        bool v184 = true;
        int v185 = 32;
        int v186 = 4;
        int v187 = v172 * v186;
        int v188 = v185 + v187;
        int v189 = v188 + v142;
        bool v190 = true;
        int v191 = simt_wave_count_bits(v190);
        v140[v189] = v191;
        v171 = v181;
        v172 = v183;
        continue;
        ;
      }
      int v192 = v159 + v171;
      int v193 = 1;
      int v194 = v160 + v193;
      bool v195 = true;
      int v196 = 48;
      int v197 = 4;
      int v198 = v160 * v197;
      int v199 = v196 + v198;
      int v200 = v199 + v142;
      bool v201 = true;
      int v202 = simt_wave_count_bits(v201);
      v140[v200] = v202;
      v159 = v192;
      v160 = v194;
    }
    v156 = v159;
  } else {
    int v203 = 0;
    int v204 = 0;
    int v205;
    int v206;
    v205 = v203;
    v206 = v204;
    while (true) {
      int v207 = 4;
      int v208 = v206 * v207;
      int v209 = v208 + v142;
      int v210 = 52;
      int v211 = v210 + v209;
      int v212 = v141[v211];
      int v213 = 0;
      bool v214 = v212 != v213;
      v205 = v205;
      v206 = v206;
      if (!v214) break;
      int v215 = v205 + v206;
      int v216 = 1;
      int v217 = v206 + v216;
      bool v218 = true;
      int v219 = 64;
      int v220 = 4;
      int v221 = v206 * v220;
      int v222 = v219 + v221;
      int v223 = v222 + v142;
      bool v224 = true;
      int v225 = simt_wave_count_bits(v224);
      v140[v223] = v225;
      v205 = v215;
      v206 = v217;
    }
    v156 = v205;
  }
  int v226 = 80;
  int v227 = v226 + v142;
  bool v228 = true;
  int v229 = simt_wave_count_bits(v228);
  v140[v227] = v229;
  int v230 = 0;
  int v231 = 0;
  int v232;
  int v233;
  v232 = v230;
  v233 = v231;
  while (true) {
    int v234 = 4;
    int v235 = v233 * v234;
    int v236 = v235 + v142;
    int v237 = 72;
    int v238 = v237 + v236;
    int v239 = v141[v238];
    int v240 = 0;
    bool v241 = v239 != v240;
    v232 = v232;
    v233 = v233;
    if (!v241) break;
    int v242 = 92;
    int v243 = v242 + v142;
    int v244 = v141[v243];
    int v245 = 0;
    bool v246 = v244 != v245;
    int v247;
    if (v246) {
      int v248 = 96;
      int v249 = v248 + v142;
      int v250 = v141[v249];
      int v251 = 3;
      int v252 = v142 + v251;
      int v253;
      v253 = v252;
      switch (v250) {
        case 0:
          {
          v253 = v142;
          break;
        }
        case 1:
          {
          int v254 = 1;
          v253 = v254;
          break;
        }
        case 2:
          {
          v253 = v142;
          break;
        }
        default:
          {
          int v255 = 4;
          v253 = v255;
          break;
        }
      }
      v247 = v253;
    } else {
      int v256 = 0;
      int v257 = 0;
      int v258;
      int v259;
      v258 = v256;
      v259 = v257;
      while (true) {
        int v260 = 4;
        int v261 = v259 * v260;
        int v262 = v261 + v142;
        int v263 = 100;
        int v264 = v263 + v262;
        int v265 = v141[v264];
        int v266 = 0;
        bool v267 = v265 != v266;
        v258 = v258;
        v259 = v259;
        if (!v267) break;
        int v268 = v258 + v259;
        int v269 = 1;
        int v270 = v259 + v269;
        bool v271 = true;
        int v272 = 96;
        int v273 = 4;
        int v274 = v259 * v273;
        int v275 = v272 + v274;
        int v276 = v275 + v142;
        bool v277 = true;
        int v278 = simt_wave_count_bits(v277);
        v140[v276] = v278;
        v258 = v268;
        v259 = v270;
        break;
        ;
      }
      v247 = v258;
    }
    int v279 = 112;
    int v280 = v279 + v142;
    bool v281 = true;
    int v282 = simt_wave_count_bits(v281);
    v140[v280] = v282;
    int v283 = v232 + v247;
    int v284 = 1;
    int v285 = v233 + v284;
    bool v286 = true;
    int v287 = 128;
    int v288 = 4;
    int v289 = v233 * v288;
    int v290 = v287 + v289;
    int v291 = v290 + v142;
    bool v292 = true;
    int v293 = simt_wave_count_bits(v292);
    v140[v291] = v293;
    v232 = v283;
    v233 = v285;
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(2), static_cast<int32_t>(4), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 136; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 120; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
