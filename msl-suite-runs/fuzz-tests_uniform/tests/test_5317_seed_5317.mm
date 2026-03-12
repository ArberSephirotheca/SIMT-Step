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
  int v6 = 4;
  int v7;
  v7 = v6;
  switch (v5) {
    default:
      {
      int v8 = 2;
      int v9 = v3 % v8;
      int v10 = 0;
      int v11;
      v11 = v10;
      switch (v9) {
        default:
          {
          int v12 = 0;
          int v13 = 0;
          int v14;
          int v15;
          v14 = v12;
          v15 = v13;
          while (true) {
            int v16 = 4;
            int v17 = v3 % v16;
            int v18 = 1;
            int v19 = v17 + v18;
            bool v20 = v15 < v19;
            v14 = v14;
            v15 = v15;
            if (!v20) break;
            int v21 = 4;
            int v22 = v0 + v21;
            int v23 = 1;
            int v24 = v15 + v23;
            v14 = v22;
            v15 = v24;
          }
          int v25 = 1;
          int v26 = v0 + v25;
          v11 = v14;
        }
        case 0:
          {
          int v27 = 4;
          int v28 = v3 % v27;
          int v29 = 2;
          int v30;
          v30 = v29;
          switch (v28) {
            default:
              {
              v30 = v0;
              break;
            }
            case 0:
              {
              int v31 = 0;
              v30 = v31;
              break;
            }
            case 1:
              {
              v30 = v0;
            }
            case 2:
              {
              int v32 = 1;
              int v33 = v0 + v32;
              v30 = v33;
              break;
            }
          }
          int v34 = 3;
          int v35 = v0 + v34;
          v11 = v30;
          break;
        }
      }
      int v36 = 0;
      v7 = v11;
      break;
    }
    case 0:
      {
      int v37 = 3;
      int v38 = v3 % v37;
      int v39 = 2;
      int v40;
      v40 = v39;
      switch (v38) {
        case 0:
          {
          int v41 = 4;
          int v42 = v3 % v41;
          int v43;
          v43 = v0;
          switch (v42) {
            case 0:
              {
              v43 = v0;
            }
            default:
              {
              int v44 = 4;
              int v45 = v0 + v44;
              v43 = v45;
              break;
            }
            case 1:
              {
              v43 = v0;
            }
            case 2:
              {
              int v46 = 2;
              int v47 = v0 + v46;
              v43 = v47;
              break;
            }
          }
          v40 = v43;
        }
        case 1:
          {
          int v48 = 0;
          bool v49 = v2 != v48;
          int v50;
          if (v49) {
            int v51 = 1;
            v50 = v51;
          } else {
            v50 = v0;
          }
          int v52 = 1;
          int v53 = v0 + v52;
          v40 = v50;
          break;
        }
        default:
          {
          int v54 = 0;
          int v55 = 0;
          int v56;
          int v57;
          v56 = v54;
          v57 = v55;
          while (true) {
            int v58 = 4;
            int v59 = v3 % v58;
            int v60 = 1;
            int v61 = v59 + v60;
            bool v62 = v57 < v61;
            v56 = v56;
            v57 = v57;
            if (!v62) break;
            int v63 = 1;
            int v64 = v0 + v63;
            int v65 = 1;
            int v66 = v57 + v65;
            v56 = v64;
            v57 = v66;
          }
          int v67 = 0;
          int v68 = v0 + v67;
          v40 = v56;
          break;
        }
      }
      int v69 = 4;
      v7 = v40;
      break;
    }
    case 1:
      {
      int v70 = 0;
      bool v71 = v2 != v70;
      int v72;
      if (v71) {
        int v73 = 3;
        int v74 = v3 % v73;
        int v75;
        v75 = v0;
        switch (v74) {
          case 0:
            {
            v75 = v0;
          }
          default:
            {
            int v76 = 1;
            int v77 = v0 + v76;
            v75 = v77;
            break;
          }
          case 1:
            {
            v75 = v0;
          }
          case 2:
            {
            int v78 = 0;
            v75 = v78;
            break;
          }
        }
        int v79 = 4;
        v72 = v75;
      } else {
        v72 = v0;
      }
      v7 = v72;
      break;
    }
  }
  bool v80 = true;
  int v81 = simt_wave_count_bits(v80);
  int v82 = 0;
  int v83 = v82 + v0;
  v1[v83] = v81;
  return;
}

kernel void kernel_main(device int* v84 [[buffer(0)]], device int* v85 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v86 = static_cast<int>(__simt_tid3.x);
  int v87 = 0;
  int v88 = v87 + v86;
  int v89 = v85[v88];
  int v90 = 4;
  int v91 = v90 + v86;
  int v92 = v85[v91];
  helper0(v86, v84, v89, v92, static_cast<int>(__simt_tid3.x));
  int v93 = 8;
  int v94 = v93 + v86;
  int v95 = v85[v94];
  int v96 = 0;
  bool v97 = v95 != v96;
  int v98;
  if (v97) {
    int v99 = 12;
    int v100 = v99 + v86;
    int v101 = v85[v100];
    uint v102 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v103 = (int)(v102);
    int v104;
    v104 = v103;
    switch (v101) {
      case 0:
        {
        int v105 = 0;
        v104 = v105;
        break;
      }
      default:
        {
        int v106 = 16;
        int v107 = v106 + v86;
        int v108 = v85[v107];
        int v109 = 0;
        bool v110 = v108 != v109;
        int v111;
        if (v110) {
          int v112 = 2;
          v111 = v112;
        } else {
          v111 = v86;
        }
        v104 = v111;
        break;
      }
      case 1:
        {
        int v113 = 0;
        int v114 = 0;
        int v115;
        int v116;
        v115 = v113;
        v116 = v114;
        while (true) {
          int v117 = 4;
          int v118 = v116 * v117;
          int v119 = v118 + v86;
          int v120 = 20;
          int v121 = v120 + v119;
          int v122 = v85[v121];
          int v123 = 0;
          bool v124 = v122 != v123;
          v115 = v115;
          v116 = v116;
          if (!v124) break;
          int v125 = v115 + v116;
          int v126 = 1;
          int v127 = v116 + v126;
          v115 = v125;
          v116 = v127;
        }
        bool v128 = true;
        v104 = v115;
        break;
      }
      case 2:
        {
        int v129 = 40;
        int v130 = v129 + v86;
        int v131 = v85[v130];
        int v132 = 0;
        bool v133 = v131 != v132;
        int v134;
        if (v133) {
          v134 = v86;
        } else {
          int v135 = 1;
          int v136 = v86 + v135;
          v134 = v136;
        }
        v104 = v134;
        break;
      }
    }
    bool v137 = true;
    v98 = v104;
  } else {
    int v138 = 44;
    int v139 = v138 + v86;
    int v140 = v85[v139];
    int v141 = 2;
    int v142;
    v142 = v141;
    switch (v140) {
      default:
        {
        int v143 = 48;
        int v144 = v143 + v86;
        int v145 = v85[v144];
        int v146;
        v146 = v86;
        switch (v145) {
          default:
            {
            int v147 = 0;
            int v148 = v86 + v147;
            v146 = v148;
            break;
          }
          case 0:
            {
            v146 = v86;
            break;
          }
        }
        bool v149 = true;
        v142 = v146;
        break;
      }
      case 0:
        {
        int v150 = 0;
        int v151 = 0;
        int v152;
        int v153;
        v152 = v150;
        v153 = v151;
        while (true) {
          int v154 = 4;
          int v155 = v153 * v154;
          int v156 = v155 + v86;
          int v157 = 52;
          int v158 = v157 + v156;
          int v159 = v85[v158];
          int v160 = 0;
          bool v161 = v159 != v160;
          v152 = v152;
          v153 = v153;
          if (!v161) break;
          int v162 = v152 + v153;
          int v163 = 1;
          int v164 = v153 + v163;
          v152 = v162;
          v153 = v164;
        }
        bool v165 = true;
        v142 = v152;
        break;
      }
      case 1:
        {
        int v166 = 4;
        int v167 = v86 + v166;
        v142 = v167;
        break;
      }
    }
    bool v168 = true;
    v98 = v142;
  }
  int v169 = 16;
  int v170 = v169 + v86;
  bool v171 = true;
  int v172 = simt_wave_count_bits(v171);
  v84[v170] = v172;
  int v173 = 72;
  int v174 = v173 + v86;
  int v175 = v85[v174];
  int v176;
  v176 = v86;
  switch (v175) {
    case 0:
      {
      v176 = v86;
      break;
    }
    case 1:
      {
      int v177 = 76;
      int v178 = v177 + v86;
      int v179 = v85[v178];
      int v180 = 2;
      int v181 = v86 + v180;
      int v182;
      v182 = v181;
      switch (v179) {
        default:
          {
          int v183 = 80;
          int v184 = v183 + v86;
          int v185 = v85[v184];
          int v186 = 1;
          int v187;
          v187 = v186;
          switch (v185) {
            default:
              {
              v187 = v86;
            }
            case 0:
              {
              int v188 = 4;
              v187 = v188;
              break;
            }
          }
          bool v189 = true;
          v182 = v187;
          break;
        }
        case 0:
          {
          v182 = v86;
          break;
        }
      }
      bool v190 = true;
      v176 = v182;
      break;
    }
    default:
      {
      int v191 = 84;
      int v192 = v191 + v86;
      int v193 = v85[v192];
      int v194 = 1;
      int v195 = v86 + v194;
      int v196;
      v196 = v195;
      switch (v193) {
        case 0:
          {
          int v197 = 88;
          int v198 = v197 + v86;
          int v199 = v85[v198];
          int v200 = 0;
          bool v201 = v199 != v200;
          int v202;
          if (v201) {
            int v203 = 2;
            v202 = v203;
          } else {
            int v204 = 0;
            v202 = v204;
          }
          v196 = v202;
          break;
        }
        case 1:
          {
          int v205 = 92;
          int v206 = v205 + v86;
          int v207 = v85[v206];
          int v208 = 0;
          bool v209 = v207 != v208;
          int v210;
          if (v209) {
            v210 = v86;
          } else {
            int v211 = 2;
            v210 = v211;
          }
          v196 = v210;
          break;
        }
        default:
          {
          int v212 = 96;
          int v213 = v212 + v86;
          int v214 = v85[v213];
          int v215 = 0;
          int v216 = v86 + v215;
          int v217;
          v217 = v216;
          switch (v214) {
            default:
              {
              int v218 = 0;
              v217 = v218;
            }
            case 0:
              {
              v217 = v86;
              break;
            }
            case 1:
              {
              int v219 = 3;
              int v220 = v86 + v219;
              v217 = v220;
            }
            case 2:
              {
              int v221 = 0;
              int v222 = v86 + v221;
              v217 = v222;
              break;
            }
          }
          bool v223 = true;
          v196 = v217;
          break;
        }
      }
      bool v224 = true;
      v176 = v196;
      break;
    }
    case 2:
      {
      int v225 = 0;
      int v226 = 0;
      int v227;
      int v228;
      v227 = v225;
      v228 = v226;
      while (true) {
        int v229 = 4;
        int v230 = v228 * v229;
        int v231 = v230 + v86;
        int v232 = 100;
        int v233 = v232 + v231;
        int v234 = v85[v233];
        int v235 = 0;
        bool v236 = v234 != v235;
        v227 = v227;
        v228 = v228;
        if (!v236) break;
        int v237 = 120;
        int v238 = v237 + v86;
        int v239 = v85[v238];
        int v240 = 0;
        bool v241 = v239 != v240;
        int v242;
        if (v241) {
          int v243 = 2;
          int v244 = v86 + v243;
          v242 = v244;
        } else {
          int v245 = 4;
          int v246 = v86 + v245;
          v242 = v246;
        }
        int v247 = v227 + v242;
        int v248 = 1;
        int v249 = v228 + v248;
        v227 = v247;
        v228 = v249;
      }
      bool v250 = true;
      v176 = v227;
      break;
    }
  }
  bool v251 = true;
  int v252 = 32;
  int v253 = v252 + v86;
  bool v254 = true;
  int v255 = simt_wave_count_bits(v254);
  v84[v253] = v255;
  int v256 = 0;
  int v257 = 0;
  int v258;
  int v259;
  v258 = v256;
  v259 = v257;
  while (true) {
    int v260 = 4;
    int v261 = v259 * v260;
    int v262 = v261 + v86;
    int v263 = 124;
    int v264 = v263 + v262;
    int v265 = v85[v264];
    int v266 = 0;
    bool v267 = v265 != v266;
    v258 = v258;
    v259 = v259;
    if (!v267) break;
    int v268 = v258 + v259;
    int v269 = 1;
    int v270 = v259 + v269;
    v258 = v268;
    v259 = v270;
  }
  bool v271 = true;
  int v272 = 48;
  int v273 = v272 + v86;
  bool v274 = true;
  int v275 = simt_wave_count_bits(v274);
  v84[v273] = v275;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 144; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
