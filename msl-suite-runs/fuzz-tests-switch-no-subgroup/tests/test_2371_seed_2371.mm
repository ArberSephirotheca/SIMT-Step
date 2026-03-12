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
  uint v8 = simt_subgroup_id(__simt_tid);
  int v9 = (int)(v8);
  int v10;
  v10 = v9;
  switch (v3) {
    case 0:
      {
      int v11 = 1;
      int v12 = v0 + v11;
      v10 = v12;
    }
    default:
      {
      int v13 = 0;
      int v14 = v0 + v13;
      v10 = v14;
      break;
    }
  }
  int v15 = 0;
  bool v16 = v2 != v15;
  int v17 = v16 ? v5 : v10;
  int v18 = 0;
  bool v19 = v2 != v18;
  int v20;
  if (v19) {
    int v21 = 0;
    bool v22 = v2 != v21;
    int v23;
    if (v22) {
      bool v24 = true;
      int v25 = simt_wave_count_bits(v24);
      int v26 = 16;
      int v27 = v26 + v0;
      v1[v27] = v25;
      v23 = v25;
    } else {
      int v28 = 2;
      int v29 = v3 % v28;
      uint v30 = simt_lane_id(__simt_tid);
      int v31 = (int)(v30);
      int v32;
      v32 = v31;
      switch (v29) {
        default:
          {
          v32 = v0;
        }
        case 0:
          {
          int v33 = 1;
          v32 = v33;
        }
        case 1:
          {
          v32 = v0;
          break;
        }
      }
      v23 = v32;
    }
    v20 = v23;
  } else {
    int v34 = 4;
    int v35;
    v35 = v34;
    switch (v3) {
      default:
        {
        int v36 = 4;
        int v37 = v3 % v36;
        int v38 = 0;
        int v39;
        v39 = v38;
        switch (v37) {
          case 0:
            {
            int v40 = 0;
            int v41 = v0 + v40;
            v39 = v41;
          }
          case 1:
            {
            int v42 = 1;
            v39 = v42;
          }
          case 2:
            {
            int v43 = 2;
            int v44 = v0 + v43;
            v39 = v44;
            break;
          }
          default:
            {
            v39 = v0;
            break;
          }
        }
        v35 = v39;
      }
      case 0:
        {
        int v45 = 3;
        int v46 = v3 % v45;
        int v47 = 2;
        int v48;
        v48 = v47;
        switch (v46) {
          default:
            {
            int v49 = 3;
            v48 = v49;
          }
          case 0:
            {
            v48 = v0;
          }
          case 1:
            {
            v48 = v0;
            break;
          }
        }
        v35 = v48;
        break;
      }
    }
    v20 = v35;
  }
  int v50 = 0;
  bool v51 = v2 != v50;
  int v52 = v51 ? v17 : v20;
  return;
}

kernel void kernel_main(device int* v53 [[buffer(0)]], device int* v54 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v55 = static_cast<int>(__simt_tid3.x);
  int v56 = 0;
  int v57 = v56 + v55;
  int v58 = v54[v57];
  int v59 = 4;
  int v60 = v59 + v55;
  int v61 = v54[v60];
  helper0(v55, v53, v58, v61, static_cast<int>(__simt_tid3.x));
  int v62 = 8;
  int v63 = v62 + v55;
  int v64 = v54[v63];
  int v65 = 0;
  int v66;
  v66 = v65;
  switch (v64) {
    default:
      {
      int v67 = 12;
      int v68 = v67 + v55;
      int v69 = v54[v68];
      int v70 = 0;
      int v71;
      v71 = v70;
      switch (v69) {
        case 0:
          {
          int v72 = 16;
          int v73 = v72 + v55;
          int v74 = v54[v73];
          int v75 = 0;
          bool v76 = v74 != v75;
          int v77;
          if (v76) {
            int v78 = 2;
            int v79 = v55 + v78;
            v77 = v79;
          } else {
            int v80 = 1;
            v77 = v80;
          }
          v71 = v77;
        }
        case 1:
          {
          int v81 = 20;
          int v82 = v81 + v55;
          int v83 = v54[v82];
          int v84 = 0;
          bool v85 = v83 != v84;
          int v86;
          if (v85) {
            int v87 = 3;
            v86 = v87;
          } else {
            int v88 = 2;
            v86 = v88;
          }
          v71 = v86;
        }
        default:
          {
          int v89 = 24;
          int v90 = v89 + v55;
          int v91 = v54[v90];
          int v92;
          v92 = v55;
          switch (v91) {
            case 0:
              {
              v92 = v55;
              break;
            }
            case 1:
              {
              v92 = v55;
              break;
            }
            default:
              {
              int v93 = 2;
              int v94 = v55 + v93;
              v92 = v94;
              break;
            }
          }
          v71 = v92;
          break;
        }
      }
      v66 = v71;
      break;
    }
    case 0:
      {
      int v95 = 28;
      int v96 = v95 + v55;
      int v97 = v54[v96];
      int v98 = 0;
      int v99;
      v99 = v98;
      switch (v97) {
        default:
          {
          int v100 = 32;
          int v101 = v100 + v55;
          int v102 = v54[v101];
          int v103 = 3;
          int v104;
          v104 = v103;
          switch (v102) {
            case 0:
              {
              v104 = v55;
            }
            case 1:
              {
              v104 = v55;
              break;
            }
            case 2:
              {
              v104 = v55;
              break;
            }
            default:
              {
              int v105 = 3;
              v104 = v105;
              break;
            }
          }
          v99 = v104;
          break;
        }
        case 0:
          {
          int v106 = 36;
          int v107 = v106 + v55;
          int v108 = v54[v107];
          int v109 = 1;
          int v110 = v55 + v109;
          int v111;
          v111 = v110;
          switch (v108) {
            case 0:
              {
              int v112 = 2;
              int v113 = v55 + v112;
              v111 = v113;
              break;
            }
            default:
              {
              v111 = v55;
              break;
            }
            case 1:
              {
              int v114 = 1;
              v111 = v114;
              break;
            }
          }
          bool v115 = true;
          v99 = v111;
          break;
        }
        case 1:
          {
          int v116 = 0;
          int v117 = 0;
          int v118;
          int v119;
          v118 = v116;
          v119 = v117;
          while (true) {
            int v120 = 4;
            int v121 = v119 * v120;
            int v122 = v121 + v55;
            int v123 = 40;
            int v124 = v123 + v122;
            int v125 = v54[v124];
            int v126 = 0;
            bool v127 = v125 != v126;
            v118 = v118;
            v119 = v119;
            if (!v127) break;
            int v128 = v118 + v119;
            int v129 = 1;
            int v130 = v119 + v129;
            bool v131 = true;
            v118 = v128;
            v119 = v130;
            continue;
            ;
          }
          v99 = v118;
          break;
        }
      }
      v66 = v99;
    }
    case 1:
      {
      int v132 = 60;
      int v133 = v132 + v55;
      int v134 = v54[v133];
      int v135 = 0;
      bool v136 = v134 != v135;
      int v137;
      if (v136) {
        int v138 = 64;
        int v139 = v138 + v55;
        int v140 = v54[v139];
        int v141;
        v141 = v55;
        switch (v140) {
          case 0:
            {
            int v142 = 1;
            int v143 = v55 + v142;
            v141 = v143;
            break;
          }
          default:
            {
            int v144 = 1;
            v141 = v144;
            break;
          }
        }
        bool v145 = true;
        v137 = v141;
      } else {
        int v146 = 4;
        int v147 = v55 + v146;
        v137 = v147;
      }
      v66 = v137;
      break;
    }
  }
  bool v148 = true;
  int v149 = 32;
  int v150 = v149 + v55;
  bool v151 = true;
  int v152 = simt_wave_count_bits(v151);
  v53[v150] = v152;
  int v153 = 0;
  int v154 = 0;
  int v155;
  int v156;
  v155 = v153;
  v156 = v154;
  while (true) {
    int v157 = 4;
    int v158 = v156 * v157;
    int v159 = v158 + v55;
    int v160 = 68;
    int v161 = v160 + v159;
    int v162 = v54[v161];
    int v163 = 0;
    bool v164 = v162 != v163;
    v155 = v155;
    v156 = v156;
    if (!v164) break;
    int v165 = 88;
    int v166 = v165 + v55;
    int v167 = v54[v166];
    int v168 = 1;
    int v169 = v55 + v168;
    int v170;
    v170 = v169;
    switch (v167) {
      default:
        {
        int v171 = 92;
        int v172 = v171 + v55;
        int v173 = v54[v172];
        int v174 = 0;
        int v175 = v55 + v174;
        int v176;
        v176 = v175;
        switch (v173) {
          case 0:
            {
            int v177 = 4;
            int v178 = v55 + v177;
            v176 = v178;
            break;
          }
          default:
            {
            int v179 = 0;
            int v180 = v55 + v179;
            v176 = v180;
            break;
          }
          case 1:
            {
            int v181 = 2;
            v176 = v181;
            break;
          }
        }
        v170 = v176;
        break;
      }
      case 0:
        {
        int v182 = 96;
        int v183 = v182 + v55;
        int v184 = v54[v183];
        int v185 = 3;
        int v186 = v55 + v185;
        int v187;
        v187 = v186;
        switch (v184) {
          default:
            {
            int v188 = 0;
            int v189 = v55 + v188;
            v187 = v189;
          }
          case 0:
            {
            int v190 = 1;
            int v191 = v55 + v190;
            v187 = v191;
            break;
          }
        }
        v170 = v187;
        break;
      }
    }
    bool v192 = true;
    int v193 = 48;
    int v194 = v193 + v55;
    bool v195 = true;
    int v196 = simt_wave_count_bits(v195);
    v53[v194] = v196;
    int v197 = v155 + v170;
    int v198 = 1;
    int v199 = v156 + v198;
    bool v200 = true;
    int v201 = 64;
    int v202 = 4;
    int v203 = v156 * v202;
    int v204 = v201 + v203;
    int v205 = v204 + v55;
    bool v206 = true;
    int v207 = simt_wave_count_bits(v206);
    v53[v205] = v207;
    v155 = v197;
    v156 = v199;
  }
  int v208 = 100;
  int v209 = v208 + v55;
  int v210 = v54[v209];
  uint v211 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v212 = (int)(v211);
  int v213;
  v213 = v212;
  switch (v210) {
    default:
      {
      int v214 = 4;
      int v215 = v55 + v214;
      v213 = v215;
      break;
    }
    case 0:
      {
      int v216 = 104;
      int v217 = v216 + v55;
      int v218 = v54[v217];
      int v219 = 0;
      bool v220 = v218 != v219;
      int v221;
      if (v220) {
        int v222 = 108;
        int v223 = v222 + v55;
        int v224 = v54[v223];
        int v225 = 0;
        int v226;
        v226 = v225;
        switch (v224) {
          case 0:
            {
            int v227 = 1;
            v226 = v227;
          }
          case 1:
            {
            int v228 = 0;
            v226 = v228;
          }
          default:
            {
            v226 = v55;
          }
          case 2:
            {
            int v229 = 3;
            int v230 = v55 + v229;
            v226 = v230;
            break;
          }
        }
        v221 = v226;
      } else {
        int v231 = 4;
        int v232 = v55 + v231;
        v221 = v232;
      }
      v213 = v221;
      break;
    }
    case 1:
      {
      int v233 = 0;
      int v234 = v55 + v233;
      v213 = v234;
      break;
    }
  }
  bool v235 = true;
  int v236 = 80;
  int v237 = v236 + v55;
  bool v238 = true;
  int v239 = simt_wave_count_bits(v238);
  v53[v237] = v239;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 112; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
