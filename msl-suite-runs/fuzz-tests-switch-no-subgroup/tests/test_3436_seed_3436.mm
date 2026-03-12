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
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 0;
      bool v10 = v2 != v9;
      int v11;
      if (v10) {
        int v12 = 0;
        bool v13 = v2 != v12;
        int v14;
        if (v13) {
          v14 = v0;
        } else {
          v14 = v0;
        }
        v11 = v14;
      } else {
        int v15 = 2;
        int v16 = v0 + v15;
        int v17;
        v17 = v16;
        switch (v3) {
          case 0:
            {
            int v18 = 4;
            v17 = v18;
          }
          default:
            {
            int v19 = 1;
            int v20 = v0 + v19;
            v17 = v20;
            break;
          }
        }
        v11 = v17;
      }
      v8 = v11;
      break;
    }
    case 0:
      {
      int v21 = 2;
      int v22 = v3 % v21;
      int v23 = 2;
      int v24 = v0 + v23;
      int v25;
      v25 = v24;
      switch (v22) {
        case 0:
          {
          int v26 = 2;
          int v27 = v3 % v26;
          int v28 = 0;
          int v29;
          v29 = v28;
          switch (v27) {
            default:
              {
              int v30 = 2;
              int v31 = v0 + v30;
              v29 = v31;
              break;
            }
            case 0:
              {
              int v32 = 4;
              int v33 = v0 + v32;
              v29 = v33;
              break;
            }
          }
          int v34 = 0;
          int v35 = v0 + v34;
          v25 = v29;
          break;
        }
        case 1:
          {
          int v36 = 1;
          int v37;
          v37 = v36;
          switch (v3) {
            case 0:
              {
              int v38 = 0;
              int v39 = v0 + v38;
              v37 = v39;
              break;
            }
            default:
              {
              v37 = v0;
              break;
            }
          }
          v25 = v37;
          break;
        }
        default:
          {
          int v40 = 0;
          int v41 = 0;
          int v42;
          int v43;
          v42 = v40;
          v43 = v41;
          while (true) {
            int v44 = 4;
            int v45 = v3 % v44;
            int v46 = 1;
            int v47 = v45 + v46;
            bool v48 = v43 < v47;
            v42 = v42;
            v43 = v43;
            if (!v48) break;
            int v49 = 3;
            int v50 = 1;
            int v51 = v43 + v50;
            v42 = v49;
            v43 = v51;
          }
          v25 = v42;
          break;
        }
      }
      v8 = v25;
      break;
    }
  }
  bool v52 = true;
  int v53 = simt_wave_count_bits(v52);
  int v54 = 0;
  int v55 = v54 + v0;
  v1[v55] = v53;
  return;
}

kernel void kernel_main(device int* v56 [[buffer(0)]], device int* v57 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v58 = static_cast<int>(__simt_tid3.x);
  int v59 = 0;
  int v60 = v59 + v58;
  int v61 = v57[v60];
  int v62 = 4;
  int v63 = v62 + v58;
  int v64 = v57[v63];
  int v65 = 0;
  bool v66 = v61 != v65;
  if (v66) {
  } else {
    int v67 = 8;
    int v68 = v67 + v58;
    int v69 = v57[v68];
    int v70 = 0;
    bool v71 = v69 != v70;
    if (v71) {
    } else {
      int v72 = 3;
      int v73 = v58 % v72;
      uint v74 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v75 = (int)(v74);
      int v76;
      v76 = v75;
      switch (v73) {
        case 0:
          {
          int v77 = 4;
          int v78 = v76 + v77;
          v76 = v78;
          break;
        }
        default:
          {
          int v79 = 1;
          int v80 = v76 + v79;
          v76 = v80;
          break;
        }
        case 1:
          {
          int v81 = 2;
          int v82 = v76 + v81;
          v76 = v82;
          break;
        }
        case 2:
          {
          int v83 = 4;
          int v84 = v76 + v83;
          v76 = v84;
          break;
        }
      }
      helper0(v58, v56, v61, v64, static_cast<int>(__simt_tid3.x));
    }
  }
  int v85 = 12;
  int v86 = v85 + v58;
  int v87 = v57[v86];
  int v88 = 0;
  bool v89 = v87 != v88;
  int v90;
  if (v89) {
    int v91 = 16;
    int v92 = v91 + v58;
    int v93 = v57[v92];
    int v94 = 4;
    int v95 = v58 + v94;
    int v96;
    v96 = v95;
    switch (v93) {
      default:
        {
        int v97 = 0;
        int v98 = 0;
        int v99;
        int v100;
        v99 = v97;
        v100 = v98;
        while (true) {
          int v101 = 4;
          int v102 = v100 * v101;
          int v103 = v102 + v58;
          int v104 = 20;
          int v105 = v104 + v103;
          int v106 = v57[v105];
          int v107 = 0;
          bool v108 = v106 != v107;
          v99 = v99;
          v100 = v100;
          if (!v108) break;
          int v109 = v99 + v100;
          int v110 = 1;
          int v111 = v100 + v110;
          bool v112 = true;
          v99 = v109;
          v100 = v111;
          break;
          ;
        }
        v96 = v99;
        break;
      }
      case 0:
        {
        int v113 = 40;
        int v114 = v113 + v58;
        int v115 = v57[v114];
        int v116 = 0;
        bool v117 = v115 != v116;
        int v118;
        if (v117) {
          int v119 = 2;
          v118 = v119;
        } else {
          int v120 = 0;
          int v121 = v58 + v120;
          v118 = v121;
        }
        v96 = v118;
        break;
      }
      case 1:
        {
        int v122 = 44;
        int v123 = v122 + v58;
        int v124 = v57[v123];
        int v125;
        v125 = v58;
        switch (v124) {
          default:
            {
            int v126 = 0;
            v125 = v126;
            break;
          }
          case 0:
            {
            int v127 = 4;
            v125 = v127;
            break;
          }
          case 1:
            {
            v125 = v58;
            break;
          }
          case 2:
            {
            v125 = v58;
            break;
          }
        }
        v96 = v125;
        break;
      }
      case 2:
        {
        int v128 = 48;
        int v129 = v128 + v58;
        int v130 = v57[v129];
        int v131;
        v131 = v58;
        switch (v130) {
          default:
            {
            int v132 = 1;
            v131 = v132;
            break;
          }
          case 0:
            {
            int v133 = 4;
            v131 = v133;
          }
          case 1:
            {
            v131 = v58;
            break;
          }
        }
        v96 = v131;
        break;
      }
    }
    bool v134 = true;
    int v135 = 16;
    int v136 = v135 + v58;
    bool v137 = true;
    int v138 = simt_wave_count_bits(v137);
    v56[v136] = v138;
    v90 = v96;
  } else {
    int v139 = 52;
    int v140 = v139 + v58;
    int v141 = v57[v140];
    int v142 = 0;
    bool v143 = v141 != v142;
    int v144;
    if (v143) {
      int v145 = 0;
      int v146 = 0;
      int v147;
      int v148;
      v147 = v145;
      v148 = v146;
      while (true) {
        int v149 = 4;
        int v150 = v148 * v149;
        int v151 = v150 + v58;
        int v152 = 56;
        int v153 = v152 + v151;
        int v154 = v57[v153];
        int v155 = 0;
        bool v156 = v154 != v155;
        v147 = v147;
        v148 = v148;
        if (!v156) break;
        int v157 = v147 + v148;
        int v158 = 1;
        int v159 = v148 + v158;
        bool v160 = true;
        int v161 = 32;
        int v162 = 4;
        int v163 = v148 * v162;
        int v164 = v161 + v163;
        int v165 = v164 + v58;
        bool v166 = true;
        int v167 = simt_wave_count_bits(v166);
        v56[v165] = v167;
        v147 = v157;
        v148 = v159;
      }
      v144 = v147;
    } else {
      int v168 = 76;
      int v169 = v168 + v58;
      int v170 = v57[v169];
      int v171 = 1;
      int v172 = v58 + v171;
      int v173;
      v173 = v172;
      switch (v170) {
        default:
          {
          v173 = v58;
          break;
        }
        case 0:
          {
          int v174 = 0;
          v173 = v174;
          break;
        }
        case 1:
          {
          int v175 = 1;
          int v176 = v58 + v175;
          v173 = v176;
          break;
        }
      }
      v144 = v173;
    }
    int v177 = 48;
    int v178 = v177 + v58;
    bool v179 = true;
    int v180 = simt_wave_count_bits(v179);
    v56[v178] = v180;
    v90 = v144;
  }
  int v181 = 64;
  int v182 = v181 + v58;
  bool v183 = true;
  int v184 = simt_wave_count_bits(v183);
  v56[v182] = v184;
  int v185 = 0;
  int v186 = 0;
  int v187;
  int v188;
  v187 = v185;
  v188 = v186;
  while (true) {
    int v189 = 4;
    int v190 = v188 * v189;
    int v191 = v190 + v58;
    int v192 = 80;
    int v193 = v192 + v191;
    int v194 = v57[v193];
    int v195 = 0;
    bool v196 = v194 != v195;
    v187 = v187;
    v188 = v188;
    if (!v196) break;
    int v197 = 100;
    int v198 = v197 + v58;
    int v199 = v57[v198];
    int v200;
    v200 = v58;
    switch (v199) {
      case 0:
        {
        int v201 = 104;
        int v202 = v201 + v58;
        int v203 = v57[v202];
        int v204 = 0;
        bool v205 = v203 != v204;
        int v206;
        if (v205) {
          int v207 = 4;
          v206 = v207;
        } else {
          v206 = v58;
        }
        v200 = v206;
      }
      default:
        {
        v200 = v58;
      }
      case 1:
        {
        int v208 = 0;
        v200 = v208;
        break;
      }
    }
    int v209 = v187 + v200;
    int v210 = 1;
    int v211 = v188 + v210;
    bool v212 = true;
    int v213 = 80;
    int v214 = 4;
    int v215 = v188 * v214;
    int v216 = v213 + v215;
    int v217 = v216 + v58;
    bool v218 = true;
    int v219 = simt_wave_count_bits(v218);
    v56[v217] = v219;
    v187 = v209;
    v188 = v211;
  }
  int v220 = 108;
  int v221 = v220 + v58;
  int v222 = v57[v221];
  uint v223 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v224 = (int)(v223);
  int v225;
  v225 = v224;
  switch (v222) {
    case 0:
      {
      int v226 = 112;
      int v227 = v226 + v58;
      int v228 = v57[v227];
      int v229 = 0;
      bool v230 = v228 != v229;
      int v231;
      if (v230) {
        v231 = v58;
      } else {
        int v232 = 0;
        int v233 = 0;
        int v234;
        int v235;
        v234 = v232;
        v235 = v233;
        while (true) {
          int v236 = 4;
          int v237 = v235 * v236;
          int v238 = v237 + v58;
          int v239 = 116;
          int v240 = v239 + v238;
          int v241 = v57[v240];
          int v242 = 0;
          bool v243 = v241 != v242;
          v234 = v234;
          v235 = v235;
          if (!v243) break;
          int v244 = v234 + v235;
          int v245 = 1;
          int v246 = v235 + v245;
          bool v247 = true;
          v234 = v244;
          v235 = v246;
          break;
          ;
        }
        v231 = v234;
      }
      v225 = v231;
    }
    default:
      {
      int v248 = 0;
      int v249 = 0;
      int v250;
      int v251;
      v250 = v248;
      v251 = v249;
      while (true) {
        int v252 = 4;
        int v253 = v251 * v252;
        int v254 = v253 + v58;
        int v255 = 136;
        int v256 = v255 + v254;
        int v257 = v57[v256];
        int v258 = 0;
        bool v259 = v257 != v258;
        v250 = v250;
        v251 = v251;
        if (!v259) break;
        int v260 = v250 + v251;
        int v261 = 1;
        int v262 = v251 + v261;
        bool v263 = true;
        v250 = v260;
        v251 = v262;
        continue;
        ;
      }
      v225 = v250;
      break;
    }
    case 1:
      {
      int v264 = 156;
      int v265 = v264 + v58;
      int v266 = v57[v265];
      int v267;
      v267 = v58;
      switch (v266) {
        case 0:
          {
          int v268 = 160;
          int v269 = v268 + v58;
          int v270 = v57[v269];
          int v271 = 0;
          bool v272 = v270 != v271;
          int v273;
          if (v272) {
            v273 = v58;
          } else {
            int v274 = 2;
            v273 = v274;
          }
          v267 = v273;
          break;
        }
        default:
          {
          int v275 = 164;
          int v276 = v275 + v58;
          int v277 = v57[v276];
          int v278 = 0;
          bool v279 = v277 != v278;
          int v280;
          if (v279) {
            int v281 = 4;
            v280 = v281;
          } else {
            int v282 = 1;
            int v283 = v58 + v282;
            v280 = v283;
          }
          v267 = v280;
          break;
        }
      }
      v225 = v267;
    }
    case 2:
      {
      int v284 = 0;
      int v285 = 0;
      int v286;
      int v287;
      v286 = v284;
      v287 = v285;
      while (true) {
        int v288 = 4;
        int v289 = v287 * v288;
        int v290 = v289 + v58;
        int v291 = 168;
        int v292 = v291 + v290;
        int v293 = v57[v292];
        int v294 = 0;
        bool v295 = v293 != v294;
        v286 = v286;
        v287 = v287;
        if (!v295) break;
        int v296 = v286 + v287;
        int v297 = 1;
        int v298 = v287 + v297;
        bool v299 = true;
        v286 = v296;
        v287 = v298;
        break;
        ;
      }
      v225 = v286;
      break;
    }
  }
  bool v300 = true;
  int v301 = 96;
  int v302 = v301 + v58;
  bool v303 = true;
  int v304 = simt_wave_count_bits(v303);
  v56[v302] = v304;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 100; ++idx) {
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
