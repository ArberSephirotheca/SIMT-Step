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
  uint v4 = simt_subgroup_id(__simt_tid);
  int v5 = (int)(v4);
  int v6 = 2;
  int v7 = v3 % v6;
  uint v8 = simt_lane_id(__simt_tid);
  int v9 = (int)(v8);
  int v10;
  v10 = v9;
  switch (v7) {
    case 0:
      {
      int v11 = 0;
      int v12 = 0;
      int v13;
      int v14;
      v13 = v11;
      v14 = v12;
      while (true) {
        int v15 = 4;
        int v16 = v3 % v15;
        int v17 = 1;
        int v18 = v16 + v17;
        bool v19 = v14 < v18;
        v13 = v13;
        v14 = v14;
        if (!v19) break;
        int v20 = 0;
        int v21 = 0;
        int v22;
        int v23;
        v22 = v20;
        v23 = v21;
        while (true) {
          int v24 = 4;
          int v25 = v3 % v24;
          int v26 = 1;
          int v27 = v25 + v26;
          bool v28 = v23 < v27;
          v22 = v22;
          v23 = v23;
          if (!v28) break;
          int v29 = 4;
          int v30 = 1;
          int v31 = v23 + v30;
          v22 = v29;
          v23 = v31;
          break;
          ;
        }
        int v32 = 1;
        int v33 = v0 + v32;
        int v34 = 1;
        int v35 = v14 + v34;
        v13 = v22;
        v14 = v35;
      }
      int v36 = 0;
      v10 = v13;
      break;
    }
    case 1:
      {
      int v37 = 2;
      int v38 = v3 % v37;
      int v39 = 0;
      int v40;
      v40 = v39;
      switch (v38) {
        case 0:
          {
          int v41 = 0;
          bool v42 = v2 != v41;
          int v43;
          if (v42) {
            v43 = v0;
          } else {
            v43 = v0;
          }
          v40 = v43;
          break;
        }
        case 1:
          {
          int v44 = 1;
          v40 = v44;
          break;
        }
        default:
          {
          int v45 = 0;
          int v46 = 0;
          int v47;
          int v48;
          v47 = v45;
          v48 = v46;
          while (true) {
            int v49 = 4;
            int v50 = v3 % v49;
            int v51 = 1;
            int v52 = v50 + v51;
            bool v53 = v48 < v52;
            v47 = v47;
            v48 = v48;
            if (!v53) break;
            int v54 = 3;
            int v55 = 1;
            int v56 = v48 + v55;
            v47 = v54;
            v48 = v56;
          }
          v40 = v47;
          break;
        }
      }
      int v57 = 1;
      v10 = v40;
      break;
    }
    default:
      {
      int v58 = 0;
      bool v59 = v2 != v58;
      int v60;
      if (v59) {
        int v61 = 0;
        bool v62 = v2 != v61;
        int v63;
        if (v62) {
          v63 = v0;
        } else {
          int v64 = 1;
          v63 = v64;
        }
        v60 = v63;
      } else {
        int v65 = 2;
        int v66 = v0 + v65;
        v60 = v66;
      }
      v10 = v60;
      break;
    }
  }
  bool v67 = true;
  int v68 = simt_wave_count_bits(v67);
  int v69 = 0;
  int v70 = v69 + v0;
  v1[v70] = v68;
  int v71 = 0;
  bool v72 = v2 != v71;
  int v73 = v72 ? v5 : v10;
  return;
}

kernel void kernel_main(device int* v74 [[buffer(0)]], device int* v75 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v76 = static_cast<int>(__simt_tid3.x);
  int v77 = 0;
  int v78 = v77 + v76;
  int v79 = v75[v78];
  int v80 = 4;
  int v81 = v80 + v76;
  int v82 = v75[v81];
  helper0(v76, v74, v79, v82, static_cast<int>(__simt_tid3.x));
  int v83 = 8;
  int v84 = v83 + v76;
  int v85 = v75[v84];
  int v86;
  v86 = v76;
  switch (v85) {
    case 0:
      {
      int v87 = 12;
      int v88 = v87 + v76;
      int v89 = v75[v88];
      int v90 = 0;
      int v91;
      v91 = v90;
      switch (v89) {
        case 0:
          {
          int v92 = 4;
          int v93 = v76 + v92;
          v91 = v93;
          break;
        }
        default:
          {
          int v94 = 0;
          int v95 = 0;
          int v96;
          int v97;
          v96 = v94;
          v97 = v95;
          while (true) {
            int v98 = 4;
            int v99 = v97 * v98;
            int v100 = v99 + v76;
            int v101 = 16;
            int v102 = v101 + v100;
            int v103 = v75[v102];
            int v104 = 0;
            bool v105 = v103 != v104;
            v96 = v96;
            v97 = v97;
            if (!v105) break;
            int v106 = v96 + v97;
            int v107 = 1;
            int v108 = v97 + v107;
            v96 = v106;
            v97 = v108;
          }
          bool v109 = true;
          v91 = v96;
          break;
        }
      }
      bool v110 = true;
      v86 = v91;
      break;
    }
    default:
      {
      int v111 = 36;
      int v112 = v111 + v76;
      int v113 = v75[v112];
      int v114 = 4;
      int v115;
      v115 = v114;
      switch (v113) {
        default:
          {
          int v116 = 40;
          int v117 = v116 + v76;
          int v118 = v75[v117];
          int v119 = 0;
          bool v120 = v118 != v119;
          int v121;
          if (v120) {
            int v122 = 1;
            int v123 = v76 + v122;
            v121 = v123;
          } else {
            v121 = v76;
          }
          v115 = v121;
          break;
        }
        case 0:
          {
          int v124 = 44;
          int v125 = v124 + v76;
          int v126 = v75[v125];
          int v127 = 0;
          bool v128 = v126 != v127;
          int v129;
          if (v128) {
            int v130 = 1;
            int v131 = v76 + v130;
            v129 = v131;
          } else {
            int v132 = 4;
            int v133 = v76 + v132;
            v129 = v133;
          }
          v115 = v129;
          break;
        }
      }
      bool v134 = true;
      v86 = v115;
    }
    case 1:
      {
      int v135 = 48;
      int v136 = v135 + v76;
      int v137 = v75[v136];
      int v138 = 2;
      int v139 = v76 + v138;
      int v140;
      v140 = v139;
      switch (v137) {
        case 0:
          {
          int v141 = 52;
          int v142 = v141 + v76;
          int v143 = v75[v142];
          int v144 = 2;
          int v145;
          v145 = v144;
          switch (v143) {
            default:
              {
              int v146 = 1;
              int v147 = v76 + v146;
              v145 = v147;
              break;
            }
            case 0:
              {
              v145 = v76;
              break;
            }
          }
          bool v148 = true;
          v140 = v145;
          break;
        }
        default:
          {
          int v149 = 0;
          int v150 = 0;
          int v151;
          int v152;
          v151 = v149;
          v152 = v150;
          while (true) {
            int v153 = 4;
            int v154 = v152 * v153;
            int v155 = v154 + v76;
            int v156 = 56;
            int v157 = v156 + v155;
            int v158 = v75[v157];
            int v159 = 0;
            bool v160 = v158 != v159;
            v151 = v151;
            v152 = v152;
            if (!v160) break;
            int v161 = v151 + v152;
            int v162 = 1;
            int v163 = v152 + v162;
            v151 = v161;
            v152 = v163;
            continue;
            ;
          }
          bool v164 = true;
          v140 = v151;
          break;
        }
      }
      bool v165 = true;
      v86 = v140;
    }
    case 2:
      {
      int v166 = 76;
      int v167 = v166 + v76;
      int v168 = v75[v167];
      int v169 = 0;
      bool v170 = v168 != v169;
      int v171;
      if (v170) {
        int v172 = 0;
        int v173 = 0;
        int v174;
        int v175;
        v174 = v172;
        v175 = v173;
        while (true) {
          int v176 = 4;
          int v177 = v175 * v176;
          int v178 = v177 + v76;
          int v179 = 80;
          int v180 = v179 + v178;
          int v181 = v75[v180];
          int v182 = 0;
          bool v183 = v181 != v182;
          v174 = v174;
          v175 = v175;
          if (!v183) break;
          int v184 = v174 + v175;
          int v185 = 1;
          int v186 = v175 + v185;
          v174 = v184;
          v175 = v186;
        }
        bool v187 = true;
        v171 = v174;
      } else {
        int v188 = 0;
        int v189 = 0;
        int v190;
        int v191;
        v190 = v188;
        v191 = v189;
        while (true) {
          int v192 = 4;
          int v193 = v191 * v192;
          int v194 = v193 + v76;
          int v195 = 100;
          int v196 = v195 + v194;
          int v197 = v75[v196];
          int v198 = 0;
          bool v199 = v197 != v198;
          v190 = v190;
          v191 = v191;
          if (!v199) break;
          int v200 = v190 + v191;
          int v201 = 1;
          int v202 = v191 + v201;
          v190 = v200;
          v191 = v202;
        }
        bool v203 = true;
        v171 = v190;
      }
      v86 = v171;
      break;
    }
  }
  bool v204 = true;
  int v205 = 16;
  int v206 = v205 + v76;
  bool v207 = true;
  int v208 = simt_wave_count_bits(v207);
  v74[v206] = v208;
  int v209 = 120;
  int v210 = v209 + v76;
  int v211 = v75[v210];
  uint v212 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v213 = (int)(v212);
  int v214;
  v214 = v213;
  switch (v211) {
    default:
      {
      v214 = v76;
      break;
    }
    case 0:
      {
      int v215 = 124;
      int v216 = v215 + v76;
      int v217 = v75[v216];
      int v218 = 0;
      bool v219 = v217 != v218;
      int v220;
      if (v219) {
        int v221 = 0;
        int v222 = 0;
        int v223;
        int v224;
        v223 = v221;
        v224 = v222;
        while (true) {
          int v225 = 4;
          int v226 = v224 * v225;
          int v227 = v226 + v76;
          int v228 = 128;
          int v229 = v228 + v227;
          int v230 = v75[v229];
          int v231 = 0;
          bool v232 = v230 != v231;
          v223 = v223;
          v224 = v224;
          if (!v232) break;
          int v233 = v223 + v224;
          int v234 = 1;
          int v235 = v224 + v234;
          v223 = v233;
          v224 = v235;
        }
        bool v236 = true;
        v220 = v223;
      } else {
        int v237 = 4;
        int v238 = v76 + v237;
        v220 = v238;
      }
      v214 = v220;
      break;
    }
    case 1:
      {
      int v239 = 0;
      int v240 = 0;
      int v241;
      int v242;
      v241 = v239;
      v242 = v240;
      while (true) {
        int v243 = 4;
        int v244 = v242 * v243;
        int v245 = v244 + v76;
        int v246 = 148;
        int v247 = v246 + v245;
        int v248 = v75[v247];
        int v249 = 0;
        bool v250 = v248 != v249;
        v241 = v241;
        v242 = v242;
        if (!v250) break;
        int v251 = v241 + v242;
        int v252 = 1;
        int v253 = v242 + v252;
        v241 = v251;
        v242 = v253;
      }
      bool v254 = true;
      v214 = v241;
      break;
    }
  }
  bool v255 = true;
  int v256 = 32;
  int v257 = v256 + v76;
  bool v258 = true;
  int v259 = simt_wave_count_bits(v258);
  v74[v257] = v259;
  int v260 = 168;
  int v261 = v260 + v76;
  int v262 = v75[v261];
  int v263 = 0;
  bool v264 = v262 != v263;
  int v265;
  if (v264) {
    uint v266 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v267 = (int)(v266);
    v265 = v267;
  } else {
    v265 = v76;
  }
  int v268 = 48;
  int v269 = v268 + v76;
  bool v270 = true;
  int v271 = simt_wave_count_bits(v270);
  v74[v269] = v271;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 172; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
