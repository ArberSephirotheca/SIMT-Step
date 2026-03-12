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
    uint v13 = simt_subgroup_id(__simt_tid);
    int v14 = (int)(v13);
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
  int v21 = 3;
  int v22 = v3 % v21;
  int v23 = 0;
  int v24;
  v24 = v23;
  switch (v22) {
    case 0:
      {
      v24 = v0;
      break;
    }
    default:
      {
      int v25 = 4;
      int v26 = v3 % v25;
      int v27 = 1;
      int v28 = v0 + v27;
      int v29;
      v29 = v28;
      switch (v26) {
        default:
          {
          int v30 = 0;
          int v31 = 0;
          int v32;
          int v33;
          v32 = v30;
          v33 = v31;
          while (true) {
            int v34 = 4;
            int v35 = v3 % v34;
            int v36 = 1;
            int v37 = v35 + v36;
            bool v38 = v33 < v37;
            v32 = v32;
            v33 = v33;
            if (!v38) break;
            int v39 = 3;
            int v40 = v0 + v39;
            int v41 = 1;
            int v42 = v33 + v41;
            v32 = v40;
            v33 = v42;
            break;
            ;
          }
          int v43 = 0;
          int v44 = v0 + v43;
          v29 = v32;
          break;
        }
        case 0:
          {
          int v45 = 0;
          bool v46 = v2 != v45;
          int v47;
          if (v46) {
            v47 = v0;
          } else {
            int v48 = 4;
            int v49 = v0 + v48;
            v47 = v49;
          }
          v29 = v47;
          break;
        }
        case 1:
          {
          int v50 = 2;
          int v51;
          v51 = v50;
          switch (v3) {
            case 0:
              {
              int v52 = 3;
              int v53 = v0 + v52;
              v51 = v53;
              break;
            }
            default:
              {
              v51 = v0;
              break;
            }
          }
          v29 = v51;
          break;
        }
        case 2:
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
            int v63 = 4;
            int v64 = 1;
            int v65 = v57 + v64;
            v56 = v63;
            v57 = v65;
            break;
            ;
          }
          int v66 = 2;
          int v67 = v0 + v66;
          v29 = v56;
          break;
        }
      }
      int v68 = 4;
      int v69 = v0 + v68;
      v24 = v29;
      break;
    }
    case 1:
      {
      int v70 = 0;
      int v71 = 0;
      int v72;
      int v73;
      v72 = v70;
      v73 = v71;
      while (true) {
        int v74 = 4;
        int v75 = v3 % v74;
        int v76 = 1;
        int v77 = v75 + v76;
        bool v78 = v73 < v77;
        v72 = v72;
        v73 = v73;
        if (!v78) break;
        int v79 = 0;
        int v80 = 0;
        int v81;
        int v82;
        v81 = v79;
        v82 = v80;
        while (true) {
          int v83 = 4;
          int v84 = v3 % v83;
          int v85 = 1;
          int v86 = v84 + v85;
          bool v87 = v82 < v86;
          v81 = v81;
          v82 = v82;
          if (!v87) break;
          int v88 = 2;
          int v89 = v0 + v88;
          int v90 = 1;
          int v91 = v82 + v90;
          v81 = v89;
          v82 = v91;
          break;
          ;
        }
        int v92 = 2;
        int v93 = v0 + v92;
        int v94 = 1;
        int v95 = v73 + v94;
        v72 = v81;
        v73 = v95;
        break;
        ;
      }
      v24 = v72;
      break;
    }
    case 2:
      {
      int v96 = 3;
      int v97 = v3 % v96;
      int v98 = 4;
      int v99 = v0 + v98;
      int v100;
      v100 = v99;
      switch (v97) {
        case 0:
          {
          int v101 = 4;
          int v102 = v3 % v101;
          int v103;
          v103 = v0;
          switch (v102) {
            case 0:
              {
              v103 = v0;
              break;
            }
            default:
              {
              v103 = v0;
              break;
            }
            case 1:
              {
              int v104 = 0;
              int v105 = v0 + v104;
              v103 = v105;
              break;
            }
            case 2:
              {
              int v106 = 2;
              v103 = v106;
              break;
            }
          }
          int v107 = 2;
          v100 = v103;
          break;
        }
        case 1:
          {
          int v108 = 4;
          v100 = v108;
          break;
        }
        case 2:
          {
          v100 = v0;
          break;
        }
        default:
          {
          int v109 = 4;
          int v110 = v0 + v109;
          v100 = v110;
          break;
        }
      }
      v24 = v100;
      break;
    }
  }
  bool v111 = true;
  int v112 = simt_wave_count_bits(v111);
  int v113 = 16;
  int v114 = v113 + v0;
  v1[v114] = v112;
  int v115 = 0;
  bool v116 = v2 != v115;
  int v117 = v116 ? v6 : v24;
  return;
}

kernel void kernel_main(device int* v118 [[buffer(0)]], device int* v119 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v120 = static_cast<int>(__simt_tid3.x);
  int v121 = 0;
  int v122 = v121 + v120;
  int v123 = v119[v122];
  int v124 = 4;
  int v125 = v124 + v120;
  int v126 = v119[v125];
  helper0(v120, v118, v123, v126, static_cast<int>(__simt_tid3.x));
  int v127 = 8;
  int v128 = v127 + v120;
  int v129 = v119[v128];
  int v130 = 0;
  bool v131 = v129 != v130;
  int v132;
  if (v131) {
    int v133 = 12;
    int v134 = v133 + v120;
    int v135 = v119[v134];
    uint v136 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v137 = (int)(v136);
    int v138;
    v138 = v137;
    switch (v135) {
      case 0:
        {
        int v139 = 16;
        int v140 = v139 + v120;
        int v141 = v119[v140];
        int v142;
        v142 = v120;
        switch (v141) {
          case 0:
            {
            v142 = v120;
            break;
          }
          default:
            {
            int v143 = 3;
            v142 = v143;
            break;
          }
        }
        bool v144 = true;
        v138 = v142;
        break;
      }
      case 1:
        {
        int v145 = 3;
        v138 = v145;
        break;
      }
      default:
        {
        int v146 = 2;
        int v147 = v120 + v146;
        v138 = v147;
        break;
      }
    }
    bool v148 = true;
    v132 = v138;
  } else {
    int v149 = 1;
    v132 = v149;
  }
  int v150 = 32;
  int v151 = v150 + v120;
  bool v152 = true;
  int v153 = simt_wave_count_bits(v152);
  v118[v151] = v153;
  int v154 = 20;
  int v155 = v154 + v120;
  int v156 = v119[v155];
  uint v157 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v158 = (int)(v157);
  int v159;
  v159 = v158;
  switch (v156) {
    case 0:
      {
      int v160 = 3;
      v159 = v160;
      break;
    }
    default:
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
        int v167 = v166 + v120;
        int v168 = 24;
        int v169 = v168 + v167;
        int v170 = v119[v169];
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
      v159 = v163;
      break;
    }
  }
  bool v177 = true;
  int v178 = 48;
  int v179 = v178 + v120;
  bool v180 = true;
  int v181 = simt_wave_count_bits(v180);
  v118[v179] = v181;
  int v182 = 44;
  int v183 = v182 + v120;
  int v184 = v119[v183];
  int v185 = 1;
  int v186 = v120 + v185;
  int v187;
  v187 = v186;
  switch (v184) {
    default:
      {
      int v188 = 0;
      int v189 = 0;
      int v190;
      int v191;
      v190 = v188;
      v191 = v189;
      while (true) {
        int v192 = 4;
        int v193 = v191 * v192;
        int v194 = v193 + v120;
        int v195 = 48;
        int v196 = v195 + v194;
        int v197 = v119[v196];
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
        break;
        ;
      }
      bool v203 = true;
      v187 = v190;
      break;
    }
    case 0:
      {
      int v204 = 68;
      int v205 = v204 + v120;
      int v206 = v119[v205];
      int v207 = 1;
      int v208 = v120 + v207;
      int v209;
      v209 = v208;
      switch (v206) {
        case 0:
          {
          int v210 = 0;
          int v211 = 0;
          int v212;
          int v213;
          v212 = v210;
          v213 = v211;
          while (true) {
            int v214 = 4;
            int v215 = v213 * v214;
            int v216 = v215 + v120;
            int v217 = 72;
            int v218 = v217 + v216;
            int v219 = v119[v218];
            int v220 = 0;
            bool v221 = v219 != v220;
            v212 = v212;
            v213 = v213;
            if (!v221) break;
            int v222 = v212 + v213;
            int v223 = 1;
            int v224 = v213 + v223;
            v212 = v222;
            v213 = v224;
            continue;
            ;
          }
          bool v225 = true;
          v209 = v212;
          break;
        }
        default:
          {
          int v226 = 92;
          int v227 = v226 + v120;
          int v228 = v119[v227];
          int v229 = 0;
          bool v230 = v228 != v229;
          int v231;
          if (v230) {
            int v232 = 3;
            int v233 = v120 + v232;
            v231 = v233;
          } else {
            int v234 = 0;
            v231 = v234;
          }
          v209 = v231;
          break;
        }
      }
      bool v235 = true;
      v187 = v209;
      break;
    }
    case 1:
      {
      int v236 = 0;
      int v237 = 0;
      int v238;
      int v239;
      v238 = v236;
      v239 = v237;
      while (true) {
        int v240 = 4;
        int v241 = v239 * v240;
        int v242 = v241 + v120;
        int v243 = 96;
        int v244 = v243 + v242;
        int v245 = v119[v244];
        int v246 = 0;
        bool v247 = v245 != v246;
        v238 = v238;
        v239 = v239;
        if (!v247) break;
        int v248 = 0;
        int v249 = 0;
        int v250;
        int v251;
        v250 = v248;
        v251 = v249;
        while (true) {
          int v252 = 4;
          int v253 = v251 * v252;
          int v254 = v253 + v120;
          int v255 = 116;
          int v256 = v255 + v254;
          int v257 = v119[v256];
          int v258 = 0;
          bool v259 = v257 != v258;
          v250 = v250;
          v251 = v251;
          if (!v259) break;
          int v260 = v250 + v251;
          int v261 = 1;
          int v262 = v251 + v261;
          v250 = v260;
          v251 = v262;
        }
        bool v263 = true;
        int v264 = v238 + v250;
        int v265 = 1;
        int v266 = v239 + v265;
        v238 = v264;
        v239 = v266;
      }
      bool v267 = true;
      v187 = v238;
      break;
    }
  }
  bool v268 = true;
  int v269 = 64;
  int v270 = v269 + v120;
  bool v271 = true;
  int v272 = simt_wave_count_bits(v271);
  v118[v270] = v272;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 136; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
