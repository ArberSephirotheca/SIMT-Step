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
    bool v7 = true;
    int v8 = simt_wave_count_bits(v7);
    int v9 = 0;
    int v10 = v9 + v0;
    v1[v10] = v8;
    v6 = v8;
  } else {
    bool v11 = true;
    int v12 = simt_wave_count_bits(v11);
    int v13 = 16;
    int v14 = v13 + v0;
    v1[v14] = v12;
    v6 = v12;
  }
  int v15 = 4;
  int v16 = v3 % v15;
  int v17 = 1;
  int v18 = v0 + v17;
  int v19;
  v19 = v18;
  switch (v16) {
    case 0:
      {
      int v20 = 4;
      int v21 = v3 % v20;
      int v22 = 1;
      int v23;
      v23 = v22;
      switch (v21) {
        case 0:
          {
          int v24 = 0;
          bool v25 = v2 != v24;
          int v26;
          if (v25) {
            int v27 = 3;
            int v28 = v0 + v27;
            v26 = v28;
          } else {
            int v29 = 4;
            v26 = v29;
          }
          v23 = v26;
        }
        case 1:
          {
          int v30 = 0;
          bool v31 = v2 != v30;
          int v32;
          if (v31) {
            int v33 = 2;
            v32 = v33;
          } else {
            v32 = v0;
          }
          v23 = v32;
          break;
        }
        case 2:
          {
          int v34 = 0;
          int v35 = 0;
          int v36;
          int v37;
          v36 = v34;
          v37 = v35;
          while (true) {
            int v38 = 4;
            int v39 = v3 % v38;
            int v40 = 1;
            int v41 = v39 + v40;
            bool v42 = v37 < v41;
            v36 = v36;
            v37 = v37;
            if (!v42) break;
            int v43 = 0;
            int v44 = v0 + v43;
            int v45 = 1;
            int v46 = v37 + v45;
            v36 = v44;
            v37 = v46;
          }
          v23 = v36;
        }
        default:
          {
          int v47 = 4;
          int v48 = v0 + v47;
          v23 = v48;
          break;
        }
      }
      v19 = v23;
      break;
    }
    case 1:
      {
      int v49 = 0;
      bool v50 = v2 != v49;
      int v51;
      if (v50) {
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
          int v61 = 2;
          int v62 = 1;
          int v63 = v55 + v62;
          v54 = v61;
          v55 = v63;
          continue;
          ;
        }
        v51 = v54;
      } else {
        v51 = v0;
      }
      v19 = v51;
      break;
    }
    default:
      {
      int v64 = 0;
      bool v65 = v2 != v64;
      int v66;
      if (v65) {
        v66 = v0;
      } else {
        int v67 = 0;
        bool v68 = v2 != v67;
        int v69;
        if (v68) {
          v69 = v0;
        } else {
          int v70 = 4;
          int v71 = v0 + v70;
          v69 = v71;
        }
        v66 = v69;
      }
      v19 = v66;
      break;
    }
    case 2:
      {
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
        int v81 = 0;
        int v82 = v0 + v81;
        int v83;
        v83 = v82;
        switch (v3) {
          case 0:
            {
            int v84 = 0;
            int v85 = v0 + v84;
            v83 = v85;
            break;
          }
          default:
            {
            v83 = v0;
            break;
          }
        }
        int v86 = 1;
        int v87 = v75 + v86;
        v74 = v83;
        v75 = v87;
        continue;
        ;
      }
      v19 = v74;
      break;
    }
  }
  bool v88 = true;
  int v89 = simt_wave_count_bits(v88);
  int v90 = 32;
  int v91 = v90 + v0;
  v1[v91] = v89;
  int v92 = 0;
  bool v93 = v2 != v92;
  int v94 = v93 ? v6 : v19;
  return;
}

kernel void kernel_main(device int* v95 [[buffer(0)]], device int* v96 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v97 = static_cast<int>(__simt_tid3.x);
  int v98 = 0;
  int v99 = v98 + v97;
  int v100 = v96[v99];
  int v101 = 4;
  int v102 = v101 + v97;
  int v103 = v96[v102];
  int v104 = 0;
  bool v105 = v100 != v104;
  if (v105) {
  } else {
    int v106 = 8;
    int v107 = v106 + v97;
    int v108 = v96[v107];
    int v109 = 0;
    bool v110 = v108 != v109;
    if (v110) {
    } else {
      int v111 = 4;
      int v112 = v97 % v111;
      uint v113 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v114 = (int)(v113);
      int v115;
      v115 = v114;
      switch (v112) {
        default:
          {
          int v116 = 2;
          int v117 = v115 + v116;
          v115 = v117;
          break;
        }
        case 0:
          {
          int v118 = 3;
          int v119 = v115 + v118;
          v115 = v119;
          break;
        }
        case 1:
          {
          int v120 = 4;
          int v121 = v115 + v120;
          v115 = v121;
          break;
        }
        case 2:
          {
          int v122 = 1;
          int v123 = v115 + v122;
          v115 = v123;
          break;
        }
      }
      helper0(v97, v95, v100, v103, static_cast<int>(__simt_tid3.x));
    }
  }
  int v124 = 12;
  int v125 = v124 + v97;
  int v126 = v96[v125];
  int v127 = 0;
  bool v128 = v126 != v127;
  int v129;
  if (v128) {
    int v130 = 16;
    int v131 = v130 + v97;
    int v132 = v96[v131];
    uint v133 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v134 = (int)(v133);
    int v135;
    v135 = v134;
    switch (v132) {
      default:
        {
        v135 = v97;
        break;
      }
      case 0:
        {
        int v136 = 0;
        int v137 = 0;
        int v138;
        int v139;
        v138 = v136;
        v139 = v137;
        while (true) {
          int v140 = 4;
          int v141 = v139 * v140;
          int v142 = v141 + v97;
          int v143 = 20;
          int v144 = v143 + v142;
          int v145 = v96[v144];
          int v146 = 0;
          bool v147 = v145 != v146;
          v138 = v138;
          v139 = v139;
          if (!v147) break;
          int v148 = v138 + v139;
          int v149 = 1;
          int v150 = v139 + v149;
          bool v151 = true;
          v138 = v148;
          v139 = v150;
        }
        v135 = v138;
        break;
      }
    }
    v129 = v135;
  } else {
    v129 = v97;
  }
  int v152 = 48;
  int v153 = v152 + v97;
  bool v154 = true;
  int v155 = simt_wave_count_bits(v154);
  v95[v153] = v155;
  int v156 = 40;
  int v157 = v156 + v97;
  int v158 = v96[v157];
  int v159 = 2;
  int v160;
  v160 = v159;
  switch (v158) {
    case 0:
      {
      int v161 = 1;
      v160 = v161;
      break;
    }
    case 1:
      {
      int v162 = 4;
      v160 = v162;
      break;
    }
    case 2:
      {
      int v163 = 4;
      v160 = v163;
      break;
    }
    default:
      {
      int v164 = 44;
      int v165 = v164 + v97;
      int v166 = v96[v165];
      int v167;
      v167 = v97;
      switch (v166) {
        default:
          {
          int v168 = 48;
          int v169 = v168 + v97;
          int v170 = v96[v169];
          int v171 = 0;
          bool v172 = v170 != v171;
          int v173;
          if (v172) {
            int v174 = 3;
            int v175 = v97 + v174;
            v173 = v175;
          } else {
            int v176 = 4;
            int v177 = v97 + v176;
            v173 = v177;
          }
          v167 = v173;
        }
        case 0:
          {
          int v178 = 52;
          int v179 = v178 + v97;
          int v180 = v96[v179];
          int v181;
          v181 = v97;
          switch (v180) {
            case 0:
              {
              int v182 = 3;
              int v183 = v97 + v182;
              v181 = v183;
              break;
            }
            default:
              {
              v181 = v97;
              break;
            }
          }
          v167 = v181;
        }
        case 1:
          {
          int v184 = 56;
          int v185 = v184 + v97;
          int v186 = v96[v185];
          int v187 = 0;
          bool v188 = v186 != v187;
          int v189;
          if (v188) {
            v189 = v97;
          } else {
            int v190 = 0;
            v189 = v190;
          }
          v167 = v189;
          break;
        }
        case 2:
          {
          int v191 = 60;
          int v192 = v191 + v97;
          int v193 = v96[v192];
          int v194 = 0;
          int v195 = v97 + v194;
          int v196;
          v196 = v195;
          switch (v193) {
            default:
              {
              int v197 = 1;
              v196 = v197;
              break;
            }
            case 0:
              {
              v196 = v97;
              break;
            }
          }
          bool v198 = true;
          v167 = v196;
          break;
        }
      }
      bool v199 = true;
      v160 = v167;
      break;
    }
  }
  int v200 = 0;
  int v201 = 0;
  int v202;
  int v203;
  v202 = v200;
  v203 = v201;
  while (true) {
    int v204 = 4;
    int v205 = v203 * v204;
    int v206 = v205 + v97;
    int v207 = 64;
    int v208 = v207 + v206;
    int v209 = v96[v208];
    int v210 = 0;
    bool v211 = v209 != v210;
    v202 = v202;
    v203 = v203;
    if (!v211) break;
    int v212 = 0;
    int v213 = 0;
    int v214;
    int v215;
    v214 = v212;
    v215 = v213;
    while (true) {
      int v216 = 4;
      int v217 = v215 * v216;
      int v218 = v217 + v97;
      int v219 = 84;
      int v220 = v219 + v218;
      int v221 = v96[v220];
      int v222 = 0;
      bool v223 = v221 != v222;
      v214 = v214;
      v215 = v215;
      if (!v223) break;
      uint v224 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v225 = (int)(v224);
      int v226 = v214 + v225;
      int v227 = 1;
      int v228 = v215 + v227;
      bool v229 = true;
      int v230 = 64;
      int v231 = 4;
      int v232 = v215 * v231;
      int v233 = v230 + v232;
      int v234 = v233 + v97;
      bool v235 = true;
      int v236 = simt_wave_count_bits(v235);
      v95[v234] = v236;
      v214 = v226;
      v215 = v228;
    }
    int v237 = v202 + v214;
    int v238 = 1;
    int v239 = v203 + v238;
    bool v240 = true;
    int v241 = 80;
    int v242 = 4;
    int v243 = v203 * v242;
    int v244 = v241 + v243;
    int v245 = v244 + v97;
    bool v246 = true;
    int v247 = simt_wave_count_bits(v246);
    v95[v245] = v247;
    v202 = v237;
    v203 = v239;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(2), static_cast<int32_t>(4), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 88; ++idx) {
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
