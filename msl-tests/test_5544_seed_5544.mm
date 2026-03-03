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
  int v4 = 4;
  int v5 = 3;
  int v6 = v3 % v5;
  int v7 = 0;
  int v8;
  v8 = v7;
  switch (v6) {
    case 0:
      {
      int v9 = 3;
      int v10 = v3 % v9;
      int v11 = 4;
      int v12 = v0 + v11;
      int v13;
      v13 = v12;
      switch (v10) {
        case 0:
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
            int v23 = 3;
            int v24 = v0 + v23;
            int v25 = 1;
            int v26 = v17 + v25;
            v16 = v24;
            v17 = v26;
          }
          int v27 = 2;
          int v28 = v0 + v27;
          v13 = v16;
        }
        default:
          {
          int v29 = 4;
          int v30 = v0 + v29;
          v13 = v30;
          break;
        }
        case 1:
          {
          int v31 = 3;
          int v32 = v3 % v31;
          int v33 = 4;
          int v34 = v0 + v33;
          int v35;
          v35 = v34;
          switch (v32) {
            case 0:
              {
              int v36 = 0;
              v35 = v36;
              break;
            }
            default:
              {
              int v37 = 3;
              int v38 = v0 + v37;
              v35 = v38;
              break;
            }
            case 1:
              {
              v35 = v0;
              break;
            }
            case 2:
              {
              int v39 = 2;
              int v40 = v0 + v39;
              v35 = v40;
              break;
            }
          }
          int v41 = 3;
          int v42 = v0 + v41;
          v13 = v35;
          break;
        }
        case 2:
          {
          int v43 = 0;
          int v44 = 0;
          int v45;
          int v46;
          v45 = v43;
          v46 = v44;
          while (true) {
            int v47 = 4;
            int v48 = v3 % v47;
            int v49 = 1;
            int v50 = v48 + v49;
            bool v51 = v46 < v50;
            v45 = v45;
            v46 = v46;
            if (!v51) break;
            int v52 = 1;
            int v53 = v0 + v52;
            int v54 = 1;
            int v55 = v46 + v54;
            v45 = v53;
            v46 = v55;
          }
          int v56 = 3;
          v13 = v45;
          break;
        }
      }
      v8 = v13;
      break;
    }
    default:
      {
      int v57 = 3;
      int v58 = v3 % v57;
      int v59 = 3;
      int v60;
      v60 = v59;
      switch (v58) {
        default:
          {
          int v61 = 4;
          int v62 = v0 + v61;
          v60 = v62;
          break;
        }
        case 0:
          {
          int v63 = 2;
          v60 = v63;
        }
        case 1:
          {
          int v64 = 0;
          bool v65 = v2 != v64;
          int v66;
          if (v65) {
            v66 = v0;
          } else {
            int v67 = 4;
            v66 = v67;
          }
          int v68 = 2;
          int v69 = v0 + v68;
          v60 = v66;
          break;
        }
        case 2:
          {
          int v70 = 0;
          bool v71 = v2 != v70;
          int v72;
          if (v71) {
            int v73 = 0;
            v72 = v73;
          } else {
            v72 = v0;
          }
          int v74 = 3;
          int v75 = v0 + v74;
          v60 = v72;
          break;
        }
      }
      int v76 = 2;
      int v77 = v0 + v76;
      v8 = v60;
      break;
    }
    case 1:
      {
      int v78 = 2;
      int v79 = v3 % v78;
      int v80;
      v80 = v0;
      switch (v79) {
        default:
          {
          int v81 = 0;
          int v82 = 0;
          int v83;
          int v84;
          v83 = v81;
          v84 = v82;
          while (true) {
            int v85 = 4;
            int v86 = v3 % v85;
            int v87 = 1;
            int v88 = v86 + v87;
            bool v89 = v84 < v88;
            v83 = v83;
            v84 = v84;
            if (!v89) break;
            int v90 = 1;
            int v91 = v84 + v90;
            v83 = v0;
            v84 = v91;
          }
          int v92 = 2;
          int v93 = v0 + v92;
          v80 = v83;
          break;
        }
        case 0:
          {
          int v94 = 2;
          int v95 = v3 % v94;
          int v96 = 2;
          int v97;
          v97 = v96;
          switch (v95) {
            default:
              {
              v97 = v0;
              break;
            }
            case 0:
              {
              int v98 = 1;
              int v99 = v0 + v98;
              v97 = v99;
              break;
            }
          }
          int v100 = 2;
          v80 = v97;
          break;
        }
        case 1:
          {
          int v101 = 0;
          int v102 = 0;
          int v103;
          int v104;
          v103 = v101;
          v104 = v102;
          while (true) {
            int v105 = 4;
            int v106 = v3 % v105;
            int v107 = 1;
            int v108 = v106 + v107;
            bool v109 = v104 < v108;
            v103 = v103;
            v104 = v104;
            if (!v109) break;
            int v110 = 4;
            int v111 = v0 + v110;
            int v112 = 1;
            int v113 = v104 + v112;
            v103 = v111;
            v104 = v113;
          }
          int v114 = 0;
          int v115 = v0 + v114;
          v80 = v103;
          break;
        }
      }
      v8 = v80;
      break;
    }
    case 2:
      {
      int v116 = 0;
      bool v117 = v2 != v116;
      int v118;
      if (v117) {
        int v119 = 0;
        int v120 = 0;
        int v121;
        int v122;
        v121 = v119;
        v122 = v120;
        while (true) {
          int v123 = 4;
          int v124 = v3 % v123;
          int v125 = 1;
          int v126 = v124 + v125;
          bool v127 = v122 < v126;
          v121 = v121;
          v122 = v122;
          if (!v127) break;
          int v128 = 1;
          int v129 = v122 + v128;
          v121 = v0;
          v122 = v129;
        }
        v118 = v121;
      } else {
        int v130 = 3;
        int v131 = v3 % v130;
        int v132 = 0;
        int v133;
        v133 = v132;
        switch (v131) {
          default:
            {
            int v134 = 1;
            int v135 = v0 + v134;
            v133 = v135;
            break;
          }
          case 0:
            {
            v133 = v0;
          }
          case 1:
            {
            v133 = v0;
            break;
          }
        }
        int v136 = 4;
        v118 = v133;
      }
      v8 = v118;
      break;
    }
  }
  bool v137 = true;
  int v138 = simt_wave_count_bits(v137);
  int v139 = 0;
  int v140 = v139 + v0;
  v1[v140] = v138;
  int v141 = 0;
  bool v142 = v2 != v141;
  int v143 = v142 ? v4 : v8;
  return;
}

kernel void kernel_main(device int* v144 [[buffer(0)]], device int* v145 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v146 = static_cast<int>(__simt_tid3.x);
  int v147 = 0;
  int v148 = v147 + v146;
  int v149 = v145[v148];
  int v150 = 4;
  int v151 = v150 + v146;
  int v152 = v145[v151];
  helper0(v146, v144, v149, v152, static_cast<int>(__simt_tid3.x));
  int v153 = 8;
  int v154 = v153 + v146;
  int v155 = v145[v154];
  int v156;
  v156 = v146;
  switch (v155) {
    case 0:
      {
      int v157 = 12;
      int v158 = v157 + v146;
      int v159 = v145[v158];
      int v160 = 1;
      int v161 = v146 + v160;
      int v162;
      v162 = v161;
      switch (v159) {
        default:
          {
          int v163 = 16;
          int v164 = v163 + v146;
          int v165 = v145[v164];
          int v166 = 1;
          int v167;
          v167 = v166;
          switch (v165) {
            default:
              {
              int v168 = 2;
              v167 = v168;
              break;
            }
            case 0:
              {
              int v169 = 1;
              int v170 = v146 + v169;
              v167 = v170;
            }
            case 1:
              {
              int v171 = 2;
              v167 = v171;
              break;
            }
          }
          bool v172 = true;
          v162 = v167;
        }
        case 0:
          {
          int v173 = 0;
          int v174 = 0;
          int v175;
          int v176;
          v175 = v173;
          v176 = v174;
          while (true) {
            int v177 = 4;
            int v178 = v176 * v177;
            int v179 = v178 + v146;
            int v180 = 20;
            int v181 = v180 + v179;
            int v182 = v145[v181];
            int v183 = 0;
            bool v184 = v182 != v183;
            v175 = v175;
            v176 = v176;
            if (!v184) break;
            int v185 = v175 + v176;
            int v186 = 1;
            int v187 = v176 + v186;
            v175 = v185;
            v176 = v187;
          }
          bool v188 = true;
          v162 = v175;
        }
        case 1:
          {
          int v189 = 40;
          int v190 = v189 + v146;
          int v191 = v145[v190];
          int v192 = 0;
          bool v193 = v191 != v192;
          int v194;
          if (v193) {
            v194 = v146;
          } else {
            int v195 = 3;
            int v196 = v146 + v195;
            v194 = v196;
          }
          v162 = v194;
          break;
        }
        case 2:
          {
          int v197 = 44;
          int v198 = v197 + v146;
          int v199 = v145[v198];
          int v200 = 0;
          bool v201 = v199 != v200;
          int v202;
          if (v201) {
            int v203 = 4;
            int v204 = v146 + v203;
            v202 = v204;
          } else {
            int v205 = 4;
            v202 = v205;
          }
          v162 = v202;
          break;
        }
      }
      bool v206 = true;
      v156 = v162;
    }
    default:
      {
      int v207 = 48;
      int v208 = v207 + v146;
      int v209 = v145[v208];
      int v210 = 0;
      bool v211 = v209 != v210;
      int v212;
      if (v211) {
        int v213 = 0;
        int v214 = 0;
        int v215;
        int v216;
        v215 = v213;
        v216 = v214;
        while (true) {
          int v217 = 4;
          int v218 = v216 * v217;
          int v219 = v218 + v146;
          int v220 = 52;
          int v221 = v220 + v219;
          int v222 = v145[v221];
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
          break;
          ;
        }
        bool v228 = true;
        v212 = v215;
      } else {
        int v229 = 0;
        int v230 = 0;
        int v231;
        int v232;
        v231 = v229;
        v232 = v230;
        while (true) {
          int v233 = 4;
          int v234 = v232 * v233;
          int v235 = v234 + v146;
          int v236 = 72;
          int v237 = v236 + v235;
          int v238 = v145[v237];
          int v239 = 0;
          bool v240 = v238 != v239;
          v231 = v231;
          v232 = v232;
          if (!v240) break;
          int v241 = v231 + v232;
          int v242 = 1;
          int v243 = v232 + v242;
          v231 = v241;
          v232 = v243;
        }
        bool v244 = true;
        v212 = v231;
      }
      v156 = v212;
    }
    case 1:
      {
      int v245 = 0;
      v156 = v245;
    }
    case 2:
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
        int v252 = v251 + v146;
        int v253 = 92;
        int v254 = v253 + v252;
        int v255 = v145[v254];
        int v256 = 0;
        bool v257 = v255 != v256;
        v248 = v248;
        v249 = v249;
        if (!v257) break;
        int v258 = v248 + v146;
        int v259 = 1;
        int v260 = v249 + v259;
        v248 = v258;
        v249 = v260;
      }
      bool v261 = true;
      v156 = v248;
      break;
    }
  }
  bool v262 = true;
  int v263 = 16;
  int v264 = v263 + v146;
  bool v265 = true;
  int v266 = simt_wave_count_bits(v265);
  v144[v264] = v266;
  int v267 = 112;
  int v268 = v267 + v146;
  int v269 = v145[v268];
  int v270 = 0;
  bool v271 = v269 != v270;
  int v272;
  if (v271) {
    int v273 = 116;
    int v274 = v273 + v146;
    int v275 = v145[v274];
    int v276 = 4;
    int v277 = v146 + v276;
    int v278;
    v278 = v277;
    switch (v275) {
      case 0:
        {
        int v279 = 2;
        v278 = v279;
        break;
      }
      default:
        {
        int v280 = 2;
        int v281 = v146 + v280;
        v278 = v281;
        break;
      }
      case 1:
        {
        v278 = v146;
        break;
      }
      case 2:
        {
        int v282 = 120;
        int v283 = v282 + v146;
        int v284 = v145[v283];
        int v285 = 4;
        int v286;
        v286 = v285;
        switch (v284) {
          default:
            {
            int v287 = 2;
            int v288 = v146 + v287;
            v286 = v288;
            break;
          }
          case 0:
            {
            v286 = v146;
            break;
          }
        }
        bool v289 = true;
        v278 = v286;
        break;
      }
    }
    bool v290 = true;
    v272 = v278;
  } else {
    int v291 = 4;
    int v292 = v146 + v291;
    v272 = v292;
  }
  int v293 = 32;
  int v294 = v293 + v146;
  bool v295 = true;
  int v296 = simt_wave_count_bits(v295);
  v144[v294] = v296;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 124; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
