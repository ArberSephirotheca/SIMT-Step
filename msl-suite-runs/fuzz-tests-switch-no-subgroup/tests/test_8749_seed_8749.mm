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
  int v6;
  v6 = v0;
  switch (v5) {
    case 0:
      {
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
        int v16 = 0;
        bool v17 = v2 != v16;
        int v18;
        if (v17) {
          int v19 = 4;
          v18 = v19;
        } else {
          int v20 = 1;
          v18 = v20;
        }
        int v21 = 1;
        int v22 = v10 + v21;
        v9 = v18;
        v10 = v22;
        continue;
        ;
      }
      v6 = v9;
      break;
    }
    case 1:
      {
      int v23 = 0;
      int v24;
      v24 = v23;
      switch (v3) {
        default:
          {
          v24 = v0;
          break;
        }
        case 0:
          {
          int v25 = 2;
          v24 = v25;
          break;
        }
      }
      v6 = v24;
      break;
    }
    case 2:
      {
      int v26 = 3;
      int v27 = v3 % v26;
      int v28 = 2;
      int v29;
      v29 = v28;
      switch (v27) {
        case 0:
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
            continue;
            ;
          }
          v29 = v32;
          break;
        }
        case 1:
          {
          v29 = v0;
          break;
        }
        default:
          {
          int v43 = 4;
          int v44 = v3 % v43;
          int v45 = 3;
          int v46;
          v46 = v45;
          switch (v44) {
            case 0:
              {
              v46 = v0;
              break;
            }
            case 1:
              {
              int v47 = 2;
              v46 = v47;
            }
            default:
              {
              v46 = v0;
              break;
            }
            case 2:
              {
              int v48 = 4;
              v46 = v48;
              break;
            }
          }
          v29 = v46;
          break;
        }
        case 2:
          {
          int v49 = 2;
          int v50 = v0 + v49;
          v29 = v50;
          break;
        }
      }
      v6 = v29;
    }
    default:
      {
      int v51 = 2;
      int v52 = v3 % v51;
      int v53 = 1;
      int v54;
      v54 = v53;
      switch (v52) {
        default:
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
            int v64 = 1;
            int v65 = 1;
            int v66 = v58 + v65;
            v57 = v64;
            v58 = v66;
          }
          v54 = v57;
        }
        case 0:
          {
          int v67 = 1;
          int v68 = v0 + v67;
          v54 = v68;
        }
        case 1:
          {
          int v69 = 0;
          v54 = v69;
          break;
        }
      }
      int v70 = 3;
      int v71 = v0 + v70;
      v6 = v54;
      break;
    }
  }
  bool v72 = true;
  int v73 = simt_wave_count_bits(v72);
  int v74 = 0;
  int v75 = v74 + v0;
  v1[v75] = v73;
  return;
}

kernel void kernel_main(device int* v76 [[buffer(0)]], device int* v77 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v78 = static_cast<int>(__simt_tid3.x);
  int v79 = 0;
  int v80 = v79 + v78;
  int v81 = v77[v80];
  int v82 = 4;
  int v83 = v82 + v78;
  int v84 = v77[v83];
  int v85 = 0;
  bool v86 = v81 != v85;
  if (v86) {
  } else {
    int v87 = 0;
    int v88 = 0;
    int v89;
    int v90;
    v89 = v87;
    v90 = v88;
    while (true) {
      int v91 = 1;
      bool v92 = v90 < v91;
      v89 = v89;
      v90 = v90;
      if (!v92) break;
      helper0(v78, v76, v81, v84, static_cast<int>(__simt_tid3.x));
      int v93 = 1;
      int v94 = v90 + v93;
      v89 = v89;
      v90 = v94;
    }
  }
  int v95 = 8;
  int v96 = v95 + v78;
  int v97 = v77[v96];
  int v98 = 1;
  int v99 = v78 + v98;
  int v100;
  v100 = v99;
  switch (v97) {
    case 0:
      {
      int v101 = 0;
      int v102 = 0;
      int v103;
      int v104;
      v103 = v101;
      v104 = v102;
      while (true) {
        int v105 = 4;
        int v106 = v104 * v105;
        int v107 = v106 + v78;
        int v108 = 12;
        int v109 = v108 + v107;
        int v110 = v77[v109];
        int v111 = 0;
        bool v112 = v110 != v111;
        v103 = v103;
        v104 = v104;
        if (!v112) break;
        int v113 = 0;
        int v114 = 0;
        int v115;
        int v116;
        v115 = v113;
        v116 = v114;
        while (true) {
          int v117 = 4;
          int v118 = v116 * v117;
          int v119 = v118 + v78;
          int v120 = 32;
          int v121 = v120 + v119;
          int v122 = v77[v121];
          int v123 = 0;
          bool v124 = v122 != v123;
          v115 = v115;
          v116 = v116;
          if (!v124) break;
          int v125 = v115 + v116;
          int v126 = 1;
          int v127 = v116 + v126;
          bool v128 = true;
          v115 = v125;
          v116 = v127;
        }
        int v129 = v103 + v115;
        int v130 = 1;
        int v131 = v104 + v130;
        bool v132 = true;
        v103 = v129;
        v104 = v131;
      }
      v100 = v103;
      break;
    }
    default:
      {
      int v133 = 52;
      int v134 = v133 + v78;
      int v135 = v77[v134];
      int v136;
      v136 = v78;
      switch (v135) {
        case 0:
          {
          int v137 = 56;
          int v138 = v137 + v78;
          int v139 = v77[v138];
          int v140 = 2;
          int v141 = v78 + v140;
          int v142;
          v142 = v141;
          switch (v139) {
            case 0:
              {
              v142 = v78;
              break;
            }
            default:
              {
              int v143 = 1;
              v142 = v143;
              break;
            }
          }
          bool v144 = true;
          v136 = v142;
          break;
        }
        default:
          {
          int v145 = 60;
          int v146 = v145 + v78;
          int v147 = v77[v146];
          int v148 = 0;
          bool v149 = v147 != v148;
          int v150;
          if (v149) {
            int v151 = 0;
            v150 = v151;
          } else {
            int v152 = 3;
            v150 = v152;
          }
          v136 = v150;
          break;
        }
      }
      v100 = v136;
      break;
    }
    case 1:
      {
      int v153 = 64;
      int v154 = v153 + v78;
      int v155 = v77[v154];
      int v156 = 3;
      int v157 = v78 + v156;
      int v158;
      v158 = v157;
      switch (v155) {
        default:
          {
          int v159 = 0;
          int v160 = 0;
          int v161;
          int v162;
          v161 = v159;
          v162 = v160;
          while (true) {
            int v163 = 4;
            int v164 = v162 * v163;
            int v165 = v164 + v78;
            int v166 = 68;
            int v167 = v166 + v165;
            int v168 = v77[v167];
            int v169 = 0;
            bool v170 = v168 != v169;
            v161 = v161;
            v162 = v162;
            if (!v170) break;
            int v171 = v161 + v162;
            int v172 = 1;
            int v173 = v162 + v172;
            bool v174 = true;
            v161 = v171;
            v162 = v173;
          }
          v158 = v161;
          break;
        }
        case 0:
          {
          int v175 = 0;
          int v176 = 0;
          int v177;
          int v178;
          v177 = v175;
          v178 = v176;
          while (true) {
            int v179 = 4;
            int v180 = v178 * v179;
            int v181 = v180 + v78;
            int v182 = 88;
            int v183 = v182 + v181;
            int v184 = v77[v183];
            int v185 = 0;
            bool v186 = v184 != v185;
            v177 = v177;
            v178 = v178;
            if (!v186) break;
            int v187 = v177 + v178;
            int v188 = 1;
            int v189 = v178 + v188;
            bool v190 = true;
            v177 = v187;
            v178 = v189;
          }
          v158 = v177;
          break;
        }
      }
      bool v191 = true;
      v100 = v158;
      break;
    }
    case 2:
      {
      int v192 = 0;
      int v193 = 0;
      int v194;
      int v195;
      v194 = v192;
      v195 = v193;
      while (true) {
        int v196 = 4;
        int v197 = v195 * v196;
        int v198 = v197 + v78;
        int v199 = 108;
        int v200 = v199 + v198;
        int v201 = v77[v200];
        int v202 = 0;
        bool v203 = v201 != v202;
        v194 = v194;
        v195 = v195;
        if (!v203) break;
        int v204 = v194 + v195;
        int v205 = 1;
        int v206 = v195 + v205;
        bool v207 = true;
        v194 = v204;
        v195 = v206;
      }
      v100 = v194;
      break;
    }
  }
  int v208 = 0;
  int v209 = 0;
  int v210;
  int v211;
  v210 = v208;
  v211 = v209;
  while (true) {
    int v212 = 4;
    int v213 = v211 * v212;
    int v214 = v213 + v78;
    int v215 = 128;
    int v216 = v215 + v214;
    int v217 = v77[v216];
    int v218 = 0;
    bool v219 = v217 != v218;
    v210 = v210;
    v211 = v211;
    if (!v219) break;
    int v220 = 0;
    int v221 = 0;
    int v222;
    int v223;
    v222 = v220;
    v223 = v221;
    while (true) {
      int v224 = 4;
      int v225 = v223 * v224;
      int v226 = v225 + v78;
      int v227 = 148;
      int v228 = v227 + v226;
      int v229 = v77[v228];
      int v230 = 0;
      bool v231 = v229 != v230;
      v222 = v222;
      v223 = v223;
      if (!v231) break;
      int v232 = 168;
      int v233 = v232 + v78;
      int v234 = v77[v233];
      int v235 = 0;
      bool v236 = v234 != v235;
      int v237;
      if (v236) {
        uint v238 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v239 = (int)(v238);
        v237 = v239;
      } else {
        v237 = v78;
      }
      int v240 = 16;
      int v241 = v240 + v78;
      bool v242 = true;
      int v243 = simt_wave_count_bits(v242);
      v76[v241] = v243;
      int v244 = v222 + v237;
      int v245 = 1;
      int v246 = v223 + v245;
      bool v247 = true;
      int v248 = 32;
      int v249 = 4;
      int v250 = v223 * v249;
      int v251 = v248 + v250;
      int v252 = v251 + v78;
      bool v253 = true;
      int v254 = simt_wave_count_bits(v253);
      v76[v252] = v254;
      v222 = v244;
      v223 = v246;
      break;
      ;
    }
    int v255 = v210 + v222;
    int v256 = 1;
    int v257 = v211 + v256;
    bool v258 = true;
    int v259 = 48;
    int v260 = 4;
    int v261 = v211 * v260;
    int v262 = v259 + v261;
    int v263 = v262 + v78;
    bool v264 = true;
    int v265 = simt_wave_count_bits(v264);
    v76[v263] = v265;
    v210 = v255;
    v211 = v257;
    continue;
    ;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 59; ++idx) {
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
