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
  bool v5 = v2 != v4;
  int v6;
  if (v5) {
    int v7 = 0;
    int v8 = 0;
    int v9;
    int v10;
    v9 = v7;
    v10 = v8;
    while (true) {
      int v11 = 4;
      int v12 = v3 % v11;
      int v13 = 1;
      int v14 = v12 + v13;
      bool v15 = v10 < v14;
      v9 = v9;
      v10 = v10;
      if (!v15) break;
      int v16 = 3;
      int v17 = v0 + v16;
      int v18 = 1;
      int v19 = v10 + v18;
      v9 = v17;
      v10 = v19;
    }
    int v20 = 4;
    v6 = v9;
  } else {
    int v21 = 3;
    v6 = v21;
  }
  bool v22 = true;
  int v23 = simt_wave_count_bits(v22);
  int v24 = 0;
  int v25 = v24 + v0;
  v1[v25] = v23;
  int v26 = 0;
  bool v27 = v2 != v26;
  int v28;
  if (v27) {
    v28 = v0;
  } else {
    int v29 = 3;
    int v30 = v3 % v29;
    int v31;
    v31 = v0;
    switch (v30) {
      case 0:
        {
        int v32 = 4;
        int v33 = v0 + v32;
        int v34;
        v34 = v33;
        switch (v3) {
          case 0:
            {
            int v35 = 1;
            int v36 = v0 + v35;
            v34 = v36;
            break;
          }
          default:
            {
            int v37 = 2;
            int v38 = v0 + v37;
            v34 = v38;
            break;
          }
        }
        int v39 = 3;
        v31 = v34;
        break;
      }
      default:
        {
        int v40 = 1;
        int v41 = v0 + v40;
        v31 = v41;
        break;
      }
      case 1:
        {
        int v42 = 0;
        bool v43 = v2 != v42;
        int v44;
        if (v43) {
          int v45 = 0;
          int v46 = v0 + v45;
          v44 = v46;
        } else {
          int v47 = 0;
          v44 = v47;
        }
        int v48 = 3;
        v31 = v44;
        break;
      }
    }
    uint v49 = simt_subgroup_id(__simt_tid);
    int v50 = (int)(v49);
    v28 = v31;
  }
  bool v51 = true;
  int v52 = simt_wave_count_bits(v51);
  int v53 = 16;
  int v54 = v53 + v0;
  v1[v54] = v52;
  int v55 = 0;
  bool v56 = v2 != v55;
  int v57 = v56 ? v6 : v28;
  return;
}

kernel void kernel_main(device int* v58 [[buffer(0)]], device int* v59 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v60 = static_cast<int>(__simt_tid3.x);
  int v61 = 0;
  int v62 = v61 + v60;
  int v63 = v59[v62];
  int v64 = 4;
  int v65 = v64 + v60;
  int v66 = v59[v65];
  helper0(v60, v58, v63, v66, static_cast<int>(__simt_tid3.x));
  int v67 = 8;
  int v68 = v67 + v60;
  int v69 = v59[v68];
  int v70;
  v70 = v60;
  switch (v69) {
    default:
      {
      int v71 = 0;
      int v72 = 0;
      int v73;
      int v74;
      v73 = v71;
      v74 = v72;
      while (true) {
        int v75 = 4;
        int v76 = v74 * v75;
        int v77 = v76 + v60;
        int v78 = 12;
        int v79 = v78 + v77;
        int v80 = v59[v79];
        int v81 = 0;
        bool v82 = v80 != v81;
        v73 = v73;
        v74 = v74;
        if (!v82) break;
        int v83 = 32;
        int v84 = v83 + v60;
        int v85 = v59[v84];
        int v86;
        v86 = v60;
        switch (v85) {
          case 0:
            {
            int v87 = 2;
            int v88 = v60 + v87;
            v86 = v88;
          }
          default:
            {
            int v89 = 3;
            int v90 = v60 + v89;
            v86 = v90;
          }
          case 1:
            {
            int v91 = 2;
            v86 = v91;
            break;
          }
          case 2:
            {
            int v92 = 4;
            int v93 = v60 + v92;
            v86 = v93;
            break;
          }
        }
        bool v94 = true;
        int v95 = v73 + v86;
        int v96 = 1;
        int v97 = v74 + v96;
        v73 = v95;
        v74 = v97;
      }
      bool v98 = true;
      v70 = v73;
      break;
    }
    case 0:
      {
      int v99 = 36;
      int v100 = v99 + v60;
      int v101 = v59[v100];
      int v102 = 0;
      bool v103 = v101 != v102;
      int v104;
      if (v103) {
        int v105 = 40;
        int v106 = v105 + v60;
        int v107 = v59[v106];
        int v108 = 1;
        int v109;
        v109 = v108;
        switch (v107) {
          case 0:
            {
            v109 = v60;
            break;
          }
          case 1:
            {
            int v110 = 3;
            int v111 = v60 + v110;
            v109 = v111;
            break;
          }
          default:
            {
            v109 = v60;
            break;
          }
        }
        bool v112 = true;
        v104 = v109;
      } else {
        int v113 = 0;
        int v114 = v60 + v113;
        v104 = v114;
      }
      v70 = v104;
      break;
    }
    case 1:
      {
      int v115 = 44;
      int v116 = v115 + v60;
      int v117 = v59[v116];
      int v118 = 0;
      bool v119 = v117 != v118;
      int v120;
      if (v119) {
        int v121 = 48;
        int v122 = v121 + v60;
        int v123 = v59[v122];
        int v124 = 0;
        bool v125 = v123 != v124;
        int v126;
        if (v125) {
          int v127 = 0;
          v126 = v127;
        } else {
          int v128 = 1;
          v126 = v128;
        }
        v120 = v126;
      } else {
        int v129 = 52;
        int v130 = v129 + v60;
        int v131 = v59[v130];
        int v132 = 0;
        bool v133 = v131 != v132;
        int v134;
        if (v133) {
          int v135 = 4;
          int v136 = v60 + v135;
          v134 = v136;
        } else {
          int v137 = 2;
          int v138 = v60 + v137;
          v134 = v138;
        }
        v120 = v134;
      }
      v70 = v120;
      break;
    }
    case 2:
      {
      int v139 = 3;
      v70 = v139;
      break;
    }
  }
  bool v140 = true;
  int v141 = 32;
  int v142 = v141 + v60;
  bool v143 = true;
  int v144 = simt_wave_count_bits(v143);
  v58[v142] = v144;
  int v145 = 56;
  int v146 = v145 + v60;
  int v147 = v59[v146];
  int v148 = 0;
  bool v149 = v147 != v148;
  int v150;
  if (v149) {
    uint v151 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v152 = (int)(v151);
    v150 = v152;
  } else {
    int v153 = 0;
    int v154 = 0;
    int v155;
    int v156;
    v155 = v153;
    v156 = v154;
    while (true) {
      int v157 = 4;
      int v158 = v156 * v157;
      int v159 = v158 + v60;
      int v160 = 60;
      int v161 = v160 + v159;
      int v162 = v59[v161];
      int v163 = 0;
      bool v164 = v162 != v163;
      v155 = v155;
      v156 = v156;
      if (!v164) break;
      int v165 = 3;
      int v166 = v60 + v165;
      int v167 = v155 + v166;
      int v168 = 1;
      int v169 = v156 + v168;
      v155 = v167;
      v156 = v169;
      continue;
      ;
    }
    bool v170 = true;
    v150 = v155;
  }
  int v171 = 48;
  int v172 = v171 + v60;
  bool v173 = true;
  int v174 = simt_wave_count_bits(v173);
  v58[v172] = v174;
  int v175 = 80;
  int v176 = v175 + v60;
  int v177 = v59[v176];
  int v178 = 0;
  bool v179 = v177 != v178;
  int v180;
  if (v179) {
    int v181 = 84;
    int v182 = v181 + v60;
    int v183 = v59[v182];
    int v184 = 2;
    int v185;
    v185 = v184;
    switch (v183) {
      case 0:
        {
        v185 = v60;
        break;
      }
      default:
        {
        int v186 = 0;
        int v187 = 0;
        int v188;
        int v189;
        v188 = v186;
        v189 = v187;
        while (true) {
          int v190 = 4;
          int v191 = v189 * v190;
          int v192 = v191 + v60;
          int v193 = 88;
          int v194 = v193 + v192;
          int v195 = v59[v194];
          int v196 = 0;
          bool v197 = v195 != v196;
          v188 = v188;
          v189 = v189;
          if (!v197) break;
          int v198 = v188 + v189;
          int v199 = 1;
          int v200 = v189 + v199;
          v188 = v198;
          v189 = v200;
          break;
          ;
        }
        bool v201 = true;
        v185 = v188;
        break;
      }
    }
    bool v202 = true;
    v180 = v185;
  } else {
    int v203 = 108;
    int v204 = v203 + v60;
    int v205 = v59[v204];
    int v206 = 0;
    int v207;
    v207 = v206;
    switch (v205) {
      default:
        {
        int v208 = 112;
        int v209 = v208 + v60;
        int v210 = v59[v209];
        int v211 = 0;
        bool v212 = v210 != v211;
        int v213;
        if (v212) {
          int v214 = 4;
          v213 = v214;
        } else {
          int v215 = 4;
          int v216 = v60 + v215;
          v213 = v216;
        }
        v207 = v213;
        break;
      }
      case 0:
        {
        int v217 = 0;
        int v218 = 0;
        int v219;
        int v220;
        v219 = v217;
        v220 = v218;
        while (true) {
          int v221 = 4;
          int v222 = v220 * v221;
          int v223 = v222 + v60;
          int v224 = 116;
          int v225 = v224 + v223;
          int v226 = v59[v225];
          int v227 = 0;
          bool v228 = v226 != v227;
          v219 = v219;
          v220 = v220;
          if (!v228) break;
          int v229 = v219 + v220;
          int v230 = 1;
          int v231 = v220 + v230;
          v219 = v229;
          v220 = v231;
          break;
          ;
        }
        bool v232 = true;
        v207 = v219;
        break;
      }
      case 1:
        {
        int v233 = 136;
        int v234 = v233 + v60;
        int v235 = v59[v234];
        int v236 = 3;
        int v237 = v60 + v236;
        int v238;
        v238 = v237;
        switch (v235) {
          case 0:
            {
            v238 = v60;
            break;
          }
          case 1:
            {
            int v239 = 4;
            int v240 = v60 + v239;
            v238 = v240;
            break;
          }
          default:
            {
            int v241 = 3;
            int v242 = v60 + v241;
            v238 = v242;
            break;
          }
          case 2:
            {
            v238 = v60;
            break;
          }
        }
        bool v243 = true;
        v207 = v238;
        break;
      }
      case 2:
        {
        int v244 = 0;
        int v245 = 0;
        int v246;
        int v247;
        v246 = v244;
        v247 = v245;
        while (true) {
          int v248 = 4;
          int v249 = v247 * v248;
          int v250 = v249 + v60;
          int v251 = 140;
          int v252 = v251 + v250;
          int v253 = v59[v252];
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
          continue;
          ;
        }
        bool v259 = true;
        v207 = v246;
        break;
      }
    }
    bool v260 = true;
    v180 = v207;
  }
  int v261 = 64;
  int v262 = v261 + v60;
  bool v263 = true;
  int v264 = simt_wave_count_bits(v263);
  v58[v262] = v264;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 160; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
