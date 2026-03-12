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
    int v7 = 0;
    bool v8 = v2 != v7;
    int v9;
    if (v8) {
      int v10 = 0;
      int v11 = 0;
      int v12;
      int v13;
      v12 = v10;
      v13 = v11;
      while (true) {
        int v14 = 4;
        int v15 = v3 % v14;
        int v16 = 1;
        int v17 = v15 + v16;
        bool v18 = v13 < v17;
        v12 = v12;
        v13 = v13;
        if (!v18) break;
        int v19 = 1;
        int v20 = v13 + v19;
        v12 = v0;
        v13 = v20;
      }
      int v21 = 2;
      int v22 = v0 + v21;
      v9 = v12;
    } else {
      int v23 = 0;
      int v24 = 0;
      int v25;
      int v26;
      v25 = v23;
      v26 = v24;
      while (true) {
        int v27 = 4;
        int v28 = v3 % v27;
        int v29 = 1;
        int v30 = v28 + v29;
        bool v31 = v26 < v30;
        v25 = v25;
        v26 = v26;
        if (!v31) break;
        int v32 = 3;
        int v33 = 1;
        int v34 = v26 + v33;
        v25 = v32;
        v26 = v34;
      }
      int v35 = 2;
      int v36 = v0 + v35;
      v9 = v25;
    }
    int v37 = 2;
    int v38 = v0 + v37;
    v6 = v9;
  } else {
    int v39 = 0;
    bool v40 = v2 != v39;
    int v41;
    if (v40) {
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
        uint v51 = simt_subgroup_id(__simt_tid);
        int v52 = (int)(v51);
        int v53 = 1;
        int v54 = v45 + v53;
        v44 = v52;
        v45 = v54;
      }
      int v55 = 4;
      int v56 = v0 + v55;
      v41 = v44;
    } else {
      int v57 = 0;
      int v58 = 0;
      int v59;
      int v60;
      v59 = v57;
      v60 = v58;
      while (true) {
        int v61 = 4;
        int v62 = v3 % v61;
        int v63 = 1;
        int v64 = v62 + v63;
        bool v65 = v60 < v64;
        v59 = v59;
        v60 = v60;
        if (!v65) break;
        uint v66 = simt_lane_id(__simt_tid);
        int v67 = (int)(v66);
        int v68 = 1;
        int v69 = v60 + v68;
        v59 = v67;
        v60 = v69;
      }
      v41 = v59;
    }
    v6 = v41;
  }
  bool v70 = true;
  int v71 = simt_wave_count_bits(v70);
  int v72 = 0;
  int v73 = v72 + v0;
  v1[v73] = v71;
  return;
}

kernel void kernel_main(device int* v74 [[buffer(0)]], device int* v75 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v76 = static_cast<int>(__simt_tid3.x);
  int v77 = 0;
  int v78 = v77 + v76;
  int v79 = v75[v78];
  int v80 = 4;
  int v81 = v80 + v76;
  int v82 = v75[v81];
  helper0(v76, v74, v79, v82, static_cast<int>(__simt_tid3.x));
  int v83 = 8;
  int v84 = v83 + v76;
  int v85 = v75[v84];
  int v86 = 0;
  bool v87 = v85 != v86;
  int v88;
  if (v87) {
    int v89 = 0;
    int v90 = 0;
    int v91;
    int v92;
    v91 = v89;
    v92 = v90;
    while (true) {
      int v93 = 4;
      int v94 = v92 * v93;
      int v95 = v94 + v76;
      int v96 = 12;
      int v97 = v96 + v95;
      int v98 = v75[v97];
      int v99 = 0;
      bool v100 = v98 != v99;
      v91 = v91;
      v92 = v92;
      if (!v100) break;
      int v101 = 0;
      int v102 = 0;
      int v103;
      int v104;
      v103 = v101;
      v104 = v102;
      while (true) {
        int v105 = 4;
        int v106 = v104 * v105;
        int v107 = v106 + v76;
        int v108 = 32;
        int v109 = v108 + v107;
        int v110 = v75[v109];
        int v111 = 0;
        bool v112 = v110 != v111;
        v103 = v103;
        v104 = v104;
        if (!v112) break;
        int v113 = v103 + v104;
        int v114 = 1;
        int v115 = v104 + v114;
        v103 = v113;
        v104 = v115;
        break;
        ;
      }
      bool v116 = true;
      int v117 = v91 + v103;
      int v118 = 1;
      int v119 = v92 + v118;
      v91 = v117;
      v92 = v119;
    }
    bool v120 = true;
    v88 = v91;
  } else {
    int v121 = 0;
    int v122 = 0;
    int v123;
    int v124;
    v123 = v121;
    v124 = v122;
    while (true) {
      int v125 = 4;
      int v126 = v124 * v125;
      int v127 = v126 + v76;
      int v128 = 52;
      int v129 = v128 + v127;
      int v130 = v75[v129];
      int v131 = 0;
      bool v132 = v130 != v131;
      v123 = v123;
      v124 = v124;
      if (!v132) break;
      int v133 = 72;
      int v134 = v133 + v76;
      int v135 = v75[v134];
      int v136 = 4;
      int v137;
      v137 = v136;
      switch (v135) {
        case 0:
          {
          int v138 = 1;
          int v139 = v76 + v138;
          v137 = v139;
          break;
        }
        default:
          {
          int v140 = 3;
          int v141 = v76 + v140;
          v137 = v141;
        }
        case 1:
          {
          v137 = v76;
          break;
        }
      }
      bool v142 = true;
      int v143 = v123 + v137;
      int v144 = 1;
      int v145 = v124 + v144;
      v123 = v143;
      v124 = v145;
    }
    bool v146 = true;
    v88 = v123;
  }
  int v147 = 16;
  int v148 = v147 + v76;
  bool v149 = true;
  int v150 = simt_wave_count_bits(v149);
  v74[v148] = v150;
  int v151 = 76;
  int v152 = v151 + v76;
  int v153 = v75[v152];
  uint v154 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v155 = (int)(v154);
  int v156;
  v156 = v155;
  switch (v153) {
    case 0:
      {
      int v157 = 0;
      int v158 = 0;
      int v159;
      int v160;
      v159 = v157;
      v160 = v158;
      while (true) {
        int v161 = 4;
        int v162 = v160 * v161;
        int v163 = v162 + v76;
        int v164 = 80;
        int v165 = v164 + v163;
        int v166 = v75[v165];
        int v167 = 0;
        bool v168 = v166 != v167;
        v159 = v159;
        v160 = v160;
        if (!v168) break;
        int v169 = 100;
        int v170 = v169 + v76;
        int v171 = v75[v170];
        int v172 = 1;
        int v173;
        v173 = v172;
        switch (v171) {
          default:
            {
            int v174 = 4;
            v173 = v174;
            break;
          }
          case 0:
            {
            v173 = v76;
            break;
          }
          case 1:
            {
            int v175 = 4;
            v173 = v175;
            break;
          }
        }
        bool v176 = true;
        int v177 = v159 + v173;
        int v178 = 1;
        int v179 = v160 + v178;
        v159 = v177;
        v160 = v179;
        break;
        ;
      }
      bool v180 = true;
      v156 = v159;
      break;
    }
    default:
      {
      int v181 = 0;
      int v182 = 0;
      int v183;
      int v184;
      v183 = v181;
      v184 = v182;
      while (true) {
        int v185 = 4;
        int v186 = v184 * v185;
        int v187 = v186 + v76;
        int v188 = 104;
        int v189 = v188 + v187;
        int v190 = v75[v189];
        int v191 = 0;
        bool v192 = v190 != v191;
        v183 = v183;
        v184 = v184;
        if (!v192) break;
        int v193 = 0;
        int v194 = 0;
        int v195;
        int v196;
        v195 = v193;
        v196 = v194;
        while (true) {
          int v197 = 4;
          int v198 = v196 * v197;
          int v199 = v198 + v76;
          int v200 = 124;
          int v201 = v200 + v199;
          int v202 = v75[v201];
          int v203 = 0;
          bool v204 = v202 != v203;
          v195 = v195;
          v196 = v196;
          if (!v204) break;
          int v205 = v195 + v196;
          int v206 = 1;
          int v207 = v196 + v206;
          v195 = v205;
          v196 = v207;
        }
        bool v208 = true;
        int v209 = v183 + v195;
        int v210 = 1;
        int v211 = v184 + v210;
        v183 = v209;
        v184 = v211;
      }
      bool v212 = true;
      v156 = v183;
      break;
    }
    case 1:
      {
      int v213 = 3;
      int v214 = v76 + v213;
      v156 = v214;
      break;
    }
    case 2:
      {
      int v215 = 144;
      int v216 = v215 + v76;
      int v217 = v75[v216];
      int v218 = 0;
      bool v219 = v217 != v218;
      int v220;
      if (v219) {
        int v221 = 1;
        int v222 = v76 + v221;
        v220 = v222;
      } else {
        int v223 = 148;
        int v224 = v223 + v76;
        int v225 = v75[v224];
        int v226 = 1;
        int v227;
        v227 = v226;
        switch (v225) {
          case 0:
            {
            int v228 = 4;
            int v229 = v76 + v228;
            v227 = v229;
            break;
          }
          case 1:
            {
            int v230 = 4;
            v227 = v230;
            break;
          }
          case 2:
            {
            int v231 = 2;
            v227 = v231;
            break;
          }
          default:
            {
            v227 = v76;
            break;
          }
        }
        bool v232 = true;
        v220 = v227;
      }
      v156 = v220;
      break;
    }
  }
  bool v233 = true;
  int v234 = 32;
  int v235 = v234 + v76;
  bool v236 = true;
  int v237 = simt_wave_count_bits(v236);
  v74[v235] = v237;
  int v238 = 152;
  int v239 = v238 + v76;
  int v240 = v75[v239];
  int v241;
  v241 = v76;
  switch (v240) {
    default:
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
        int v248 = v247 + v76;
        int v249 = 156;
        int v250 = v249 + v248;
        int v251 = v75[v250];
        int v252 = 0;
        bool v253 = v251 != v252;
        v244 = v244;
        v245 = v245;
        if (!v253) break;
        int v254 = 2;
        int v255 = v244 + v254;
        int v256 = 1;
        int v257 = v245 + v256;
        v244 = v255;
        v245 = v257;
      }
      bool v258 = true;
      v241 = v244;
    }
    case 0:
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
        int v265 = v264 + v76;
        int v266 = 176;
        int v267 = v266 + v265;
        int v268 = v75[v267];
        int v269 = 0;
        bool v270 = v268 != v269;
        v261 = v261;
        v262 = v262;
        if (!v270) break;
        int v271 = v261 + v76;
        int v272 = 1;
        int v273 = v262 + v272;
        v261 = v271;
        v262 = v273;
      }
      bool v274 = true;
      v241 = v261;
      break;
    }
    case 1:
      {
      int v275 = 2;
      int v276 = v76 + v275;
      v241 = v276;
      break;
    }
  }
  bool v277 = true;
  int v278 = 48;
  int v279 = v278 + v76;
  bool v280 = true;
  int v281 = simt_wave_count_bits(v280);
  v74[v279] = v281;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 196; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
