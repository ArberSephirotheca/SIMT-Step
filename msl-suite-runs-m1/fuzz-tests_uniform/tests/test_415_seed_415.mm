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
    int v7 = 3;
    int v8 = v3 % v7;
    int v9 = 3;
    int v10;
    v10 = v9;
    switch (v8) {
      case 0:
        {
        int v11 = 0;
        int v12 = 0;
        int v13;
        int v14;
        v13 = v11;
        v14 = v12;
        while (true) {
          int v15 = 4;
          int v16 = v3 % v15;
          int v17 = 1;
          int v18 = v16 + v17;
          bool v19 = v14 < v18;
          v13 = v13;
          v14 = v14;
          if (!v19) break;
          int v20 = 1;
          int v21 = v0 + v20;
          int v22 = 1;
          int v23 = v14 + v22;
          v13 = v21;
          v14 = v23;
        }
        v10 = v13;
        break;
      }
      case 1:
        {
        int v24 = 4;
        int v25 = v3 % v24;
        int v26;
        v26 = v0;
        switch (v25) {
          case 0:
            {
            int v27 = 0;
            int v28 = v0 + v27;
            v26 = v28;
            break;
          }
          case 1:
            {
            int v29 = 4;
            int v30 = v0 + v29;
            v26 = v30;
            break;
          }
          default:
            {
            int v31 = 3;
            int v32 = v0 + v31;
            v26 = v32;
            break;
          }
          case 2:
            {
            int v33 = 0;
            int v34 = v0 + v33;
            v26 = v34;
            break;
          }
        }
        v10 = v26;
        break;
      }
      case 2:
        {
        int v35 = 3;
        int v36 = v3 % v35;
        int v37;
        v37 = v0;
        switch (v36) {
          default:
            {
            v37 = v0;
          }
          case 0:
            {
            int v38 = 3;
            v37 = v38;
            break;
          }
          case 1:
            {
            int v39 = 1;
            v37 = v39;
            break;
          }
        }
        int v40 = 2;
        int v41 = v0 + v40;
        v10 = v37;
      }
      default:
        {
        int v42 = 0;
        int v43 = 0;
        int v44;
        int v45;
        v44 = v42;
        v45 = v43;
        while (true) {
          int v46 = 4;
          int v47 = v3 % v46;
          int v48 = 1;
          int v49 = v47 + v48;
          bool v50 = v45 < v49;
          v44 = v44;
          v45 = v45;
          if (!v50) break;
          int v51 = 1;
          int v52 = v45 + v51;
          v44 = v0;
          v45 = v52;
          break;
          ;
        }
        int v53 = 1;
        int v54 = v0 + v53;
        v10 = v44;
        break;
      }
    }
    uint v55 = simt_lane_id(__simt_tid);
    int v56 = (int)(v55);
    v6 = v10;
  } else {
    int v57 = 0;
    bool v58 = v2 != v57;
    int v59;
    if (v58) {
      int v60 = 0;
      int v61 = v0 + v60;
      v59 = v61;
    } else {
      int v62 = 2;
      int v63 = v3 % v62;
      uint v64 = simt_subgroup_id(__simt_tid);
      int v65 = (int)(v64);
      int v66;
      v66 = v65;
      switch (v63) {
        default:
          {
          v66 = v0;
          break;
        }
        case 0:
          {
          v66 = v0;
          break;
        }
      }
      uint v67 = simt_subgroup_id(__simt_tid);
      int v68 = (int)(v67);
      v59 = v66;
    }
    uint v69 = simt_subgroup_id(__simt_tid);
    int v70 = (int)(v69);
    v6 = v59;
  }
  bool v71 = true;
  int v72 = simt_wave_count_bits(v71);
  int v73 = 0;
  int v74 = v73 + v0;
  v1[v74] = v72;
  return;
}

kernel void kernel_main(device int* v75 [[buffer(0)]], device int* v76 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v77 = static_cast<int>(__simt_tid3.x);
  int v78 = 0;
  int v79 = v78 + v77;
  int v80 = v76[v79];
  int v81 = 4;
  int v82 = v81 + v77;
  int v83 = v76[v82];
  helper0(v77, v75, v80, v83, static_cast<int>(__simt_tid3.x));
  int v84 = 8;
  int v85 = v84 + v77;
  int v86 = v76[v85];
  uint v87 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v88 = (int)(v87);
  int v89;
  v89 = v88;
  switch (v86) {
    default:
      {
      int v90 = 0;
      int v91 = 0;
      int v92;
      int v93;
      v92 = v90;
      v93 = v91;
      while (true) {
        int v94 = 4;
        int v95 = v93 * v94;
        int v96 = v95 + v77;
        int v97 = 12;
        int v98 = v97 + v96;
        int v99 = v76[v98];
        int v100 = 0;
        bool v101 = v99 != v100;
        v92 = v92;
        v93 = v93;
        if (!v101) break;
        int v102 = v92 + v93;
        int v103 = 1;
        int v104 = v93 + v103;
        v92 = v102;
        v93 = v104;
      }
      bool v105 = true;
      v89 = v92;
      break;
    }
    case 0:
      {
      int v106 = 32;
      int v107 = v106 + v77;
      int v108 = v76[v107];
      int v109 = 2;
      int v110;
      v110 = v109;
      switch (v108) {
        case 0:
          {
          int v111 = 36;
          int v112 = v111 + v77;
          int v113 = v76[v112];
          int v114;
          v114 = v77;
          switch (v113) {
            case 0:
              {
              v114 = v77;
              break;
            }
            default:
              {
              int v115 = 2;
              v114 = v115;
              break;
            }
          }
          bool v116 = true;
          v110 = v114;
          break;
        }
        default:
          {
          v110 = v77;
          break;
        }
        case 1:
          {
          int v117 = 40;
          int v118 = v117 + v77;
          int v119 = v76[v118];
          int v120 = 0;
          bool v121 = v119 != v120;
          int v122;
          if (v121) {
            int v123 = 3;
            int v124 = v77 + v123;
            v122 = v124;
          } else {
            v122 = v77;
          }
          v110 = v122;
          break;
        }
      }
      bool v125 = true;
      v89 = v110;
      break;
    }
    case 1:
      {
      int v126 = 44;
      int v127 = v126 + v77;
      int v128 = v76[v127];
      int v129 = 1;
      int v130 = v77 + v129;
      int v131;
      v131 = v130;
      switch (v128) {
        default:
          {
          int v132 = 0;
          int v133 = 0;
          int v134;
          int v135;
          v134 = v132;
          v135 = v133;
          while (true) {
            int v136 = 4;
            int v137 = v135 * v136;
            int v138 = v137 + v77;
            int v139 = 48;
            int v140 = v139 + v138;
            int v141 = v76[v140];
            int v142 = 0;
            bool v143 = v141 != v142;
            v134 = v134;
            v135 = v135;
            if (!v143) break;
            int v144 = v134 + v135;
            int v145 = 1;
            int v146 = v135 + v145;
            v134 = v144;
            v135 = v146;
            break;
            ;
          }
          bool v147 = true;
          v131 = v134;
        }
        case 0:
          {
          int v148 = 68;
          int v149 = v148 + v77;
          int v150 = v76[v149];
          int v151 = 0;
          bool v152 = v150 != v151;
          int v153;
          if (v152) {
            int v154 = 1;
            v153 = v154;
          } else {
            int v155 = 2;
            v153 = v155;
          }
          v131 = v153;
          break;
        }
        case 1:
          {
          int v156 = 72;
          int v157 = v156 + v77;
          int v158 = v76[v157];
          int v159 = 2;
          int v160;
          v160 = v159;
          switch (v158) {
            case 0:
              {
              int v161 = 2;
              int v162 = v77 + v161;
              v160 = v162;
              break;
            }
            case 1:
              {
              int v163 = 3;
              v160 = v163;
              break;
            }
            default:
              {
              v160 = v77;
              break;
            }
          }
          bool v164 = true;
          v131 = v160;
          break;
        }
      }
      bool v165 = true;
      v89 = v131;
      break;
    }
    case 2:
      {
      v89 = v77;
      break;
    }
  }
  bool v166 = true;
  int v167 = 16;
  int v168 = v167 + v77;
  bool v169 = true;
  int v170 = simt_wave_count_bits(v169);
  v75[v168] = v170;
  int v171 = 76;
  int v172 = v171 + v77;
  int v173 = v76[v172];
  int v174 = 2;
  int v175 = v77 + v174;
  int v176;
  v176 = v175;
  switch (v173) {
    case 0:
      {
      int v177 = 0;
      int v178 = 0;
      int v179;
      int v180;
      v179 = v177;
      v180 = v178;
      while (true) {
        int v181 = 4;
        int v182 = v180 * v181;
        int v183 = v182 + v77;
        int v184 = 80;
        int v185 = v184 + v183;
        int v186 = v76[v185];
        int v187 = 0;
        bool v188 = v186 != v187;
        v179 = v179;
        v180 = v180;
        if (!v188) break;
        int v189 = 100;
        int v190 = v189 + v77;
        int v191 = v76[v190];
        int v192 = 0;
        bool v193 = v191 != v192;
        int v194;
        if (v193) {
          int v195 = 1;
          v194 = v195;
        } else {
          int v196 = 3;
          int v197 = v77 + v196;
          v194 = v197;
        }
        int v198 = v179 + v194;
        int v199 = 1;
        int v200 = v180 + v199;
        v179 = v198;
        v180 = v200;
        break;
        ;
      }
      bool v201 = true;
      v176 = v179;
      break;
    }
    default:
      {
      int v202 = 104;
      int v203 = v202 + v77;
      int v204 = v76[v203];
      int v205 = 2;
      int v206;
      v206 = v205;
      switch (v204) {
        default:
          {
          int v207 = 108;
          int v208 = v207 + v77;
          int v209 = v76[v208];
          int v210 = 0;
          bool v211 = v209 != v210;
          int v212;
          if (v211) {
            v212 = v77;
          } else {
            int v213 = 3;
            v212 = v213;
          }
          v206 = v212;
        }
        case 0:
          {
          int v214 = 112;
          int v215 = v214 + v77;
          int v216 = v76[v215];
          int v217;
          v217 = v77;
          switch (v216) {
            default:
              {
              int v218 = 1;
              v217 = v218;
              break;
            }
            case 0:
              {
              int v219 = 0;
              v217 = v219;
              break;
            }
            case 1:
              {
              int v220 = 1;
              int v221 = v77 + v220;
              v217 = v221;
              break;
            }
            case 2:
              {
              v217 = v77;
              break;
            }
          }
          bool v222 = true;
          v206 = v217;
          break;
        }
      }
      bool v223 = true;
      v176 = v206;
      break;
    }
  }
  bool v224 = true;
  int v225 = 32;
  int v226 = v225 + v77;
  bool v227 = true;
  int v228 = simt_wave_count_bits(v227);
  v75[v226] = v228;
  int v229 = 116;
  int v230 = v229 + v77;
  int v231 = v76[v230];
  int v232 = 0;
  bool v233 = v231 != v232;
  int v234;
  if (v233) {
    int v235 = 120;
    int v236 = v235 + v77;
    int v237 = v76[v236];
    int v238;
    v238 = v77;
    switch (v237) {
      case 0:
        {
        int v239 = 124;
        int v240 = v239 + v77;
        int v241 = v76[v240];
        int v242 = 0;
        bool v243 = v241 != v242;
        int v244;
        if (v243) {
          v244 = v77;
        } else {
          int v245 = 2;
          int v246 = v77 + v245;
          v244 = v246;
        }
        v238 = v244;
      }
      default:
        {
        int v247 = 0;
        int v248 = 0;
        int v249;
        int v250;
        v249 = v247;
        v250 = v248;
        while (true) {
          int v251 = 4;
          int v252 = v250 * v251;
          int v253 = v252 + v77;
          int v254 = 128;
          int v255 = v254 + v253;
          int v256 = v76[v255];
          int v257 = 0;
          bool v258 = v256 != v257;
          v249 = v249;
          v250 = v250;
          if (!v258) break;
          int v259 = v249 + v250;
          int v260 = 1;
          int v261 = v250 + v260;
          v249 = v259;
          v250 = v261;
        }
        bool v262 = true;
        v238 = v249;
        break;
      }
    }
    bool v263 = true;
    v234 = v238;
  } else {
    int v264 = 148;
    int v265 = v264 + v77;
    int v266 = v76[v265];
    uint v267 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v268 = (int)(v267);
    int v269;
    v269 = v268;
    switch (v266) {
      case 0:
        {
        int v270 = 0;
        int v271 = 0;
        int v272;
        int v273;
        v272 = v270;
        v273 = v271;
        while (true) {
          int v274 = 4;
          int v275 = v273 * v274;
          int v276 = v275 + v77;
          int v277 = 152;
          int v278 = v277 + v276;
          int v279 = v76[v278];
          int v280 = 0;
          bool v281 = v279 != v280;
          v272 = v272;
          v273 = v273;
          if (!v281) break;
          int v282 = v272 + v273;
          int v283 = 1;
          int v284 = v273 + v283;
          v272 = v282;
          v273 = v284;
          break;
          ;
        }
        bool v285 = true;
        v269 = v272;
        break;
      }
      default:
        {
        int v286 = 172;
        int v287 = v286 + v77;
        int v288 = v76[v287];
        int v289 = 2;
        int v290 = v77 + v289;
        int v291;
        v291 = v290;
        switch (v288) {
          default:
            {
            int v292 = 2;
            int v293 = v77 + v292;
            v291 = v293;
            break;
          }
          case 0:
            {
            int v294 = 0;
            v291 = v294;
            break;
          }
        }
        bool v295 = true;
        v269 = v291;
        break;
      }
      case 1:
        {
        int v296 = 4;
        v269 = v296;
        break;
      }
    }
    bool v297 = true;
    v234 = v269;
  }
  int v298 = 48;
  int v299 = v298 + v77;
  bool v300 = true;
  int v301 = simt_wave_count_bits(v300);
  v75[v299] = v301;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 176; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
