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
  int v4 = 2;
  int v5 = v3 % v4;
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 3;
      v8 = v9;
      break;
    }
    case 0:
      {
      int v10 = 0;
      bool v11 = v2 != v10;
      int v12;
      if (v11) {
        int v13 = 0;
        bool v14 = v2 != v13;
        int v15;
        if (v14) {
          int v16 = 3;
          v15 = v16;
        } else {
          int v17 = 3;
          v15 = v17;
        }
        v12 = v15;
      } else {
        int v18 = 3;
        int v19 = v3 % v18;
        int v20;
        v20 = v0;
        switch (v19) {
          case 0:
            {
            int v21 = 4;
            v20 = v21;
            break;
          }
          case 1:
            {
            v20 = v0;
            break;
          }
          default:
            {
            v20 = v0;
            break;
          }
          case 2:
            {
            v20 = v0;
            break;
          }
        }
        v12 = v20;
      }
      v8 = v12;
      break;
    }
    case 1:
      {
      int v22 = 0;
      bool v23 = v2 != v22;
      int v24;
      if (v23) {
        int v25 = 3;
        int v26 = v3 % v25;
        int v27 = 4;
        int v28;
        v28 = v27;
        switch (v26) {
          case 0:
            {
            v28 = v0;
          }
          case 1:
            {
            int v29 = 2;
            v28 = v29;
          }
          case 2:
            {
            v28 = v0;
          }
          default:
            {
            v28 = v0;
            break;
          }
        }
        int v30 = 3;
        v24 = v28;
      } else {
        int v31 = 3;
        int v32 = v3 % v31;
        int v33;
        v33 = v0;
        switch (v32) {
          case 0:
            {
            v33 = v0;
          }
          case 1:
            {
            int v34 = 2;
            v33 = v34;
          }
          default:
            {
            int v35 = 2;
            v33 = v35;
            break;
          }
        }
        int v36 = 2;
        int v37 = v0 + v36;
        v24 = v33;
      }
      v8 = v24;
      break;
    }
  }
  bool v38 = true;
  int v39 = simt_wave_count_bits(v38);
  int v40 = 0;
  int v41 = v40 + v0;
  v1[v41] = v39;
  return;
}

kernel void kernel_main(device int* v42 [[buffer(0)]], device int* v43 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v44 = static_cast<int>(__simt_tid3.x);
  int v45 = 0;
  int v46 = v45 + v44;
  int v47 = v43[v46];
  int v48 = 4;
  int v49 = v48 + v44;
  int v50 = v43[v49];
  helper0(v44, v42, v47, v50, static_cast<int>(__simt_tid3.x));
  int v51 = 8;
  int v52 = v51 + v44;
  int v53 = v43[v52];
  int v54;
  v54 = v44;
  switch (v53) {
    case 0:
      {
      int v55 = 12;
      int v56 = v55 + v44;
      int v57 = v43[v56];
      int v58 = 0;
      bool v59 = v57 != v58;
      int v60;
      if (v59) {
        int v61 = 2;
        int v62 = v44 + v61;
        v60 = v62;
      } else {
        v60 = v44;
      }
      v54 = v60;
      break;
    }
    default:
      {
      int v63 = 16;
      int v64 = v63 + v44;
      int v65 = v43[v64];
      int v66 = 2;
      int v67;
      v67 = v66;
      switch (v65) {
        case 0:
          {
          int v68 = 20;
          int v69 = v68 + v44;
          int v70 = v43[v69];
          int v71 = 4;
          int v72;
          v72 = v71;
          switch (v70) {
            case 0:
              {
              v72 = v44;
              break;
            }
            default:
              {
              v72 = v44;
              break;
            }
            case 1:
              {
              int v73 = 3;
              int v74 = v44 + v73;
              v72 = v74;
            }
            case 2:
              {
              int v75 = 1;
              int v76 = v44 + v75;
              v72 = v76;
              break;
            }
          }
          bool v77 = true;
          v67 = v72;
          break;
        }
        case 1:
          {
          v67 = v44;
          break;
        }
        default:
          {
          int v78 = 24;
          int v79 = v78 + v44;
          int v80 = v43[v79];
          int v81 = 0;
          bool v82 = v80 != v81;
          int v83;
          if (v82) {
            v83 = v44;
          } else {
            int v84 = 3;
            int v85 = v44 + v84;
            v83 = v85;
          }
          v67 = v83;
          break;
        }
        case 2:
          {
          int v86 = 0;
          v67 = v86;
          break;
        }
      }
      v54 = v67;
      break;
    }
  }
  int v87 = 28;
  int v88 = v87 + v44;
  int v89 = v43[v88];
  int v90 = 2;
  int v91 = v44 + v90;
  int v92;
  v92 = v91;
  switch (v89) {
    case 0:
      {
      int v93 = 32;
      int v94 = v93 + v44;
      int v95 = v43[v94];
      int v96 = 0;
      bool v97 = v95 != v96;
      int v98;
      if (v97) {
        int v99 = 3;
        int v100 = v44 + v99;
        v98 = v100;
      } else {
        int v101 = 1;
        v98 = v101;
      }
      v92 = v98;
    }
    default:
      {
      int v102 = 36;
      int v103 = v102 + v44;
      int v104 = v43[v103];
      int v105 = 0;
      bool v106 = v104 != v105;
      int v107;
      if (v106) {
        int v108 = 40;
        int v109 = v108 + v44;
        int v110 = v43[v109];
        int v111;
        v111 = v44;
        switch (v110) {
          default:
            {
            v111 = v44;
            break;
          }
          case 0:
            {
            int v112 = 0;
            v111 = v112;
          }
          case 1:
            {
            int v113 = 0;
            v111 = v113;
            break;
          }
          case 2:
            {
            int v114 = 3;
            v111 = v114;
            break;
          }
        }
        v107 = v111;
      } else {
        int v115 = 44;
        int v116 = v115 + v44;
        int v117 = v43[v116];
        int v118;
        v118 = v44;
        switch (v117) {
          default:
            {
            v118 = v44;
          }
          case 0:
            {
            int v119 = 4;
            int v120 = v44 + v119;
            v118 = v120;
            break;
          }
          case 1:
            {
            int v121 = 4;
            v118 = v121;
            break;
          }
        }
        v107 = v118;
      }
      v92 = v107;
      break;
    }
    case 1:
      {
      int v122 = 48;
      int v123 = v122 + v44;
      int v124 = v43[v123];
      int v125 = 0;
      int v126 = v44 + v125;
      int v127;
      v127 = v126;
      switch (v124) {
        case 0:
          {
          int v128 = 52;
          int v129 = v128 + v44;
          int v130 = v43[v129];
          int v131 = 0;
          bool v132 = v130 != v131;
          int v133;
          if (v132) {
            int v134 = 3;
            v133 = v134;
          } else {
            int v135 = 0;
            int v136 = v44 + v135;
            v133 = v136;
          }
          v127 = v133;
          break;
        }
        default:
          {
          int v137 = 0;
          int v138 = 0;
          int v139;
          int v140;
          v139 = v137;
          v140 = v138;
          while (true) {
            int v141 = 4;
            int v142 = v140 * v141;
            int v143 = v142 + v44;
            int v144 = 56;
            int v145 = v144 + v143;
            int v146 = v43[v145];
            int v147 = 0;
            bool v148 = v146 != v147;
            v139 = v139;
            v140 = v140;
            if (!v148) break;
            int v149 = v139 + v140;
            int v150 = 1;
            int v151 = v140 + v150;
            bool v152 = true;
            v139 = v149;
            v140 = v151;
          }
          v127 = v139;
          break;
        }
        case 1:
          {
          int v153 = 0;
          int v154 = v44 + v153;
          v127 = v154;
          break;
        }
      }
      bool v155 = true;
      v92 = v127;
      break;
    }
    case 2:
      {
      int v156 = 76;
      int v157 = v156 + v44;
      int v158 = v43[v157];
      int v159 = 0;
      bool v160 = v158 != v159;
      int v161;
      if (v160) {
        int v162 = 1;
        v161 = v162;
      } else {
        int v163 = 80;
        int v164 = v163 + v44;
        int v165 = v43[v164];
        int v166 = 0;
        bool v167 = v165 != v166;
        int v168;
        if (v167) {
          int v169 = 4;
          int v170 = v44 + v169;
          v168 = v170;
        } else {
          int v171 = 1;
          int v172 = v44 + v171;
          v168 = v172;
        }
        v161 = v168;
      }
      v92 = v161;
      break;
    }
  }
  int v173 = 84;
  int v174 = v173 + v44;
  int v175 = v43[v174];
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
      int v185 = v184 + v44;
      int v186 = 88;
      int v187 = v186 + v185;
      int v188 = v43[v187];
      int v189 = 0;
      bool v190 = v188 != v189;
      v181 = v181;
      v182 = v182;
      if (!v190) break;
      int v191 = v181 + v182;
      int v192 = 1;
      int v193 = v182 + v192;
      bool v194 = true;
      int v195 = 16;
      int v196 = 4;
      int v197 = v182 * v196;
      int v198 = v195 + v197;
      int v199 = v198 + v44;
      bool v200 = true;
      int v201 = simt_wave_count_bits(v200);
      v42[v199] = v201;
      v181 = v191;
      v182 = v193;
    }
    v178 = v181;
  } else {
    int v202 = 0;
    int v203 = 0;
    int v204;
    int v205;
    v204 = v202;
    v205 = v203;
    while (true) {
      int v206 = 4;
      int v207 = v205 * v206;
      int v208 = v207 + v44;
      int v209 = 108;
      int v210 = v209 + v208;
      int v211 = v43[v210];
      int v212 = 0;
      bool v213 = v211 != v212;
      v204 = v204;
      v205 = v205;
      if (!v213) break;
      int v214 = 128;
      int v215 = v214 + v44;
      int v216 = v43[v215];
      int v217 = 4;
      int v218 = v44 + v217;
      int v219;
      v219 = v218;
      switch (v216) {
        case 0:
          {
          int v220 = 3;
          v219 = v220;
          break;
        }
        case 1:
          {
          int v221 = 1;
          v219 = v221;
          break;
        }
        default:
          {
          int v222 = 4;
          v219 = v222;
          break;
        }
      }
      bool v223 = true;
      int v224 = 32;
      int v225 = v224 + v44;
      bool v226 = true;
      int v227 = simt_wave_count_bits(v226);
      v42[v225] = v227;
      int v228 = v204 + v219;
      int v229 = 1;
      int v230 = v205 + v229;
      bool v231 = true;
      int v232 = 48;
      int v233 = 4;
      int v234 = v205 * v233;
      int v235 = v232 + v234;
      int v236 = v235 + v44;
      bool v237 = true;
      int v238 = simt_wave_count_bits(v237);
      v42[v236] = v238;
      v204 = v228;
      v205 = v230;
    }
    v178 = v204;
  }
  int v239 = 64;
  int v240 = v239 + v44;
  bool v241 = true;
  int v242 = simt_wave_count_bits(v241);
  v42[v240] = v242;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 132; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
