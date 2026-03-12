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
  int v6 = 1;
  int v7;
  v7 = v6;
  switch (v5) {
    case 0:
      {
      int v8 = 1;
      int v9;
      v9 = v8;
      switch (v3) {
        default:
          {
          int v10 = 0;
          bool v11 = v2 != v10;
          int v12;
          if (v11) {
            bool v13 = true;
            int v14 = simt_wave_count_bits(v13);
            int v15 = 0;
            int v16 = v15 + v0;
            v1[v16] = v14;
            v12 = v14;
          } else {
            bool v17 = true;
            int v18 = simt_wave_count_bits(v17);
            int v19 = 16;
            int v20 = v19 + v0;
            v1[v20] = v18;
            v12 = v18;
          }
          v9 = v12;
        }
        case 0:
          {
          int v21 = 2;
          int v22 = v3 % v21;
          int v23 = 4;
          int v24 = v0 + v23;
          int v25;
          v25 = v24;
          switch (v22) {
            case 0:
              {
              bool v26 = true;
              int v27 = simt_wave_count_bits(v26);
              int v28 = 32;
              int v29 = v28 + v0;
              v1[v29] = v27;
              v25 = v27;
              break;
            }
            default:
              {
              bool v30 = true;
              int v31 = simt_wave_count_bits(v30);
              int v32 = 48;
              int v33 = v32 + v0;
              v1[v33] = v31;
              v25 = v31;
              break;
            }
            case 1:
              {
              bool v34 = true;
              int v35 = simt_wave_count_bits(v34);
              int v36 = 64;
              int v37 = v36 + v0;
              v1[v37] = v35;
              v25 = v35;
              break;
            }
          }
          v9 = v25;
          break;
        }
      }
      v7 = v9;
      break;
    }
    default:
      {
      bool v38 = true;
      int v39 = simt_wave_count_bits(v38);
      int v40 = 80;
      int v41 = v40 + v0;
      v1[v41] = v39;
      v7 = v39;
      break;
    }
    case 1:
      {
      int v42 = 0;
      bool v43 = v2 != v42;
      int v44;
      if (v43) {
        int v45 = 3;
        int v46 = v3 % v45;
        int v47 = 1;
        int v48;
        v48 = v47;
        switch (v46) {
          default:
            {
            bool v49 = true;
            int v50 = simt_wave_count_bits(v49);
            int v51 = 96;
            int v52 = v51 + v0;
            v1[v52] = v50;
            v48 = v50;
            break;
          }
          case 0:
            {
            bool v53 = true;
            int v54 = simt_wave_count_bits(v53);
            int v55 = 112;
            int v56 = v55 + v0;
            v1[v56] = v54;
            v48 = v54;
            break;
          }
          case 1:
            {
            bool v57 = true;
            int v58 = simt_wave_count_bits(v57);
            int v59 = 128;
            int v60 = v59 + v0;
            v1[v60] = v58;
            v48 = v58;
            break;
          }
          case 2:
            {
            bool v61 = true;
            int v62 = simt_wave_count_bits(v61);
            int v63 = 144;
            int v64 = v63 + v0;
            v1[v64] = v62;
            v48 = v62;
            break;
          }
        }
        v44 = v48;
      } else {
        int v65 = 2;
        int v66 = v3 % v65;
        int v67 = 2;
        int v68;
        v68 = v67;
        switch (v66) {
          case 0:
            {
            bool v69 = true;
            int v70 = simt_wave_count_bits(v69);
            int v71 = 160;
            int v72 = v71 + v0;
            v1[v72] = v70;
            v68 = v70;
            break;
          }
          default:
            {
            bool v73 = true;
            int v74 = simt_wave_count_bits(v73);
            int v75 = 176;
            int v76 = v75 + v0;
            v1[v76] = v74;
            v68 = v74;
            break;
          }
          case 1:
            {
            bool v77 = true;
            int v78 = simt_wave_count_bits(v77);
            int v79 = 192;
            int v80 = v79 + v0;
            v1[v80] = v78;
            v68 = v78;
            break;
          }
        }
        v44 = v68;
      }
      v7 = v44;
      break;
    }
  }
  return;
}

kernel void kernel_main(device int* v81 [[buffer(0)]], device int* v82 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v83 = static_cast<int>(__simt_tid3.x);
  int v84 = 0;
  int v85 = v84 + v83;
  int v86 = v82[v85];
  int v87 = 4;
  int v88 = v87 + v83;
  int v89 = v82[v88];
  int v90 = 0;
  bool v91 = v86 != v90;
  if (v91) {
  } else {
    int v92 = 8;
    int v93 = v92 + v83;
    int v94 = v82[v93];
    int v95 = 0;
    bool v96 = v94 != v95;
    if (v96) {
    } else {
      helper0(v83, v81, v86, v89, static_cast<int>(__simt_tid3.x));
    }
  }
  int v97 = 12;
  int v98 = v97 + v83;
  int v99 = v82[v98];
  int v100 = 0;
  int v101;
  v101 = v100;
  switch (v99) {
    case 0:
      {
      int v102 = 16;
      int v103 = v102 + v83;
      int v104 = v82[v103];
      uint v105 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v106 = (int)(v105);
      int v107;
      v107 = v106;
      switch (v104) {
        default:
          {
          int v108 = 0;
          int v109 = 0;
          int v110;
          int v111;
          v110 = v108;
          v111 = v109;
          while (true) {
            int v112 = 4;
            int v113 = v111 * v112;
            int v114 = v113 + v83;
            int v115 = 20;
            int v116 = v115 + v114;
            int v117 = v82[v116];
            int v118 = 0;
            bool v119 = v117 != v118;
            v110 = v110;
            v111 = v111;
            if (!v119) break;
            int v120 = v110 + v111;
            int v121 = 1;
            int v122 = v111 + v121;
            bool v123 = true;
            int v124 = 208;
            int v125 = 4;
            int v126 = v111 * v125;
            int v127 = v124 + v126;
            int v128 = v127 + v83;
            bool v129 = true;
            int v130 = simt_wave_count_bits(v129);
            v81[v128] = v130;
            v110 = v120;
            v111 = v122;
          }
          bool v131 = true;
          int v132 = 224;
          int v133 = v132 + v83;
          bool v134 = true;
          int v135 = simt_wave_count_bits(v134);
          v81[v133] = v135;
          v107 = v110;
          break;
        }
        case 0:
          {
          int v136 = 3;
          v107 = v136;
        }
        case 1:
          {
          uint v137 = simt_lane_id(static_cast<int>(__simt_tid3.x));
          int v138 = (int)(v137);
          bool v139 = true;
          int v140 = 240;
          int v141 = v140 + v83;
          bool v142 = true;
          int v143 = simt_wave_count_bits(v142);
          v81[v141] = v143;
          v107 = v138;
          break;
        }
      }
      v101 = v107;
      break;
    }
    case 1:
      {
      int v144 = 40;
      int v145 = v144 + v83;
      int v146 = v82[v145];
      int v147 = 0;
      int v148;
      v148 = v147;
      switch (v146) {
        default:
          {
          uint v149 = simt_lane_id(static_cast<int>(__simt_tid3.x));
          int v150 = (int)(v149);
          v148 = v150;
          break;
        }
        case 0:
          {
          int v151 = 44;
          int v152 = v151 + v83;
          int v153 = v82[v152];
          uint v154 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
          int v155 = (int)(v154);
          int v156;
          v156 = v155;
          switch (v153) {
            default:
              {
              int v157 = 3;
              v156 = v157;
            }
            case 0:
              {
              uint v158 = simt_lane_id(static_cast<int>(__simt_tid3.x));
              int v159 = (int)(v158);
              bool v160 = true;
              int v161 = 256;
              int v162 = v161 + v83;
              bool v163 = true;
              int v164 = simt_wave_count_bits(v163);
              v81[v162] = v164;
              v156 = v159;
              break;
            }
          }
          bool v165 = true;
          int v166 = 272;
          int v167 = v166 + v83;
          bool v168 = true;
          int v169 = simt_wave_count_bits(v168);
          v81[v167] = v169;
          v148 = v156;
          break;
        }
        case 1:
          {
          int v170 = 48;
          int v171 = v170 + v83;
          int v172 = v82[v171];
          int v173;
          v173 = v83;
          switch (v172) {
            default:
              {
              uint v174 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
              int v175 = (int)(v174);
              bool v176 = true;
              int v177 = 288;
              int v178 = v177 + v83;
              bool v179 = true;
              int v180 = simt_wave_count_bits(v179);
              v81[v178] = v180;
              v173 = v175;
              break;
            }
            case 0:
              {
              uint v181 = simt_lane_id(static_cast<int>(__simt_tid3.x));
              int v182 = (int)(v181);
              v173 = v182;
              break;
            }
          }
          bool v183 = true;
          int v184 = 304;
          int v185 = v184 + v83;
          bool v186 = true;
          int v187 = simt_wave_count_bits(v186);
          v81[v185] = v187;
          bool v188 = true;
          int v189 = 320;
          int v190 = v189 + v83;
          bool v191 = true;
          int v192 = simt_wave_count_bits(v191);
          v81[v190] = v192;
          v148 = v173;
          break;
        }
        case 2:
          {
          int v193 = 52;
          int v194 = v193 + v83;
          int v195 = v82[v194];
          uint v196 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
          int v197 = (int)(v196);
          int v198;
          v198 = v197;
          switch (v195) {
            case 0:
              {
              uint v199 = simt_lane_id(static_cast<int>(__simt_tid3.x));
              int v200 = (int)(v199);
              v198 = v200;
              break;
            }
            default:
              {
              int v201 = 3;
              int v202 = v83 + v201;
              bool v203 = true;
              int v204 = 336;
              int v205 = v204 + v83;
              bool v206 = true;
              int v207 = simt_wave_count_bits(v206);
              v81[v205] = v207;
              v198 = v202;
            }
            case 1:
              {
              uint v208 = simt_lane_id(static_cast<int>(__simt_tid3.x));
              int v209 = (int)(v208);
              v198 = v209;
              break;
            }
          }
          bool v210 = true;
          int v211 = 352;
          int v212 = v211 + v83;
          bool v213 = true;
          int v214 = simt_wave_count_bits(v213);
          v81[v212] = v214;
          v148 = v198;
          break;
        }
      }
      v101 = v148;
      break;
    }
    default:
      {
      int v215 = 56;
      int v216 = v215 + v83;
      int v217 = v82[v216];
      int v218;
      v218 = v83;
      switch (v217) {
        default:
          {
          int v219 = 60;
          int v220 = v219 + v83;
          int v221 = v82[v220];
          int v222 = 4;
          int v223 = v83 + v222;
          int v224;
          v224 = v223;
          switch (v221) {
            default:
              {
              v224 = v83;
            }
            case 0:
              {
              uint v225 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
              int v226 = (int)(v225);
              bool v227 = true;
              int v228 = 368;
              int v229 = v228 + v83;
              bool v230 = true;
              int v231 = simt_wave_count_bits(v230);
              v81[v229] = v231;
              v224 = v226;
              break;
            }
          }
          v218 = v224;
          break;
        }
        case 0:
          {
          int v232 = 64;
          int v233 = v232 + v83;
          int v234 = v82[v233];
          int v235 = 0;
          bool v236 = v234 != v235;
          int v237;
          if (v236) {
            uint v238 = simt_lane_id(static_cast<int>(__simt_tid3.x));
            int v239 = (int)(v238);
            v237 = v239;
          } else {
            uint v240 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
            int v241 = (int)(v240);
            v237 = v241;
          }
          int v242 = 384;
          int v243 = v242 + v83;
          bool v244 = true;
          int v245 = simt_wave_count_bits(v244);
          v81[v243] = v245;
          bool v246 = true;
          int v247 = 400;
          int v248 = v247 + v83;
          bool v249 = true;
          int v250 = simt_wave_count_bits(v249);
          v81[v248] = v250;
          v218 = v237;
          break;
        }
        case 1:
          {
          int v251 = 2;
          bool v252 = true;
          int v253 = 416;
          int v254 = v253 + v83;
          bool v255 = true;
          int v256 = simt_wave_count_bits(v255);
          v81[v254] = v256;
          v218 = v251;
          break;
        }
        case 2:
          {
          int v257 = 68;
          int v258 = v257 + v83;
          int v259 = v82[v258];
          int v260 = 2;
          int v261;
          v261 = v260;
          switch (v259) {
            case 0:
              {
              uint v262 = simt_lane_id(static_cast<int>(__simt_tid3.x));
              int v263 = (int)(v262);
              bool v264 = true;
              int v265 = 432;
              int v266 = v265 + v83;
              bool v267 = true;
              int v268 = simt_wave_count_bits(v267);
              v81[v266] = v268;
              v261 = v263;
              break;
            }
            case 1:
              {
              uint v269 = simt_lane_id(static_cast<int>(__simt_tid3.x));
              int v270 = (int)(v269);
              v261 = v270;
              break;
            }
            default:
              {
              int v271 = 3;
              v261 = v271;
              break;
            }
          }
          bool v272 = true;
          int v273 = 448;
          int v274 = v273 + v83;
          bool v275 = true;
          int v276 = simt_wave_count_bits(v275);
          v81[v274] = v276;
          bool v277 = true;
          int v278 = 464;
          int v279 = v278 + v83;
          bool v280 = true;
          int v281 = simt_wave_count_bits(v280);
          v81[v279] = v281;
          v218 = v261;
          break;
        }
      }
      bool v282 = true;
      int v283 = 480;
      int v284 = v283 + v83;
      bool v285 = true;
      int v286 = simt_wave_count_bits(v285);
      v81[v284] = v286;
      v101 = v218;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 322; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 72; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
