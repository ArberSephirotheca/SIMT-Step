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
    default:
      {
      int v9 = 0;
      bool v10 = v2 != v9;
      int v11;
      if (v10) {
        int v12 = 0;
        int v13 = 0;
        int v14;
        int v15;
        v14 = v12;
        v15 = v13;
        while (true) {
          int v16 = 4;
          int v17 = v3 % v16;
          int v18 = 1;
          int v19 = v17 + v18;
          bool v20 = v15 < v19;
          v14 = v14;
          v15 = v15;
          if (!v20) break;
          int v21 = 1;
          int v22 = 1;
          int v23 = v15 + v22;
          v14 = v21;
          v15 = v23;
        }
        int v24 = 0;
        v11 = v14;
      } else {
        int v25 = 4;
        int v26 = v3 % v25;
        int v27;
        v27 = v0;
        switch (v26) {
          default:
            {
            int v28 = 2;
            int v29 = v0 + v28;
            v27 = v29;
            break;
          }
          case 0:
            {
            v27 = v0;
            break;
          }
          case 1:
            {
            int v30 = 0;
            v27 = v30;
            break;
          }
          case 2:
            {
            v27 = v0;
            break;
          }
        }
        int v31 = 4;
        int v32 = v0 + v31;
        v11 = v27;
      }
      v8 = v11;
      break;
    }
    case 0:
      {
      int v33 = 0;
      bool v34 = v2 != v33;
      int v35;
      if (v34) {
        int v36 = 0;
        bool v37 = v2 != v36;
        int v38;
        if (v37) {
          v38 = v0;
        } else {
          int v39 = 3;
          int v40 = v0 + v39;
          v38 = v40;
        }
        v35 = v38;
      } else {
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
          int v51 = v0 + v50;
          int v52 = 1;
          int v53 = v44 + v52;
          v43 = v51;
          v44 = v53;
        }
        v35 = v43;
      }
      int v54 = 1;
      int v55 = v0 + v54;
      v8 = v35;
      break;
    }
  }
  bool v56 = true;
  int v57 = simt_wave_count_bits(v56);
  int v58 = 0;
  int v59 = v58 + v0;
  v1[v59] = v57;
  return;
}

kernel void kernel_main(device int* v60 [[buffer(0)]], device int* v61 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v62 = static_cast<int>(__simt_tid3.x);
  int v63 = 0;
  int v64 = v63 + v62;
  int v65 = v61[v64];
  int v66 = 4;
  int v67 = v66 + v62;
  int v68 = v61[v67];
  helper0(v62, v60, v65, v68, static_cast<int>(__simt_tid3.x));
  int v69 = 8;
  int v70 = v69 + v62;
  int v71 = v61[v70];
  int v72 = 3;
  int v73;
  v73 = v72;
  switch (v71) {
    case 0:
      {
      int v74 = 12;
      int v75 = v74 + v62;
      int v76 = v61[v75];
      int v77 = 0;
      bool v78 = v76 != v77;
      int v79;
      if (v78) {
        int v80 = 16;
        int v81 = v80 + v62;
        int v82 = v61[v81];
        int v83 = 4;
        int v84 = v62 + v83;
        int v85;
        v85 = v84;
        switch (v82) {
          default:
            {
            int v86 = 4;
            v85 = v86;
          }
          case 0:
            {
            int v87 = 3;
            int v88 = v62 + v87;
            v85 = v88;
            break;
          }
          case 1:
            {
            v85 = v62;
            break;
          }
          case 2:
            {
            v85 = v62;
            break;
          }
        }
        bool v89 = true;
        v79 = v85;
      } else {
        int v90 = 1;
        v79 = v90;
      }
      v73 = v79;
      break;
    }
    case 1:
      {
      int v91 = 0;
      int v92 = 0;
      int v93;
      int v94;
      v93 = v91;
      v94 = v92;
      while (true) {
        int v95 = 4;
        int v96 = v94 * v95;
        int v97 = v96 + v62;
        int v98 = 20;
        int v99 = v98 + v97;
        int v100 = v61[v99];
        int v101 = 0;
        bool v102 = v100 != v101;
        v93 = v93;
        v94 = v94;
        if (!v102) break;
        int v103 = 0;
        int v104 = 0;
        int v105;
        int v106;
        v105 = v103;
        v106 = v104;
        while (true) {
          int v107 = 4;
          int v108 = v106 * v107;
          int v109 = v108 + v62;
          int v110 = 40;
          int v111 = v110 + v109;
          int v112 = v61[v111];
          int v113 = 0;
          bool v114 = v112 != v113;
          v105 = v105;
          v106 = v106;
          if (!v114) break;
          int v115 = v105 + v106;
          int v116 = 1;
          int v117 = v106 + v116;
          v105 = v115;
          v106 = v117;
          continue;
          ;
        }
        bool v118 = true;
        int v119 = v93 + v105;
        int v120 = 1;
        int v121 = v94 + v120;
        v93 = v119;
        v94 = v121;
      }
      bool v122 = true;
      v73 = v93;
      break;
    }
    case 2:
      {
      int v123 = 0;
      int v124 = 0;
      int v125;
      int v126;
      v125 = v123;
      v126 = v124;
      while (true) {
        int v127 = 4;
        int v128 = v126 * v127;
        int v129 = v128 + v62;
        int v130 = 60;
        int v131 = v130 + v129;
        int v132 = v61[v131];
        int v133 = 0;
        bool v134 = v132 != v133;
        v125 = v125;
        v126 = v126;
        if (!v134) break;
        int v135 = 80;
        int v136 = v135 + v62;
        int v137 = v61[v136];
        int v138;
        v138 = v62;
        switch (v137) {
          case 0:
            {
            int v139 = 1;
            v138 = v139;
          }
          default:
            {
            int v140 = 4;
            int v141 = v62 + v140;
            v138 = v141;
            break;
          }
          case 1:
            {
            int v142 = 0;
            int v143 = v62 + v142;
            v138 = v143;
          }
          case 2:
            {
            int v144 = 4;
            v138 = v144;
            break;
          }
        }
        bool v145 = true;
        int v146 = v125 + v138;
        int v147 = 1;
        int v148 = v126 + v147;
        v125 = v146;
        v126 = v148;
        continue;
        ;
      }
      bool v149 = true;
      v73 = v125;
      break;
    }
    default:
      {
      int v150 = 84;
      int v151 = v150 + v62;
      int v152 = v61[v151];
      int v153 = 0;
      bool v154 = v152 != v153;
      int v155;
      if (v154) {
        int v156 = 88;
        int v157 = v156 + v62;
        int v158 = v61[v157];
        int v159 = 0;
        int v160;
        v160 = v159;
        switch (v158) {
          default:
            {
            v160 = v62;
            break;
          }
          case 0:
            {
            int v161 = 0;
            v160 = v161;
            break;
          }
        }
        bool v162 = true;
        v155 = v160;
      } else {
        int v163 = 0;
        int v164 = v62 + v163;
        v155 = v164;
      }
      v73 = v155;
      break;
    }
  }
  bool v165 = true;
  int v166 = 16;
  int v167 = v166 + v62;
  bool v168 = true;
  int v169 = simt_wave_count_bits(v168);
  v60[v167] = v169;
  int v170 = 92;
  int v171 = v170 + v62;
  int v172 = v61[v171];
  uint v173 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v174 = (int)(v173);
  int v175;
  v175 = v174;
  switch (v172) {
    default:
      {
      int v176 = 96;
      int v177 = v176 + v62;
      int v178 = v61[v177];
      int v179 = 0;
      int v180;
      v180 = v179;
      switch (v178) {
        default:
          {
          int v181 = 100;
          int v182 = v181 + v62;
          int v183 = v61[v182];
          int v184 = 0;
          bool v185 = v183 != v184;
          int v186;
          if (v185) {
            v186 = v62;
          } else {
            int v187 = 2;
            v186 = v187;
          }
          v180 = v186;
          break;
        }
        case 0:
          {
          int v188 = 104;
          int v189 = v188 + v62;
          int v190 = v61[v189];
          int v191 = 0;
          int v192;
          v192 = v191;
          switch (v190) {
            case 0:
              {
              int v193 = 1;
              int v194 = v62 + v193;
              v192 = v194;
              break;
            }
            case 1:
              {
              v192 = v62;
              break;
            }
            default:
              {
              v192 = v62;
              break;
            }
            case 2:
              {
              int v195 = 3;
              v192 = v195;
              break;
            }
          }
          bool v196 = true;
          v180 = v192;
          break;
        }
        case 1:
          {
          int v197 = 0;
          int v198 = 0;
          int v199;
          int v200;
          v199 = v197;
          v200 = v198;
          while (true) {
            int v201 = 4;
            int v202 = v200 * v201;
            int v203 = v202 + v62;
            int v204 = 108;
            int v205 = v204 + v203;
            int v206 = v61[v205];
            int v207 = 0;
            bool v208 = v206 != v207;
            v199 = v199;
            v200 = v200;
            if (!v208) break;
            int v209 = v199 + v200;
            int v210 = 1;
            int v211 = v200 + v210;
            v199 = v209;
            v200 = v211;
          }
          bool v212 = true;
          v180 = v199;
          break;
        }
      }
      bool v213 = true;
      v175 = v180;
      break;
    }
    case 0:
      {
      int v214 = 128;
      int v215 = v214 + v62;
      int v216 = v61[v215];
      int v217;
      v217 = v62;
      switch (v216) {
        case 0:
          {
          v217 = v62;
        }
        case 1:
          {
          int v218 = 0;
          int v219 = 0;
          int v220;
          int v221;
          v220 = v218;
          v221 = v219;
          while (true) {
            int v222 = 4;
            int v223 = v221 * v222;
            int v224 = v223 + v62;
            int v225 = 132;
            int v226 = v225 + v224;
            int v227 = v61[v226];
            int v228 = 0;
            bool v229 = v227 != v228;
            v220 = v220;
            v221 = v221;
            if (!v229) break;
            int v230 = v220 + v221;
            int v231 = 1;
            int v232 = v221 + v231;
            v220 = v230;
            v221 = v232;
          }
          bool v233 = true;
          v217 = v220;
        }
        case 2:
          {
          int v234 = 152;
          int v235 = v234 + v62;
          int v236 = v61[v235];
          int v237 = 2;
          int v238;
          v238 = v237;
          switch (v236) {
            default:
              {
              v238 = v62;
              break;
            }
            case 0:
              {
              v238 = v62;
              break;
            }
          }
          bool v239 = true;
          v217 = v238;
          break;
        }
        default:
          {
          int v240 = 2;
          v217 = v240;
          break;
        }
      }
      bool v241 = true;
      v175 = v217;
      break;
    }
    case 1:
      {
      int v242 = 0;
      int v243 = 0;
      int v244;
      int v245;
      v244 = v242;
      v245 = v243;
      while (true) {
        int v246 = 4;
        int v247 = v245 * v246;
        int v248 = v247 + v62;
        int v249 = 156;
        int v250 = v249 + v248;
        int v251 = v61[v250];
        int v252 = 0;
        bool v253 = v251 != v252;
        v244 = v244;
        v245 = v245;
        if (!v253) break;
        int v254 = 4;
        int v255 = v244 + v254;
        int v256 = 1;
        int v257 = v245 + v256;
        v244 = v255;
        v245 = v257;
      }
      bool v258 = true;
      v175 = v244;
      break;
    }
    case 2:
      {
      int v259 = 0;
      int v260 = 0;
      int v261;
      int v262;
      v261 = v259;
      v262 = v260;
      while (true) {
        int v263 = 4;
        int v264 = v262 * v263;
        int v265 = v264 + v62;
        int v266 = 176;
        int v267 = v266 + v265;
        int v268 = v61[v267];
        int v269 = 0;
        bool v270 = v268 != v269;
        v261 = v261;
        v262 = v262;
        if (!v270) break;
        int v271 = 196;
        int v272 = v271 + v62;
        int v273 = v61[v272];
        int v274;
        v274 = v62;
        switch (v273) {
          default:
            {
            int v275 = 0;
            v274 = v275;
          }
          case 0:
            {
            int v276 = 3;
            int v277 = v62 + v276;
            v274 = v277;
          }
          case 1:
            {
            int v278 = 1;
            v274 = v278;
            break;
          }
        }
        bool v279 = true;
        int v280 = v261 + v274;
        int v281 = 1;
        int v282 = v262 + v281;
        v261 = v280;
        v262 = v282;
        continue;
        ;
      }
      bool v283 = true;
      v175 = v261;
      break;
    }
  }
  bool v284 = true;
  int v285 = 32;
  int v286 = v285 + v62;
  bool v287 = true;
  int v288 = simt_wave_count_bits(v287);
  v60[v286] = v288;
  int v289 = 0;
  int v290 = 0;
  int v291;
  int v292;
  v291 = v289;
  v292 = v290;
  while (true) {
    int v293 = 4;
    int v294 = v292 * v293;
    int v295 = v294 + v62;
    int v296 = 200;
    int v297 = v296 + v295;
    int v298 = v61[v297];
    int v299 = 0;
    bool v300 = v298 != v299;
    v291 = v291;
    v292 = v292;
    if (!v300) break;
    int v301 = 0;
    int v302 = v291 + v301;
    int v303 = 1;
    int v304 = v292 + v303;
    v291 = v302;
    v292 = v304;
  }
  bool v305 = true;
  int v306 = 48;
  int v307 = v306 + v62;
  bool v308 = true;
  int v309 = simt_wave_count_bits(v308);
  v60[v307] = v309;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 220; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
