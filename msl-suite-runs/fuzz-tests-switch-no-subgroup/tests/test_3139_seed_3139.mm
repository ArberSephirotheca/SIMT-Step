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
    int v7 = 2;
    int v8 = v3 % v7;
    uint v9 = simt_subgroup_id(__simt_tid);
    int v10 = (int)(v9);
    int v11;
    v11 = v10;
    switch (v8) {
      default:
        {
        int v12 = 3;
        int v13 = v3 % v12;
        int v14 = 2;
        int v15;
        v15 = v14;
        switch (v13) {
          case 0:
            {
            int v16 = 1;
            v15 = v16;
          }
          case 1:
            {
            v15 = v0;
            break;
          }
          default:
            {
            int v17 = 1;
            v15 = v17;
            break;
          }
        }
        int v18 = 2;
        int v19 = v0 + v18;
        v11 = v15;
      }
      case 0:
        {
        v11 = v0;
        break;
      }
    }
    v6 = v11;
  } else {
    bool v20 = true;
    int v21 = simt_wave_count_bits(v20);
    int v22 = 0;
    int v23 = v22 + v0;
    v1[v23] = v21;
    v6 = v21;
  }
  return;
}

kernel void kernel_main(device int* v24 [[buffer(0)]], device int* v25 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v26 = static_cast<int>(__simt_tid3.x);
  int v27 = 0;
  int v28 = v27 + v26;
  int v29 = v25[v28];
  int v30 = 4;
  int v31 = v30 + v26;
  int v32 = v25[v31];
  int v33 = 0;
  bool v34 = v29 != v33;
  if (v34) {
    int v35 = 0;
    int v36 = 0;
    int v37;
    int v38;
    v37 = v35;
    v38 = v36;
    while (true) {
      int v39 = 2;
      bool v40 = v38 < v39;
      v37 = v37;
      v38 = v38;
      if (!v40) break;
      int v41 = 2;
      int v42 = v26 % v41;
      int v43;
      v43 = v26;
      switch (v42) {
        default:
          {
          int v44 = 3;
          int v45 = v43 + v44;
          v43 = v45;
          break;
        }
        case 0:
          {
          int v46 = 1;
          int v47 = v43 + v46;
          v43 = v47;
          break;
        }
      }
      helper0(v26, v24, v29, v32, static_cast<int>(__simt_tid3.x));
      int v48 = 1;
      int v49 = v38 + v48;
      v37 = v37;
      v38 = v49;
    }
  } else {
  }
  int v50 = 8;
  int v51 = v50 + v26;
  int v52 = v25[v51];
  int v53 = 0;
  bool v54 = v52 != v53;
  int v55;
  if (v54) {
    int v56 = 4;
    int v57 = v26 + v56;
    v55 = v57;
  } else {
    int v58 = 12;
    int v59 = v58 + v26;
    int v60 = v25[v59];
    int v61 = 0;
    int v62;
    v62 = v61;
    switch (v60) {
      case 0:
        {
        int v63 = 0;
        int v64 = 0;
        int v65;
        int v66;
        v65 = v63;
        v66 = v64;
        while (true) {
          int v67 = 4;
          int v68 = v66 * v67;
          int v69 = v68 + v26;
          int v70 = 16;
          int v71 = v70 + v69;
          int v72 = v25[v71];
          int v73 = 0;
          bool v74 = v72 != v73;
          v65 = v65;
          v66 = v66;
          if (!v74) break;
          int v75 = v65 + v66;
          int v76 = 1;
          int v77 = v66 + v76;
          bool v78 = true;
          v65 = v75;
          v66 = v77;
        }
        v62 = v65;
        break;
      }
      default:
        {
        int v79 = 36;
        int v80 = v79 + v26;
        int v81 = v25[v80];
        int v82 = 2;
        int v83 = v26 + v82;
        int v84;
        v84 = v83;
        switch (v81) {
          case 0:
            {
            int v85 = 0;
            v84 = v85;
            break;
          }
          default:
            {
            v84 = v26;
            break;
          }
        }
        v62 = v84;
        break;
      }
      case 1:
        {
        int v86 = 0;
        int v87 = 0;
        int v88;
        int v89;
        v88 = v86;
        v89 = v87;
        while (true) {
          int v90 = 4;
          int v91 = v89 * v90;
          int v92 = v91 + v26;
          int v93 = 40;
          int v94 = v93 + v92;
          int v95 = v25[v94];
          int v96 = 0;
          bool v97 = v95 != v96;
          v88 = v88;
          v89 = v89;
          if (!v97) break;
          int v98 = v88 + v89;
          int v99 = 1;
          int v100 = v89 + v99;
          bool v101 = true;
          v88 = v98;
          v89 = v100;
        }
        v62 = v88;
        break;
      }
    }
    v55 = v62;
  }
  int v102 = 16;
  int v103 = v102 + v26;
  bool v104 = true;
  int v105 = simt_wave_count_bits(v104);
  v24[v103] = v105;
  int v106 = 60;
  int v107 = v106 + v26;
  int v108 = v25[v107];
  int v109 = 0;
  bool v110 = v108 != v109;
  int v111;
  if (v110) {
    int v112 = 64;
    int v113 = v112 + v26;
    int v114 = v25[v113];
    int v115 = 0;
    bool v116 = v114 != v115;
    int v117;
    if (v116) {
      int v118 = 68;
      int v119 = v118 + v26;
      int v120 = v25[v119];
      int v121 = 0;
      bool v122 = v120 != v121;
      int v123;
      if (v122) {
        uint v124 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v125 = (int)(v124);
        v123 = v125;
      } else {
        v123 = v26;
      }
      int v126 = 32;
      int v127 = v126 + v26;
      bool v128 = true;
      int v129 = simt_wave_count_bits(v128);
      v24[v127] = v129;
      v117 = v123;
    } else {
      int v130 = 3;
      int v131 = v26 + v130;
      v117 = v131;
    }
    int v132 = 48;
    int v133 = v132 + v26;
    bool v134 = true;
    int v135 = simt_wave_count_bits(v134);
    v24[v133] = v135;
    v111 = v117;
  } else {
    int v136 = 72;
    int v137 = v136 + v26;
    int v138 = v25[v137];
    int v139 = 0;
    bool v140 = v138 != v139;
    int v141;
    if (v140) {
      int v142 = 76;
      int v143 = v142 + v26;
      int v144 = v25[v143];
      int v145 = 1;
      int v146;
      v146 = v145;
      switch (v144) {
        default:
          {
          v146 = v26;
          break;
        }
        case 0:
          {
          int v147 = 3;
          int v148 = v26 + v147;
          v146 = v148;
          break;
        }
      }
      v141 = v146;
    } else {
      int v149 = 80;
      int v150 = v149 + v26;
      int v151 = v25[v150];
      int v152 = 0;
      int v153 = v26 + v152;
      int v154;
      v154 = v153;
      switch (v151) {
        case 0:
          {
          int v155 = 2;
          int v156 = v26 + v155;
          v154 = v156;
        }
        default:
          {
          v154 = v26;
          break;
        }
      }
      v141 = v154;
    }
    int v157 = 64;
    int v158 = v157 + v26;
    bool v159 = true;
    int v160 = simt_wave_count_bits(v159);
    v24[v158] = v160;
    v111 = v141;
  }
  int v161 = 80;
  int v162 = v161 + v26;
  bool v163 = true;
  int v164 = simt_wave_count_bits(v163);
  v24[v162] = v164;
  int v165 = 84;
  int v166 = v165 + v26;
  int v167 = v25[v166];
  int v168;
  v168 = v26;
  switch (v167) {
    case 0:
      {
      int v169 = 88;
      int v170 = v169 + v26;
      int v171 = v25[v170];
      int v172 = 0;
      bool v173 = v171 != v172;
      int v174;
      if (v173) {
        int v175 = 92;
        int v176 = v175 + v26;
        int v177 = v25[v176];
        int v178 = 0;
        bool v179 = v177 != v178;
        int v180;
        if (v179) {
          int v181 = 2;
          v180 = v181;
        } else {
          int v182 = 3;
          int v183 = v26 + v182;
          v180 = v183;
        }
        v174 = v180;
      } else {
        int v184 = 96;
        int v185 = v184 + v26;
        int v186 = v25[v185];
        int v187 = 0;
        bool v188 = v186 != v187;
        int v189;
        if (v188) {
          int v190 = 3;
          int v191 = v26 + v190;
          v189 = v191;
        } else {
          v189 = v26;
        }
        v174 = v189;
      }
      v168 = v174;
    }
    case 1:
      {
      int v192 = 100;
      int v193 = v192 + v26;
      int v194 = v25[v193];
      int v195 = 2;
      int v196 = v26 + v195;
      int v197;
      v197 = v196;
      switch (v194) {
        case 0:
          {
          int v198 = 104;
          int v199 = v198 + v26;
          int v200 = v25[v199];
          int v201 = 4;
          int v202;
          v202 = v201;
          switch (v200) {
            default:
              {
              v202 = v26;
              break;
            }
            case 0:
              {
              int v203 = 3;
              int v204 = v26 + v203;
              v202 = v204;
              break;
            }
            case 1:
              {
              v202 = v26;
              break;
            }
            case 2:
              {
              int v205 = 3;
              v202 = v205;
              break;
            }
          }
          v197 = v202;
          break;
        }
        default:
          {
          int v206 = 108;
          int v207 = v206 + v26;
          int v208 = v25[v207];
          int v209 = 0;
          bool v210 = v208 != v209;
          int v211;
          if (v210) {
            v211 = v26;
          } else {
            int v212 = 0;
            int v213 = v26 + v212;
            v211 = v213;
          }
          v197 = v211;
          break;
        }
      }
      bool v214 = true;
      v168 = v197;
      break;
    }
    default:
      {
      int v215 = 112;
      int v216 = v215 + v26;
      int v217 = v25[v216];
      int v218 = 0;
      bool v219 = v217 != v218;
      int v220;
      if (v219) {
        int v221 = 116;
        int v222 = v221 + v26;
        int v223 = v25[v222];
        int v224 = 0;
        bool v225 = v223 != v224;
        int v226;
        if (v225) {
          int v227 = 3;
          v226 = v227;
        } else {
          int v228 = 4;
          v226 = v228;
        }
        v220 = v226;
      } else {
        int v229 = 120;
        int v230 = v229 + v26;
        int v231 = v25[v230];
        int v232 = 1;
        int v233 = v26 + v232;
        int v234;
        v234 = v233;
        switch (v231) {
          case 0:
            {
            v234 = v26;
            break;
          }
          default:
            {
            v234 = v26;
            break;
          }
          case 1:
            {
            int v235 = 0;
            int v236 = v26 + v235;
            v234 = v236;
            break;
          }
        }
        bool v237 = true;
        v220 = v234;
      }
      v168 = v220;
    }
    case 2:
      {
      int v238 = 124;
      int v239 = v238 + v26;
      int v240 = v25[v239];
      int v241 = 0;
      bool v242 = v240 != v241;
      int v243;
      if (v242) {
        int v244 = 128;
        int v245 = v244 + v26;
        int v246 = v25[v245];
        int v247;
        v247 = v26;
        switch (v246) {
          case 0:
            {
            v247 = v26;
          }
          default:
            {
            v247 = v26;
          }
          case 1:
            {
            v247 = v26;
          }
          case 2:
            {
            int v248 = 0;
            int v249 = v26 + v248;
            v247 = v249;
            break;
          }
        }
        v243 = v247;
      } else {
        int v250 = 2;
        v243 = v250;
      }
      v168 = v243;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 132; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
