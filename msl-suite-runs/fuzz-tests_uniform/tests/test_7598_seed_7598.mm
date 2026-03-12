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
  int v5 = 0;
  int v6;
  int v7;
  v6 = v4;
  v7 = v5;
  while (true) {
    int v8 = 4;
    int v9 = v3 % v8;
    int v10 = 1;
    int v11 = v9 + v10;
    bool v12 = v7 < v11;
    v6 = v6;
    v7 = v7;
    if (!v12) break;
    int v13 = 3;
    int v14 = v0 + v13;
    int v15 = 1;
    int v16 = v7 + v15;
    v6 = v14;
    v7 = v16;
  }
  bool v17 = true;
  int v18 = simt_wave_count_bits(v17);
  int v19 = 0;
  int v20 = v19 + v0;
  v1[v20] = v18;
  int v21 = 2;
  int v22 = v3 % v21;
  int v23 = 3;
  int v24 = v0 + v23;
  int v25;
  v25 = v24;
  switch (v22) {
    case 0:
      {
      int v26 = 0;
      bool v27 = v2 != v26;
      int v28;
      if (v27) {
        int v29 = 0;
        int v30 = 0;
        int v31;
        int v32;
        v31 = v29;
        v32 = v30;
        while (true) {
          int v33 = 4;
          int v34 = v3 % v33;
          int v35 = 1;
          int v36 = v34 + v35;
          bool v37 = v32 < v36;
          v31 = v31;
          v32 = v32;
          if (!v37) break;
          int v38 = 1;
          int v39 = v32 + v38;
          v31 = v0;
          v32 = v39;
        }
        v28 = v31;
      } else {
        v28 = v0;
      }
      int v40 = 2;
      int v41 = v0 + v40;
      v25 = v28;
      break;
    }
    default:
      {
      int v42 = 0;
      int v43 = 0;
      int v44;
      int v45;
      v44 = v42;
      v45 = v43;
      while (true) {
        int v46 = 4;
        int v47 = v3 % v46;
        int v48 = 1;
        int v49 = v47 + v48;
        bool v50 = v45 < v49;
        v44 = v44;
        v45 = v45;
        if (!v50) break;
        int v51 = 0;
        int v52 = 0;
        int v53;
        int v54;
        v53 = v51;
        v54 = v52;
        while (true) {
          int v55 = 4;
          int v56 = v3 % v55;
          int v57 = 1;
          int v58 = v56 + v57;
          bool v59 = v54 < v58;
          v53 = v53;
          v54 = v54;
          if (!v59) break;
          int v60 = 0;
          int v61 = 1;
          int v62 = v54 + v61;
          v53 = v60;
          v54 = v62;
        }
        int v63 = 1;
        int v64 = v45 + v63;
        v44 = v53;
        v45 = v64;
      }
      int v65 = 4;
      int v66 = v0 + v65;
      v25 = v44;
      break;
    }
    case 1:
      {
      int v67 = 0;
      bool v68 = v2 != v67;
      int v69;
      if (v68) {
        int v70 = 3;
        int v71 = v3 % v70;
        int v72 = 1;
        int v73 = v0 + v72;
        int v74;
        v74 = v73;
        switch (v71) {
          case 0:
            {
            v74 = v0;
            break;
          }
          default:
            {
            int v75 = 4;
            int v76 = v0 + v75;
            v74 = v76;
            break;
          }
          case 1:
            {
            v74 = v0;
            break;
          }
        }
        int v77 = 2;
        int v78 = v0 + v77;
        v69 = v74;
      } else {
        int v79 = 0;
        bool v80 = v2 != v79;
        int v81;
        if (v80) {
          int v82 = 3;
          v81 = v82;
        } else {
          v81 = v0;
        }
        int v83 = 1;
        int v84 = v0 + v83;
        v69 = v81;
      }
      v25 = v69;
      break;
    }
  }
  bool v85 = true;
  int v86 = simt_wave_count_bits(v85);
  int v87 = 16;
  int v88 = v87 + v0;
  v1[v88] = v86;
  int v89 = 0;
  bool v90 = v2 != v89;
  int v91 = v90 ? v6 : v25;
  return;
}

kernel void kernel_main(device int* v92 [[buffer(0)]], device int* v93 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v94 = static_cast<int>(__simt_tid3.x);
  int v95 = 0;
  int v96 = v95 + v94;
  int v97 = v93[v96];
  int v98 = 4;
  int v99 = v98 + v94;
  int v100 = v93[v99];
  helper0(v94, v92, v97, v100, static_cast<int>(__simt_tid3.x));
  int v101 = 8;
  int v102 = v101 + v94;
  int v103 = v93[v102];
  int v104 = 0;
  bool v105 = v103 != v104;
  int v106;
  if (v105) {
    int v107 = 12;
    int v108 = v107 + v94;
    int v109 = v93[v108];
    int v110 = 0;
    bool v111 = v109 != v110;
    int v112;
    if (v111) {
      int v113 = 16;
      int v114 = v113 + v94;
      int v115 = v93[v114];
      uint v116 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v117 = (int)(v116);
      int v118;
      v118 = v117;
      switch (v115) {
        case 0:
          {
          int v119 = 4;
          v118 = v119;
          break;
        }
        default:
          {
          int v120 = 2;
          int v121 = v94 + v120;
          v118 = v121;
          break;
        }
      }
      bool v122 = true;
      v112 = v118;
    } else {
      int v123 = 20;
      int v124 = v123 + v94;
      int v125 = v93[v124];
      uint v126 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v127 = (int)(v126);
      int v128;
      v128 = v127;
      switch (v125) {
        case 0:
          {
          v128 = v94;
          break;
        }
        case 1:
          {
          v128 = v94;
          break;
        }
        case 2:
          {
          int v129 = 1;
          int v130 = v94 + v129;
          v128 = v130;
        }
        default:
          {
          int v131 = 3;
          v128 = v131;
          break;
        }
      }
      bool v132 = true;
      v112 = v128;
    }
    v106 = v112;
  } else {
    int v133 = 24;
    int v134 = v133 + v94;
    int v135 = v93[v134];
    int v136 = 0;
    bool v137 = v135 != v136;
    int v138;
    if (v137) {
      int v139 = 28;
      int v140 = v139 + v94;
      int v141 = v93[v140];
      int v142 = 0;
      bool v143 = v141 != v142;
      int v144;
      if (v143) {
        int v145 = 1;
        v144 = v145;
      } else {
        int v146 = 0;
        v144 = v146;
      }
      v138 = v144;
    } else {
      int v147 = 32;
      int v148 = v147 + v94;
      int v149 = v93[v148];
      int v150 = 0;
      bool v151 = v149 != v150;
      int v152;
      if (v151) {
        int v153 = 2;
        int v154 = v94 + v153;
        v152 = v154;
      } else {
        v152 = v94;
      }
      v138 = v152;
    }
    v106 = v138;
  }
  int v155 = 32;
  int v156 = v155 + v94;
  bool v157 = true;
  int v158 = simt_wave_count_bits(v157);
  v92[v156] = v158;
  int v159 = 36;
  int v160 = v159 + v94;
  int v161 = v93[v160];
  int v162 = 4;
  int v163 = v94 + v162;
  int v164;
  v164 = v163;
  switch (v161) {
    case 0:
      {
      int v165 = 4;
      int v166 = v94 + v165;
      v164 = v166;
      break;
    }
    case 1:
      {
      int v167 = 40;
      int v168 = v167 + v94;
      int v169 = v93[v168];
      int v170 = 3;
      int v171 = v94 + v170;
      int v172;
      v172 = v171;
      switch (v169) {
        default:
          {
          int v173 = 0;
          int v174 = 0;
          int v175;
          int v176;
          v175 = v173;
          v176 = v174;
          while (true) {
            int v177 = 4;
            int v178 = v176 * v177;
            int v179 = v178 + v94;
            int v180 = 44;
            int v181 = v180 + v179;
            int v182 = v93[v181];
            int v183 = 0;
            bool v184 = v182 != v183;
            v175 = v175;
            v176 = v176;
            if (!v184) break;
            int v185 = v175 + v176;
            int v186 = 1;
            int v187 = v176 + v186;
            v175 = v185;
            v176 = v187;
          }
          bool v188 = true;
          v172 = v175;
        }
        case 0:
          {
          int v189 = 64;
          int v190 = v189 + v94;
          int v191 = v93[v190];
          int v192 = 0;
          bool v193 = v191 != v192;
          int v194;
          if (v193) {
            int v195 = 2;
            v194 = v195;
          } else {
            int v196 = 1;
            int v197 = v94 + v196;
            v194 = v197;
          }
          v172 = v194;
          break;
        }
        case 1:
          {
          int v198 = 68;
          int v199 = v198 + v94;
          int v200 = v93[v199];
          int v201 = 0;
          int v202;
          v202 = v201;
          switch (v200) {
            default:
              {
              int v203 = 4;
              int v204 = v94 + v203;
              v202 = v204;
            }
            case 0:
              {
              int v205 = 4;
              int v206 = v94 + v205;
              v202 = v206;
              break;
            }
          }
          bool v207 = true;
          v172 = v202;
          break;
        }
      }
      bool v208 = true;
      v164 = v172;
    }
    default:
      {
      int v209 = 72;
      int v210 = v209 + v94;
      int v211 = v93[v210];
      int v212 = 0;
      bool v213 = v211 != v212;
      int v214;
      if (v213) {
        int v215 = 4;
        int v216 = v94 + v215;
        v214 = v216;
      } else {
        int v217 = 4;
        v214 = v217;
      }
      v164 = v214;
    }
    case 2:
      {
      int v218 = 0;
      int v219 = 0;
      int v220;
      int v221;
      v220 = v218;
      v221 = v219;
      while (true) {
        int v222 = 4;
        int v223 = v221 * v222;
        int v224 = v223 + v94;
        int v225 = 76;
        int v226 = v225 + v224;
        int v227 = v93[v226];
        int v228 = 0;
        bool v229 = v227 != v228;
        v220 = v220;
        v221 = v221;
        if (!v229) break;
        int v230 = 0;
        int v231 = 0;
        int v232;
        int v233;
        v232 = v230;
        v233 = v231;
        while (true) {
          int v234 = 4;
          int v235 = v233 * v234;
          int v236 = v235 + v94;
          int v237 = 96;
          int v238 = v237 + v236;
          int v239 = v93[v238];
          int v240 = 0;
          bool v241 = v239 != v240;
          v232 = v232;
          v233 = v233;
          if (!v241) break;
          int v242 = v232 + v233;
          int v243 = 1;
          int v244 = v233 + v243;
          v232 = v242;
          v233 = v244;
          break;
          ;
        }
        bool v245 = true;
        int v246 = v220 + v232;
        int v247 = 1;
        int v248 = v221 + v247;
        v220 = v246;
        v221 = v248;
        continue;
        ;
      }
      bool v249 = true;
      v164 = v220;
      break;
    }
  }
  bool v250 = true;
  int v251 = 48;
  int v252 = v251 + v94;
  bool v253 = true;
  int v254 = simt_wave_count_bits(v253);
  v92[v252] = v254;
  int v255 = 116;
  int v256 = v255 + v94;
  int v257 = v93[v256];
  uint v258 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v259 = (int)(v258);
  int v260;
  v260 = v259;
  switch (v257) {
    case 0:
      {
      int v261 = 0;
      int v262 = v94 + v261;
      v260 = v262;
      break;
    }
    default:
      {
      int v263 = 0;
      int v264 = v94 + v263;
      v260 = v264;
      break;
    }
  }
  bool v265 = true;
  int v266 = 64;
  int v267 = v266 + v94;
  bool v268 = true;
  int v269 = simt_wave_count_bits(v268);
  v92[v267] = v269;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 120; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
