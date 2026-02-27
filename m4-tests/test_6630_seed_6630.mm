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
    int v13 = 0;
    bool v14 = v2 != v13;
    int v15;
    if (v14) {
      bool v16 = true;
      int v17 = simt_wave_count_bits(v16);
      int v18 = 0;
      int v19 = 4;
      int v20 = v7 * v19;
      int v21 = v18 + v20;
      int v22 = v21 + v0;
      v1[v22] = v17;
      v15 = v17;
    } else {
      bool v23 = true;
      int v24 = simt_wave_count_bits(v23);
      int v25 = 16;
      int v26 = 4;
      int v27 = v7 * v26;
      int v28 = v25 + v27;
      int v29 = v28 + v0;
      v1[v29] = v24;
      v15 = v24;
    }
    int v30 = 1;
    int v31 = v7 + v30;
    v6 = v15;
    v7 = v31;
    continue;
    ;
  }
  int v32 = 3;
  int v33 = v3 % v32;
  uint v34 = simt_subgroup_id(__simt_tid);
  int v35 = (int)(v34);
  int v36;
  v36 = v35;
  switch (v33) {
    case 0:
      {
      int v37 = 3;
      int v38 = v3 % v37;
      int v39;
      v39 = v0;
      switch (v38) {
        case 0:
          {
          int v40 = 3;
          int v41 = v3 % v40;
          int v42 = 2;
          int v43 = v0 + v42;
          int v44;
          v44 = v43;
          switch (v41) {
            default:
              {
              int v45 = 4;
              int v46 = v0 + v45;
              v44 = v46;
            }
            case 0:
              {
              int v47 = 0;
              int v48 = v0 + v47;
              v44 = v48;
            }
            case 1:
              {
              int v49 = 4;
              v44 = v49;
              break;
            }
          }
          int v50 = 2;
          v39 = v44;
        }
        case 1:
          {
          int v51 = 0;
          bool v52 = v2 != v51;
          int v53;
          if (v52) {
            v53 = v0;
          } else {
            int v54 = 0;
            v53 = v54;
          }
          v39 = v53;
        }
        default:
          {
          int v55 = 0;
          int v56 = 0;
          int v57;
          int v58;
          v57 = v55;
          v58 = v56;
          while (true) {
            int v59 = 4;
            int v60 = v3 % v59;
            int v61 = 1;
            int v62 = v60 + v61;
            bool v63 = v58 < v62;
            v57 = v57;
            v58 = v58;
            if (!v63) break;
            int v64 = 4;
            int v65 = v0 + v64;
            int v66 = 1;
            int v67 = v58 + v66;
            v57 = v65;
            v58 = v67;
          }
          v39 = v57;
          break;
        }
      }
      int v68 = 3;
      v36 = v39;
      break;
    }
    default:
      {
      int v69 = 0;
      int v70 = 0;
      int v71;
      int v72;
      v71 = v69;
      v72 = v70;
      while (true) {
        int v73 = 4;
        int v74 = v3 % v73;
        int v75 = 1;
        int v76 = v74 + v75;
        bool v77 = v72 < v76;
        v71 = v71;
        v72 = v72;
        if (!v77) break;
        int v78 = 2;
        int v79 = v3 % v78;
        int v80 = 4;
        int v81 = v0 + v80;
        int v82;
        v82 = v81;
        switch (v79) {
          case 0:
            {
            v82 = v0;
            break;
          }
          default:
            {
            int v83 = 3;
            v82 = v83;
            break;
          }
        }
        int v84 = 1;
        int v85 = v72 + v84;
        v71 = v82;
        v72 = v85;
        continue;
        ;
      }
      v36 = v71;
      break;
    }
    case 1:
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
        int v95 = 0;
        bool v96 = v2 != v95;
        int v97;
        if (v96) {
          int v98 = 0;
          int v99 = v0 + v98;
          v97 = v99;
        } else {
          int v100 = 3;
          int v101 = v0 + v100;
          v97 = v101;
        }
        int v102 = 1;
        int v103 = v89 + v102;
        v88 = v97;
        v89 = v103;
      }
      v36 = v88;
      break;
    }
    case 2:
      {
      int v104 = 0;
      bool v105 = v2 != v104;
      int v106;
      if (v105) {
        int v107 = 0;
        int v108 = 0;
        int v109;
        int v110;
        v109 = v107;
        v110 = v108;
        while (true) {
          int v111 = 4;
          int v112 = v3 % v111;
          int v113 = 1;
          int v114 = v112 + v113;
          bool v115 = v110 < v114;
          v109 = v109;
          v110 = v110;
          if (!v115) break;
          int v116 = 1;
          int v117 = v110 + v116;
          v109 = v0;
          v110 = v117;
        }
        v106 = v109;
      } else {
        int v118 = 0;
        bool v119 = v2 != v118;
        int v120;
        if (v119) {
          int v121 = 2;
          v120 = v121;
        } else {
          v120 = v0;
        }
        v106 = v120;
      }
      v36 = v106;
      break;
    }
  }
  int v122 = 0;
  bool v123 = v2 != v122;
  int v124 = v123 ? v6 : v36;
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
  int v137 = 0;
  bool v138 = v136 != v137;
  int v139;
  if (v138) {
    int v140 = 12;
    int v141 = v140 + v127;
    int v142 = v126[v141];
    int v143 = 2;
    int v144;
    v144 = v143;
    switch (v142) {
      case 0:
        {
        int v145 = 0;
        int v146 = 0;
        int v147;
        int v148;
        v147 = v145;
        v148 = v146;
        while (true) {
          int v149 = 4;
          int v150 = v148 * v149;
          int v151 = v150 + v127;
          int v152 = 16;
          int v153 = v152 + v151;
          int v154 = v126[v153];
          int v155 = 0;
          bool v156 = v154 != v155;
          v147 = v147;
          v148 = v148;
          if (!v156) break;
          int v157 = v147 + v148;
          int v158 = 1;
          int v159 = v148 + v158;
          bool v160 = true;
          v147 = v157;
          v148 = v159;
        }
        v144 = v147;
        break;
      }
      case 1:
        {
        int v161 = 36;
        int v162 = v161 + v127;
        int v163 = v126[v162];
        int v164 = 0;
        bool v165 = v163 != v164;
        int v166;
        if (v165) {
          int v167 = 2;
          int v168 = v127 + v167;
          v166 = v168;
        } else {
          v166 = v127;
        }
        v144 = v166;
        break;
      }
      default:
        {
        int v169 = 0;
        int v170 = 0;
        int v171;
        int v172;
        v171 = v169;
        v172 = v170;
        while (true) {
          int v173 = 4;
          int v174 = v172 * v173;
          int v175 = v174 + v127;
          int v176 = 40;
          int v177 = v176 + v175;
          int v178 = v126[v177];
          int v179 = 0;
          bool v180 = v178 != v179;
          v171 = v171;
          v172 = v172;
          if (!v180) break;
          int v181 = v171 + v172;
          int v182 = 1;
          int v183 = v172 + v182;
          bool v184 = true;
          v171 = v181;
          v172 = v183;
        }
        v144 = v171;
        break;
      }
      case 2:
        {
        int v185 = 1;
        int v186 = v127 + v185;
        v144 = v186;
        break;
      }
    }
    bool v187 = true;
    int v188 = 32;
    int v189 = v188 + v127;
    bool v190 = true;
    int v191 = simt_wave_count_bits(v190);
    v125[v189] = v191;
    v139 = v144;
  } else {
    int v192 = 60;
    int v193 = v192 + v127;
    int v194 = v126[v193];
    int v195 = 0;
    bool v196 = v194 != v195;
    int v197;
    if (v196) {
      int v198 = 64;
      int v199 = v198 + v127;
      int v200 = v126[v199];
      int v201 = 3;
      int v202 = v127 + v201;
      int v203;
      v203 = v202;
      switch (v200) {
        case 0:
          {
          int v204 = 0;
          v203 = v204;
          break;
        }
        case 1:
          {
          int v205 = 4;
          int v206 = v127 + v205;
          v203 = v206;
        }
        default:
          {
          int v207 = 0;
          int v208 = v127 + v207;
          v203 = v208;
        }
        case 2:
          {
          v203 = v127;
          break;
        }
      }
      v197 = v203;
    } else {
      int v209 = 0;
      int v210 = 0;
      int v211;
      int v212;
      v211 = v209;
      v212 = v210;
      while (true) {
        int v213 = 4;
        int v214 = v212 * v213;
        int v215 = v214 + v127;
        int v216 = 68;
        int v217 = v216 + v215;
        int v218 = v126[v217];
        int v219 = 0;
        bool v220 = v218 != v219;
        v211 = v211;
        v212 = v212;
        if (!v220) break;
        int v221 = v211 + v212;
        int v222 = 1;
        int v223 = v212 + v222;
        bool v224 = true;
        int v225 = 48;
        int v226 = 4;
        int v227 = v212 * v226;
        int v228 = v225 + v227;
        int v229 = v228 + v127;
        bool v230 = true;
        int v231 = simt_wave_count_bits(v230);
        v125[v229] = v231;
        v211 = v221;
        v212 = v223;
      }
      v197 = v211;
    }
    int v232 = 64;
    int v233 = v232 + v127;
    bool v234 = true;
    int v235 = simt_wave_count_bits(v234);
    v125[v233] = v235;
    v139 = v197;
  }
  int v236 = 80;
  int v237 = v236 + v127;
  bool v238 = true;
  int v239 = simt_wave_count_bits(v238);
  v125[v237] = v239;
  uint v240 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v241 = (int)(v240);
  int v242 = 0;
  int v243 = 0;
  int v244;
  int v245;
  v244 = v242;
  v245 = v243;
  while (true) {
    int v246 = 4;
    int v247 = v245 * v246;
    int v248 = v247 + v127;
    int v249 = 88;
    int v250 = v249 + v248;
    int v251 = v126[v250];
    int v252 = 0;
    bool v253 = v251 != v252;
    v244 = v244;
    v245 = v245;
    if (!v253) break;
    int v254 = 0;
    int v255 = 0;
    int v256;
    int v257;
    v256 = v254;
    v257 = v255;
    while (true) {
      int v258 = 4;
      int v259 = v257 * v258;
      int v260 = v259 + v127;
      int v261 = 108;
      int v262 = v261 + v260;
      int v263 = v126[v262];
      int v264 = 0;
      bool v265 = v263 != v264;
      v256 = v256;
      v257 = v257;
      if (!v265) break;
      uint v266 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v267 = (int)(v266);
      int v268 = v256 + v267;
      int v269 = 1;
      int v270 = v257 + v269;
      bool v271 = true;
      int v272 = 96;
      int v273 = 4;
      int v274 = v257 * v273;
      int v275 = v272 + v274;
      int v276 = v275 + v127;
      bool v277 = true;
      int v278 = simt_wave_count_bits(v277);
      v125[v276] = v278;
      v256 = v268;
      v257 = v270;
      continue;
      ;
    }
    int v279 = v244 + v256;
    int v280 = 1;
    int v281 = v245 + v280;
    bool v282 = true;
    int v283 = 112;
    int v284 = 4;
    int v285 = v245 * v284;
    int v286 = v283 + v285;
    int v287 = v286 + v127;
    bool v288 = true;
    int v289 = simt_wave_count_bits(v288);
    v125[v287] = v289;
    v244 = v279;
    v245 = v281;
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 128; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 128; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
