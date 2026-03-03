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
    int v8 = 0;
    int v9;
    int v10;
    v9 = v7;
    v10 = v8;
    while (true) {
      int v11 = 4;
      int v12 = v3 % v11;
      int v13 = 1;
      int v14 = v12 + v13;
      bool v15 = v10 < v14;
      v9 = v9;
      v10 = v10;
      if (!v15) break;
      int v16 = 4;
      int v17 = v0 + v16;
      int v18 = 1;
      int v19 = v10 + v18;
      v9 = v17;
      v10 = v19;
    }
    int v20 = 3;
    int v21 = v0 + v20;
    v6 = v9;
  } else {
    uint v22 = simt_subgroup_id(__simt_tid);
    int v23 = (int)(v22);
    v6 = v23;
  }
  bool v24 = true;
  int v25 = simt_wave_count_bits(v24);
  int v26 = 0;
  int v27 = v26 + v0;
  v1[v27] = v25;
  int v28 = 0;
  int v29 = 0;
  int v30;
  int v31;
  v30 = v28;
  v31 = v29;
  while (true) {
    int v32 = 4;
    int v33 = v3 % v32;
    int v34 = 1;
    int v35 = v33 + v34;
    bool v36 = v31 < v35;
    v30 = v30;
    v31 = v31;
    if (!v36) break;
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
      int v46 = 0;
      int v47 = 0;
      int v48;
      int v49;
      v48 = v46;
      v49 = v47;
      while (true) {
        int v50 = 4;
        int v51 = v3 % v50;
        int v52 = 1;
        int v53 = v51 + v52;
        bool v54 = v49 < v53;
        v48 = v48;
        v49 = v49;
        if (!v54) break;
        int v55 = 3;
        int v56 = v0 + v55;
        int v57 = 1;
        int v58 = v49 + v57;
        v48 = v56;
        v49 = v58;
      }
      int v59 = 0;
      int v60 = v0 + v59;
      int v61 = 1;
      int v62 = v40 + v61;
      v39 = v48;
      v40 = v62;
    }
    int v63 = 1;
    int v64 = v31 + v63;
    v30 = v39;
    v31 = v64;
  }
  bool v65 = true;
  int v66 = simt_wave_count_bits(v65);
  int v67 = 16;
  int v68 = v67 + v0;
  v1[v68] = v66;
  int v69 = 0;
  bool v70 = v2 != v69;
  int v71 = v70 ? v6 : v30;
  return;
}

kernel void kernel_main(device int* v72 [[buffer(0)]], device int* v73 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v74 = static_cast<int>(__simt_tid3.x);
  int v75 = 0;
  int v76 = v75 + v74;
  int v77 = v73[v76];
  int v78 = 4;
  int v79 = v78 + v74;
  int v80 = v73[v79];
  helper0(v74, v72, v77, v80, static_cast<int>(__simt_tid3.x));
  int v81 = 8;
  int v82 = v81 + v74;
  int v83 = v73[v82];
  int v84 = 0;
  bool v85 = v83 != v84;
  int v86;
  if (v85) {
    int v87 = 12;
    int v88 = v87 + v74;
    int v89 = v73[v88];
    int v90 = 0;
    bool v91 = v89 != v90;
    int v92;
    if (v91) {
      uint v93 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v94 = (int)(v93);
      v92 = v94;
    } else {
      uint v95 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v96 = (int)(v95);
      v92 = v96;
    }
    v86 = v92;
  } else {
    int v97 = 16;
    int v98 = v97 + v74;
    int v99 = v73[v98];
    int v100 = 1;
    int v101 = v74 + v100;
    int v102;
    v102 = v101;
    switch (v99) {
      case 0:
        {
        int v103 = 20;
        int v104 = v103 + v74;
        int v105 = v73[v104];
        int v106 = 0;
        bool v107 = v105 != v106;
        int v108;
        if (v107) {
          v108 = v74;
        } else {
          int v109 = 4;
          v108 = v109;
        }
        v102 = v108;
        break;
      }
      default:
        {
        int v110 = 0;
        v102 = v110;
        break;
      }
      case 1:
        {
        int v111 = 24;
        int v112 = v111 + v74;
        int v113 = v73[v112];
        int v114 = 0;
        bool v115 = v113 != v114;
        int v116;
        if (v115) {
          v116 = v74;
        } else {
          int v117 = 1;
          v116 = v117;
        }
        v102 = v116;
        break;
      }
      case 2:
        {
        int v118 = 0;
        int v119 = 0;
        int v120;
        int v121;
        v120 = v118;
        v121 = v119;
        while (true) {
          int v122 = 4;
          int v123 = v121 * v122;
          int v124 = v123 + v74;
          int v125 = 28;
          int v126 = v125 + v124;
          int v127 = v73[v126];
          int v128 = 0;
          bool v129 = v127 != v128;
          v120 = v120;
          v121 = v121;
          if (!v129) break;
          int v130 = v120 + v121;
          int v131 = 1;
          int v132 = v121 + v131;
          v120 = v130;
          v121 = v132;
        }
        bool v133 = true;
        v102 = v120;
        break;
      }
    }
    bool v134 = true;
    v86 = v102;
  }
  int v135 = 32;
  int v136 = v135 + v74;
  bool v137 = true;
  int v138 = simt_wave_count_bits(v137);
  v72[v136] = v138;
  int v139 = 48;
  int v140 = v139 + v74;
  int v141 = v73[v140];
  int v142 = 0;
  bool v143 = v141 != v142;
  int v144;
  if (v143) {
    int v145 = 52;
    int v146 = v145 + v74;
    int v147 = v73[v146];
    uint v148 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v149 = (int)(v148);
    int v150;
    v150 = v149;
    switch (v147) {
      case 0:
        {
        int v151 = 56;
        int v152 = v151 + v74;
        int v153 = v73[v152];
        int v154 = 0;
        int v155 = v74 + v154;
        int v156;
        v156 = v155;
        switch (v153) {
          default:
            {
            int v157 = 0;
            int v158 = v74 + v157;
            v156 = v158;
            break;
          }
          case 0:
            {
            v156 = v74;
            break;
          }
          case 1:
            {
            v156 = v74;
            break;
          }
          case 2:
            {
            v156 = v74;
            break;
          }
        }
        bool v159 = true;
        v150 = v156;
        break;
      }
      default:
        {
        int v160 = 60;
        int v161 = v160 + v74;
        int v162 = v73[v161];
        int v163;
        v163 = v74;
        switch (v162) {
          case 0:
            {
            v163 = v74;
            break;
          }
          case 1:
            {
            v163 = v74;
            break;
          }
          case 2:
            {
            int v164 = 1;
            int v165 = v74 + v164;
            v163 = v165;
            break;
          }
          default:
            {
            int v166 = 3;
            v163 = v166;
            break;
          }
        }
        bool v167 = true;
        v150 = v163;
        break;
      }
    }
    bool v168 = true;
    v144 = v150;
  } else {
    int v169 = 0;
    int v170 = 0;
    int v171;
    int v172;
    v171 = v169;
    v172 = v170;
    while (true) {
      int v173 = 4;
      int v174 = v172 * v173;
      int v175 = v174 + v74;
      int v176 = 64;
      int v177 = v176 + v175;
      int v178 = v73[v177];
      int v179 = 0;
      bool v180 = v178 != v179;
      v171 = v171;
      v172 = v172;
      if (!v180) break;
      int v181 = v171 + v172;
      int v182 = 1;
      int v183 = v172 + v182;
      v171 = v181;
      v172 = v183;
    }
    bool v184 = true;
    v144 = v171;
  }
  int v185 = 48;
  int v186 = v185 + v74;
  bool v187 = true;
  int v188 = simt_wave_count_bits(v187);
  v72[v186] = v188;
  int v189 = 84;
  int v190 = v189 + v74;
  int v191 = v73[v190];
  uint v192 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v193 = (int)(v192);
  int v194;
  v194 = v193;
  switch (v191) {
    case 0:
      {
      int v195 = 0;
      int v196 = 0;
      int v197;
      int v198;
      v197 = v195;
      v198 = v196;
      while (true) {
        int v199 = 4;
        int v200 = v198 * v199;
        int v201 = v200 + v74;
        int v202 = 88;
        int v203 = v202 + v201;
        int v204 = v73[v203];
        int v205 = 0;
        bool v206 = v204 != v205;
        v197 = v197;
        v198 = v198;
        if (!v206) break;
        int v207 = 0;
        int v208 = 0;
        int v209;
        int v210;
        v209 = v207;
        v210 = v208;
        while (true) {
          int v211 = 4;
          int v212 = v210 * v211;
          int v213 = v212 + v74;
          int v214 = 108;
          int v215 = v214 + v213;
          int v216 = v73[v215];
          int v217 = 0;
          bool v218 = v216 != v217;
          v209 = v209;
          v210 = v210;
          if (!v218) break;
          int v219 = v209 + v210;
          int v220 = 1;
          int v221 = v210 + v220;
          v209 = v219;
          v210 = v221;
          break;
          ;
        }
        bool v222 = true;
        int v223 = v197 + v209;
        int v224 = 1;
        int v225 = v198 + v224;
        v197 = v223;
        v198 = v225;
      }
      bool v226 = true;
      v194 = v197;
      break;
    }
    default:
      {
      int v227 = 0;
      int v228 = 0;
      int v229;
      int v230;
      v229 = v227;
      v230 = v228;
      while (true) {
        int v231 = 4;
        int v232 = v230 * v231;
        int v233 = v232 + v74;
        int v234 = 128;
        int v235 = v234 + v233;
        int v236 = v73[v235];
        int v237 = 0;
        bool v238 = v236 != v237;
        v229 = v229;
        v230 = v230;
        if (!v238) break;
        int v239 = v229 + v230;
        int v240 = 1;
        int v241 = v230 + v240;
        v229 = v239;
        v230 = v241;
        continue;
        ;
      }
      bool v242 = true;
      v194 = v229;
      break;
    }
    case 1:
      {
      int v243 = 148;
      int v244 = v243 + v74;
      int v245 = v73[v244];
      int v246 = 0;
      bool v247 = v245 != v246;
      int v248;
      if (v247) {
        int v249 = 0;
        int v250 = 0;
        int v251;
        int v252;
        v251 = v249;
        v252 = v250;
        while (true) {
          int v253 = 4;
          int v254 = v252 * v253;
          int v255 = v254 + v74;
          int v256 = 152;
          int v257 = v256 + v255;
          int v258 = v73[v257];
          int v259 = 0;
          bool v260 = v258 != v259;
          v251 = v251;
          v252 = v252;
          if (!v260) break;
          int v261 = v251 + v252;
          int v262 = 1;
          int v263 = v252 + v262;
          v251 = v261;
          v252 = v263;
        }
        bool v264 = true;
        v248 = v251;
      } else {
        int v265 = 172;
        int v266 = v265 + v74;
        int v267 = v73[v266];
        int v268 = 0;
        bool v269 = v267 != v268;
        int v270;
        if (v269) {
          v270 = v74;
        } else {
          int v271 = 1;
          v270 = v271;
        }
        v248 = v270;
      }
      v194 = v248;
      break;
    }
  }
  bool v272 = true;
  int v273 = 64;
  int v274 = v273 + v74;
  bool v275 = true;
  int v276 = simt_wave_count_bits(v275);
  v72[v274] = v276;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 176; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
