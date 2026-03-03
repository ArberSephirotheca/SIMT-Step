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
  int v8 = 2;
  int v9 = v3 % v8;
  int v10 = 2;
  int v11;
  v11 = v10;
  switch (v9) {
    case 0:
      {
      int v12 = 4;
      int v13 = v3 % v12;
      int v14;
      v14 = v0;
      switch (v13) {
        case 0:
          {
          int v15 = 2;
          int v16 = v3 % v15;
          int v17 = 1;
          int v18 = v0 + v17;
          int v19;
          v19 = v18;
          switch (v16) {
            case 0:
              {
              int v20 = 0;
              int v21 = v0 + v20;
              v19 = v21;
              break;
            }
            default:
              {
              v19 = v0;
              break;
            }
          }
          v14 = v19;
          break;
        }
        case 1:
          {
          v14 = v0;
          break;
        }
        case 2:
          {
          int v22 = 0;
          int v23 = 0;
          int v24;
          int v25;
          v24 = v22;
          v25 = v23;
          while (true) {
            int v26 = 4;
            int v27 = v3 % v26;
            int v28 = 1;
            int v29 = v27 + v28;
            bool v30 = v25 < v29;
            v24 = v24;
            v25 = v25;
            if (!v30) break;
            int v31 = 1;
            int v32 = v0 + v31;
            int v33 = 1;
            int v34 = v25 + v33;
            v24 = v32;
            v25 = v34;
            break;
            ;
          }
          v14 = v24;
          break;
        }
        default:
          {
          int v35;
          v35 = v0;
          switch (v3) {
            case 0:
              {
              v35 = v0;
              break;
            }
            default:
              {
              int v36 = 2;
              int v37 = v0 + v36;
              v35 = v37;
              break;
            }
          }
          v14 = v35;
          break;
        }
      }
      v11 = v14;
      break;
    }
    case 1:
      {
      int v38 = 0;
      bool v39 = v2 != v38;
      int v40;
      if (v39) {
        int v41 = 2;
        int v42 = v3 % v41;
        int v43 = 2;
        int v44 = v0 + v43;
        int v45;
        v45 = v44;
        switch (v42) {
          default:
            {
            int v46 = 0;
            int v47 = v0 + v46;
            v45 = v47;
          }
          case 0:
            {
            int v48 = 3;
            v45 = v48;
            break;
          }
          case 1:
            {
            int v49 = 3;
            v45 = v49;
            break;
          }
        }
        v40 = v45;
      } else {
        int v50 = 4;
        int v51 = v3 % v50;
        int v52;
        v52 = v0;
        switch (v51) {
          default:
            {
            int v53 = 2;
            v52 = v53;
            break;
          }
          case 0:
            {
            int v54 = 1;
            int v55 = v0 + v54;
            v52 = v55;
          }
          case 1:
            {
            int v56 = 0;
            int v57 = v0 + v56;
            v52 = v57;
            break;
          }
          case 2:
            {
            int v58 = 0;
            int v59 = v0 + v58;
            v52 = v59;
            break;
          }
        }
        v40 = v52;
      }
      v11 = v40;
      break;
    }
    default:
      {
      int v60 = 0;
      bool v61 = v2 != v60;
      int v62;
      if (v61) {
        int v63 = 4;
        int v64 = v3 % v63;
        int v65 = 0;
        int v66 = v0 + v65;
        int v67;
        v67 = v66;
        switch (v64) {
          case 0:
            {
            int v68 = 2;
            v67 = v68;
            break;
          }
          case 1:
            {
            v67 = v0;
            break;
          }
          case 2:
            {
            v67 = v0;
            break;
          }
          default:
            {
            int v69 = 4;
            int v70 = v0 + v69;
            v67 = v70;
            break;
          }
        }
        v62 = v67;
      } else {
        int v71 = 0;
        int v72 = 0;
        int v73;
        int v74;
        v73 = v71;
        v74 = v72;
        while (true) {
          int v75 = 4;
          int v76 = v3 % v75;
          int v77 = 1;
          int v78 = v76 + v77;
          bool v79 = v74 < v78;
          v73 = v73;
          v74 = v74;
          if (!v79) break;
          int v80 = 1;
          int v81 = v0 + v80;
          int v82 = 1;
          int v83 = v74 + v82;
          v73 = v81;
          v74 = v83;
        }
        v62 = v73;
      }
      v11 = v62;
      break;
    }
  }
  int v84 = 0;
  bool v85 = v2 != v84;
  int v86 = v85 ? v5 : v11;
  return;
}

kernel void kernel_main(device int* v87 [[buffer(0)]], device int* v88 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v89 = static_cast<int>(__simt_tid3.x);
  int v90 = 0;
  int v91 = v90 + v89;
  int v92 = v88[v91];
  int v93 = 4;
  int v94 = v93 + v89;
  int v95 = v88[v94];
  int v96 = 0;
  bool v97 = v92 != v96;
  if (v97) {
  } else {
    int v98 = 8;
    int v99 = v98 + v89;
    int v100 = v88[v99];
    int v101 = 0;
    bool v102 = v100 != v101;
    if (v102) {
      int v103 = 3;
      int v104 = v89 % v103;
      int v105 = 0;
      int v106 = v89 + v105;
      int v107;
      v107 = v106;
      switch (v104) {
        case 0:
          {
          int v108 = 4;
          int v109 = v107 + v108;
          v107 = v109;
          break;
        }
        case 1:
          {
          int v110 = 3;
          int v111 = v107 + v110;
          v107 = v111;
          break;
        }
        case 2:
          {
          int v112 = 4;
          int v113 = v107 + v112;
          v107 = v113;
          break;
        }
        default:
          {
          int v114 = 0;
          int v115 = v107 + v114;
          v107 = v115;
          break;
        }
      }
      helper0(v89, v87, v92, v95, static_cast<int>(__simt_tid3.x));
    } else {
    }
  }
  int v116 = 12;
  int v117 = v116 + v89;
  int v118 = v88[v117];
  int v119;
  v119 = v89;
  switch (v118) {
    case 0:
      {
      int v120 = 16;
      int v121 = v120 + v89;
      int v122 = v88[v121];
      int v123 = 0;
      bool v124 = v122 != v123;
      int v125;
      if (v124) {
        int v126 = 0;
        int v127 = 0;
        int v128;
        int v129;
        v128 = v126;
        v129 = v127;
        while (true) {
          int v130 = 4;
          int v131 = v129 * v130;
          int v132 = v131 + v89;
          int v133 = 20;
          int v134 = v133 + v132;
          int v135 = v88[v134];
          int v136 = 0;
          bool v137 = v135 != v136;
          v128 = v128;
          v129 = v129;
          if (!v137) break;
          int v138 = v128 + v129;
          int v139 = 1;
          int v140 = v129 + v139;
          bool v141 = true;
          v128 = v138;
          v129 = v140;
        }
        v125 = v128;
      } else {
        int v142 = 40;
        int v143 = v142 + v89;
        int v144 = v88[v143];
        int v145 = 4;
        int v146;
        v146 = v145;
        switch (v144) {
          case 0:
            {
            int v147 = 3;
            v146 = v147;
          }
          default:
            {
            int v148 = 4;
            int v149 = v89 + v148;
            v146 = v149;
            break;
          }
          case 1:
            {
            v146 = v89;
            break;
          }
          case 2:
            {
            int v150 = 1;
            int v151 = v89 + v150;
            v146 = v151;
            break;
          }
        }
        v125 = v146;
      }
      v119 = v125;
    }
    case 1:
      {
      int v152 = 0;
      int v153 = v89 + v152;
      v119 = v153;
      break;
    }
    case 2:
      {
      int v154 = 0;
      int v155 = 0;
      int v156;
      int v157;
      v156 = v154;
      v157 = v155;
      while (true) {
        int v158 = 4;
        int v159 = v157 * v158;
        int v160 = v159 + v89;
        int v161 = 44;
        int v162 = v161 + v160;
        int v163 = v88[v162];
        int v164 = 0;
        bool v165 = v163 != v164;
        v156 = v156;
        v157 = v157;
        if (!v165) break;
        int v166 = v156 + v157;
        int v167 = 1;
        int v168 = v157 + v167;
        bool v169 = true;
        v156 = v166;
        v157 = v168;
        break;
        ;
      }
      v119 = v156;
    }
    default:
      {
      int v170 = 64;
      int v171 = v170 + v89;
      int v172 = v88[v171];
      int v173 = 0;
      bool v174 = v172 != v173;
      int v175;
      if (v174) {
        int v176 = 68;
        int v177 = v176 + v89;
        int v178 = v88[v177];
        int v179 = 0;
        bool v180 = v178 != v179;
        int v181;
        if (v180) {
          int v182 = 3;
          int v183 = v89 + v182;
          v181 = v183;
        } else {
          int v184 = 4;
          int v185 = v89 + v184;
          v181 = v185;
        }
        v175 = v181;
      } else {
        int v186 = 1;
        int v187 = v89 + v186;
        v175 = v187;
      }
      v119 = v175;
      break;
    }
  }
  bool v188 = true;
  int v189 = 16;
  int v190 = v189 + v89;
  bool v191 = true;
  int v192 = simt_wave_count_bits(v191);
  v87[v190] = v192;
  int v193 = 72;
  int v194 = v193 + v89;
  int v195 = v88[v194];
  uint v196 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v197 = (int)(v196);
  int v198;
  v198 = v197;
  switch (v195) {
    case 0:
      {
      int v199 = 1;
      v198 = v199;
      break;
    }
    case 1:
      {
      int v200 = 76;
      int v201 = v200 + v89;
      int v202 = v88[v201];
      int v203 = 0;
      bool v204 = v202 != v203;
      int v205;
      if (v204) {
        int v206 = 80;
        int v207 = v206 + v89;
        int v208 = v88[v207];
        int v209;
        v209 = v89;
        switch (v208) {
          case 0:
            {
            v209 = v89;
          }
          case 1:
            {
            v209 = v89;
            break;
          }
          case 2:
            {
            v209 = v89;
            break;
          }
          default:
            {
            int v210 = 1;
            int v211 = v89 + v210;
            v209 = v211;
            break;
          }
        }
        v205 = v209;
      } else {
        int v212 = 84;
        int v213 = v212 + v89;
        int v214 = v88[v213];
        int v215 = 0;
        bool v216 = v214 != v215;
        int v217;
        if (v216) {
          int v218 = 1;
          v217 = v218;
        } else {
          v217 = v89;
        }
        v205 = v217;
      }
      v198 = v205;
      break;
    }
    default:
      {
      int v219 = 88;
      int v220 = v219 + v89;
      int v221 = v88[v220];
      int v222 = 0;
      int v223;
      v223 = v222;
      switch (v221) {
        default:
          {
          int v224 = 92;
          int v225 = v224 + v89;
          int v226 = v88[v225];
          int v227 = 3;
          int v228;
          v228 = v227;
          switch (v226) {
            default:
              {
              v228 = v89;
            }
            case 0:
              {
              int v229 = 0;
              v228 = v229;
            }
            case 1:
              {
              int v230 = 2;
              v228 = v230;
            }
            case 2:
              {
              int v231 = 1;
              v228 = v231;
              break;
            }
          }
          v223 = v228;
          break;
        }
        case 0:
          {
          int v232 = 96;
          int v233 = v232 + v89;
          int v234 = v88[v233];
          int v235 = 0;
          bool v236 = v234 != v235;
          int v237;
          if (v236) {
            v237 = v89;
          } else {
            v237 = v89;
          }
          v223 = v237;
          break;
        }
        case 1:
          {
          int v238 = 0;
          int v239 = 0;
          int v240;
          int v241;
          v240 = v238;
          v241 = v239;
          while (true) {
            int v242 = 4;
            int v243 = v241 * v242;
            int v244 = v243 + v89;
            int v245 = 100;
            int v246 = v245 + v244;
            int v247 = v88[v246];
            int v248 = 0;
            bool v249 = v247 != v248;
            v240 = v240;
            v241 = v241;
            if (!v249) break;
            int v250 = v240 + v241;
            int v251 = 1;
            int v252 = v241 + v251;
            bool v253 = true;
            v240 = v250;
            v241 = v252;
          }
          v223 = v240;
          break;
        }
      }
      bool v254 = true;
      v198 = v223;
      break;
    }
    case 2:
      {
      int v255 = 0;
      int v256 = 0;
      int v257;
      int v258;
      v257 = v255;
      v258 = v256;
      while (true) {
        int v259 = 4;
        int v260 = v258 * v259;
        int v261 = v260 + v89;
        int v262 = 120;
        int v263 = v262 + v261;
        int v264 = v88[v263];
        int v265 = 0;
        bool v266 = v264 != v265;
        v257 = v257;
        v258 = v258;
        if (!v266) break;
        int v267 = v257 + v258;
        int v268 = 1;
        int v269 = v258 + v268;
        bool v270 = true;
        v257 = v267;
        v258 = v269;
      }
      v198 = v257;
      break;
    }
  }
  int v271 = 140;
  int v272 = v271 + v89;
  int v273 = v88[v272];
  uint v274 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v275 = (int)(v274);
  int v276;
  v276 = v275;
  switch (v273) {
    case 0:
      {
      int v277 = 144;
      int v278 = v277 + v89;
      int v279 = v88[v278];
      int v280 = 4;
      int v281;
      v281 = v280;
      switch (v279) {
        default:
          {
          int v282 = 2;
          v281 = v282;
          break;
        }
        case 0:
          {
          int v283 = 148;
          int v284 = v283 + v89;
          int v285 = v88[v284];
          int v286 = 4;
          int v287 = v89 + v286;
          int v288;
          v288 = v287;
          switch (v285) {
            case 0:
              {
              v288 = v89;
              break;
            }
            default:
              {
              int v289 = 2;
              v288 = v289;
              break;
            }
          }
          v281 = v288;
          break;
        }
      }
      v276 = v281;
      break;
    }
    case 1:
      {
      int v290 = 4;
      int v291 = v89 + v290;
      v276 = v291;
      break;
    }
    default:
      {
      int v292 = 1;
      v276 = v292;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 152; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
