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
  bool v4 = true;
  int v5 = simt_wave_count_bits(v4);
  int v6 = 0;
  int v7 = v6 + v0;
  v1[v7] = v5;
  int v8 = 3;
  int v9 = v3 % v8;
  int v10 = 3;
  int v11;
  v11 = v10;
  switch (v9) {
    case 0:
      {
      int v12 = 3;
      int v13 = v3 % v12;
      int v14 = 3;
      int v15 = v0 + v14;
      int v16;
      v16 = v15;
      switch (v13) {
        case 0:
          {
          int v17 = 0;
          int v18 = 0;
          int v19;
          int v20;
          v19 = v17;
          v20 = v18;
          while (true) {
            int v21 = 4;
            int v22 = v3 % v21;
            int v23 = 1;
            int v24 = v22 + v23;
            bool v25 = v20 < v24;
            v19 = v19;
            v20 = v20;
            if (!v25) break;
            int v26 = 1;
            int v27 = v20 + v26;
            v19 = v0;
            v20 = v27;
          }
          v16 = v19;
          break;
        }
        default:
          {
          int v28 = 2;
          int v29 = v3 % v28;
          int v30 = 2;
          int v31 = v0 + v30;
          int v32;
          v32 = v31;
          switch (v29) {
            case 0:
              {
              int v33 = 1;
              v32 = v33;
              break;
            }
            default:
              {
              v32 = v0;
              break;
            }
          }
          v16 = v32;
          break;
        }
        case 1:
          {
          int v34 = 0;
          int v35 = 0;
          int v36;
          int v37;
          v36 = v34;
          v37 = v35;
          while (true) {
            int v38 = 4;
            int v39 = v3 % v38;
            int v40 = 1;
            int v41 = v39 + v40;
            bool v42 = v37 < v41;
            v36 = v36;
            v37 = v37;
            if (!v42) break;
            int v43 = 1;
            int v44 = v37 + v43;
            v36 = v0;
            v37 = v44;
          }
          v16 = v36;
          break;
        }
      }
      v11 = v16;
      break;
    }
    default:
      {
      int v45 = 0;
      bool v46 = v2 != v45;
      int v47;
      if (v46) {
        int v48 = 3;
        v47 = v48;
      } else {
        int v49 = 2;
        int v50 = v3 % v49;
        int v51;
        v51 = v0;
        switch (v50) {
          case 0:
            {
            int v52 = 0;
            v51 = v52;
          }
          default:
            {
            int v53 = 1;
            v51 = v53;
            break;
          }
        }
        v47 = v51;
      }
      v11 = v47;
      break;
    }
    case 1:
      {
      int v54 = 0;
      int v55 = 0;
      int v56;
      int v57;
      v56 = v54;
      v57 = v55;
      while (true) {
        int v58 = 4;
        int v59 = v3 % v58;
        int v60 = 1;
        int v61 = v59 + v60;
        bool v62 = v57 < v61;
        v56 = v56;
        v57 = v57;
        if (!v62) break;
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
          int v72 = 4;
          int v73 = v0 + v72;
          int v74 = 1;
          int v75 = v66 + v74;
          v65 = v73;
          v66 = v75;
        }
        int v76 = 1;
        int v77 = v57 + v76;
        v56 = v65;
        v57 = v77;
      }
      v11 = v56;
      break;
    }
    case 2:
      {
      int v78 = 4;
      int v79 = v3 % v78;
      int v80 = 2;
      int v81;
      v81 = v80;
      switch (v79) {
        case 0:
          {
          int v82 = 0;
          bool v83 = v2 != v82;
          int v84;
          if (v83) {
            int v85 = 1;
            v84 = v85;
          } else {
            v84 = v0;
          }
          v81 = v84;
          break;
        }
        default:
          {
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
            int v95 = 3;
            int v96 = v0 + v95;
            int v97 = 1;
            int v98 = v89 + v97;
            v88 = v96;
            v89 = v98;
          }
          v81 = v88;
          break;
        }
        case 1:
          {
          int v99 = 4;
          int v100 = v0 + v99;
          v81 = v100;
          break;
        }
        case 2:
          {
          int v101 = 4;
          int v102 = v3 % v101;
          int v103;
          v103 = v0;
          switch (v102) {
            case 0:
              {
              v103 = v0;
            }
            case 1:
              {
              int v104 = 1;
              int v105 = v0 + v104;
              v103 = v105;
              break;
            }
            default:
              {
              v103 = v0;
              break;
            }
            case 2:
              {
              v103 = v0;
              break;
            }
          }
          v81 = v103;
          break;
        }
      }
      v11 = v81;
      break;
    }
  }
  int v106 = 0;
  bool v107 = v2 != v106;
  int v108 = v107 ? v5 : v11;
  return;
}

kernel void kernel_main(device int* v109 [[buffer(0)]], device int* v110 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v111 = static_cast<int>(__simt_tid3.x);
  int v112 = 0;
  int v113 = v112 + v111;
  int v114 = v110[v113];
  int v115 = 4;
  int v116 = v115 + v111;
  int v117 = v110[v116];
  helper0(v111, v109, v114, v117, static_cast<int>(__simt_tid3.x));
  int v118 = 8;
  int v119 = v118 + v111;
  int v120 = v110[v119];
  int v121 = 1;
  int v122;
  v122 = v121;
  switch (v120) {
    case 0:
      {
      int v123 = 4;
      v122 = v123;
    }
    default:
      {
      int v124 = 12;
      int v125 = v124 + v111;
      int v126 = v110[v125];
      int v127 = 0;
      bool v128 = v126 != v127;
      int v129;
      if (v128) {
        int v130 = 0;
        int v131 = 0;
        int v132;
        int v133;
        v132 = v130;
        v133 = v131;
        while (true) {
          int v134 = 4;
          int v135 = v133 * v134;
          int v136 = v135 + v111;
          int v137 = 16;
          int v138 = v137 + v136;
          int v139 = v110[v138];
          int v140 = 0;
          bool v141 = v139 != v140;
          v132 = v132;
          v133 = v133;
          if (!v141) break;
          int v142 = v132 + v133;
          int v143 = 1;
          int v144 = v133 + v143;
          bool v145 = true;
          v132 = v142;
          v133 = v144;
        }
        v129 = v132;
      } else {
        int v146 = 36;
        int v147 = v146 + v111;
        int v148 = v110[v147];
        int v149 = 0;
        int v150;
        v150 = v149;
        switch (v148) {
          case 0:
            {
            v150 = v111;
            break;
          }
          default:
            {
            int v151 = 1;
            v150 = v151;
            break;
          }
        }
        v129 = v150;
      }
      v122 = v129;
    }
    case 1:
      {
      int v152 = 40;
      int v153 = v152 + v111;
      int v154 = v110[v153];
      int v155 = 1;
      int v156;
      v156 = v155;
      switch (v154) {
        default:
          {
          int v157 = 44;
          int v158 = v157 + v111;
          int v159 = v110[v158];
          int v160 = 0;
          bool v161 = v159 != v160;
          int v162;
          if (v161) {
            int v163 = 1;
            v162 = v163;
          } else {
            int v164 = 2;
            v162 = v164;
          }
          v156 = v162;
          break;
        }
        case 0:
          {
          int v165 = 48;
          int v166 = v165 + v111;
          int v167 = v110[v166];
          int v168 = 0;
          bool v169 = v167 != v168;
          int v170;
          if (v169) {
            v170 = v111;
          } else {
            int v171 = 3;
            int v172 = v111 + v171;
            v170 = v172;
          }
          v156 = v170;
          break;
        }
        case 1:
          {
          int v173 = 52;
          int v174 = v173 + v111;
          int v175 = v110[v174];
          int v176 = 3;
          int v177 = v111 + v176;
          int v178;
          v178 = v177;
          switch (v175) {
            case 0:
              {
              v178 = v111;
              break;
            }
            case 1:
              {
              int v179 = 2;
              int v180 = v111 + v179;
              v178 = v180;
              break;
            }
            default:
              {
              int v181 = 2;
              int v182 = v111 + v181;
              v178 = v182;
              break;
            }
          }
          v156 = v178;
          break;
        }
        case 2:
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
            int v189 = v188 + v111;
            int v190 = 56;
            int v191 = v190 + v189;
            int v192 = v110[v191];
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
          }
          v156 = v185;
          break;
        }
      }
      bool v199 = true;
      v122 = v156;
      break;
    }
  }
  bool v200 = true;
  int v201 = 16;
  int v202 = v201 + v111;
  bool v203 = true;
  int v204 = simt_wave_count_bits(v203);
  v109[v202] = v204;
  int v205 = 0;
  int v206 = v111 + v205;
  int v207 = 76;
  int v208 = v207 + v111;
  int v209 = v110[v208];
  int v210 = 0;
  bool v211 = v209 != v210;
  int v212;
  if (v211) {
    int v213 = 80;
    int v214 = v213 + v111;
    int v215 = v110[v214];
    uint v216 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v217 = (int)(v216);
    int v218;
    v218 = v217;
    switch (v215) {
      case 0:
        {
        int v219 = 84;
        int v220 = v219 + v111;
        int v221 = v110[v220];
        int v222 = 0;
        bool v223 = v221 != v222;
        int v224;
        if (v223) {
          int v225 = 3;
          v224 = v225;
        } else {
          v224 = v111;
        }
        v218 = v224;
      }
      case 1:
        {
        int v226 = 0;
        int v227 = 0;
        int v228;
        int v229;
        v228 = v226;
        v229 = v227;
        while (true) {
          int v230 = 4;
          int v231 = v229 * v230;
          int v232 = v231 + v111;
          int v233 = 88;
          int v234 = v233 + v232;
          int v235 = v110[v234];
          int v236 = 0;
          bool v237 = v235 != v236;
          v228 = v228;
          v229 = v229;
          if (!v237) break;
          int v238 = v228 + v229;
          int v239 = 1;
          int v240 = v229 + v239;
          bool v241 = true;
          v228 = v238;
          v229 = v240;
        }
        v218 = v228;
        break;
      }
      default:
        {
        int v242 = 0;
        int v243 = 0;
        int v244;
        int v245;
        v244 = v242;
        v245 = v243;
        while (true) {
          int v246 = 4;
          int v247 = v245 * v246;
          int v248 = v247 + v111;
          int v249 = 108;
          int v250 = v249 + v248;
          int v251 = v110[v250];
          int v252 = 0;
          bool v253 = v251 != v252;
          v244 = v244;
          v245 = v245;
          if (!v253) break;
          int v254 = v244 + v245;
          int v255 = 1;
          int v256 = v245 + v255;
          bool v257 = true;
          v244 = v254;
          v245 = v256;
        }
        v218 = v244;
      }
      case 2:
        {
        int v258 = 128;
        int v259 = v258 + v111;
        int v260 = v110[v259];
        int v261 = 0;
        bool v262 = v260 != v261;
        int v263;
        if (v262) {
          int v264 = 3;
          v263 = v264;
        } else {
          int v265 = 4;
          v263 = v265;
        }
        v218 = v263;
        break;
      }
    }
    v212 = v218;
  } else {
    int v266 = 132;
    int v267 = v266 + v111;
    int v268 = v110[v267];
    int v269 = 0;
    bool v270 = v268 != v269;
    int v271;
    if (v270) {
      int v272 = 136;
      int v273 = v272 + v111;
      int v274 = v110[v273];
      int v275 = 1;
      int v276;
      v276 = v275;
      switch (v274) {
        default:
          {
          int v277 = 2;
          int v278 = v111 + v277;
          v276 = v278;
          break;
        }
        case 0:
          {
          int v279 = 0;
          int v280 = v111 + v279;
          v276 = v280;
          break;
        }
        case 1:
          {
          int v281 = 1;
          v276 = v281;
          break;
        }
      }
      bool v282 = true;
      int v283 = 32;
      int v284 = v283 + v111;
      bool v285 = true;
      int v286 = simt_wave_count_bits(v285);
      v109[v284] = v286;
      v271 = v276;
    } else {
      uint v287 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v288 = (int)(v287);
      v271 = v288;
    }
    int v289 = 48;
    int v290 = v289 + v111;
    bool v291 = true;
    int v292 = simt_wave_count_bits(v291);
    v109[v290] = v292;
    v212 = v271;
  }
  int v293 = 64;
  int v294 = v293 + v111;
  bool v295 = true;
  int v296 = simt_wave_count_bits(v295);
  v109[v294] = v296;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 140; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
