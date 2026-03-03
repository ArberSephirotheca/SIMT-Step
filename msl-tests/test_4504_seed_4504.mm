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
      int v18 = 2;
      int v19 = v3 % v18;
      int v20 = 3;
      int v21 = v0 + v20;
      int v22;
      v22 = v21;
      switch (v19) {
        case 0:
          {
          v22 = v0;
          break;
        }
        default:
          {
          int v23 = 1;
          v22 = v23;
          break;
        }
      }
      uint v24 = simt_lane_id(__simt_tid);
      int v25 = (int)(v24);
      int v26 = 1;
      int v27 = v12 + v26;
      v11 = v22;
      v12 = v27;
      break;
      ;
    }
    v8 = v11;
  } else {
    int v28 = 2;
    int v29 = v3 % v28;
    int v30;
    v30 = v0;
    switch (v29) {
      default:
        {
        int v31 = 0;
        int v32 = 0;
        int v33;
        int v34;
        v33 = v31;
        v34 = v32;
        while (true) {
          int v35 = 4;
          int v36 = v3 % v35;
          int v37 = 1;
          int v38 = v36 + v37;
          bool v39 = v34 < v38;
          v33 = v33;
          v34 = v34;
          if (!v39) break;
          int v40 = 1;
          int v41 = v34 + v40;
          v33 = v0;
          v34 = v41;
        }
        v30 = v33;
        break;
      }
      case 0:
        {
        int v42 = 0;
        bool v43 = v2 != v42;
        int v44;
        if (v43) {
          int v45 = 0;
          v44 = v45;
        } else {
          v44 = v0;
        }
        v30 = v44;
        break;
      }
    }
    int v46 = 4;
    v8 = v30;
  }
  bool v47 = true;
  int v48 = simt_wave_count_bits(v47);
  int v49 = 0;
  int v50 = v49 + v0;
  v1[v50] = v48;
  int v51 = 0;
  bool v52 = v2 != v51;
  int v53 = v52 ? v5 : v8;
  return;
}

kernel void kernel_main(device int* v54 [[buffer(0)]], device int* v55 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v56 = static_cast<int>(__simt_tid3.x);
  int v57 = 0;
  int v58 = v57 + v56;
  int v59 = v55[v58];
  int v60 = 4;
  int v61 = v60 + v56;
  int v62 = v55[v61];
  helper0(v56, v54, v59, v62, static_cast<int>(__simt_tid3.x));
  int v63 = 0;
  int v64 = 0;
  int v65;
  int v66;
  v65 = v63;
  v66 = v64;
  while (true) {
    int v67 = 4;
    int v68 = v66 * v67;
    int v69 = v68 + v56;
    int v70 = 8;
    int v71 = v70 + v69;
    int v72 = v55[v71];
    int v73 = 0;
    bool v74 = v72 != v73;
    v65 = v65;
    v66 = v66;
    if (!v74) break;
    int v75 = 28;
    int v76 = v75 + v56;
    int v77 = v55[v76];
    int v78;
    v78 = v56;
    switch (v77) {
      case 0:
        {
        int v79 = 32;
        int v80 = v79 + v56;
        int v81 = v55[v80];
        int v82 = 2;
        int v83;
        v83 = v82;
        switch (v81) {
          case 0:
            {
            v83 = v56;
            break;
          }
          case 1:
            {
            v83 = v56;
            break;
          }
          case 2:
            {
            int v84 = 2;
            int v85 = v56 + v84;
            v83 = v85;
            break;
          }
          default:
            {
            int v86 = 3;
            int v87 = v56 + v86;
            v83 = v87;
            break;
          }
        }
        bool v88 = true;
        v78 = v83;
        break;
      }
      case 1:
        {
        int v89 = 36;
        int v90 = v89 + v56;
        int v91 = v55[v90];
        int v92;
        v92 = v56;
        switch (v91) {
          default:
            {
            int v93 = 2;
            v92 = v93;
            break;
          }
          case 0:
            {
            int v94 = 3;
            v92 = v94;
            break;
          }
        }
        bool v95 = true;
        v78 = v92;
        break;
      }
      default:
        {
        int v96 = 40;
        int v97 = v96 + v56;
        int v98 = v55[v97];
        int v99 = 0;
        bool v100 = v98 != v99;
        int v101;
        if (v100) {
          int v102 = 3;
          int v103 = v56 + v102;
          v101 = v103;
        } else {
          int v104 = 0;
          v101 = v104;
        }
        v78 = v101;
        break;
      }
      case 2:
        {
        int v105 = 44;
        int v106 = v105 + v56;
        int v107 = v55[v106];
        int v108 = 2;
        int v109;
        v109 = v108;
        switch (v107) {
          case 0:
            {
            v109 = v56;
            break;
          }
          default:
            {
            int v110 = 1;
            int v111 = v56 + v110;
            v109 = v111;
            break;
          }
        }
        bool v112 = true;
        v78 = v109;
        break;
      }
    }
    bool v113 = true;
    int v114 = v65 + v78;
    int v115 = 1;
    int v116 = v66 + v115;
    v65 = v114;
    v66 = v116;
    continue;
    ;
  }
  bool v117 = true;
  int v118 = 16;
  int v119 = v118 + v56;
  bool v120 = true;
  int v121 = simt_wave_count_bits(v120);
  v54[v119] = v121;
  int v122 = 48;
  int v123 = v122 + v56;
  int v124 = v55[v123];
  uint v125 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v126 = (int)(v125);
  int v127;
  v127 = v126;
  switch (v124) {
    case 0:
      {
      int v128 = 0;
      int v129 = 0;
      int v130;
      int v131;
      v130 = v128;
      v131 = v129;
      while (true) {
        int v132 = 4;
        int v133 = v131 * v132;
        int v134 = v133 + v56;
        int v135 = 52;
        int v136 = v135 + v134;
        int v137 = v55[v136];
        int v138 = 0;
        bool v139 = v137 != v138;
        v130 = v130;
        v131 = v131;
        if (!v139) break;
        int v140 = v130 + v131;
        int v141 = 1;
        int v142 = v131 + v141;
        v130 = v140;
        v131 = v142;
        continue;
        ;
      }
      bool v143 = true;
      v127 = v130;
      break;
    }
    default:
      {
      int v144 = 0;
      int v145 = 0;
      int v146;
      int v147;
      v146 = v144;
      v147 = v145;
      while (true) {
        int v148 = 4;
        int v149 = v147 * v148;
        int v150 = v149 + v56;
        int v151 = 72;
        int v152 = v151 + v150;
        int v153 = v55[v152];
        int v154 = 0;
        bool v155 = v153 != v154;
        v146 = v146;
        v147 = v147;
        if (!v155) break;
        int v156 = 92;
        int v157 = v156 + v56;
        int v158 = v55[v157];
        int v159 = 4;
        int v160 = v56 + v159;
        int v161;
        v161 = v160;
        switch (v158) {
          case 0:
            {
            int v162 = 4;
            v161 = v162;
            break;
          }
          case 1:
            {
            int v163 = 2;
            v161 = v163;
            break;
          }
          default:
            {
            v161 = v56;
            break;
          }
        }
        bool v164 = true;
        int v165 = v146 + v161;
        int v166 = 1;
        int v167 = v147 + v166;
        v146 = v165;
        v147 = v167;
      }
      bool v168 = true;
      v127 = v146;
      break;
    }
    case 1:
      {
      int v169 = 0;
      int v170 = v56 + v169;
      v127 = v170;
      break;
    }
    case 2:
      {
      int v171 = 0;
      int v172 = 0;
      int v173;
      int v174;
      v173 = v171;
      v174 = v172;
      while (true) {
        int v175 = 4;
        int v176 = v174 * v175;
        int v177 = v176 + v56;
        int v178 = 96;
        int v179 = v178 + v177;
        int v180 = v55[v179];
        int v181 = 0;
        bool v182 = v180 != v181;
        v173 = v173;
        v174 = v174;
        if (!v182) break;
        int v183 = 116;
        int v184 = v183 + v56;
        int v185 = v55[v184];
        int v186 = 4;
        int v187 = v56 + v186;
        int v188;
        v188 = v187;
        switch (v185) {
          default:
            {
            int v189 = 4;
            v188 = v189;
            break;
          }
          case 0:
            {
            int v190 = 3;
            v188 = v190;
            break;
          }
        }
        bool v191 = true;
        int v192 = v173 + v188;
        int v193 = 1;
        int v194 = v174 + v193;
        v173 = v192;
        v174 = v194;
        continue;
        ;
      }
      bool v195 = true;
      v127 = v173;
      break;
    }
  }
  bool v196 = true;
  int v197 = 32;
  int v198 = v197 + v56;
  bool v199 = true;
  int v200 = simt_wave_count_bits(v199);
  v54[v198] = v200;
  int v201 = 120;
  int v202 = v201 + v56;
  int v203 = v55[v202];
  int v204 = 4;
  int v205;
  v205 = v204;
  switch (v203) {
    default:
      {
      int v206 = 124;
      int v207 = v206 + v56;
      int v208 = v55[v207];
      int v209;
      v209 = v56;
      switch (v208) {
        default:
          {
          int v210 = 128;
          int v211 = v210 + v56;
          int v212 = v55[v211];
          int v213 = 0;
          bool v214 = v212 != v213;
          int v215;
          if (v214) {
            int v216 = 3;
            int v217 = v56 + v216;
            v215 = v217;
          } else {
            int v218 = 0;
            v215 = v218;
          }
          v209 = v215;
          break;
        }
        case 0:
          {
          int v219 = 132;
          int v220 = v219 + v56;
          int v221 = v55[v220];
          int v222;
          v222 = v56;
          switch (v221) {
            case 0:
              {
              v222 = v56;
              break;
            }
            case 1:
              {
              int v223 = 1;
              v222 = v223;
            }
            default:
              {
              int v224 = 3;
              int v225 = v56 + v224;
              v222 = v225;
            }
            case 2:
              {
              v222 = v56;
              break;
            }
          }
          bool v226 = true;
          v209 = v222;
          break;
        }
        case 1:
          {
          v209 = v56;
          break;
        }
        case 2:
          {
          int v227 = 136;
          int v228 = v227 + v56;
          int v229 = v55[v228];
          int v230;
          v230 = v56;
          switch (v229) {
            case 0:
              {
              int v231 = 2;
              int v232 = v56 + v231;
              v230 = v232;
              break;
            }
            default:
              {
              int v233 = 1;
              int v234 = v56 + v233;
              v230 = v234;
              break;
            }
          }
          bool v235 = true;
          v209 = v230;
          break;
        }
      }
      bool v236 = true;
      v205 = v209;
      break;
    }
    case 0:
      {
      int v237 = 3;
      int v238 = v56 + v237;
      v205 = v238;
      break;
    }
    case 1:
      {
      int v239 = 2;
      int v240 = v56 + v239;
      v205 = v240;
      break;
    }
    case 2:
      {
      int v241 = 140;
      int v242 = v241 + v56;
      int v243 = v55[v242];
      int v244 = 0;
      bool v245 = v243 != v244;
      int v246;
      if (v245) {
        v246 = v56;
      } else {
        int v247 = 0;
        int v248 = 0;
        int v249;
        int v250;
        v249 = v247;
        v250 = v248;
        while (true) {
          int v251 = 4;
          int v252 = v250 * v251;
          int v253 = v252 + v56;
          int v254 = 144;
          int v255 = v254 + v253;
          int v256 = v55[v255];
          int v257 = 0;
          bool v258 = v256 != v257;
          v249 = v249;
          v250 = v250;
          if (!v258) break;
          int v259 = v249 + v250;
          int v260 = 1;
          int v261 = v250 + v260;
          v249 = v259;
          v250 = v261;
          break;
          ;
        }
        bool v262 = true;
        v246 = v249;
      }
      v205 = v246;
      break;
    }
  }
  bool v263 = true;
  int v264 = 48;
  int v265 = v264 + v56;
  bool v266 = true;
  int v267 = simt_wave_count_bits(v266);
  v54[v265] = v267;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 164; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
