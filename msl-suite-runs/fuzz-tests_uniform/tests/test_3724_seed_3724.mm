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
  int v5 = v3 % v4;
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 3;
      int v10 = v3 % v9;
      int v11 = 4;
      int v12 = v0 + v11;
      int v13;
      v13 = v12;
      switch (v10) {
        case 0:
          {
          int v14 = 0;
          bool v15 = v2 != v14;
          int v16;
          if (v15) {
            int v17 = 2;
            v16 = v17;
          } else {
            int v18 = 2;
            int v19 = v0 + v18;
            v16 = v19;
          }
          int v20 = 2;
          v13 = v16;
        }
        default:
          {
          int v21 = 3;
          int v22 = v3 % v21;
          int v23;
          v23 = v0;
          switch (v22) {
            default:
              {
              int v24 = 3;
              v23 = v24;
              break;
            }
            case 0:
              {
              int v25 = 0;
              int v26 = v0 + v25;
              v23 = v26;
            }
            case 1:
              {
              int v27 = 3;
              int v28 = v0 + v27;
              v23 = v28;
              break;
            }
            case 2:
              {
              int v29 = 4;
              int v30 = v0 + v29;
              v23 = v30;
              break;
            }
          }
          int v31 = 4;
          v13 = v23;
        }
        case 1:
          {
          int v32 = 0;
          int v33 = 0;
          int v34;
          int v35;
          v34 = v32;
          v35 = v33;
          while (true) {
            int v36 = 4;
            int v37 = v3 % v36;
            int v38 = 1;
            int v39 = v37 + v38;
            bool v40 = v35 < v39;
            v34 = v34;
            v35 = v35;
            if (!v40) break;
            int v41 = 3;
            int v42 = v0 + v41;
            int v43 = 1;
            int v44 = v35 + v43;
            v34 = v42;
            v35 = v44;
            break;
            ;
          }
          v13 = v34;
          break;
        }
        case 2:
          {
          int v45 = 0;
          bool v46 = v2 != v45;
          int v47;
          if (v46) {
            int v48 = 2;
            int v49 = v0 + v48;
            v47 = v49;
          } else {
            v47 = v0;
          }
          int v50 = 3;
          int v51 = v0 + v50;
          v13 = v47;
          break;
        }
      }
      int v52 = 2;
      int v53 = v0 + v52;
      v8 = v13;
      break;
    }
    default:
      {
      int v54 = 0;
      bool v55 = v2 != v54;
      int v56;
      if (v55) {
        int v57 = 0;
        int v58 = 0;
        int v59;
        int v60;
        v59 = v57;
        v60 = v58;
        while (true) {
          int v61 = 4;
          int v62 = v3 % v61;
          int v63 = 1;
          int v64 = v62 + v63;
          bool v65 = v60 < v64;
          v59 = v59;
          v60 = v60;
          if (!v65) break;
          int v66 = 1;
          int v67 = v60 + v66;
          v59 = v0;
          v60 = v67;
        }
        int v68 = 3;
        int v69 = v0 + v68;
        v56 = v59;
      } else {
        int v70 = 3;
        int v71 = v0 + v70;
        v56 = v71;
      }
      int v72 = 1;
      v8 = v56;
      break;
    }
    case 1:
      {
      int v73 = 1;
      int v74 = v0 + v73;
      int v75;
      v75 = v74;
      switch (v3) {
        default:
          {
          int v76 = 0;
          bool v77 = v2 != v76;
          int v78;
          if (v77) {
            int v79 = 1;
            v78 = v79;
          } else {
            int v80 = 2;
            v78 = v80;
          }
          v75 = v78;
          break;
        }
        case 0:
          {
          int v81 = 0;
          bool v82 = v2 != v81;
          int v83;
          if (v82) {
            int v84 = 2;
            int v85 = v0 + v84;
            v83 = v85;
          } else {
            int v86 = 4;
            int v87 = v0 + v86;
            v83 = v87;
          }
          int v88 = 2;
          v75 = v83;
          break;
        }
      }
      int v89 = 2;
      v8 = v75;
      break;
    }
    case 2:
      {
      int v90 = 0;
      bool v91 = v2 != v90;
      int v92;
      if (v91) {
        int v93 = 4;
        int v94 = v0 + v93;
        int v95;
        v95 = v94;
        switch (v3) {
          case 0:
            {
            int v96 = 2;
            v95 = v96;
            break;
          }
          default:
            {
            int v97 = 0;
            int v98 = v0 + v97;
            v95 = v98;
            break;
          }
        }
        int v99 = 4;
        int v100 = v0 + v99;
        v92 = v95;
      } else {
        int v101 = 3;
        int v102 = v3 % v101;
        int v103 = 2;
        int v104 = v0 + v103;
        int v105;
        v105 = v104;
        switch (v102) {
          default:
            {
            int v106 = 0;
            v105 = v106;
            break;
          }
          case 0:
            {
            v105 = v0;
            break;
          }
          case 1:
            {
            v105 = v0;
            break;
          }
        }
        v92 = v105;
      }
      int v107 = 0;
      int v108 = v0 + v107;
      v8 = v92;
      break;
    }
  }
  bool v109 = true;
  int v110 = simt_wave_count_bits(v109);
  int v111 = 0;
  int v112 = v111 + v0;
  v1[v112] = v110;
  return;
}

kernel void kernel_main(device int* v113 [[buffer(0)]], device int* v114 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v115 = static_cast<int>(__simt_tid3.x);
  int v116 = 0;
  int v117 = v116 + v115;
  int v118 = v114[v117];
  int v119 = 4;
  int v120 = v119 + v115;
  int v121 = v114[v120];
  helper0(v115, v113, v118, v121, static_cast<int>(__simt_tid3.x));
  int v122 = 0;
  int v123 = 0;
  int v124;
  int v125;
  v124 = v122;
  v125 = v123;
  while (true) {
    int v126 = 4;
    int v127 = v125 * v126;
    int v128 = v127 + v115;
    int v129 = 8;
    int v130 = v129 + v128;
    int v131 = v114[v130];
    int v132 = 0;
    bool v133 = v131 != v132;
    v124 = v124;
    v125 = v125;
    if (!v133) break;
    int v134 = v124 + v125;
    int v135 = 1;
    int v136 = v125 + v135;
    v124 = v134;
    v125 = v136;
    break;
    ;
  }
  bool v137 = true;
  int v138 = 16;
  int v139 = v138 + v115;
  bool v140 = true;
  int v141 = simt_wave_count_bits(v140);
  v113[v139] = v141;
  int v142 = 28;
  int v143 = v142 + v115;
  int v144 = v114[v143];
  int v145 = 3;
  int v146;
  v146 = v145;
  switch (v144) {
    case 0:
      {
      int v147 = 32;
      int v148 = v147 + v115;
      int v149 = v114[v148];
      int v150 = 2;
      int v151;
      v151 = v150;
      switch (v149) {
        case 0:
          {
          int v152 = 4;
          v151 = v152;
          break;
        }
        default:
          {
          int v153 = 36;
          int v154 = v153 + v115;
          int v155 = v114[v154];
          int v156;
          v156 = v115;
          switch (v155) {
            case 0:
              {
              int v157 = 0;
              int v158 = v115 + v157;
              v156 = v158;
            }
            default:
              {
              v156 = v115;
              break;
            }
          }
          bool v159 = true;
          v151 = v156;
          break;
        }
        case 1:
          {
          int v160 = 0;
          int v161 = 0;
          int v162;
          int v163;
          v162 = v160;
          v163 = v161;
          while (true) {
            int v164 = 4;
            int v165 = v163 * v164;
            int v166 = v165 + v115;
            int v167 = 40;
            int v168 = v167 + v166;
            int v169 = v114[v168];
            int v170 = 0;
            bool v171 = v169 != v170;
            v162 = v162;
            v163 = v163;
            if (!v171) break;
            int v172 = v162 + v163;
            int v173 = 1;
            int v174 = v163 + v173;
            v162 = v172;
            v163 = v174;
          }
          bool v175 = true;
          v151 = v162;
          break;
        }
      }
      bool v176 = true;
      v146 = v151;
      break;
    }
    case 1:
      {
      v146 = v115;
      break;
    }
    case 2:
      {
      int v177 = 0;
      int v178 = 0;
      int v179;
      int v180;
      v179 = v177;
      v180 = v178;
      while (true) {
        int v181 = 4;
        int v182 = v180 * v181;
        int v183 = v182 + v115;
        int v184 = 60;
        int v185 = v184 + v183;
        int v186 = v114[v185];
        int v187 = 0;
        bool v188 = v186 != v187;
        v179 = v179;
        v180 = v180;
        if (!v188) break;
        int v189 = v179 + v180;
        int v190 = 1;
        int v191 = v180 + v190;
        v179 = v189;
        v180 = v191;
        continue;
        ;
      }
      bool v192 = true;
      v146 = v179;
      break;
    }
    default:
      {
      int v193 = 0;
      int v194 = 0;
      int v195;
      int v196;
      v195 = v193;
      v196 = v194;
      while (true) {
        int v197 = 4;
        int v198 = v196 * v197;
        int v199 = v198 + v115;
        int v200 = 80;
        int v201 = v200 + v199;
        int v202 = v114[v201];
        int v203 = 0;
        bool v204 = v202 != v203;
        v195 = v195;
        v196 = v196;
        if (!v204) break;
        int v205 = 0;
        int v206 = 0;
        int v207;
        int v208;
        v207 = v205;
        v208 = v206;
        while (true) {
          int v209 = 4;
          int v210 = v208 * v209;
          int v211 = v210 + v115;
          int v212 = 100;
          int v213 = v212 + v211;
          int v214 = v114[v213];
          int v215 = 0;
          bool v216 = v214 != v215;
          v207 = v207;
          v208 = v208;
          if (!v216) break;
          int v217 = v207 + v208;
          int v218 = 1;
          int v219 = v208 + v218;
          v207 = v217;
          v208 = v219;
        }
        bool v220 = true;
        int v221 = v195 + v207;
        int v222 = 1;
        int v223 = v196 + v222;
        v195 = v221;
        v196 = v223;
        break;
        ;
      }
      bool v224 = true;
      v146 = v195;
      break;
    }
  }
  bool v225 = true;
  int v226 = 32;
  int v227 = v226 + v115;
  bool v228 = true;
  int v229 = simt_wave_count_bits(v228);
  v113[v227] = v229;
  int v230 = 0;
  int v231 = 0;
  int v232;
  int v233;
  v232 = v230;
  v233 = v231;
  while (true) {
    int v234 = 4;
    int v235 = v233 * v234;
    int v236 = v235 + v115;
    int v237 = 120;
    int v238 = v237 + v236;
    int v239 = v114[v238];
    int v240 = 0;
    bool v241 = v239 != v240;
    v232 = v232;
    v233 = v233;
    if (!v241) break;
    int v242 = 140;
    int v243 = v242 + v115;
    int v244 = v114[v243];
    int v245 = 0;
    bool v246 = v244 != v245;
    int v247;
    if (v246) {
      int v248 = 144;
      int v249 = v248 + v115;
      int v250 = v114[v249];
      int v251 = 0;
      bool v252 = v250 != v251;
      int v253;
      if (v252) {
        int v254 = 1;
        int v255 = v115 + v254;
        v253 = v255;
      } else {
        int v256 = 2;
        int v257 = v115 + v256;
        v253 = v257;
      }
      v247 = v253;
    } else {
      int v258 = 0;
      int v259 = 0;
      int v260;
      int v261;
      v260 = v258;
      v261 = v259;
      while (true) {
        int v262 = 4;
        int v263 = v261 * v262;
        int v264 = v263 + v115;
        int v265 = 148;
        int v266 = v265 + v264;
        int v267 = v114[v266];
        int v268 = 0;
        bool v269 = v267 != v268;
        v260 = v260;
        v261 = v261;
        if (!v269) break;
        int v270 = v260 + v261;
        int v271 = 1;
        int v272 = v261 + v271;
        v260 = v270;
        v261 = v272;
        continue;
        ;
      }
      bool v273 = true;
      v247 = v260;
    }
    int v274 = v232 + v247;
    int v275 = 1;
    int v276 = v233 + v275;
    v232 = v274;
    v233 = v276;
  }
  bool v277 = true;
  int v278 = 48;
  int v279 = v278 + v115;
  bool v280 = true;
  int v281 = simt_wave_count_bits(v280);
  v113[v279] = v281;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 168; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
