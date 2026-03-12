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
  int v6 = 2;
  int v7 = v3 % v6;
  uint v8 = simt_subgroup_id(__simt_tid);
  int v9 = (int)(v8);
  int v10;
  v10 = v9;
  switch (v7) {
    case 0:
      {
      int v11 = 2;
      v10 = v11;
      break;
    }
    default:
      {
      int v12 = 0;
      int v13 = v0 + v12;
      v10 = v13;
    }
    case 1:
      {
      int v14 = 0;
      int v15 = 0;
      int v16;
      int v17;
      v16 = v14;
      v17 = v15;
      while (true) {
        int v18 = 4;
        int v19 = v3 % v18;
        int v20 = 1;
        int v21 = v19 + v20;
        bool v22 = v17 < v21;
        v16 = v16;
        v17 = v17;
        if (!v22) break;
        int v23 = 2;
        int v24 = 1;
        int v25 = v17 + v24;
        v16 = v23;
        v17 = v25;
      }
      int v26 = 2;
      v10 = v16;
      break;
    }
  }
  bool v27 = true;
  int v28 = simt_wave_count_bits(v27);
  int v29 = 0;
  int v30 = v29 + v0;
  v1[v30] = v28;
  int v31 = 0;
  bool v32 = v2 != v31;
  int v33 = v32 ? v5 : v10;
  int v34 = 0;
  bool v35 = v2 != v34;
  int v36;
  if (v35) {
    int v37 = 0;
    int v38 = 0;
    int v39;
    int v40;
    v39 = v37;
    v40 = v38;
    while (true) {
      int v41 = 4;
      int v42 = v3 % v41;
      int v43 = 1;
      int v44 = v42 + v43;
      bool v45 = v40 < v44;
      v39 = v39;
      v40 = v40;
      if (!v45) break;
      int v46 = 2;
      int v47 = v3 % v46;
      int v48 = 3;
      int v49;
      v49 = v48;
      switch (v47) {
        case 0:
          {
          v49 = v0;
          break;
        }
        default:
          {
          int v50 = 4;
          v49 = v50;
          break;
        }
        case 1:
          {
          int v51 = 2;
          v49 = v51;
          break;
        }
      }
      int v52 = 1;
      int v53 = v40 + v52;
      v39 = v49;
      v40 = v53;
    }
    v36 = v39;
  } else {
    int v54 = 0;
    bool v55 = v2 != v54;
    int v56;
    if (v55) {
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
        int v66 = 3;
        int v67 = 1;
        int v68 = v60 + v67;
        v59 = v66;
        v60 = v68;
      }
      uint v69 = simt_lane_id(__simt_tid);
      int v70 = (int)(v69);
      v56 = v59;
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
        uint v80 = simt_subgroup_id(__simt_tid);
        int v81 = (int)(v80);
        int v82 = 1;
        int v83 = v74 + v82;
        v73 = v81;
        v74 = v83;
      }
      v56 = v73;
    }
    int v84 = 3;
    v36 = v56;
  }
  bool v85 = true;
  int v86 = simt_wave_count_bits(v85);
  int v87 = 16;
  int v88 = v87 + v0;
  v1[v88] = v86;
  int v89 = 0;
  bool v90 = v2 != v89;
  int v91 = v90 ? v33 : v36;
  return;
}

kernel void kernel_main(device int* v92 [[buffer(0)]], device int* v93 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v94 = static_cast<int>(__simt_tid3.x);
  int v95 = 0;
  int v96 = v95 + v94;
  int v97 = v93[v96];
  int v98 = 4;
  int v99 = v98 + v94;
  int v100 = v93[v99];
  helper0(v94, v92, v97, v100, static_cast<int>(__simt_tid3.x));
  int v101 = 0;
  int v102 = 0;
  int v103;
  int v104;
  v103 = v101;
  v104 = v102;
  while (true) {
    int v105 = 4;
    int v106 = v104 * v105;
    int v107 = v106 + v94;
    int v108 = 8;
    int v109 = v108 + v107;
    int v110 = v93[v109];
    int v111 = 0;
    bool v112 = v110 != v111;
    v103 = v103;
    v104 = v104;
    if (!v112) break;
    int v113 = 28;
    int v114 = v113 + v94;
    int v115 = v93[v114];
    uint v116 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v117 = (int)(v116);
    int v118;
    v118 = v117;
    switch (v115) {
      default:
        {
        int v119 = 32;
        int v120 = v119 + v94;
        int v121 = v93[v120];
        int v122 = 3;
        int v123;
        v123 = v122;
        switch (v121) {
          case 0:
            {
            int v124 = 2;
            int v125 = v94 + v124;
            v123 = v125;
          }
          case 1:
            {
            int v126 = 2;
            int v127 = v94 + v126;
            v123 = v127;
            break;
          }
          case 2:
            {
            int v128 = 0;
            int v129 = v94 + v128;
            v123 = v129;
            break;
          }
          default:
            {
            v123 = v94;
            break;
          }
        }
        bool v130 = true;
        v118 = v123;
        break;
      }
      case 0:
        {
        int v131 = 1;
        int v132 = v94 + v131;
        v118 = v132;
        break;
      }
      case 1:
        {
        int v133 = 36;
        int v134 = v133 + v94;
        int v135 = v93[v134];
        int v136 = 4;
        int v137;
        v137 = v136;
        switch (v135) {
          case 0:
            {
            int v138 = 4;
            v137 = v138;
            break;
          }
          case 1:
            {
            int v139 = 3;
            int v140 = v94 + v139;
            v137 = v140;
            break;
          }
          default:
            {
            int v141 = 4;
            v137 = v141;
            break;
          }
        }
        bool v142 = true;
        v118 = v137;
        break;
      }
    }
    bool v143 = true;
    int v144 = v103 + v118;
    int v145 = 1;
    int v146 = v104 + v145;
    v103 = v144;
    v104 = v146;
    break;
    ;
  }
  bool v147 = true;
  int v148 = 32;
  int v149 = v148 + v94;
  bool v150 = true;
  int v151 = simt_wave_count_bits(v150);
  v92[v149] = v151;
  int v152 = 40;
  int v153 = v152 + v94;
  int v154 = v93[v153];
  int v155;
  v155 = v94;
  switch (v154) {
    case 0:
      {
      int v156 = 2;
      int v157 = v94 + v156;
      v155 = v157;
      break;
    }
    default:
      {
      int v158 = 44;
      int v159 = v158 + v94;
      int v160 = v93[v159];
      int v161 = 0;
      bool v162 = v160 != v161;
      int v163;
      if (v162) {
        int v164 = 48;
        int v165 = v164 + v94;
        int v166 = v93[v165];
        int v167 = 0;
        int v168 = v94 + v167;
        int v169;
        v169 = v168;
        switch (v166) {
          default:
            {
            int v170 = 0;
            v169 = v170;
          }
          case 0:
            {
            int v171 = 2;
            v169 = v171;
            break;
          }
          case 1:
            {
            int v172 = 1;
            int v173 = v94 + v172;
            v169 = v173;
          }
          case 2:
            {
            int v174 = 3;
            int v175 = v94 + v174;
            v169 = v175;
            break;
          }
        }
        bool v176 = true;
        v163 = v169;
      } else {
        int v177 = 52;
        int v178 = v177 + v94;
        int v179 = v93[v178];
        int v180 = 0;
        bool v181 = v179 != v180;
        int v182;
        if (v181) {
          int v183 = 2;
          v182 = v183;
        } else {
          int v184 = 4;
          v182 = v184;
        }
        v163 = v182;
      }
      v155 = v163;
      break;
    }
    case 1:
      {
      int v185 = 56;
      int v186 = v185 + v94;
      int v187 = v93[v186];
      int v188;
      v188 = v94;
      switch (v187) {
        default:
          {
          int v189 = 60;
          int v190 = v189 + v94;
          int v191 = v93[v190];
          int v192 = 0;
          int v193;
          v193 = v192;
          switch (v191) {
            default:
              {
              int v194 = 1;
              v193 = v194;
            }
            case 0:
              {
              int v195 = 3;
              v193 = v195;
              break;
            }
          }
          bool v196 = true;
          v188 = v193;
          break;
        }
        case 0:
          {
          int v197 = 64;
          int v198 = v197 + v94;
          int v199 = v93[v198];
          int v200;
          v200 = v94;
          switch (v199) {
            default:
              {
              int v201 = 1;
              v200 = v201;
              break;
            }
            case 0:
              {
              v200 = v94;
              break;
            }
            case 1:
              {
              int v202 = 2;
              int v203 = v94 + v202;
              v200 = v203;
              break;
            }
            case 2:
              {
              v200 = v94;
              break;
            }
          }
          bool v204 = true;
          v188 = v200;
          break;
        }
        case 1:
          {
          int v205 = 68;
          int v206 = v205 + v94;
          int v207 = v93[v206];
          int v208 = 0;
          bool v209 = v207 != v208;
          int v210;
          if (v209) {
            int v211 = 1;
            int v212 = v94 + v211;
            v210 = v212;
          } else {
            v210 = v94;
          }
          v188 = v210;
          break;
        }
        case 2:
          {
          int v213 = 0;
          int v214 = 0;
          int v215;
          int v216;
          v215 = v213;
          v216 = v214;
          while (true) {
            int v217 = 4;
            int v218 = v216 * v217;
            int v219 = v218 + v94;
            int v220 = 72;
            int v221 = v220 + v219;
            int v222 = v93[v221];
            int v223 = 0;
            bool v224 = v222 != v223;
            v215 = v215;
            v216 = v216;
            if (!v224) break;
            int v225 = v215 + v216;
            int v226 = 1;
            int v227 = v216 + v226;
            v215 = v225;
            v216 = v227;
            continue;
            ;
          }
          bool v228 = true;
          v188 = v215;
          break;
        }
      }
      bool v229 = true;
      v155 = v188;
      break;
    }
  }
  bool v230 = true;
  int v231 = 48;
  int v232 = v231 + v94;
  bool v233 = true;
  int v234 = simt_wave_count_bits(v233);
  v92[v232] = v234;
  int v235 = 92;
  int v236 = v235 + v94;
  int v237 = v93[v236];
  int v238 = 0;
  bool v239 = v237 != v238;
  int v240;
  if (v239) {
    int v241 = 0;
    int v242 = 0;
    int v243;
    int v244;
    v243 = v241;
    v244 = v242;
    while (true) {
      int v245 = 4;
      int v246 = v244 * v245;
      int v247 = v246 + v94;
      int v248 = 96;
      int v249 = v248 + v247;
      int v250 = v93[v249];
      int v251 = 0;
      bool v252 = v250 != v251;
      v243 = v243;
      v244 = v244;
      if (!v252) break;
      int v253 = 0;
      int v254 = 0;
      int v255;
      int v256;
      v255 = v253;
      v256 = v254;
      while (true) {
        int v257 = 4;
        int v258 = v256 * v257;
        int v259 = v258 + v94;
        int v260 = 116;
        int v261 = v260 + v259;
        int v262 = v93[v261];
        int v263 = 0;
        bool v264 = v262 != v263;
        v255 = v255;
        v256 = v256;
        if (!v264) break;
        int v265 = v255 + v256;
        int v266 = 1;
        int v267 = v256 + v266;
        v255 = v265;
        v256 = v267;
        continue;
        ;
      }
      bool v268 = true;
      int v269 = v243 + v255;
      int v270 = 1;
      int v271 = v244 + v270;
      v243 = v269;
      v244 = v271;
    }
    bool v272 = true;
    v240 = v243;
  } else {
    uint v273 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v274 = (int)(v273);
    v240 = v274;
  }
  int v275 = 64;
  int v276 = v275 + v94;
  bool v277 = true;
  int v278 = simt_wave_count_bits(v277);
  v92[v276] = v278;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 136; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
