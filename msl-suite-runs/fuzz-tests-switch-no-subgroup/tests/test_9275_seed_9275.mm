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
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 0;
      bool v10 = v2 != v9;
      int v11;
      if (v10) {
        int v12 = 0;
        bool v13 = v2 != v12;
        int v14;
        if (v13) {
          v14 = v0;
        } else {
          int v15 = 0;
          int v16 = v0 + v15;
          v14 = v16;
        }
        v11 = v14;
      } else {
        int v17 = 0;
        int v18 = 0;
        int v19;
        int v20;
        v19 = v17;
        v20 = v18;
        while (true) {
          int v21 = 4;
          int v22 = v3 % v21;
          int v23 = 1;
          int v24 = v22 + v23;
          bool v25 = v20 < v24;
          v19 = v19;
          v20 = v20;
          if (!v25) break;
          int v26 = 1;
          int v27 = v0 + v26;
          int v28 = 1;
          int v29 = v20 + v28;
          v19 = v27;
          v20 = v29;
        }
        v11 = v19;
      }
      v8 = v11;
      break;
    }
    case 1:
      {
      int v30 = 0;
      int v31 = v0 + v30;
      int v32;
      v32 = v31;
      switch (v3) {
        case 0:
          {
          int v33 = 0;
          int v34 = 0;
          int v35;
          int v36;
          v35 = v33;
          v36 = v34;
          while (true) {
            int v37 = 4;
            int v38 = v3 % v37;
            int v39 = 1;
            int v40 = v38 + v39;
            bool v41 = v36 < v40;
            v35 = v35;
            v36 = v36;
            if (!v41) break;
            int v42 = 2;
            int v43 = v0 + v42;
            int v44 = 1;
            int v45 = v36 + v44;
            v35 = v43;
            v36 = v45;
            break;
            ;
          }
          v32 = v35;
          break;
        }
        default:
          {
          int v46 = 0;
          bool v47 = v2 != v46;
          int v48;
          if (v47) {
            int v49 = 3;
            int v50 = v0 + v49;
            v48 = v50;
          } else {
            v48 = v0;
          }
          v32 = v48;
          break;
        }
      }
      int v51 = 0;
      int v52 = v0 + v51;
      v8 = v32;
    }
    default:
      {
      int v53 = 3;
      int v54 = v3 % v53;
      int v55;
      v55 = v0;
      switch (v54) {
        case 0:
          {
          v55 = v0;
          break;
        }
        case 1:
          {
          int v56 = 1;
          v55 = v56;
        }
        case 2:
          {
          int v57 = 0;
          bool v58 = v2 != v57;
          int v59;
          if (v58) {
            int v60 = 4;
            int v61 = v0 + v60;
            v59 = v61;
          } else {
            int v62 = 3;
            v59 = v62;
          }
          v55 = v59;
          break;
        }
        default:
          {
          int v63 = 0;
          int v64 = 0;
          int v65;
          int v66;
          v65 = v63;
          v66 = v64;
          while (true) {
            int v67 = 4;
            int v68 = v3 % v67;
            int v69 = 1;
            int v70 = v68 + v69;
            bool v71 = v66 < v70;
            v65 = v65;
            v66 = v66;
            if (!v71) break;
            int v72 = 4;
            int v73 = 1;
            int v74 = v66 + v73;
            v65 = v72;
            v66 = v74;
            continue;
            ;
          }
          v55 = v65;
          break;
        }
      }
      v8 = v55;
      break;
    }
  }
  bool v75 = true;
  int v76 = simt_wave_count_bits(v75);
  int v77 = 0;
  int v78 = v77 + v0;
  v1[v78] = v76;
  return;
}

kernel void kernel_main(device int* v79 [[buffer(0)]], device int* v80 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v81 = static_cast<int>(__simt_tid3.x);
  int v82 = 0;
  int v83 = v82 + v81;
  int v84 = v80[v83];
  int v85 = 4;
  int v86 = v85 + v81;
  int v87 = v80[v86];
  int v88 = 0;
  bool v89 = v84 != v88;
  if (v89) {
    int v90 = 0;
    int v91 = 0;
    int v92;
    int v93;
    v92 = v90;
    v93 = v91;
    while (true) {
      int v94 = 2;
      bool v95 = v93 < v94;
      v92 = v92;
      v93 = v93;
      if (!v95) break;
      helper0(v81, v79, v84, v87, static_cast<int>(__simt_tid3.x));
      int v96 = 1;
      int v97 = v93 + v96;
      v92 = v92;
      v93 = v97;
    }
  } else {
  }
  int v98 = 8;
  int v99 = v98 + v81;
  int v100 = v80[v99];
  int v101 = 0;
  bool v102 = v100 != v101;
  int v103;
  if (v102) {
    int v104 = 12;
    int v105 = v104 + v81;
    int v106 = v80[v105];
    int v107 = 0;
    bool v108 = v106 != v107;
    int v109;
    if (v108) {
      int v110 = 16;
      int v111 = v110 + v81;
      int v112 = v80[v111];
      int v113;
      v113 = v81;
      switch (v112) {
        case 0:
          {
          int v114 = 4;
          v113 = v114;
          break;
        }
        default:
          {
          v113 = v81;
        }
        case 1:
          {
          int v115 = 3;
          int v116 = v81 + v115;
          v113 = v116;
          break;
        }
        case 2:
          {
          v113 = v81;
          break;
        }
      }
      v109 = v113;
    } else {
      int v117 = 0;
      int v118 = 0;
      int v119;
      int v120;
      v119 = v117;
      v120 = v118;
      while (true) {
        int v121 = 4;
        int v122 = v120 * v121;
        int v123 = v122 + v81;
        int v124 = 20;
        int v125 = v124 + v123;
        int v126 = v80[v125];
        int v127 = 0;
        bool v128 = v126 != v127;
        v119 = v119;
        v120 = v120;
        if (!v128) break;
        int v129 = v119 + v120;
        int v130 = 1;
        int v131 = v120 + v130;
        bool v132 = true;
        int v133 = 16;
        int v134 = 4;
        int v135 = v120 * v134;
        int v136 = v133 + v135;
        int v137 = v136 + v81;
        bool v138 = true;
        int v139 = simt_wave_count_bits(v138);
        v79[v137] = v139;
        v119 = v129;
        v120 = v131;
      }
      v109 = v119;
    }
    int v140 = 32;
    int v141 = v140 + v81;
    bool v142 = true;
    int v143 = simt_wave_count_bits(v142);
    v79[v141] = v143;
    v103 = v109;
  } else {
    int v144 = 40;
    int v145 = v144 + v81;
    int v146 = v80[v145];
    int v147 = 2;
    int v148 = v81 + v147;
    int v149;
    v149 = v148;
    switch (v146) {
      default:
        {
        v149 = v81;
      }
      case 0:
        {
        int v150 = 44;
        int v151 = v150 + v81;
        int v152 = v80[v151];
        int v153 = 3;
        int v154;
        v154 = v153;
        switch (v152) {
          case 0:
            {
            int v155 = 2;
            v154 = v155;
          }
          case 1:
            {
            int v156 = 2;
            v154 = v156;
          }
          case 2:
            {
            v154 = v81;
          }
          default:
            {
            int v157 = 4;
            v154 = v157;
            break;
          }
        }
        v149 = v154;
        break;
      }
    }
    v103 = v149;
  }
  int v158 = 48;
  int v159 = v158 + v81;
  bool v160 = true;
  int v161 = simt_wave_count_bits(v160);
  v79[v159] = v161;
  int v162 = 48;
  int v163 = v162 + v81;
  int v164 = v80[v163];
  int v165 = 0;
  bool v166 = v164 != v165;
  int v167;
  if (v166) {
    int v168 = 52;
    int v169 = v168 + v81;
    int v170 = v80[v169];
    int v171 = 0;
    bool v172 = v170 != v171;
    int v173;
    if (v172) {
      int v174 = 56;
      int v175 = v174 + v81;
      int v176 = v80[v175];
      int v177 = 0;
      int v178;
      v178 = v177;
      switch (v176) {
        default:
          {
          int v179 = 4;
          v178 = v179;
          break;
        }
        case 0:
          {
          v178 = v81;
          break;
        }
      }
      v173 = v178;
    } else {
      int v180 = 0;
      int v181 = 0;
      int v182;
      int v183;
      v182 = v180;
      v183 = v181;
      while (true) {
        int v184 = 4;
        int v185 = v183 * v184;
        int v186 = v185 + v81;
        int v187 = 60;
        int v188 = v187 + v186;
        int v189 = v80[v188];
        int v190 = 0;
        bool v191 = v189 != v190;
        v182 = v182;
        v183 = v183;
        if (!v191) break;
        int v192 = v182 + v183;
        int v193 = 1;
        int v194 = v183 + v193;
        bool v195 = true;
        int v196 = 64;
        int v197 = 4;
        int v198 = v183 * v197;
        int v199 = v196 + v198;
        int v200 = v199 + v81;
        bool v201 = true;
        int v202 = simt_wave_count_bits(v201);
        v79[v200] = v202;
        v182 = v192;
        v183 = v194;
      }
      v173 = v182;
    }
    int v203 = 80;
    int v204 = v203 + v81;
    bool v205 = true;
    int v206 = simt_wave_count_bits(v205);
    v79[v204] = v206;
    v167 = v173;
  } else {
    int v207 = 80;
    int v208 = v207 + v81;
    int v209 = v80[v208];
    int v210 = 0;
    bool v211 = v209 != v210;
    int v212;
    if (v211) {
      int v213 = 84;
      int v214 = v213 + v81;
      int v215 = v80[v214];
      int v216 = 2;
      int v217;
      v217 = v216;
      switch (v215) {
        case 0:
          {
          int v218 = 0;
          int v219 = v81 + v218;
          v217 = v219;
          break;
        }
        default:
          {
          int v220 = 0;
          v217 = v220;
          break;
        }
        case 1:
          {
          int v221 = 3;
          v217 = v221;
          break;
        }
      }
      v212 = v217;
    } else {
      int v222 = 0;
      int v223 = 0;
      int v224;
      int v225;
      v224 = v222;
      v225 = v223;
      while (true) {
        int v226 = 4;
        int v227 = v225 * v226;
        int v228 = v227 + v81;
        int v229 = 88;
        int v230 = v229 + v228;
        int v231 = v80[v230];
        int v232 = 0;
        bool v233 = v231 != v232;
        v224 = v224;
        v225 = v225;
        if (!v233) break;
        int v234 = v224 + v225;
        int v235 = 1;
        int v236 = v225 + v235;
        bool v237 = true;
        int v238 = 96;
        int v239 = 4;
        int v240 = v225 * v239;
        int v241 = v238 + v240;
        int v242 = v241 + v81;
        bool v243 = true;
        int v244 = simt_wave_count_bits(v243);
        v79[v242] = v244;
        v224 = v234;
        v225 = v236;
      }
      v212 = v224;
    }
    int v245 = 112;
    int v246 = v245 + v81;
    bool v247 = true;
    int v248 = simt_wave_count_bits(v247);
    v79[v246] = v248;
    v167 = v212;
  }
  int v249 = 128;
  int v250 = v249 + v81;
  bool v251 = true;
  int v252 = simt_wave_count_bits(v251);
  v79[v250] = v252;
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
    static int32_t expected0[] = {static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 132; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 108; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
