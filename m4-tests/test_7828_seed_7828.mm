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
  int v8 = 0;
  int v9 = 0;
  int v10;
  int v11;
  v10 = v8;
  v11 = v9;
  while (true) {
    int v12 = 4;
    int v13 = v3 % v12;
    int v14 = 1;
    int v15 = v13 + v14;
    bool v16 = v11 < v15;
    v10 = v10;
    v11 = v11;
    if (!v16) break;
    int v17 = 0;
    int v18 = 0;
    int v19;
    int v20;
    v19 = v17;
    v20 = v18;
    while (true) {
      int v21 = 4;
      int v22 = v3 % v21;
      int v23 = 1;
      int v24 = v22 + v23;
      bool v25 = v20 < v24;
      v19 = v19;
      v20 = v20;
      if (!v25) break;
      bool v26 = true;
      int v27 = simt_wave_count_bits(v26);
      int v28 = 16;
      int v29 = 4;
      int v30 = v20 * v29;
      int v31 = v28 + v30;
      int v32 = v31 + v0;
      v1[v32] = v27;
      int v33 = 1;
      int v34 = v20 + v33;
      v19 = v27;
      v20 = v34;
    }
    int v35 = 1;
    int v36 = v11 + v35;
    v10 = v19;
    v11 = v36;
  }
  int v37 = 0;
  bool v38 = v2 != v37;
  int v39 = v38 ? v5 : v10;
  int v40 = 0;
  int v41 = 0;
  int v42;
  int v43;
  v42 = v40;
  v43 = v41;
  while (true) {
    int v44 = 4;
    int v45 = v3 % v44;
    int v46 = 1;
    int v47 = v45 + v46;
    bool v48 = v43 < v47;
    v42 = v42;
    v43 = v43;
    if (!v48) break;
    int v49 = 4;
    int v50 = v3 % v49;
    uint v51 = simt_subgroup_id(__simt_tid);
    int v52 = (int)(v51);
    int v53;
    v53 = v52;
    switch (v50) {
      case 0:
        {
        int v54 = 2;
        int v55 = v0 + v54;
        v53 = v55;
        break;
      }
      case 1:
        {
        int v56 = 0;
        int v57 = 0;
        int v58;
        int v59;
        v58 = v56;
        v59 = v57;
        while (true) {
          int v60 = 4;
          int v61 = v3 % v60;
          int v62 = 1;
          int v63 = v61 + v62;
          bool v64 = v59 < v63;
          v58 = v58;
          v59 = v59;
          if (!v64) break;
          int v65 = 1;
          int v66 = v59 + v65;
          v58 = v0;
          v59 = v66;
        }
        v53 = v58;
        break;
      }
      default:
        {
        int v67 = 0;
        bool v68 = v2 != v67;
        int v69;
        if (v68) {
          int v70 = 2;
          int v71 = v0 + v70;
          v69 = v71;
        } else {
          int v72 = 4;
          int v73 = v0 + v72;
          v69 = v73;
        }
        v53 = v69;
        break;
      }
      case 2:
        {
        int v74 = 3;
        int v75 = v3 % v74;
        int v76;
        v76 = v0;
        switch (v75) {
          case 0:
            {
            v76 = v0;
            break;
          }
          case 1:
            {
            int v77 = 4;
            int v78 = v0 + v77;
            v76 = v78;
          }
          case 2:
            {
            v76 = v0;
            break;
          }
          default:
            {
            int v79 = 4;
            v76 = v79;
            break;
          }
        }
        v53 = v76;
        break;
      }
    }
    int v80 = 1;
    int v81 = v43 + v80;
    v42 = v53;
    v43 = v81;
  }
  int v82 = 0;
  bool v83 = v2 != v82;
  int v84 = v83 ? v39 : v42;
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
  uint v97 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v98 = (int)(v97);
  int v99;
  v99 = v98;
  switch (v96) {
    default:
      {
      int v100 = 12;
      int v101 = v100 + v87;
      int v102 = v86[v101];
      int v103 = 4;
      int v104;
      v104 = v103;
      switch (v102) {
        default:
          {
          int v105 = 1;
          int v106 = v87 + v105;
          v104 = v106;
          break;
        }
        case 0:
          {
          int v107 = 16;
          int v108 = v107 + v87;
          int v109 = v86[v108];
          int v110 = 0;
          bool v111 = v109 != v110;
          int v112;
          if (v111) {
            int v113 = 3;
            v112 = v113;
          } else {
            int v114 = 1;
            int v115 = v87 + v114;
            v112 = v115;
          }
          v104 = v112;
          break;
        }
        case 1:
          {
          int v116 = 20;
          int v117 = v116 + v87;
          int v118 = v86[v117];
          int v119 = 0;
          bool v120 = v118 != v119;
          int v121;
          if (v120) {
            int v122 = 4;
            v121 = v122;
          } else {
            v121 = v87;
          }
          v104 = v121;
          break;
        }
      }
      bool v123 = true;
      v99 = v104;
      break;
    }
    case 0:
      {
      int v124 = 1;
      v99 = v124;
      break;
    }
    case 1:
      {
      int v125 = 4;
      v99 = v125;
      break;
    }
    case 2:
      {
      int v126 = 24;
      int v127 = v126 + v87;
      int v128 = v86[v127];
      int v129 = 0;
      bool v130 = v128 != v129;
      int v131;
      if (v130) {
        int v132 = 28;
        int v133 = v132 + v87;
        int v134 = v86[v133];
        int v135 = 0;
        bool v136 = v134 != v135;
        int v137;
        if (v136) {
          int v138 = 4;
          int v139 = v87 + v138;
          v137 = v139;
        } else {
          int v140 = 1;
          v137 = v140;
        }
        v131 = v137;
      } else {
        int v141 = 32;
        int v142 = v141 + v87;
        int v143 = v86[v142];
        int v144 = 0;
        bool v145 = v143 != v144;
        int v146;
        if (v145) {
          int v147 = 2;
          int v148 = v87 + v147;
          v146 = v148;
        } else {
          v146 = v87;
        }
        v131 = v146;
      }
      v99 = v131;
      break;
    }
  }
  int v149 = 36;
  int v150 = v149 + v87;
  int v151 = v86[v150];
  uint v152 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v153 = (int)(v152);
  int v154;
  v154 = v153;
  switch (v151) {
    case 0:
      {
      int v155 = 40;
      int v156 = v155 + v87;
      int v157 = v86[v156];
      int v158 = 0;
      bool v159 = v157 != v158;
      int v160;
      if (v159) {
        int v161 = 44;
        int v162 = v161 + v87;
        int v163 = v86[v162];
        int v164 = 4;
        int v165 = v87 + v164;
        int v166;
        v166 = v165;
        switch (v163) {
          case 0:
            {
            v166 = v87;
            break;
          }
          default:
            {
            v166 = v87;
            break;
          }
          case 1:
            {
            v166 = v87;
            break;
          }
        }
        bool v167 = true;
        v160 = v166;
      } else {
        int v168 = 3;
        int v169 = v87 + v168;
        v160 = v169;
      }
      v154 = v160;
      break;
    }
    default:
      {
      int v170 = 0;
      int v171 = 0;
      int v172;
      int v173;
      v172 = v170;
      v173 = v171;
      while (true) {
        int v174 = 4;
        int v175 = v173 * v174;
        int v176 = v175 + v87;
        int v177 = 48;
        int v178 = v177 + v176;
        int v179 = v86[v178];
        int v180 = 0;
        bool v181 = v179 != v180;
        v172 = v172;
        v173 = v173;
        if (!v181) break;
        int v182 = v172 + v173;
        int v183 = 1;
        int v184 = v173 + v183;
        bool v185 = true;
        v172 = v182;
        v173 = v184;
      }
      v154 = v172;
      break;
    }
    case 1:
      {
      int v186 = 68;
      int v187 = v186 + v87;
      int v188 = v86[v187];
      int v189 = 2;
      int v190 = v87 + v189;
      int v191;
      v191 = v190;
      switch (v188) {
        case 0:
          {
          int v192 = 0;
          int v193 = 0;
          int v194;
          int v195;
          v194 = v192;
          v195 = v193;
          while (true) {
            int v196 = 4;
            int v197 = v195 * v196;
            int v198 = v197 + v87;
            int v199 = 72;
            int v200 = v199 + v198;
            int v201 = v86[v200];
            int v202 = 0;
            bool v203 = v201 != v202;
            v194 = v194;
            v195 = v195;
            if (!v203) break;
            int v204 = v194 + v195;
            int v205 = 1;
            int v206 = v195 + v205;
            bool v207 = true;
            v194 = v204;
            v195 = v206;
          }
          v191 = v194;
          break;
        }
        default:
          {
          int v208 = 0;
          int v209 = 0;
          int v210;
          int v211;
          v210 = v208;
          v211 = v209;
          while (true) {
            int v212 = 4;
            int v213 = v211 * v212;
            int v214 = v213 + v87;
            int v215 = 92;
            int v216 = v215 + v214;
            int v217 = v86[v216];
            int v218 = 0;
            bool v219 = v217 != v218;
            v210 = v210;
            v211 = v211;
            if (!v219) break;
            int v220 = v210 + v211;
            int v221 = 1;
            int v222 = v211 + v221;
            bool v223 = true;
            v210 = v220;
            v211 = v222;
          }
          v191 = v210;
          break;
        }
      }
      bool v224 = true;
      v154 = v191;
      break;
    }
  }
  bool v225 = true;
  int v226 = 32;
  int v227 = v226 + v87;
  bool v228 = true;
  int v229 = simt_wave_count_bits(v228);
  v85[v227] = v229;
  int v230 = 112;
  int v231 = v230 + v87;
  int v232 = v86[v231];
  int v233;
  v233 = v87;
  switch (v232) {
    default:
      {
      int v234 = 116;
      int v235 = v234 + v87;
      int v236 = v86[v235];
      int v237 = 0;
      bool v238 = v236 != v237;
      int v239;
      if (v238) {
        int v240 = 120;
        int v241 = v240 + v87;
        int v242 = v86[v241];
        int v243 = 1;
        int v244;
        v244 = v243;
        switch (v242) {
          case 0:
            {
            int v245 = 0;
            int v246 = v87 + v245;
            v244 = v246;
          }
          case 1:
            {
            int v247 = 4;
            v244 = v247;
          }
          default:
            {
            int v248 = 2;
            v244 = v248;
            break;
          }
        }
        bool v249 = true;
        v239 = v244;
      } else {
        int v250 = 0;
        int v251 = 0;
        int v252;
        int v253;
        v252 = v250;
        v253 = v251;
        while (true) {
          int v254 = 4;
          int v255 = v253 * v254;
          int v256 = v255 + v87;
          int v257 = 124;
          int v258 = v257 + v256;
          int v259 = v86[v258];
          int v260 = 0;
          bool v261 = v259 != v260;
          v252 = v252;
          v253 = v253;
          if (!v261) break;
          int v262 = v252 + v253;
          int v263 = 1;
          int v264 = v253 + v263;
          bool v265 = true;
          v252 = v262;
          v253 = v264;
        }
        v239 = v252;
      }
      v233 = v239;
      break;
    }
    case 0:
      {
      int v266 = 0;
      int v267 = 0;
      int v268;
      int v269;
      v268 = v266;
      v269 = v267;
      while (true) {
        int v270 = 4;
        int v271 = v269 * v270;
        int v272 = v271 + v87;
        int v273 = 144;
        int v274 = v273 + v272;
        int v275 = v86[v274];
        int v276 = 0;
        bool v277 = v275 != v276;
        v268 = v268;
        v269 = v269;
        if (!v277) break;
        int v278 = 164;
        int v279 = v278 + v87;
        int v280 = v86[v279];
        int v281 = 0;
        bool v282 = v280 != v281;
        int v283;
        if (v282) {
          int v284 = 0;
          v283 = v284;
        } else {
          int v285 = 0;
          v283 = v285;
        }
        int v286 = v268 + v283;
        int v287 = 1;
        int v288 = v269 + v287;
        bool v289 = true;
        v268 = v286;
        v269 = v288;
      }
      v233 = v268;
      break;
    }
    case 1:
      {
      int v290 = 0;
      int v291 = 0;
      int v292;
      int v293;
      v292 = v290;
      v293 = v291;
      while (true) {
        int v294 = 4;
        int v295 = v293 * v294;
        int v296 = v295 + v87;
        int v297 = 168;
        int v298 = v297 + v296;
        int v299 = v86[v298];
        int v300 = 0;
        bool v301 = v299 != v300;
        v292 = v292;
        v293 = v293;
        if (!v301) break;
        int v302 = 188;
        int v303 = v302 + v87;
        int v304 = v86[v303];
        int v305;
        v305 = v87;
        switch (v304) {
          default:
            {
            int v306 = 2;
            int v307 = v87 + v306;
            v305 = v307;
          }
          case 0:
            {
            int v308 = 4;
            v305 = v308;
          }
          case 1:
            {
            int v309 = 4;
            int v310 = v87 + v309;
            v305 = v310;
            break;
          }
        }
        bool v311 = true;
        int v312 = v292 + v305;
        int v313 = 1;
        int v314 = v293 + v313;
        bool v315 = true;
        v292 = v312;
        v293 = v314;
      }
      v233 = v292;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 192; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
