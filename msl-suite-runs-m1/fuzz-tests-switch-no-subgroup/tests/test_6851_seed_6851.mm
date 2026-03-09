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
  bool v4 = true;
  int v5 = simt_wave_count_bits(v4);
  int v6 = 0;
  int v7 = v6 + v0;
  v1[v7] = v5;
  int v8 = 0;
  int v9 = 0;
  int v10;
  int v11;
  v10 = v8;
  v11 = v9;
  while (true) {
    int v12 = 4;
    int v13 = v3 % v12;
    int v14 = 1;
    int v15 = v13 + v14;
    bool v16 = v11 < v15;
    v10 = v10;
    v11 = v11;
    if (!v16) break;
    int v17 = 0;
    int v18 = 0;
    int v19;
    int v20;
    v19 = v17;
    v20 = v18;
    while (true) {
      int v21 = 4;
      int v22 = v3 % v21;
      int v23 = 1;
      int v24 = v22 + v23;
      bool v25 = v20 < v24;
      v19 = v19;
      v20 = v20;
      if (!v25) break;
      int v26 = 3;
      int v27;
      v27 = v26;
      switch (v3) {
        default:
          {
          int v28 = 0;
          int v29 = v0 + v28;
          v27 = v29;
          break;
        }
        case 0:
          {
          int v30 = 0;
          v27 = v30;
          break;
        }
      }
      bool v31 = true;
      int v32 = simt_wave_count_bits(v31);
      int v33 = 16;
      int v34 = 4;
      int v35 = v20 * v34;
      int v36 = v33 + v35;
      int v37 = v36 + v0;
      v1[v37] = v32;
      int v38 = 1;
      int v39 = v20 + v38;
      v19 = v27;
      v20 = v39;
      continue;
      ;
    }
    int v40 = 1;
    int v41 = v11 + v40;
    v10 = v19;
    v11 = v41;
    continue;
    ;
  }
  int v42 = 0;
  bool v43 = v2 != v42;
  int v44 = v43 ? v5 : v10;
  return;
}

kernel void kernel_main(device int* v45 [[buffer(0)]], device int* v46 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v47 = static_cast<int>(__simt_tid3.x);
  int v48 = 0;
  int v49 = v48 + v47;
  int v50 = v46[v49];
  int v51 = 4;
  int v52 = v51 + v47;
  int v53 = v46[v52];
  int v54 = 0;
  bool v55 = v50 != v54;
  if (v55) {
  } else {
    int v56 = 8;
    int v57 = v56 + v47;
    int v58 = v46[v57];
    int v59 = 0;
    bool v60 = v58 != v59;
    if (v60) {
    } else {
      helper0(v47, v45, v50, v53, static_cast<int>(__simt_tid3.x));
    }
  }
  int v61 = 12;
  int v62 = v61 + v47;
  int v63 = v46[v62];
  int v64 = 0;
  bool v65 = v63 != v64;
  int v66;
  if (v65) {
    int v67 = 0;
    int v68 = 0;
    int v69;
    int v70;
    v69 = v67;
    v70 = v68;
    while (true) {
      int v71 = 4;
      int v72 = v70 * v71;
      int v73 = v72 + v47;
      int v74 = 16;
      int v75 = v74 + v73;
      int v76 = v46[v75];
      int v77 = 0;
      bool v78 = v76 != v77;
      v69 = v69;
      v70 = v70;
      if (!v78) break;
      int v79 = 36;
      int v80 = v79 + v47;
      int v81 = v46[v80];
      int v82 = 3;
      int v83 = v47 + v82;
      int v84;
      v84 = v83;
      switch (v81) {
        default:
          {
          int v85 = 4;
          v84 = v85;
          break;
        }
        case 0:
          {
          v84 = v47;
          break;
        }
      }
      int v86 = v69 + v84;
      int v87 = 1;
      int v88 = v70 + v87;
      bool v89 = true;
      int v90 = 32;
      int v91 = 4;
      int v92 = v70 * v91;
      int v93 = v90 + v92;
      int v94 = v93 + v47;
      bool v95 = true;
      int v96 = simt_wave_count_bits(v95);
      v45[v94] = v96;
      v69 = v86;
      v70 = v88;
      continue;
      ;
    }
    v66 = v69;
  } else {
    int v97 = 40;
    int v98 = v97 + v47;
    int v99 = v46[v98];
    int v100;
    v100 = v47;
    switch (v99) {
      default:
        {
        v100 = v47;
        break;
      }
      case 0:
        {
        v100 = v47;
        break;
      }
    }
    v66 = v100;
  }
  int v101 = 48;
  int v102 = v101 + v47;
  bool v103 = true;
  int v104 = simt_wave_count_bits(v103);
  v45[v102] = v104;
  int v105 = 44;
  int v106 = v105 + v47;
  int v107 = v46[v106];
  uint v108 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v109 = (int)(v108);
  int v110;
  v110 = v109;
  switch (v107) {
    default:
      {
      v110 = v47;
      break;
    }
    case 0:
      {
      int v111 = 48;
      int v112 = v111 + v47;
      int v113 = v46[v112];
      int v114 = 2;
      int v115;
      v115 = v114;
      switch (v113) {
        case 0:
          {
          int v116 = 3;
          int v117 = v47 + v116;
          v115 = v117;
          break;
        }
        default:
          {
          int v118 = 52;
          int v119 = v118 + v47;
          int v120 = v46[v119];
          int v121 = 0;
          bool v122 = v120 != v121;
          int v123;
          if (v122) {
            v123 = v47;
          } else {
            v123 = v47;
          }
          v115 = v123;
          break;
        }
        case 1:
          {
          int v124 = 0;
          int v125 = 0;
          int v126;
          int v127;
          v126 = v124;
          v127 = v125;
          while (true) {
            int v128 = 4;
            int v129 = v127 * v128;
            int v130 = v129 + v47;
            int v131 = 56;
            int v132 = v131 + v130;
            int v133 = v46[v132];
            int v134 = 0;
            bool v135 = v133 != v134;
            v126 = v126;
            v127 = v127;
            if (!v135) break;
            int v136 = v126 + v127;
            int v137 = 1;
            int v138 = v127 + v137;
            bool v139 = true;
            v126 = v136;
            v127 = v138;
          }
          v115 = v126;
          break;
        }
        case 2:
          {
          v115 = v47;
          break;
        }
      }
      v110 = v115;
      break;
    }
    case 1:
      {
      int v140 = 4;
      int v141 = v47 + v140;
      v110 = v141;
      break;
    }
    case 2:
      {
      int v142 = 76;
      int v143 = v142 + v47;
      int v144 = v46[v143];
      int v145 = 2;
      int v146;
      v146 = v145;
      switch (v144) {
        case 0:
          {
          int v147 = 80;
          int v148 = v147 + v47;
          int v149 = v46[v148];
          int v150 = 1;
          int v151;
          v151 = v150;
          switch (v149) {
            case 0:
              {
              v151 = v47;
              break;
            }
            default:
              {
              int v152 = 0;
              int v153 = v47 + v152;
              v151 = v153;
              break;
            }
            case 1:
              {
              v151 = v47;
              break;
            }
          }
          bool v154 = true;
          v146 = v151;
          break;
        }
        case 1:
          {
          int v155 = 0;
          int v156 = 0;
          int v157;
          int v158;
          v157 = v155;
          v158 = v156;
          while (true) {
            int v159 = 4;
            int v160 = v158 * v159;
            int v161 = v160 + v47;
            int v162 = 84;
            int v163 = v162 + v161;
            int v164 = v46[v163];
            int v165 = 0;
            bool v166 = v164 != v165;
            v157 = v157;
            v158 = v158;
            if (!v166) break;
            int v167 = v157 + v158;
            int v168 = 1;
            int v169 = v158 + v168;
            bool v170 = true;
            v157 = v167;
            v158 = v169;
          }
          v146 = v157;
          break;
        }
        default:
          {
          int v171 = 1;
          int v172 = v47 + v171;
          v146 = v172;
          break;
        }
        case 2:
          {
          int v173 = 104;
          int v174 = v173 + v47;
          int v175 = v46[v174];
          int v176 = 0;
          bool v177 = v175 != v176;
          int v178;
          if (v177) {
            v178 = v47;
          } else {
            int v179 = 3;
            int v180 = v47 + v179;
            v178 = v180;
          }
          v146 = v178;
          break;
        }
      }
      v110 = v146;
      break;
    }
  }
  bool v181 = true;
  int v182 = 64;
  int v183 = v182 + v47;
  bool v184 = true;
  int v185 = simt_wave_count_bits(v184);
  v45[v183] = v185;
  int v186 = 108;
  int v187 = v186 + v47;
  int v188 = v46[v187];
  int v189 = 0;
  int v190 = v47 + v189;
  int v191;
  v191 = v190;
  switch (v188) {
    case 0:
      {
      int v192 = 112;
      int v193 = v192 + v47;
      int v194 = v46[v193];
      int v195 = 0;
      bool v196 = v194 != v195;
      int v197;
      if (v196) {
        int v198 = 0;
        int v199 = 0;
        int v200;
        int v201;
        v200 = v198;
        v201 = v199;
        while (true) {
          int v202 = 4;
          int v203 = v201 * v202;
          int v204 = v203 + v47;
          int v205 = 116;
          int v206 = v205 + v204;
          int v207 = v46[v206];
          int v208 = 0;
          bool v209 = v207 != v208;
          v200 = v200;
          v201 = v201;
          if (!v209) break;
          int v210 = v200 + v201;
          int v211 = 1;
          int v212 = v201 + v211;
          bool v213 = true;
          v200 = v210;
          v201 = v212;
          break;
          ;
        }
        v197 = v200;
      } else {
        int v214 = 136;
        int v215 = v214 + v47;
        int v216 = v46[v215];
        int v217 = 0;
        bool v218 = v216 != v217;
        int v219;
        if (v218) {
          int v220 = 1;
          v219 = v220;
        } else {
          int v221 = 2;
          v219 = v221;
        }
        v197 = v219;
      }
      v191 = v197;
      break;
    }
    case 1:
      {
      int v222 = 0;
      int v223 = 0;
      int v224;
      int v225;
      v224 = v222;
      v225 = v223;
      while (true) {
        int v226 = 4;
        int v227 = v225 * v226;
        int v228 = v227 + v47;
        int v229 = 140;
        int v230 = v229 + v228;
        int v231 = v46[v230];
        int v232 = 0;
        bool v233 = v231 != v232;
        v224 = v224;
        v225 = v225;
        if (!v233) break;
        int v234 = v224 + v225;
        int v235 = 1;
        int v236 = v225 + v235;
        bool v237 = true;
        v224 = v234;
        v225 = v236;
      }
      v191 = v224;
      break;
    }
    default:
      {
      int v238 = 0;
      int v239 = 0;
      int v240;
      int v241;
      v240 = v238;
      v241 = v239;
      while (true) {
        int v242 = 4;
        int v243 = v241 * v242;
        int v244 = v243 + v47;
        int v245 = 160;
        int v246 = v245 + v244;
        int v247 = v46[v246];
        int v248 = 0;
        bool v249 = v247 != v248;
        v240 = v240;
        v241 = v241;
        if (!v249) break;
        int v250 = v240 + v241;
        int v251 = 1;
        int v252 = v241 + v251;
        bool v253 = true;
        v240 = v250;
        v241 = v252;
        break;
        ;
      }
      v191 = v240;
      break;
    }
  }
  bool v254 = true;
  int v255 = 80;
  int v256 = v255 + v47;
  bool v257 = true;
  int v258 = simt_wave_count_bits(v257);
  v45[v256] = v258;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 180; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
