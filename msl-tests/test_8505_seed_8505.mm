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
    int v13 = 4;
    int v14 = 1;
    int v15 = v7 + v14;
    v6 = v13;
    v7 = v15;
    break;
    ;
  }
  bool v16 = true;
  int v17 = simt_wave_count_bits(v16);
  int v18 = 0;
  int v19 = v18 + v0;
  v1[v19] = v17;
  int v20 = 4;
  int v21 = v3 % v20;
  int v22 = 2;
  int v23 = v0 + v22;
  int v24;
  v24 = v23;
  switch (v21) {
    case 0:
      {
      int v25 = 0;
      bool v26 = v2 != v25;
      int v27;
      if (v26) {
        int v28 = 2;
        int v29 = v3 % v28;
        int v30;
        v30 = v0;
        switch (v29) {
          case 0:
            {
            int v31 = 4;
            v30 = v31;
            break;
          }
          default:
            {
            int v32 = 2;
            v30 = v32;
            break;
          }
        }
        int v33 = 0;
        int v34 = v0 + v33;
        v27 = v30;
      } else {
        int v35 = 3;
        int v36 = v3 % v35;
        int v37 = 4;
        int v38;
        v38 = v37;
        switch (v36) {
          case 0:
            {
            v38 = v0;
            break;
          }
          default:
            {
            int v39 = 4;
            v38 = v39;
          }
          case 1:
            {
            v38 = v0;
            break;
          }
        }
        v27 = v38;
      }
      int v40 = 4;
      int v41 = v0 + v40;
      v24 = v27;
      break;
    }
    case 1:
      {
      int v42 = 0;
      bool v43 = v2 != v42;
      int v44;
      if (v43) {
        int v45 = 3;
        int v46 = v3 % v45;
        int v47;
        v47 = v0;
        switch (v46) {
          case 0:
            {
            int v48 = 2;
            int v49 = v0 + v48;
            v47 = v49;
            break;
          }
          case 1:
            {
            v47 = v0;
            break;
          }
          default:
            {
            int v50 = 0;
            v47 = v50;
            break;
          }
        }
        int v51 = 3;
        int v52 = v0 + v51;
        v44 = v47;
      } else {
        int v53 = 0;
        bool v54 = v2 != v53;
        int v55;
        if (v54) {
          int v56 = 1;
          v55 = v56;
        } else {
          int v57 = 1;
          int v58 = v0 + v57;
          v55 = v58;
        }
        int v59 = 1;
        v44 = v55;
      }
      v24 = v44;
      break;
    }
    case 2:
      {
      int v60 = 0;
      int v61 = 0;
      int v62;
      int v63;
      v62 = v60;
      v63 = v61;
      while (true) {
        int v64 = 4;
        int v65 = v3 % v64;
        int v66 = 1;
        int v67 = v65 + v66;
        bool v68 = v63 < v67;
        v62 = v62;
        v63 = v63;
        if (!v68) break;
        int v69 = 4;
        int v70 = v3 % v69;
        int v71 = 4;
        int v72;
        v72 = v71;
        switch (v70) {
          default:
            {
            int v73 = 1;
            int v74 = v0 + v73;
            v72 = v74;
            break;
          }
          case 0:
            {
            int v75 = 1;
            int v76 = v0 + v75;
            v72 = v76;
            break;
          }
          case 1:
            {
            int v77 = 2;
            v72 = v77;
            break;
          }
          case 2:
            {
            v72 = v0;
            break;
          }
        }
        int v78 = 1;
        int v79 = v63 + v78;
        v62 = v72;
        v63 = v79;
      }
      int v80 = 4;
      int v81 = v0 + v80;
      v24 = v62;
      break;
    }
    default:
      {
      int v82 = 0;
      int v83 = v0 + v82;
      v24 = v83;
      break;
    }
  }
  bool v84 = true;
  int v85 = simt_wave_count_bits(v84);
  int v86 = 16;
  int v87 = v86 + v0;
  v1[v87] = v85;
  int v88 = 0;
  bool v89 = v2 != v88;
  int v90 = v89 ? v6 : v24;
  return;
}

kernel void kernel_main(device int* v91 [[buffer(0)]], device int* v92 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v93 = static_cast<int>(__simt_tid3.x);
  int v94 = 0;
  int v95 = v94 + v93;
  int v96 = v92[v95];
  int v97 = 4;
  int v98 = v97 + v93;
  int v99 = v92[v98];
  helper0(v93, v91, v96, v99, static_cast<int>(__simt_tid3.x));
  int v100 = 0;
  int v101 = 0;
  int v102;
  int v103;
  v102 = v100;
  v103 = v101;
  while (true) {
    int v104 = 4;
    int v105 = v103 * v104;
    int v106 = v105 + v93;
    int v107 = 8;
    int v108 = v107 + v106;
    int v109 = v92[v108];
    int v110 = 0;
    bool v111 = v109 != v110;
    v102 = v102;
    v103 = v103;
    if (!v111) break;
    int v112 = 1;
    int v113 = v102 + v112;
    int v114 = 1;
    int v115 = v103 + v114;
    v102 = v113;
    v103 = v115;
  }
  bool v116 = true;
  int v117 = 32;
  int v118 = v117 + v93;
  bool v119 = true;
  int v120 = simt_wave_count_bits(v119);
  v91[v118] = v120;
  int v121 = 28;
  int v122 = v121 + v93;
  int v123 = v92[v122];
  int v124;
  v124 = v93;
  switch (v123) {
    default:
      {
      int v125 = 2;
      int v126 = v93 + v125;
      v124 = v126;
      break;
    }
    case 0:
      {
      int v127 = 32;
      int v128 = v127 + v93;
      int v129 = v92[v128];
      int v130 = 0;
      int v131 = v93 + v130;
      int v132;
      v132 = v131;
      switch (v129) {
        default:
          {
          v132 = v93;
          break;
        }
        case 0:
          {
          int v133 = 36;
          int v134 = v133 + v93;
          int v135 = v92[v134];
          int v136 = 0;
          bool v137 = v135 != v136;
          int v138;
          if (v137) {
            int v139 = 4;
            int v140 = v93 + v139;
            v138 = v140;
          } else {
            int v141 = 2;
            v138 = v141;
          }
          v132 = v138;
          break;
        }
        case 1:
          {
          int v142 = 40;
          int v143 = v142 + v93;
          int v144 = v92[v143];
          int v145 = 2;
          int v146 = v93 + v145;
          int v147;
          v147 = v146;
          switch (v144) {
            default:
              {
              int v148 = 2;
              v147 = v148;
              break;
            }
            case 0:
              {
              v147 = v93;
              break;
            }
            case 1:
              {
              v147 = v93;
              break;
            }
          }
          bool v149 = true;
          v132 = v147;
          break;
        }
      }
      bool v150 = true;
      v124 = v132;
      break;
    }
    case 1:
      {
      int v151 = 44;
      int v152 = v151 + v93;
      int v153 = v92[v152];
      int v154 = 4;
      int v155 = v93 + v154;
      int v156;
      v156 = v155;
      switch (v153) {
        default:
          {
          int v157 = 48;
          int v158 = v157 + v93;
          int v159 = v92[v158];
          int v160 = 3;
          int v161 = v93 + v160;
          int v162;
          v162 = v161;
          switch (v159) {
            case 0:
              {
              v162 = v93;
              break;
            }
            default:
              {
              int v163 = 1;
              v162 = v163;
              break;
            }
          }
          bool v164 = true;
          v156 = v162;
        }
        case 0:
          {
          int v165 = 52;
          int v166 = v165 + v93;
          int v167 = v92[v166];
          int v168;
          v168 = v93;
          switch (v167) {
            case 0:
              {
              v168 = v93;
              break;
            }
            default:
              {
              int v169 = 0;
              v168 = v169;
              break;
            }
            case 1:
              {
              int v170 = 2;
              v168 = v170;
              break;
            }
          }
          bool v171 = true;
          v156 = v168;
          break;
        }
      }
      bool v172 = true;
      v124 = v156;
      break;
    }
    case 2:
      {
      int v173 = 56;
      int v174 = v173 + v93;
      int v175 = v92[v174];
      int v176 = 0;
      bool v177 = v175 != v176;
      int v178;
      if (v177) {
        int v179 = 60;
        int v180 = v179 + v93;
        int v181 = v92[v180];
        int v182 = 0;
        bool v183 = v181 != v182;
        int v184;
        if (v183) {
          int v185 = 4;
          v184 = v185;
        } else {
          int v186 = 1;
          int v187 = v93 + v186;
          v184 = v187;
        }
        v178 = v184;
      } else {
        int v188 = 64;
        int v189 = v188 + v93;
        int v190 = v92[v189];
        int v191 = 2;
        int v192;
        v192 = v191;
        switch (v190) {
          default:
            {
            int v193 = 3;
            v192 = v193;
            break;
          }
          case 0:
            {
            int v194 = 1;
            v192 = v194;
            break;
          }
          case 1:
            {
            int v195 = 0;
            int v196 = v93 + v195;
            v192 = v196;
            break;
          }
        }
        bool v197 = true;
        v178 = v192;
      }
      v124 = v178;
      break;
    }
  }
  bool v198 = true;
  int v199 = 48;
  int v200 = v199 + v93;
  bool v201 = true;
  int v202 = simt_wave_count_bits(v201);
  v91[v200] = v202;
  int v203 = 0;
  int v204 = 0;
  int v205;
  int v206;
  v205 = v203;
  v206 = v204;
  while (true) {
    int v207 = 4;
    int v208 = v206 * v207;
    int v209 = v208 + v93;
    int v210 = 68;
    int v211 = v210 + v209;
    int v212 = v92[v211];
    int v213 = 0;
    bool v214 = v212 != v213;
    v205 = v205;
    v206 = v206;
    if (!v214) break;
    int v215 = 88;
    int v216 = v215 + v93;
    int v217 = v92[v216];
    int v218;
    v218 = v93;
    switch (v217) {
      case 0:
        {
        int v219 = 0;
        int v220 = 0;
        int v221;
        int v222;
        v221 = v219;
        v222 = v220;
        while (true) {
          int v223 = 4;
          int v224 = v222 * v223;
          int v225 = v224 + v93;
          int v226 = 92;
          int v227 = v226 + v225;
          int v228 = v92[v227];
          int v229 = 0;
          bool v230 = v228 != v229;
          v221 = v221;
          v222 = v222;
          if (!v230) break;
          int v231 = v221 + v222;
          int v232 = 1;
          int v233 = v222 + v232;
          v221 = v231;
          v222 = v233;
        }
        bool v234 = true;
        v218 = v221;
        break;
      }
      default:
        {
        int v235 = 112;
        int v236 = v235 + v93;
        int v237 = v92[v236];
        int v238;
        v238 = v93;
        switch (v237) {
          case 0:
            {
            v238 = v93;
            break;
          }
          default:
            {
            int v239 = 3;
            v238 = v239;
            break;
          }
          case 1:
            {
            v238 = v93;
            break;
          }
        }
        bool v240 = true;
        v218 = v238;
        break;
      }
      case 1:
        {
        int v241 = 116;
        int v242 = v241 + v93;
        int v243 = v92[v242];
        int v244 = 0;
        bool v245 = v243 != v244;
        int v246;
        if (v245) {
          int v247 = 2;
          int v248 = v93 + v247;
          v246 = v248;
        } else {
          v246 = v93;
        }
        v218 = v246;
        break;
      }
      case 2:
        {
        int v249 = 120;
        int v250 = v249 + v93;
        int v251 = v92[v250];
        int v252 = 0;
        int v253 = v93 + v252;
        int v254;
        v254 = v253;
        switch (v251) {
          default:
            {
            int v255 = 1;
            int v256 = v93 + v255;
            v254 = v256;
            break;
          }
          case 0:
            {
            v254 = v93;
            break;
          }
        }
        bool v257 = true;
        v218 = v254;
        break;
      }
    }
    bool v258 = true;
    int v259 = v205 + v218;
    int v260 = 1;
    int v261 = v206 + v260;
    v205 = v259;
    v206 = v261;
  }
  bool v262 = true;
  int v263 = 64;
  int v264 = v263 + v93;
  bool v265 = true;
  int v266 = simt_wave_count_bits(v265);
  v91[v264] = v266;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 124; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
