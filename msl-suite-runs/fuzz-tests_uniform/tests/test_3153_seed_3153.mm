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
  uint v4 = simt_lane_id(__simt_tid);
  int v5 = (int)(v4);
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
      uint v24 = simt_lane_id(__simt_tid);
      int v25 = (int)(v24);
      int v26 = 1;
      int v27 = v18 + v26;
      v17 = v25;
      v18 = v27;
      continue;
      ;
    }
    uint v28 = simt_subgroup_id(__simt_tid);
    int v29 = (int)(v28);
    int v30 = 1;
    int v31 = v9 + v30;
    v8 = v17;
    v9 = v31;
    continue;
    ;
  }
  bool v32 = true;
  int v33 = simt_wave_count_bits(v32);
  int v34 = 0;
  int v35 = v34 + v0;
  v1[v35] = v33;
  int v36 = 0;
  bool v37 = v2 != v36;
  int v38 = v37 ? v5 : v8;
  int v39 = 0;
  bool v40 = v2 != v39;
  int v41;
  if (v40) {
    int v42 = 3;
    int v43 = v3 % v42;
    uint v44 = simt_subgroup_id(__simt_tid);
    int v45 = (int)(v44);
    int v46;
    v46 = v45;
    switch (v43) {
      case 0:
        {
        int v47 = 0;
        bool v48 = v2 != v47;
        int v49;
        if (v48) {
          v49 = v0;
        } else {
          int v50 = 4;
          int v51 = v0 + v50;
          v49 = v51;
        }
        v46 = v49;
        break;
      }
      default:
        {
        int v52 = 3;
        int v53 = v3 % v52;
        int v54 = 2;
        int v55 = v0 + v54;
        int v56;
        v56 = v55;
        switch (v53) {
          case 0:
            {
            int v57 = 4;
            int v58 = v0 + v57;
            v56 = v58;
            break;
          }
          case 1:
            {
            int v59 = 3;
            v56 = v59;
            break;
          }
          case 2:
            {
            int v60 = 0;
            int v61 = v0 + v60;
            v56 = v61;
            break;
          }
          default:
            {
            v56 = v0;
            break;
          }
        }
        v46 = v56;
        break;
      }
      case 1:
        {
        int v62 = 0;
        bool v63 = v2 != v62;
        int v64;
        if (v63) {
          int v65 = 4;
          v64 = v65;
        } else {
          int v66 = 4;
          v64 = v66;
        }
        int v67 = 2;
        int v68 = v0 + v67;
        v46 = v64;
        break;
      }
      case 2:
        {
        int v69 = 2;
        int v70 = v3 % v69;
        int v71 = 3;
        int v72;
        v72 = v71;
        switch (v70) {
          case 0:
            {
            int v73 = 0;
            int v74 = v0 + v73;
            v72 = v74;
          }
          default:
            {
            v72 = v0;
            break;
          }
          case 1:
            {
            int v75 = 0;
            v72 = v75;
            break;
          }
        }
        int v76 = 1;
        v46 = v72;
        break;
      }
    }
    v41 = v46;
  } else {
    int v77 = 0;
    bool v78 = v2 != v77;
    int v79;
    if (v78) {
      int v80 = 0;
      bool v81 = v2 != v80;
      int v82;
      if (v81) {
        uint v83 = simt_lane_id(__simt_tid);
        int v84 = (int)(v83);
        v82 = v84;
      } else {
        int v85 = 2;
        int v86 = v0 + v85;
        v82 = v86;
      }
      int v87 = 3;
      v79 = v82;
    } else {
      int v88 = 4;
      int v89 = v3 % v88;
      int v90 = 3;
      int v91 = v0 + v90;
      int v92;
      v92 = v91;
      switch (v89) {
        case 0:
          {
          v92 = v0;
          break;
        }
        case 1:
          {
          v92 = v0;
          break;
        }
        default:
          {
          int v93 = 1;
          v92 = v93;
          break;
        }
        case 2:
          {
          int v94 = 0;
          v92 = v94;
          break;
        }
      }
      int v95 = 4;
      v79 = v92;
    }
    uint v96 = simt_lane_id(__simt_tid);
    int v97 = (int)(v96);
    v41 = v79;
  }
  bool v98 = true;
  int v99 = simt_wave_count_bits(v98);
  int v100 = 16;
  int v101 = v100 + v0;
  v1[v101] = v99;
  int v102 = 0;
  bool v103 = v2 != v102;
  int v104 = v103 ? v38 : v41;
  return;
}

kernel void kernel_main(device int* v105 [[buffer(0)]], device int* v106 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v107 = static_cast<int>(__simt_tid3.x);
  int v108 = 0;
  int v109 = v108 + v107;
  int v110 = v106[v109];
  int v111 = 4;
  int v112 = v111 + v107;
  int v113 = v106[v112];
  helper0(v107, v105, v110, v113, static_cast<int>(__simt_tid3.x));
  int v114 = 8;
  int v115 = v114 + v107;
  int v116 = v106[v115];
  uint v117 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v118 = (int)(v117);
  int v119;
  v119 = v118;
  switch (v116) {
    case 0:
      {
      v119 = v107;
      break;
    }
    default:
      {
      int v120 = 12;
      int v121 = v120 + v107;
      int v122 = v106[v121];
      int v123 = 4;
      int v124 = v107 + v123;
      int v125;
      v125 = v124;
      switch (v122) {
        case 0:
          {
          int v126 = 16;
          int v127 = v126 + v107;
          int v128 = v106[v127];
          int v129;
          v129 = v107;
          switch (v128) {
            case 0:
              {
              v129 = v107;
              break;
            }
            default:
              {
              v129 = v107;
              break;
            }
            case 1:
              {
              int v130 = 1;
              int v131 = v107 + v130;
              v129 = v131;
              break;
            }
            case 2:
              {
              v129 = v107;
              break;
            }
          }
          bool v132 = true;
          v125 = v129;
        }
        default:
          {
          v125 = v107;
          break;
        }
        case 1:
          {
          int v133 = 3;
          v125 = v133;
          break;
        }
        case 2:
          {
          int v134 = 3;
          int v135 = v107 + v134;
          v125 = v135;
          break;
        }
      }
      bool v136 = true;
      v119 = v125;
      break;
    }
    case 1:
      {
      int v137 = 0;
      int v138 = 0;
      int v139;
      int v140;
      v139 = v137;
      v140 = v138;
      while (true) {
        int v141 = 4;
        int v142 = v140 * v141;
        int v143 = v142 + v107;
        int v144 = 20;
        int v145 = v144 + v143;
        int v146 = v106[v145];
        int v147 = 0;
        bool v148 = v146 != v147;
        v139 = v139;
        v140 = v140;
        if (!v148) break;
        int v149 = v139 + v140;
        int v150 = 1;
        int v151 = v140 + v150;
        v139 = v149;
        v140 = v151;
      }
      bool v152 = true;
      v119 = v139;
      break;
    }
    case 2:
      {
      int v153 = 40;
      int v154 = v153 + v107;
      int v155 = v106[v154];
      int v156 = 1;
      int v157 = v107 + v156;
      int v158;
      v158 = v157;
      switch (v155) {
        case 0:
          {
          int v159 = 0;
          int v160 = 0;
          int v161;
          int v162;
          v161 = v159;
          v162 = v160;
          while (true) {
            int v163 = 4;
            int v164 = v162 * v163;
            int v165 = v164 + v107;
            int v166 = 44;
            int v167 = v166 + v165;
            int v168 = v106[v167];
            int v169 = 0;
            bool v170 = v168 != v169;
            v161 = v161;
            v162 = v162;
            if (!v170) break;
            int v171 = v161 + v162;
            int v172 = 1;
            int v173 = v162 + v172;
            v161 = v171;
            v162 = v173;
            break;
            ;
          }
          bool v174 = true;
          v158 = v161;
        }
        default:
          {
          v158 = v107;
          break;
        }
      }
      bool v175 = true;
      v119 = v158;
      break;
    }
  }
  bool v176 = true;
  int v177 = 32;
  int v178 = v177 + v107;
  bool v179 = true;
  int v180 = simt_wave_count_bits(v179);
  v105[v178] = v180;
  int v181 = 0;
  int v182 = 0;
  int v183;
  int v184;
  v183 = v181;
  v184 = v182;
  while (true) {
    int v185 = 4;
    int v186 = v184 * v185;
    int v187 = v186 + v107;
    int v188 = 64;
    int v189 = v188 + v187;
    int v190 = v106[v189];
    int v191 = 0;
    bool v192 = v190 != v191;
    v183 = v183;
    v184 = v184;
    if (!v192) break;
    int v193 = v183 + v184;
    int v194 = 1;
    int v195 = v184 + v194;
    v183 = v193;
    v184 = v195;
  }
  bool v196 = true;
  int v197 = 48;
  int v198 = v197 + v107;
  bool v199 = true;
  int v200 = simt_wave_count_bits(v199);
  v105[v198] = v200;
  int v201 = 84;
  int v202 = v201 + v107;
  int v203 = v106[v202];
  int v204 = 0;
  bool v205 = v203 != v204;
  int v206;
  if (v205) {
    int v207 = 88;
    int v208 = v207 + v107;
    int v209 = v106[v208];
    int v210;
    v210 = v107;
    switch (v209) {
      case 0:
        {
        int v211 = 92;
        int v212 = v211 + v107;
        int v213 = v106[v212];
        int v214 = 0;
        bool v215 = v213 != v214;
        int v216;
        if (v215) {
          v216 = v107;
        } else {
          int v217 = 0;
          v216 = v217;
        }
        v210 = v216;
      }
      default:
        {
        int v218 = 96;
        int v219 = v218 + v107;
        int v220 = v106[v219];
        int v221 = 0;
        bool v222 = v220 != v221;
        int v223;
        if (v222) {
          v223 = v107;
        } else {
          int v224 = 3;
          v223 = v224;
        }
        v210 = v223;
        break;
      }
      case 1:
        {
        int v225 = 100;
        int v226 = v225 + v107;
        int v227 = v106[v226];
        int v228 = 0;
        bool v229 = v227 != v228;
        int v230;
        if (v229) {
          v230 = v107;
        } else {
          v230 = v107;
        }
        v210 = v230;
        break;
      }
      case 2:
        {
        int v231 = 104;
        int v232 = v231 + v107;
        int v233 = v106[v232];
        int v234 = 0;
        int v235 = v107 + v234;
        int v236;
        v236 = v235;
        switch (v233) {
          default:
            {
            int v237 = 3;
            v236 = v237;
            break;
          }
          case 0:
            {
            int v238 = 3;
            v236 = v238;
          }
          case 1:
            {
            v236 = v107;
            break;
          }
          case 2:
            {
            int v239 = 1;
            int v240 = v107 + v239;
            v236 = v240;
            break;
          }
        }
        bool v241 = true;
        v210 = v236;
        break;
      }
    }
    bool v242 = true;
    v206 = v210;
  } else {
    int v243 = 108;
    int v244 = v243 + v107;
    int v245 = v106[v244];
    int v246 = 0;
    int v247;
    v247 = v246;
    switch (v245) {
      case 0:
        {
        int v248 = 112;
        int v249 = v248 + v107;
        int v250 = v106[v249];
        int v251 = 1;
        int v252;
        v252 = v251;
        switch (v250) {
          case 0:
            {
            v252 = v107;
            break;
          }
          default:
            {
            int v253 = 2;
            v252 = v253;
            break;
          }
          case 1:
            {
            int v254 = 4;
            int v255 = v107 + v254;
            v252 = v255;
            break;
          }
          case 2:
            {
            v252 = v107;
            break;
          }
        }
        bool v256 = true;
        v247 = v252;
        break;
      }
      default:
        {
        int v257 = 0;
        int v258 = 0;
        int v259;
        int v260;
        v259 = v257;
        v260 = v258;
        while (true) {
          int v261 = 4;
          int v262 = v260 * v261;
          int v263 = v262 + v107;
          int v264 = 116;
          int v265 = v264 + v263;
          int v266 = v106[v265];
          int v267 = 0;
          bool v268 = v266 != v267;
          v259 = v259;
          v260 = v260;
          if (!v268) break;
          int v269 = v259 + v260;
          int v270 = 1;
          int v271 = v260 + v270;
          v259 = v269;
          v260 = v271;
          continue;
          ;
        }
        bool v272 = true;
        v247 = v259;
        break;
      }
      case 1:
        {
        int v273 = 136;
        int v274 = v273 + v107;
        int v275 = v106[v274];
        int v276 = 2;
        int v277;
        v277 = v276;
        switch (v275) {
          case 0:
            {
            int v278 = 0;
            v277 = v278;
            break;
          }
          case 1:
            {
            int v279 = 3;
            int v280 = v107 + v279;
            v277 = v280;
            break;
          }
          default:
            {
            v277 = v107;
            break;
          }
          case 2:
            {
            int v281 = 3;
            int v282 = v107 + v281;
            v277 = v282;
            break;
          }
        }
        bool v283 = true;
        v247 = v277;
        break;
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
          int v290 = v289 + v107;
          int v291 = 140;
          int v292 = v291 + v290;
          int v293 = v106[v292];
          int v294 = 0;
          bool v295 = v293 != v294;
          v286 = v286;
          v287 = v287;
          if (!v295) break;
          int v296 = v286 + v287;
          int v297 = 1;
          int v298 = v287 + v297;
          v286 = v296;
          v287 = v298;
        }
        bool v299 = true;
        v247 = v286;
        break;
      }
    }
    bool v300 = true;
    v206 = v247;
  }
  int v301 = 64;
  int v302 = v301 + v107;
  bool v303 = true;
  int v304 = simt_wave_count_bits(v303);
  v105[v302] = v304;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 160; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
