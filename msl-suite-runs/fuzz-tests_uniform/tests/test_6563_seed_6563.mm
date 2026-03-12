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
    int v13 = 0;
    bool v14 = v2 != v13;
    int v15;
    if (v14) {
      int v16 = 0;
      int v17 = v0 + v16;
      v15 = v17;
    } else {
      int v18 = 3;
      int v19 = v3 % v18;
      int v20;
      v20 = v0;
      switch (v19) {
        case 0:
          {
          int v21 = 3;
          v20 = v21;
        }
        default:
          {
          int v22 = 3;
          v20 = v22;
        }
        case 1:
          {
          v20 = v0;
          break;
        }
        case 2:
          {
          int v23 = 2;
          v20 = v23;
          break;
        }
      }
      uint v24 = simt_lane_id(__simt_tid);
      int v25 = (int)(v24);
      v15 = v20;
    }
    uint v26 = simt_lane_id(__simt_tid);
    int v27 = (int)(v26);
    int v28 = 1;
    int v29 = v7 + v28;
    v6 = v15;
    v7 = v29;
  }
  bool v30 = true;
  int v31 = simt_wave_count_bits(v30);
  int v32 = 0;
  int v33 = v32 + v0;
  v1[v33] = v31;
  return;
}

kernel void kernel_main(device int* v34 [[buffer(0)]], device int* v35 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v36 = static_cast<int>(__simt_tid3.x);
  int v37 = 0;
  int v38 = v37 + v36;
  int v39 = v35[v38];
  int v40 = 4;
  int v41 = v40 + v36;
  int v42 = v35[v41];
  helper0(v36, v34, v39, v42, static_cast<int>(__simt_tid3.x));
  int v43 = 8;
  int v44 = v43 + v36;
  int v45 = v35[v44];
  int v46 = 1;
  int v47;
  v47 = v46;
  switch (v45) {
    default:
      {
      int v48 = 12;
      int v49 = v48 + v36;
      int v50 = v35[v49];
      int v51 = 3;
      int v52 = v36 + v51;
      int v53;
      v53 = v52;
      switch (v50) {
        default:
          {
          int v54 = 3;
          v53 = v54;
          break;
        }
        case 0:
          {
          int v55 = 0;
          int v56 = 0;
          int v57;
          int v58;
          v57 = v55;
          v58 = v56;
          while (true) {
            int v59 = 4;
            int v60 = v58 * v59;
            int v61 = v60 + v36;
            int v62 = 16;
            int v63 = v62 + v61;
            int v64 = v35[v63];
            int v65 = 0;
            bool v66 = v64 != v65;
            v57 = v57;
            v58 = v58;
            if (!v66) break;
            int v67 = v57 + v58;
            int v68 = 1;
            int v69 = v58 + v68;
            v57 = v67;
            v58 = v69;
            break;
            ;
          }
          bool v70 = true;
          v53 = v57;
          break;
        }
        case 1:
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
            int v77 = v76 + v36;
            int v78 = 36;
            int v79 = v78 + v77;
            int v80 = v35[v79];
            int v81 = 0;
            bool v82 = v80 != v81;
            v73 = v73;
            v74 = v74;
            if (!v82) break;
            int v83 = v73 + v74;
            int v84 = 1;
            int v85 = v74 + v84;
            v73 = v83;
            v74 = v85;
          }
          bool v86 = true;
          v53 = v73;
          break;
        }
        case 2:
          {
          int v87 = 56;
          int v88 = v87 + v36;
          int v89 = v35[v88];
          int v90 = 0;
          bool v91 = v89 != v90;
          int v92;
          if (v91) {
            v92 = v36;
          } else {
            int v93 = 2;
            v92 = v93;
          }
          v53 = v92;
          break;
        }
      }
      bool v94 = true;
      v47 = v53;
      break;
    }
    case 0:
      {
      int v95 = 60;
      int v96 = v95 + v36;
      int v97 = v35[v96];
      int v98;
      v98 = v36;
      switch (v97) {
        default:
          {
          int v99 = 64;
          int v100 = v99 + v36;
          int v101 = v35[v100];
          int v102 = 0;
          bool v103 = v101 != v102;
          int v104;
          if (v103) {
            v104 = v36;
          } else {
            int v105 = 0;
            v104 = v105;
          }
          v98 = v104;
        }
        case 0:
          {
          int v106 = 4;
          v98 = v106;
        }
        case 1:
          {
          int v107 = 0;
          int v108 = 0;
          int v109;
          int v110;
          v109 = v107;
          v110 = v108;
          while (true) {
            int v111 = 4;
            int v112 = v110 * v111;
            int v113 = v112 + v36;
            int v114 = 68;
            int v115 = v114 + v113;
            int v116 = v35[v115];
            int v117 = 0;
            bool v118 = v116 != v117;
            v109 = v109;
            v110 = v110;
            if (!v118) break;
            int v119 = v109 + v110;
            int v120 = 1;
            int v121 = v110 + v120;
            v109 = v119;
            v110 = v121;
          }
          bool v122 = true;
          v98 = v109;
          break;
        }
        case 2:
          {
          int v123 = 0;
          int v124 = 0;
          int v125;
          int v126;
          v125 = v123;
          v126 = v124;
          while (true) {
            int v127 = 4;
            int v128 = v126 * v127;
            int v129 = v128 + v36;
            int v130 = 88;
            int v131 = v130 + v129;
            int v132 = v35[v131];
            int v133 = 0;
            bool v134 = v132 != v133;
            v125 = v125;
            v126 = v126;
            if (!v134) break;
            int v135 = v125 + v126;
            int v136 = 1;
            int v137 = v126 + v136;
            v125 = v135;
            v126 = v137;
          }
          bool v138 = true;
          v98 = v125;
          break;
        }
      }
      bool v139 = true;
      v47 = v98;
      break;
    }
    case 1:
      {
      int v140 = 108;
      int v141 = v140 + v36;
      int v142 = v35[v141];
      int v143 = 0;
      bool v144 = v142 != v143;
      int v145;
      if (v144) {
        int v146 = 0;
        int v147 = 0;
        int v148;
        int v149;
        v148 = v146;
        v149 = v147;
        while (true) {
          int v150 = 4;
          int v151 = v149 * v150;
          int v152 = v151 + v36;
          int v153 = 112;
          int v154 = v153 + v152;
          int v155 = v35[v154];
          int v156 = 0;
          bool v157 = v155 != v156;
          v148 = v148;
          v149 = v149;
          if (!v157) break;
          int v158 = v148 + v149;
          int v159 = 1;
          int v160 = v149 + v159;
          v148 = v158;
          v149 = v160;
        }
        bool v161 = true;
        v145 = v148;
      } else {
        int v162 = 132;
        int v163 = v162 + v36;
        int v164 = v35[v163];
        int v165 = 3;
        int v166 = v36 + v165;
        int v167;
        v167 = v166;
        switch (v164) {
          case 0:
            {
            int v168 = 0;
            int v169 = v36 + v168;
            v167 = v169;
            break;
          }
          default:
            {
            v167 = v36;
            break;
          }
        }
        bool v170 = true;
        v145 = v167;
      }
      v47 = v145;
    }
    case 2:
      {
      v47 = v36;
      break;
    }
  }
  bool v171 = true;
  int v172 = 16;
  int v173 = v172 + v36;
  bool v174 = true;
  int v175 = simt_wave_count_bits(v174);
  v34[v173] = v175;
  int v176 = 136;
  int v177 = v176 + v36;
  int v178 = v35[v177];
  int v179 = 1;
  int v180 = v36 + v179;
  int v181;
  v181 = v180;
  switch (v178) {
    case 0:
      {
      int v182 = 140;
      int v183 = v182 + v36;
      int v184 = v35[v183];
      int v185 = 0;
      bool v186 = v184 != v185;
      int v187;
      if (v186) {
        int v188 = 144;
        int v189 = v188 + v36;
        int v190 = v35[v189];
        int v191;
        v191 = v36;
        switch (v190) {
          case 0:
            {
            int v192 = 1;
            v191 = v192;
            break;
          }
          case 1:
            {
            int v193 = 2;
            int v194 = v36 + v193;
            v191 = v194;
            break;
          }
          default:
            {
            int v195 = 0;
            v191 = v195;
            break;
          }
        }
        bool v196 = true;
        v187 = v191;
      } else {
        int v197 = 148;
        int v198 = v197 + v36;
        int v199 = v35[v198];
        int v200 = 0;
        bool v201 = v199 != v200;
        int v202;
        if (v201) {
          int v203 = 0;
          int v204 = v36 + v203;
          v202 = v204;
        } else {
          int v205 = 1;
          v202 = v205;
        }
        v187 = v202;
      }
      v181 = v187;
      break;
    }
    case 1:
      {
      int v206 = 152;
      int v207 = v206 + v36;
      int v208 = v35[v207];
      int v209 = 2;
      int v210;
      v210 = v209;
      switch (v208) {
        default:
          {
          int v211 = 156;
          int v212 = v211 + v36;
          int v213 = v35[v212];
          int v214 = 0;
          int v215;
          v215 = v214;
          switch (v213) {
            case 0:
              {
              int v216 = 4;
              int v217 = v36 + v216;
              v215 = v217;
              break;
            }
            default:
              {
              int v218 = 1;
              int v219 = v36 + v218;
              v215 = v219;
              break;
            }
          }
          bool v220 = true;
          v210 = v215;
          break;
        }
        case 0:
          {
          int v221 = 160;
          int v222 = v221 + v36;
          int v223 = v35[v222];
          int v224 = 0;
          bool v225 = v223 != v224;
          int v226;
          if (v225) {
            v226 = v36;
          } else {
            v226 = v36;
          }
          v210 = v226;
        }
        case 1:
          {
          int v227 = 0;
          int v228 = v36 + v227;
          v210 = v228;
          break;
        }
      }
      bool v229 = true;
      v181 = v210;
    }
    default:
      {
      v181 = v36;
    }
    case 2:
      {
      int v230 = 164;
      int v231 = v230 + v36;
      int v232 = v35[v231];
      int v233 = 1;
      int v234 = v36 + v233;
      int v235;
      v235 = v234;
      switch (v232) {
        default:
          {
          int v236 = 168;
          int v237 = v236 + v36;
          int v238 = v35[v237];
          int v239 = 3;
          int v240;
          v240 = v239;
          switch (v238) {
            case 0:
              {
              int v241 = 4;
              int v242 = v36 + v241;
              v240 = v242;
              break;
            }
            default:
              {
              v240 = v36;
              break;
            }
            case 1:
              {
              v240 = v36;
              break;
            }
          }
          bool v243 = true;
          v235 = v240;
          break;
        }
        case 0:
          {
          int v244 = 172;
          int v245 = v244 + v36;
          int v246 = v35[v245];
          int v247 = 0;
          int v248;
          v248 = v247;
          switch (v246) {
            case 0:
              {
              int v249 = 1;
              int v250 = v36 + v249;
              v248 = v250;
              break;
            }
            default:
              {
              int v251 = 3;
              v248 = v251;
              break;
            }
          }
          bool v252 = true;
          v235 = v248;
          break;
        }
        case 1:
          {
          int v253 = 176;
          int v254 = v253 + v36;
          int v255 = v35[v254];
          int v256;
          v256 = v36;
          switch (v255) {
            case 0:
              {
              v256 = v36;
              break;
            }
            default:
              {
              int v257 = 4;
              int v258 = v36 + v257;
              v256 = v258;
              break;
            }
          }
          bool v259 = true;
          v235 = v256;
          break;
        }
      }
      bool v260 = true;
      v181 = v235;
      break;
    }
  }
  bool v261 = true;
  int v262 = 32;
  int v263 = v262 + v36;
  bool v264 = true;
  int v265 = simt_wave_count_bits(v264);
  v34[v263] = v265;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 36; ++idx) {
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
