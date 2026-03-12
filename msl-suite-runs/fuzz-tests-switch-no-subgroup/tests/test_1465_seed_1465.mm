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
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 3;
      int v10 = v3 % v9;
      int v11 = 2;
      int v12;
      v12 = v11;
      switch (v10) {
        case 0:
          {
          int v13 = 0;
          int v14 = 0;
          int v15;
          int v16;
          v15 = v13;
          v16 = v14;
          while (true) {
            int v17 = 4;
            int v18 = v3 % v17;
            int v19 = 1;
            int v20 = v18 + v19;
            bool v21 = v16 < v20;
            v15 = v15;
            v16 = v16;
            if (!v21) break;
            int v22 = 1;
            int v23 = v16 + v22;
            v15 = v0;
            v16 = v23;
          }
          v12 = v15;
          break;
        }
        case 1:
          {
          int v24 = 4;
          int v25 = v3 % v24;
          int v26 = 4;
          int v27;
          v27 = v26;
          switch (v25) {
            default:
              {
              int v28 = 2;
              int v29 = v0 + v28;
              v27 = v29;
            }
            case 0:
              {
              int v30 = 0;
              int v31 = v0 + v30;
              v27 = v31;
            }
            case 1:
              {
              int v32 = 0;
              v27 = v32;
            }
            case 2:
              {
              v27 = v0;
              break;
            }
          }
          v12 = v27;
          break;
        }
        default:
          {
          int v33 = 0;
          bool v34 = v2 != v33;
          int v35;
          if (v34) {
            int v36 = 4;
            v35 = v36;
          } else {
            int v37 = 4;
            int v38 = v0 + v37;
            v35 = v38;
          }
          v12 = v35;
          break;
        }
      }
      v8 = v12;
      break;
    }
    case 0:
      {
      int v39 = 0;
      bool v40 = v2 != v39;
      int v41;
      if (v40) {
        int v42 = 0;
        bool v43 = v2 != v42;
        int v44;
        if (v43) {
          int v45 = 1;
          v44 = v45;
        } else {
          int v46 = 3;
          int v47 = v0 + v46;
          v44 = v47;
        }
        v41 = v44;
      } else {
        int v48 = 0;
        bool v49 = v2 != v48;
        int v50;
        if (v49) {
          int v51 = 2;
          int v52 = v0 + v51;
          v50 = v52;
        } else {
          int v53 = 0;
          int v54 = v0 + v53;
          v50 = v54;
        }
        v41 = v50;
      }
      v8 = v41;
      break;
    }
    case 1:
      {
      int v55 = 4;
      int v56 = v3 % v55;
      int v57 = 2;
      int v58;
      v58 = v57;
      switch (v56) {
        case 0:
          {
          int v59 = 0;
          int v60 = 0;
          int v61;
          int v62;
          v61 = v59;
          v62 = v60;
          while (true) {
            int v63 = 4;
            int v64 = v3 % v63;
            int v65 = 1;
            int v66 = v64 + v65;
            bool v67 = v62 < v66;
            v61 = v61;
            v62 = v62;
            if (!v67) break;
            int v68 = 2;
            int v69 = v0 + v68;
            int v70 = 1;
            int v71 = v62 + v70;
            v61 = v69;
            v62 = v71;
          }
          v58 = v61;
          break;
        }
        case 1:
          {
          int v72 = 0;
          bool v73 = v2 != v72;
          int v74;
          if (v73) {
            int v75 = 4;
            v74 = v75;
          } else {
            v74 = v0;
          }
          v58 = v74;
        }
        default:
          {
          int v76 = 0;
          bool v77 = v2 != v76;
          int v78;
          if (v77) {
            v78 = v0;
          } else {
            int v79 = 4;
            int v80 = v0 + v79;
            v78 = v80;
          }
          v58 = v78;
        }
        case 2:
          {
          int v81 = 0;
          bool v82 = v2 != v81;
          int v83;
          if (v82) {
            v83 = v0;
          } else {
            int v84 = 4;
            int v85 = v0 + v84;
            v83 = v85;
          }
          v58 = v83;
          break;
        }
      }
      v8 = v58;
      break;
    }
  }
  bool v86 = true;
  int v87 = simt_wave_count_bits(v86);
  int v88 = 0;
  int v89 = v88 + v0;
  v1[v89] = v87;
  return;
}

kernel void kernel_main(device int* v90 [[buffer(0)]], device int* v91 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v92 = static_cast<int>(__simt_tid3.x);
  int v93 = 0;
  int v94 = v93 + v92;
  int v95 = v91[v94];
  int v96 = 4;
  int v97 = v96 + v92;
  int v98 = v91[v97];
  helper0(v92, v90, v95, v98, static_cast<int>(__simt_tid3.x));
  int v99 = 0;
  int v100 = 0;
  int v101;
  int v102;
  v101 = v99;
  v102 = v100;
  while (true) {
    int v103 = 4;
    int v104 = v102 * v103;
    int v105 = v104 + v92;
    int v106 = 8;
    int v107 = v106 + v105;
    int v108 = v91[v107];
    int v109 = 0;
    bool v110 = v108 != v109;
    v101 = v101;
    v102 = v102;
    if (!v110) break;
    int v111 = 28;
    int v112 = v111 + v92;
    int v113 = v91[v112];
    int v114 = 0;
    bool v115 = v113 != v114;
    int v116;
    if (v115) {
      int v117 = 32;
      int v118 = v117 + v92;
      int v119 = v91[v118];
      int v120 = 0;
      bool v121 = v119 != v120;
      int v122;
      if (v121) {
        uint v123 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v124 = (int)(v123);
        v122 = v124;
      } else {
        v122 = v92;
      }
      int v125 = 16;
      int v126 = v125 + v92;
      bool v127 = true;
      int v128 = simt_wave_count_bits(v127);
      v90[v126] = v128;
      v116 = v122;
    } else {
      int v129 = 0;
      int v130 = 0;
      int v131;
      int v132;
      v131 = v129;
      v132 = v130;
      while (true) {
        int v133 = 4;
        int v134 = v132 * v133;
        int v135 = v134 + v92;
        int v136 = 36;
        int v137 = v136 + v135;
        int v138 = v91[v137];
        int v139 = 0;
        bool v140 = v138 != v139;
        v131 = v131;
        v132 = v132;
        if (!v140) break;
        int v141 = v131 + v132;
        int v142 = 1;
        int v143 = v132 + v142;
        bool v144 = true;
        int v145 = 32;
        int v146 = 4;
        int v147 = v132 * v146;
        int v148 = v145 + v147;
        int v149 = v148 + v92;
        bool v150 = true;
        int v151 = simt_wave_count_bits(v150);
        v90[v149] = v151;
        v131 = v141;
        v132 = v143;
      }
      v116 = v131;
    }
    int v152 = 48;
    int v153 = v152 + v92;
    bool v154 = true;
    int v155 = simt_wave_count_bits(v154);
    v90[v153] = v155;
    int v156 = v101 + v116;
    int v157 = 1;
    int v158 = v102 + v157;
    bool v159 = true;
    int v160 = 64;
    int v161 = 4;
    int v162 = v102 * v161;
    int v163 = v160 + v162;
    int v164 = v163 + v92;
    bool v165 = true;
    int v166 = simt_wave_count_bits(v165);
    v90[v164] = v166;
    v101 = v156;
    v102 = v158;
  }
  int v167 = 0;
  int v168 = 0;
  int v169;
  int v170;
  v169 = v167;
  v170 = v168;
  while (true) {
    int v171 = 4;
    int v172 = v170 * v171;
    int v173 = v172 + v92;
    int v174 = 56;
    int v175 = v174 + v173;
    int v176 = v91[v175];
    int v177 = 0;
    bool v178 = v176 != v177;
    v169 = v169;
    v170 = v170;
    if (!v178) break;
    int v179 = 76;
    int v180 = v179 + v92;
    int v181 = v91[v180];
    uint v182 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v183 = (int)(v182);
    int v184;
    v184 = v183;
    switch (v181) {
      case 0:
        {
        int v185 = 1;
        v184 = v185;
        break;
      }
      case 1:
        {
        int v186 = 80;
        int v187 = v186 + v92;
        int v188 = v91[v187];
        int v189 = 1;
        int v190 = v92 + v189;
        int v191;
        v191 = v190;
        switch (v188) {
          default:
            {
            int v192 = 1;
            v191 = v192;
          }
          case 0:
            {
            int v193 = 3;
            int v194 = v92 + v193;
            v191 = v194;
          }
          case 1:
            {
            int v195 = 0;
            int v196 = v92 + v195;
            v191 = v196;
            break;
          }
        }
        bool v197 = true;
        v184 = v191;
        break;
      }
      default:
        {
        v184 = v92;
        break;
      }
    }
    bool v198 = true;
    int v199 = 80;
    int v200 = v199 + v92;
    bool v201 = true;
    int v202 = simt_wave_count_bits(v201);
    v90[v200] = v202;
    int v203 = v169 + v184;
    int v204 = 1;
    int v205 = v170 + v204;
    bool v206 = true;
    int v207 = 96;
    int v208 = 4;
    int v209 = v170 * v208;
    int v210 = v207 + v209;
    int v211 = v210 + v92;
    bool v212 = true;
    int v213 = simt_wave_count_bits(v212);
    v90[v211] = v213;
    v169 = v203;
    v170 = v205;
  }
  int v214 = 84;
  int v215 = v214 + v92;
  int v216 = v91[v215];
  int v217 = 0;
  bool v218 = v216 != v217;
  int v219;
  if (v218) {
    int v220 = 88;
    int v221 = v220 + v92;
    int v222 = v91[v221];
    uint v223 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v224 = (int)(v223);
    int v225;
    v225 = v224;
    switch (v222) {
      case 0:
        {
        int v226 = 1;
        int v227 = v92 + v226;
        v225 = v227;
      }
      default:
        {
        int v228 = 0;
        int v229 = 0;
        int v230;
        int v231;
        v230 = v228;
        v231 = v229;
        while (true) {
          int v232 = 4;
          int v233 = v231 * v232;
          int v234 = v233 + v92;
          int v235 = 92;
          int v236 = v235 + v234;
          int v237 = v91[v236];
          int v238 = 0;
          bool v239 = v237 != v238;
          v230 = v230;
          v231 = v231;
          if (!v239) break;
          int v240 = v230 + v231;
          int v241 = 1;
          int v242 = v231 + v241;
          bool v243 = true;
          v230 = v240;
          v231 = v242;
        }
        v225 = v230;
      }
      case 1:
        {
        int v244 = 112;
        int v245 = v244 + v92;
        int v246 = v91[v245];
        int v247 = 1;
        int v248 = v92 + v247;
        int v249;
        v249 = v248;
        switch (v246) {
          default:
            {
            v249 = v92;
          }
          case 0:
            {
            int v250 = 1;
            v249 = v250;
          }
          case 1:
            {
            int v251 = 4;
            v249 = v251;
            break;
          }
        }
        v225 = v249;
        break;
      }
      case 2:
        {
        int v252 = 4;
        v225 = v252;
        break;
      }
    }
    v219 = v225;
  } else {
    int v253 = 0;
    int v254 = 0;
    int v255;
    int v256;
    v255 = v253;
    v256 = v254;
    while (true) {
      int v257 = 4;
      int v258 = v256 * v257;
      int v259 = v258 + v92;
      int v260 = 116;
      int v261 = v260 + v259;
      int v262 = v91[v261];
      int v263 = 0;
      bool v264 = v262 != v263;
      v255 = v255;
      v256 = v256;
      if (!v264) break;
      int v265 = 136;
      int v266 = v265 + v92;
      int v267 = v91[v266];
      int v268 = 0;
      bool v269 = v267 != v268;
      int v270;
      if (v269) {
        int v271 = 2;
        int v272 = v92 + v271;
        v270 = v272;
      } else {
        int v273 = 3;
        int v274 = v92 + v273;
        v270 = v274;
      }
      int v275 = 112;
      int v276 = v275 + v92;
      bool v277 = true;
      int v278 = simt_wave_count_bits(v277);
      v90[v276] = v278;
      int v279 = v255 + v270;
      int v280 = 1;
      int v281 = v256 + v280;
      bool v282 = true;
      int v283 = 128;
      int v284 = 4;
      int v285 = v256 * v284;
      int v286 = v283 + v285;
      int v287 = v286 + v92;
      bool v288 = true;
      int v289 = simt_wave_count_bits(v288);
      v90[v287] = v289;
      v255 = v279;
      v256 = v281;
    }
    v219 = v255;
  }
  int v290 = 144;
  int v291 = v290 + v92;
  bool v292 = true;
  int v293 = simt_wave_count_bits(v292);
  v90[v291] = v293;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(2), static_cast<int32_t>(4), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(2), static_cast<int32_t>(4), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 148; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 140; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
