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
    uint v7 = simt_lane_id(__simt_tid);
    int v8 = (int)(v7);
    v6 = v8;
  } else {
    int v9 = 3;
    int v10 = v3 % v9;
    int v11 = 4;
    int v12;
    v12 = v11;
    switch (v10) {
      case 0:
        {
        int v13 = 0;
        bool v14 = v2 != v13;
        int v15;
        if (v14) {
          v15 = v0;
        } else {
          v15 = v0;
        }
        int v16 = 1;
        int v17 = v0 + v16;
        v12 = v15;
        break;
      }
      default:
        {
        int v18 = 0;
        bool v19 = v2 != v18;
        int v20;
        if (v19) {
          int v21 = 2;
          v20 = v21;
        } else {
          int v22 = 3;
          int v23 = v0 + v22;
          v20 = v23;
        }
        v12 = v20;
        break;
      }
      case 1:
        {
        v12 = v0;
        break;
      }
      case 2:
        {
        int v24 = 2;
        int v25 = v3 % v24;
        int v26 = 2;
        int v27;
        v27 = v26;
        switch (v25) {
          case 0:
            {
            v27 = v0;
            break;
          }
          default:
            {
            v27 = v0;
            break;
          }
        }
        int v28 = 4;
        int v29 = v0 + v28;
        v12 = v27;
        break;
      }
    }
    int v30 = 3;
    int v31 = v0 + v30;
    v6 = v12;
  }
  bool v32 = true;
  int v33 = simt_wave_count_bits(v32);
  int v34 = 0;
  int v35 = v34 + v0;
  v1[v35] = v33;
  return;
}

kernel void kernel_main(device int* v36 [[buffer(0)]], device int* v37 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v38 = static_cast<int>(__simt_tid3.x);
  int v39 = 0;
  int v40 = v39 + v38;
  int v41 = v37[v40];
  int v42 = 4;
  int v43 = v42 + v38;
  int v44 = v37[v43];
  helper0(v38, v36, v41, v44, static_cast<int>(__simt_tid3.x));
  int v45 = 8;
  int v46 = v45 + v38;
  int v47 = v37[v46];
  int v48 = 0;
  bool v49 = v47 != v48;
  int v50;
  if (v49) {
    int v51 = 0;
    int v52 = 0;
    int v53;
    int v54;
    v53 = v51;
    v54 = v52;
    while (true) {
      int v55 = 4;
      int v56 = v54 * v55;
      int v57 = v56 + v38;
      int v58 = 12;
      int v59 = v58 + v57;
      int v60 = v37[v59];
      int v61 = 0;
      bool v62 = v60 != v61;
      v53 = v53;
      v54 = v54;
      if (!v62) break;
      int v63 = 0;
      int v64 = 0;
      int v65;
      int v66;
      v65 = v63;
      v66 = v64;
      while (true) {
        int v67 = 4;
        int v68 = v66 * v67;
        int v69 = v68 + v38;
        int v70 = 32;
        int v71 = v70 + v69;
        int v72 = v37[v71];
        int v73 = 0;
        bool v74 = v72 != v73;
        v65 = v65;
        v66 = v66;
        if (!v74) break;
        int v75 = v65 + v66;
        int v76 = 1;
        int v77 = v66 + v76;
        v65 = v75;
        v66 = v77;
      }
      bool v78 = true;
      int v79 = v53 + v65;
      int v80 = 1;
      int v81 = v54 + v80;
      v53 = v79;
      v54 = v81;
    }
    bool v82 = true;
    v50 = v53;
  } else {
    int v83 = 52;
    int v84 = v83 + v38;
    int v85 = v37[v84];
    int v86 = 0;
    bool v87 = v85 != v86;
    int v88;
    if (v87) {
      int v89 = 1;
      int v90 = v38 + v89;
      v88 = v90;
    } else {
      int v91 = 56;
      int v92 = v91 + v38;
      int v93 = v37[v92];
      int v94 = 4;
      int v95 = v38 + v94;
      int v96;
      v96 = v95;
      switch (v93) {
        default:
          {
          int v97 = 3;
          int v98 = v38 + v97;
          v96 = v98;
          break;
        }
        case 0:
          {
          int v99 = 1;
          v96 = v99;
          break;
        }
      }
      bool v100 = true;
      v88 = v96;
    }
    v50 = v88;
  }
  int v101 = 16;
  int v102 = v101 + v38;
  bool v103 = true;
  int v104 = simt_wave_count_bits(v103);
  v36[v102] = v104;
  int v105 = 60;
  int v106 = v105 + v38;
  int v107 = v37[v106];
  int v108 = 4;
  int v109;
  v109 = v108;
  switch (v107) {
    case 0:
      {
      int v110 = 64;
      int v111 = v110 + v38;
      int v112 = v37[v111];
      int v113 = 0;
      int v114 = v38 + v113;
      int v115;
      v115 = v114;
      switch (v112) {
        case 0:
          {
          int v116 = 68;
          int v117 = v116 + v38;
          int v118 = v37[v117];
          int v119 = 0;
          bool v120 = v118 != v119;
          int v121;
          if (v120) {
            int v122 = 2;
            v121 = v122;
          } else {
            int v123 = 3;
            int v124 = v38 + v123;
            v121 = v124;
          }
          v115 = v121;
          break;
        }
        default:
          {
          int v125 = 0;
          int v126 = 0;
          int v127;
          int v128;
          v127 = v125;
          v128 = v126;
          while (true) {
            int v129 = 4;
            int v130 = v128 * v129;
            int v131 = v130 + v38;
            int v132 = 72;
            int v133 = v132 + v131;
            int v134 = v37[v133];
            int v135 = 0;
            bool v136 = v134 != v135;
            v127 = v127;
            v128 = v128;
            if (!v136) break;
            int v137 = v127 + v128;
            int v138 = 1;
            int v139 = v128 + v138;
            v127 = v137;
            v128 = v139;
          }
          bool v140 = true;
          v115 = v127;
          break;
        }
        case 1:
          {
          int v141 = 92;
          int v142 = v141 + v38;
          int v143 = v37[v142];
          int v144 = 0;
          bool v145 = v143 != v144;
          int v146;
          if (v145) {
            int v147 = 2;
            v146 = v147;
          } else {
            v146 = v38;
          }
          v115 = v146;
          break;
        }
      }
      bool v148 = true;
      v109 = v115;
      break;
    }
    case 1:
      {
      int v149 = 96;
      int v150 = v149 + v38;
      int v151 = v37[v150];
      int v152;
      v152 = v38;
      switch (v151) {
        case 0:
          {
          int v153 = 100;
          int v154 = v153 + v38;
          int v155 = v37[v154];
          int v156;
          v156 = v38;
          switch (v155) {
            case 0:
              {
              v156 = v38;
              break;
            }
            default:
              {
              int v157 = 4;
              v156 = v157;
              break;
            }
            case 1:
              {
              int v158 = 1;
              int v159 = v38 + v158;
              v156 = v159;
              break;
            }
          }
          bool v160 = true;
          v152 = v156;
          break;
        }
        default:
          {
          int v161 = 104;
          int v162 = v161 + v38;
          int v163 = v37[v162];
          int v164;
          v164 = v38;
          switch (v163) {
            case 0:
              {
              int v165 = 1;
              int v166 = v38 + v165;
              v164 = v166;
              break;
            }
            default:
              {
              int v167 = 1;
              v164 = v167;
              break;
            }
          }
          bool v168 = true;
          v152 = v164;
          break;
        }
      }
      bool v169 = true;
      v109 = v152;
    }
    case 2:
      {
      int v170 = 108;
      int v171 = v170 + v38;
      int v172 = v37[v171];
      int v173 = 3;
      int v174;
      v174 = v173;
      switch (v172) {
        case 0:
          {
          int v175 = 0;
          int v176 = 0;
          int v177;
          int v178;
          v177 = v175;
          v178 = v176;
          while (true) {
            int v179 = 4;
            int v180 = v178 * v179;
            int v181 = v180 + v38;
            int v182 = 112;
            int v183 = v182 + v181;
            int v184 = v37[v183];
            int v185 = 0;
            bool v186 = v184 != v185;
            v177 = v177;
            v178 = v178;
            if (!v186) break;
            int v187 = v177 + v178;
            int v188 = 1;
            int v189 = v178 + v188;
            v177 = v187;
            v178 = v189;
          }
          bool v190 = true;
          v174 = v177;
          break;
        }
        default:
          {
          int v191 = 0;
          int v192 = 0;
          int v193;
          int v194;
          v193 = v191;
          v194 = v192;
          while (true) {
            int v195 = 4;
            int v196 = v194 * v195;
            int v197 = v196 + v38;
            int v198 = 132;
            int v199 = v198 + v197;
            int v200 = v37[v199];
            int v201 = 0;
            bool v202 = v200 != v201;
            v193 = v193;
            v194 = v194;
            if (!v202) break;
            int v203 = v193 + v194;
            int v204 = 1;
            int v205 = v194 + v204;
            v193 = v203;
            v194 = v205;
          }
          bool v206 = true;
          v174 = v193;
          break;
        }
      }
      bool v207 = true;
      v109 = v174;
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
        int v214 = v213 + v38;
        int v215 = 152;
        int v216 = v215 + v214;
        int v217 = v37[v216];
        int v218 = 0;
        bool v219 = v217 != v218;
        v210 = v210;
        v211 = v211;
        if (!v219) break;
        int v220 = v210 + v211;
        int v221 = 1;
        int v222 = v211 + v221;
        v210 = v220;
        v211 = v222;
      }
      bool v223 = true;
      v109 = v210;
      break;
    }
  }
  bool v224 = true;
  int v225 = 32;
  int v226 = v225 + v38;
  bool v227 = true;
  int v228 = simt_wave_count_bits(v227);
  v36[v226] = v228;
  int v229 = 172;
  int v230 = v229 + v38;
  int v231 = v37[v230];
  uint v232 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v233 = (int)(v232);
  int v234;
  v234 = v233;
  switch (v231) {
    default:
      {
      int v235 = 176;
      int v236 = v235 + v38;
      int v237 = v37[v236];
      int v238 = 0;
      bool v239 = v237 != v238;
      int v240;
      if (v239) {
        int v241 = 180;
        int v242 = v241 + v38;
        int v243 = v37[v242];
        int v244;
        v244 = v38;
        switch (v243) {
          case 0:
            {
            int v245 = 2;
            int v246 = v38 + v245;
            v244 = v246;
          }
          case 1:
            {
            int v247 = 4;
            v244 = v247;
            break;
          }
          default:
            {
            v244 = v38;
            break;
          }
          case 2:
            {
            int v248 = 2;
            v244 = v248;
            break;
          }
        }
        bool v249 = true;
        v240 = v244;
      } else {
        int v250 = 184;
        int v251 = v250 + v38;
        int v252 = v37[v251];
        int v253 = 0;
        bool v254 = v252 != v253;
        int v255;
        if (v254) {
          int v256 = 0;
          int v257 = v38 + v256;
          v255 = v257;
        } else {
          int v258 = 3;
          v255 = v258;
        }
        v240 = v255;
      }
      v234 = v240;
      break;
    }
    case 0:
      {
      int v259 = 188;
      int v260 = v259 + v38;
      int v261 = v37[v260];
      int v262 = 1;
      int v263 = v38 + v262;
      int v264;
      v264 = v263;
      switch (v261) {
        case 0:
          {
          int v265 = 192;
          int v266 = v265 + v38;
          int v267 = v37[v266];
          int v268 = 0;
          bool v269 = v267 != v268;
          int v270;
          if (v269) {
            v270 = v38;
          } else {
            int v271 = 2;
            int v272 = v38 + v271;
            v270 = v272;
          }
          v264 = v270;
        }
        default:
          {
          int v273 = 0;
          int v274 = 0;
          int v275;
          int v276;
          v275 = v273;
          v276 = v274;
          while (true) {
            int v277 = 4;
            int v278 = v276 * v277;
            int v279 = v278 + v38;
            int v280 = 196;
            int v281 = v280 + v279;
            int v282 = v37[v281];
            int v283 = 0;
            bool v284 = v282 != v283;
            v275 = v275;
            v276 = v276;
            if (!v284) break;
            int v285 = v275 + v276;
            int v286 = 1;
            int v287 = v276 + v286;
            v275 = v285;
            v276 = v287;
          }
          bool v288 = true;
          v264 = v275;
          break;
        }
      }
      bool v289 = true;
      v234 = v264;
      break;
    }
  }
  bool v290 = true;
  int v291 = 48;
  int v292 = v291 + v38;
  bool v293 = true;
  int v294 = simt_wave_count_bits(v293);
  v36[v292] = v294;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 216; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
