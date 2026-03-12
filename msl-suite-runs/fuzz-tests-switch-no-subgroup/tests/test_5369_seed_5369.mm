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
        int v16 = 1;
        int v17 = 1;
        int v18 = v10 + v17;
        v9 = v16;
        v10 = v18;
      }
      v6 = v9;
    }
    case 1:
      {
      int v19 = 3;
      int v20 = v3 % v19;
      int v21 = 4;
      int v22;
      v22 = v21;
      switch (v20) {
        default:
          {
          int v23 = 4;
          int v24 = v0 + v23;
          v22 = v24;
        }
        case 0:
          {
          int v25 = 2;
          int v26 = v3 % v25;
          int v27 = 3;
          int v28 = v0 + v27;
          int v29;
          v29 = v28;
          switch (v26) {
            default:
              {
              int v30 = 0;
              v29 = v30;
              break;
            }
            case 0:
              {
              int v31 = 0;
              v29 = v31;
              break;
            }
            case 1:
              {
              v29 = v0;
              break;
            }
          }
          v22 = v29;
          break;
        }
        case 1:
          {
          int v32 = 3;
          int v33 = v3 % v32;
          int v34;
          v34 = v0;
          switch (v33) {
            default:
              {
              v34 = v0;
              break;
            }
            case 0:
              {
              int v35 = 0;
              int v36 = v0 + v35;
              v34 = v36;
              break;
            }
            case 1:
              {
              v34 = v0;
              break;
            }
          }
          v22 = v34;
          break;
        }
      }
      v6 = v22;
    }
    case 2:
      {
      int v37 = 0;
      int v38 = 0;
      int v39;
      int v40;
      v39 = v37;
      v40 = v38;
      while (true) {
        int v41 = 4;
        int v42 = v3 % v41;
        int v43 = 1;
        int v44 = v42 + v43;
        bool v45 = v40 < v44;
        v39 = v39;
        v40 = v40;
        if (!v45) break;
        int v46 = 1;
        int v47 = 1;
        int v48 = v40 + v47;
        v39 = v46;
        v40 = v48;
      }
      v6 = v39;
      break;
    }
    default:
      {
      int v49 = 2;
      int v50 = v0 + v49;
      int v51;
      v51 = v50;
      switch (v3) {
        case 0:
          {
          int v52 = 0;
          int v53 = 0;
          int v54;
          int v55;
          v54 = v52;
          v55 = v53;
          while (true) {
            int v56 = 4;
            int v57 = v3 % v56;
            int v58 = 1;
            int v59 = v57 + v58;
            bool v60 = v55 < v59;
            v54 = v54;
            v55 = v55;
            if (!v60) break;
            int v61 = 0;
            int v62 = 1;
            int v63 = v55 + v62;
            v54 = v61;
            v55 = v63;
            break;
            ;
          }
          v51 = v54;
          break;
        }
        default:
          {
          int v64 = 0;
          v51 = v64;
          break;
        }
      }
      v6 = v51;
      break;
    }
  }
  bool v65 = true;
  int v66 = simt_wave_count_bits(v65);
  int v67 = 0;
  int v68 = v67 + v0;
  v1[v68] = v66;
  return;
}

kernel void kernel_main(device int* v69 [[buffer(0)]], device int* v70 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v71 = static_cast<int>(__simt_tid3.x);
  int v72 = 0;
  int v73 = v72 + v71;
  int v74 = v70[v73];
  int v75 = 4;
  int v76 = v75 + v71;
  int v77 = v70[v76];
  int v78 = 0;
  bool v79 = v74 != v78;
  if (v79) {
  } else {
    int v80 = 8;
    int v81 = v80 + v71;
    int v82 = v70[v81];
    int v83 = 0;
    bool v84 = v82 != v83;
    if (v84) {
    } else {
      uint v85 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v86 = (int)(v85);
      int v87;
      v87 = v86;
      switch (v71) {
        default:
          {
          int v88 = 1;
          int v89 = v87 + v88;
          v87 = v89;
          break;
        }
        case 0:
          {
          int v90 = 3;
          int v91 = v87 + v90;
          v87 = v91;
          break;
        }
      }
      helper0(v71, v69, v74, v77, static_cast<int>(__simt_tid3.x));
    }
  }
  int v92 = 12;
  int v93 = v92 + v71;
  int v94 = v70[v93];
  int v95;
  v95 = v71;
  switch (v94) {
    case 0:
      {
      int v96 = 0;
      int v97 = 0;
      int v98;
      int v99;
      v98 = v96;
      v99 = v97;
      while (true) {
        int v100 = 4;
        int v101 = v99 * v100;
        int v102 = v101 + v71;
        int v103 = 16;
        int v104 = v103 + v102;
        int v105 = v70[v104];
        int v106 = 0;
        bool v107 = v105 != v106;
        v98 = v98;
        v99 = v99;
        if (!v107) break;
        int v108 = v98 + v99;
        int v109 = 1;
        int v110 = v99 + v109;
        bool v111 = true;
        v98 = v108;
        v99 = v110;
        break;
        ;
      }
      v95 = v98;
      break;
    }
    default:
      {
      int v112 = 36;
      int v113 = v112 + v71;
      int v114 = v70[v113];
      int v115 = 1;
      int v116;
      v116 = v115;
      switch (v114) {
        case 0:
          {
          int v117 = 0;
          int v118 = 0;
          int v119;
          int v120;
          v119 = v117;
          v120 = v118;
          while (true) {
            int v121 = 4;
            int v122 = v120 * v121;
            int v123 = v122 + v71;
            int v124 = 40;
            int v125 = v124 + v123;
            int v126 = v70[v125];
            int v127 = 0;
            bool v128 = v126 != v127;
            v119 = v119;
            v120 = v120;
            if (!v128) break;
            int v129 = v119 + v120;
            int v130 = 1;
            int v131 = v120 + v130;
            bool v132 = true;
            v119 = v129;
            v120 = v131;
            continue;
            ;
          }
          v116 = v119;
          break;
        }
        case 1:
          {
          int v133 = 60;
          int v134 = v133 + v71;
          int v135 = v70[v134];
          int v136 = 4;
          int v137;
          v137 = v136;
          switch (v135) {
            case 0:
              {
              int v138 = 1;
              v137 = v138;
              break;
            }
            default:
              {
              int v139 = 3;
              int v140 = v71 + v139;
              v137 = v140;
              break;
            }
            case 1:
              {
              v137 = v71;
              break;
            }
            case 2:
              {
              int v141 = 4;
              v137 = v141;
              break;
            }
          }
          v116 = v137;
          break;
        }
        case 2:
          {
          int v142 = 64;
          int v143 = v142 + v71;
          int v144 = v70[v143];
          int v145 = 0;
          bool v146 = v144 != v145;
          int v147;
          if (v146) {
            v147 = v71;
          } else {
            v147 = v71;
          }
          v116 = v147;
          break;
        }
        default:
          {
          int v148 = 68;
          int v149 = v148 + v71;
          int v150 = v70[v149];
          int v151 = 2;
          int v152 = v71 + v151;
          int v153;
          v153 = v152;
          switch (v150) {
            case 0:
              {
              int v154 = 1;
              v153 = v154;
            }
            default:
              {
              v153 = v71;
              break;
            }
            case 1:
              {
              v153 = v71;
              break;
            }
          }
          v116 = v153;
          break;
        }
      }
      v95 = v116;
      break;
    }
    case 1:
      {
      v95 = v71;
      break;
    }
    case 2:
      {
      int v155 = 72;
      int v156 = v155 + v71;
      int v157 = v70[v156];
      int v158;
      v158 = v71;
      switch (v157) {
        default:
          {
          int v159 = 76;
          int v160 = v159 + v71;
          int v161 = v70[v160];
          int v162;
          v162 = v71;
          switch (v161) {
            case 0:
              {
              v162 = v71;
              break;
            }
            default:
              {
              v162 = v71;
            }
            case 1:
              {
              int v163 = 3;
              v162 = v163;
              break;
            }
            case 2:
              {
              int v164 = 0;
              int v165 = v71 + v164;
              v162 = v165;
              break;
            }
          }
          bool v166 = true;
          v158 = v162;
          break;
        }
        case 0:
          {
          int v167 = 4;
          v158 = v167;
          break;
        }
      }
      v95 = v158;
      break;
    }
  }
  bool v168 = true;
  int v169 = 16;
  int v170 = v169 + v71;
  bool v171 = true;
  int v172 = simt_wave_count_bits(v171);
  v69[v170] = v172;
  int v173 = 80;
  int v174 = v173 + v71;
  int v175 = v70[v174];
  int v176 = 0;
  bool v177 = v175 != v176;
  int v178;
  if (v177) {
    int v179 = 0;
    int v180 = 0;
    int v181;
    int v182;
    v181 = v179;
    v182 = v180;
    while (true) {
      int v183 = 4;
      int v184 = v182 * v183;
      int v185 = v184 + v71;
      int v186 = 84;
      int v187 = v186 + v185;
      int v188 = v70[v187];
      int v189 = 0;
      bool v190 = v188 != v189;
      v181 = v181;
      v182 = v182;
      if (!v190) break;
      int v191 = 0;
      int v192 = 0;
      int v193;
      int v194;
      v193 = v191;
      v194 = v192;
      while (true) {
        int v195 = 4;
        int v196 = v194 * v195;
        int v197 = v196 + v71;
        int v198 = 104;
        int v199 = v198 + v197;
        int v200 = v70[v199];
        int v201 = 0;
        bool v202 = v200 != v201;
        v193 = v193;
        v194 = v194;
        if (!v202) break;
        int v203 = v193 + v194;
        int v204 = 1;
        int v205 = v194 + v204;
        bool v206 = true;
        int v207 = 32;
        int v208 = 4;
        int v209 = v194 * v208;
        int v210 = v207 + v209;
        int v211 = v210 + v71;
        bool v212 = true;
        int v213 = simt_wave_count_bits(v212);
        v69[v211] = v213;
        v193 = v203;
        v194 = v205;
      }
      int v214 = v181 + v193;
      int v215 = 1;
      int v216 = v182 + v215;
      bool v217 = true;
      int v218 = 48;
      int v219 = 4;
      int v220 = v182 * v219;
      int v221 = v218 + v220;
      int v222 = v221 + v71;
      bool v223 = true;
      int v224 = simt_wave_count_bits(v223);
      v69[v222] = v224;
      v181 = v214;
      v182 = v216;
    }
    v178 = v181;
  } else {
    int v225 = 0;
    int v226 = 0;
    int v227;
    int v228;
    v227 = v225;
    v228 = v226;
    while (true) {
      int v229 = 4;
      int v230 = v228 * v229;
      int v231 = v230 + v71;
      int v232 = 124;
      int v233 = v232 + v231;
      int v234 = v70[v233];
      int v235 = 0;
      bool v236 = v234 != v235;
      v227 = v227;
      v228 = v228;
      if (!v236) break;
      int v237 = 4;
      int v238 = v227 + v237;
      int v239 = 1;
      int v240 = v228 + v239;
      bool v241 = true;
      int v242 = 64;
      int v243 = 4;
      int v244 = v228 * v243;
      int v245 = v242 + v244;
      int v246 = v245 + v71;
      bool v247 = true;
      int v248 = simt_wave_count_bits(v247);
      v69[v246] = v248;
      v227 = v238;
      v228 = v240;
    }
    v178 = v227;
  }
  int v249 = 80;
  int v250 = v249 + v71;
  bool v251 = true;
  int v252 = simt_wave_count_bits(v251);
  v69[v250] = v252;
  int v253 = 1;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 144; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
