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
  uint v4 = simt_lane_id(__simt_tid);
  int v5 = (int)(v4);
  int v6 = 0;
  bool v7 = v2 != v6;
  int v8;
  if (v7) {
    int v9 = 0;
    bool v10 = v2 != v9;
    int v11;
    if (v10) {
      int v12 = 2;
      int v13 = v3 % v12;
      int v14;
      v14 = v0;
      switch (v13) {
        default:
          {
          int v15 = 1;
          int v16 = v0 + v15;
          v14 = v16;
          break;
        }
        case 0:
          {
          int v17 = 0;
          int v18 = v0 + v17;
          v14 = v18;
          break;
        }
      }
      uint v19 = simt_subgroup_id(__simt_tid);
      int v20 = (int)(v19);
      v11 = v14;
    } else {
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
        uint v30 = simt_lane_id(__simt_tid);
        int v31 = (int)(v30);
        int v32 = 1;
        int v33 = v24 + v32;
        v23 = v31;
        v24 = v33;
        continue;
        ;
      }
      int v34 = 3;
      v11 = v23;
    }
    uint v35 = simt_lane_id(__simt_tid);
    int v36 = (int)(v35);
    v8 = v11;
  } else {
    int v37 = 2;
    int v38 = v3 % v37;
    int v39;
    v39 = v0;
    switch (v38) {
      case 0:
        {
        int v40 = 0;
        bool v41 = v2 != v40;
        int v42;
        if (v41) {
          int v43 = 3;
          v42 = v43;
        } else {
          int v44 = 2;
          v42 = v44;
        }
        v39 = v42;
      }
      default:
        {
        v39 = v0;
        break;
      }
    }
    v8 = v39;
  }
  bool v45 = true;
  int v46 = simt_wave_count_bits(v45);
  int v47 = 0;
  int v48 = v47 + v0;
  v1[v48] = v46;
  int v49 = 0;
  bool v50 = v2 != v49;
  int v51 = v50 ? v5 : v8;
  return;
}

kernel void kernel_main(device int* v52 [[buffer(0)]], device int* v53 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v54 = static_cast<int>(__simt_tid3.x);
  int v55 = 0;
  int v56 = v55 + v54;
  int v57 = v53[v56];
  int v58 = 4;
  int v59 = v58 + v54;
  int v60 = v53[v59];
  helper0(v54, v52, v57, v60, static_cast<int>(__simt_tid3.x));
  int v61 = 8;
  int v62 = v61 + v54;
  int v63 = v53[v62];
  int v64 = 0;
  bool v65 = v63 != v64;
  int v66;
  if (v65) {
    int v67 = 12;
    int v68 = v67 + v54;
    int v69 = v53[v68];
    int v70 = 0;
    int v71;
    v71 = v70;
    switch (v69) {
      case 0:
        {
        v71 = v54;
        break;
      }
      default:
        {
        int v72 = 0;
        int v73 = 0;
        int v74;
        int v75;
        v74 = v72;
        v75 = v73;
        while (true) {
          int v76 = 4;
          int v77 = v75 * v76;
          int v78 = v77 + v54;
          int v79 = 16;
          int v80 = v79 + v78;
          int v81 = v53[v80];
          int v82 = 0;
          bool v83 = v81 != v82;
          v74 = v74;
          v75 = v75;
          if (!v83) break;
          int v84 = v74 + v75;
          int v85 = 1;
          int v86 = v75 + v85;
          v74 = v84;
          v75 = v86;
        }
        bool v87 = true;
        v71 = v74;
        break;
      }
      case 1:
        {
        int v88 = 36;
        int v89 = v88 + v54;
        int v90 = v53[v89];
        int v91 = 2;
        int v92 = v54 + v91;
        int v93;
        v93 = v92;
        switch (v90) {
          case 0:
            {
            int v94 = 1;
            int v95 = v54 + v94;
            v93 = v95;
          }
          case 1:
            {
            v93 = v54;
          }
          default:
            {
            v93 = v54;
          }
          case 2:
            {
            v93 = v54;
            break;
          }
        }
        bool v96 = true;
        v71 = v93;
        break;
      }
    }
    bool v97 = true;
    v66 = v71;
  } else {
    int v98 = 40;
    int v99 = v98 + v54;
    int v100 = v53[v99];
    uint v101 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v102 = (int)(v101);
    int v103;
    v103 = v102;
    switch (v100) {
      case 0:
        {
        int v104 = 0;
        int v105 = 0;
        int v106;
        int v107;
        v106 = v104;
        v107 = v105;
        while (true) {
          int v108 = 4;
          int v109 = v107 * v108;
          int v110 = v109 + v54;
          int v111 = 44;
          int v112 = v111 + v110;
          int v113 = v53[v112];
          int v114 = 0;
          bool v115 = v113 != v114;
          v106 = v106;
          v107 = v107;
          if (!v115) break;
          int v116 = v106 + v107;
          int v117 = 1;
          int v118 = v107 + v117;
          v106 = v116;
          v107 = v118;
          break;
          ;
        }
        bool v119 = true;
        v103 = v106;
        break;
      }
      case 1:
        {
        int v120 = 0;
        v103 = v120;
        break;
      }
      default:
        {
        int v121 = 64;
        int v122 = v121 + v54;
        int v123 = v53[v122];
        int v124 = 4;
        int v125 = v54 + v124;
        int v126;
        v126 = v125;
        switch (v123) {
          default:
            {
            int v127 = 0;
            v126 = v127;
            break;
          }
          case 0:
            {
            v126 = v54;
            break;
          }
        }
        bool v128 = true;
        v103 = v126;
        break;
      }
    }
    bool v129 = true;
    v66 = v103;
  }
  int v130 = 16;
  int v131 = v130 + v54;
  bool v132 = true;
  int v133 = simt_wave_count_bits(v132);
  v52[v131] = v133;
  int v134 = 68;
  int v135 = v134 + v54;
  int v136 = v53[v135];
  uint v137 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v138 = (int)(v137);
  int v139;
  v139 = v138;
  switch (v136) {
    default:
      {
      int v140 = 72;
      int v141 = v140 + v54;
      int v142 = v53[v141];
      int v143 = 2;
      int v144 = v54 + v143;
      int v145;
      v145 = v144;
      switch (v142) {
        case 0:
          {
          int v146 = 76;
          int v147 = v146 + v54;
          int v148 = v53[v147];
          int v149;
          v149 = v54;
          switch (v148) {
            case 0:
              {
              int v150 = 0;
              int v151 = v54 + v150;
              v149 = v151;
              break;
            }
            case 1:
              {
              v149 = v54;
              break;
            }
            case 2:
              {
              int v152 = 1;
              int v153 = v54 + v152;
              v149 = v153;
            }
            default:
              {
              v149 = v54;
              break;
            }
          }
          bool v154 = true;
          v145 = v149;
          break;
        }
        default:
          {
          int v155 = 3;
          v145 = v155;
        }
        case 1:
          {
          v145 = v54;
        }
        case 2:
          {
          v145 = v54;
          break;
        }
      }
      bool v156 = true;
      v139 = v145;
      break;
    }
    case 0:
      {
      int v157 = 2;
      int v158 = v54 + v157;
      v139 = v158;
      break;
    }
    case 1:
      {
      int v159 = 80;
      int v160 = v159 + v54;
      int v161 = v53[v160];
      int v162;
      v162 = v54;
      switch (v161) {
        default:
          {
          int v163 = 4;
          v162 = v163;
          break;
        }
        case 0:
          {
          int v164 = 84;
          int v165 = v164 + v54;
          int v166 = v53[v165];
          int v167;
          v167 = v54;
          switch (v166) {
            default:
              {
              int v168 = 0;
              int v169 = v54 + v168;
              v167 = v169;
              break;
            }
            case 0:
              {
              v167 = v54;
              break;
            }
          }
          bool v170 = true;
          v162 = v167;
          break;
        }
      }
      bool v171 = true;
      v139 = v162;
      break;
    }
  }
  bool v172 = true;
  int v173 = 32;
  int v174 = v173 + v54;
  bool v175 = true;
  int v176 = simt_wave_count_bits(v175);
  v52[v174] = v176;
  int v177 = 88;
  int v178 = v177 + v54;
  int v179 = v53[v178];
  uint v180 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v181 = (int)(v180);
  int v182;
  v182 = v181;
  switch (v179) {
    case 0:
      {
      v182 = v54;
      break;
    }
    case 1:
      {
      int v183 = 92;
      int v184 = v183 + v54;
      int v185 = v53[v184];
      int v186 = 4;
      int v187;
      v187 = v186;
      switch (v185) {
        case 0:
          {
          int v188 = 1;
          v187 = v188;
        }
        default:
          {
          int v189 = 0;
          int v190 = 0;
          int v191;
          int v192;
          v191 = v189;
          v192 = v190;
          while (true) {
            int v193 = 4;
            int v194 = v192 * v193;
            int v195 = v194 + v54;
            int v196 = 96;
            int v197 = v196 + v195;
            int v198 = v53[v197];
            int v199 = 0;
            bool v200 = v198 != v199;
            v191 = v191;
            v192 = v192;
            if (!v200) break;
            int v201 = v191 + v192;
            int v202 = 1;
            int v203 = v192 + v202;
            v191 = v201;
            v192 = v203;
          }
          bool v204 = true;
          v187 = v191;
          break;
        }
        case 1:
          {
          int v205 = 0;
          int v206 = 0;
          int v207;
          int v208;
          v207 = v205;
          v208 = v206;
          while (true) {
            int v209 = 4;
            int v210 = v208 * v209;
            int v211 = v210 + v54;
            int v212 = 116;
            int v213 = v212 + v211;
            int v214 = v53[v213];
            int v215 = 0;
            bool v216 = v214 != v215;
            v207 = v207;
            v208 = v208;
            if (!v216) break;
            int v217 = v207 + v208;
            int v218 = 1;
            int v219 = v208 + v218;
            v207 = v217;
            v208 = v219;
          }
          bool v220 = true;
          v187 = v207;
        }
        case 2:
          {
          int v221 = 2;
          v187 = v221;
          break;
        }
      }
      bool v222 = true;
      v182 = v187;
      break;
    }
    default:
      {
      int v223 = 136;
      int v224 = v223 + v54;
      int v225 = v53[v224];
      int v226 = 1;
      int v227 = v54 + v226;
      int v228;
      v228 = v227;
      switch (v225) {
        default:
          {
          int v229 = 140;
          int v230 = v229 + v54;
          int v231 = v53[v230];
          int v232 = 1;
          int v233;
          v233 = v232;
          switch (v231) {
            case 0:
              {
              int v234 = 3;
              int v235 = v54 + v234;
              v233 = v235;
            }
            case 1:
              {
              int v236 = 4;
              int v237 = v54 + v236;
              v233 = v237;
            }
            default:
              {
              v233 = v54;
              break;
            }
          }
          bool v238 = true;
          v228 = v233;
        }
        case 0:
          {
          v228 = v54;
          break;
        }
        case 1:
          {
          int v239 = 0;
          int v240 = 0;
          int v241;
          int v242;
          v241 = v239;
          v242 = v240;
          while (true) {
            int v243 = 4;
            int v244 = v242 * v243;
            int v245 = v244 + v54;
            int v246 = 144;
            int v247 = v246 + v245;
            int v248 = v53[v247];
            int v249 = 0;
            bool v250 = v248 != v249;
            v241 = v241;
            v242 = v242;
            if (!v250) break;
            int v251 = v241 + v242;
            int v252 = 1;
            int v253 = v242 + v252;
            v241 = v251;
            v242 = v253;
            continue;
            ;
          }
          bool v254 = true;
          v228 = v241;
          break;
        }
        case 2:
          {
          int v255 = 164;
          int v256 = v255 + v54;
          int v257 = v53[v256];
          int v258;
          v258 = v54;
          switch (v257) {
            case 0:
              {
              v258 = v54;
              break;
            }
            case 1:
              {
              int v259 = 1;
              v258 = v259;
            }
            default:
              {
              v258 = v54;
              break;
            }
          }
          bool v260 = true;
          v228 = v258;
          break;
        }
      }
      bool v261 = true;
      v182 = v228;
      break;
    }
    case 2:
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
        int v268 = v267 + v54;
        int v269 = 168;
        int v270 = v269 + v268;
        int v271 = v53[v270];
        int v272 = 0;
        bool v273 = v271 != v272;
        v264 = v264;
        v265 = v265;
        if (!v273) break;
        int v274 = v264 + v265;
        int v275 = 1;
        int v276 = v265 + v275;
        v264 = v274;
        v265 = v276;
      }
      bool v277 = true;
      v182 = v264;
      break;
    }
  }
  bool v278 = true;
  int v279 = 48;
  int v280 = v279 + v54;
  bool v281 = true;
  int v282 = simt_wave_count_bits(v281);
  v52[v280] = v282;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 188; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
