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
    int v7 = 2;
    int v8 = v3 % v7;
    int v9;
    v9 = v0;
    switch (v8) {
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
          int v19 = 1;
          int v20 = v13 + v19;
          v12 = v0;
          v13 = v20;
        }
        int v21 = 4;
        v9 = v12;
        break;
      }
      case 0:
        {
        int v22 = 1;
        v9 = v22;
        break;
      }
    }
    int v23 = 3;
    int v24 = v0 + v23;
    v6 = v9;
  } else {
    int v25 = 0;
    int v26 = 0;
    int v27;
    int v28;
    v27 = v25;
    v28 = v26;
    while (true) {
      int v29 = 4;
      int v30 = v3 % v29;
      int v31 = 1;
      int v32 = v30 + v31;
      bool v33 = v28 < v32;
      v27 = v27;
      v28 = v28;
      if (!v33) break;
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
        int v44 = 1;
        int v45 = v37 + v44;
        v36 = v43;
        v37 = v45;
      }
      uint v46 = simt_lane_id(__simt_tid);
      int v47 = (int)(v46);
      int v48 = 1;
      int v49 = v28 + v48;
      v27 = v36;
      v28 = v49;
      break;
      ;
    }
    int v50 = 4;
    v6 = v27;
  }
  bool v51 = true;
  int v52 = simt_wave_count_bits(v51);
  int v53 = 0;
  int v54 = v53 + v0;
  v1[v54] = v52;
  return;
}

kernel void kernel_main(device int* v55 [[buffer(0)]], device int* v56 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v57 = static_cast<int>(__simt_tid3.x);
  int v58 = 0;
  int v59 = v58 + v57;
  int v60 = v56[v59];
  int v61 = 4;
  int v62 = v61 + v57;
  int v63 = v56[v62];
  helper0(v57, v55, v60, v63, static_cast<int>(__simt_tid3.x));
  int v64 = 8;
  int v65 = v64 + v57;
  int v66 = v56[v65];
  uint v67 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v68 = (int)(v67);
  int v69;
  v69 = v68;
  switch (v66) {
    case 0:
      {
      int v70 = 0;
      int v71 = 0;
      int v72;
      int v73;
      v72 = v70;
      v73 = v71;
      while (true) {
        int v74 = 4;
        int v75 = v73 * v74;
        int v76 = v75 + v57;
        int v77 = 12;
        int v78 = v77 + v76;
        int v79 = v56[v78];
        int v80 = 0;
        bool v81 = v79 != v80;
        v72 = v72;
        v73 = v73;
        if (!v81) break;
        int v82 = v72 + v73;
        int v83 = 1;
        int v84 = v73 + v83;
        v72 = v82;
        v73 = v84;
        continue;
        ;
      }
      bool v85 = true;
      v69 = v72;
      break;
    }
    default:
      {
      int v86 = 32;
      int v87 = v86 + v57;
      int v88 = v56[v87];
      int v89 = 0;
      bool v90 = v88 != v89;
      int v91;
      if (v90) {
        int v92 = 36;
        int v93 = v92 + v57;
        int v94 = v56[v93];
        int v95 = 4;
        int v96;
        v96 = v95;
        switch (v94) {
          default:
            {
            int v97 = 1;
            v96 = v97;
            break;
          }
          case 0:
            {
            v96 = v57;
            break;
          }
        }
        bool v98 = true;
        v91 = v96;
      } else {
        int v99 = 0;
        int v100 = 0;
        int v101;
        int v102;
        v101 = v99;
        v102 = v100;
        while (true) {
          int v103 = 4;
          int v104 = v102 * v103;
          int v105 = v104 + v57;
          int v106 = 40;
          int v107 = v106 + v105;
          int v108 = v56[v107];
          int v109 = 0;
          bool v110 = v108 != v109;
          v101 = v101;
          v102 = v102;
          if (!v110) break;
          int v111 = v101 + v102;
          int v112 = 1;
          int v113 = v102 + v112;
          v101 = v111;
          v102 = v113;
        }
        bool v114 = true;
        v91 = v101;
      }
      v69 = v91;
      break;
    }
  }
  bool v115 = true;
  int v116 = 16;
  int v117 = v116 + v57;
  bool v118 = true;
  int v119 = simt_wave_count_bits(v118);
  v55[v117] = v119;
  int v120 = 60;
  int v121 = v120 + v57;
  int v122 = v56[v121];
  int v123;
  v123 = v57;
  switch (v122) {
    default:
      {
      int v124 = 64;
      int v125 = v124 + v57;
      int v126 = v56[v125];
      int v127 = 1;
      int v128 = v57 + v127;
      int v129;
      v129 = v128;
      switch (v126) {
        case 0:
          {
          int v130 = 68;
          int v131 = v130 + v57;
          int v132 = v56[v131];
          int v133 = 0;
          int v134 = v57 + v133;
          int v135;
          v135 = v134;
          switch (v132) {
            case 0:
              {
              v135 = v57;
              break;
            }
            case 1:
              {
              int v136 = 1;
              v135 = v136;
              break;
            }
            case 2:
              {
              v135 = v57;
              break;
            }
            default:
              {
              int v137 = 2;
              v135 = v137;
              break;
            }
          }
          bool v138 = true;
          v129 = v135;
          break;
        }
        default:
          {
          int v139 = 72;
          int v140 = v139 + v57;
          int v141 = v56[v140];
          int v142 = 0;
          bool v143 = v141 != v142;
          int v144;
          if (v143) {
            v144 = v57;
          } else {
            int v145 = 2;
            v144 = v145;
          }
          v129 = v144;
          break;
        }
        case 1:
          {
          int v146 = 76;
          int v147 = v146 + v57;
          int v148 = v56[v147];
          int v149 = 0;
          bool v150 = v148 != v149;
          int v151;
          if (v150) {
            v151 = v57;
          } else {
            int v152 = 4;
            v151 = v152;
          }
          v129 = v151;
          break;
        }
      }
      bool v153 = true;
      v123 = v129;
    }
    case 0:
      {
      int v154 = 80;
      int v155 = v154 + v57;
      int v156 = v56[v155];
      int v157 = 0;
      bool v158 = v156 != v157;
      int v159;
      if (v158) {
        int v160 = 84;
        int v161 = v160 + v57;
        int v162 = v56[v161];
        int v163 = 1;
        int v164 = v57 + v163;
        int v165;
        v165 = v164;
        switch (v162) {
          default:
            {
            int v166 = 2;
            int v167 = v57 + v166;
            v165 = v167;
          }
          case 0:
            {
            int v168 = 3;
            v165 = v168;
            break;
          }
          case 1:
            {
            int v169 = 0;
            v165 = v169;
            break;
          }
        }
        bool v170 = true;
        v159 = v165;
      } else {
        int v171 = 0;
        int v172 = 0;
        int v173;
        int v174;
        v173 = v171;
        v174 = v172;
        while (true) {
          int v175 = 4;
          int v176 = v174 * v175;
          int v177 = v176 + v57;
          int v178 = 88;
          int v179 = v178 + v177;
          int v180 = v56[v179];
          int v181 = 0;
          bool v182 = v180 != v181;
          v173 = v173;
          v174 = v174;
          if (!v182) break;
          int v183 = v173 + v174;
          int v184 = 1;
          int v185 = v174 + v184;
          v173 = v183;
          v174 = v185;
        }
        bool v186 = true;
        v159 = v173;
      }
      v123 = v159;
      break;
    }
    case 1:
      {
      int v187 = 0;
      int v188 = 0;
      int v189;
      int v190;
      v189 = v187;
      v190 = v188;
      while (true) {
        int v191 = 4;
        int v192 = v190 * v191;
        int v193 = v192 + v57;
        int v194 = 108;
        int v195 = v194 + v193;
        int v196 = v56[v195];
        int v197 = 0;
        bool v198 = v196 != v197;
        v189 = v189;
        v190 = v190;
        if (!v198) break;
        int v199 = 0;
        int v200 = 0;
        int v201;
        int v202;
        v201 = v199;
        v202 = v200;
        while (true) {
          int v203 = 4;
          int v204 = v202 * v203;
          int v205 = v204 + v57;
          int v206 = 128;
          int v207 = v206 + v205;
          int v208 = v56[v207];
          int v209 = 0;
          bool v210 = v208 != v209;
          v201 = v201;
          v202 = v202;
          if (!v210) break;
          int v211 = v201 + v202;
          int v212 = 1;
          int v213 = v202 + v212;
          v201 = v211;
          v202 = v213;
        }
        bool v214 = true;
        int v215 = v189 + v201;
        int v216 = 1;
        int v217 = v190 + v216;
        v189 = v215;
        v190 = v217;
      }
      bool v218 = true;
      v123 = v189;
      break;
    }
  }
  bool v219 = true;
  int v220 = 32;
  int v221 = v220 + v57;
  bool v222 = true;
  int v223 = simt_wave_count_bits(v222);
  v55[v221] = v223;
  int v224 = 148;
  int v225 = v224 + v57;
  int v226 = v56[v225];
  int v227 = 0;
  bool v228 = v226 != v227;
  int v229;
  if (v228) {
    int v230 = 152;
    int v231 = v230 + v57;
    int v232 = v56[v231];
    int v233 = 0;
    int v234;
    v234 = v233;
    switch (v232) {
      case 0:
        {
        int v235 = 156;
        int v236 = v235 + v57;
        int v237 = v56[v236];
        int v238 = 0;
        bool v239 = v237 != v238;
        int v240;
        if (v239) {
          int v241 = 4;
          v240 = v241;
        } else {
          int v242 = 0;
          int v243 = v57 + v242;
          v240 = v243;
        }
        v234 = v240;
        break;
      }
      case 1:
        {
        int v244 = 160;
        int v245 = v244 + v57;
        int v246 = v56[v245];
        int v247 = 1;
        int v248;
        v248 = v247;
        switch (v246) {
          case 0:
            {
            int v249 = 2;
            v248 = v249;
            break;
          }
          default:
            {
            int v250 = 0;
            v248 = v250;
            break;
          }
          case 1:
            {
            int v251 = 2;
            v248 = v251;
            break;
          }
          case 2:
            {
            v248 = v57;
            break;
          }
        }
        bool v252 = true;
        v234 = v248;
        break;
      }
      case 2:
        {
        int v253 = 164;
        int v254 = v253 + v57;
        int v255 = v56[v254];
        int v256;
        v256 = v57;
        switch (v255) {
          case 0:
            {
            int v257 = 0;
            int v258 = v57 + v257;
            v256 = v258;
            break;
          }
          default:
            {
            int v259 = 0;
            int v260 = v57 + v259;
            v256 = v260;
            break;
          }
        }
        bool v261 = true;
        v234 = v256;
        break;
      }
      default:
        {
        int v262 = 0;
        int v263 = 0;
        int v264;
        int v265;
        v264 = v262;
        v265 = v263;
        while (true) {
          int v266 = 4;
          int v267 = v265 * v266;
          int v268 = v267 + v57;
          int v269 = 168;
          int v270 = v269 + v268;
          int v271 = v56[v270];
          int v272 = 0;
          bool v273 = v271 != v272;
          v264 = v264;
          v265 = v265;
          if (!v273) break;
          int v274 = v264 + v265;
          int v275 = 1;
          int v276 = v265 + v275;
          v264 = v274;
          v265 = v276;
        }
        bool v277 = true;
        v234 = v264;
        break;
      }
    }
    bool v278 = true;
    v229 = v234;
  } else {
    uint v279 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v280 = (int)(v279);
    v229 = v280;
  }
  int v281 = 48;
  int v282 = v281 + v57;
  bool v283 = true;
  int v284 = simt_wave_count_bits(v283);
  v55[v282] = v284;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 188; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
