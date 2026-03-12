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
  bool v4 = true;
  int v5 = simt_wave_count_bits(v4);
  int v6 = 0;
  int v7 = v6 + v0;
  v1[v7] = v5;
  int v8 = 3;
  int v9 = v3 % v8;
  int v10;
  v10 = v0;
  switch (v9) {
    default:
      {
      int v11 = 3;
      int v12 = v0 + v11;
      v10 = v12;
      break;
    }
    case 0:
      {
      int v13 = 0;
      int v14 = v0 + v13;
      int v15;
      v15 = v14;
      switch (v3) {
        default:
          {
          int v16 = 0;
          bool v17 = v2 != v16;
          int v18;
          if (v17) {
            int v19 = 4;
            int v20 = v0 + v19;
            v18 = v20;
          } else {
            v18 = v0;
          }
          v15 = v18;
        }
        case 0:
          {
          v15 = v0;
          break;
        }
      }
      v10 = v15;
      break;
    }
    case 1:
      {
      int v21 = 1;
      v10 = v21;
      break;
    }
    case 2:
      {
      int v22 = 0;
      bool v23 = v2 != v22;
      int v24;
      if (v23) {
        int v25 = 4;
        int v26 = v3 % v25;
        int v27 = 1;
        int v28;
        v28 = v27;
        switch (v26) {
          case 0:
            {
            v28 = v0;
            break;
          }
          case 1:
            {
            v28 = v0;
            break;
          }
          default:
            {
            v28 = v0;
            break;
          }
          case 2:
            {
            int v29 = 3;
            int v30 = v0 + v29;
            v28 = v30;
            break;
          }
        }
        v24 = v28;
      } else {
        int v31 = 0;
        int v32 = 0;
        int v33;
        int v34;
        v33 = v31;
        v34 = v32;
        while (true) {
          int v35 = 4;
          int v36 = v3 % v35;
          int v37 = 1;
          int v38 = v36 + v37;
          bool v39 = v34 < v38;
          v33 = v33;
          v34 = v34;
          if (!v39) break;
          int v40 = 1;
          int v41 = v34 + v40;
          v33 = v0;
          v34 = v41;
          continue;
          ;
        }
        v24 = v33;
      }
      v10 = v24;
      break;
    }
  }
  bool v42 = true;
  int v43 = simt_wave_count_bits(v42);
  int v44 = 16;
  int v45 = v44 + v0;
  v1[v45] = v43;
  int v46 = 0;
  bool v47 = v2 != v46;
  int v48 = v47 ? v5 : v10;
  return;
}

kernel void kernel_main(device int* v49 [[buffer(0)]], device int* v50 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v51 = static_cast<int>(__simt_tid3.x);
  int v52 = 0;
  int v53 = v52 + v51;
  int v54 = v50[v53];
  int v55 = 4;
  int v56 = v55 + v51;
  int v57 = v50[v56];
  int v58 = 0;
  bool v59 = v54 != v58;
  if (v59) {
    int v60 = 8;
    int v61 = v60 + v51;
    int v62 = v50[v61];
    int v63 = 0;
    bool v64 = v62 != v63;
    if (v64) {
    } else {
      helper0(v51, v49, v54, v57, static_cast<int>(__simt_tid3.x));
    }
  } else {
  }
  int v65 = 12;
  int v66 = v65 + v51;
  int v67 = v50[v66];
  int v68 = 2;
  int v69 = v51 + v68;
  int v70;
  v70 = v69;
  switch (v67) {
    case 0:
      {
      int v71 = 16;
      int v72 = v71 + v51;
      int v73 = v50[v72];
      int v74 = 0;
      bool v75 = v73 != v74;
      int v76;
      if (v75) {
        int v77 = 0;
        int v78 = v51 + v77;
        v76 = v78;
      } else {
        int v79 = 0;
        int v80 = 0;
        int v81;
        int v82;
        v81 = v79;
        v82 = v80;
        while (true) {
          int v83 = 4;
          int v84 = v82 * v83;
          int v85 = v84 + v51;
          int v86 = 20;
          int v87 = v86 + v85;
          int v88 = v50[v87];
          int v89 = 0;
          bool v90 = v88 != v89;
          v81 = v81;
          v82 = v82;
          if (!v90) break;
          int v91 = v81 + v82;
          int v92 = 1;
          int v93 = v82 + v92;
          bool v94 = true;
          v81 = v91;
          v82 = v93;
        }
        v76 = v81;
      }
      v70 = v76;
      break;
    }
    case 1:
      {
      int v95 = 4;
      v70 = v95;
      break;
    }
    default:
      {
      int v96 = 2;
      v70 = v96;
      break;
    }
    case 2:
      {
      int v97 = 0;
      int v98 = 0;
      int v99;
      int v100;
      v99 = v97;
      v100 = v98;
      while (true) {
        int v101 = 4;
        int v102 = v100 * v101;
        int v103 = v102 + v51;
        int v104 = 40;
        int v105 = v104 + v103;
        int v106 = v50[v105];
        int v107 = 0;
        bool v108 = v106 != v107;
        v99 = v99;
        v100 = v100;
        if (!v108) break;
        int v109 = v99 + v100;
        int v110 = 1;
        int v111 = v100 + v110;
        bool v112 = true;
        v99 = v109;
        v100 = v111;
        break;
        ;
      }
      v70 = v99;
      break;
    }
  }
  int v113 = 60;
  int v114 = v113 + v51;
  int v115 = v50[v114];
  int v116 = 0;
  bool v117 = v115 != v116;
  int v118;
  if (v117) {
    int v119 = 64;
    int v120 = v119 + v51;
    int v121 = v50[v120];
    int v122 = 0;
    bool v123 = v121 != v122;
    int v124;
    if (v123) {
      int v125 = 68;
      int v126 = v125 + v51;
      int v127 = v50[v126];
      int v128 = 0;
      bool v129 = v127 != v128;
      int v130;
      if (v129) {
        int v131 = 1;
        int v132 = v51 + v131;
        v130 = v132;
      } else {
        uint v133 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v134 = (int)(v133);
        v130 = v134;
      }
      int v135 = 32;
      int v136 = v135 + v51;
      bool v137 = true;
      int v138 = simt_wave_count_bits(v137);
      v49[v136] = v138;
      v124 = v130;
    } else {
      int v139 = 72;
      int v140 = v139 + v51;
      int v141 = v50[v140];
      uint v142 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v143 = (int)(v142);
      int v144;
      v144 = v143;
      switch (v141) {
        default:
          {
          int v145 = 4;
          v144 = v145;
          break;
        }
        case 0:
          {
          int v146 = 2;
          int v147 = v51 + v146;
          v144 = v147;
          break;
        }
      }
      v124 = v144;
    }
    int v148 = 48;
    int v149 = v148 + v51;
    bool v150 = true;
    int v151 = simt_wave_count_bits(v150);
    v49[v149] = v151;
    v118 = v124;
  } else {
    int v152 = 76;
    int v153 = v152 + v51;
    int v154 = v50[v153];
    int v155 = 0;
    bool v156 = v154 != v155;
    int v157;
    if (v156) {
      int v158 = 80;
      int v159 = v158 + v51;
      int v160 = v50[v159];
      uint v161 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v162 = (int)(v161);
      int v163;
      v163 = v162;
      switch (v160) {
        case 0:
          {
          v163 = v51;
          break;
        }
        default:
          {
          int v164 = 3;
          int v165 = v51 + v164;
          v163 = v165;
          break;
        }
        case 1:
          {
          v163 = v51;
          break;
        }
      }
      v157 = v163;
    } else {
      int v166 = 0;
      int v167 = 0;
      int v168;
      int v169;
      v168 = v166;
      v169 = v167;
      while (true) {
        int v170 = 4;
        int v171 = v169 * v170;
        int v172 = v171 + v51;
        int v173 = 84;
        int v174 = v173 + v172;
        int v175 = v50[v174];
        int v176 = 0;
        bool v177 = v175 != v176;
        v168 = v168;
        v169 = v169;
        if (!v177) break;
        int v178 = v168 + v169;
        int v179 = 1;
        int v180 = v169 + v179;
        bool v181 = true;
        int v182 = 64;
        int v183 = 4;
        int v184 = v169 * v183;
        int v185 = v182 + v184;
        int v186 = v185 + v51;
        bool v187 = true;
        int v188 = simt_wave_count_bits(v187);
        v49[v186] = v188;
        v168 = v178;
        v169 = v180;
      }
      v157 = v168;
    }
    int v189 = 80;
    int v190 = v189 + v51;
    bool v191 = true;
    int v192 = simt_wave_count_bits(v191);
    v49[v190] = v192;
    v118 = v157;
  }
  int v193 = 96;
  int v194 = v193 + v51;
  bool v195 = true;
  int v196 = simt_wave_count_bits(v195);
  v49[v194] = v196;
  int v197 = 104;
  int v198 = v197 + v51;
  int v199 = v50[v198];
  uint v200 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v201 = (int)(v200);
  int v202;
  v202 = v201;
  switch (v199) {
    case 0:
      {
      v202 = v51;
      break;
    }
    default:
      {
      int v203 = 108;
      int v204 = v203 + v51;
      int v205 = v50[v204];
      int v206 = 0;
      bool v207 = v205 != v206;
      int v208;
      if (v207) {
        int v209 = 112;
        int v210 = v209 + v51;
        int v211 = v50[v210];
        int v212 = 0;
        int v213 = v51 + v212;
        int v214;
        v214 = v213;
        switch (v211) {
          case 0:
            {
            v214 = v51;
            break;
          }
          case 1:
            {
            v214 = v51;
            break;
          }
          default:
            {
            v214 = v51;
            break;
          }
        }
        v208 = v214;
      } else {
        int v215 = 0;
        int v216 = 0;
        int v217;
        int v218;
        v217 = v215;
        v218 = v216;
        while (true) {
          int v219 = 4;
          int v220 = v218 * v219;
          int v221 = v220 + v51;
          int v222 = 116;
          int v223 = v222 + v221;
          int v224 = v50[v223];
          int v225 = 0;
          bool v226 = v224 != v225;
          v217 = v217;
          v218 = v218;
          if (!v226) break;
          int v227 = v217 + v218;
          int v228 = 1;
          int v229 = v218 + v228;
          bool v230 = true;
          v217 = v227;
          v218 = v229;
        }
        v208 = v217;
      }
      v202 = v208;
      break;
    }
    case 1:
      {
      int v231 = 0;
      int v232 = 0;
      int v233;
      int v234;
      v233 = v231;
      v234 = v232;
      while (true) {
        int v235 = 4;
        int v236 = v234 * v235;
        int v237 = v236 + v51;
        int v238 = 136;
        int v239 = v238 + v237;
        int v240 = v50[v239];
        int v241 = 0;
        bool v242 = v240 != v241;
        v233 = v233;
        v234 = v234;
        if (!v242) break;
        int v243 = 4;
        int v244 = v51 + v243;
        int v245 = v233 + v244;
        int v246 = 1;
        int v247 = v234 + v246;
        bool v248 = true;
        v233 = v245;
        v234 = v247;
      }
      v202 = v233;
      break;
    }
    case 2:
      {
      int v249 = 0;
      int v250 = 0;
      int v251;
      int v252;
      v251 = v249;
      v252 = v250;
      while (true) {
        int v253 = 4;
        int v254 = v252 * v253;
        int v255 = v254 + v51;
        int v256 = 156;
        int v257 = v256 + v255;
        int v258 = v50[v257];
        int v259 = 0;
        bool v260 = v258 != v259;
        v251 = v251;
        v252 = v252;
        if (!v260) break;
        int v261 = v251 + v252;
        int v262 = 1;
        int v263 = v252 + v262;
        bool v264 = true;
        v251 = v261;
        v252 = v263;
        continue;
        ;
      }
      v202 = v251;
      break;
    }
  }
  bool v265 = true;
  int v266 = 112;
  int v267 = v266 + v51;
  bool v268 = true;
  int v269 = simt_wave_count_bits(v268);
  v49[v267] = v269;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 116; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 176; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
