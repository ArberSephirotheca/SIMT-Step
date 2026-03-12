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
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 2;
      int v10 = v3 % v9;
      int v11 = 4;
      int v12 = v0 + v11;
      int v13;
      v13 = v12;
      switch (v10) {
        case 0:
          {
          int v14 = 0;
          bool v15 = v2 != v14;
          int v16;
          if (v15) {
            int v17 = 0;
            v16 = v17;
          } else {
            int v18 = 3;
            int v19 = v0 + v18;
            v16 = v19;
          }
          int v20 = 4;
          int v21 = v0 + v20;
          v13 = v16;
        }
        case 1:
          {
          int v22 = 0;
          int v23 = v0 + v22;
          int v24;
          v24 = v23;
          switch (v3) {
            default:
              {
              int v25 = 4;
              v24 = v25;
              break;
            }
            case 0:
              {
              int v26 = 1;
              int v27 = v0 + v26;
              v24 = v27;
              break;
            }
          }
          int v28 = 1;
          int v29 = v0 + v28;
          v13 = v24;
        }
        default:
          {
          int v30 = 0;
          int v31 = 0;
          int v32;
          int v33;
          v32 = v30;
          v33 = v31;
          while (true) {
            int v34 = 4;
            int v35 = v3 % v34;
            int v36 = 1;
            int v37 = v35 + v36;
            bool v38 = v33 < v37;
            v32 = v32;
            v33 = v33;
            if (!v38) break;
            int v39 = 1;
            int v40 = v33 + v39;
            v32 = v0;
            v33 = v40;
          }
          int v41 = 3;
          int v42 = v0 + v41;
          v13 = v32;
          break;
        }
      }
      int v43 = 3;
      int v44 = v0 + v43;
      v8 = v13;
      break;
    }
    case 1:
      {
      int v45 = 0;
      bool v46 = v2 != v45;
      int v47;
      if (v46) {
        int v48 = 2;
        int v49 = v0 + v48;
        v47 = v49;
      } else {
        int v50 = 3;
        v47 = v50;
      }
      int v51 = 2;
      int v52 = v0 + v51;
      v8 = v47;
      break;
    }
    case 2:
      {
      int v53 = 0;
      bool v54 = v2 != v53;
      int v55;
      if (v54) {
        int v56 = 2;
        int v57 = v3 % v56;
        int v58 = 1;
        int v59;
        v59 = v58;
        switch (v57) {
          case 0:
            {
            int v60 = 0;
            v59 = v60;
            break;
          }
          default:
            {
            int v61 = 1;
            int v62 = v0 + v61;
            v59 = v62;
            break;
          }
        }
        v55 = v59;
      } else {
        int v63 = 4;
        v55 = v63;
      }
      int v64 = 3;
      v8 = v55;
      break;
    }
    default:
      {
      int v65 = 0;
      bool v66 = v2 != v65;
      int v67;
      if (v66) {
        int v68 = 0;
        bool v69 = v2 != v68;
        int v70;
        if (v69) {
          int v71 = 3;
          v70 = v71;
        } else {
          int v72 = 4;
          int v73 = v0 + v72;
          v70 = v73;
        }
        int v74 = 0;
        int v75 = v0 + v74;
        v67 = v70;
      } else {
        int v76 = 2;
        int v77 = v3 % v76;
        int v78;
        v78 = v0;
        switch (v77) {
          default:
            {
            int v79 = 1;
            v78 = v79;
            break;
          }
          case 0:
            {
            int v80 = 4;
            v78 = v80;
            break;
          }
        }
        int v81 = 0;
        v67 = v78;
      }
      int v82 = 4;
      int v83 = v0 + v82;
      v8 = v67;
      break;
    }
  }
  bool v84 = true;
  int v85 = simt_wave_count_bits(v84);
  int v86 = 0;
  int v87 = v86 + v0;
  v1[v87] = v85;
  return;
}

kernel void kernel_main(device int* v88 [[buffer(0)]], device int* v89 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v90 = static_cast<int>(__simt_tid3.x);
  int v91 = 0;
  int v92 = v91 + v90;
  int v93 = v89[v92];
  int v94 = 4;
  int v95 = v94 + v90;
  int v96 = v89[v95];
  helper0(v90, v88, v93, v96, static_cast<int>(__simt_tid3.x));
  int v97 = 8;
  int v98 = v97 + v90;
  int v99 = v89[v98];
  int v100 = 0;
  bool v101 = v99 != v100;
  int v102;
  if (v101) {
    int v103 = 0;
    int v104 = 0;
    int v105;
    int v106;
    v105 = v103;
    v106 = v104;
    while (true) {
      int v107 = 4;
      int v108 = v106 * v107;
      int v109 = v108 + v90;
      int v110 = 12;
      int v111 = v110 + v109;
      int v112 = v89[v111];
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
    }
    bool v118 = true;
    v102 = v105;
  } else {
    int v119 = 32;
    int v120 = v119 + v90;
    int v121 = v89[v120];
    uint v122 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v123 = (int)(v122);
    int v124;
    v124 = v123;
    switch (v121) {
      case 0:
        {
        int v125 = 36;
        int v126 = v125 + v90;
        int v127 = v89[v126];
        int v128 = 4;
        int v129;
        v129 = v128;
        switch (v127) {
          default:
            {
            int v130 = 1;
            int v131 = v90 + v130;
            v129 = v131;
          }
          case 0:
            {
            int v132 = 1;
            v129 = v132;
            break;
          }
        }
        bool v133 = true;
        v124 = v129;
        break;
      }
      default:
        {
        v124 = v90;
      }
      case 1:
        {
        int v134 = 0;
        int v135 = 0;
        int v136;
        int v137;
        v136 = v134;
        v137 = v135;
        while (true) {
          int v138 = 4;
          int v139 = v137 * v138;
          int v140 = v139 + v90;
          int v141 = 40;
          int v142 = v141 + v140;
          int v143 = v89[v142];
          int v144 = 0;
          bool v145 = v143 != v144;
          v136 = v136;
          v137 = v137;
          if (!v145) break;
          int v146 = v136 + v137;
          int v147 = 1;
          int v148 = v137 + v147;
          v136 = v146;
          v137 = v148;
        }
        bool v149 = true;
        v124 = v136;
        break;
      }
      case 2:
        {
        int v150 = 2;
        v124 = v150;
        break;
      }
    }
    bool v151 = true;
    v102 = v124;
  }
  int v152 = 16;
  int v153 = v152 + v90;
  bool v154 = true;
  int v155 = simt_wave_count_bits(v154);
  v88[v153] = v155;
  int v156 = 60;
  int v157 = v156 + v90;
  int v158 = v89[v157];
  uint v159 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v160 = (int)(v159);
  int v161;
  v161 = v160;
  switch (v158) {
    case 0:
      {
      int v162 = 0;
      int v163 = 0;
      int v164;
      int v165;
      v164 = v162;
      v165 = v163;
      while (true) {
        int v166 = 4;
        int v167 = v165 * v166;
        int v168 = v167 + v90;
        int v169 = 64;
        int v170 = v169 + v168;
        int v171 = v89[v170];
        int v172 = 0;
        bool v173 = v171 != v172;
        v164 = v164;
        v165 = v165;
        if (!v173) break;
        int v174 = 84;
        int v175 = v174 + v90;
        int v176 = v89[v175];
        int v177 = 0;
        bool v178 = v176 != v177;
        int v179;
        if (v178) {
          v179 = v90;
        } else {
          int v180 = 4;
          v179 = v180;
        }
        int v181 = v164 + v179;
        int v182 = 1;
        int v183 = v165 + v182;
        v164 = v181;
        v165 = v183;
        continue;
        ;
      }
      bool v184 = true;
      v161 = v164;
      break;
    }
    default:
      {
      int v185 = 88;
      int v186 = v185 + v90;
      int v187 = v89[v186];
      int v188 = 0;
      bool v189 = v187 != v188;
      int v190;
      if (v189) {
        int v191 = 3;
        int v192 = v90 + v191;
        v190 = v192;
      } else {
        int v193 = 4;
        v190 = v193;
      }
      v161 = v190;
      break;
    }
  }
  bool v194 = true;
  int v195 = 32;
  int v196 = v195 + v90;
  bool v197 = true;
  int v198 = simt_wave_count_bits(v197);
  v88[v196] = v198;
  int v199 = 92;
  int v200 = v199 + v90;
  int v201 = v89[v200];
  int v202;
  v202 = v90;
  switch (v201) {
    case 0:
      {
      int v203 = 0;
      v202 = v203;
    }
    default:
      {
      int v204 = 96;
      int v205 = v204 + v90;
      int v206 = v89[v205];
      int v207 = 4;
      int v208 = v90 + v207;
      int v209;
      v209 = v208;
      switch (v206) {
        case 0:
          {
          int v210 = 0;
          v209 = v210;
          break;
        }
        case 1:
          {
          int v211 = 100;
          int v212 = v211 + v90;
          int v213 = v89[v212];
          int v214 = 0;
          bool v215 = v213 != v214;
          int v216;
          if (v215) {
            v216 = v90;
          } else {
            int v217 = 4;
            int v218 = v90 + v217;
            v216 = v218;
          }
          v209 = v216;
          break;
        }
        default:
          {
          int v219 = 0;
          int v220 = 0;
          int v221;
          int v222;
          v221 = v219;
          v222 = v220;
          while (true) {
            int v223 = 4;
            int v224 = v222 * v223;
            int v225 = v224 + v90;
            int v226 = 104;
            int v227 = v226 + v225;
            int v228 = v89[v227];
            int v229 = 0;
            bool v230 = v228 != v229;
            v221 = v221;
            v222 = v222;
            if (!v230) break;
            int v231 = v221 + v222;
            int v232 = 1;
            int v233 = v222 + v232;
            v221 = v231;
            v222 = v233;
          }
          bool v234 = true;
          v209 = v221;
          break;
        }
      }
      bool v235 = true;
      v202 = v209;
      break;
    }
    case 1:
      {
      int v236 = 124;
      int v237 = v236 + v90;
      int v238 = v89[v237];
      int v239 = 3;
      int v240;
      v240 = v239;
      switch (v238) {
        case 0:
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
            int v247 = v246 + v90;
            int v248 = 128;
            int v249 = v248 + v247;
            int v250 = v89[v249];
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
            break;
            ;
          }
          bool v256 = true;
          v240 = v243;
        }
        case 1:
          {
          int v257 = 1;
          v240 = v257;
          break;
        }
        default:
          {
          int v258 = 148;
          int v259 = v258 + v90;
          int v260 = v89[v259];
          int v261;
          v261 = v90;
          switch (v260) {
            case 0:
              {
              int v262 = 1;
              int v263 = v90 + v262;
              v261 = v263;
              break;
            }
            case 1:
              {
              int v264 = 4;
              v261 = v264;
              break;
            }
            default:
              {
              v261 = v90;
              break;
            }
          }
          bool v265 = true;
          v240 = v261;
        }
        case 2:
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
            int v272 = v271 + v90;
            int v273 = 152;
            int v274 = v273 + v272;
            int v275 = v89[v274];
            int v276 = 0;
            bool v277 = v275 != v276;
            v268 = v268;
            v269 = v269;
            if (!v277) break;
            int v278 = v268 + v269;
            int v279 = 1;
            int v280 = v269 + v279;
            v268 = v278;
            v269 = v280;
          }
          bool v281 = true;
          v240 = v268;
          break;
        }
      }
      bool v282 = true;
      v202 = v240;
      break;
    }
  }
  bool v283 = true;
  int v284 = 48;
  int v285 = v284 + v90;
  bool v286 = true;
  int v287 = simt_wave_count_bits(v286);
  v88[v285] = v287;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 172; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
