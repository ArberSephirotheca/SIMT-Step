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
  int v5 = v3 % v4;
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 0;
      bool v10 = v2 != v9;
      int v11;
      if (v10) {
        int v12 = 0;
        int v13 = 0;
        int v14;
        int v15;
        v14 = v12;
        v15 = v13;
        while (true) {
          int v16 = 4;
          int v17 = v3 % v16;
          int v18 = 1;
          int v19 = v17 + v18;
          bool v20 = v15 < v19;
          v14 = v14;
          v15 = v15;
          if (!v20) break;
          int v21 = 3;
          int v22 = v0 + v21;
          int v23 = 1;
          int v24 = v15 + v23;
          v14 = v22;
          v15 = v24;
        }
        v11 = v14;
      } else {
        int v25 = 4;
        int v26 = v0 + v25;
        int v27;
        v27 = v26;
        switch (v3) {
          case 0:
            {
            v27 = v0;
          }
          default:
            {
            v27 = v0;
            break;
          }
        }
        int v28 = 1;
        int v29 = v0 + v28;
        v11 = v27;
      }
      v8 = v11;
      break;
    }
    case 0:
      {
      int v30 = 2;
      int v31 = v3 % v30;
      int v32;
      v32 = v0;
      switch (v31) {
        default:
          {
          int v33 = 0;
          bool v34 = v2 != v33;
          int v35;
          if (v34) {
            int v36 = 4;
            v35 = v36;
          } else {
            v35 = v0;
          }
          v32 = v35;
        }
        case 0:
          {
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
            int v46 = 1;
            int v47 = 1;
            int v48 = v40 + v47;
            v39 = v46;
            v40 = v48;
          }
          v32 = v39;
        }
        case 1:
          {
          int v49 = 0;
          int v50 = 0;
          int v51;
          int v52;
          v51 = v49;
          v52 = v50;
          while (true) {
            int v53 = 4;
            int v54 = v3 % v53;
            int v55 = 1;
            int v56 = v54 + v55;
            bool v57 = v52 < v56;
            v51 = v51;
            v52 = v52;
            if (!v57) break;
            int v58 = 4;
            int v59 = v0 + v58;
            int v60 = 1;
            int v61 = v52 + v60;
            v51 = v59;
            v52 = v61;
            continue;
            ;
          }
          v32 = v51;
          break;
        }
      }
      v8 = v32;
    }
    case 1:
      {
      int v62 = 0;
      int v63 = 0;
      int v64;
      int v65;
      v64 = v62;
      v65 = v63;
      while (true) {
        int v66 = 4;
        int v67 = v3 % v66;
        int v68 = 1;
        int v69 = v67 + v68;
        bool v70 = v65 < v69;
        v64 = v64;
        v65 = v65;
        if (!v70) break;
        int v71 = 1;
        int v72 = v65 + v71;
        v64 = v0;
        v65 = v72;
      }
      v8 = v64;
      break;
    }
    case 2:
      {
      int v73 = 0;
      bool v74 = v2 != v73;
      int v75;
      if (v74) {
        int v76 = 0;
        int v77 = 0;
        int v78;
        int v79;
        v78 = v76;
        v79 = v77;
        while (true) {
          int v80 = 4;
          int v81 = v3 % v80;
          int v82 = 1;
          int v83 = v81 + v82;
          bool v84 = v79 < v83;
          v78 = v78;
          v79 = v79;
          if (!v84) break;
          int v85 = 1;
          int v86 = v79 + v85;
          v78 = v0;
          v79 = v86;
          continue;
          ;
        }
        v75 = v78;
      } else {
        int v87 = 0;
        int v88 = 0;
        int v89;
        int v90;
        v89 = v87;
        v90 = v88;
        while (true) {
          int v91 = 4;
          int v92 = v3 % v91;
          int v93 = 1;
          int v94 = v92 + v93;
          bool v95 = v90 < v94;
          v89 = v89;
          v90 = v90;
          if (!v95) break;
          int v96 = 1;
          int v97 = v90 + v96;
          v89 = v0;
          v90 = v97;
          break;
          ;
        }
        v75 = v89;
      }
      v8 = v75;
      break;
    }
  }
  bool v98 = true;
  int v99 = simt_wave_count_bits(v98);
  int v100 = 0;
  int v101 = v100 + v0;
  v1[v101] = v99;
  return;
}

kernel void kernel_main(device int* v102 [[buffer(0)]], device int* v103 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v104 = static_cast<int>(__simt_tid3.x);
  int v105 = 0;
  int v106 = v105 + v104;
  int v107 = v103[v106];
  int v108 = 4;
  int v109 = v108 + v104;
  int v110 = v103[v109];
  helper0(v104, v102, v107, v110, static_cast<int>(__simt_tid3.x));
  int v111 = 8;
  int v112 = v111 + v104;
  int v113 = v103[v112];
  int v114 = 0;
  bool v115 = v113 != v114;
  int v116;
  if (v115) {
    int v117 = 0;
    int v118 = 0;
    int v119;
    int v120;
    v119 = v117;
    v120 = v118;
    while (true) {
      int v121 = 4;
      int v122 = v120 * v121;
      int v123 = v122 + v104;
      int v124 = 12;
      int v125 = v124 + v123;
      int v126 = v103[v125];
      int v127 = 0;
      bool v128 = v126 != v127;
      v119 = v119;
      v120 = v120;
      if (!v128) break;
      int v129 = 32;
      int v130 = v129 + v104;
      int v131 = v103[v130];
      int v132 = 0;
      bool v133 = v131 != v132;
      int v134;
      if (v133) {
        uint v135 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v136 = (int)(v135);
        v134 = v136;
      } else {
        int v137 = 1;
        v134 = v137;
      }
      int v138 = 16;
      int v139 = v138 + v104;
      bool v140 = true;
      int v141 = simt_wave_count_bits(v140);
      v102[v139] = v141;
      int v142 = v119 + v134;
      int v143 = 1;
      int v144 = v120 + v143;
      bool v145 = true;
      int v146 = 32;
      int v147 = 4;
      int v148 = v120 * v147;
      int v149 = v146 + v148;
      int v150 = v149 + v104;
      bool v151 = true;
      int v152 = simt_wave_count_bits(v151);
      v102[v150] = v152;
      v119 = v142;
      v120 = v144;
    }
    v116 = v119;
  } else {
    int v153 = 36;
    int v154 = v153 + v104;
    int v155 = v103[v154];
    int v156;
    v156 = v104;
    switch (v155) {
      default:
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
          int v163 = v162 + v104;
          int v164 = 40;
          int v165 = v164 + v163;
          int v166 = v103[v165];
          int v167 = 0;
          bool v168 = v166 != v167;
          v159 = v159;
          v160 = v160;
          if (!v168) break;
          int v169 = v159 + v160;
          int v170 = 1;
          int v171 = v160 + v170;
          bool v172 = true;
          v159 = v169;
          v160 = v171;
        }
        v156 = v159;
        break;
      }
      case 0:
        {
        int v173 = 60;
        int v174 = v173 + v104;
        int v175 = v103[v174];
        int v176 = 0;
        bool v177 = v175 != v176;
        int v178;
        if (v177) {
          v178 = v104;
        } else {
          int v179 = 2;
          v178 = v179;
        }
        v156 = v178;
        break;
      }
    }
    bool v180 = true;
    int v181 = 48;
    int v182 = v181 + v104;
    bool v183 = true;
    int v184 = simt_wave_count_bits(v183);
    v102[v182] = v184;
    v116 = v156;
  }
  int v185 = 64;
  int v186 = v185 + v104;
  bool v187 = true;
  int v188 = simt_wave_count_bits(v187);
  v102[v186] = v188;
  uint v189 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v190 = (int)(v189);
  int v191 = 64;
  int v192 = v191 + v104;
  int v193 = v103[v192];
  int v194;
  v194 = v104;
  switch (v193) {
    case 0:
      {
      int v195 = 68;
      int v196 = v195 + v104;
      int v197 = v103[v196];
      int v198 = 0;
      bool v199 = v197 != v198;
      int v200;
      if (v199) {
        int v201 = 72;
        int v202 = v201 + v104;
        int v203 = v103[v202];
        int v204 = 1;
        int v205;
        v205 = v204;
        switch (v203) {
          default:
            {
            int v206 = 4;
            int v207 = v104 + v206;
            v205 = v207;
            break;
          }
          case 0:
            {
            int v208 = 1;
            int v209 = v104 + v208;
            v205 = v209;
            break;
          }
          case 1:
            {
            int v210 = 2;
            int v211 = v104 + v210;
            v205 = v211;
            break;
          }
        }
        v200 = v205;
      } else {
        int v212 = 76;
        int v213 = v212 + v104;
        int v214 = v103[v213];
        int v215 = 2;
        int v216 = v104 + v215;
        int v217;
        v217 = v216;
        switch (v214) {
          default:
            {
            int v218 = 4;
            int v219 = v104 + v218;
            v217 = v219;
            break;
          }
          case 0:
            {
            v217 = v104;
            break;
          }
          case 1:
            {
            int v220 = 0;
            int v221 = v104 + v220;
            v217 = v221;
            break;
          }
        }
        bool v222 = true;
        v200 = v217;
      }
      v194 = v200;
      break;
    }
    case 1:
      {
      int v223 = 0;
      v194 = v223;
      break;
    }
    case 2:
      {
      int v224 = 80;
      int v225 = v224 + v104;
      int v226 = v103[v225];
      int v227 = 2;
      int v228 = v104 + v227;
      int v229;
      v229 = v228;
      switch (v226) {
        default:
          {
          int v230 = 0;
          int v231 = 0;
          int v232;
          int v233;
          v232 = v230;
          v233 = v231;
          while (true) {
            int v234 = 4;
            int v235 = v233 * v234;
            int v236 = v235 + v104;
            int v237 = 84;
            int v238 = v237 + v236;
            int v239 = v103[v238];
            int v240 = 0;
            bool v241 = v239 != v240;
            v232 = v232;
            v233 = v233;
            if (!v241) break;
            int v242 = v232 + v233;
            int v243 = 1;
            int v244 = v233 + v243;
            bool v245 = true;
            v232 = v242;
            v233 = v244;
          }
          v229 = v232;
          break;
        }
        case 0:
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
            int v252 = v251 + v104;
            int v253 = 104;
            int v254 = v253 + v252;
            int v255 = v103[v254];
            int v256 = 0;
            bool v257 = v255 != v256;
            v248 = v248;
            v249 = v249;
            if (!v257) break;
            int v258 = v248 + v249;
            int v259 = 1;
            int v260 = v249 + v259;
            bool v261 = true;
            v248 = v258;
            v249 = v260;
            break;
            ;
          }
          v229 = v248;
          break;
        }
        case 1:
          {
          int v262 = 124;
          int v263 = v262 + v104;
          int v264 = v103[v263];
          int v265 = 0;
          int v266;
          v266 = v265;
          switch (v264) {
            case 0:
              {
              v266 = v104;
              break;
            }
            default:
              {
              v266 = v104;
              break;
            }
          }
          bool v267 = true;
          v229 = v266;
          break;
        }
      }
      v194 = v229;
      break;
    }
    default:
      {
      v194 = v104;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 128; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
