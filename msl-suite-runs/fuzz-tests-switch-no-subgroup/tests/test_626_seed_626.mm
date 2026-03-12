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
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
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
        int v18 = 0;
        bool v19 = v2 != v18;
        int v20;
        if (v19) {
          v20 = v0;
        } else {
          v20 = v0;
        }
        int v21 = 1;
        int v22 = v12 + v21;
        v11 = v20;
        v12 = v22;
      }
      v8 = v11;
      break;
    }
    case 0:
      {
      int v23 = 0;
      bool v24 = v2 != v23;
      int v25;
      if (v24) {
        int v26 = 2;
        int v27 = v3 % v26;
        int v28;
        v28 = v0;
        switch (v27) {
          default:
            {
            int v29 = 4;
            v28 = v29;
          }
          case 0:
            {
            v28 = v0;
          }
          case 1:
            {
            int v30 = 0;
            v28 = v30;
            break;
          }
        }
        v25 = v28;
      } else {
        int v31 = 0;
        bool v32 = v2 != v31;
        int v33;
        if (v32) {
          v33 = v0;
        } else {
          int v34 = 1;
          v33 = v34;
        }
        v25 = v33;
      }
      v8 = v25;
      break;
    }
    case 1:
      {
      int v35 = 2;
      int v36 = v3 % v35;
      int v37;
      v37 = v0;
      switch (v36) {
        case 0:
          {
          int v38 = 3;
          int v39 = v0 + v38;
          v37 = v39;
          break;
        }
        case 1:
          {
          int v40 = 2;
          int v41 = v3 % v40;
          int v42 = 3;
          int v43;
          v43 = v42;
          switch (v41) {
            default:
              {
              int v44 = 3;
              v43 = v44;
            }
            case 0:
              {
              int v45 = 4;
              v43 = v45;
              break;
            }
          }
          v37 = v43;
          break;
        }
        default:
          {
          int v46 = 4;
          int v47 = v3 % v46;
          int v48 = 3;
          int v49 = v0 + v48;
          int v50;
          v50 = v49;
          switch (v47) {
            case 0:
              {
              int v51 = 4;
              int v52 = v0 + v51;
              v50 = v52;
            }
            case 1:
              {
              v50 = v0;
            }
            default:
              {
              int v53 = 0;
              int v54 = v0 + v53;
              v50 = v54;
            }
            case 2:
              {
              int v55 = 0;
              v50 = v55;
              break;
            }
          }
          v37 = v50;
          break;
        }
      }
      v8 = v37;
    }
    case 2:
      {
      int v56 = 0;
      bool v57 = v2 != v56;
      int v58;
      if (v57) {
        int v59 = 3;
        int v60 = v3 % v59;
        int v61;
        v61 = v0;
        switch (v60) {
          default:
            {
            int v62 = 3;
            v61 = v62;
            break;
          }
          case 0:
            {
            int v63 = 4;
            v61 = v63;
            break;
          }
          case 1:
            {
            int v64 = 1;
            int v65 = v0 + v64;
            v61 = v65;
            break;
          }
        }
        v58 = v61;
      } else {
        int v66 = 0;
        bool v67 = v2 != v66;
        int v68;
        if (v67) {
          int v69 = 3;
          int v70 = v0 + v69;
          v68 = v70;
        } else {
          int v71 = 4;
          int v72 = v0 + v71;
          v68 = v72;
        }
        v58 = v68;
      }
      v8 = v58;
      break;
    }
  }
  bool v73 = true;
  int v74 = simt_wave_count_bits(v73);
  int v75 = 0;
  int v76 = v75 + v0;
  v1[v76] = v74;
  return;
}

kernel void kernel_main(device int* v77 [[buffer(0)]], device int* v78 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v79 = static_cast<int>(__simt_tid3.x);
  int v80 = 0;
  int v81 = v80 + v79;
  int v82 = v78[v81];
  int v83 = 4;
  int v84 = v83 + v79;
  int v85 = v78[v84];
  int v86 = 0;
  bool v87 = v82 != v86;
  if (v87) {
  } else {
    int v88 = 8;
    int v89 = v88 + v79;
    int v90 = v78[v89];
    int v91 = 0;
    bool v92 = v90 != v91;
    if (v92) {
      int v93 = 3;
      int v94 = v79 % v93;
      uint v95 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v96 = (int)(v95);
      int v97;
      v97 = v96;
      switch (v94) {
        case 0:
          {
          int v98 = 1;
          int v99 = v97 + v98;
          v97 = v99;
          break;
        }
        default:
          {
          int v100 = 0;
          int v101 = v97 + v100;
          v97 = v101;
          break;
        }
        case 1:
          {
          int v102 = 1;
          int v103 = v97 + v102;
          v97 = v103;
          break;
        }
      }
      helper0(v79, v77, v82, v85, static_cast<int>(__simt_tid3.x));
    } else {
    }
  }
  uint v104 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v105 = (int)(v104);
  int v106 = 0;
  int v107 = 0;
  int v108;
  int v109;
  v108 = v106;
  v109 = v107;
  while (true) {
    int v110 = 4;
    int v111 = v109 * v110;
    int v112 = v111 + v79;
    int v113 = 12;
    int v114 = v113 + v112;
    int v115 = v78[v114];
    int v116 = 0;
    bool v117 = v115 != v116;
    v108 = v108;
    v109 = v109;
    if (!v117) break;
    int v118 = 32;
    int v119 = v118 + v79;
    int v120 = v78[v119];
    int v121 = 0;
    bool v122 = v120 != v121;
    int v123;
    if (v122) {
      uint v124 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v125 = (int)(v124);
      v123 = v125;
    } else {
      int v126 = 36;
      int v127 = v126 + v79;
      int v128 = v78[v127];
      int v129 = 0;
      bool v130 = v128 != v129;
      int v131;
      if (v130) {
        uint v132 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v133 = (int)(v132);
        v131 = v133;
      } else {
        int v134 = 4;
        int v135 = v79 + v134;
        v131 = v135;
      }
      int v136 = 16;
      int v137 = v136 + v79;
      bool v138 = true;
      int v139 = simt_wave_count_bits(v138);
      v77[v137] = v139;
      v123 = v131;
    }
    int v140 = 32;
    int v141 = v140 + v79;
    bool v142 = true;
    int v143 = simt_wave_count_bits(v142);
    v77[v141] = v143;
    int v144 = v108 + v123;
    int v145 = 1;
    int v146 = v109 + v145;
    bool v147 = true;
    int v148 = 48;
    int v149 = 4;
    int v150 = v109 * v149;
    int v151 = v148 + v150;
    int v152 = v151 + v79;
    bool v153 = true;
    int v154 = simt_wave_count_bits(v153);
    v77[v152] = v154;
    v108 = v144;
    v109 = v146;
  }
  int v155 = 40;
  int v156 = v155 + v79;
  int v157 = v78[v156];
  int v158 = 2;
  int v159;
  v159 = v158;
  switch (v157) {
    case 0:
      {
      int v160 = 44;
      int v161 = v160 + v79;
      int v162 = v78[v161];
      int v163 = 0;
      bool v164 = v162 != v163;
      int v165;
      if (v164) {
        int v166 = 48;
        int v167 = v166 + v79;
        int v168 = v78[v167];
        int v169 = 0;
        int v170 = v79 + v169;
        int v171;
        v171 = v170;
        switch (v168) {
          default:
            {
            int v172 = 2;
            v171 = v172;
          }
          case 0:
            {
            int v173 = 2;
            int v174 = v79 + v173;
            v171 = v174;
            break;
          }
        }
        bool v175 = true;
        v165 = v171;
      } else {
        int v176 = 52;
        int v177 = v176 + v79;
        int v178 = v78[v177];
        int v179;
        v179 = v79;
        switch (v178) {
          case 0:
            {
            int v180 = 0;
            v179 = v180;
            break;
          }
          default:
            {
            v179 = v79;
            break;
          }
          case 1:
            {
            int v181 = 0;
            int v182 = v79 + v181;
            v179 = v182;
          }
          case 2:
            {
            int v183 = 0;
            v179 = v183;
            break;
          }
        }
        bool v184 = true;
        v165 = v179;
      }
      v159 = v165;
      break;
    }
    default:
      {
      int v185 = 0;
      int v186 = 0;
      int v187;
      int v188;
      v187 = v185;
      v188 = v186;
      while (true) {
        int v189 = 4;
        int v190 = v188 * v189;
        int v191 = v190 + v79;
        int v192 = 56;
        int v193 = v192 + v191;
        int v194 = v78[v193];
        int v195 = 0;
        bool v196 = v194 != v195;
        v187 = v187;
        v188 = v188;
        if (!v196) break;
        int v197 = 4;
        int v198 = v187 + v197;
        int v199 = 1;
        int v200 = v188 + v199;
        bool v201 = true;
        v187 = v198;
        v188 = v200;
      }
      v159 = v187;
      break;
    }
    case 1:
      {
      int v202 = 76;
      int v203 = v202 + v79;
      int v204 = v78[v203];
      int v205 = 3;
      int v206 = v79 + v205;
      int v207;
      v207 = v206;
      switch (v204) {
        default:
          {
          int v208 = 0;
          int v209 = 0;
          int v210;
          int v211;
          v210 = v208;
          v211 = v209;
          while (true) {
            int v212 = 4;
            int v213 = v211 * v212;
            int v214 = v213 + v79;
            int v215 = 80;
            int v216 = v215 + v214;
            int v217 = v78[v216];
            int v218 = 0;
            bool v219 = v217 != v218;
            v210 = v210;
            v211 = v211;
            if (!v219) break;
            int v220 = v210 + v211;
            int v221 = 1;
            int v222 = v211 + v221;
            bool v223 = true;
            v210 = v220;
            v211 = v222;
          }
          v207 = v210;
          break;
        }
        case 0:
          {
          int v224 = 1;
          int v225 = v79 + v224;
          v207 = v225;
          break;
        }
        case 1:
          {
          int v226 = 0;
          int v227 = 0;
          int v228;
          int v229;
          v228 = v226;
          v229 = v227;
          while (true) {
            int v230 = 4;
            int v231 = v229 * v230;
            int v232 = v231 + v79;
            int v233 = 100;
            int v234 = v233 + v232;
            int v235 = v78[v234];
            int v236 = 0;
            bool v237 = v235 != v236;
            v228 = v228;
            v229 = v229;
            if (!v237) break;
            int v238 = v228 + v229;
            int v239 = 1;
            int v240 = v229 + v239;
            bool v241 = true;
            v228 = v238;
            v229 = v240;
          }
          v207 = v228;
          break;
        }
        case 2:
          {
          int v242 = 4;
          int v243 = v79 + v242;
          v207 = v243;
          break;
        }
      }
      v159 = v207;
      break;
    }
    case 2:
      {
      int v244 = 120;
      int v245 = v244 + v79;
      int v246 = v78[v245];
      int v247 = 0;
      bool v248 = v246 != v247;
      int v249;
      if (v248) {
        int v250 = 124;
        int v251 = v250 + v79;
        int v252 = v78[v251];
        int v253 = 0;
        bool v254 = v252 != v253;
        int v255;
        if (v254) {
          int v256 = 4;
          int v257 = v79 + v256;
          v255 = v257;
        } else {
          int v258 = 3;
          v255 = v258;
        }
        v249 = v255;
      } else {
        int v259 = 0;
        int v260 = 0;
        int v261;
        int v262;
        v261 = v259;
        v262 = v260;
        while (true) {
          int v263 = 4;
          int v264 = v262 * v263;
          int v265 = v264 + v79;
          int v266 = 128;
          int v267 = v266 + v265;
          int v268 = v78[v267];
          int v269 = 0;
          bool v270 = v268 != v269;
          v261 = v261;
          v262 = v262;
          if (!v270) break;
          int v271 = v261 + v262;
          int v272 = 1;
          int v273 = v262 + v272;
          bool v274 = true;
          v261 = v271;
          v262 = v273;
          continue;
          ;
        }
        v249 = v261;
      }
      v159 = v249;
      break;
    }
  }
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(2), static_cast<int32_t>(4), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 56; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 148; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
