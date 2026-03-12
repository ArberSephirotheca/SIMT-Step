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
    int v7;
    v7 = v0;
    switch (v3) {
      case 0:
        {
        int v8 = 0;
        bool v9 = v2 != v8;
        int v10;
        if (v9) {
          int v11 = 3;
          int v12 = v0 + v11;
          v10 = v12;
        } else {
          int v13 = 1;
          int v14 = v0 + v13;
          v10 = v14;
        }
        v7 = v10;
        break;
      }
      default:
        {
        int v15 = 2;
        int v16 = v3 % v15;
        int v17 = 2;
        int v18;
        v18 = v17;
        switch (v16) {
          case 0:
            {
            int v19 = 1;
            v18 = v19;
            break;
          }
          default:
            {
            v18 = v0;
            break;
          }
          case 1:
            {
            int v20 = 2;
            int v21 = v0 + v20;
            v18 = v21;
            break;
          }
        }
        v7 = v18;
        break;
      }
    }
    bool v22 = true;
    int v23 = simt_wave_count_bits(v22);
    int v24 = 0;
    int v25 = v24 + v0;
    v1[v25] = v23;
    v6 = v7;
  } else {
    int v26 = 4;
    int v27 = v3 % v26;
    int v28;
    v28 = v0;
    switch (v27) {
      case 0:
        {
        int v29 = 0;
        int v30 = 0;
        int v31;
        int v32;
        v31 = v29;
        v32 = v30;
        while (true) {
          int v33 = 4;
          int v34 = v3 % v33;
          int v35 = 1;
          int v36 = v34 + v35;
          bool v37 = v32 < v36;
          v31 = v31;
          v32 = v32;
          if (!v37) break;
          int v38 = 1;
          int v39 = v32 + v38;
          v31 = v0;
          v32 = v39;
        }
        v28 = v31;
        break;
      }
      case 1:
        {
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
          int v50 = v0 + v49;
          int v51 = 1;
          int v52 = v43 + v51;
          v42 = v50;
          v43 = v52;
        }
        v28 = v42;
        break;
      }
      case 2:
        {
        int v53 = 0;
        v28 = v53;
      }
      default:
        {
        int v54 = 3;
        v28 = v54;
        break;
      }
    }
    v6 = v28;
  }
  return;
}

kernel void kernel_main(device int* v55 [[buffer(0)]], device int* v56 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v57 = static_cast<int>(__simt_tid3.x);
  int v58 = 0;
  int v59 = v58 + v57;
  int v60 = v56[v59];
  int v61 = 4;
  int v62 = v61 + v57;
  int v63 = v56[v62];
  helper0(v57, v55, v60, v63, static_cast<int>(__simt_tid3.x));
  int v64 = 8;
  int v65 = v64 + v57;
  int v66 = v56[v65];
  uint v67 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v68 = (int)(v67);
  int v69;
  v69 = v68;
  switch (v66) {
    default:
      {
      int v70 = 12;
      int v71 = v70 + v57;
      int v72 = v56[v71];
      int v73 = 0;
      int v74 = v57 + v73;
      int v75;
      v75 = v74;
      switch (v72) {
        default:
          {
          int v76 = 0;
          int v77 = 0;
          int v78;
          int v79;
          v78 = v76;
          v79 = v77;
          while (true) {
            int v80 = 4;
            int v81 = v79 * v80;
            int v82 = v81 + v57;
            int v83 = 16;
            int v84 = v83 + v82;
            int v85 = v56[v84];
            int v86 = 0;
            bool v87 = v85 != v86;
            v78 = v78;
            v79 = v79;
            if (!v87) break;
            int v88 = v78 + v79;
            int v89 = 1;
            int v90 = v79 + v89;
            bool v91 = true;
            v78 = v88;
            v79 = v90;
          }
          v75 = v78;
          break;
        }
        case 0:
          {
          int v92 = 36;
          int v93 = v92 + v57;
          int v94 = v56[v93];
          int v95 = 0;
          int v96 = v57 + v95;
          int v97;
          v97 = v96;
          switch (v94) {
            case 0:
              {
              int v98 = 2;
              int v99 = v57 + v98;
              v97 = v99;
              break;
            }
            default:
              {
              int v100 = 1;
              int v101 = v57 + v100;
              v97 = v101;
              break;
            }
          }
          bool v102 = true;
          v75 = v97;
          break;
        }
        case 1:
          {
          int v103 = 40;
          int v104 = v103 + v57;
          int v105 = v56[v104];
          int v106 = 0;
          bool v107 = v105 != v106;
          int v108;
          if (v107) {
            int v109 = 0;
            v108 = v109;
          } else {
            int v110 = 0;
            int v111 = v57 + v110;
            v108 = v111;
          }
          v75 = v108;
          break;
        }
      }
      v69 = v75;
    }
    case 0:
      {
      int v112 = 44;
      int v113 = v112 + v57;
      int v114 = v56[v113];
      int v115 = 0;
      bool v116 = v114 != v115;
      int v117;
      if (v116) {
        int v118 = 0;
        int v119 = 0;
        int v120;
        int v121;
        v120 = v118;
        v121 = v119;
        while (true) {
          int v122 = 4;
          int v123 = v121 * v122;
          int v124 = v123 + v57;
          int v125 = 48;
          int v126 = v125 + v124;
          int v127 = v56[v126];
          int v128 = 0;
          bool v129 = v127 != v128;
          v120 = v120;
          v121 = v121;
          if (!v129) break;
          int v130 = v120 + v121;
          int v131 = 1;
          int v132 = v121 + v131;
          bool v133 = true;
          v120 = v130;
          v121 = v132;
        }
        v117 = v120;
      } else {
        int v134 = 68;
        int v135 = v134 + v57;
        int v136 = v56[v135];
        int v137 = 0;
        bool v138 = v136 != v137;
        int v139;
        if (v138) {
          v139 = v57;
        } else {
          v139 = v57;
        }
        v117 = v139;
      }
      v69 = v117;
      break;
    }
    case 1:
      {
      int v140 = 0;
      int v141 = 0;
      int v142;
      int v143;
      v142 = v140;
      v143 = v141;
      while (true) {
        int v144 = 4;
        int v145 = v143 * v144;
        int v146 = v145 + v57;
        int v147 = 72;
        int v148 = v147 + v146;
        int v149 = v56[v148];
        int v150 = 0;
        bool v151 = v149 != v150;
        v142 = v142;
        v143 = v143;
        if (!v151) break;
        int v152 = 92;
        int v153 = v152 + v57;
        int v154 = v56[v153];
        int v155 = 0;
        bool v156 = v154 != v155;
        int v157;
        if (v156) {
          int v158 = 3;
          int v159 = v57 + v158;
          v157 = v159;
        } else {
          int v160 = 4;
          int v161 = v57 + v160;
          v157 = v161;
        }
        int v162 = v142 + v157;
        int v163 = 1;
        int v164 = v143 + v163;
        bool v165 = true;
        v142 = v162;
        v143 = v164;
        continue;
        ;
      }
      v69 = v142;
      break;
    }
  }
  int v166 = 96;
  int v167 = v166 + v57;
  int v168 = v56[v167];
  int v169 = 0;
  bool v170 = v168 != v169;
  int v171;
  if (v170) {
    int v172 = 0;
    int v173 = 0;
    int v174;
    int v175;
    v174 = v172;
    v175 = v173;
    while (true) {
      int v176 = 4;
      int v177 = v175 * v176;
      int v178 = v177 + v57;
      int v179 = 100;
      int v180 = v179 + v178;
      int v181 = v56[v180];
      int v182 = 0;
      bool v183 = v181 != v182;
      v174 = v174;
      v175 = v175;
      if (!v183) break;
      int v184 = v174 + v175;
      int v185 = 1;
      int v186 = v175 + v185;
      bool v187 = true;
      int v188 = 16;
      int v189 = 4;
      int v190 = v175 * v189;
      int v191 = v188 + v190;
      int v192 = v191 + v57;
      bool v193 = true;
      int v194 = simt_wave_count_bits(v193);
      v55[v192] = v194;
      v174 = v184;
      v175 = v186;
      break;
      ;
    }
    v171 = v174;
  } else {
    int v195 = 0;
    int v196 = 0;
    int v197;
    int v198;
    v197 = v195;
    v198 = v196;
    while (true) {
      int v199 = 4;
      int v200 = v198 * v199;
      int v201 = v200 + v57;
      int v202 = 120;
      int v203 = v202 + v201;
      int v204 = v56[v203];
      int v205 = 0;
      bool v206 = v204 != v205;
      v197 = v197;
      v198 = v198;
      if (!v206) break;
      int v207 = 140;
      int v208 = v207 + v57;
      int v209 = v56[v208];
      int v210 = 0;
      bool v211 = v209 != v210;
      int v212;
      if (v211) {
        int v213 = 3;
        int v214 = v57 + v213;
        v212 = v214;
      } else {
        int v215 = 1;
        v212 = v215;
      }
      int v216 = 32;
      int v217 = v216 + v57;
      bool v218 = true;
      int v219 = simt_wave_count_bits(v218);
      v55[v217] = v219;
      int v220 = v197 + v212;
      int v221 = 1;
      int v222 = v198 + v221;
      bool v223 = true;
      int v224 = 48;
      int v225 = 4;
      int v226 = v198 * v225;
      int v227 = v224 + v226;
      int v228 = v227 + v57;
      bool v229 = true;
      int v230 = simt_wave_count_bits(v229);
      v55[v228] = v230;
      v197 = v220;
      v198 = v222;
      break;
      ;
    }
    v171 = v197;
  }
  int v231 = 64;
  int v232 = v231 + v57;
  bool v233 = true;
  int v234 = simt_wave_count_bits(v233);
  v55[v232] = v234;
  int v235 = 0;
  int v236 = 0;
  int v237;
  int v238;
  v237 = v235;
  v238 = v236;
  while (true) {
    int v239 = 4;
    int v240 = v238 * v239;
    int v241 = v240 + v57;
    int v242 = 144;
    int v243 = v242 + v241;
    int v244 = v56[v243];
    int v245 = 0;
    bool v246 = v244 != v245;
    v237 = v237;
    v238 = v238;
    if (!v246) break;
    int v247 = v237 + v238;
    int v248 = 1;
    int v249 = v238 + v248;
    bool v250 = true;
    int v251 = 80;
    int v252 = 4;
    int v253 = v238 * v252;
    int v254 = v251 + v253;
    int v255 = v254 + v57;
    bool v256 = true;
    int v257 = simt_wave_count_bits(v256);
    v55[v255] = v257;
    v237 = v247;
    v238 = v249;
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 96; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 164; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
