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
  bool v7 = v2 != v6;
  int v8;
  if (v7) {
    int v9 = 0;
    int v10 = 0;
    int v11;
    int v12;
    v11 = v9;
    v12 = v10;
    while (true) {
      int v13 = 4;
      int v14 = v3 % v13;
      int v15 = 1;
      int v16 = v14 + v15;
      bool v17 = v12 < v16;
      v11 = v11;
      v12 = v12;
      if (!v17) break;
      int v18 = 0;
      bool v19 = v2 != v18;
      int v20;
      if (v19) {
        int v21 = 4;
        int v22 = v0 + v21;
        v20 = v22;
      } else {
        int v23 = 1;
        int v24 = v0 + v23;
        v20 = v24;
      }
      int v25 = 1;
      int v26 = v12 + v25;
      v11 = v20;
      v12 = v26;
    }
    uint v27 = simt_lane_id(__simt_tid);
    int v28 = (int)(v27);
    v8 = v11;
  } else {
    int v29 = 1;
    int v30 = v0 + v29;
    int v31;
    v31 = v30;
    switch (v3) {
      default:
        {
        v31 = v0;
        break;
      }
      case 0:
        {
        int v32 = 1;
        int v33 = v0 + v32;
        v31 = v33;
        break;
      }
    }
    int v34 = 4;
    v8 = v31;
  }
  bool v35 = true;
  int v36 = simt_wave_count_bits(v35);
  int v37 = 0;
  int v38 = v37 + v0;
  v1[v38] = v36;
  int v39 = 0;
  bool v40 = v2 != v39;
  int v41 = v40 ? v5 : v8;
  return;
}

kernel void kernel_main(device int* v42 [[buffer(0)]], device int* v43 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v44 = static_cast<int>(__simt_tid3.x);
  int v45 = 0;
  int v46 = v45 + v44;
  int v47 = v43[v46];
  int v48 = 4;
  int v49 = v48 + v44;
  int v50 = v43[v49];
  helper0(v44, v42, v47, v50, static_cast<int>(__simt_tid3.x));
  int v51 = 8;
  int v52 = v51 + v44;
  int v53 = v43[v52];
  int v54 = 0;
  bool v55 = v53 != v54;
  int v56;
  if (v55) {
    int v57 = 12;
    int v58 = v57 + v44;
    int v59 = v43[v58];
    int v60 = 0;
    bool v61 = v59 != v60;
    int v62;
    if (v61) {
      int v63 = 0;
      int v64 = 0;
      int v65;
      int v66;
      v65 = v63;
      v66 = v64;
      while (true) {
        int v67 = 4;
        int v68 = v66 * v67;
        int v69 = v68 + v44;
        int v70 = 16;
        int v71 = v70 + v69;
        int v72 = v43[v71];
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
      v62 = v65;
    } else {
      int v79 = 0;
      int v80 = 0;
      int v81;
      int v82;
      v81 = v79;
      v82 = v80;
      while (true) {
        int v83 = 4;
        int v84 = v82 * v83;
        int v85 = v84 + v44;
        int v86 = 36;
        int v87 = v86 + v85;
        int v88 = v43[v87];
        int v89 = 0;
        bool v90 = v88 != v89;
        v81 = v81;
        v82 = v82;
        if (!v90) break;
        int v91 = v81 + v82;
        int v92 = 1;
        int v93 = v82 + v92;
        v81 = v91;
        v82 = v93;
      }
      bool v94 = true;
      v62 = v81;
    }
    v56 = v62;
  } else {
    int v95 = 56;
    int v96 = v95 + v44;
    int v97 = v43[v96];
    uint v98 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v99 = (int)(v98);
    int v100;
    v100 = v99;
    switch (v97) {
      case 0:
        {
        int v101 = 60;
        int v102 = v101 + v44;
        int v103 = v43[v102];
        int v104 = 0;
        bool v105 = v103 != v104;
        int v106;
        if (v105) {
          int v107 = 0;
          int v108 = v44 + v107;
          v106 = v108;
        } else {
          v106 = v44;
        }
        v100 = v106;
        break;
      }
      default:
        {
        int v109 = 0;
        int v110 = 0;
        int v111;
        int v112;
        v111 = v109;
        v112 = v110;
        while (true) {
          int v113 = 4;
          int v114 = v112 * v113;
          int v115 = v114 + v44;
          int v116 = 64;
          int v117 = v116 + v115;
          int v118 = v43[v117];
          int v119 = 0;
          bool v120 = v118 != v119;
          v111 = v111;
          v112 = v112;
          if (!v120) break;
          int v121 = v111 + v112;
          int v122 = 1;
          int v123 = v112 + v122;
          v111 = v121;
          v112 = v123;
          break;
          ;
        }
        bool v124 = true;
        v100 = v111;
        break;
      }
      case 1:
        {
        int v125 = 84;
        int v126 = v125 + v44;
        int v127 = v43[v126];
        int v128;
        v128 = v44;
        switch (v127) {
          default:
            {
            int v129 = 1;
            v128 = v129;
            break;
          }
          case 0:
            {
            int v130 = 3;
            int v131 = v44 + v130;
            v128 = v131;
            break;
          }
          case 1:
            {
            v128 = v44;
            break;
          }
        }
        bool v132 = true;
        v100 = v128;
        break;
      }
      case 2:
        {
        int v133 = 0;
        int v134 = v44 + v133;
        v100 = v134;
        break;
      }
    }
    bool v135 = true;
    v56 = v100;
  }
  int v136 = 16;
  int v137 = v136 + v44;
  bool v138 = true;
  int v139 = simt_wave_count_bits(v138);
  v42[v137] = v139;
  int v140 = 88;
  int v141 = v140 + v44;
  int v142 = v43[v141];
  uint v143 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v144 = (int)(v143);
  int v145;
  v145 = v144;
  switch (v142) {
    case 0:
      {
      int v146 = 92;
      int v147 = v146 + v44;
      int v148 = v43[v147];
      int v149 = 3;
      int v150 = v44 + v149;
      int v151;
      v151 = v150;
      switch (v148) {
        case 0:
          {
          int v152 = 96;
          int v153 = v152 + v44;
          int v154 = v43[v153];
          int v155;
          v155 = v44;
          switch (v154) {
            default:
              {
              int v156 = 4;
              v155 = v156;
              break;
            }
            case 0:
              {
              int v157 = 0;
              v155 = v157;
            }
            case 1:
              {
              int v158 = 1;
              int v159 = v44 + v158;
              v155 = v159;
            }
            case 2:
              {
              v155 = v44;
              break;
            }
          }
          bool v160 = true;
          v151 = v155;
        }
        case 1:
          {
          int v161 = 0;
          int v162 = 0;
          int v163;
          int v164;
          v163 = v161;
          v164 = v162;
          while (true) {
            int v165 = 4;
            int v166 = v164 * v165;
            int v167 = v166 + v44;
            int v168 = 100;
            int v169 = v168 + v167;
            int v170 = v43[v169];
            int v171 = 0;
            bool v172 = v170 != v171;
            v163 = v163;
            v164 = v164;
            if (!v172) break;
            int v173 = v163 + v164;
            int v174 = 1;
            int v175 = v164 + v174;
            v163 = v173;
            v164 = v175;
            continue;
            ;
          }
          bool v176 = true;
          v151 = v163;
        }
        default:
          {
          int v177 = 120;
          int v178 = v177 + v44;
          int v179 = v43[v178];
          int v180 = 0;
          bool v181 = v179 != v180;
          int v182;
          if (v181) {
            v182 = v44;
          } else {
            int v183 = 1;
            int v184 = v44 + v183;
            v182 = v184;
          }
          v151 = v182;
        }
        case 2:
          {
          int v185 = 1;
          v151 = v185;
          break;
        }
      }
      bool v186 = true;
      v145 = v151;
      break;
    }
    default:
      {
      int v187 = 3;
      int v188 = v44 + v187;
      v145 = v188;
      break;
    }
  }
  bool v189 = true;
  int v190 = 32;
  int v191 = v190 + v44;
  bool v192 = true;
  int v193 = simt_wave_count_bits(v192);
  v42[v191] = v193;
  int v194 = 124;
  int v195 = v194 + v44;
  int v196 = v43[v195];
  int v197 = 1;
  int v198 = v44 + v197;
  int v199;
  v199 = v198;
  switch (v196) {
    case 0:
      {
      int v200 = 128;
      int v201 = v200 + v44;
      int v202 = v43[v201];
      int v203 = 4;
      int v204;
      v204 = v203;
      switch (v202) {
        case 0:
          {
          v204 = v44;
          break;
        }
        case 1:
          {
          int v205 = 0;
          int v206 = 0;
          int v207;
          int v208;
          v207 = v205;
          v208 = v206;
          while (true) {
            int v209 = 4;
            int v210 = v208 * v209;
            int v211 = v210 + v44;
            int v212 = 132;
            int v213 = v212 + v211;
            int v214 = v43[v213];
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
            continue;
            ;
          }
          bool v220 = true;
          v204 = v207;
          break;
        }
        default:
          {
          int v221 = 4;
          v204 = v221;
          break;
        }
      }
      bool v222 = true;
      v199 = v204;
      break;
    }
    case 1:
      {
      int v223 = 152;
      int v224 = v223 + v44;
      int v225 = v43[v224];
      int v226 = 0;
      bool v227 = v225 != v226;
      int v228;
      if (v227) {
        int v229 = 156;
        int v230 = v229 + v44;
        int v231 = v43[v230];
        int v232 = 0;
        bool v233 = v231 != v232;
        int v234;
        if (v233) {
          v234 = v44;
        } else {
          int v235 = 0;
          v234 = v235;
        }
        v228 = v234;
      } else {
        int v236 = 4;
        int v237 = v44 + v236;
        v228 = v237;
      }
      v199 = v228;
      break;
    }
    default:
      {
      int v238 = 160;
      int v239 = v238 + v44;
      int v240 = v43[v239];
      int v241 = 0;
      bool v242 = v240 != v241;
      int v243;
      if (v242) {
        int v244 = 0;
        int v245 = 0;
        int v246;
        int v247;
        v246 = v244;
        v247 = v245;
        while (true) {
          int v248 = 4;
          int v249 = v247 * v248;
          int v250 = v249 + v44;
          int v251 = 164;
          int v252 = v251 + v250;
          int v253 = v43[v252];
          int v254 = 0;
          bool v255 = v253 != v254;
          v246 = v246;
          v247 = v247;
          if (!v255) break;
          int v256 = v246 + v247;
          int v257 = 1;
          int v258 = v247 + v257;
          v246 = v256;
          v247 = v258;
        }
        bool v259 = true;
        v243 = v246;
      } else {
        int v260 = 2;
        int v261 = v44 + v260;
        v243 = v261;
      }
      v199 = v243;
      break;
    }
    case 2:
      {
      int v262 = 184;
      int v263 = v262 + v44;
      int v264 = v43[v263];
      int v265 = 1;
      int v266 = v44 + v265;
      int v267;
      v267 = v266;
      switch (v264) {
        case 0:
          {
          int v268 = 188;
          int v269 = v268 + v44;
          int v270 = v43[v269];
          int v271 = 0;
          bool v272 = v270 != v271;
          int v273;
          if (v272) {
            v273 = v44;
          } else {
            int v274 = 1;
            v273 = v274;
          }
          v267 = v273;
          break;
        }
        case 1:
          {
          int v275 = 192;
          int v276 = v275 + v44;
          int v277 = v43[v276];
          int v278;
          v278 = v44;
          switch (v277) {
            case 0:
              {
              int v279 = 0;
              v278 = v279;
              break;
            }
            default:
              {
              v278 = v44;
            }
            case 1:
              {
              int v280 = 2;
              v278 = v280;
            }
            case 2:
              {
              int v281 = 3;
              v278 = v281;
              break;
            }
          }
          bool v282 = true;
          v267 = v278;
          break;
        }
        default:
          {
          int v283 = 0;
          int v284 = 0;
          int v285;
          int v286;
          v285 = v283;
          v286 = v284;
          while (true) {
            int v287 = 4;
            int v288 = v286 * v287;
            int v289 = v288 + v44;
            int v290 = 196;
            int v291 = v290 + v289;
            int v292 = v43[v291];
            int v293 = 0;
            bool v294 = v292 != v293;
            v285 = v285;
            v286 = v286;
            if (!v294) break;
            int v295 = v285 + v286;
            int v296 = 1;
            int v297 = v286 + v296;
            v285 = v295;
            v286 = v297;
          }
          bool v298 = true;
          v267 = v285;
          break;
        }
      }
      bool v299 = true;
      v199 = v267;
      break;
    }
  }
  bool v300 = true;
  int v301 = 48;
  int v302 = v301 + v44;
  bool v303 = true;
  int v304 = simt_wave_count_bits(v303);
  v42[v302] = v304;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
