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
      int v16 = 0;
      bool v17 = v2 != v16;
      int v18;
      if (v17) {
        uint v19 = simt_subgroup_id(__simt_tid);
        int v20 = (int)(v19);
        v18 = v20;
      } else {
        uint v21 = simt_subgroup_id(__simt_tid);
        int v22 = (int)(v21);
        v18 = v22;
      }
      int v23 = 4;
      int v24 = 1;
      int v25 = v10 + v24;
      v9 = v18;
      v10 = v25;
    }
    int v26 = 3;
    v6 = v9;
  } else {
    int v27 = 0;
    bool v28 = v2 != v27;
    int v29;
    if (v28) {
      uint v30 = simt_subgroup_id(__simt_tid);
      int v31 = (int)(v30);
      int v32;
      v32 = v31;
      switch (v3) {
        default:
          {
          v32 = v0;
        }
        case 0:
          {
          int v33 = 4;
          v32 = v33;
          break;
        }
      }
      v29 = v32;
    } else {
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
        uint v43 = simt_lane_id(__simt_tid);
        int v44 = (int)(v43);
        int v45 = 1;
        int v46 = v37 + v45;
        v36 = v44;
        v37 = v46;
      }
      uint v47 = simt_lane_id(__simt_tid);
      int v48 = (int)(v47);
      v29 = v36;
    }
    int v49 = 4;
    v6 = v29;
  }
  bool v50 = true;
  int v51 = simt_wave_count_bits(v50);
  int v52 = 0;
  int v53 = v52 + v0;
  v1[v53] = v51;
  return;
}

kernel void kernel_main(device int* v54 [[buffer(0)]], device int* v55 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v56 = static_cast<int>(__simt_tid3.x);
  int v57 = 0;
  int v58 = v57 + v56;
  int v59 = v55[v58];
  int v60 = 4;
  int v61 = v60 + v56;
  int v62 = v55[v61];
  helper0(v56, v54, v59, v62, static_cast<int>(__simt_tid3.x));
  int v63 = 8;
  int v64 = v63 + v56;
  int v65 = v55[v64];
  int v66 = 3;
  int v67;
  v67 = v66;
  switch (v65) {
    case 0:
      {
      int v68 = 0;
      int v69 = 0;
      int v70;
      int v71;
      v70 = v68;
      v71 = v69;
      while (true) {
        int v72 = 4;
        int v73 = v71 * v72;
        int v74 = v73 + v56;
        int v75 = 12;
        int v76 = v75 + v74;
        int v77 = v55[v76];
        int v78 = 0;
        bool v79 = v77 != v78;
        v70 = v70;
        v71 = v71;
        if (!v79) break;
        int v80 = 32;
        int v81 = v80 + v56;
        int v82 = v55[v81];
        int v83 = 4;
        int v84;
        v84 = v83;
        switch (v82) {
          default:
            {
            int v85 = 1;
            v84 = v85;
            break;
          }
          case 0:
            {
            int v86 = 1;
            v84 = v86;
          }
          case 1:
            {
            v84 = v56;
            break;
          }
          case 2:
            {
            int v87 = 1;
            int v88 = v56 + v87;
            v84 = v88;
            break;
          }
        }
        bool v89 = true;
        int v90 = v70 + v84;
        int v91 = 1;
        int v92 = v71 + v91;
        v70 = v90;
        v71 = v92;
      }
      bool v93 = true;
      v67 = v70;
      break;
    }
    default:
      {
      int v94 = 0;
      int v95 = 0;
      int v96;
      int v97;
      v96 = v94;
      v97 = v95;
      while (true) {
        int v98 = 4;
        int v99 = v97 * v98;
        int v100 = v99 + v56;
        int v101 = 36;
        int v102 = v101 + v100;
        int v103 = v55[v102];
        int v104 = 0;
        bool v105 = v103 != v104;
        v96 = v96;
        v97 = v97;
        if (!v105) break;
        int v106 = 56;
        int v107 = v106 + v56;
        int v108 = v55[v107];
        int v109;
        v109 = v56;
        switch (v108) {
          case 0:
            {
            int v110 = 1;
            int v111 = v56 + v110;
            v109 = v111;
            break;
          }
          case 1:
            {
            int v112 = 0;
            int v113 = v56 + v112;
            v109 = v113;
            break;
          }
          case 2:
            {
            int v114 = 2;
            v109 = v114;
            break;
          }
          default:
            {
            v109 = v56;
            break;
          }
        }
        bool v115 = true;
        int v116 = v96 + v109;
        int v117 = 1;
        int v118 = v97 + v117;
        v96 = v116;
        v97 = v118;
      }
      bool v119 = true;
      v67 = v96;
      break;
    }
    case 1:
      {
      int v120 = 60;
      int v121 = v120 + v56;
      int v122 = v55[v121];
      int v123 = 0;
      bool v124 = v122 != v123;
      int v125;
      if (v124) {
        int v126 = 0;
        v125 = v126;
      } else {
        int v127 = 64;
        int v128 = v127 + v56;
        int v129 = v55[v128];
        int v130 = 0;
        bool v131 = v129 != v130;
        int v132;
        if (v131) {
          v132 = v56;
        } else {
          int v133 = 0;
          v132 = v133;
        }
        v125 = v132;
      }
      v67 = v125;
      break;
    }
    case 2:
      {
      int v134 = 68;
      int v135 = v134 + v56;
      int v136 = v55[v135];
      int v137 = 2;
      int v138;
      v138 = v137;
      switch (v136) {
        case 0:
          {
          int v139 = 0;
          int v140 = 0;
          int v141;
          int v142;
          v141 = v139;
          v142 = v140;
          while (true) {
            int v143 = 4;
            int v144 = v142 * v143;
            int v145 = v144 + v56;
            int v146 = 72;
            int v147 = v146 + v145;
            int v148 = v55[v147];
            int v149 = 0;
            bool v150 = v148 != v149;
            v141 = v141;
            v142 = v142;
            if (!v150) break;
            int v151 = v141 + v142;
            int v152 = 1;
            int v153 = v142 + v152;
            v141 = v151;
            v142 = v153;
          }
          bool v154 = true;
          v138 = v141;
        }
        case 1:
          {
          int v155 = 92;
          int v156 = v155 + v56;
          int v157 = v55[v156];
          int v158 = 0;
          bool v159 = v157 != v158;
          int v160;
          if (v159) {
            int v161 = 3;
            int v162 = v56 + v161;
            v160 = v162;
          } else {
            int v163 = 4;
            int v164 = v56 + v163;
            v160 = v164;
          }
          v138 = v160;
        }
        case 2:
          {
          int v165 = 0;
          int v166 = 0;
          int v167;
          int v168;
          v167 = v165;
          v168 = v166;
          while (true) {
            int v169 = 4;
            int v170 = v168 * v169;
            int v171 = v170 + v56;
            int v172 = 96;
            int v173 = v172 + v171;
            int v174 = v55[v173];
            int v175 = 0;
            bool v176 = v174 != v175;
            v167 = v167;
            v168 = v168;
            if (!v176) break;
            int v177 = v167 + v168;
            int v178 = 1;
            int v179 = v168 + v178;
            v167 = v177;
            v168 = v179;
          }
          bool v180 = true;
          v138 = v167;
        }
        default:
          {
          int v181 = 116;
          int v182 = v181 + v56;
          int v183 = v55[v182];
          int v184 = 2;
          int v185;
          v185 = v184;
          switch (v183) {
            default:
              {
              int v186 = 0;
              v185 = v186;
              break;
            }
            case 0:
              {
              int v187 = 4;
              v185 = v187;
              break;
            }
          }
          bool v188 = true;
          v138 = v185;
          break;
        }
      }
      bool v189 = true;
      v67 = v138;
      break;
    }
  }
  bool v190 = true;
  int v191 = 16;
  int v192 = v191 + v56;
  bool v193 = true;
  int v194 = simt_wave_count_bits(v193);
  v54[v192] = v194;
  int v195 = 120;
  int v196 = v195 + v56;
  int v197 = v55[v196];
  uint v198 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v199 = (int)(v198);
  int v200;
  v200 = v199;
  switch (v197) {
    case 0:
      {
      int v201 = 0;
      int v202 = 0;
      int v203;
      int v204;
      v203 = v201;
      v204 = v202;
      while (true) {
        int v205 = 4;
        int v206 = v204 * v205;
        int v207 = v206 + v56;
        int v208 = 124;
        int v209 = v208 + v207;
        int v210 = v55[v209];
        int v211 = 0;
        bool v212 = v210 != v211;
        v203 = v203;
        v204 = v204;
        if (!v212) break;
        int v213 = 0;
        int v214 = 0;
        int v215;
        int v216;
        v215 = v213;
        v216 = v214;
        while (true) {
          int v217 = 4;
          int v218 = v216 * v217;
          int v219 = v218 + v56;
          int v220 = 144;
          int v221 = v220 + v219;
          int v222 = v55[v221];
          int v223 = 0;
          bool v224 = v222 != v223;
          v215 = v215;
          v216 = v216;
          if (!v224) break;
          int v225 = v215 + v216;
          int v226 = 1;
          int v227 = v216 + v226;
          v215 = v225;
          v216 = v227;
        }
        bool v228 = true;
        int v229 = v203 + v215;
        int v230 = 1;
        int v231 = v204 + v230;
        v203 = v229;
        v204 = v231;
      }
      bool v232 = true;
      v200 = v203;
      break;
    }
    case 1:
      {
      int v233 = 0;
      int v234 = 0;
      int v235;
      int v236;
      v235 = v233;
      v236 = v234;
      while (true) {
        int v237 = 4;
        int v238 = v236 * v237;
        int v239 = v238 + v56;
        int v240 = 164;
        int v241 = v240 + v239;
        int v242 = v55[v241];
        int v243 = 0;
        bool v244 = v242 != v243;
        v235 = v235;
        v236 = v236;
        if (!v244) break;
        int v245 = v235 + v236;
        int v246 = 1;
        int v247 = v236 + v246;
        v235 = v245;
        v236 = v247;
      }
      bool v248 = true;
      v200 = v235;
      break;
    }
    default:
      {
      int v249 = 184;
      int v250 = v249 + v56;
      int v251 = v55[v250];
      int v252 = 0;
      bool v253 = v251 != v252;
      int v254;
      if (v253) {
        int v255 = 188;
        int v256 = v255 + v56;
        int v257 = v55[v256];
        int v258 = 0;
        bool v259 = v257 != v258;
        int v260;
        if (v259) {
          int v261 = 4;
          int v262 = v56 + v261;
          v260 = v262;
        } else {
          int v263 = 4;
          int v264 = v56 + v263;
          v260 = v264;
        }
        v254 = v260;
      } else {
        int v265 = 0;
        int v266 = 0;
        int v267;
        int v268;
        v267 = v265;
        v268 = v266;
        while (true) {
          int v269 = 4;
          int v270 = v268 * v269;
          int v271 = v270 + v56;
          int v272 = 192;
          int v273 = v272 + v271;
          int v274 = v55[v273];
          int v275 = 0;
          bool v276 = v274 != v275;
          v267 = v267;
          v268 = v268;
          if (!v276) break;
          int v277 = v267 + v268;
          int v278 = 1;
          int v279 = v268 + v278;
          v267 = v277;
          v268 = v279;
        }
        bool v280 = true;
        v254 = v267;
      }
      v200 = v254;
      break;
    }
  }
  bool v281 = true;
  int v282 = 32;
  int v283 = v282 + v56;
  bool v284 = true;
  int v285 = simt_wave_count_bits(v284);
  v54[v283] = v285;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 36; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 212; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
