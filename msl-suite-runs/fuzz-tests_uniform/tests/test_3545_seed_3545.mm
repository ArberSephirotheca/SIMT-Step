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
  int v4 = 4;
  int v5 = v3 % v4;
  int v6 = 0;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 2;
      int v10 = v3 % v9;
      int v11 = 0;
      int v12;
      v12 = v11;
      switch (v10) {
        default:
          {
          int v13 = 0;
          v12 = v13;
          break;
        }
        case 0:
          {
          int v14 = 0;
          int v15 = 0;
          int v16;
          int v17;
          v16 = v14;
          v17 = v15;
          while (true) {
            int v18 = 4;
            int v19 = v3 % v18;
            int v20 = 1;
            int v21 = v19 + v20;
            bool v22 = v17 < v21;
            v16 = v16;
            v17 = v17;
            if (!v22) break;
            int v23 = 1;
            int v24 = 1;
            int v25 = v17 + v24;
            v16 = v23;
            v17 = v25;
          }
          v12 = v16;
          break;
        }
        case 1:
          {
          int v26 = 0;
          int v27 = 0;
          int v28;
          int v29;
          v28 = v26;
          v29 = v27;
          while (true) {
            int v30 = 4;
            int v31 = v3 % v30;
            int v32 = 1;
            int v33 = v31 + v32;
            bool v34 = v29 < v33;
            v28 = v28;
            v29 = v29;
            if (!v34) break;
            int v35 = 2;
            int v36 = 1;
            int v37 = v29 + v36;
            v28 = v35;
            v29 = v37;
          }
          int v38 = 3;
          v12 = v28;
          break;
        }
      }
      int v39 = 4;
      int v40 = v0 + v39;
      v8 = v12;
      break;
    }
    case 1:
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
        int v50 = 0;
        bool v51 = v2 != v50;
        int v52;
        if (v51) {
          v52 = v0;
        } else {
          int v53 = 1;
          v52 = v53;
        }
        int v54 = 2;
        int v55 = v0 + v54;
        int v56 = 1;
        int v57 = v44 + v56;
        v43 = v52;
        v44 = v57;
      }
      int v58 = 4;
      v8 = v43;
      break;
    }
    default:
      {
      int v59 = 0;
      int v60 = 0;
      int v61;
      int v62;
      v61 = v59;
      v62 = v60;
      while (true) {
        int v63 = 4;
        int v64 = v3 % v63;
        int v65 = 1;
        int v66 = v64 + v65;
        bool v67 = v62 < v66;
        v61 = v61;
        v62 = v62;
        if (!v67) break;
        int v68 = 2;
        int v69 = v3 % v68;
        int v70 = 2;
        int v71 = v0 + v70;
        int v72;
        v72 = v71;
        switch (v69) {
          case 0:
            {
            v72 = v0;
            break;
          }
          default:
            {
            int v73 = 3;
            v72 = v73;
            break;
          }
          case 1:
            {
            v72 = v0;
            break;
          }
        }
        int v74 = 1;
        int v75 = v62 + v74;
        v61 = v72;
        v62 = v75;
      }
      int v76 = 0;
      int v77 = v0 + v76;
      v8 = v61;
      break;
    }
    case 2:
      {
      int v78 = 4;
      int v79 = v3 % v78;
      int v80 = 2;
      int v81;
      v81 = v80;
      switch (v79) {
        case 0:
          {
          int v82 = 0;
          int v83 = 0;
          int v84;
          int v85;
          v84 = v82;
          v85 = v83;
          while (true) {
            int v86 = 4;
            int v87 = v3 % v86;
            int v88 = 1;
            int v89 = v87 + v88;
            bool v90 = v85 < v89;
            v84 = v84;
            v85 = v85;
            if (!v90) break;
            int v91 = 3;
            int v92 = v0 + v91;
            int v93 = 1;
            int v94 = v85 + v93;
            v84 = v92;
            v85 = v94;
            continue;
            ;
          }
          int v95 = 4;
          int v96 = v0 + v95;
          v81 = v84;
          break;
        }
        case 1:
          {
          int v97 = 2;
          int v98 = v3 % v97;
          int v99 = 2;
          int v100;
          v100 = v99;
          switch (v98) {
            case 0:
              {
              int v101 = 0;
              int v102 = v0 + v101;
              v100 = v102;
              break;
            }
            default:
              {
              v100 = v0;
              break;
            }
          }
          int v103 = 3;
          v81 = v100;
          break;
        }
        case 2:
          {
          int v104 = 0;
          int v105 = 0;
          int v106;
          int v107;
          v106 = v104;
          v107 = v105;
          while (true) {
            int v108 = 4;
            int v109 = v3 % v108;
            int v110 = 1;
            int v111 = v109 + v110;
            bool v112 = v107 < v111;
            v106 = v106;
            v107 = v107;
            if (!v112) break;
            int v113 = 3;
            int v114 = v0 + v113;
            int v115 = 1;
            int v116 = v107 + v115;
            v106 = v114;
            v107 = v116;
            break;
            ;
          }
          int v117 = 4;
          int v118 = v0 + v117;
          v81 = v106;
          break;
        }
        default:
          {
          int v119 = 2;
          int v120 = v3 % v119;
          int v121 = 4;
          int v122 = v0 + v121;
          int v123;
          v123 = v122;
          switch (v120) {
            default:
              {
              int v124 = 2;
              int v125 = v0 + v124;
              v123 = v125;
            }
            case 0:
              {
              int v126 = 3;
              v123 = v126;
              break;
            }
          }
          v81 = v123;
          break;
        }
      }
      int v127 = 4;
      v8 = v81;
      break;
    }
  }
  bool v128 = true;
  int v129 = simt_wave_count_bits(v128);
  int v130 = 0;
  int v131 = v130 + v0;
  v1[v131] = v129;
  return;
}

kernel void kernel_main(device int* v132 [[buffer(0)]], device int* v133 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v134 = static_cast<int>(__simt_tid3.x);
  int v135 = 0;
  int v136 = v135 + v134;
  int v137 = v133[v136];
  int v138 = 4;
  int v139 = v138 + v134;
  int v140 = v133[v139];
  helper0(v134, v132, v137, v140, static_cast<int>(__simt_tid3.x));
  int v141 = 8;
  int v142 = v141 + v134;
  int v143 = v133[v142];
  int v144 = 2;
  int v145 = v134 + v144;
  int v146;
  v146 = v145;
  switch (v143) {
    case 0:
      {
      int v147 = 12;
      int v148 = v147 + v134;
      int v149 = v133[v148];
      int v150 = 0;
      bool v151 = v149 != v150;
      int v152;
      if (v151) {
        int v153 = 16;
        int v154 = v153 + v134;
        int v155 = v133[v154];
        int v156;
        v156 = v134;
        switch (v155) {
          default:
            {
            v156 = v134;
            break;
          }
          case 0:
            {
            int v157 = 2;
            int v158 = v134 + v157;
            v156 = v158;
            break;
          }
          case 1:
            {
            int v159 = 0;
            int v160 = v134 + v159;
            v156 = v160;
            break;
          }
          case 2:
            {
            v156 = v134;
            break;
          }
        }
        bool v161 = true;
        v152 = v156;
      } else {
        int v162 = 0;
        int v163 = 0;
        int v164;
        int v165;
        v164 = v162;
        v165 = v163;
        while (true) {
          int v166 = 4;
          int v167 = v165 * v166;
          int v168 = v167 + v134;
          int v169 = 20;
          int v170 = v169 + v168;
          int v171 = v133[v170];
          int v172 = 0;
          bool v173 = v171 != v172;
          v164 = v164;
          v165 = v165;
          if (!v173) break;
          int v174 = v164 + v165;
          int v175 = 1;
          int v176 = v165 + v175;
          v164 = v174;
          v165 = v176;
        }
        bool v177 = true;
        v152 = v164;
      }
      v146 = v152;
      break;
    }
    default:
      {
      int v178 = 40;
      int v179 = v178 + v134;
      int v180 = v133[v179];
      int v181 = 0;
      bool v182 = v180 != v181;
      int v183;
      if (v182) {
        v183 = v134;
      } else {
        int v184 = 0;
        int v185 = 0;
        int v186;
        int v187;
        v186 = v184;
        v187 = v185;
        while (true) {
          int v188 = 4;
          int v189 = v187 * v188;
          int v190 = v189 + v134;
          int v191 = 44;
          int v192 = v191 + v190;
          int v193 = v133[v192];
          int v194 = 0;
          bool v195 = v193 != v194;
          v186 = v186;
          v187 = v187;
          if (!v195) break;
          int v196 = v186 + v187;
          int v197 = 1;
          int v198 = v187 + v197;
          v186 = v196;
          v187 = v198;
          break;
          ;
        }
        bool v199 = true;
        v183 = v186;
      }
      v146 = v183;
      break;
    }
    case 1:
      {
      int v200 = 0;
      int v201 = 0;
      int v202;
      int v203;
      v202 = v200;
      v203 = v201;
      while (true) {
        int v204 = 4;
        int v205 = v203 * v204;
        int v206 = v205 + v134;
        int v207 = 64;
        int v208 = v207 + v206;
        int v209 = v133[v208];
        int v210 = 0;
        bool v211 = v209 != v210;
        v202 = v202;
        v203 = v203;
        if (!v211) break;
        int v212 = v202 + v203;
        int v213 = 1;
        int v214 = v203 + v213;
        v202 = v212;
        v203 = v214;
        continue;
        ;
      }
      bool v215 = true;
      v146 = v202;
      break;
    }
    case 2:
      {
      int v216 = 84;
      int v217 = v216 + v134;
      int v218 = v133[v217];
      int v219 = 1;
      int v220 = v134 + v219;
      int v221;
      v221 = v220;
      switch (v218) {
        default:
          {
          int v222 = 88;
          int v223 = v222 + v134;
          int v224 = v133[v223];
          int v225 = 0;
          bool v226 = v224 != v225;
          int v227;
          if (v226) {
            int v228 = 4;
            v227 = v228;
          } else {
            int v229 = 4;
            v227 = v229;
          }
          v221 = v227;
          break;
        }
        case 0:
          {
          int v230 = 92;
          int v231 = v230 + v134;
          int v232 = v133[v231];
          int v233 = 0;
          bool v234 = v232 != v233;
          int v235;
          if (v234) {
            v235 = v134;
          } else {
            v235 = v134;
          }
          v221 = v235;
        }
        case 1:
          {
          int v236 = 2;
          int v237 = v134 + v236;
          v221 = v237;
        }
        case 2:
          {
          int v238 = 96;
          int v239 = v238 + v134;
          int v240 = v133[v239];
          int v241 = 0;
          bool v242 = v240 != v241;
          int v243;
          if (v242) {
            int v244 = 4;
            int v245 = v134 + v244;
            v243 = v245;
          } else {
            int v246 = 1;
            int v247 = v134 + v246;
            v243 = v247;
          }
          v221 = v243;
          break;
        }
      }
      bool v248 = true;
      v146 = v221;
      break;
    }
  }
  bool v249 = true;
  int v250 = 16;
  int v251 = v250 + v134;
  bool v252 = true;
  int v253 = simt_wave_count_bits(v252);
  v132[v251] = v253;
  int v254 = 100;
  int v255 = v254 + v134;
  int v256 = v133[v255];
  int v257 = 0;
  bool v258 = v256 != v257;
  int v259;
  if (v258) {
    int v260 = 4;
    int v261 = v134 + v260;
    v259 = v261;
  } else {
    int v262 = 104;
    int v263 = v262 + v134;
    int v264 = v133[v263];
    int v265 = 1;
    int v266;
    v266 = v265;
    switch (v264) {
      case 0:
        {
        int v267 = 108;
        int v268 = v267 + v134;
        int v269 = v133[v268];
        int v270 = 0;
        bool v271 = v269 != v270;
        int v272;
        if (v271) {
          int v273 = 2;
          v272 = v273;
        } else {
          v272 = v134;
        }
        v266 = v272;
        break;
      }
      default:
        {
        int v274 = 112;
        int v275 = v274 + v134;
        int v276 = v133[v275];
        int v277 = 2;
        int v278 = v134 + v277;
        int v279;
        v279 = v278;
        switch (v276) {
          default:
            {
            int v280 = 1;
            int v281 = v134 + v280;
            v279 = v281;
            break;
          }
          case 0:
            {
            int v282 = 4;
            v279 = v282;
            break;
          }
        }
        bool v283 = true;
        v266 = v279;
        break;
      }
    }
    bool v284 = true;
    v259 = v266;
  }
  int v285 = 32;
  int v286 = v285 + v134;
  bool v287 = true;
  int v288 = simt_wave_count_bits(v287);
  v132[v286] = v288;
  uint v289 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v290 = (int)(v289);
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 36; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 116; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
