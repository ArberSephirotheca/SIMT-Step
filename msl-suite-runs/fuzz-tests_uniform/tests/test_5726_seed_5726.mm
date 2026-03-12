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
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 0;
      int v10 = 0;
      int v11;
      int v12;
      v11 = v9;
      v12 = v10;
      while (true) {
        int v13 = 4;
        int v14 = v3 % v13;
        int v15 = 1;
        int v16 = v14 + v15;
        bool v17 = v12 < v16;
        v11 = v11;
        v12 = v12;
        if (!v17) break;
        int v18 = 2;
        int v19 = v0 + v18;
        int v20 = 1;
        int v21 = v12 + v20;
        v11 = v19;
        v12 = v21;
      }
      v8 = v11;
      break;
    }
    default:
      {
      int v22 = 4;
      int v23 = v0 + v22;
      v8 = v23;
      break;
    }
    case 1:
      {
      int v24 = 4;
      int v25 = v3 % v24;
      int v26 = 0;
      int v27;
      v27 = v26;
      switch (v25) {
        case 0:
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
            int v37 = 3;
            int v38 = 1;
            int v39 = v31 + v38;
            v30 = v37;
            v31 = v39;
            break;
            ;
          }
          int v40 = 3;
          v27 = v30;
          break;
        }
        default:
          {
          int v41 = 0;
          int v42 = 0;
          int v43;
          int v44;
          v43 = v41;
          v44 = v42;
          while (true) {
            int v45 = 4;
            int v46 = v3 % v45;
            int v47 = 1;
            int v48 = v46 + v47;
            bool v49 = v44 < v48;
            v43 = v43;
            v44 = v44;
            if (!v49) break;
            int v50 = 1;
            int v51 = v44 + v50;
            v43 = v0;
            v44 = v51;
          }
          int v52 = 2;
          v27 = v43;
          break;
        }
        case 1:
          {
          int v53 = 3;
          int v54 = v3 % v53;
          int v55 = 4;
          int v56 = v0 + v55;
          int v57;
          v57 = v56;
          switch (v54) {
            case 0:
              {
              int v58 = 4;
              v57 = v58;
              break;
            }
            default:
              {
              v57 = v0;
              break;
            }
            case 1:
              {
              v57 = v0;
              break;
            }
          }
          int v59 = 2;
          int v60 = v0 + v59;
          v27 = v57;
          break;
        }
        case 2:
          {
          int v61 = 0;
          bool v62 = v2 != v61;
          int v63;
          if (v62) {
            int v64 = 3;
            v63 = v64;
          } else {
            v63 = v0;
          }
          int v65 = 0;
          int v66 = v0 + v65;
          v27 = v63;
          break;
        }
      }
      v8 = v27;
      break;
    }
    case 2:
      {
      int v67 = 2;
      int v68 = v3 % v67;
      int v69;
      v69 = v0;
      switch (v68) {
        case 0:
          {
          v69 = v0;
          break;
        }
        default:
          {
          int v70 = 3;
          int v71 = v3 % v70;
          int v72 = 2;
          int v73;
          v73 = v72;
          switch (v71) {
            default:
              {
              int v74 = 1;
              int v75 = v0 + v74;
              v73 = v75;
            }
            case 0:
              {
              v73 = v0;
            }
            case 1:
              {
              int v76 = 1;
              v73 = v76;
              break;
            }
          }
          int v77 = 3;
          int v78 = v0 + v77;
          v69 = v73;
          break;
        }
      }
      int v79 = 1;
      int v80 = v0 + v79;
      v8 = v69;
      break;
    }
  }
  bool v81 = true;
  int v82 = simt_wave_count_bits(v81);
  int v83 = 0;
  int v84 = v83 + v0;
  v1[v84] = v82;
  return;
}

kernel void kernel_main(device int* v85 [[buffer(0)]], device int* v86 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v87 = static_cast<int>(__simt_tid3.x);
  int v88 = 0;
  int v89 = v88 + v87;
  int v90 = v86[v89];
  int v91 = 4;
  int v92 = v91 + v87;
  int v93 = v86[v92];
  helper0(v87, v85, v90, v93, static_cast<int>(__simt_tid3.x));
  int v94 = 8;
  int v95 = v94 + v87;
  int v96 = v86[v95];
  int v97 = 0;
  bool v98 = v96 != v97;
  int v99;
  if (v98) {
    int v100 = 12;
    int v101 = v100 + v87;
    int v102 = v86[v101];
    int v103 = 1;
    int v104;
    v104 = v103;
    switch (v102) {
      case 0:
        {
        v104 = v87;
        break;
      }
      default:
        {
        int v105 = 16;
        int v106 = v105 + v87;
        int v107 = v86[v106];
        int v108 = 0;
        bool v109 = v107 != v108;
        int v110;
        if (v109) {
          int v111 = 3;
          v110 = v111;
        } else {
          int v112 = 4;
          v110 = v112;
        }
        v104 = v110;
        break;
      }
      case 1:
        {
        int v113 = 20;
        int v114 = v113 + v87;
        int v115 = v86[v114];
        int v116 = 3;
        int v117;
        v117 = v116;
        switch (v115) {
          case 0:
            {
            int v118 = 0;
            int v119 = v87 + v118;
            v117 = v119;
            break;
          }
          default:
            {
            v117 = v87;
            break;
          }
        }
        bool v120 = true;
        v104 = v117;
        break;
      }
    }
    bool v121 = true;
    v99 = v104;
  } else {
    int v122 = 24;
    int v123 = v122 + v87;
    int v124 = v86[v123];
    int v125 = 0;
    bool v126 = v124 != v125;
    int v127;
    if (v126) {
      int v128 = 28;
      int v129 = v128 + v87;
      int v130 = v86[v129];
      int v131 = 0;
      bool v132 = v130 != v131;
      int v133;
      if (v132) {
        v133 = v87;
      } else {
        v133 = v87;
      }
      v127 = v133;
    } else {
      int v134 = 32;
      int v135 = v134 + v87;
      int v136 = v86[v135];
      uint v137 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v138 = (int)(v137);
      int v139;
      v139 = v138;
      switch (v136) {
        case 0:
          {
          int v140 = 4;
          int v141 = v87 + v140;
          v139 = v141;
          break;
        }
        default:
          {
          v139 = v87;
          break;
        }
      }
      bool v142 = true;
      v127 = v139;
    }
    v99 = v127;
  }
  int v143 = 16;
  int v144 = v143 + v87;
  bool v145 = true;
  int v146 = simt_wave_count_bits(v145);
  v85[v144] = v146;
  int v147 = 36;
  int v148 = v147 + v87;
  int v149 = v86[v148];
  int v150;
  v150 = v87;
  switch (v149) {
    case 0:
      {
      int v151 = 2;
      int v152 = v87 + v151;
      v150 = v152;
      break;
    }
    default:
      {
      v150 = v87;
      break;
    }
    case 1:
      {
      int v153 = 0;
      int v154 = v87 + v153;
      v150 = v154;
      break;
    }
    case 2:
      {
      int v155 = 40;
      int v156 = v155 + v87;
      int v157 = v86[v156];
      int v158 = 0;
      bool v159 = v157 != v158;
      int v160;
      if (v159) {
        int v161 = 2;
        v160 = v161;
      } else {
        int v162 = 44;
        int v163 = v162 + v87;
        int v164 = v86[v163];
        int v165;
        v165 = v87;
        switch (v164) {
          case 0:
            {
            int v166 = 4;
            int v167 = v87 + v166;
            v165 = v167;
            break;
          }
          default:
            {
            int v168 = 4;
            int v169 = v87 + v168;
            v165 = v169;
            break;
          }
        }
        bool v170 = true;
        v160 = v165;
      }
      v150 = v160;
      break;
    }
  }
  bool v171 = true;
  int v172 = 32;
  int v173 = v172 + v87;
  bool v174 = true;
  int v175 = simt_wave_count_bits(v174);
  v85[v173] = v175;
  int v176 = 48;
  int v177 = v176 + v87;
  int v178 = v86[v177];
  uint v179 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v180 = (int)(v179);
  int v181;
  v181 = v180;
  switch (v178) {
    case 0:
      {
      int v182 = 52;
      int v183 = v182 + v87;
      int v184 = v86[v183];
      int v185 = 0;
      bool v186 = v184 != v185;
      int v187;
      if (v186) {
        int v188 = 56;
        int v189 = v188 + v87;
        int v190 = v86[v189];
        int v191 = 3;
        int v192 = v87 + v191;
        int v193;
        v193 = v192;
        switch (v190) {
          case 0:
            {
            int v194 = 3;
            int v195 = v87 + v194;
            v193 = v195;
            break;
          }
          default:
            {
            int v196 = 0;
            v193 = v196;
            break;
          }
          case 1:
            {
            int v197 = 4;
            v193 = v197;
            break;
          }
          case 2:
            {
            int v198 = 4;
            int v199 = v87 + v198;
            v193 = v199;
            break;
          }
        }
        bool v200 = true;
        v187 = v193;
      } else {
        int v201 = 60;
        int v202 = v201 + v87;
        int v203 = v86[v202];
        int v204;
        v204 = v87;
        switch (v203) {
          case 0:
            {
            int v205 = 1;
            v204 = v205;
            break;
          }
          default:
            {
            int v206 = 0;
            v204 = v206;
            break;
          }
        }
        bool v207 = true;
        v187 = v204;
      }
      v181 = v187;
      break;
    }
    case 1:
      {
      int v208 = 64;
      int v209 = v208 + v87;
      int v210 = v86[v209];
      int v211 = 0;
      bool v212 = v210 != v211;
      int v213;
      if (v212) {
        int v214 = 1;
        v213 = v214;
      } else {
        int v215 = 68;
        int v216 = v215 + v87;
        int v217 = v86[v216];
        int v218 = 2;
        int v219 = v87 + v218;
        int v220;
        v220 = v219;
        switch (v217) {
          default:
            {
            int v221 = 2;
            v220 = v221;
            break;
          }
          case 0:
            {
            v220 = v87;
            break;
          }
          case 1:
            {
            int v222 = 0;
            int v223 = v87 + v222;
            v220 = v223;
            break;
          }
        }
        bool v224 = true;
        v213 = v220;
      }
      v181 = v213;
      break;
    }
    default:
      {
      int v225 = 3;
      v181 = v225;
    }
    case 2:
      {
      int v226 = 72;
      int v227 = v226 + v87;
      int v228 = v86[v227];
      int v229 = 4;
      int v230 = v87 + v229;
      int v231;
      v231 = v230;
      switch (v228) {
        case 0:
          {
          int v232 = 76;
          int v233 = v232 + v87;
          int v234 = v86[v233];
          int v235 = 1;
          int v236 = v87 + v235;
          int v237;
          v237 = v236;
          switch (v234) {
            case 0:
              {
              v237 = v87;
              break;
            }
            default:
              {
              int v238 = 2;
              v237 = v238;
              break;
            }
            case 1:
              {
              int v239 = 0;
              int v240 = v87 + v239;
              v237 = v240;
              break;
            }
            case 2:
              {
              int v241 = 4;
              int v242 = v87 + v241;
              v237 = v242;
              break;
            }
          }
          bool v243 = true;
          v231 = v237;
          break;
        }
        case 1:
          {
          v231 = v87;
          break;
        }
        default:
          {
          int v244 = 80;
          int v245 = v244 + v87;
          int v246 = v86[v245];
          int v247 = 0;
          bool v248 = v246 != v247;
          int v249;
          if (v248) {
            int v250 = 2;
            int v251 = v87 + v250;
            v249 = v251;
          } else {
            int v252 = 4;
            int v253 = v87 + v252;
            v249 = v253;
          }
          v231 = v249;
          break;
        }
        case 2:
          {
          int v254 = 2;
          v231 = v254;
          break;
        }
      }
      bool v255 = true;
      v181 = v231;
      break;
    }
  }
  bool v256 = true;
  int v257 = 48;
  int v258 = v257 + v87;
  bool v259 = true;
  int v260 = simt_wave_count_bits(v259);
  v85[v258] = v260;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 52; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 84; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
