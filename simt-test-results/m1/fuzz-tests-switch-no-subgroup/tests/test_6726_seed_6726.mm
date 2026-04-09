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
    int v13 = 4;
    int v14 = v3 % v13;
    int v15 = 0;
    int v16;
    v16 = v15;
    switch (v14) {
      case 0:
        {
        int v17 = 2;
        int v18 = v3 % v17;
        int v19;
        v19 = v0;
        switch (v18) {
          case 0:
            {
            int v20 = 3;
            int v21 = v0 + v20;
            v19 = v21;
            break;
          }
          default:
            {
            int v22 = 2;
            v19 = v22;
            break;
          }
        }
        v16 = v19;
      }
      case 1:
        {
        int v23 = 0;
        bool v24 = v2 != v23;
        int v25;
        if (v24) {
          int v26 = 1;
          int v27 = v0 + v26;
          v25 = v27;
        } else {
          int v28 = 1;
          int v29 = v0 + v28;
          v25 = v29;
        }
        v16 = v25;
      }
      default:
        {
        int v30 = 0;
        bool v31 = v2 != v30;
        int v32;
        if (v31) {
          int v33 = 1;
          v32 = v33;
        } else {
          int v34 = 0;
          v32 = v34;
        }
        v16 = v32;
      }
      case 2:
        {
        int v35 = 3;
        int v36 = v3 % v35;
        int v37 = 4;
        int v38;
        v38 = v37;
        switch (v36) {
          default:
            {
            int v39 = 3;
            int v40 = v0 + v39;
            v38 = v40;
            break;
          }
          case 0:
            {
            int v41 = 3;
            v38 = v41;
            break;
          }
          case 1:
            {
            int v42 = 2;
            int v43 = v0 + v42;
            v38 = v43;
            break;
          }
          case 2:
            {
            v38 = v0;
            break;
          }
        }
        v16 = v38;
        break;
      }
    }
    bool v44 = true;
    int v45 = simt_wave_count_bits(v44);
    int v46 = 0;
    int v47 = 4;
    int v48 = v7 * v47;
    int v49 = v46 + v48;
    int v50 = v49 + v0;
    v1[v50] = v45;
    int v51 = 1;
    int v52 = v7 + v51;
    v6 = v16;
    v7 = v52;
  }
  return;
}

kernel void kernel_main(device int* v53 [[buffer(0)]], device int* v54 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v55 = static_cast<int>(__simt_tid3.x);
  int v56 = 0;
  int v57 = v56 + v55;
  int v58 = v54[v57];
  int v59 = 4;
  int v60 = v59 + v55;
  int v61 = v54[v60];
  helper0(v55, v53, v58, v61, static_cast<int>(__simt_tid3.x));
  int v62 = 8;
  int v63 = v62 + v55;
  int v64 = v54[v63];
  int v65 = 0;
  bool v66 = v64 != v65;
  int v67;
  if (v66) {
    int v68 = 12;
    int v69 = v68 + v55;
    int v70 = v54[v69];
    int v71 = 2;
    int v72;
    v72 = v71;
    switch (v70) {
      case 0:
        {
        int v73 = 0;
        int v74 = 0;
        int v75;
        int v76;
        v75 = v73;
        v76 = v74;
        while (true) {
          int v77 = 4;
          int v78 = v76 * v77;
          int v79 = v78 + v55;
          int v80 = 16;
          int v81 = v80 + v79;
          int v82 = v54[v81];
          int v83 = 0;
          bool v84 = v82 != v83;
          v75 = v75;
          v76 = v76;
          if (!v84) break;
          int v85 = v75 + v76;
          int v86 = 1;
          int v87 = v76 + v86;
          bool v88 = true;
          v75 = v85;
          v76 = v87;
        }
        v72 = v75;
        break;
      }
      case 1:
        {
        int v89 = 1;
        int v90 = v55 + v89;
        v72 = v90;
      }
      case 2:
        {
        int v91 = 36;
        int v92 = v91 + v55;
        int v93 = v54[v92];
        int v94;
        v94 = v55;
        switch (v93) {
          case 0:
            {
            int v95 = 4;
            int v96 = v55 + v95;
            v94 = v96;
            break;
          }
          default:
            {
            int v97 = 2;
            int v98 = v55 + v97;
            v94 = v98;
            break;
          }
        }
        bool v99 = true;
        v72 = v94;
      }
      default:
        {
        int v100 = 40;
        int v101 = v100 + v55;
        int v102 = v54[v101];
        int v103 = 4;
        int v104;
        v104 = v103;
        switch (v102) {
          case 0:
            {
            int v105 = 3;
            v104 = v105;
            break;
          }
          default:
            {
            int v106 = 0;
            v104 = v106;
            break;
          }
        }
        bool v107 = true;
        v72 = v104;
        break;
      }
    }
    bool v108 = true;
    int v109 = 16;
    int v110 = v109 + v55;
    bool v111 = true;
    int v112 = simt_wave_count_bits(v111);
    v53[v110] = v112;
    v67 = v72;
  } else {
    int v113 = 44;
    int v114 = v113 + v55;
    int v115 = v54[v114];
    int v116 = 0;
    bool v117 = v115 != v116;
    int v118;
    if (v117) {
      int v119 = 48;
      int v120 = v119 + v55;
      int v121 = v54[v120];
      int v122 = 0;
      bool v123 = v121 != v122;
      int v124;
      if (v123) {
        int v125 = 3;
        int v126 = v55 + v125;
        v124 = v126;
      } else {
        int v127 = 4;
        v124 = v127;
      }
      int v128 = 32;
      int v129 = v128 + v55;
      bool v130 = true;
      int v131 = simt_wave_count_bits(v130);
      v53[v129] = v131;
      v118 = v124;
    } else {
      int v132 = 52;
      int v133 = v132 + v55;
      int v134 = v54[v133];
      uint v135 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v136 = (int)(v135);
      int v137;
      v137 = v136;
      switch (v134) {
        case 0:
          {
          v137 = v55;
          break;
        }
        default:
          {
          v137 = v55;
          break;
        }
      }
      bool v138 = true;
      int v139 = 48;
      int v140 = v139 + v55;
      bool v141 = true;
      int v142 = simt_wave_count_bits(v141);
      v53[v140] = v142;
      v118 = v137;
    }
    int v143 = 64;
    int v144 = v143 + v55;
    bool v145 = true;
    int v146 = simt_wave_count_bits(v145);
    v53[v144] = v146;
    v67 = v118;
  }
  int v147 = 80;
  int v148 = v147 + v55;
  bool v149 = true;
  int v150 = simt_wave_count_bits(v149);
  v53[v148] = v150;
  int v151 = 56;
  int v152 = v151 + v55;
  int v153 = v54[v152];
  uint v154 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v155 = (int)(v154);
  int v156;
  v156 = v155;
  switch (v153) {
    default:
      {
      int v157 = 1;
      v156 = v157;
      break;
    }
    case 0:
      {
      int v158 = 60;
      int v159 = v158 + v55;
      int v160 = v54[v159];
      int v161 = 0;
      bool v162 = v160 != v161;
      int v163;
      if (v162) {
        int v164 = 64;
        int v165 = v164 + v55;
        int v166 = v54[v165];
        int v167 = 0;
        bool v168 = v166 != v167;
        int v169;
        if (v168) {
          v169 = v55;
        } else {
          int v170 = 4;
          int v171 = v55 + v170;
          v169 = v171;
        }
        v163 = v169;
      } else {
        int v172 = 0;
        int v173 = 0;
        int v174;
        int v175;
        v174 = v172;
        v175 = v173;
        while (true) {
          int v176 = 4;
          int v177 = v175 * v176;
          int v178 = v177 + v55;
          int v179 = 68;
          int v180 = v179 + v178;
          int v181 = v54[v180];
          int v182 = 0;
          bool v183 = v181 != v182;
          v174 = v174;
          v175 = v175;
          if (!v183) break;
          int v184 = v174 + v175;
          int v185 = 1;
          int v186 = v175 + v185;
          bool v187 = true;
          v174 = v184;
          v175 = v186;
        }
        v163 = v174;
      }
      v156 = v163;
      break;
    }
    case 1:
      {
      int v188 = 88;
      int v189 = v188 + v55;
      int v190 = v54[v189];
      int v191;
      v191 = v55;
      switch (v190) {
        case 0:
          {
          int v192 = 92;
          int v193 = v192 + v55;
          int v194 = v54[v193];
          int v195 = 0;
          bool v196 = v194 != v195;
          int v197;
          if (v196) {
            int v198 = 4;
            int v199 = v55 + v198;
            v197 = v199;
          } else {
            int v200 = 1;
            v197 = v200;
          }
          v191 = v197;
          break;
        }
        case 1:
          {
          int v201 = 96;
          int v202 = v201 + v55;
          int v203 = v54[v202];
          int v204;
          v204 = v55;
          switch (v203) {
            case 0:
              {
              int v205 = 2;
              int v206 = v55 + v205;
              v204 = v206;
              break;
            }
            default:
              {
              int v207 = 2;
              v204 = v207;
              break;
            }
            case 1:
              {
              int v208 = 1;
              int v209 = v55 + v208;
              v204 = v209;
              break;
            }
            case 2:
              {
              v204 = v55;
              break;
            }
          }
          v191 = v204;
          break;
        }
        default:
          {
          int v210 = 1;
          v191 = v210;
          break;
        }
        case 2:
          {
          int v211 = 100;
          int v212 = v211 + v55;
          int v213 = v54[v212];
          int v214 = 0;
          bool v215 = v213 != v214;
          int v216;
          if (v215) {
            int v217 = 3;
            v216 = v217;
          } else {
            int v218 = 1;
            v216 = v218;
          }
          v191 = v216;
          break;
        }
      }
      v156 = v191;
      break;
    }
  }
  int v219 = 104;
  int v220 = v219 + v55;
  int v221 = v54[v220];
  uint v222 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v223 = (int)(v222);
  int v224;
  v224 = v223;
  switch (v221) {
    case 0:
      {
      int v225 = 108;
      int v226 = v225 + v55;
      int v227 = v54[v226];
      int v228 = 4;
      int v229 = v55 + v228;
      int v230;
      v230 = v229;
      switch (v227) {
        case 0:
          {
          int v231 = 112;
          int v232 = v231 + v55;
          int v233 = v54[v232];
          int v234 = 0;
          bool v235 = v233 != v234;
          int v236;
          if (v235) {
            int v237 = 3;
            int v238 = v55 + v237;
            v236 = v238;
          } else {
            int v239 = 4;
            int v240 = v55 + v239;
            v236 = v240;
          }
          v230 = v236;
          break;
        }
        default:
          {
          int v241 = 1;
          v230 = v241;
          break;
        }
        case 1:
          {
          int v242 = 116;
          int v243 = v242 + v55;
          int v244 = v54[v243];
          int v245 = 3;
          int v246 = v55 + v245;
          int v247;
          v247 = v246;
          switch (v244) {
            case 0:
              {
              int v248 = 2;
              v247 = v248;
              break;
            }
            case 1:
              {
              v247 = v55;
            }
            default:
              {
              int v249 = 3;
              int v250 = v55 + v249;
              v247 = v250;
              break;
            }
          }
          v230 = v247;
          break;
        }
      }
      v224 = v230;
      break;
    }
    case 1:
      {
      int v251 = 0;
      int v252 = 0;
      int v253;
      int v254;
      v253 = v251;
      v254 = v252;
      while (true) {
        int v255 = 4;
        int v256 = v254 * v255;
        int v257 = v256 + v55;
        int v258 = 120;
        int v259 = v258 + v257;
        int v260 = v54[v259];
        int v261 = 0;
        bool v262 = v260 != v261;
        v253 = v253;
        v254 = v254;
        if (!v262) break;
        int v263 = v253 + v254;
        int v264 = 1;
        int v265 = v254 + v264;
        bool v266 = true;
        v253 = v263;
        v254 = v265;
        continue;
        ;
      }
      v224 = v253;
      break;
    }
    case 2:
      {
      int v267 = 3;
      v224 = v267;
      break;
    }
    default:
      {
      int v268 = 140;
      int v269 = v268 + v55;
      int v270 = v54[v269];
      int v271 = 0;
      bool v272 = v270 != v271;
      int v273;
      if (v272) {
        v273 = v55;
      } else {
        int v274 = 144;
        int v275 = v274 + v55;
        int v276 = v54[v275];
        int v277 = 1;
        int v278;
        v278 = v277;
        switch (v276) {
          default:
            {
            int v279 = 4;
            int v280 = v55 + v279;
            v278 = v280;
            break;
          }
          case 0:
            {
            v278 = v55;
            break;
          }
          case 1:
            {
            int v281 = 3;
            int v282 = v55 + v281;
            v278 = v282;
            break;
          }
        }
        bool v283 = true;
        v273 = v278;
      }
      v224 = v273;
      break;
    }
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 84; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 148; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
