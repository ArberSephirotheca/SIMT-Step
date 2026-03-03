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
  int v5 = 4;
  int v6 = v3 % v5;
  uint v7 = simt_subgroup_id(__simt_tid);
  int v8 = (int)(v7);
  int v9;
  v9 = v8;
  switch (v6) {
    default:
      {
      int v10 = 0;
      int v11 = 0;
      int v12;
      int v13;
      v12 = v10;
      v13 = v11;
      while (true) {
        int v14 = 4;
        int v15 = v3 % v14;
        int v16 = 1;
        int v17 = v15 + v16;
        bool v18 = v13 < v17;
        v12 = v12;
        v13 = v13;
        if (!v18) break;
        int v19 = 0;
        int v20 = 0;
        int v21;
        int v22;
        v21 = v19;
        v22 = v20;
        while (true) {
          int v23 = 4;
          int v24 = v3 % v23;
          int v25 = 1;
          int v26 = v24 + v25;
          bool v27 = v22 < v26;
          v21 = v21;
          v22 = v22;
          if (!v27) break;
          int v28 = 1;
          int v29 = v22 + v28;
          v21 = v0;
          v22 = v29;
        }
        int v30 = 1;
        int v31 = v13 + v30;
        v12 = v21;
        v13 = v31;
        continue;
        ;
      }
      int v32 = 4;
      int v33 = v0 + v32;
      v9 = v12;
    }
    case 0:
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
        int v43 = 0;
        bool v44 = v2 != v43;
        int v45;
        if (v44) {
          int v46 = 4;
          int v47 = v0 + v46;
          v45 = v47;
        } else {
          int v48 = 3;
          int v49 = v0 + v48;
          v45 = v49;
        }
        int v50 = 4;
        int v51 = 1;
        int v52 = v37 + v51;
        v36 = v45;
        v37 = v52;
      }
      v9 = v36;
      break;
    }
    case 1:
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
        int v63 = 0;
        int v64;
        int v65;
        v64 = v62;
        v65 = v63;
        while (true) {
          int v66 = 4;
          int v67 = v3 % v66;
          int v68 = 1;
          int v69 = v67 + v68;
          bool v70 = v65 < v69;
          v64 = v64;
          v65 = v65;
          if (!v70) break;
          int v71 = 1;
          int v72 = v65 + v71;
          v64 = v0;
          v65 = v72;
          continue;
          ;
        }
        int v73 = 2;
        int v74 = v0 + v73;
        int v75 = 1;
        int v76 = v56 + v75;
        v55 = v64;
        v56 = v76;
      }
      int v77 = 0;
      v9 = v55;
    }
    case 2:
      {
      int v78 = 4;
      int v79 = v3 % v78;
      int v80 = 3;
      int v81 = v0 + v80;
      int v82;
      v82 = v81;
      switch (v79) {
        case 0:
          {
          int v83 = 0;
          bool v84 = v2 != v83;
          int v85;
          if (v84) {
            int v86 = 1;
            v85 = v86;
          } else {
            int v87 = 0;
            int v88 = v0 + v87;
            v85 = v88;
          }
          v82 = v85;
          break;
        }
        case 1:
          {
          int v89 = 4;
          int v90 = v0 + v89;
          v82 = v90;
          break;
        }
        default:
          {
          int v91 = 4;
          int v92 = v0 + v91;
          v82 = v92;
          break;
        }
        case 2:
          {
          v82 = v0;
          break;
        }
      }
      v9 = v82;
      break;
    }
  }
  bool v93 = true;
  int v94 = simt_wave_count_bits(v93);
  int v95 = 0;
  int v96 = v95 + v0;
  v1[v96] = v94;
  int v97 = 0;
  bool v98 = v2 != v97;
  int v99 = v98 ? v4 : v9;
  return;
}

kernel void kernel_main(device int* v100 [[buffer(0)]], device int* v101 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v102 = static_cast<int>(__simt_tid3.x);
  int v103 = 0;
  int v104 = v103 + v102;
  int v105 = v101[v104];
  int v106 = 4;
  int v107 = v106 + v102;
  int v108 = v101[v107];
  helper0(v102, v100, v105, v108, static_cast<int>(__simt_tid3.x));
  int v109 = 8;
  int v110 = v109 + v102;
  int v111 = v101[v110];
  int v112 = 0;
  bool v113 = v111 != v112;
  int v114;
  if (v113) {
    int v115 = 0;
    int v116 = 0;
    int v117;
    int v118;
    v117 = v115;
    v118 = v116;
    while (true) {
      int v119 = 4;
      int v120 = v118 * v119;
      int v121 = v120 + v102;
      int v122 = 12;
      int v123 = v122 + v121;
      int v124 = v101[v123];
      int v125 = 0;
      bool v126 = v124 != v125;
      v117 = v117;
      v118 = v118;
      if (!v126) break;
      int v127 = 32;
      int v128 = v127 + v102;
      int v129 = v101[v128];
      int v130 = 0;
      bool v131 = v129 != v130;
      int v132;
      if (v131) {
        v132 = v102;
      } else {
        int v133 = 4;
        v132 = v133;
      }
      int v134 = v117 + v132;
      int v135 = 1;
      int v136 = v118 + v135;
      v117 = v134;
      v118 = v136;
    }
    bool v137 = true;
    v114 = v117;
  } else {
    int v138 = 0;
    int v139 = 0;
    int v140;
    int v141;
    v140 = v138;
    v141 = v139;
    while (true) {
      int v142 = 4;
      int v143 = v141 * v142;
      int v144 = v143 + v102;
      int v145 = 36;
      int v146 = v145 + v144;
      int v147 = v101[v146];
      int v148 = 0;
      bool v149 = v147 != v148;
      v140 = v140;
      v141 = v141;
      if (!v149) break;
      int v150 = v140 + v141;
      int v151 = 1;
      int v152 = v141 + v151;
      v140 = v150;
      v141 = v152;
      break;
      ;
    }
    bool v153 = true;
    v114 = v140;
  }
  int v154 = 16;
  int v155 = v154 + v102;
  bool v156 = true;
  int v157 = simt_wave_count_bits(v156);
  v100[v155] = v157;
  int v158 = 56;
  int v159 = v158 + v102;
  int v160 = v101[v159];
  int v161 = 0;
  bool v162 = v160 != v161;
  int v163;
  if (v162) {
    int v164 = 60;
    int v165 = v164 + v102;
    int v166 = v101[v165];
    int v167 = 0;
    bool v168 = v166 != v167;
    int v169;
    if (v168) {
      int v170 = 64;
      int v171 = v170 + v102;
      int v172 = v101[v171];
      int v173 = 0;
      bool v174 = v172 != v173;
      int v175;
      if (v174) {
        uint v176 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v177 = (int)(v176);
        v175 = v177;
      } else {
        uint v178 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v179 = (int)(v178);
        v175 = v179;
      }
      v169 = v175;
    } else {
      int v180 = 2;
      int v181 = v102 + v180;
      v169 = v181;
    }
    v163 = v169;
  } else {
    int v182 = 68;
    int v183 = v182 + v102;
    int v184 = v101[v183];
    int v185 = 0;
    bool v186 = v184 != v185;
    int v187;
    if (v186) {
      int v188 = 72;
      int v189 = v188 + v102;
      int v190 = v101[v189];
      int v191 = 0;
      bool v192 = v190 != v191;
      int v193;
      if (v192) {
        int v194 = 3;
        int v195 = v102 + v194;
        v193 = v195;
      } else {
        int v196 = 3;
        int v197 = v102 + v196;
        v193 = v197;
      }
      v187 = v193;
    } else {
      uint v198 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v199 = (int)(v198);
      v187 = v199;
    }
    v163 = v187;
  }
  int v200 = 32;
  int v201 = v200 + v102;
  bool v202 = true;
  int v203 = simt_wave_count_bits(v202);
  v100[v201] = v203;
  int v204 = 76;
  int v205 = v204 + v102;
  int v206 = v101[v205];
  int v207;
  v207 = v102;
  switch (v206) {
    case 0:
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
        int v214 = v213 + v102;
        int v215 = 80;
        int v216 = v215 + v214;
        int v217 = v101[v216];
        int v218 = 0;
        bool v219 = v217 != v218;
        v210 = v210;
        v211 = v211;
        if (!v219) break;
        int v220 = 0;
        int v221 = 0;
        int v222;
        int v223;
        v222 = v220;
        v223 = v221;
        while (true) {
          int v224 = 4;
          int v225 = v223 * v224;
          int v226 = v225 + v102;
          int v227 = 100;
          int v228 = v227 + v226;
          int v229 = v101[v228];
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
        int v236 = v210 + v222;
        int v237 = 1;
        int v238 = v211 + v237;
        v210 = v236;
        v211 = v238;
      }
      bool v239 = true;
      v207 = v210;
    }
    default:
      {
      int v240 = 0;
      int v241 = 0;
      int v242;
      int v243;
      v242 = v240;
      v243 = v241;
      while (true) {
        int v244 = 4;
        int v245 = v243 * v244;
        int v246 = v245 + v102;
        int v247 = 120;
        int v248 = v247 + v246;
        int v249 = v101[v248];
        int v250 = 0;
        bool v251 = v249 != v250;
        v242 = v242;
        v243 = v243;
        if (!v251) break;
        int v252 = 140;
        int v253 = v252 + v102;
        int v254 = v101[v253];
        int v255 = 0;
        int v256;
        v256 = v255;
        switch (v254) {
          default:
            {
            v256 = v102;
          }
          case 0:
            {
            int v257 = 1;
            v256 = v257;
          }
          case 1:
            {
            v256 = v102;
            break;
          }
        }
        bool v258 = true;
        int v259 = v242 + v256;
        int v260 = 1;
        int v261 = v243 + v260;
        v242 = v259;
        v243 = v261;
        break;
        ;
      }
      bool v262 = true;
      v207 = v242;
      break;
    }
    case 1:
      {
      int v263 = 144;
      int v264 = v263 + v102;
      int v265 = v101[v264];
      int v266 = 0;
      bool v267 = v265 != v266;
      int v268;
      if (v267) {
        int v269 = 0;
        int v270 = 0;
        int v271;
        int v272;
        v271 = v269;
        v272 = v270;
        while (true) {
          int v273 = 4;
          int v274 = v272 * v273;
          int v275 = v274 + v102;
          int v276 = 148;
          int v277 = v276 + v275;
          int v278 = v101[v277];
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
        v268 = v271;
      } else {
        int v285 = 168;
        int v286 = v285 + v102;
        int v287 = v101[v286];
        int v288 = 0;
        bool v289 = v287 != v288;
        int v290;
        if (v289) {
          v290 = v102;
        } else {
          int v291 = 2;
          int v292 = v102 + v291;
          v290 = v292;
        }
        v268 = v290;
      }
      v207 = v268;
      break;
    }
  }
  bool v293 = true;
  int v294 = 48;
  int v295 = v294 + v102;
  bool v296 = true;
  int v297 = simt_wave_count_bits(v296);
  v100[v295] = v297;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 172; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
