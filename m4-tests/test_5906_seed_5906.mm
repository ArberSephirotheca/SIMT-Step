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
    int v7;
    v7 = v0;
    switch (v3) {
      default:
        {
        int v8 = 2;
        int v9 = v3 % v8;
        int v10 = 3;
        int v11 = v0 + v10;
        int v12;
        v12 = v11;
        switch (v9) {
          default:
            {
            int v13 = 2;
            v12 = v13;
          }
          case 0:
            {
            int v14 = 3;
            v12 = v14;
          }
          case 1:
            {
            v12 = v0;
            break;
          }
        }
        v7 = v12;
        break;
      }
      case 0:
        {
        int v15 = 3;
        int v16 = v3 % v15;
        int v17 = 1;
        int v18 = v0 + v17;
        int v19;
        v19 = v18;
        switch (v16) {
          case 0:
            {
            int v20 = 4;
            v19 = v20;
            break;
          }
          default:
            {
            int v21 = 1;
            v19 = v21;
          }
          case 1:
            {
            v19 = v0;
            break;
          }
        }
        v7 = v19;
        break;
      }
    }
    v6 = v7;
  } else {
    bool v22 = true;
    int v23 = simt_wave_count_bits(v22);
    int v24 = 0;
    int v25 = v24 + v0;
    v1[v25] = v23;
    v6 = v23;
  }
  return;
}

kernel void kernel_main(device int* v26 [[buffer(0)]], device int* v27 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v28 = static_cast<int>(__simt_tid3.x);
  int v29 = 0;
  int v30 = v29 + v28;
  int v31 = v27[v30];
  int v32 = 4;
  int v33 = v32 + v28;
  int v34 = v27[v33];
  helper0(v28, v26, v31, v34, static_cast<int>(__simt_tid3.x));
  int v35 = 8;
  int v36 = v35 + v28;
  int v37 = v27[v36];
  uint v38 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v39 = (int)(v38);
  int v40;
  v40 = v39;
  switch (v37) {
    default:
      {
      int v41 = 12;
      int v42 = v41 + v28;
      int v43 = v27[v42];
      int v44 = 0;
      bool v45 = v43 != v44;
      int v46;
      if (v45) {
        int v47 = 16;
        int v48 = v47 + v28;
        int v49 = v27[v48];
        int v50 = 3;
        int v51;
        v51 = v50;
        switch (v49) {
          case 0:
            {
            int v52 = 4;
            v51 = v52;
            break;
          }
          default:
            {
            int v53 = 0;
            int v54 = v28 + v53;
            v51 = v54;
            break;
          }
        }
        v46 = v51;
      } else {
        int v55 = 20;
        int v56 = v55 + v28;
        int v57 = v27[v56];
        int v58 = 0;
        bool v59 = v57 != v58;
        int v60;
        if (v59) {
          v60 = v28;
        } else {
          int v61 = 2;
          int v62 = v28 + v61;
          v60 = v62;
        }
        v46 = v60;
      }
      v40 = v46;
    }
    case 0:
      {
      int v63 = 24;
      int v64 = v63 + v28;
      int v65 = v27[v64];
      int v66 = 0;
      int v67 = v28 + v66;
      int v68;
      v68 = v67;
      switch (v65) {
        case 0:
          {
          int v69 = 28;
          int v70 = v69 + v28;
          int v71 = v27[v70];
          int v72 = 3;
          int v73 = v28 + v72;
          int v74;
          v74 = v73;
          switch (v71) {
            default:
              {
              v74 = v28;
              break;
            }
            case 0:
              {
              int v75 = 1;
              v74 = v75;
              break;
            }
            case 1:
              {
              int v76 = 2;
              int v77 = v28 + v76;
              v74 = v77;
              break;
            }
          }
          bool v78 = true;
          v68 = v74;
          break;
        }
        case 1:
          {
          int v79 = 0;
          int v80 = 0;
          int v81;
          int v82;
          v81 = v79;
          v82 = v80;
          while (true) {
            int v83 = 4;
            int v84 = v82 * v83;
            int v85 = v84 + v28;
            int v86 = 32;
            int v87 = v86 + v85;
            int v88 = v27[v87];
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
            continue;
            ;
          }
          v68 = v81;
        }
        default:
          {
          int v95 = 52;
          int v96 = v95 + v28;
          int v97 = v27[v96];
          int v98;
          v98 = v28;
          switch (v97) {
            case 0:
              {
              v98 = v28;
            }
            default:
              {
              int v99 = 0;
              v98 = v99;
            }
            case 1:
              {
              int v100 = 1;
              int v101 = v28 + v100;
              v98 = v101;
              break;
            }
          }
          v68 = v98;
          break;
        }
      }
      bool v102 = true;
      v40 = v68;
    }
    case 1:
      {
      int v103 = 56;
      int v104 = v103 + v28;
      int v105 = v27[v104];
      int v106 = 0;
      bool v107 = v105 != v106;
      int v108;
      if (v107) {
        int v109 = 60;
        int v110 = v109 + v28;
        int v111 = v27[v110];
        int v112 = 0;
        int v113;
        v113 = v112;
        switch (v111) {
          default:
            {
            int v114 = 0;
            int v115 = v28 + v114;
            v113 = v115;
            break;
          }
          case 0:
            {
            v113 = v28;
          }
          case 1:
            {
            int v116 = 0;
            v113 = v116;
            break;
          }
        }
        v108 = v113;
      } else {
        int v117 = 64;
        int v118 = v117 + v28;
        int v119 = v27[v118];
        int v120 = 0;
        bool v121 = v119 != v120;
        int v122;
        if (v121) {
          int v123 = 1;
          int v124 = v28 + v123;
          v122 = v124;
        } else {
          v122 = v28;
        }
        v108 = v122;
      }
      v40 = v108;
    }
    case 2:
      {
      int v125 = 0;
      int v126 = 0;
      int v127;
      int v128;
      v127 = v125;
      v128 = v126;
      while (true) {
        int v129 = 4;
        int v130 = v128 * v129;
        int v131 = v130 + v28;
        int v132 = 68;
        int v133 = v132 + v131;
        int v134 = v27[v133];
        int v135 = 0;
        bool v136 = v134 != v135;
        v127 = v127;
        v128 = v128;
        if (!v136) break;
        int v137 = 88;
        int v138 = v137 + v28;
        int v139 = v27[v138];
        int v140 = 3;
        int v141 = v28 + v140;
        int v142;
        v142 = v141;
        switch (v139) {
          default:
            {
            int v143 = 3;
            v142 = v143;
            break;
          }
          case 0:
            {
            int v144 = 1;
            int v145 = v28 + v144;
            v142 = v145;
            break;
          }
          case 1:
            {
            int v146 = 2;
            v142 = v146;
            break;
          }
        }
        int v147 = v127 + v142;
        int v148 = 1;
        int v149 = v128 + v148;
        bool v150 = true;
        v127 = v147;
        v128 = v149;
      }
      v40 = v127;
      break;
    }
  }
  int v151 = 92;
  int v152 = v151 + v28;
  int v153 = v27[v152];
  uint v154 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v155 = (int)(v154);
  int v156;
  v156 = v155;
  switch (v153) {
    case 0:
      {
      int v157 = 96;
      int v158 = v157 + v28;
      int v159 = v27[v158];
      int v160 = 0;
      bool v161 = v159 != v160;
      int v162;
      if (v161) {
        int v163 = 100;
        int v164 = v163 + v28;
        int v165 = v27[v164];
        int v166 = 2;
        int v167 = v28 + v166;
        int v168;
        v168 = v167;
        switch (v165) {
          case 0:
            {
            int v169 = 2;
            v168 = v169;
          }
          default:
            {
            v168 = v28;
          }
          case 1:
            {
            int v170 = 1;
            int v171 = v28 + v170;
            v168 = v171;
            break;
          }
        }
        v162 = v168;
      } else {
        int v172 = 0;
        int v173 = 0;
        int v174;
        int v175;
        v174 = v172;
        v175 = v173;
        while (true) {
          int v176 = 4;
          int v177 = v175 * v176;
          int v178 = v177 + v28;
          int v179 = 104;
          int v180 = v179 + v178;
          int v181 = v27[v180];
          int v182 = 0;
          bool v183 = v181 != v182;
          v174 = v174;
          v175 = v175;
          if (!v183) break;
          int v184 = v174 + v175;
          int v185 = 1;
          int v186 = v175 + v185;
          bool v187 = true;
          v174 = v184;
          v175 = v186;
          continue;
          ;
        }
        v162 = v174;
      }
      v156 = v162;
      break;
    }
    default:
      {
      int v188 = 124;
      int v189 = v188 + v28;
      int v190 = v27[v189];
      int v191 = 0;
      bool v192 = v190 != v191;
      int v193;
      if (v192) {
        int v194 = 128;
        int v195 = v194 + v28;
        int v196 = v27[v195];
        int v197 = 0;
        bool v198 = v196 != v197;
        int v199;
        if (v198) {
          int v200 = 3;
          v199 = v200;
        } else {
          v199 = v28;
        }
        v193 = v199;
      } else {
        int v201 = 132;
        int v202 = v201 + v28;
        int v203 = v27[v202];
        int v204 = 4;
        int v205 = v28 + v204;
        int v206;
        v206 = v205;
        switch (v203) {
          default:
            {
            int v207 = 4;
            int v208 = v28 + v207;
            v206 = v208;
            break;
          }
          case 0:
            {
            int v209 = 1;
            int v210 = v28 + v209;
            v206 = v210;
            break;
          }
          case 1:
            {
            v206 = v28;
          }
          case 2:
            {
            v206 = v28;
            break;
          }
        }
        v193 = v206;
      }
      v156 = v193;
    }
    case 1:
      {
      int v211 = 136;
      int v212 = v211 + v28;
      int v213 = v27[v212];
      int v214 = 0;
      int v215;
      v215 = v214;
      switch (v213) {
        default:
          {
          v215 = v28;
        }
        case 0:
          {
          int v216 = 0;
          int v217 = 0;
          int v218;
          int v219;
          v218 = v216;
          v219 = v217;
          while (true) {
            int v220 = 4;
            int v221 = v219 * v220;
            int v222 = v221 + v28;
            int v223 = 140;
            int v224 = v223 + v222;
            int v225 = v27[v224];
            int v226 = 0;
            bool v227 = v225 != v226;
            v218 = v218;
            v219 = v219;
            if (!v227) break;
            int v228 = v218 + v219;
            int v229 = 1;
            int v230 = v219 + v229;
            bool v231 = true;
            v218 = v228;
            v219 = v230;
          }
          v215 = v218;
        }
        case 1:
          {
          int v232 = 0;
          int v233 = 0;
          int v234;
          int v235;
          v234 = v232;
          v235 = v233;
          while (true) {
            int v236 = 4;
            int v237 = v235 * v236;
            int v238 = v237 + v28;
            int v239 = 160;
            int v240 = v239 + v238;
            int v241 = v27[v240];
            int v242 = 0;
            bool v243 = v241 != v242;
            v234 = v234;
            v235 = v235;
            if (!v243) break;
            int v244 = v234 + v235;
            int v245 = 1;
            int v246 = v235 + v245;
            bool v247 = true;
            v234 = v244;
            v235 = v246;
          }
          v215 = v234;
        }
        case 2:
          {
          int v248 = 180;
          int v249 = v248 + v28;
          int v250 = v27[v249];
          int v251 = 4;
          int v252 = v28 + v251;
          int v253;
          v253 = v252;
          switch (v250) {
            default:
              {
              int v254 = 3;
              v253 = v254;
            }
            case 0:
              {
              v253 = v28;
              break;
            }
          }
          v215 = v253;
          break;
        }
      }
      v156 = v215;
    }
    case 2:
      {
      int v255 = 184;
      int v256 = v255 + v28;
      int v257 = v27[v256];
      int v258 = 0;
      bool v259 = v257 != v258;
      int v260;
      if (v259) {
        int v261 = 3;
        int v262 = v28 + v261;
        v260 = v262;
      } else {
        int v263 = 4;
        int v264 = v28 + v263;
        v260 = v264;
      }
      v156 = v260;
      break;
    }
  }
  uint v265 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v266 = (int)(v265);
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 4; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 188; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
