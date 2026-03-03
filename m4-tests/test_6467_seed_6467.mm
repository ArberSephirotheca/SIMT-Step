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
  int v6 = 0;
  int v7;
  v7 = v6;
  switch (v5) {
    case 0:
      {
      int v8 = 3;
      int v9 = v3 % v8;
      int v10 = 1;
      int v11 = v0 + v10;
      int v12;
      v12 = v11;
      switch (v9) {
        case 0:
          {
          v12 = v0;
        }
        case 1:
          {
          int v13 = 3;
          int v14 = v0 + v13;
          int v15;
          v15 = v14;
          switch (v3) {
            default:
              {
              int v16 = 1;
              int v17 = v0 + v16;
              v15 = v17;
              break;
            }
            case 0:
              {
              int v18 = 1;
              v15 = v18;
              break;
            }
          }
          int v19 = 0;
          int v20 = v0 + v19;
          v12 = v15;
          break;
        }
        case 2:
          {
          int v21 = 4;
          int v22 = v3 % v21;
          int v23;
          v23 = v0;
          switch (v22) {
            case 0:
              {
              v23 = v0;
              break;
            }
            case 1:
              {
              v23 = v0;
              break;
            }
            case 2:
              {
              v23 = v0;
              break;
            }
            default:
              {
              int v24 = 4;
              v23 = v24;
              break;
            }
          }
          int v25 = 0;
          int v26 = v0 + v25;
          v12 = v23;
          break;
        }
        default:
          {
          int v27 = 0;
          int v28 = 0;
          int v29;
          int v30;
          v29 = v27;
          v30 = v28;
          while (true) {
            int v31 = 4;
            int v32 = v3 % v31;
            int v33 = 1;
            int v34 = v32 + v33;
            bool v35 = v30 < v34;
            v29 = v29;
            v30 = v30;
            if (!v35) break;
            int v36 = 2;
            int v37 = v0 + v36;
            int v38 = 1;
            int v39 = v30 + v38;
            v29 = v37;
            v30 = v39;
            break;
            ;
          }
          v12 = v29;
          break;
        }
      }
      v7 = v12;
    }
    case 1:
      {
      int v40 = 0;
      int v41 = 0;
      int v42;
      int v43;
      v42 = v40;
      v43 = v41;
      while (true) {
        int v44 = 4;
        int v45 = v3 % v44;
        int v46 = 1;
        int v47 = v45 + v46;
        bool v48 = v43 < v47;
        v42 = v42;
        v43 = v43;
        if (!v48) break;
        int v49 = 4;
        int v50 = v3 % v49;
        int v51;
        v51 = v0;
        switch (v50) {
          case 0:
            {
            v51 = v0;
            break;
          }
          case 1:
            {
            int v52 = 0;
            v51 = v52;
            break;
          }
          default:
            {
            int v53 = 1;
            int v54 = v0 + v53;
            v51 = v54;
            break;
          }
          case 2:
            {
            int v55 = 1;
            v51 = v55;
            break;
          }
        }
        int v56 = 1;
        int v57 = v43 + v56;
        v42 = v51;
        v43 = v57;
      }
      v7 = v42;
    }
    default:
      {
      int v58 = 0;
      int v59 = 0;
      int v60;
      int v61;
      v60 = v58;
      v61 = v59;
      while (true) {
        int v62 = 4;
        int v63 = v3 % v62;
        int v64 = 1;
        int v65 = v63 + v64;
        bool v66 = v61 < v65;
        v60 = v60;
        v61 = v61;
        if (!v66) break;
        int v67;
        v67 = v0;
        switch (v3) {
          case 0:
            {
            v67 = v0;
            break;
          }
          default:
            {
            v67 = v0;
            break;
          }
        }
        int v68 = 1;
        int v69 = v61 + v68;
        v60 = v67;
        v61 = v69;
        continue;
        ;
      }
      v7 = v60;
    }
    case 2:
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
          int v88 = 1;
          int v89 = v82 + v88;
          v81 = v0;
          v82 = v89;
        }
        int v90 = 1;
        int v91 = v73 + v90;
        v72 = v81;
        v73 = v91;
        continue;
        ;
      }
      v7 = v72;
      break;
    }
  }
  bool v92 = true;
  int v93 = simt_wave_count_bits(v92);
  int v94 = 0;
  int v95 = v94 + v0;
  v1[v95] = v93;
  return;
}

kernel void kernel_main(device int* v96 [[buffer(0)]], device int* v97 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v98 = static_cast<int>(__simt_tid3.x);
  int v99 = 0;
  int v100 = v99 + v98;
  int v101 = v97[v100];
  int v102 = 4;
  int v103 = v102 + v98;
  int v104 = v97[v103];
  int v105 = 0;
  bool v106 = v101 != v105;
  if (v106) {
    int v107 = 0;
    int v108 = 0;
    int v109;
    int v110;
    v109 = v107;
    v110 = v108;
    while (true) {
      int v111 = 1;
      bool v112 = v110 < v111;
      v109 = v109;
      v110 = v110;
      if (!v112) break;
      helper0(v98, v96, v101, v104, static_cast<int>(__simt_tid3.x));
      int v113 = 1;
      int v114 = v110 + v113;
      v109 = v109;
      v110 = v114;
    }
  } else {
  }
  int v115 = 0;
  int v116 = 0;
  int v117;
  int v118;
  v117 = v115;
  v118 = v116;
  while (true) {
    int v119 = 4;
    int v120 = v118 * v119;
    int v121 = v120 + v98;
    int v122 = 8;
    int v123 = v122 + v121;
    int v124 = v97[v123];
    int v125 = 0;
    bool v126 = v124 != v125;
    v117 = v117;
    v118 = v118;
    if (!v126) break;
    int v127 = v117 + v118;
    int v128 = 1;
    int v129 = v118 + v128;
    bool v130 = true;
    int v131 = 16;
    int v132 = 4;
    int v133 = v118 * v132;
    int v134 = v131 + v133;
    int v135 = v134 + v98;
    bool v136 = true;
    int v137 = simt_wave_count_bits(v136);
    v96[v135] = v137;
    v117 = v127;
    v118 = v129;
  }
  int v138 = 28;
  int v139 = v138 + v98;
  int v140 = v97[v139];
  int v141 = 0;
  bool v142 = v140 != v141;
  int v143;
  if (v142) {
    int v144 = 32;
    int v145 = v144 + v98;
    int v146 = v97[v145];
    uint v147 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v148 = (int)(v147);
    int v149;
    v149 = v148;
    switch (v146) {
      case 0:
        {
        int v150 = 36;
        int v151 = v150 + v98;
        int v152 = v97[v151];
        int v153 = 0;
        bool v154 = v152 != v153;
        int v155;
        if (v154) {
          v155 = v98;
        } else {
          int v156 = 0;
          v155 = v156;
        }
        v149 = v155;
      }
      case 1:
        {
        int v157 = 40;
        int v158 = v157 + v98;
        int v159 = v97[v158];
        int v160 = 4;
        int v161 = v98 + v160;
        int v162;
        v162 = v161;
        switch (v159) {
          case 0:
            {
            int v163 = 3;
            int v164 = v98 + v163;
            v162 = v164;
            break;
          }
          default:
            {
            int v165 = 3;
            int v166 = v98 + v165;
            v162 = v166;
            break;
          }
          case 1:
            {
            int v167 = 0;
            int v168 = v98 + v167;
            v162 = v168;
            break;
          }
        }
        v149 = v162;
        break;
      }
      default:
        {
        int v169 = 44;
        int v170 = v169 + v98;
        int v171 = v97[v170];
        int v172 = 0;
        bool v173 = v171 != v172;
        int v174;
        if (v173) {
          int v175 = 1;
          v174 = v175;
        } else {
          int v176 = 1;
          int v177 = v98 + v176;
          v174 = v177;
        }
        v149 = v174;
      }
      case 2:
        {
        int v178 = 48;
        int v179 = v178 + v98;
        int v180 = v97[v179];
        int v181 = 0;
        bool v182 = v180 != v181;
        int v183;
        if (v182) {
          int v184 = 1;
          int v185 = v98 + v184;
          v183 = v185;
        } else {
          int v186 = 1;
          int v187 = v98 + v186;
          v183 = v187;
        }
        v149 = v183;
        break;
      }
    }
    v143 = v149;
  } else {
    int v188 = 52;
    int v189 = v188 + v98;
    int v190 = v97[v189];
    uint v191 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v192 = (int)(v191);
    int v193;
    v193 = v192;
    switch (v190) {
      case 0:
        {
        int v194 = 56;
        int v195 = v194 + v98;
        int v196 = v97[v195];
        int v197 = 2;
        int v198 = v98 + v197;
        int v199;
        v199 = v198;
        switch (v196) {
          case 0:
            {
            int v200 = 3;
            v199 = v200;
          }
          default:
            {
            int v201 = 1;
            int v202 = v98 + v201;
            v199 = v202;
            break;
          }
          case 1:
            {
            int v203 = 4;
            int v204 = v98 + v203;
            v199 = v204;
          }
          case 2:
            {
            int v205 = 4;
            v199 = v205;
            break;
          }
        }
        v193 = v199;
        break;
      }
      default:
        {
        int v206 = 4;
        v193 = v206;
        break;
      }
    }
    v143 = v193;
  }
  int v207 = 32;
  int v208 = v207 + v98;
  bool v209 = true;
  int v210 = simt_wave_count_bits(v209);
  v96[v208] = v210;
  int v211 = 0;
  int v212 = 0;
  int v213;
  int v214;
  v213 = v211;
  v214 = v212;
  while (true) {
    int v215 = 4;
    int v216 = v214 * v215;
    int v217 = v216 + v98;
    int v218 = 60;
    int v219 = v218 + v217;
    int v220 = v97[v219];
    int v221 = 0;
    bool v222 = v220 != v221;
    v213 = v213;
    v214 = v214;
    if (!v222) break;
    int v223 = 0;
    int v224 = 0;
    int v225;
    int v226;
    v225 = v223;
    v226 = v224;
    while (true) {
      int v227 = 4;
      int v228 = v226 * v227;
      int v229 = v228 + v98;
      int v230 = 80;
      int v231 = v230 + v229;
      int v232 = v97[v231];
      int v233 = 0;
      bool v234 = v232 != v233;
      v225 = v225;
      v226 = v226;
      if (!v234) break;
      int v235 = 100;
      int v236 = v235 + v98;
      int v237 = v97[v236];
      int v238 = 4;
      int v239;
      v239 = v238;
      switch (v237) {
        default:
          {
          int v240 = 4;
          int v241 = v98 + v240;
          v239 = v241;
          break;
        }
        case 0:
          {
          int v242 = 3;
          v239 = v242;
          break;
        }
      }
      int v243 = v225 + v239;
      int v244 = 1;
      int v245 = v226 + v244;
      bool v246 = true;
      int v247 = 48;
      int v248 = 4;
      int v249 = v226 * v248;
      int v250 = v247 + v249;
      int v251 = v250 + v98;
      bool v252 = true;
      int v253 = simt_wave_count_bits(v252);
      v96[v251] = v253;
      v225 = v243;
      v226 = v245;
    }
    int v254 = v213 + v225;
    int v255 = 1;
    int v256 = v214 + v255;
    bool v257 = true;
    int v258 = 64;
    int v259 = 4;
    int v260 = v214 * v259;
    int v261 = v258 + v260;
    int v262 = v261 + v98;
    bool v263 = true;
    int v264 = simt_wave_count_bits(v263);
    v96[v262] = v264;
    v213 = v254;
    v214 = v256;
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
    static int32_t expected0[] = {static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 75; ++idx) {
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
