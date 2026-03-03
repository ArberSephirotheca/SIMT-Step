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
    v6 = v0;
  } else {
    v6 = v0;
  }
  bool v7 = true;
  int v8 = simt_wave_count_bits(v7);
  int v9 = 0;
  int v10 = v9 + v0;
  v1[v10] = v8;
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
    int v20 = 3;
    int v21 = 1;
    int v22 = v14 + v21;
    v13 = v20;
    v14 = v22;
  }
  bool v23 = true;
  int v24 = simt_wave_count_bits(v23);
  int v25 = 16;
  int v26 = v25 + v0;
  v1[v26] = v24;
  int v27 = 0;
  bool v28 = v2 != v27;
  int v29 = v28 ? v6 : v13;
  int v30 = 0;
  bool v31 = v2 != v30;
  int v32;
  if (v31) {
    int v33 = 0;
    bool v34 = v2 != v33;
    int v35;
    if (v34) {
      int v36 = 0;
      int v37 = 0;
      int v38;
      int v39;
      v38 = v36;
      v39 = v37;
      while (true) {
        int v40 = 4;
        int v41 = v3 % v40;
        int v42 = 1;
        int v43 = v41 + v42;
        bool v44 = v39 < v43;
        v38 = v38;
        v39 = v39;
        if (!v44) break;
        int v45 = 1;
        int v46 = v39 + v45;
        v38 = v0;
        v39 = v46;
      }
      uint v47 = simt_lane_id(__simt_tid);
      int v48 = (int)(v47);
      v35 = v38;
    } else {
      int v49 = 3;
      int v50 = v3 % v49;
      int v51;
      v51 = v0;
      switch (v50) {
        case 0:
          {
          int v52 = 1;
          int v53 = v0 + v52;
          v51 = v53;
          break;
        }
        case 1:
          {
          int v54 = 2;
          v51 = v54;
          break;
        }
        default:
          {
          int v55 = 0;
          v51 = v55;
          break;
        }
        case 2:
          {
          int v56 = 2;
          int v57 = v0 + v56;
          v51 = v57;
          break;
        }
      }
      int v58 = 4;
      int v59 = v0 + v58;
      v35 = v51;
    }
    v32 = v35;
  } else {
    uint v60 = simt_lane_id(__simt_tid);
    int v61 = (int)(v60);
    v32 = v61;
  }
  bool v62 = true;
  int v63 = simt_wave_count_bits(v62);
  int v64 = 32;
  int v65 = v64 + v0;
  v1[v65] = v63;
  int v66 = 0;
  bool v67 = v2 != v66;
  int v68 = v67 ? v29 : v32;
  return;
}

kernel void kernel_main(device int* v69 [[buffer(0)]], device int* v70 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v71 = static_cast<int>(__simt_tid3.x);
  int v72 = 0;
  int v73 = v72 + v71;
  int v74 = v70[v73];
  int v75 = 4;
  int v76 = v75 + v71;
  int v77 = v70[v76];
  helper0(v71, v69, v74, v77, static_cast<int>(__simt_tid3.x));
  int v78 = 8;
  int v79 = v78 + v71;
  int v80 = v70[v79];
  uint v81 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v82 = (int)(v81);
  int v83;
  v83 = v82;
  switch (v80) {
    case 0:
      {
      int v84 = 12;
      int v85 = v84 + v71;
      int v86 = v70[v85];
      int v87;
      v87 = v71;
      switch (v86) {
        default:
          {
          int v88 = 4;
          v87 = v88;
          break;
        }
        case 0:
          {
          int v89 = 16;
          int v90 = v89 + v71;
          int v91 = v70[v90];
          int v92 = 3;
          int v93 = v71 + v92;
          int v94;
          v94 = v93;
          switch (v91) {
            default:
              {
              v94 = v71;
              break;
            }
            case 0:
              {
              v94 = v71;
              break;
            }
          }
          bool v95 = true;
          v87 = v94;
          break;
        }
        case 1:
          {
          int v96 = 20;
          int v97 = v96 + v71;
          int v98 = v70[v97];
          int v99 = 0;
          bool v100 = v98 != v99;
          int v101;
          if (v100) {
            int v102 = 3;
            v101 = v102;
          } else {
            int v103 = 4;
            v101 = v103;
          }
          v87 = v101;
          break;
        }
      }
      bool v104 = true;
      v83 = v87;
    }
    default:
      {
      int v105 = 24;
      int v106 = v105 + v71;
      int v107 = v70[v106];
      int v108 = 0;
      bool v109 = v107 != v108;
      int v110;
      if (v109) {
        int v111 = 0;
        int v112 = 0;
        int v113;
        int v114;
        v113 = v111;
        v114 = v112;
        while (true) {
          int v115 = 4;
          int v116 = v114 * v115;
          int v117 = v116 + v71;
          int v118 = 28;
          int v119 = v118 + v117;
          int v120 = v70[v119];
          int v121 = 0;
          bool v122 = v120 != v121;
          v113 = v113;
          v114 = v114;
          if (!v122) break;
          int v123 = v113 + v114;
          int v124 = 1;
          int v125 = v114 + v124;
          v113 = v123;
          v114 = v125;
          continue;
          ;
        }
        bool v126 = true;
        v110 = v113;
      } else {
        int v127 = 0;
        int v128 = 0;
        int v129;
        int v130;
        v129 = v127;
        v130 = v128;
        while (true) {
          int v131 = 4;
          int v132 = v130 * v131;
          int v133 = v132 + v71;
          int v134 = 48;
          int v135 = v134 + v133;
          int v136 = v70[v135];
          int v137 = 0;
          bool v138 = v136 != v137;
          v129 = v129;
          v130 = v130;
          if (!v138) break;
          int v139 = v129 + v130;
          int v140 = 1;
          int v141 = v130 + v140;
          v129 = v139;
          v130 = v141;
        }
        bool v142 = true;
        v110 = v129;
      }
      v83 = v110;
      break;
    }
    case 1:
      {
      int v143 = 68;
      int v144 = v143 + v71;
      int v145 = v70[v144];
      int v146 = 0;
      bool v147 = v145 != v146;
      int v148;
      if (v147) {
        int v149 = 72;
        int v150 = v149 + v71;
        int v151 = v70[v150];
        int v152 = 0;
        bool v153 = v151 != v152;
        int v154;
        if (v153) {
          int v155 = 0;
          int v156 = v71 + v155;
          v154 = v156;
        } else {
          int v157 = 0;
          int v158 = v71 + v157;
          v154 = v158;
        }
        v148 = v154;
      } else {
        v148 = v71;
      }
      v83 = v148;
      break;
    }
  }
  bool v159 = true;
  int v160 = 48;
  int v161 = v160 + v71;
  bool v162 = true;
  int v163 = simt_wave_count_bits(v162);
  v69[v161] = v163;
  int v164 = 76;
  int v165 = v164 + v71;
  int v166 = v70[v165];
  int v167 = 0;
  bool v168 = v166 != v167;
  int v169;
  if (v168) {
    int v170 = 0;
    int v171 = 0;
    int v172;
    int v173;
    v172 = v170;
    v173 = v171;
    while (true) {
      int v174 = 4;
      int v175 = v173 * v174;
      int v176 = v175 + v71;
      int v177 = 80;
      int v178 = v177 + v176;
      int v179 = v70[v178];
      int v180 = 0;
      bool v181 = v179 != v180;
      v172 = v172;
      v173 = v173;
      if (!v181) break;
      int v182 = 0;
      int v183 = 0;
      int v184;
      int v185;
      v184 = v182;
      v185 = v183;
      while (true) {
        int v186 = 4;
        int v187 = v185 * v186;
        int v188 = v187 + v71;
        int v189 = 100;
        int v190 = v189 + v188;
        int v191 = v70[v190];
        int v192 = 0;
        bool v193 = v191 != v192;
        v184 = v184;
        v185 = v185;
        if (!v193) break;
        int v194 = v184 + v185;
        int v195 = 1;
        int v196 = v185 + v195;
        v184 = v194;
        v185 = v196;
      }
      bool v197 = true;
      int v198 = v172 + v184;
      int v199 = 1;
      int v200 = v173 + v199;
      v172 = v198;
      v173 = v200;
      break;
      ;
    }
    bool v201 = true;
    v169 = v172;
  } else {
    v169 = v71;
  }
  int v202 = 64;
  int v203 = v202 + v71;
  bool v204 = true;
  int v205 = simt_wave_count_bits(v204);
  v69[v203] = v205;
  int v206 = 120;
  int v207 = v206 + v71;
  int v208 = v70[v207];
  int v209 = 0;
  bool v210 = v208 != v209;
  int v211;
  if (v210) {
    int v212 = 0;
    int v213 = 0;
    int v214;
    int v215;
    v214 = v212;
    v215 = v213;
    while (true) {
      int v216 = 4;
      int v217 = v215 * v216;
      int v218 = v217 + v71;
      int v219 = 124;
      int v220 = v219 + v218;
      int v221 = v70[v220];
      int v222 = 0;
      bool v223 = v221 != v222;
      v214 = v214;
      v215 = v215;
      if (!v223) break;
      int v224 = 144;
      int v225 = v224 + v71;
      int v226 = v70[v225];
      int v227 = 0;
      bool v228 = v226 != v227;
      int v229;
      if (v228) {
        int v230 = 3;
        int v231 = v71 + v230;
        v229 = v231;
      } else {
        int v232 = 3;
        v229 = v232;
      }
      int v233 = v214 + v229;
      int v234 = 1;
      int v235 = v215 + v234;
      v214 = v233;
      v215 = v235;
    }
    bool v236 = true;
    v211 = v214;
  } else {
    int v237 = 148;
    int v238 = v237 + v71;
    int v239 = v70[v238];
    int v240;
    v240 = v71;
    switch (v239) {
      default:
        {
        int v241 = 0;
        int v242 = 0;
        int v243;
        int v244;
        v243 = v241;
        v244 = v242;
        while (true) {
          int v245 = 4;
          int v246 = v244 * v245;
          int v247 = v246 + v71;
          int v248 = 152;
          int v249 = v248 + v247;
          int v250 = v70[v249];
          int v251 = 0;
          bool v252 = v250 != v251;
          v243 = v243;
          v244 = v244;
          if (!v252) break;
          int v253 = v243 + v244;
          int v254 = 1;
          int v255 = v244 + v254;
          v243 = v253;
          v244 = v255;
        }
        bool v256 = true;
        v240 = v243;
        break;
      }
      case 0:
        {
        int v257 = 0;
        int v258 = 0;
        int v259;
        int v260;
        v259 = v257;
        v260 = v258;
        while (true) {
          int v261 = 4;
          int v262 = v260 * v261;
          int v263 = v262 + v71;
          int v264 = 172;
          int v265 = v264 + v263;
          int v266 = v70[v265];
          int v267 = 0;
          bool v268 = v266 != v267;
          v259 = v259;
          v260 = v260;
          if (!v268) break;
          int v269 = v259 + v260;
          int v270 = 1;
          int v271 = v260 + v270;
          v259 = v269;
          v260 = v271;
          continue;
          ;
        }
        bool v272 = true;
        v240 = v259;
        break;
      }
    }
    bool v273 = true;
    v211 = v240;
  }
  int v274 = 80;
  int v275 = v274 + v71;
  bool v276 = true;
  int v277 = simt_wave_count_bits(v276);
  v69[v275] = v277;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 84; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 192; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
