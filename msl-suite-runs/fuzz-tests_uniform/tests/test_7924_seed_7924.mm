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
  int v4 = 4;
  int v5 = v3 % v4;
  int v6 = 4;
  int v7;
  v7 = v6;
  switch (v5) {
    case 0:
      {
      int v8 = 2;
      int v9 = v3 % v8;
      int v10;
      v10 = v0;
      switch (v9) {
        default:
          {
          int v11 = 0;
          bool v12 = v2 != v11;
          int v13;
          if (v12) {
            int v14 = 4;
            v13 = v14;
          } else {
            v13 = v0;
          }
          int v15 = 0;
          int v16 = v0 + v15;
          v10 = v13;
          break;
        }
        case 0:
          {
          int v17 = 0;
          bool v18 = v2 != v17;
          int v19;
          if (v18) {
            int v20 = 0;
            v19 = v20;
          } else {
            int v21 = 0;
            int v22 = v0 + v21;
            v19 = v22;
          }
          int v23 = 4;
          int v24 = v0 + v23;
          v10 = v19;
          break;
        }
      }
      int v25 = 4;
      v7 = v10;
      break;
    }
    case 1:
      {
      int v26 = 0;
      int v27 = 0;
      int v28;
      int v29;
      v28 = v26;
      v29 = v27;
      while (true) {
        int v30 = 4;
        int v31 = v3 % v30;
        int v32 = 1;
        int v33 = v31 + v32;
        bool v34 = v29 < v33;
        v28 = v28;
        v29 = v29;
        if (!v34) break;
        int v35 = 3;
        int v36 = v3 % v35;
        int v37;
        v37 = v0;
        switch (v36) {
          case 0:
            {
            int v38 = 4;
            int v39 = v0 + v38;
            v37 = v39;
            break;
          }
          default:
            {
            int v40 = 2;
            int v41 = v0 + v40;
            v37 = v41;
          }
          case 1:
            {
            int v42 = 2;
            v37 = v42;
            break;
          }
          case 2:
            {
            int v43 = 0;
            v37 = v43;
            break;
          }
        }
        int v44 = 1;
        int v45 = v29 + v44;
        v28 = v37;
        v29 = v45;
      }
      int v46 = 4;
      v7 = v28;
      break;
    }
    default:
      {
      int v47 = 2;
      int v48 = v3 % v47;
      int v49 = 0;
      int v50 = v0 + v49;
      int v51;
      v51 = v50;
      switch (v48) {
        default:
          {
          v51 = v0;
          break;
        }
        case 0:
          {
          int v52 = 0;
          int v53 = 0;
          int v54;
          int v55;
          v54 = v52;
          v55 = v53;
          while (true) {
            int v56 = 4;
            int v57 = v3 % v56;
            int v58 = 1;
            int v59 = v57 + v58;
            bool v60 = v55 < v59;
            v54 = v54;
            v55 = v55;
            if (!v60) break;
            int v61 = 0;
            int v62 = 1;
            int v63 = v55 + v62;
            v54 = v61;
            v55 = v63;
          }
          int v64 = 2;
          int v65 = v0 + v64;
          v51 = v54;
          break;
        }
        case 1:
          {
          int v66 = 1;
          v51 = v66;
          break;
        }
      }
      int v67 = 1;
      v7 = v51;
      break;
    }
    case 2:
      {
      int v68 = 0;
      bool v69 = v2 != v68;
      int v70;
      if (v69) {
        int v71 = 4;
        int v72 = v3 % v71;
        int v73 = 4;
        int v74 = v0 + v73;
        int v75;
        v75 = v74;
        switch (v72) {
          case 0:
            {
            int v76 = 0;
            int v77 = v0 + v76;
            v75 = v77;
          }
          case 1:
            {
            int v78 = 2;
            v75 = v78;
          }
          case 2:
            {
            int v79 = 2;
            int v80 = v0 + v79;
            v75 = v80;
          }
          default:
            {
            int v81 = 4;
            v75 = v81;
            break;
          }
        }
        int v82 = 4;
        v70 = v75;
      } else {
        int v83 = 0;
        bool v84 = v2 != v83;
        int v85;
        if (v84) {
          int v86 = 1;
          int v87 = v0 + v86;
          v85 = v87;
        } else {
          v85 = v0;
        }
        v70 = v85;
      }
      int v88 = 3;
      int v89 = v0 + v88;
      v7 = v70;
      break;
    }
  }
  bool v90 = true;
  int v91 = simt_wave_count_bits(v90);
  int v92 = 0;
  int v93 = v92 + v0;
  v1[v93] = v91;
  return;
}

kernel void kernel_main(device int* v94 [[buffer(0)]], device int* v95 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v96 = static_cast<int>(__simt_tid3.x);
  int v97 = 0;
  int v98 = v97 + v96;
  int v99 = v95[v98];
  int v100 = 4;
  int v101 = v100 + v96;
  int v102 = v95[v101];
  helper0(v96, v94, v99, v102, static_cast<int>(__simt_tid3.x));
  int v103 = 8;
  int v104 = v103 + v96;
  int v105 = v95[v104];
  int v106 = 1;
  int v107;
  v107 = v106;
  switch (v105) {
    case 0:
      {
      int v108 = 1;
      v107 = v108;
      break;
    }
    case 1:
      {
      int v109 = 12;
      int v110 = v109 + v96;
      int v111 = v95[v110];
      int v112 = 0;
      bool v113 = v111 != v112;
      int v114;
      if (v113) {
        int v115 = 16;
        int v116 = v115 + v96;
        int v117 = v95[v116];
        int v118;
        v118 = v96;
        switch (v117) {
          default:
            {
            int v119 = 0;
            v118 = v119;
          }
          case 0:
            {
            v118 = v96;
            break;
          }
          case 1:
            {
            v118 = v96;
            break;
          }
        }
        bool v120 = true;
        v114 = v118;
      } else {
        int v121 = 20;
        int v122 = v121 + v96;
        int v123 = v95[v122];
        int v124 = 3;
        int v125;
        v125 = v124;
        switch (v123) {
          case 0:
            {
            int v126 = 4;
            v125 = v126;
            break;
          }
          case 1:
            {
            int v127 = 4;
            int v128 = v96 + v127;
            v125 = v128;
            break;
          }
          default:
            {
            int v129 = 2;
            v125 = v129;
            break;
          }
          case 2:
            {
            int v130 = 0;
            v125 = v130;
            break;
          }
        }
        bool v131 = true;
        v114 = v125;
      }
      v107 = v114;
      break;
    }
    case 2:
      {
      int v132 = 24;
      int v133 = v132 + v96;
      int v134 = v95[v133];
      int v135 = 0;
      bool v136 = v134 != v135;
      int v137;
      if (v136) {
        int v138 = 28;
        int v139 = v138 + v96;
        int v140 = v95[v139];
        int v141 = 0;
        bool v142 = v140 != v141;
        int v143;
        if (v142) {
          v143 = v96;
        } else {
          int v144 = 3;
          v143 = v144;
        }
        v137 = v143;
      } else {
        int v145 = 0;
        int v146 = 0;
        int v147;
        int v148;
        v147 = v145;
        v148 = v146;
        while (true) {
          int v149 = 4;
          int v150 = v148 * v149;
          int v151 = v150 + v96;
          int v152 = 32;
          int v153 = v152 + v151;
          int v154 = v95[v153];
          int v155 = 0;
          bool v156 = v154 != v155;
          v147 = v147;
          v148 = v148;
          if (!v156) break;
          int v157 = v147 + v148;
          int v158 = 1;
          int v159 = v148 + v158;
          v147 = v157;
          v148 = v159;
        }
        bool v160 = true;
        v137 = v147;
      }
      v107 = v137;
      break;
    }
    default:
      {
      int v161 = 52;
      int v162 = v161 + v96;
      int v163 = v95[v162];
      int v164 = 0;
      bool v165 = v163 != v164;
      int v166;
      if (v165) {
        int v167 = 56;
        int v168 = v167 + v96;
        int v169 = v95[v168];
        int v170 = 2;
        int v171 = v96 + v170;
        int v172;
        v172 = v171;
        switch (v169) {
          default:
            {
            int v173 = 0;
            v172 = v173;
            break;
          }
          case 0:
            {
            v172 = v96;
            break;
          }
        }
        bool v174 = true;
        v166 = v172;
      } else {
        int v175 = 0;
        int v176 = 0;
        int v177;
        int v178;
        v177 = v175;
        v178 = v176;
        while (true) {
          int v179 = 4;
          int v180 = v178 * v179;
          int v181 = v180 + v96;
          int v182 = 60;
          int v183 = v182 + v181;
          int v184 = v95[v183];
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
          continue;
          ;
        }
        bool v190 = true;
        v166 = v177;
      }
      v107 = v166;
      break;
    }
  }
  bool v191 = true;
  int v192 = 16;
  int v193 = v192 + v96;
  bool v194 = true;
  int v195 = simt_wave_count_bits(v194);
  v94[v193] = v195;
  int v196 = 0;
  int v197 = 0;
  int v198;
  int v199;
  v198 = v196;
  v199 = v197;
  while (true) {
    int v200 = 4;
    int v201 = v199 * v200;
    int v202 = v201 + v96;
    int v203 = 80;
    int v204 = v203 + v202;
    int v205 = v95[v204];
    int v206 = 0;
    bool v207 = v205 != v206;
    v198 = v198;
    v199 = v199;
    if (!v207) break;
    int v208 = 100;
    int v209 = v208 + v96;
    int v210 = v95[v209];
    int v211 = 0;
    bool v212 = v210 != v211;
    int v213;
    if (v212) {
      int v214 = 104;
      int v215 = v214 + v96;
      int v216 = v95[v215];
      uint v217 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v218 = (int)(v217);
      int v219;
      v219 = v218;
      switch (v216) {
        case 0:
          {
          int v220 = 0;
          v219 = v220;
          break;
        }
        case 1:
          {
          int v221 = 4;
          int v222 = v96 + v221;
          v219 = v222;
          break;
        }
        default:
          {
          int v223 = 2;
          v219 = v223;
          break;
        }
      }
      bool v224 = true;
      v213 = v219;
    } else {
      int v225 = 0;
      int v226 = 0;
      int v227;
      int v228;
      v227 = v225;
      v228 = v226;
      while (true) {
        int v229 = 4;
        int v230 = v228 * v229;
        int v231 = v230 + v96;
        int v232 = 108;
        int v233 = v232 + v231;
        int v234 = v95[v233];
        int v235 = 0;
        bool v236 = v234 != v235;
        v227 = v227;
        v228 = v228;
        if (!v236) break;
        int v237 = v227 + v228;
        int v238 = 1;
        int v239 = v228 + v238;
        v227 = v237;
        v228 = v239;
      }
      bool v240 = true;
      v213 = v227;
    }
    int v241 = v198 + v213;
    int v242 = 1;
    int v243 = v199 + v242;
    v198 = v241;
    v199 = v243;
  }
  bool v244 = true;
  int v245 = 32;
  int v246 = v245 + v96;
  bool v247 = true;
  int v248 = simt_wave_count_bits(v247);
  v94[v246] = v248;
  int v249 = 128;
  int v250 = v249 + v96;
  int v251 = v95[v250];
  uint v252 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v253 = (int)(v252);
  int v254;
  v254 = v253;
  switch (v251) {
    case 0:
      {
      int v255 = 2;
      int v256 = v96 + v255;
      v254 = v256;
      break;
    }
    default:
      {
      v254 = v96;
      break;
    }
    case 1:
      {
      int v257 = 132;
      int v258 = v257 + v96;
      int v259 = v95[v258];
      int v260 = 3;
      int v261 = v96 + v260;
      int v262;
      v262 = v261;
      switch (v259) {
        default:
          {
          int v263 = 136;
          int v264 = v263 + v96;
          int v265 = v95[v264];
          int v266 = 3;
          int v267 = v96 + v266;
          int v268;
          v268 = v267;
          switch (v265) {
            case 0:
              {
              v268 = v96;
              break;
            }
            default:
              {
              v268 = v96;
              break;
            }
            case 1:
              {
              int v269 = 3;
              v268 = v269;
              break;
            }
            case 2:
              {
              v268 = v96;
              break;
            }
          }
          bool v270 = true;
          v262 = v268;
          break;
        }
        case 0:
          {
          int v271 = 3;
          v262 = v271;
          break;
        }
      }
      bool v272 = true;
      v254 = v262;
      break;
    }
    case 2:
      {
      v254 = v96;
      break;
    }
  }
  bool v273 = true;
  int v274 = 48;
  int v275 = v274 + v96;
  bool v276 = true;
  int v277 = simt_wave_count_bits(v276);
  v94[v275] = v277;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 140; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
