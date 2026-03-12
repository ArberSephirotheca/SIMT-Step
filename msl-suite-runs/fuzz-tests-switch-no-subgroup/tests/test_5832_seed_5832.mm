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
    int v13;
    v13 = v0;
    switch (v3) {
      default:
        {
        int v14 = 2;
        v13 = v14;
        break;
      }
      case 0:
        {
        int v15 = 4;
        int v16 = v0 + v15;
        v13 = v16;
        break;
      }
    }
    int v17 = 1;
    int v18 = v7 + v17;
    v6 = v13;
    v7 = v18;
    break;
    ;
  }
  int v19 = 3;
  int v20 = v3 % v19;
  int v21 = 2;
  int v22;
  v22 = v21;
  switch (v20) {
    case 0:
      {
      int v23 = 4;
      int v24 = v0 + v23;
      int v25;
      v25 = v24;
      switch (v3) {
        default:
          {
          v25 = v0;
          break;
        }
        case 0:
          {
          int v26 = 1;
          v25 = v26;
          break;
        }
      }
      int v27 = 0;
      v22 = v25;
      break;
    }
    default:
      {
      int v28 = 0;
      int v29 = 0;
      int v30;
      int v31;
      v30 = v28;
      v31 = v29;
      while (true) {
        int v32 = 4;
        int v33 = v3 % v32;
        int v34 = 1;
        int v35 = v33 + v34;
        bool v36 = v31 < v35;
        v30 = v30;
        v31 = v31;
        if (!v36) break;
        int v37 = 2;
        int v38 = v3 % v37;
        int v39 = 1;
        int v40;
        v40 = v39;
        switch (v38) {
          default:
            {
            v40 = v0;
            break;
          }
          case 0:
            {
            v40 = v0;
            break;
          }
        }
        int v41 = 1;
        int v42 = v31 + v41;
        v30 = v40;
        v31 = v42;
      }
      v22 = v30;
      break;
    }
    case 1:
      {
      int v43 = 3;
      int v44 = v3 % v43;
      int v45 = 0;
      int v46 = v0 + v45;
      int v47;
      v47 = v46;
      switch (v44) {
        default:
          {
          int v48 = 0;
          bool v49 = v2 != v48;
          int v50;
          if (v49) {
            int v51 = 0;
            int v52 = v0 + v51;
            v50 = v52;
          } else {
            v50 = v0;
          }
          v47 = v50;
          break;
        }
        case 0:
          {
          int v53 = 0;
          int v54 = 0;
          int v55;
          int v56;
          v55 = v53;
          v56 = v54;
          while (true) {
            int v57 = 4;
            int v58 = v3 % v57;
            int v59 = 1;
            int v60 = v58 + v59;
            bool v61 = v56 < v60;
            v55 = v55;
            v56 = v56;
            if (!v61) break;
            int v62 = 4;
            int v63 = 1;
            int v64 = v56 + v63;
            v55 = v62;
            v56 = v64;
            break;
            ;
          }
          v47 = v55;
          break;
        }
        case 1:
          {
          v47 = v0;
          break;
        }
      }
      v22 = v47;
      break;
    }
  }
  int v65 = 0;
  bool v66 = v2 != v65;
  int v67 = v66 ? v6 : v22;
  bool v68 = true;
  int v69 = simt_wave_count_bits(v68);
  int v70 = 0;
  int v71 = v70 + v0;
  v1[v71] = v69;
  return;
}

kernel void kernel_main(device int* v72 [[buffer(0)]], device int* v73 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v74 = static_cast<int>(__simt_tid3.x);
  int v75 = 0;
  int v76 = v75 + v74;
  int v77 = v73[v76];
  int v78 = 4;
  int v79 = v78 + v74;
  int v80 = v73[v79];
  helper0(v74, v72, v77, v80, static_cast<int>(__simt_tid3.x));
  int v81 = 8;
  int v82 = v81 + v74;
  int v83 = v73[v82];
  int v84 = 0;
  bool v85 = v83 != v84;
  int v86;
  if (v85) {
    int v87 = 12;
    int v88 = v87 + v74;
    int v89 = v73[v88];
    int v90;
    v90 = v74;
    switch (v89) {
      case 0:
        {
        v90 = v74;
        break;
      }
      default:
        {
        int v91 = 16;
        int v92 = v91 + v74;
        int v93 = v73[v92];
        int v94 = 0;
        bool v95 = v93 != v94;
        int v96;
        if (v95) {
          int v97 = 2;
          int v98 = v74 + v97;
          v96 = v98;
        } else {
          v96 = v74;
        }
        v90 = v96;
      }
      case 1:
        {
        v90 = v74;
        break;
      }
    }
    v86 = v90;
  } else {
    int v99 = 4;
    v86 = v99;
  }
  int v100 = 16;
  int v101 = v100 + v74;
  bool v102 = true;
  int v103 = simt_wave_count_bits(v102);
  v72[v101] = v103;
  int v104 = 20;
  int v105 = v104 + v74;
  int v106 = v73[v105];
  int v107 = 4;
  int v108;
  v108 = v107;
  switch (v106) {
    case 0:
      {
      int v109 = 0;
      int v110 = 0;
      int v111;
      int v112;
      v111 = v109;
      v112 = v110;
      while (true) {
        int v113 = 4;
        int v114 = v112 * v113;
        int v115 = v114 + v74;
        int v116 = 24;
        int v117 = v116 + v115;
        int v118 = v73[v117];
        int v119 = 0;
        bool v120 = v118 != v119;
        v111 = v111;
        v112 = v112;
        if (!v120) break;
        int v121 = 44;
        int v122 = v121 + v74;
        int v123 = v73[v122];
        int v124;
        v124 = v74;
        switch (v123) {
          default:
            {
            int v125 = 2;
            int v126 = v74 + v125;
            v124 = v126;
            break;
          }
          case 0:
            {
            int v127 = 1;
            v124 = v127;
            break;
          }
          case 1:
            {
            int v128 = 1;
            v124 = v128;
            break;
          }
        }
        int v129 = v111 + v124;
        int v130 = 1;
        int v131 = v112 + v130;
        bool v132 = true;
        v111 = v129;
        v112 = v131;
      }
      v108 = v111;
      break;
    }
    default:
      {
      v108 = v74;
      break;
    }
    case 1:
      {
      v108 = v74;
      break;
    }
    case 2:
      {
      int v133 = 0;
      int v134 = 0;
      int v135;
      int v136;
      v135 = v133;
      v136 = v134;
      while (true) {
        int v137 = 4;
        int v138 = v136 * v137;
        int v139 = v138 + v74;
        int v140 = 48;
        int v141 = v140 + v139;
        int v142 = v73[v141];
        int v143 = 0;
        bool v144 = v142 != v143;
        v135 = v135;
        v136 = v136;
        if (!v144) break;
        int v145 = 68;
        int v146 = v145 + v74;
        int v147 = v73[v146];
        int v148;
        v148 = v74;
        switch (v147) {
          case 0:
            {
            v148 = v74;
            break;
          }
          default:
            {
            int v149 = 3;
            int v150 = v74 + v149;
            v148 = v150;
            break;
          }
        }
        bool v151 = true;
        int v152 = v135 + v148;
        int v153 = 1;
        int v154 = v136 + v153;
        bool v155 = true;
        v135 = v152;
        v136 = v154;
      }
      v108 = v135;
      break;
    }
  }
  int v156 = 72;
  int v157 = v156 + v74;
  int v158 = v73[v157];
  uint v159 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v160 = (int)(v159);
  int v161;
  v161 = v160;
  switch (v158) {
    case 0:
      {
      int v162 = 76;
      int v163 = v162 + v74;
      int v164 = v73[v163];
      int v165 = 0;
      bool v166 = v164 != v165;
      int v167;
      if (v166) {
        int v168 = 80;
        int v169 = v168 + v74;
        int v170 = v73[v169];
        int v171 = 0;
        bool v172 = v170 != v171;
        int v173;
        if (v172) {
          int v174 = 4;
          int v175 = v74 + v174;
          v173 = v175;
        } else {
          v173 = v74;
        }
        v167 = v173;
      } else {
        int v176 = 84;
        int v177 = v176 + v74;
        int v178 = v73[v177];
        int v179;
        v179 = v74;
        switch (v178) {
          case 0:
            {
            v179 = v74;
            break;
          }
          case 1:
            {
            v179 = v74;
            break;
          }
          case 2:
            {
            int v180 = 1;
            v179 = v180;
            break;
          }
          default:
            {
            v179 = v74;
            break;
          }
        }
        v167 = v179;
      }
      v161 = v167;
      break;
    }
    case 1:
      {
      int v181 = 88;
      int v182 = v181 + v74;
      int v183 = v73[v182];
      int v184;
      v184 = v74;
      switch (v183) {
        case 0:
          {
          int v185 = 92;
          int v186 = v185 + v74;
          int v187 = v73[v186];
          int v188;
          v188 = v74;
          switch (v187) {
            default:
              {
              v188 = v74;
            }
            case 0:
              {
              v188 = v74;
              break;
            }
          }
          bool v189 = true;
          v184 = v188;
          break;
        }
        default:
          {
          v184 = v74;
          break;
        }
      }
      v161 = v184;
      break;
    }
    case 2:
      {
      int v190 = 96;
      int v191 = v190 + v74;
      int v192 = v73[v191];
      int v193;
      v193 = v74;
      switch (v192) {
        default:
          {
          int v194 = 0;
          int v195 = 0;
          int v196;
          int v197;
          v196 = v194;
          v197 = v195;
          while (true) {
            int v198 = 4;
            int v199 = v197 * v198;
            int v200 = v199 + v74;
            int v201 = 100;
            int v202 = v201 + v200;
            int v203 = v73[v202];
            int v204 = 0;
            bool v205 = v203 != v204;
            v196 = v196;
            v197 = v197;
            if (!v205) break;
            int v206 = v196 + v197;
            int v207 = 1;
            int v208 = v197 + v207;
            bool v209 = true;
            v196 = v206;
            v197 = v208;
            break;
            ;
          }
          v193 = v196;
          break;
        }
        case 0:
          {
          int v210 = 0;
          int v211 = 0;
          int v212;
          int v213;
          v212 = v210;
          v213 = v211;
          while (true) {
            int v214 = 4;
            int v215 = v213 * v214;
            int v216 = v215 + v74;
            int v217 = 120;
            int v218 = v217 + v216;
            int v219 = v73[v218];
            int v220 = 0;
            bool v221 = v219 != v220;
            v212 = v212;
            v213 = v213;
            if (!v221) break;
            int v222 = v212 + v213;
            int v223 = 1;
            int v224 = v213 + v223;
            bool v225 = true;
            v212 = v222;
            v213 = v224;
            break;
            ;
          }
          v193 = v212;
          break;
        }
      }
      v161 = v193;
      break;
    }
    default:
      {
      int v226 = 140;
      int v227 = v226 + v74;
      int v228 = v73[v227];
      int v229 = 3;
      int v230;
      v230 = v229;
      switch (v228) {
        case 0:
          {
          v230 = v74;
          break;
        }
        case 1:
          {
          int v231 = 144;
          int v232 = v231 + v74;
          int v233 = v73[v232];
          int v234 = 0;
          bool v235 = v233 != v234;
          int v236;
          if (v235) {
            int v237 = 4;
            int v238 = v74 + v237;
            v236 = v238;
          } else {
            v236 = v74;
          }
          v230 = v236;
          break;
        }
        default:
          {
          int v239 = 148;
          int v240 = v239 + v74;
          int v241 = v73[v240];
          int v242 = 3;
          int v243;
          v243 = v242;
          switch (v241) {
            case 0:
              {
              int v244 = 4;
              v243 = v244;
            }
            default:
              {
              int v245 = 0;
              v243 = v245;
              break;
            }
            case 1:
              {
              int v246 = 2;
              v243 = v246;
              break;
            }
            case 2:
              {
              v243 = v74;
              break;
            }
          }
          v230 = v243;
          break;
        }
        case 2:
          {
          int v247 = 152;
          int v248 = v247 + v74;
          int v249 = v73[v248];
          int v250 = 1;
          int v251;
          v251 = v250;
          switch (v249) {
            case 0:
              {
              v251 = v74;
              break;
            }
            case 1:
              {
              int v252 = 4;
              v251 = v252;
            }
            default:
              {
              int v253 = 4;
              int v254 = v74 + v253;
              v251 = v254;
              break;
            }
            case 2:
              {
              int v255 = 1;
              int v256 = v74 + v255;
              v251 = v256;
              break;
            }
          }
          bool v257 = true;
          v230 = v251;
          break;
        }
      }
      bool v258 = true;
      v161 = v230;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 20; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 156; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
