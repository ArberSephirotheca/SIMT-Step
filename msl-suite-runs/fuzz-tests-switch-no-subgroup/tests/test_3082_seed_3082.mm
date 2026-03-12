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
    default:
      {
      int v9 = 4;
      int v10 = v3 % v9;
      int v11 = 1;
      int v12 = v0 + v11;
      int v13;
      v13 = v12;
      switch (v10) {
        default:
          {
          int v14 = 4;
          int v15 = v3 % v14;
          int v16 = 4;
          int v17;
          v17 = v16;
          switch (v15) {
            case 0:
              {
              int v18 = 1;
              int v19 = v0 + v18;
              v17 = v19;
              break;
            }
            case 1:
              {
              v17 = v0;
              break;
            }
            case 2:
              {
              int v20 = 1;
              int v21 = v0 + v20;
              v17 = v21;
            }
            default:
              {
              int v22 = 0;
              int v23 = v0 + v22;
              v17 = v23;
              break;
            }
          }
          v13 = v17;
          break;
        }
        case 0:
          {
          int v24 = 0;
          bool v25 = v2 != v24;
          int v26;
          if (v25) {
            int v27 = 4;
            v26 = v27;
          } else {
            int v28 = 1;
            int v29 = v0 + v28;
            v26 = v29;
          }
          v13 = v26;
          break;
        }
        case 1:
          {
          int v30 = 0;
          bool v31 = v2 != v30;
          int v32;
          if (v31) {
            int v33 = 2;
            v32 = v33;
          } else {
            v32 = v0;
          }
          v13 = v32;
          break;
        }
        case 2:
          {
          int v34 = 0;
          int v35 = 0;
          int v36;
          int v37;
          v36 = v34;
          v37 = v35;
          while (true) {
            int v38 = 4;
            int v39 = v3 % v38;
            int v40 = 1;
            int v41 = v39 + v40;
            bool v42 = v37 < v41;
            v36 = v36;
            v37 = v37;
            if (!v42) break;
            int v43 = 1;
            int v44 = v37 + v43;
            v36 = v0;
            v37 = v44;
          }
          v13 = v36;
          break;
        }
      }
      v8 = v13;
      break;
    }
    case 0:
      {
      int v45 = 3;
      int v46 = v3 % v45;
      int v47;
      v47 = v0;
      switch (v46) {
        case 0:
          {
          int v48 = 1;
          v47 = v48;
          break;
        }
        default:
          {
          int v49 = 2;
          int v50 = v3 % v49;
          int v51 = 1;
          int v52;
          v52 = v51;
          switch (v50) {
            default:
              {
              int v53 = 1;
              int v54 = v0 + v53;
              v52 = v54;
            }
            case 0:
              {
              v52 = v0;
              break;
            }
          }
          v47 = v52;
          break;
        }
        case 1:
          {
          int v55 = 0;
          bool v56 = v2 != v55;
          int v57;
          if (v56) {
            v57 = v0;
          } else {
            int v58 = 4;
            int v59 = v0 + v58;
            v57 = v59;
          }
          v47 = v57;
          break;
        }
      }
      v8 = v47;
      break;
    }
    case 1:
      {
      int v60 = 2;
      int v61 = v0 + v60;
      int v62;
      v62 = v61;
      switch (v3) {
        default:
          {
          int v63 = 3;
          int v64;
          v64 = v63;
          switch (v3) {
            default:
              {
              int v65 = 2;
              int v66 = v0 + v65;
              v64 = v66;
            }
            case 0:
              {
              int v67 = 1;
              v64 = v67;
              break;
            }
          }
          v62 = v64;
          break;
        }
        case 0:
          {
          int v68 = 0;
          int v69 = 0;
          int v70;
          int v71;
          v70 = v68;
          v71 = v69;
          while (true) {
            int v72 = 4;
            int v73 = v3 % v72;
            int v74 = 1;
            int v75 = v73 + v74;
            bool v76 = v71 < v75;
            v70 = v70;
            v71 = v71;
            if (!v76) break;
            int v77 = 1;
            int v78 = 1;
            int v79 = v71 + v78;
            v70 = v77;
            v71 = v79;
            continue;
            ;
          }
          v62 = v70;
          break;
        }
      }
      v8 = v62;
      break;
    }
  }
  bool v80 = true;
  int v81 = simt_wave_count_bits(v80);
  int v82 = 0;
  int v83 = v82 + v0;
  v1[v83] = v81;
  return;
}

kernel void kernel_main(device int* v84 [[buffer(0)]], device int* v85 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v86 = static_cast<int>(__simt_tid3.x);
  int v87 = 0;
  int v88 = v87 + v86;
  int v89 = v85[v88];
  int v90 = 4;
  int v91 = v90 + v86;
  int v92 = v85[v91];
  helper0(v86, v84, v89, v92, static_cast<int>(__simt_tid3.x));
  int v93 = 8;
  int v94 = v93 + v86;
  int v95 = v85[v94];
  int v96 = 0;
  bool v97 = v95 != v96;
  int v98;
  if (v97) {
    int v99 = 0;
    int v100 = 0;
    int v101;
    int v102;
    v101 = v99;
    v102 = v100;
    while (true) {
      int v103 = 4;
      int v104 = v102 * v103;
      int v105 = v104 + v86;
      int v106 = 12;
      int v107 = v106 + v105;
      int v108 = v85[v107];
      int v109 = 0;
      bool v110 = v108 != v109;
      v101 = v101;
      v102 = v102;
      if (!v110) break;
      int v111 = 0;
      int v112 = 0;
      int v113;
      int v114;
      v113 = v111;
      v114 = v112;
      while (true) {
        int v115 = 4;
        int v116 = v114 * v115;
        int v117 = v116 + v86;
        int v118 = 32;
        int v119 = v118 + v117;
        int v120 = v85[v119];
        int v121 = 0;
        bool v122 = v120 != v121;
        v113 = v113;
        v114 = v114;
        if (!v122) break;
        int v123 = v113 + v114;
        int v124 = 1;
        int v125 = v114 + v124;
        bool v126 = true;
        int v127 = 16;
        int v128 = 4;
        int v129 = v114 * v128;
        int v130 = v127 + v129;
        int v131 = v130 + v86;
        bool v132 = true;
        int v133 = simt_wave_count_bits(v132);
        v84[v131] = v133;
        v113 = v123;
        v114 = v125;
      }
      int v134 = v101 + v113;
      int v135 = 1;
      int v136 = v102 + v135;
      bool v137 = true;
      int v138 = 32;
      int v139 = 4;
      int v140 = v102 * v139;
      int v141 = v138 + v140;
      int v142 = v141 + v86;
      bool v143 = true;
      int v144 = simt_wave_count_bits(v143);
      v84[v142] = v144;
      v101 = v134;
      v102 = v136;
    }
    v98 = v101;
  } else {
    int v145 = 52;
    int v146 = v145 + v86;
    int v147 = v85[v146];
    int v148 = 0;
    bool v149 = v147 != v148;
    int v150;
    if (v149) {
      int v151 = 0;
      int v152 = 0;
      int v153;
      int v154;
      v153 = v151;
      v154 = v152;
      while (true) {
        int v155 = 4;
        int v156 = v154 * v155;
        int v157 = v156 + v86;
        int v158 = 56;
        int v159 = v158 + v157;
        int v160 = v85[v159];
        int v161 = 0;
        bool v162 = v160 != v161;
        v153 = v153;
        v154 = v154;
        if (!v162) break;
        int v163 = v153 + v154;
        int v164 = 1;
        int v165 = v154 + v164;
        bool v166 = true;
        int v167 = 48;
        int v168 = 4;
        int v169 = v154 * v168;
        int v170 = v167 + v169;
        int v171 = v170 + v86;
        bool v172 = true;
        int v173 = simt_wave_count_bits(v172);
        v84[v171] = v173;
        v153 = v163;
        v154 = v165;
        continue;
        ;
      }
      v150 = v153;
    } else {
      uint v174 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v175 = (int)(v174);
      v150 = v175;
    }
    int v176 = 64;
    int v177 = v176 + v86;
    bool v178 = true;
    int v179 = simt_wave_count_bits(v178);
    v84[v177] = v179;
    v98 = v150;
  }
  int v180 = 80;
  int v181 = v180 + v86;
  bool v182 = true;
  int v183 = simt_wave_count_bits(v182);
  v84[v181] = v183;
  int v184 = 76;
  int v185 = v184 + v86;
  int v186 = v85[v185];
  int v187 = 0;
  bool v188 = v186 != v187;
  int v189;
  if (v188) {
    int v190 = 0;
    int v191 = 0;
    int v192;
    int v193;
    v192 = v190;
    v193 = v191;
    while (true) {
      int v194 = 4;
      int v195 = v193 * v194;
      int v196 = v195 + v86;
      int v197 = 80;
      int v198 = v197 + v196;
      int v199 = v85[v198];
      int v200 = 0;
      bool v201 = v199 != v200;
      v192 = v192;
      v193 = v193;
      if (!v201) break;
      int v202 = v192 + v193;
      int v203 = 1;
      int v204 = v193 + v203;
      bool v205 = true;
      int v206 = 96;
      int v207 = 4;
      int v208 = v193 * v207;
      int v209 = v206 + v208;
      int v210 = v209 + v86;
      bool v211 = true;
      int v212 = simt_wave_count_bits(v211);
      v84[v210] = v212;
      v192 = v202;
      v193 = v204;
      continue;
      ;
    }
    v189 = v192;
  } else {
    int v213 = 0;
    int v214 = 0;
    int v215;
    int v216;
    v215 = v213;
    v216 = v214;
    while (true) {
      int v217 = 4;
      int v218 = v216 * v217;
      int v219 = v218 + v86;
      int v220 = 100;
      int v221 = v220 + v219;
      int v222 = v85[v221];
      int v223 = 0;
      bool v224 = v222 != v223;
      v215 = v215;
      v216 = v216;
      if (!v224) break;
      int v225 = v215 + v216;
      int v226 = 1;
      int v227 = v216 + v226;
      bool v228 = true;
      int v229 = 112;
      int v230 = 4;
      int v231 = v216 * v230;
      int v232 = v229 + v231;
      int v233 = v232 + v86;
      bool v234 = true;
      int v235 = simt_wave_count_bits(v234);
      v84[v233] = v235;
      v215 = v225;
      v216 = v227;
    }
    v189 = v215;
  }
  int v236 = 128;
  int v237 = v236 + v86;
  bool v238 = true;
  int v239 = simt_wave_count_bits(v238);
  v84[v237] = v239;
  int v240 = 120;
  int v241 = v240 + v86;
  int v242 = v85[v241];
  uint v243 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v244 = (int)(v243);
  int v245;
  v245 = v244;
  switch (v242) {
    case 0:
      {
      int v246 = 0;
      int v247 = 0;
      int v248;
      int v249;
      v248 = v246;
      v249 = v247;
      while (true) {
        int v250 = 4;
        int v251 = v249 * v250;
        int v252 = v251 + v86;
        int v253 = 124;
        int v254 = v253 + v252;
        int v255 = v85[v254];
        int v256 = 0;
        bool v257 = v255 != v256;
        v248 = v248;
        v249 = v249;
        if (!v257) break;
        int v258 = v248 + v249;
        int v259 = 1;
        int v260 = v249 + v259;
        bool v261 = true;
        v248 = v258;
        v249 = v260;
        break;
        ;
      }
      v245 = v248;
      break;
    }
    case 1:
      {
      int v262 = 0;
      int v263 = 0;
      int v264;
      int v265;
      v264 = v262;
      v265 = v263;
      while (true) {
        int v266 = 4;
        int v267 = v265 * v266;
        int v268 = v267 + v86;
        int v269 = 144;
        int v270 = v269 + v268;
        int v271 = v85[v270];
        int v272 = 0;
        bool v273 = v271 != v272;
        v264 = v264;
        v265 = v265;
        if (!v273) break;
        int v274 = v264 + v265;
        int v275 = 1;
        int v276 = v265 + v275;
        bool v277 = true;
        v264 = v274;
        v265 = v276;
      }
      v245 = v264;
      break;
    }
    default:
      {
      int v278 = 0;
      v245 = v278;
      break;
    }
    case 2:
      {
      int v279 = 164;
      int v280 = v279 + v86;
      int v281 = v85[v280];
      int v282 = 2;
      int v283 = v86 + v282;
      int v284;
      v284 = v283;
      switch (v281) {
        default:
          {
          int v285 = 168;
          int v286 = v285 + v86;
          int v287 = v85[v286];
          int v288 = 0;
          bool v289 = v287 != v288;
          int v290;
          if (v289) {
            int v291 = 4;
            v290 = v291;
          } else {
            int v292 = 3;
            int v293 = v86 + v292;
            v290 = v293;
          }
          v284 = v290;
          break;
        }
        case 0:
          {
          v284 = v86;
          break;
        }
      }
      v245 = v284;
      break;
    }
  }
  bool v294 = true;
  int v295 = 144;
  int v296 = v295 + v86;
  bool v297 = true;
  int v298 = simt_wave_count_bits(v297);
  v84[v296] = v298;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 148; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 172; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
