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
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 2;
      int v10 = v3 % v9;
      int v11 = 1;
      int v12 = v0 + v11;
      int v13;
      v13 = v12;
      switch (v10) {
        case 0:
          {
          int v14 = 3;
          int v15 = v0 + v14;
          v13 = v15;
        }
        case 1:
          {
          v13 = v0;
          break;
        }
        default:
          {
          int v16 = 3;
          int v17 = v0 + v16;
          v13 = v17;
          break;
        }
      }
      int v18 = 1;
      v8 = v13;
      break;
    }
    case 0:
      {
      int v19 = 0;
      bool v20 = v2 != v19;
      int v21;
      if (v20) {
        int v22 = 4;
        int v23 = v3 % v22;
        int v24 = 2;
        int v25 = v0 + v24;
        int v26;
        v26 = v25;
        switch (v23) {
          default:
            {
            v26 = v0;
            break;
          }
          case 0:
            {
            int v27 = 3;
            v26 = v27;
            break;
          }
          case 1:
            {
            v26 = v0;
            break;
          }
          case 2:
            {
            v26 = v0;
            break;
          }
        }
        int v28 = 4;
        int v29 = v0 + v28;
        v21 = v26;
      } else {
        int v30 = 0;
        v21 = v30;
      }
      int v31 = 2;
      v8 = v21;
      break;
    }
    case 1:
      {
      int v32 = 0;
      bool v33 = v2 != v32;
      int v34;
      if (v33) {
        int v35 = 0;
        bool v36 = v2 != v35;
        int v37;
        if (v36) {
          int v38 = 0;
          int v39 = v0 + v38;
          v37 = v39;
        } else {
          int v40 = 4;
          int v41 = v0 + v40;
          v37 = v41;
        }
        int v42 = 0;
        int v43 = v0 + v42;
        v34 = v37;
      } else {
        int v44 = 4;
        int v45 = v0 + v44;
        v34 = v45;
      }
      int v46 = 0;
      v8 = v34;
      break;
    }
    case 2:
      {
      int v47 = 2;
      int v48 = v3 % v47;
      int v49;
      v49 = v0;
      switch (v48) {
        default:
          {
          int v50 = 3;
          int v51 = v3 % v50;
          int v52 = 2;
          int v53 = v0 + v52;
          int v54;
          v54 = v53;
          switch (v51) {
            default:
              {
              int v55 = 4;
              v54 = v55;
              break;
            }
            case 0:
              {
              int v56 = 2;
              v54 = v56;
              break;
            }
            case 1:
              {
              int v57 = 2;
              v54 = v57;
              break;
            }
            case 2:
              {
              v54 = v0;
              break;
            }
          }
          int v58 = 2;
          int v59 = v0 + v58;
          v49 = v54;
        }
        case 0:
          {
          int v60 = 0;
          int v61 = v0 + v60;
          v49 = v61;
        }
        case 1:
          {
          v49 = v0;
          break;
        }
      }
      v8 = v49;
      break;
    }
  }
  bool v62 = true;
  int v63 = simt_wave_count_bits(v62);
  int v64 = 0;
  int v65 = v64 + v0;
  v1[v65] = v63;
  return;
}

kernel void kernel_main(device int* v66 [[buffer(0)]], device int* v67 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v68 = static_cast<int>(__simt_tid3.x);
  int v69 = 0;
  int v70 = v69 + v68;
  int v71 = v67[v70];
  int v72 = 4;
  int v73 = v72 + v68;
  int v74 = v67[v73];
  helper0(v68, v66, v71, v74, static_cast<int>(__simt_tid3.x));
  int v75 = 8;
  int v76 = v75 + v68;
  int v77 = v67[v76];
  int v78;
  v78 = v68;
  switch (v77) {
    case 0:
      {
      int v79 = 3;
      v78 = v79;
    }
    case 1:
      {
      v78 = v68;
    }
    default:
      {
      int v80 = 0;
      int v81 = 0;
      int v82;
      int v83;
      v82 = v80;
      v83 = v81;
      while (true) {
        int v84 = 4;
        int v85 = v83 * v84;
        int v86 = v85 + v68;
        int v87 = 12;
        int v88 = v87 + v86;
        int v89 = v67[v88];
        int v90 = 0;
        bool v91 = v89 != v90;
        v82 = v82;
        v83 = v83;
        if (!v91) break;
        int v92 = 2;
        int v93 = v68 + v92;
        int v94 = v82 + v93;
        int v95 = 1;
        int v96 = v83 + v95;
        v82 = v94;
        v83 = v96;
        break;
        ;
      }
      bool v97 = true;
      v78 = v82;
    }
    case 2:
      {
      int v98 = 3;
      v78 = v98;
      break;
    }
  }
  bool v99 = true;
  int v100 = 16;
  int v101 = v100 + v68;
  bool v102 = true;
  int v103 = simt_wave_count_bits(v102);
  v66[v101] = v103;
  int v104 = 32;
  int v105 = v104 + v68;
  int v106 = v67[v105];
  int v107;
  v107 = v68;
  switch (v106) {
    case 0:
      {
      int v108 = 0;
      int v109 = 0;
      int v110;
      int v111;
      v110 = v108;
      v111 = v109;
      while (true) {
        int v112 = 4;
        int v113 = v111 * v112;
        int v114 = v113 + v68;
        int v115 = 36;
        int v116 = v115 + v114;
        int v117 = v67[v116];
        int v118 = 0;
        bool v119 = v117 != v118;
        v110 = v110;
        v111 = v111;
        if (!v119) break;
        int v120 = v110 + v111;
        int v121 = 1;
        int v122 = v111 + v121;
        v110 = v120;
        v111 = v122;
      }
      bool v123 = true;
      v107 = v110;
    }
    default:
      {
      int v124 = 56;
      int v125 = v124 + v68;
      int v126 = v67[v125];
      int v127;
      v127 = v68;
      switch (v126) {
        case 0:
          {
          int v128 = 60;
          int v129 = v128 + v68;
          int v130 = v67[v129];
          int v131 = 0;
          bool v132 = v130 != v131;
          int v133;
          if (v132) {
            int v134 = 4;
            v133 = v134;
          } else {
            int v135 = 2;
            v133 = v135;
          }
          v127 = v133;
          break;
        }
        case 1:
          {
          int v136 = 64;
          int v137 = v136 + v68;
          int v138 = v67[v137];
          int v139 = 3;
          int v140 = v68 + v139;
          int v141;
          v141 = v140;
          switch (v138) {
            default:
              {
              int v142 = 2;
              int v143 = v68 + v142;
              v141 = v143;
              break;
            }
            case 0:
              {
              int v144 = 3;
              v141 = v144;
              break;
            }
          }
          bool v145 = true;
          v127 = v141;
        }
        default:
          {
          int v146 = 68;
          int v147 = v146 + v68;
          int v148 = v67[v147];
          int v149 = 3;
          int v150;
          v150 = v149;
          switch (v148) {
            case 0:
              {
              int v151 = 0;
              int v152 = v68 + v151;
              v150 = v152;
              break;
            }
            default:
              {
              v150 = v68;
              break;
            }
            case 1:
              {
              v150 = v68;
              break;
            }
          }
          bool v153 = true;
          v127 = v150;
          break;
        }
      }
      bool v154 = true;
      v107 = v127;
    }
    case 1:
      {
      int v155 = 72;
      int v156 = v155 + v68;
      int v157 = v67[v156];
      int v158 = 0;
      bool v159 = v157 != v158;
      int v160;
      if (v159) {
        int v161 = 76;
        int v162 = v161 + v68;
        int v163 = v67[v162];
        int v164 = 0;
        bool v165 = v163 != v164;
        int v166;
        if (v165) {
          v166 = v68;
        } else {
          int v167 = 4;
          int v168 = v68 + v167;
          v166 = v168;
        }
        v160 = v166;
      } else {
        int v169 = 80;
        int v170 = v169 + v68;
        int v171 = v67[v170];
        int v172 = 1;
        int v173;
        v173 = v172;
        switch (v171) {
          case 0:
            {
            int v174 = 4;
            int v175 = v68 + v174;
            v173 = v175;
            break;
          }
          case 1:
            {
            int v176 = 4;
            int v177 = v68 + v176;
            v173 = v177;
            break;
          }
          default:
            {
            v173 = v68;
            break;
          }
        }
        bool v178 = true;
        v160 = v173;
      }
      v107 = v160;
    }
    case 2:
      {
      int v179 = 0;
      v107 = v179;
      break;
    }
  }
  bool v180 = true;
  int v181 = 32;
  int v182 = v181 + v68;
  bool v183 = true;
  int v184 = simt_wave_count_bits(v183);
  v66[v182] = v184;
  int v185 = 84;
  int v186 = v185 + v68;
  int v187 = v67[v186];
  int v188 = 3;
  int v189;
  v189 = v188;
  switch (v187) {
    default:
      {
      int v190 = 88;
      int v191 = v190 + v68;
      int v192 = v67[v191];
      int v193 = 0;
      bool v194 = v192 != v193;
      int v195;
      if (v194) {
        int v196 = 0;
        int v197 = 0;
        int v198;
        int v199;
        v198 = v196;
        v199 = v197;
        while (true) {
          int v200 = 4;
          int v201 = v199 * v200;
          int v202 = v201 + v68;
          int v203 = 92;
          int v204 = v203 + v202;
          int v205 = v67[v204];
          int v206 = 0;
          bool v207 = v205 != v206;
          v198 = v198;
          v199 = v199;
          if (!v207) break;
          int v208 = v198 + v199;
          int v209 = 1;
          int v210 = v199 + v209;
          v198 = v208;
          v199 = v210;
          break;
          ;
        }
        bool v211 = true;
        v195 = v198;
      } else {
        int v212 = 112;
        int v213 = v212 + v68;
        int v214 = v67[v213];
        int v215 = 0;
        bool v216 = v214 != v215;
        int v217;
        if (v216) {
          int v218 = 2;
          v217 = v218;
        } else {
          int v219 = 4;
          v217 = v219;
        }
        v195 = v217;
      }
      v189 = v195;
      break;
    }
    case 0:
      {
      int v220 = 2;
      v189 = v220;
      break;
    }
    case 1:
      {
      int v221 = 116;
      int v222 = v221 + v68;
      int v223 = v67[v222];
      int v224 = 0;
      bool v225 = v223 != v224;
      int v226;
      if (v225) {
        int v227 = 120;
        int v228 = v227 + v68;
        int v229 = v67[v228];
        int v230 = 0;
        int v231 = v68 + v230;
        int v232;
        v232 = v231;
        switch (v229) {
          default:
            {
            int v233 = 2;
            int v234 = v68 + v233;
            v232 = v234;
          }
          case 0:
            {
            v232 = v68;
            break;
          }
          case 1:
            {
            int v235 = 0;
            v232 = v235;
            break;
          }
        }
        bool v236 = true;
        v226 = v232;
      } else {
        int v237 = 124;
        int v238 = v237 + v68;
        int v239 = v67[v238];
        int v240 = 3;
        int v241 = v68 + v240;
        int v242;
        v242 = v241;
        switch (v239) {
          default:
            {
            int v243 = 3;
            int v244 = v68 + v243;
            v242 = v244;
            break;
          }
          case 0:
            {
            int v245 = 4;
            v242 = v245;
            break;
          }
        }
        bool v246 = true;
        v226 = v242;
      }
      v189 = v226;
      break;
    }
    case 2:
      {
      int v247 = 128;
      int v248 = v247 + v68;
      int v249 = v67[v248];
      int v250 = 0;
      bool v251 = v249 != v250;
      int v252;
      if (v251) {
        int v253 = 132;
        int v254 = v253 + v68;
        int v255 = v67[v254];
        int v256 = 4;
        int v257;
        v257 = v256;
        switch (v255) {
          default:
            {
            int v258 = 4;
            int v259 = v68 + v258;
            v257 = v259;
          }
          case 0:
            {
            v257 = v68;
          }
          case 1:
            {
            int v260 = 1;
            int v261 = v68 + v260;
            v257 = v261;
            break;
          }
        }
        bool v262 = true;
        v252 = v257;
      } else {
        int v263 = 136;
        int v264 = v263 + v68;
        int v265 = v67[v264];
        int v266 = 3;
        int v267;
        v267 = v266;
        switch (v265) {
          case 0:
            {
            int v268 = 3;
            v267 = v268;
            break;
          }
          case 1:
            {
            int v269 = 2;
            v267 = v269;
            break;
          }
          default:
            {
            v267 = v68;
            break;
          }
        }
        bool v270 = true;
        v252 = v267;
      }
      v189 = v252;
      break;
    }
  }
  bool v271 = true;
  int v272 = 48;
  int v273 = v272 + v68;
  bool v274 = true;
  int v275 = simt_wave_count_bits(v274);
  v66[v273] = v275;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
