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
  int v6;
  v6 = v0;
  switch (v5) {
    case 0:
      {
      int v7 = 3;
      int v8 = v3 % v7;
      int v9 = 3;
      int v10 = v0 + v9;
      int v11;
      v11 = v10;
      switch (v8) {
        case 0:
          {
          int v12 = 0;
          int v13 = 0;
          int v14;
          int v15;
          v14 = v12;
          v15 = v13;
          while (true) {
            int v16 = 4;
            int v17 = v3 % v16;
            int v18 = 1;
            int v19 = v17 + v18;
            bool v20 = v15 < v19;
            v14 = v14;
            v15 = v15;
            if (!v20) break;
            int v21 = 2;
            int v22 = 1;
            int v23 = v15 + v22;
            v14 = v21;
            v15 = v23;
          }
          v11 = v14;
        }
        default:
          {
          int v24 = 0;
          bool v25 = v2 != v24;
          int v26;
          if (v25) {
            int v27 = 3;
            v26 = v27;
          } else {
            int v28 = 4;
            v26 = v28;
          }
          v11 = v26;
          break;
        }
        case 1:
          {
          int v29 = 0;
          bool v30 = v2 != v29;
          int v31;
          if (v30) {
            int v32 = 1;
            int v33 = v0 + v32;
            v31 = v33;
          } else {
            int v34 = 4;
            v31 = v34;
          }
          v11 = v31;
          break;
        }
      }
      v6 = v11;
    }
    case 1:
      {
      int v35 = 2;
      int v36 = v3 % v35;
      int v37 = 2;
      int v38 = v0 + v37;
      int v39;
      v39 = v38;
      switch (v36) {
        default:
          {
          int v40 = 4;
          int v41 = v3 % v40;
          int v42 = 3;
          int v43;
          v43 = v42;
          switch (v41) {
            case 0:
              {
              v43 = v0;
              break;
            }
            default:
              {
              v43 = v0;
            }
            case 1:
              {
              int v44 = 1;
              int v45 = v0 + v44;
              v43 = v45;
              break;
            }
            case 2:
              {
              int v46 = 3;
              int v47 = v0 + v46;
              v43 = v47;
              break;
            }
          }
          v39 = v43;
          break;
        }
        case 0:
          {
          int v48 = 0;
          int v49 = 0;
          int v50;
          int v51;
          v50 = v48;
          v51 = v49;
          while (true) {
            int v52 = 4;
            int v53 = v3 % v52;
            int v54 = 1;
            int v55 = v53 + v54;
            bool v56 = v51 < v55;
            v50 = v50;
            v51 = v51;
            if (!v56) break;
            int v57 = 3;
            int v58 = v0 + v57;
            int v59 = 1;
            int v60 = v51 + v59;
            v50 = v58;
            v51 = v60;
            break;
            ;
          }
          v39 = v50;
          break;
        }
        case 1:
          {
          int v61 = 4;
          int v62 = v3 % v61;
          int v63;
          v63 = v0;
          switch (v62) {
            case 0:
              {
              v63 = v0;
            }
            case 1:
              {
              int v64 = 2;
              v63 = v64;
              break;
            }
            case 2:
              {
              int v65 = 2;
              v63 = v65;
              break;
            }
            default:
              {
              v63 = v0;
              break;
            }
          }
          v39 = v63;
          break;
        }
      }
      v6 = v39;
    }
    default:
      {
      int v66 = 2;
      int v67 = v3 % v66;
      int v68 = 0;
      int v69 = v0 + v68;
      int v70;
      v70 = v69;
      switch (v67) {
        case 0:
          {
          int v71 = 2;
          int v72 = v3 % v71;
          int v73;
          v73 = v0;
          switch (v72) {
            case 0:
              {
              int v74 = 4;
              int v75 = v0 + v74;
              v73 = v75;
              break;
            }
            default:
              {
              v73 = v0;
              break;
            }
          }
          v70 = v73;
        }
        default:
          {
          int v76 = 3;
          int v77 = v3 % v76;
          int v78 = 1;
          int v79 = v0 + v78;
          int v80;
          v80 = v79;
          switch (v77) {
            case 0:
              {
              v80 = v0;
              break;
            }
            case 1:
              {
              int v81 = 1;
              v80 = v81;
              break;
            }
            default:
              {
              int v82 = 2;
              v80 = v82;
              break;
            }
            case 2:
              {
              int v83 = 4;
              int v84 = v0 + v83;
              v80 = v84;
              break;
            }
          }
          v70 = v80;
        }
        case 1:
          {
          int v85 = 2;
          int v86 = v3 % v85;
          int v87;
          v87 = v0;
          switch (v86) {
            default:
              {
              int v88 = 0;
              int v89 = v0 + v88;
              v87 = v89;
              break;
            }
            case 0:
              {
              int v90 = 2;
              v87 = v90;
              break;
            }
          }
          v70 = v87;
          break;
        }
      }
      v6 = v70;
      break;
    }
  }
  bool v91 = true;
  int v92 = simt_wave_count_bits(v91);
  int v93 = 0;
  int v94 = v93 + v0;
  v1[v94] = v92;
  return;
}

kernel void kernel_main(device int* v95 [[buffer(0)]], device int* v96 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v97 = static_cast<int>(__simt_tid3.x);
  int v98 = 0;
  int v99 = v98 + v97;
  int v100 = v96[v99];
  int v101 = 4;
  int v102 = v101 + v97;
  int v103 = v96[v102];
  helper0(v97, v95, v100, v103, static_cast<int>(__simt_tid3.x));
  int v104 = 8;
  int v105 = v104 + v97;
  int v106 = v96[v105];
  int v107 = 0;
  bool v108 = v106 != v107;
  int v109;
  if (v108) {
    int v110 = 12;
    int v111 = v110 + v97;
    int v112 = v96[v111];
    uint v113 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v114 = (int)(v113);
    int v115;
    v115 = v114;
    switch (v112) {
      default:
        {
        int v116 = 16;
        int v117 = v116 + v97;
        int v118 = v96[v117];
        int v119 = 4;
        int v120;
        v120 = v119;
        switch (v118) {
          default:
            {
            v120 = v97;
            break;
          }
          case 0:
            {
            int v121 = 4;
            v120 = v121;
            break;
          }
          case 1:
            {
            int v122 = 0;
            v120 = v122;
            break;
          }
        }
        v115 = v120;
        break;
      }
      case 0:
        {
        int v123 = 20;
        int v124 = v123 + v97;
        int v125 = v96[v124];
        int v126 = 0;
        bool v127 = v125 != v126;
        int v128;
        if (v127) {
          int v129 = 2;
          int v130 = v97 + v129;
          v128 = v130;
        } else {
          v128 = v97;
        }
        v115 = v128;
        break;
      }
    }
    v109 = v115;
  } else {
    int v131 = 24;
    int v132 = v131 + v97;
    int v133 = v96[v132];
    int v134 = 0;
    bool v135 = v133 != v134;
    int v136;
    if (v135) {
      int v137 = 0;
      int v138 = 0;
      int v139;
      int v140;
      v139 = v137;
      v140 = v138;
      while (true) {
        int v141 = 4;
        int v142 = v140 * v141;
        int v143 = v142 + v97;
        int v144 = 28;
        int v145 = v144 + v143;
        int v146 = v96[v145];
        int v147 = 0;
        bool v148 = v146 != v147;
        v139 = v139;
        v140 = v140;
        if (!v148) break;
        int v149 = v139 + v140;
        int v150 = 1;
        int v151 = v140 + v150;
        bool v152 = true;
        int v153 = 16;
        int v154 = 4;
        int v155 = v140 * v154;
        int v156 = v153 + v155;
        int v157 = v156 + v97;
        bool v158 = true;
        int v159 = simt_wave_count_bits(v158);
        v95[v157] = v159;
        v139 = v149;
        v140 = v151;
      }
      v136 = v139;
    } else {
      int v160 = 1;
      int v161 = v97 + v160;
      v136 = v161;
    }
    int v162 = 32;
    int v163 = v162 + v97;
    bool v164 = true;
    int v165 = simt_wave_count_bits(v164);
    v95[v163] = v165;
    v109 = v136;
  }
  int v166 = 48;
  int v167 = v166 + v97;
  bool v168 = true;
  int v169 = simt_wave_count_bits(v168);
  v95[v167] = v169;
  int v170 = 48;
  int v171 = v170 + v97;
  int v172 = v96[v171];
  int v173;
  v173 = v97;
  switch (v172) {
    case 0:
      {
      int v174 = 52;
      int v175 = v174 + v97;
      int v176 = v96[v175];
      int v177 = 3;
      int v178 = v97 + v177;
      int v179;
      v179 = v178;
      switch (v176) {
        default:
          {
          int v180 = 56;
          int v181 = v180 + v97;
          int v182 = v96[v181];
          int v183;
          v183 = v97;
          switch (v182) {
            case 0:
              {
              int v184 = 3;
              v183 = v184;
              break;
            }
            default:
              {
              v183 = v97;
              break;
            }
            case 1:
              {
              int v185 = 3;
              int v186 = v97 + v185;
              v183 = v186;
              break;
            }
          }
          v179 = v183;
          break;
        }
        case 0:
          {
          int v187 = 60;
          int v188 = v187 + v97;
          int v189 = v96[v188];
          int v190 = 4;
          int v191 = v97 + v190;
          int v192;
          v192 = v191;
          switch (v189) {
            default:
              {
              int v193 = 1;
              v192 = v193;
              break;
            }
            case 0:
              {
              int v194 = 1;
              int v195 = v97 + v194;
              v192 = v195;
              break;
            }
          }
          v179 = v192;
          break;
        }
      }
      bool v196 = true;
      v173 = v179;
      break;
    }
    case 1:
      {
      int v197 = 64;
      int v198 = v197 + v97;
      int v199 = v96[v198];
      int v200 = 0;
      bool v201 = v199 != v200;
      int v202;
      if (v201) {
        int v203 = 0;
        int v204 = 0;
        int v205;
        int v206;
        v205 = v203;
        v206 = v204;
        while (true) {
          int v207 = 4;
          int v208 = v206 * v207;
          int v209 = v208 + v97;
          int v210 = 68;
          int v211 = v210 + v209;
          int v212 = v96[v211];
          int v213 = 0;
          bool v214 = v212 != v213;
          v205 = v205;
          v206 = v206;
          if (!v214) break;
          int v215 = v205 + v206;
          int v216 = 1;
          int v217 = v206 + v216;
          bool v218 = true;
          v205 = v215;
          v206 = v217;
          break;
          ;
        }
        v202 = v205;
      } else {
        int v219 = 88;
        int v220 = v219 + v97;
        int v221 = v96[v220];
        int v222 = 3;
        int v223 = v97 + v222;
        int v224;
        v224 = v223;
        switch (v221) {
          case 0:
            {
            v224 = v97;
          }
          default:
            {
            int v225 = 3;
            v224 = v225;
          }
          case 1:
            {
            int v226 = 4;
            v224 = v226;
          }
          case 2:
            {
            v224 = v97;
            break;
          }
        }
        v202 = v224;
      }
      v173 = v202;
      break;
    }
    default:
      {
      int v227 = 92;
      int v228 = v227 + v97;
      int v229 = v96[v228];
      int v230 = 3;
      int v231;
      v231 = v230;
      switch (v229) {
        case 0:
          {
          int v232 = 96;
          int v233 = v232 + v97;
          int v234 = v96[v233];
          int v235 = 1;
          int v236;
          v236 = v235;
          switch (v234) {
            default:
              {
              int v237 = 0;
              v236 = v237;
            }
            case 0:
              {
              v236 = v97;
              break;
            }
            case 1:
              {
              v236 = v97;
              break;
            }
          }
          v231 = v236;
        }
        case 1:
          {
          int v238 = 100;
          int v239 = v238 + v97;
          int v240 = v96[v239];
          int v241 = 2;
          int v242 = v97 + v241;
          int v243;
          v243 = v242;
          switch (v240) {
            case 0:
              {
              v243 = v97;
              break;
            }
            default:
              {
              v243 = v97;
              break;
            }
            case 1:
              {
              int v244 = 4;
              v243 = v244;
              break;
            }
            case 2:
              {
              int v245 = 2;
              v243 = v245;
              break;
            }
          }
          v231 = v243;
          break;
        }
        case 2:
          {
          int v246 = 0;
          v231 = v246;
        }
        default:
          {
          v231 = v97;
          break;
        }
      }
      v173 = v231;
      break;
    }
    case 2:
      {
      int v247 = 104;
      int v248 = v247 + v97;
      int v249 = v96[v248];
      int v250 = 1;
      int v251 = v97 + v250;
      int v252;
      v252 = v251;
      switch (v249) {
        case 0:
          {
          int v253 = 4;
          int v254 = v97 + v253;
          v252 = v254;
          break;
        }
        case 1:
          {
          int v255 = 108;
          int v256 = v255 + v97;
          int v257 = v96[v256];
          int v258 = 2;
          int v259 = v97 + v258;
          int v260;
          v260 = v259;
          switch (v257) {
            default:
              {
              v260 = v97;
              break;
            }
            case 0:
              {
              v260 = v97;
              break;
            }
            case 1:
              {
              int v261 = 1;
              v260 = v261;
              break;
            }
          }
          v252 = v260;
          break;
        }
        case 2:
          {
          int v262 = 112;
          int v263 = v262 + v97;
          int v264 = v96[v263];
          int v265 = 0;
          int v266 = v97 + v265;
          int v267;
          v267 = v266;
          switch (v264) {
            case 0:
              {
              int v268 = 2;
              int v269 = v97 + v268;
              v267 = v269;
              break;
            }
            default:
              {
              v267 = v97;
              break;
            }
          }
          bool v270 = true;
          v252 = v267;
          break;
        }
        default:
          {
          int v271 = 116;
          int v272 = v271 + v97;
          int v273 = v96[v272];
          int v274 = 0;
          bool v275 = v273 != v274;
          int v276;
          if (v275) {
            int v277 = 3;
            v276 = v277;
          } else {
            v276 = v97;
          }
          v252 = v276;
          break;
        }
      }
      v173 = v252;
      break;
    }
  }
  bool v278 = true;
  int v279 = 64;
  int v280 = v279 + v97;
  bool v281 = true;
  int v282 = simt_wave_count_bits(v281);
  v95[v280] = v282;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 120; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
