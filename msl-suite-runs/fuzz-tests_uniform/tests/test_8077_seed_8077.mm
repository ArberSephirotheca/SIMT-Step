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
  int v5 = v0 + v4;
  int v6 = 4;
  int v7 = v3 % v6;
  uint v8 = simt_subgroup_id(__simt_tid);
  int v9 = (int)(v8);
  int v10;
  v10 = v9;
  switch (v7) {
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
        int v20 = 0;
        int v21 = 0;
        int v22;
        int v23;
        v22 = v20;
        v23 = v21;
        while (true) {
          int v24 = 4;
          int v25 = v3 % v24;
          int v26 = 1;
          int v27 = v25 + v26;
          bool v28 = v23 < v27;
          v22 = v22;
          v23 = v23;
          if (!v28) break;
          int v29 = 3;
          int v30 = v0 + v29;
          int v31 = 1;
          int v32 = v23 + v31;
          v22 = v30;
          v23 = v32;
        }
        int v33 = 2;
        int v34 = 1;
        int v35 = v14 + v34;
        v13 = v22;
        v14 = v35;
        continue;
        ;
      }
      int v36 = 2;
      v10 = v13;
      break;
    }
    default:
      {
      int v37 = 3;
      int v38 = v3 % v37;
      int v39 = 4;
      int v40 = v0 + v39;
      int v41;
      v41 = v40;
      switch (v38) {
        case 0:
          {
          v41 = v0;
          break;
        }
        case 1:
          {
          int v42 = 0;
          int v43 = 0;
          int v44;
          int v45;
          v44 = v42;
          v45 = v43;
          while (true) {
            int v46 = 4;
            int v47 = v3 % v46;
            int v48 = 1;
            int v49 = v47 + v48;
            bool v50 = v45 < v49;
            v44 = v44;
            v45 = v45;
            if (!v50) break;
            int v51 = 1;
            int v52 = v45 + v51;
            v44 = v0;
            v45 = v52;
          }
          v41 = v44;
        }
        case 2:
          {
          int v53 = 0;
          int v54 = 0;
          int v55;
          int v56;
          v55 = v53;
          v56 = v54;
          while (true) {
            int v57 = 4;
            int v58 = v3 % v57;
            int v59 = 1;
            int v60 = v58 + v59;
            bool v61 = v56 < v60;
            v55 = v55;
            v56 = v56;
            if (!v61) break;
            int v62 = 0;
            int v63 = v0 + v62;
            int v64 = 1;
            int v65 = v56 + v64;
            v55 = v63;
            v56 = v65;
          }
          int v66 = 0;
          int v67 = v0 + v66;
          v41 = v55;
        }
        default:
          {
          int v68 = 2;
          int v69 = v3 % v68;
          int v70 = 1;
          int v71;
          v71 = v70;
          switch (v69) {
            case 0:
              {
              int v72 = 3;
              int v73 = v0 + v72;
              v71 = v73;
              break;
            }
            default:
              {
              int v74 = 0;
              v71 = v74;
              break;
            }
            case 1:
              {
              int v75 = 2;
              int v76 = v0 + v75;
              v71 = v76;
              break;
            }
          }
          v41 = v71;
          break;
        }
      }
      int v77 = 4;
      v10 = v41;
      break;
    }
    case 1:
      {
      int v78 = 4;
      int v79;
      v79 = v78;
      switch (v3) {
        default:
          {
          int v80 = 4;
          int v81 = v0 + v80;
          v79 = v81;
          break;
        }
        case 0:
          {
          int v82 = 0;
          bool v83 = v2 != v82;
          int v84;
          if (v83) {
            v84 = v0;
          } else {
            int v85 = 0;
            v84 = v85;
          }
          int v86 = 3;
          int v87 = v0 + v86;
          v79 = v84;
          break;
        }
      }
      int v88 = 3;
      int v89 = v0 + v88;
      v10 = v79;
      break;
    }
    case 2:
      {
      int v90 = 2;
      int v91 = v3 % v90;
      int v92 = 0;
      int v93 = v0 + v92;
      int v94;
      v94 = v93;
      switch (v91) {
        case 0:
          {
          int v95 = 0;
          int v96 = 0;
          int v97;
          int v98;
          v97 = v95;
          v98 = v96;
          while (true) {
            int v99 = 4;
            int v100 = v3 % v99;
            int v101 = 1;
            int v102 = v100 + v101;
            bool v103 = v98 < v102;
            v97 = v97;
            v98 = v98;
            if (!v103) break;
            int v104 = 2;
            int v105 = v0 + v104;
            int v106 = 1;
            int v107 = v98 + v106;
            v97 = v105;
            v98 = v107;
          }
          int v108 = 0;
          int v109 = v0 + v108;
          v94 = v97;
          break;
        }
        default:
          {
          int v110 = 3;
          int v111 = v3 % v110;
          int v112;
          v112 = v0;
          switch (v111) {
            default:
              {
              int v113 = 1;
              v112 = v113;
              break;
            }
            case 0:
              {
              int v114 = 4;
              v112 = v114;
              break;
            }
            case 1:
              {
              int v115 = 1;
              v112 = v115;
              break;
            }
            case 2:
              {
              int v116 = 1;
              v112 = v116;
              break;
            }
          }
          int v117 = 1;
          int v118 = v0 + v117;
          v94 = v112;
          break;
        }
      }
      v10 = v94;
      break;
    }
  }
  bool v119 = true;
  int v120 = simt_wave_count_bits(v119);
  int v121 = 0;
  int v122 = v121 + v0;
  v1[v122] = v120;
  int v123 = 0;
  bool v124 = v2 != v123;
  int v125 = v124 ? v5 : v10;
  return;
}

kernel void kernel_main(device int* v126 [[buffer(0)]], device int* v127 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v128 = static_cast<int>(__simt_tid3.x);
  int v129 = 0;
  int v130 = v129 + v128;
  int v131 = v127[v130];
  int v132 = 4;
  int v133 = v132 + v128;
  int v134 = v127[v133];
  helper0(v128, v126, v131, v134, static_cast<int>(__simt_tid3.x));
  int v135 = 8;
  int v136 = v135 + v128;
  int v137 = v127[v136];
  int v138 = 0;
  bool v139 = v137 != v138;
  int v140;
  if (v139) {
    int v141 = 12;
    int v142 = v141 + v128;
    int v143 = v127[v142];
    int v144 = 4;
    int v145;
    v145 = v144;
    switch (v143) {
      default:
        {
        int v146 = 16;
        int v147 = v146 + v128;
        int v148 = v127[v147];
        int v149 = 2;
        int v150 = v128 + v149;
        int v151;
        v151 = v150;
        switch (v148) {
          case 0:
            {
            int v152 = 1;
            v151 = v152;
            break;
          }
          case 1:
            {
            int v153 = 1;
            v151 = v153;
            break;
          }
          default:
            {
            v151 = v128;
            break;
          }
        }
        bool v154 = true;
        v145 = v151;
      }
      case 0:
        {
        int v155 = 20;
        int v156 = v155 + v128;
        int v157 = v127[v156];
        int v158 = 0;
        bool v159 = v157 != v158;
        int v160;
        if (v159) {
          int v161 = 1;
          int v162 = v128 + v161;
          v160 = v162;
        } else {
          int v163 = 2;
          v160 = v163;
        }
        v145 = v160;
      }
      case 1:
        {
        int v164 = 24;
        int v165 = v164 + v128;
        int v166 = v127[v165];
        int v167 = 0;
        bool v168 = v166 != v167;
        int v169;
        if (v168) {
          int v170 = 0;
          int v171 = v128 + v170;
          v169 = v171;
        } else {
          v169 = v128;
        }
        v145 = v169;
        break;
      }
    }
    bool v172 = true;
    v140 = v145;
  } else {
    uint v173 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v174 = (int)(v173);
    v140 = v174;
  }
  int v175 = 16;
  int v176 = v175 + v128;
  bool v177 = true;
  int v178 = simt_wave_count_bits(v177);
  v126[v176] = v178;
  int v179 = 28;
  int v180 = v179 + v128;
  int v181 = v127[v180];
  int v182;
  v182 = v128;
  switch (v181) {
    case 0:
      {
      int v183 = 32;
      int v184 = v183 + v128;
      int v185 = v127[v184];
      int v186 = 0;
      bool v187 = v185 != v186;
      int v188;
      if (v187) {
        int v189 = 36;
        int v190 = v189 + v128;
        int v191 = v127[v190];
        int v192 = 0;
        int v193 = v128 + v192;
        int v194;
        v194 = v193;
        switch (v191) {
          case 0:
            {
            int v195 = 3;
            int v196 = v128 + v195;
            v194 = v196;
          }
          default:
            {
            int v197 = 2;
            int v198 = v128 + v197;
            v194 = v198;
            break;
          }
        }
        bool v199 = true;
        v188 = v194;
      } else {
        int v200 = 40;
        int v201 = v200 + v128;
        int v202 = v127[v201];
        int v203 = 0;
        bool v204 = v202 != v203;
        int v205;
        if (v204) {
          int v206 = 2;
          v205 = v206;
        } else {
          int v207 = 1;
          v205 = v207;
        }
        v188 = v205;
      }
      v182 = v188;
      break;
    }
    default:
      {
      int v208 = 0;
      int v209 = 0;
      int v210;
      int v211;
      v210 = v208;
      v211 = v209;
      while (true) {
        int v212 = 4;
        int v213 = v211 * v212;
        int v214 = v213 + v128;
        int v215 = 44;
        int v216 = v215 + v214;
        int v217 = v127[v216];
        int v218 = 0;
        bool v219 = v217 != v218;
        v210 = v210;
        v211 = v211;
        if (!v219) break;
        int v220 = 4;
        int v221 = v210 + v220;
        int v222 = 1;
        int v223 = v211 + v222;
        v210 = v221;
        v211 = v223;
      }
      bool v224 = true;
      v182 = v210;
      break;
    }
  }
  bool v225 = true;
  int v226 = 32;
  int v227 = v226 + v128;
  bool v228 = true;
  int v229 = simt_wave_count_bits(v228);
  v126[v227] = v229;
  int v230 = 64;
  int v231 = v230 + v128;
  int v232 = v127[v231];
  int v233 = 0;
  bool v234 = v232 != v233;
  int v235;
  if (v234) {
    int v236 = 0;
    int v237 = 0;
    int v238;
    int v239;
    v238 = v236;
    v239 = v237;
    while (true) {
      int v240 = 4;
      int v241 = v239 * v240;
      int v242 = v241 + v128;
      int v243 = 68;
      int v244 = v243 + v242;
      int v245 = v127[v244];
      int v246 = 0;
      bool v247 = v245 != v246;
      v238 = v238;
      v239 = v239;
      if (!v247) break;
      int v248 = 88;
      int v249 = v248 + v128;
      int v250 = v127[v249];
      int v251 = 2;
      int v252;
      v252 = v251;
      switch (v250) {
        case 0:
          {
          v252 = v128;
          break;
        }
        case 1:
          {
          int v253 = 1;
          int v254 = v128 + v253;
          v252 = v254;
          break;
        }
        case 2:
          {
          v252 = v128;
          break;
        }
        default:
          {
          int v255 = 4;
          v252 = v255;
          break;
        }
      }
      bool v256 = true;
      int v257 = v238 + v252;
      int v258 = 1;
      int v259 = v239 + v258;
      v238 = v257;
      v239 = v259;
    }
    bool v260 = true;
    v235 = v238;
  } else {
    int v261 = 92;
    int v262 = v261 + v128;
    int v263 = v127[v262];
    uint v264 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v265 = (int)(v264);
    int v266;
    v266 = v265;
    switch (v263) {
      default:
        {
        int v267 = 0;
        int v268 = v128 + v267;
        v266 = v268;
        break;
      }
      case 0:
        {
        int v269 = 0;
        int v270 = 0;
        int v271;
        int v272;
        v271 = v269;
        v272 = v270;
        while (true) {
          int v273 = 4;
          int v274 = v272 * v273;
          int v275 = v274 + v128;
          int v276 = 96;
          int v277 = v276 + v275;
          int v278 = v127[v277];
          int v279 = 0;
          bool v280 = v278 != v279;
          v271 = v271;
          v272 = v272;
          if (!v280) break;
          int v281 = v271 + v272;
          int v282 = 1;
          int v283 = v272 + v282;
          v271 = v281;
          v272 = v283;
        }
        bool v284 = true;
        v266 = v271;
      }
      case 1:
        {
        int v285 = 116;
        int v286 = v285 + v128;
        int v287 = v127[v286];
        int v288 = 0;
        bool v289 = v287 != v288;
        int v290;
        if (v289) {
          int v291 = 0;
          v290 = v291;
        } else {
          v290 = v128;
        }
        v266 = v290;
        break;
      }
    }
    bool v292 = true;
    v235 = v266;
  }
  int v293 = 48;
  int v294 = v293 + v128;
  bool v295 = true;
  int v296 = simt_wave_count_bits(v295);
  v126[v294] = v296;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 120; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
