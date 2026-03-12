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
    int v13 = 0;
    int v14 = 0;
    int v15;
    int v16;
    v15 = v13;
    v16 = v14;
    while (true) {
      int v17 = 4;
      int v18 = v3 % v17;
      int v19 = 1;
      int v20 = v18 + v19;
      bool v21 = v16 < v20;
      v15 = v15;
      v16 = v16;
      if (!v21) break;
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
        bool v31 = true;
        int v32 = simt_wave_count_bits(v31);
        int v33 = 0;
        int v34 = 4;
        int v35 = v25 * v34;
        int v36 = v33 + v35;
        int v37 = v36 + v0;
        v1[v37] = v32;
        int v38 = 1;
        int v39 = v25 + v38;
        v24 = v32;
        v25 = v39;
      }
      int v40 = 1;
      int v41 = v16 + v40;
      v15 = v24;
      v16 = v41;
    }
    int v42 = 1;
    int v43 = v7 + v42;
    v6 = v15;
    v7 = v43;
    continue;
    ;
  }
  return;
}

kernel void kernel_main(device int* v44 [[buffer(0)]], device int* v45 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v46 = static_cast<int>(__simt_tid3.x);
  int v47 = 0;
  int v48 = v47 + v46;
  int v49 = v45[v48];
  int v50 = 4;
  int v51 = v50 + v46;
  int v52 = v45[v51];
  helper0(v46, v44, v49, v52, static_cast<int>(__simt_tid3.x));
  int v53 = 0;
  int v54 = 0;
  int v55;
  int v56;
  v55 = v53;
  v56 = v54;
  while (true) {
    int v57 = 4;
    int v58 = v56 * v57;
    int v59 = v58 + v46;
    int v60 = 8;
    int v61 = v60 + v59;
    int v62 = v45[v61];
    int v63 = 0;
    bool v64 = v62 != v63;
    v55 = v55;
    v56 = v56;
    if (!v64) break;
    int v65 = 28;
    int v66 = v65 + v46;
    int v67 = v45[v66];
    int v68 = 4;
    int v69;
    v69 = v68;
    switch (v67) {
      default:
        {
        int v70 = 32;
        int v71 = v70 + v46;
        int v72 = v45[v71];
        uint v73 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v74 = (int)(v73);
        int v75;
        v75 = v74;
        switch (v72) {
          case 0:
            {
            uint v76 = simt_lane_id(static_cast<int>(__simt_tid3.x));
            int v77 = (int)(v76);
            v75 = v77;
            break;
          }
          default:
            {
            uint v78 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
            int v79 = (int)(v78);
            bool v80 = true;
            int v81 = 16;
            int v82 = v81 + v46;
            bool v83 = true;
            int v84 = simt_wave_count_bits(v83);
            v44[v82] = v84;
            v75 = v79;
            break;
          }
        }
        bool v85 = true;
        int v86 = 32;
        int v87 = v86 + v46;
        bool v88 = true;
        int v89 = simt_wave_count_bits(v88);
        v44[v87] = v89;
        v69 = v75;
        break;
      }
      case 0:
        {
        int v90 = 3;
        v69 = v90;
      }
      case 1:
        {
        uint v91 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v92 = (int)(v91);
        v69 = v92;
        break;
      }
    }
    int v93 = v55 + v69;
    int v94 = 1;
    int v95 = v56 + v94;
    bool v96 = true;
    int v97 = 48;
    int v98 = 4;
    int v99 = v56 * v98;
    int v100 = v97 + v99;
    int v101 = v100 + v46;
    bool v102 = true;
    int v103 = simt_wave_count_bits(v102);
    v44[v101] = v103;
    v55 = v93;
    v56 = v95;
    break;
    ;
  }
  int v104 = 36;
  int v105 = v104 + v46;
  int v106 = v45[v105];
  int v107 = 0;
  int v108;
  v108 = v107;
  switch (v106) {
    case 0:
      {
      int v109 = 40;
      int v110 = v109 + v46;
      int v111 = v45[v110];
      uint v112 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v113 = (int)(v112);
      int v114;
      v114 = v113;
      switch (v111) {
        case 0:
          {
          uint v115 = simt_lane_id(static_cast<int>(__simt_tid3.x));
          int v116 = (int)(v115);
          v114 = v116;
          break;
        }
        default:
          {
          int v117 = 44;
          int v118 = v117 + v46;
          int v119 = v45[v118];
          uint v120 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
          int v121 = (int)(v120);
          int v122;
          v122 = v121;
          switch (v119) {
            case 0:
              {
              uint v123 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
              int v124 = (int)(v123);
              v122 = v124;
              break;
            }
            default:
              {
              v122 = v46;
              break;
            }
            case 1:
              {
              uint v125 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
              int v126 = (int)(v125);
              bool v127 = true;
              int v128 = 64;
              int v129 = v128 + v46;
              bool v130 = true;
              int v131 = simt_wave_count_bits(v130);
              v44[v129] = v131;
              v122 = v126;
              break;
            }
            case 2:
              {
              uint v132 = simt_lane_id(static_cast<int>(__simt_tid3.x));
              int v133 = (int)(v132);
              v122 = v133;
              break;
            }
          }
          v114 = v122;
          break;
        }
        case 1:
          {
          int v134 = 2;
          int v135 = v46 + v134;
          bool v136 = true;
          int v137 = 80;
          int v138 = v137 + v46;
          bool v139 = true;
          int v140 = simt_wave_count_bits(v139);
          v44[v138] = v140;
          v114 = v135;
          break;
        }
        case 2:
          {
          int v141 = 1;
          bool v142 = true;
          int v143 = 96;
          int v144 = v143 + v46;
          bool v145 = true;
          int v146 = simt_wave_count_bits(v145);
          v44[v144] = v146;
          v114 = v141;
          break;
        }
      }
      bool v147 = true;
      int v148 = 112;
      int v149 = v148 + v46;
      bool v150 = true;
      int v151 = simt_wave_count_bits(v150);
      v44[v149] = v151;
      v108 = v114;
      break;
    }
    case 1:
      {
      int v152 = 0;
      int v153 = 0;
      int v154;
      int v155;
      v154 = v152;
      v155 = v153;
      while (true) {
        int v156 = 4;
        int v157 = v155 * v156;
        int v158 = v157 + v46;
        int v159 = 48;
        int v160 = v159 + v158;
        int v161 = v45[v160];
        int v162 = 0;
        bool v163 = v161 != v162;
        v154 = v154;
        v155 = v155;
        if (!v163) break;
        int v164 = v154 + v155;
        int v165 = 1;
        int v166 = v155 + v165;
        bool v167 = true;
        int v168 = 128;
        int v169 = 4;
        int v170 = v155 * v169;
        int v171 = v168 + v170;
        int v172 = v171 + v46;
        bool v173 = true;
        int v174 = simt_wave_count_bits(v173);
        v44[v172] = v174;
        v154 = v164;
        v155 = v166;
      }
      v108 = v154;
      break;
    }
    case 2:
      {
      int v175 = 68;
      int v176 = v175 + v46;
      int v177 = v45[v176];
      uint v178 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v179 = (int)(v178);
      int v180;
      v180 = v179;
      switch (v177) {
        default:
          {
          uint v181 = simt_lane_id(static_cast<int>(__simt_tid3.x));
          int v182 = (int)(v181);
          bool v183 = true;
          int v184 = 144;
          int v185 = v184 + v46;
          bool v186 = true;
          int v187 = simt_wave_count_bits(v186);
          v44[v185] = v187;
          v180 = v182;
          break;
        }
        case 0:
          {
          int v188 = 72;
          int v189 = v188 + v46;
          int v190 = v45[v189];
          uint v191 = simt_lane_id(static_cast<int>(__simt_tid3.x));
          int v192 = (int)(v191);
          int v193;
          v193 = v192;
          switch (v190) {
            default:
              {
              v193 = v46;
            }
            case 0:
              {
              uint v194 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
              int v195 = (int)(v194);
              bool v196 = true;
              int v197 = 160;
              int v198 = v197 + v46;
              bool v199 = true;
              int v200 = simt_wave_count_bits(v199);
              v44[v198] = v200;
              v193 = v195;
              break;
            }
            case 1:
              {
              uint v201 = simt_lane_id(static_cast<int>(__simt_tid3.x));
              int v202 = (int)(v201);
              v193 = v202;
              break;
            }
          }
          bool v203 = true;
          int v204 = 176;
          int v205 = v204 + v46;
          bool v206 = true;
          int v207 = simt_wave_count_bits(v206);
          v44[v205] = v207;
          v180 = v193;
          break;
        }
        case 1:
          {
          uint v208 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
          int v209 = (int)(v208);
          bool v210 = true;
          int v211 = 192;
          int v212 = v211 + v46;
          bool v213 = true;
          int v214 = simt_wave_count_bits(v213);
          v44[v212] = v214;
          v180 = v209;
          break;
        }
      }
      bool v215 = true;
      int v216 = 208;
      int v217 = v216 + v46;
      bool v218 = true;
      int v219 = simt_wave_count_bits(v218);
      v44[v217] = v219;
      v108 = v180;
      break;
    }
    default:
      {
      int v220 = 76;
      int v221 = v220 + v46;
      int v222 = v45[v221];
      int v223 = 0;
      bool v224 = v222 != v223;
      int v225;
      if (v224) {
        int v226 = 0;
        int v227 = 0;
        int v228;
        int v229;
        v228 = v226;
        v229 = v227;
        while (true) {
          int v230 = 4;
          int v231 = v229 * v230;
          int v232 = v231 + v46;
          int v233 = 80;
          int v234 = v233 + v232;
          int v235 = v45[v234];
          int v236 = 0;
          bool v237 = v235 != v236;
          v228 = v228;
          v229 = v229;
          if (!v237) break;
          int v238 = v228 + v229;
          int v239 = 1;
          int v240 = v229 + v239;
          bool v241 = true;
          int v242 = 224;
          int v243 = 4;
          int v244 = v229 * v243;
          int v245 = v242 + v244;
          int v246 = v245 + v46;
          bool v247 = true;
          int v248 = simt_wave_count_bits(v247);
          v44[v246] = v248;
          v228 = v238;
          v229 = v240;
          break;
          ;
        }
        v225 = v228;
      } else {
        int v249 = 100;
        int v250 = v249 + v46;
        int v251 = v45[v250];
        uint v252 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v253 = (int)(v252);
        int v254;
        v254 = v253;
        switch (v251) {
          case 0:
            {
            int v255 = 0;
            int v256 = v46 + v255;
            v254 = v256;
          }
          default:
            {
            bool v257 = true;
            int v258 = 240;
            int v259 = v258 + v46;
            bool v260 = true;
            int v261 = simt_wave_count_bits(v260);
            v44[v259] = v261;
            v254 = v46;
            break;
          }
          case 1:
            {
            uint v262 = simt_lane_id(static_cast<int>(__simt_tid3.x));
            int v263 = (int)(v262);
            bool v264 = true;
            int v265 = 256;
            int v266 = v265 + v46;
            bool v267 = true;
            int v268 = simt_wave_count_bits(v267);
            v44[v266] = v268;
            v254 = v263;
            break;
          }
        }
        v225 = v254;
      }
      int v269 = 272;
      int v270 = v269 + v46;
      bool v271 = true;
      int v272 = simt_wave_count_bits(v271);
      v44[v270] = v272;
      bool v273 = true;
      int v274 = 288;
      int v275 = v274 + v46;
      bool v276 = true;
      int v277 = simt_wave_count_bits(v276);
      v44[v275] = v277;
      v108 = v225;
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 211; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 104; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
