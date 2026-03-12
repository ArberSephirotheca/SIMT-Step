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
    bool v13 = true;
    int v14 = simt_wave_count_bits(v13);
    int v15 = 0;
    int v16 = 4;
    int v17 = v7 * v16;
    int v18 = v15 + v17;
    int v19 = v18 + v0;
    v1[v19] = v14;
    int v20 = 1;
    int v21 = v7 + v20;
    v6 = v14;
    v7 = v21;
  }
  int v22 = 4;
  int v23 = v3 % v22;
  int v24 = 4;
  int v25 = v0 + v24;
  int v26;
  v26 = v25;
  switch (v23) {
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
        int v36 = 0;
        int v37 = 0;
        int v38;
        int v39;
        v38 = v36;
        v39 = v37;
        while (true) {
          int v40 = 4;
          int v41 = v3 % v40;
          int v42 = 1;
          int v43 = v41 + v42;
          bool v44 = v39 < v43;
          v38 = v38;
          v39 = v39;
          if (!v44) break;
          int v45 = 1;
          int v46 = v39 + v45;
          v38 = v0;
          v39 = v46;
        }
        int v47 = 1;
        int v48 = v30 + v47;
        v29 = v38;
        v30 = v48;
        break;
        ;
      }
      v26 = v29;
      break;
    }
    case 0:
      {
      int v49 = 0;
      int v50 = 0;
      int v51;
      int v52;
      v51 = v49;
      v52 = v50;
      while (true) {
        int v53 = 4;
        int v54 = v3 % v53;
        int v55 = 1;
        int v56 = v54 + v55;
        bool v57 = v52 < v56;
        v51 = v51;
        v52 = v52;
        if (!v57) break;
        int v58 = 0;
        bool v59 = v2 != v58;
        int v60;
        if (v59) {
          int v61 = 1;
          int v62 = v0 + v61;
          v60 = v62;
        } else {
          int v63 = 3;
          int v64 = v0 + v63;
          v60 = v64;
        }
        int v65 = 1;
        int v66 = v52 + v65;
        v51 = v60;
        v52 = v66;
        break;
        ;
      }
      v26 = v51;
    }
    case 1:
      {
      int v67 = 2;
      int v68 = v0 + v67;
      v26 = v68;
      break;
    }
    case 2:
      {
      int v69 = 0;
      bool v70 = v2 != v69;
      int v71;
      if (v70) {
        int v72 = 0;
        int v73 = 0;
        int v74;
        int v75;
        v74 = v72;
        v75 = v73;
        while (true) {
          int v76 = 4;
          int v77 = v3 % v76;
          int v78 = 1;
          int v79 = v77 + v78;
          bool v80 = v75 < v79;
          v74 = v74;
          v75 = v75;
          if (!v80) break;
          int v81 = 2;
          int v82 = v0 + v81;
          int v83 = 1;
          int v84 = v75 + v83;
          v74 = v82;
          v75 = v84;
        }
        v71 = v74;
      } else {
        int v85 = 3;
        int v86 = v3 % v85;
        int v87;
        v87 = v0;
        switch (v86) {
          case 0:
            {
            int v88 = 3;
            int v89 = v0 + v88;
            v87 = v89;
            break;
          }
          case 1:
            {
            int v90 = 3;
            v87 = v90;
          }
          default:
            {
            int v91 = 1;
            v87 = v91;
            break;
          }
          case 2:
            {
            int v92 = 0;
            v87 = v92;
            break;
          }
        }
        v71 = v87;
      }
      v26 = v71;
      break;
    }
  }
  bool v93 = true;
  int v94 = simt_wave_count_bits(v93);
  int v95 = 16;
  int v96 = v95 + v0;
  v1[v96] = v94;
  int v97 = 0;
  bool v98 = v2 != v97;
  int v99 = v98 ? v6 : v26;
  return;
}

kernel void kernel_main(device int* v100 [[buffer(0)]], device int* v101 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v102 = static_cast<int>(__simt_tid3.x);
  int v103 = 0;
  int v104 = v103 + v102;
  int v105 = v101[v104];
  int v106 = 4;
  int v107 = v106 + v102;
  int v108 = v101[v107];
  helper0(v102, v100, v105, v108, static_cast<int>(__simt_tid3.x));
  int v109 = 0;
  int v110 = v102 + v109;
  int v111 = 0;
  int v112 = 0;
  int v113;
  int v114;
  v113 = v111;
  v114 = v112;
  while (true) {
    int v115 = 4;
    int v116 = v114 * v115;
    int v117 = v116 + v102;
    int v118 = 8;
    int v119 = v118 + v117;
    int v120 = v101[v119];
    int v121 = 0;
    bool v122 = v120 != v121;
    v113 = v113;
    v114 = v114;
    if (!v122) break;
    int v123 = 0;
    int v124 = 0;
    int v125;
    int v126;
    v125 = v123;
    v126 = v124;
    while (true) {
      int v127 = 4;
      int v128 = v126 * v127;
      int v129 = v128 + v102;
      int v130 = 28;
      int v131 = v130 + v129;
      int v132 = v101[v131];
      int v133 = 0;
      bool v134 = v132 != v133;
      v125 = v125;
      v126 = v126;
      if (!v134) break;
      int v135 = 48;
      int v136 = v135 + v102;
      int v137 = v101[v136];
      uint v138 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v139 = (int)(v138);
      int v140;
      v140 = v139;
      switch (v137) {
        default:
          {
          int v141 = 0;
          v140 = v141;
          break;
        }
        case 0:
          {
          int v142 = 2;
          v140 = v142;
          break;
        }
      }
      bool v143 = true;
      int v144 = 32;
      int v145 = v144 + v102;
      bool v146 = true;
      int v147 = simt_wave_count_bits(v146);
      v100[v145] = v147;
      int v148 = v125 + v140;
      int v149 = 1;
      int v150 = v126 + v149;
      bool v151 = true;
      int v152 = 48;
      int v153 = 4;
      int v154 = v126 * v153;
      int v155 = v152 + v154;
      int v156 = v155 + v102;
      bool v157 = true;
      int v158 = simt_wave_count_bits(v157);
      v100[v156] = v158;
      v125 = v148;
      v126 = v150;
    }
    int v159 = v113 + v125;
    int v160 = 1;
    int v161 = v114 + v160;
    bool v162 = true;
    int v163 = 64;
    int v164 = 4;
    int v165 = v114 * v164;
    int v166 = v163 + v165;
    int v167 = v166 + v102;
    bool v168 = true;
    int v169 = simt_wave_count_bits(v168);
    v100[v167] = v169;
    v113 = v159;
    v114 = v161;
  }
  int v170 = 52;
  int v171 = v170 + v102;
  int v172 = v101[v171];
  int v173 = 0;
  int v174;
  v174 = v173;
  switch (v172) {
    default:
      {
      int v175 = 56;
      int v176 = v175 + v102;
      int v177 = v101[v176];
      int v178 = 1;
      int v179 = v102 + v178;
      int v180;
      v180 = v179;
      switch (v177) {
        case 0:
          {
          int v181 = 60;
          int v182 = v181 + v102;
          int v183 = v101[v182];
          int v184 = 3;
          int v185 = v102 + v184;
          int v186;
          v186 = v185;
          switch (v183) {
            default:
              {
              int v187 = 1;
              v186 = v187;
              break;
            }
            case 0:
              {
              int v188 = 3;
              int v189 = v102 + v188;
              v186 = v189;
            }
            case 1:
              {
              int v190 = 4;
              v186 = v190;
              break;
            }
            case 2:
              {
              v186 = v102;
              break;
            }
          }
          v180 = v186;
        }
        default:
          {
          int v191 = 0;
          int v192 = 0;
          int v193;
          int v194;
          v193 = v191;
          v194 = v192;
          while (true) {
            int v195 = 4;
            int v196 = v194 * v195;
            int v197 = v196 + v102;
            int v198 = 64;
            int v199 = v198 + v197;
            int v200 = v101[v199];
            int v201 = 0;
            bool v202 = v200 != v201;
            v193 = v193;
            v194 = v194;
            if (!v202) break;
            int v203 = v193 + v194;
            int v204 = 1;
            int v205 = v194 + v204;
            bool v206 = true;
            v193 = v203;
            v194 = v205;
          }
          v180 = v193;
          break;
        }
      }
      v174 = v180;
      break;
    }
    case 0:
      {
      int v207 = 0;
      int v208 = 0;
      int v209;
      int v210;
      v209 = v207;
      v210 = v208;
      while (true) {
        int v211 = 4;
        int v212 = v210 * v211;
        int v213 = v212 + v102;
        int v214 = 84;
        int v215 = v214 + v213;
        int v216 = v101[v215];
        int v217 = 0;
        bool v218 = v216 != v217;
        v209 = v209;
        v210 = v210;
        if (!v218) break;
        int v219 = v209 + v210;
        int v220 = 1;
        int v221 = v210 + v220;
        bool v222 = true;
        v209 = v219;
        v210 = v221;
      }
      v174 = v209;
      break;
    }
    case 1:
      {
      int v223 = 3;
      v174 = v223;
    }
    case 2:
      {
      int v224 = 104;
      int v225 = v224 + v102;
      int v226 = v101[v225];
      int v227 = 2;
      int v228 = v102 + v227;
      int v229;
      v229 = v228;
      switch (v226) {
        case 0:
          {
          int v230 = 108;
          int v231 = v230 + v102;
          int v232 = v101[v231];
          int v233 = 1;
          int v234 = v102 + v233;
          int v235;
          v235 = v234;
          switch (v232) {
            case 0:
              {
              v235 = v102;
              break;
            }
            case 1:
              {
              int v236 = 2;
              int v237 = v102 + v236;
              v235 = v237;
              break;
            }
            default:
              {
              int v238 = 2;
              int v239 = v102 + v238;
              v235 = v239;
              break;
            }
          }
          bool v240 = true;
          v229 = v235;
          break;
        }
        default:
          {
          int v241 = 112;
          int v242 = v241 + v102;
          int v243 = v101[v242];
          int v244;
          v244 = v102;
          switch (v243) {
            default:
              {
              int v245 = 3;
              int v246 = v102 + v245;
              v244 = v246;
              break;
            }
            case 0:
              {
              int v247 = 1;
              int v248 = v102 + v247;
              v244 = v248;
              break;
            }
            case 1:
              {
              int v249 = 4;
              int v250 = v102 + v249;
              v244 = v250;
              break;
            }
          }
          bool v251 = true;
          v229 = v244;
          break;
        }
      }
      bool v252 = true;
      v174 = v229;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 116; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
