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
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 4;
      int v10 = v3 % v9;
      int v11 = 1;
      int v12 = v0 + v11;
      int v13;
      v13 = v12;
      switch (v10) {
        case 0:
          {
          int v14 = 3;
          int v15 = v3 % v14;
          int v16 = 2;
          int v17;
          v17 = v16;
          switch (v15) {
            case 0:
              {
              int v18 = 4;
              int v19 = v0 + v18;
              v17 = v19;
            }
            case 1:
              {
              int v20 = 4;
              v17 = v20;
              break;
            }
            default:
              {
              v17 = v0;
              break;
            }
          }
          v13 = v17;
          break;
        }
        case 1:
          {
          int v21 = 0;
          int v22 = 0;
          int v23;
          int v24;
          v23 = v21;
          v24 = v22;
          while (true) {
            int v25 = 4;
            int v26 = v3 % v25;
            int v27 = 1;
            int v28 = v26 + v27;
            bool v29 = v24 < v28;
            v23 = v23;
            v24 = v24;
            if (!v29) break;
            int v30 = 1;
            int v31 = 1;
            int v32 = v24 + v31;
            v23 = v30;
            v24 = v32;
          }
          int v33 = 4;
          int v34 = v0 + v33;
          v13 = v23;
          break;
        }
        default:
          {
          int v35 = 0;
          bool v36 = v2 != v35;
          int v37;
          if (v36) {
            int v38 = 3;
            int v39 = v0 + v38;
            v37 = v39;
          } else {
            int v40 = 3;
            int v41 = v0 + v40;
            v37 = v41;
          }
          int v42 = 4;
          v13 = v37;
          break;
        }
        case 2:
          {
          int v43 = 2;
          int v44 = v3 % v43;
          int v45 = 0;
          int v46;
          v46 = v45;
          switch (v44) {
            default:
              {
              v46 = v0;
            }
            case 0:
              {
              int v47 = 4;
              v46 = v47;
              break;
            }
            case 1:
              {
              int v48 = 2;
              int v49 = v0 + v48;
              v46 = v49;
              break;
            }
          }
          v13 = v46;
          break;
        }
      }
      v8 = v13;
    }
    case 0:
      {
      v8 = v0;
      break;
    }
    case 1:
      {
      int v50 = 3;
      int v51 = v3 % v50;
      int v52;
      v52 = v0;
      switch (v51) {
        case 0:
          {
          int v53 = 0;
          bool v54 = v2 != v53;
          int v55;
          if (v54) {
            v55 = v0;
          } else {
            int v56 = 1;
            int v57 = v0 + v56;
            v55 = v57;
          }
          int v58 = 1;
          int v59 = v0 + v58;
          v52 = v55;
          break;
        }
        default:
          {
          int v60 = 0;
          int v61 = 0;
          int v62;
          int v63;
          v62 = v60;
          v63 = v61;
          while (true) {
            int v64 = 4;
            int v65 = v3 % v64;
            int v66 = 1;
            int v67 = v65 + v66;
            bool v68 = v63 < v67;
            v62 = v62;
            v63 = v63;
            if (!v68) break;
            int v69 = 2;
            int v70 = v0 + v69;
            int v71 = 1;
            int v72 = v63 + v71;
            v62 = v70;
            v63 = v72;
          }
          v52 = v62;
          break;
        }
        case 1:
          {
          int v73 = 0;
          bool v74 = v2 != v73;
          int v75;
          if (v74) {
            int v76 = 0;
            v75 = v76;
          } else {
            int v77 = 4;
            int v78 = v0 + v77;
            v75 = v78;
          }
          v52 = v75;
          break;
        }
      }
      int v79 = 3;
      int v80 = v0 + v79;
      v8 = v52;
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
  int v97;
  v97 = v87;
  switch (v96) {
    case 0:
      {
      int v98 = 0;
      int v99 = 0;
      int v100;
      int v101;
      v100 = v98;
      v101 = v99;
      while (true) {
        int v102 = 4;
        int v103 = v101 * v102;
        int v104 = v103 + v87;
        int v105 = 12;
        int v106 = v105 + v104;
        int v107 = v86[v106];
        int v108 = 0;
        bool v109 = v107 != v108;
        v100 = v100;
        v101 = v101;
        if (!v109) break;
        int v110 = 32;
        int v111 = v110 + v87;
        int v112 = v86[v111];
        int v113 = 0;
        int v114 = v87 + v113;
        int v115;
        v115 = v114;
        switch (v112) {
          default:
            {
            int v116 = 2;
            v115 = v116;
            break;
          }
          case 0:
            {
            int v117 = 4;
            int v118 = v87 + v117;
            v115 = v118;
            break;
          }
          case 1:
            {
            v115 = v87;
            break;
          }
        }
        bool v119 = true;
        int v120 = v100 + v115;
        int v121 = 1;
        int v122 = v101 + v121;
        v100 = v120;
        v101 = v122;
      }
      bool v123 = true;
      v97 = v100;
      break;
    }
    case 1:
      {
      int v124 = 36;
      int v125 = v124 + v87;
      int v126 = v86[v125];
      int v127 = 3;
      int v128;
      v128 = v127;
      switch (v126) {
        default:
          {
          int v129 = 40;
          int v130 = v129 + v87;
          int v131 = v86[v130];
          int v132 = 0;
          bool v133 = v131 != v132;
          int v134;
          if (v133) {
            int v135 = 1;
            v134 = v135;
          } else {
            int v136 = 1;
            v134 = v136;
          }
          v128 = v134;
          break;
        }
        case 0:
          {
          int v137 = 1;
          int v138 = v87 + v137;
          v128 = v138;
          break;
        }
        case 1:
          {
          int v139 = 44;
          int v140 = v139 + v87;
          int v141 = v86[v140];
          int v142 = 3;
          int v143;
          v143 = v142;
          switch (v141) {
            case 0:
              {
              int v144 = 2;
              int v145 = v87 + v144;
              v143 = v145;
              break;
            }
            case 1:
              {
              int v146 = 4;
              v143 = v146;
              break;
            }
            default:
              {
              int v147 = 3;
              v143 = v147;
              break;
            }
          }
          bool v148 = true;
          v128 = v143;
          break;
        }
      }
      bool v149 = true;
      v97 = v128;
      break;
    }
    case 2:
      {
      v97 = v87;
      break;
    }
    default:
      {
      int v150 = 48;
      int v151 = v150 + v87;
      int v152 = v86[v151];
      int v153 = 4;
      int v154 = v87 + v153;
      int v155;
      v155 = v154;
      switch (v152) {
        case 0:
          {
          int v156 = 52;
          int v157 = v156 + v87;
          int v158 = v86[v157];
          int v159 = 0;
          bool v160 = v158 != v159;
          int v161;
          if (v160) {
            int v162 = 1;
            v161 = v162;
          } else {
            int v163 = 4;
            v161 = v163;
          }
          v155 = v161;
        }
        case 1:
          {
          int v164 = 3;
          int v165 = v87 + v164;
          v155 = v165;
          break;
        }
        case 2:
          {
          int v166 = 56;
          int v167 = v166 + v87;
          int v168 = v86[v167];
          int v169 = 0;
          bool v170 = v168 != v169;
          int v171;
          if (v170) {
            int v172 = 1;
            v171 = v172;
          } else {
            int v173 = 3;
            v171 = v173;
          }
          v155 = v171;
        }
        default:
          {
          int v174 = 60;
          int v175 = v174 + v87;
          int v176 = v86[v175];
          int v177 = 0;
          bool v178 = v176 != v177;
          int v179;
          if (v178) {
            v179 = v87;
          } else {
            int v180 = 4;
            int v181 = v87 + v180;
            v179 = v181;
          }
          v155 = v179;
          break;
        }
      }
      bool v182 = true;
      v97 = v155;
      break;
    }
  }
  bool v183 = true;
  int v184 = 16;
  int v185 = v184 + v87;
  bool v186 = true;
  int v187 = simt_wave_count_bits(v186);
  v85[v185] = v187;
  int v188 = 64;
  int v189 = v188 + v87;
  int v190 = v86[v189];
  int v191 = 4;
  int v192 = v87 + v191;
  int v193;
  v193 = v192;
  switch (v190) {
    case 0:
      {
      int v194 = 68;
      int v195 = v194 + v87;
      int v196 = v86[v195];
      int v197 = 4;
      int v198;
      v198 = v197;
      switch (v196) {
        case 0:
          {
          int v199 = 0;
          int v200 = 0;
          int v201;
          int v202;
          v201 = v199;
          v202 = v200;
          while (true) {
            int v203 = 4;
            int v204 = v202 * v203;
            int v205 = v204 + v87;
            int v206 = 72;
            int v207 = v206 + v205;
            int v208 = v86[v207];
            int v209 = 0;
            bool v210 = v208 != v209;
            v201 = v201;
            v202 = v202;
            if (!v210) break;
            int v211 = v201 + v202;
            int v212 = 1;
            int v213 = v202 + v212;
            v201 = v211;
            v202 = v213;
          }
          bool v214 = true;
          v198 = v201;
          break;
        }
        default:
          {
          int v215 = 92;
          int v216 = v215 + v87;
          int v217 = v86[v216];
          int v218 = 0;
          bool v219 = v217 != v218;
          int v220;
          if (v219) {
            v220 = v87;
          } else {
            int v221 = 3;
            v220 = v221;
          }
          v198 = v220;
          break;
        }
        case 1:
          {
          v198 = v87;
          break;
        }
        case 2:
          {
          int v222 = 0;
          int v223 = v87 + v222;
          v198 = v223;
          break;
        }
      }
      bool v224 = true;
      v193 = v198;
      break;
    }
    default:
      {
      int v225 = 4;
      v193 = v225;
      break;
    }
    case 1:
      {
      int v226 = 96;
      int v227 = v226 + v87;
      int v228 = v86[v227];
      int v229 = 0;
      bool v230 = v228 != v229;
      int v231;
      if (v230) {
        int v232 = 2;
        v231 = v232;
      } else {
        int v233 = 100;
        int v234 = v233 + v87;
        int v235 = v86[v234];
        int v236 = 3;
        int v237 = v87 + v236;
        int v238;
        v238 = v237;
        switch (v235) {
          case 0:
            {
            int v239 = 4;
            int v240 = v87 + v239;
            v238 = v240;
          }
          case 1:
            {
            int v241 = 4;
            int v242 = v87 + v241;
            v238 = v242;
          }
          default:
            {
            v238 = v87;
            break;
          }
        }
        bool v243 = true;
        v231 = v238;
      }
      v193 = v231;
      break;
    }
    case 2:
      {
      int v244 = 1;
      v193 = v244;
      break;
    }
  }
  bool v245 = true;
  int v246 = 32;
  int v247 = v246 + v87;
  bool v248 = true;
  int v249 = simt_wave_count_bits(v248);
  v85[v247] = v249;
  int v250 = 104;
  int v251 = v250 + v87;
  int v252 = v86[v251];
  int v253 = 2;
  int v254;
  v254 = v253;
  switch (v252) {
    case 0:
      {
      int v255 = 108;
      int v256 = v255 + v87;
      int v257 = v86[v256];
      int v258 = 0;
      bool v259 = v257 != v258;
      int v260;
      if (v259) {
        int v261 = 112;
        int v262 = v261 + v87;
        int v263 = v86[v262];
        int v264 = 0;
        bool v265 = v263 != v264;
        int v266;
        if (v265) {
          int v267 = 2;
          int v268 = v87 + v267;
          v266 = v268;
        } else {
          v266 = v87;
        }
        v260 = v266;
      } else {
        int v269 = 0;
        int v270 = 0;
        int v271;
        int v272;
        v271 = v269;
        v272 = v270;
        while (true) {
          int v273 = 4;
          int v274 = v272 * v273;
          int v275 = v274 + v87;
          int v276 = 116;
          int v277 = v276 + v275;
          int v278 = v86[v277];
          int v279 = 0;
          bool v280 = v278 != v279;
          v271 = v271;
          v272 = v272;
          if (!v280) break;
          int v281 = v271 + v272;
          int v282 = 1;
          int v283 = v272 + v282;
          v271 = v281;
          v272 = v283;
          break;
          ;
        }
        bool v284 = true;
        v260 = v271;
      }
      v254 = v260;
      break;
    }
    default:
      {
      int v285 = 3;
      v254 = v285;
      break;
    }
    case 1:
      {
      int v286 = 4;
      v254 = v286;
      break;
    }
    case 2:
      {
      int v287 = 136;
      int v288 = v287 + v87;
      int v289 = v86[v288];
      int v290 = 0;
      bool v291 = v289 != v290;
      int v292;
      if (v291) {
        int v293 = 140;
        int v294 = v293 + v87;
        int v295 = v86[v294];
        int v296 = 0;
        bool v297 = v295 != v296;
        int v298;
        if (v297) {
          v298 = v87;
        } else {
          int v299 = 3;
          v298 = v299;
        }
        v292 = v298;
      } else {
        int v300 = 144;
        int v301 = v300 + v87;
        int v302 = v86[v301];
        int v303 = 3;
        int v304;
        v304 = v303;
        switch (v302) {
          default:
            {
            int v305 = 0;
            int v306 = v87 + v305;
            v304 = v306;
            break;
          }
          case 0:
            {
            int v307 = 4;
            int v308 = v87 + v307;
            v304 = v308;
            break;
          }
        }
        bool v309 = true;
        v292 = v304;
      }
      v254 = v292;
      break;
    }
  }
  bool v310 = true;
  int v311 = 48;
  int v312 = v311 + v87;
  bool v313 = true;
  int v314 = simt_wave_count_bits(v313);
  v85[v312] = v314;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 148; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
