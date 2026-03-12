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
  int v4 = 1;
  int v5 = v0 + v4;
  int v6 = 0;
  int v7 = 0;
  int v8;
  int v9;
  v8 = v6;
  v9 = v7;
  while (true) {
    int v10 = 4;
    int v11 = v3 % v10;
    int v12 = 1;
    int v13 = v11 + v12;
    bool v14 = v9 < v13;
    v8 = v8;
    v9 = v9;
    if (!v14) break;
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
      int v24 = 2;
      int v25 = v0 + v24;
      int v26 = 1;
      int v27 = v18 + v26;
      v17 = v25;
      v18 = v27;
      continue;
      ;
    }
    int v28 = 1;
    int v29 = v9 + v28;
    v8 = v17;
    v9 = v29;
  }
  bool v30 = true;
  int v31 = simt_wave_count_bits(v30);
  int v32 = 0;
  int v33 = v32 + v0;
  v1[v33] = v31;
  int v34 = 0;
  bool v35 = v2 != v34;
  int v36 = v35 ? v5 : v8;
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
    int v46 = 3;
    int v47 = v3 % v46;
    int v48;
    v48 = v0;
    switch (v47) {
      case 0:
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
          int v59 = v0 + v58;
          int v60 = 1;
          int v61 = v52 + v60;
          v51 = v59;
          v52 = v61;
        }
        int v62 = 3;
        int v63 = v0 + v62;
        v48 = v51;
        break;
      }
      default:
        {
        int v64 = 3;
        int v65 = v3 % v64;
        int v66 = 0;
        int v67;
        v67 = v66;
        switch (v65) {
          default:
            {
            int v68 = 0;
            int v69 = v0 + v68;
            v67 = v69;
          }
          case 0:
            {
            v67 = v0;
          }
          case 1:
            {
            v67 = v0;
            break;
          }
          case 2:
            {
            v67 = v0;
            break;
          }
        }
        int v70 = 1;
        v48 = v67;
        break;
      }
      case 1:
        {
        int v71;
        v71 = v0;
        switch (v3) {
          default:
            {
            v71 = v0;
            break;
          }
          case 0:
            {
            v71 = v0;
            break;
          }
        }
        int v72 = 1;
        int v73 = v0 + v72;
        v48 = v71;
        break;
      }
    }
    uint v74 = simt_lane_id(__simt_tid);
    int v75 = (int)(v74);
    int v76 = 1;
    int v77 = v40 + v76;
    v39 = v48;
    v40 = v77;
    continue;
    ;
  }
  bool v78 = true;
  int v79 = simt_wave_count_bits(v78);
  int v80 = 16;
  int v81 = v80 + v0;
  v1[v81] = v79;
  int v82 = 0;
  bool v83 = v2 != v82;
  int v84 = v83 ? v36 : v39;
  return;
}

kernel void kernel_main(device int* v85 [[buffer(0)]], device int* v86 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v87 = static_cast<int>(__simt_tid3.x);
  int v88 = 0;
  int v89 = v88 + v87;
  int v90 = v86[v89];
  int v91 = 4;
  int v92 = v91 + v87;
  int v93 = v86[v92];
  helper0(v87, v85, v90, v93, static_cast<int>(__simt_tid3.x));
  int v94 = 8;
  int v95 = v94 + v87;
  int v96 = v86[v95];
  int v97 = 0;
  int v98 = v87 + v97;
  int v99;
  v99 = v98;
  switch (v96) {
    case 0:
      {
      int v100 = 12;
      int v101 = v100 + v87;
      int v102 = v86[v101];
      int v103;
      v103 = v87;
      switch (v102) {
        case 0:
          {
          int v104 = 4;
          int v105 = v87 + v104;
          v103 = v105;
        }
        default:
          {
          int v106 = 1;
          v103 = v106;
          break;
        }
      }
      bool v107 = true;
      v99 = v103;
      break;
    }
    default:
      {
      int v108 = 16;
      int v109 = v108 + v87;
      int v110 = v86[v109];
      int v111 = 0;
      bool v112 = v110 != v111;
      int v113;
      if (v112) {
        int v114 = 0;
        int v115 = 0;
        int v116;
        int v117;
        v116 = v114;
        v117 = v115;
        while (true) {
          int v118 = 4;
          int v119 = v117 * v118;
          int v120 = v119 + v87;
          int v121 = 20;
          int v122 = v121 + v120;
          int v123 = v86[v122];
          int v124 = 0;
          bool v125 = v123 != v124;
          v116 = v116;
          v117 = v117;
          if (!v125) break;
          int v126 = v116 + v117;
          int v127 = 1;
          int v128 = v117 + v127;
          v116 = v126;
          v117 = v128;
        }
        bool v129 = true;
        v113 = v116;
      } else {
        int v130 = 0;
        v113 = v130;
      }
      v99 = v113;
      break;
    }
    case 1:
      {
      int v131 = 0;
      int v132 = 0;
      int v133;
      int v134;
      v133 = v131;
      v134 = v132;
      while (true) {
        int v135 = 4;
        int v136 = v134 * v135;
        int v137 = v136 + v87;
        int v138 = 40;
        int v139 = v138 + v137;
        int v140 = v86[v139];
        int v141 = 0;
        bool v142 = v140 != v141;
        v133 = v133;
        v134 = v134;
        if (!v142) break;
        int v143 = v133 + v134;
        int v144 = 1;
        int v145 = v134 + v144;
        v133 = v143;
        v134 = v145;
        continue;
        ;
      }
      bool v146 = true;
      v99 = v133;
      break;
    }
  }
  bool v147 = true;
  int v148 = 32;
  int v149 = v148 + v87;
  bool v150 = true;
  int v151 = simt_wave_count_bits(v150);
  v85[v149] = v151;
  int v152 = 60;
  int v153 = v152 + v87;
  int v154 = v86[v153];
  int v155 = 0;
  int v156 = v87 + v155;
  int v157;
  v157 = v156;
  switch (v154) {
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
        int v164 = v163 + v87;
        int v165 = 64;
        int v166 = v165 + v164;
        int v167 = v86[v166];
        int v168 = 0;
        bool v169 = v167 != v168;
        v160 = v160;
        v161 = v161;
        if (!v169) break;
        int v170 = 84;
        int v171 = v170 + v87;
        int v172 = v86[v171];
        int v173 = 0;
        bool v174 = v172 != v173;
        int v175;
        if (v174) {
          v175 = v87;
        } else {
          int v176 = 2;
          int v177 = v87 + v176;
          v175 = v177;
        }
        int v178 = v160 + v175;
        int v179 = 1;
        int v180 = v161 + v179;
        v160 = v178;
        v161 = v180;
      }
      bool v181 = true;
      v157 = v160;
      break;
    }
    case 0:
      {
      int v182 = 0;
      int v183 = 0;
      int v184;
      int v185;
      v184 = v182;
      v185 = v183;
      while (true) {
        int v186 = 4;
        int v187 = v185 * v186;
        int v188 = v187 + v87;
        int v189 = 88;
        int v190 = v189 + v188;
        int v191 = v86[v190];
        int v192 = 0;
        bool v193 = v191 != v192;
        v184 = v184;
        v185 = v185;
        if (!v193) break;
        int v194 = v184 + v87;
        int v195 = 1;
        int v196 = v185 + v195;
        v184 = v194;
        v185 = v196;
      }
      bool v197 = true;
      v157 = v184;
      break;
    }
    case 1:
      {
      int v198 = 1;
      int v199 = v87 + v198;
      v157 = v199;
      break;
    }
    case 2:
      {
      int v200 = 0;
      v157 = v200;
      break;
    }
  }
  bool v201 = true;
  int v202 = 48;
  int v203 = v202 + v87;
  bool v204 = true;
  int v205 = simt_wave_count_bits(v204);
  v85[v203] = v205;
  int v206 = 108;
  int v207 = v206 + v87;
  int v208 = v86[v207];
  uint v209 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v210 = (int)(v209);
  int v211;
  v211 = v210;
  switch (v208) {
    case 0:
      {
      int v212 = 112;
      int v213 = v212 + v87;
      int v214 = v86[v213];
      int v215;
      v215 = v87;
      switch (v214) {
        default:
          {
          int v216 = 3;
          int v217 = v87 + v216;
          v215 = v217;
          break;
        }
        case 0:
          {
          int v218 = 116;
          int v219 = v218 + v87;
          int v220 = v86[v219];
          int v221 = 0;
          bool v222 = v220 != v221;
          int v223;
          if (v222) {
            int v224 = 1;
            v223 = v224;
          } else {
            int v225 = 3;
            int v226 = v87 + v225;
            v223 = v226;
          }
          v215 = v223;
          break;
        }
        case 1:
          {
          int v227 = 120;
          int v228 = v227 + v87;
          int v229 = v86[v228];
          int v230 = 0;
          bool v231 = v229 != v230;
          int v232;
          if (v231) {
            int v233 = 3;
            int v234 = v87 + v233;
            v232 = v234;
          } else {
            int v235 = 0;
            v232 = v235;
          }
          v215 = v232;
          break;
        }
        case 2:
          {
          int v236 = 0;
          int v237 = 0;
          int v238;
          int v239;
          v238 = v236;
          v239 = v237;
          while (true) {
            int v240 = 4;
            int v241 = v239 * v240;
            int v242 = v241 + v87;
            int v243 = 124;
            int v244 = v243 + v242;
            int v245 = v86[v244];
            int v246 = 0;
            bool v247 = v245 != v246;
            v238 = v238;
            v239 = v239;
            if (!v247) break;
            int v248 = v238 + v239;
            int v249 = 1;
            int v250 = v239 + v249;
            v238 = v248;
            v239 = v250;
          }
          bool v251 = true;
          v215 = v238;
          break;
        }
      }
      bool v252 = true;
      v211 = v215;
      break;
    }
    case 1:
      {
      int v253 = 0;
      int v254 = 0;
      int v255;
      int v256;
      v255 = v253;
      v256 = v254;
      while (true) {
        int v257 = 4;
        int v258 = v256 * v257;
        int v259 = v258 + v87;
        int v260 = 144;
        int v261 = v260 + v259;
        int v262 = v86[v261];
        int v263 = 0;
        bool v264 = v262 != v263;
        v255 = v255;
        v256 = v256;
        if (!v264) break;
        int v265 = 164;
        int v266 = v265 + v87;
        int v267 = v86[v266];
        int v268;
        v268 = v87;
        switch (v267) {
          default:
            {
            int v269 = 1;
            v268 = v269;
            break;
          }
          case 0:
            {
            int v270 = 2;
            int v271 = v87 + v270;
            v268 = v271;
            break;
          }
          case 1:
            {
            int v272 = 2;
            int v273 = v87 + v272;
            v268 = v273;
            break;
          }
        }
        bool v274 = true;
        int v275 = v255 + v268;
        int v276 = 1;
        int v277 = v256 + v276;
        v255 = v275;
        v256 = v277;
      }
      bool v278 = true;
      v211 = v255;
      break;
    }
    case 2:
      {
      int v279 = 168;
      int v280 = v279 + v87;
      int v281 = v86[v280];
      int v282 = 0;
      bool v283 = v281 != v282;
      int v284;
      if (v283) {
        int v285 = 0;
        int v286 = 0;
        int v287;
        int v288;
        v287 = v285;
        v288 = v286;
        while (true) {
          int v289 = 4;
          int v290 = v288 * v289;
          int v291 = v290 + v87;
          int v292 = 172;
          int v293 = v292 + v291;
          int v294 = v86[v293];
          int v295 = 0;
          bool v296 = v294 != v295;
          v287 = v287;
          v288 = v288;
          if (!v296) break;
          int v297 = v287 + v288;
          int v298 = 1;
          int v299 = v288 + v298;
          v287 = v297;
          v288 = v299;
        }
        bool v300 = true;
        v284 = v287;
      } else {
        v284 = v87;
      }
      v211 = v284;
      break;
    }
    default:
      {
      int v301 = 3;
      int v302 = v87 + v301;
      v211 = v302;
      break;
    }
  }
  bool v303 = true;
  int v304 = 64;
  int v305 = v304 + v87;
  bool v306 = true;
  int v307 = simt_wave_count_bits(v306);
  v85[v305] = v307;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 192; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
