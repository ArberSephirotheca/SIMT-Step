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
  int v22 = 0;
  int v23 = 0;
  int v24;
  int v25;
  v24 = v22;
  v25 = v23;
  while (true) {
    int v26 = 4;
    int v27 = v3 % v26;
    int v28 = 1;
    int v29 = v27 + v28;
    bool v30 = v25 < v29;
    v24 = v24;
    v25 = v25;
    if (!v30) break;
    bool v31 = true;
    int v32 = simt_wave_count_bits(v31);
    int v33 = 16;
    int v34 = 4;
    int v35 = v25 * v34;
    int v36 = v33 + v35;
    int v37 = v36 + v0;
    v1[v37] = v32;
    int v38 = 1;
    int v39 = v25 + v38;
    v24 = v32;
    v25 = v39;
  }
  int v40 = 0;
  bool v41 = v2 != v40;
  int v42 = v41 ? v6 : v24;
  uint v43 = simt_subgroup_id(__simt_tid);
  int v44 = (int)(v43);
  int v45;
  v45 = v44;
  switch (v3) {
    default:
      {
      int v46 = 2;
      int v47 = v3 % v46;
      int v48 = 3;
      int v49 = v0 + v48;
      int v50;
      v50 = v49;
      switch (v47) {
        case 0:
          {
          int v51 = 0;
          int v52 = 0;
          int v53;
          int v54;
          v53 = v51;
          v54 = v52;
          while (true) {
            int v55 = 4;
            int v56 = v3 % v55;
            int v57 = 1;
            int v58 = v56 + v57;
            bool v59 = v54 < v58;
            v53 = v53;
            v54 = v54;
            if (!v59) break;
            int v60 = 0;
            int v61 = v0 + v60;
            int v62 = 1;
            int v63 = v54 + v62;
            v53 = v61;
            v54 = v63;
            continue;
            ;
          }
          v50 = v53;
          break;
        }
        case 1:
          {
          int v64 = 0;
          bool v65 = v2 != v64;
          int v66;
          if (v65) {
            int v67 = 1;
            int v68 = v0 + v67;
            v66 = v68;
          } else {
            v66 = v0;
          }
          v50 = v66;
          break;
        }
        default:
          {
          int v69 = 0;
          int v70 = 0;
          int v71;
          int v72;
          v71 = v69;
          v72 = v70;
          while (true) {
            int v73 = 4;
            int v74 = v3 % v73;
            int v75 = 1;
            int v76 = v74 + v75;
            bool v77 = v72 < v76;
            v71 = v71;
            v72 = v72;
            if (!v77) break;
            int v78 = 1;
            int v79 = v72 + v78;
            v71 = v0;
            v72 = v79;
          }
          v50 = v71;
          break;
        }
      }
      v45 = v50;
      break;
    }
    case 0:
      {
      int v80;
      v80 = v0;
      switch (v3) {
        default:
          {
          int v81 = 0;
          int v82 = 0;
          int v83;
          int v84;
          v83 = v81;
          v84 = v82;
          while (true) {
            int v85 = 4;
            int v86 = v3 % v85;
            int v87 = 1;
            int v88 = v86 + v87;
            bool v89 = v84 < v88;
            v83 = v83;
            v84 = v84;
            if (!v89) break;
            int v90 = 1;
            int v91 = v84 + v90;
            v83 = v0;
            v84 = v91;
          }
          v80 = v83;
          break;
        }
        case 0:
          {
          int v92 = 0;
          bool v93 = v2 != v92;
          int v94;
          if (v93) {
            v94 = v0;
          } else {
            int v95 = 3;
            v94 = v95;
          }
          v80 = v94;
          break;
        }
      }
      v45 = v80;
      break;
    }
  }
  int v96 = 0;
  bool v97 = v2 != v96;
  int v98 = v97 ? v42 : v45;
  return;
}

kernel void kernel_main(device int* v99 [[buffer(0)]], device int* v100 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v101 = static_cast<int>(__simt_tid3.x);
  int v102 = 0;
  int v103 = v102 + v101;
  int v104 = v100[v103];
  int v105 = 4;
  int v106 = v105 + v101;
  int v107 = v100[v106];
  helper0(v101, v99, v104, v107, static_cast<int>(__simt_tid3.x));
  int v108 = 8;
  int v109 = v108 + v101;
  int v110 = v100[v109];
  uint v111 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v112 = (int)(v111);
  int v113;
  v113 = v112;
  switch (v110) {
    case 0:
      {
      int v114 = 12;
      int v115 = v114 + v101;
      int v116 = v100[v115];
      int v117;
      v117 = v101;
      switch (v116) {
        case 0:
          {
          v117 = v101;
        }
        default:
          {
          int v118 = 4;
          int v119 = v101 + v118;
          v117 = v119;
          break;
        }
      }
      v113 = v117;
      break;
    }
    default:
      {
      int v120 = 16;
      int v121 = v120 + v101;
      int v122 = v100[v121];
      int v123 = 0;
      bool v124 = v122 != v123;
      int v125;
      if (v124) {
        int v126 = 0;
        int v127 = 0;
        int v128;
        int v129;
        v128 = v126;
        v129 = v127;
        while (true) {
          int v130 = 4;
          int v131 = v129 * v130;
          int v132 = v131 + v101;
          int v133 = 20;
          int v134 = v133 + v132;
          int v135 = v100[v134];
          int v136 = 0;
          bool v137 = v135 != v136;
          v128 = v128;
          v129 = v129;
          if (!v137) break;
          int v138 = v128 + v129;
          int v139 = 1;
          int v140 = v129 + v139;
          bool v141 = true;
          v128 = v138;
          v129 = v140;
          break;
          ;
        }
        v125 = v128;
      } else {
        int v142 = 40;
        int v143 = v142 + v101;
        int v144 = v100[v143];
        int v145 = 1;
        int v146 = v101 + v145;
        int v147;
        v147 = v146;
        switch (v144) {
          default:
            {
            v147 = v101;
            break;
          }
          case 0:
            {
            int v148 = 3;
            int v149 = v101 + v148;
            v147 = v149;
            break;
          }
          case 1:
            {
            int v150 = 2;
            int v151 = v101 + v150;
            v147 = v151;
            break;
          }
          case 2:
            {
            int v152 = 0;
            int v153 = v101 + v152;
            v147 = v153;
            break;
          }
        }
        v125 = v147;
      }
      v113 = v125;
      break;
    }
  }
  int v154 = 44;
  int v155 = v154 + v101;
  int v156 = v100[v155];
  int v157 = 0;
  bool v158 = v156 != v157;
  int v159;
  if (v158) {
    int v160 = 0;
    int v161 = 0;
    int v162;
    int v163;
    v162 = v160;
    v163 = v161;
    while (true) {
      int v164 = 4;
      int v165 = v163 * v164;
      int v166 = v165 + v101;
      int v167 = 48;
      int v168 = v167 + v166;
      int v169 = v100[v168];
      int v170 = 0;
      bool v171 = v169 != v170;
      v162 = v162;
      v163 = v163;
      if (!v171) break;
      int v172 = 68;
      int v173 = v172 + v101;
      int v174 = v100[v173];
      int v175 = 0;
      bool v176 = v174 != v175;
      int v177;
      if (v176) {
        uint v178 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v179 = (int)(v178);
        v177 = v179;
      } else {
        v177 = v101;
      }
      int v180 = 32;
      int v181 = v180 + v101;
      bool v182 = true;
      int v183 = simt_wave_count_bits(v182);
      v99[v181] = v183;
      int v184 = v162 + v177;
      int v185 = 1;
      int v186 = v163 + v185;
      bool v187 = true;
      int v188 = 48;
      int v189 = 4;
      int v190 = v163 * v189;
      int v191 = v188 + v190;
      int v192 = v191 + v101;
      bool v193 = true;
      int v194 = simt_wave_count_bits(v193);
      v99[v192] = v194;
      v162 = v184;
      v163 = v186;
    }
    v159 = v162;
  } else {
    int v195 = 72;
    int v196 = v195 + v101;
    int v197 = v100[v196];
    int v198;
    v198 = v101;
    switch (v197) {
      case 0:
        {
        int v199 = 4;
        v198 = v199;
      }
      default:
        {
        int v200 = 76;
        int v201 = v200 + v101;
        int v202 = v100[v201];
        int v203 = 0;
        bool v204 = v202 != v203;
        int v205;
        if (v204) {
          int v206 = 0;
          v205 = v206;
        } else {
          int v207 = 3;
          int v208 = v101 + v207;
          v205 = v208;
        }
        v198 = v205;
      }
      case 1:
        {
        int v209 = 80;
        int v210 = v209 + v101;
        int v211 = v100[v210];
        int v212 = 3;
        int v213 = v101 + v212;
        int v214;
        v214 = v213;
        switch (v211) {
          case 0:
            {
            int v215 = 1;
            v214 = v215;
            break;
          }
          default:
            {
            int v216 = 0;
            v214 = v216;
          }
          case 1:
            {
            int v217 = 2;
            int v218 = v101 + v217;
            v214 = v218;
          }
          case 2:
            {
            int v219 = 4;
            int v220 = v101 + v219;
            v214 = v220;
            break;
          }
        }
        bool v221 = true;
        v198 = v214;
        break;
      }
    }
    bool v222 = true;
    int v223 = 64;
    int v224 = v223 + v101;
    bool v225 = true;
    int v226 = simt_wave_count_bits(v225);
    v99[v224] = v226;
    v159 = v198;
  }
  int v227 = 80;
  int v228 = v227 + v101;
  bool v229 = true;
  int v230 = simt_wave_count_bits(v229);
  v99[v228] = v230;
  int v231 = 0;
  int v232 = 0;
  int v233;
  int v234;
  v233 = v231;
  v234 = v232;
  while (true) {
    int v235 = 4;
    int v236 = v234 * v235;
    int v237 = v236 + v101;
    int v238 = 84;
    int v239 = v238 + v237;
    int v240 = v100[v239];
    int v241 = 0;
    bool v242 = v240 != v241;
    v233 = v233;
    v234 = v234;
    if (!v242) break;
    int v243 = v233 + v234;
    int v244 = 1;
    int v245 = v234 + v244;
    bool v246 = true;
    int v247 = 96;
    int v248 = 4;
    int v249 = v234 * v248;
    int v250 = v247 + v249;
    int v251 = v250 + v101;
    bool v252 = true;
    int v253 = simt_wave_count_bits(v252);
    v99[v251] = v253;
    v233 = v243;
    v234 = v245;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 104; ++idx) {
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
