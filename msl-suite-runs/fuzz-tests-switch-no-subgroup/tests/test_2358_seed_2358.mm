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
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 0;
      bool v10 = v2 != v9;
      int v11;
      if (v10) {
        v11 = v0;
      } else {
        int v12 = 2;
        int v13 = v3 % v12;
        int v14 = 2;
        int v15;
        v15 = v14;
        switch (v13) {
          default:
            {
            int v16 = 0;
            int v17 = v0 + v16;
            v15 = v17;
            break;
          }
          case 0:
            {
            int v18 = 3;
            v15 = v18;
            break;
          }
        }
        v11 = v15;
      }
      v8 = v11;
      break;
    }
    case 0:
      {
      int v19 = 0;
      int v20 = 0;
      int v21;
      int v22;
      v21 = v19;
      v22 = v20;
      while (true) {
        int v23 = 4;
        int v24 = v3 % v23;
        int v25 = 1;
        int v26 = v24 + v25;
        bool v27 = v22 < v26;
        v21 = v21;
        v22 = v22;
        if (!v27) break;
        int v28 = 3;
        int v29 = v3 % v28;
        int v30 = 4;
        int v31 = v0 + v30;
        int v32;
        v32 = v31;
        switch (v29) {
          case 0:
            {
            v32 = v0;
            break;
          }
          case 1:
            {
            v32 = v0;
            break;
          }
          default:
            {
            int v33 = 3;
            v32 = v33;
            break;
          }
          case 2:
            {
            int v34 = 1;
            v32 = v34;
            break;
          }
        }
        int v35 = 1;
        int v36 = v22 + v35;
        v21 = v32;
        v22 = v36;
      }
      v8 = v21;
      break;
    }
    case 1:
      {
      v8 = v0;
      break;
    }
    case 2:
      {
      int v37 = 4;
      int v38 = v3 % v37;
      int v39 = 1;
      int v40 = v0 + v39;
      int v41;
      v41 = v40;
      switch (v38) {
        case 0:
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
            int v51 = 2;
            int v52 = v0 + v51;
            int v53 = 1;
            int v54 = v45 + v53;
            v44 = v52;
            v45 = v54;
            continue;
            ;
          }
          v41 = v44;
          break;
        }
        case 1:
          {
          v41 = v0;
          break;
        }
        case 2:
          {
          int v55 = 0;
          int v56 = 0;
          int v57;
          int v58;
          v57 = v55;
          v58 = v56;
          while (true) {
            int v59 = 4;
            int v60 = v3 % v59;
            int v61 = 1;
            int v62 = v60 + v61;
            bool v63 = v58 < v62;
            v57 = v57;
            v58 = v58;
            if (!v63) break;
            int v64 = 3;
            int v65 = 1;
            int v66 = v58 + v65;
            v57 = v64;
            v58 = v66;
            break;
            ;
          }
          v41 = v57;
          break;
        }
        default:
          {
          int v67 = 0;
          int v68 = 0;
          int v69;
          int v70;
          v69 = v67;
          v70 = v68;
          while (true) {
            int v71 = 4;
            int v72 = v3 % v71;
            int v73 = 1;
            int v74 = v72 + v73;
            bool v75 = v70 < v74;
            v69 = v69;
            v70 = v70;
            if (!v75) break;
            int v76 = 4;
            int v77 = 1;
            int v78 = v70 + v77;
            v69 = v76;
            v70 = v78;
          }
          v41 = v69;
          break;
        }
      }
      v8 = v41;
      break;
    }
  }
  bool v79 = true;
  int v80 = simt_wave_count_bits(v79);
  int v81 = 0;
  int v82 = v81 + v0;
  v1[v82] = v80;
  return;
}

kernel void kernel_main(device int* v83 [[buffer(0)]], device int* v84 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v85 = static_cast<int>(__simt_tid3.x);
  int v86 = 0;
  int v87 = v86 + v85;
  int v88 = v84[v87];
  int v89 = 4;
  int v90 = v89 + v85;
  int v91 = v84[v90];
  int v92 = 0;
  bool v93 = v88 != v92;
  if (v93) {
  } else {
    int v94 = 0;
    int v95 = 0;
    int v96;
    int v97;
    v96 = v94;
    v97 = v95;
    while (true) {
      int v98 = 2;
      bool v99 = v97 < v98;
      v96 = v96;
      v97 = v97;
      if (!v99) break;
      helper0(v85, v83, v88, v91, static_cast<int>(__simt_tid3.x));
      int v100 = 1;
      int v101 = v97 + v100;
      v96 = v96;
      v97 = v101;
    }
  }
  int v102 = 8;
  int v103 = v102 + v85;
  int v104 = v84[v103];
  uint v105 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v106 = (int)(v105);
  int v107;
  v107 = v106;
  switch (v104) {
    case 0:
      {
      int v108 = 2;
      int v109 = v85 + v108;
      v107 = v109;
      break;
    }
    case 1:
      {
      int v110 = 12;
      int v111 = v110 + v85;
      int v112 = v84[v111];
      int v113;
      v113 = v85;
      switch (v112) {
        default:
          {
          int v114 = 16;
          int v115 = v114 + v85;
          int v116 = v84[v115];
          int v117 = 0;
          bool v118 = v116 != v117;
          int v119;
          if (v118) {
            int v120 = 1;
            v119 = v120;
          } else {
            v119 = v85;
          }
          v113 = v119;
          break;
        }
        case 0:
          {
          int v121 = 20;
          int v122 = v121 + v85;
          int v123 = v84[v122];
          int v124 = 1;
          int v125 = v85 + v124;
          int v126;
          v126 = v125;
          switch (v123) {
            case 0:
              {
              int v127 = 0;
              v126 = v127;
              break;
            }
            case 1:
              {
              int v128 = 2;
              int v129 = v85 + v128;
              v126 = v129;
              break;
            }
            case 2:
              {
              v126 = v85;
              break;
            }
            default:
              {
              v126 = v85;
              break;
            }
          }
          v113 = v126;
          break;
        }
        case 1:
          {
          int v130 = 24;
          int v131 = v130 + v85;
          int v132 = v84[v131];
          int v133 = 0;
          bool v134 = v132 != v133;
          int v135;
          if (v134) {
            int v136 = 3;
            v135 = v136;
          } else {
            int v137 = 2;
            int v138 = v85 + v137;
            v135 = v138;
          }
          v113 = v135;
          break;
        }
        case 2:
          {
          int v139 = 28;
          int v140 = v139 + v85;
          int v141 = v84[v140];
          int v142 = 0;
          bool v143 = v141 != v142;
          int v144;
          if (v143) {
            int v145 = 0;
            v144 = v145;
          } else {
            int v146 = 1;
            v144 = v146;
          }
          v113 = v144;
          break;
        }
      }
      v107 = v113;
      break;
    }
    case 2:
      {
      int v147 = 32;
      int v148 = v147 + v85;
      int v149 = v84[v148];
      int v150;
      v150 = v85;
      switch (v149) {
        default:
          {
          v150 = v85;
          break;
        }
        case 0:
          {
          int v151 = 36;
          int v152 = v151 + v85;
          int v153 = v84[v152];
          int v154 = 0;
          bool v155 = v153 != v154;
          int v156;
          if (v155) {
            int v157 = 4;
            int v158 = v85 + v157;
            v156 = v158;
          } else {
            int v159 = 4;
            int v160 = v85 + v159;
            v156 = v160;
          }
          v150 = v156;
          break;
        }
      }
      bool v161 = true;
      v107 = v150;
      break;
    }
    default:
      {
      int v162 = 40;
      int v163 = v162 + v85;
      int v164 = v84[v163];
      int v165;
      v165 = v85;
      switch (v164) {
        default:
          {
          int v166 = 0;
          int v167 = 0;
          int v168;
          int v169;
          v168 = v166;
          v169 = v167;
          while (true) {
            int v170 = 4;
            int v171 = v169 * v170;
            int v172 = v171 + v85;
            int v173 = 44;
            int v174 = v173 + v172;
            int v175 = v84[v174];
            int v176 = 0;
            bool v177 = v175 != v176;
            v168 = v168;
            v169 = v169;
            if (!v177) break;
            int v178 = v168 + v169;
            int v179 = 1;
            int v180 = v169 + v179;
            bool v181 = true;
            v168 = v178;
            v169 = v180;
          }
          v165 = v168;
          break;
        }
        case 0:
          {
          int v182 = 64;
          int v183 = v182 + v85;
          int v184 = v84[v183];
          int v185 = 2;
          int v186 = v85 + v185;
          int v187;
          v187 = v186;
          switch (v184) {
            case 0:
              {
              v187 = v85;
              break;
            }
            case 1:
              {
              int v188 = 1;
              int v189 = v85 + v188;
              v187 = v189;
            }
            case 2:
              {
              int v190 = 0;
              v187 = v190;
              break;
            }
            default:
              {
              int v191 = 1;
              v187 = v191;
              break;
            }
          }
          bool v192 = true;
          v165 = v187;
          break;
        }
      }
      v107 = v165;
      break;
    }
  }
  int v193 = 68;
  int v194 = v193 + v85;
  int v195 = v84[v194];
  int v196 = 0;
  bool v197 = v195 != v196;
  int v198;
  if (v197) {
    int v199 = 72;
    int v200 = v199 + v85;
    int v201 = v84[v200];
    int v202 = 0;
    bool v203 = v201 != v202;
    int v204;
    if (v203) {
      uint v205 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v206 = (int)(v205);
      v204 = v206;
    } else {
      int v207 = 76;
      int v208 = v207 + v85;
      int v209 = v84[v208];
      int v210 = 0;
      bool v211 = v209 != v210;
      int v212;
      if (v211) {
        uint v213 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v214 = (int)(v213);
        v212 = v214;
      } else {
        int v215 = 3;
        int v216 = v85 + v215;
        v212 = v216;
      }
      int v217 = 16;
      int v218 = v217 + v85;
      bool v219 = true;
      int v220 = simt_wave_count_bits(v219);
      v83[v218] = v220;
      v204 = v212;
    }
    int v221 = 32;
    int v222 = v221 + v85;
    bool v223 = true;
    int v224 = simt_wave_count_bits(v223);
    v83[v222] = v224;
    v198 = v204;
  } else {
    int v225 = 80;
    int v226 = v225 + v85;
    int v227 = v84[v226];
    int v228 = 0;
    bool v229 = v227 != v228;
    int v230;
    if (v229) {
      int v231 = 0;
      int v232 = 0;
      int v233;
      int v234;
      v233 = v231;
      v234 = v232;
      while (true) {
        int v235 = 4;
        int v236 = v234 * v235;
        int v237 = v236 + v85;
        int v238 = 84;
        int v239 = v238 + v237;
        int v240 = v84[v239];
        int v241 = 0;
        bool v242 = v240 != v241;
        v233 = v233;
        v234 = v234;
        if (!v242) break;
        int v243 = v233 + v234;
        int v244 = 1;
        int v245 = v234 + v244;
        bool v246 = true;
        int v247 = 48;
        int v248 = 4;
        int v249 = v234 * v248;
        int v250 = v247 + v249;
        int v251 = v250 + v85;
        bool v252 = true;
        int v253 = simt_wave_count_bits(v252);
        v83[v251] = v253;
        v233 = v243;
        v234 = v245;
        continue;
        ;
      }
      v230 = v233;
    } else {
      uint v254 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v255 = (int)(v254);
      v230 = v255;
    }
    int v256 = 64;
    int v257 = v256 + v85;
    bool v258 = true;
    int v259 = simt_wave_count_bits(v258);
    v83[v257] = v259;
    v198 = v230;
  }
  int v260 = 80;
  int v261 = v260 + v85;
  bool v262 = true;
  int v263 = simt_wave_count_bits(v262);
  v83[v261] = v263;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 104; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
