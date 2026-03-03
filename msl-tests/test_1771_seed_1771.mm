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
  int v4 = 2;
  int v5 = 4;
  int v6 = v3 % v5;
  uint v7 = simt_lane_id(__simt_tid);
  int v8 = (int)(v7);
  int v9;
  v9 = v8;
  switch (v6) {
    case 0:
      {
      int v10 = 3;
      int v11 = v3 % v10;
      int v12 = 3;
      int v13;
      v13 = v12;
      switch (v11) {
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
            int v23 = 1;
            int v24 = v17 + v23;
            v16 = v0;
            v17 = v24;
          }
          v13 = v16;
          break;
        }
        case 1:
          {
          int v25 = 3;
          int v26 = v3 % v25;
          int v27 = 0;
          int v28 = v0 + v27;
          int v29;
          v29 = v28;
          switch (v26) {
            default:
              {
              v29 = v0;
              break;
            }
            case 0:
              {
              v29 = v0;
              break;
            }
            case 1:
              {
              int v30 = 1;
              int v31 = v0 + v30;
              v29 = v31;
              break;
            }
            case 2:
              {
              int v32 = 0;
              int v33 = v0 + v32;
              v29 = v33;
              break;
            }
          }
          v13 = v29;
          break;
        }
        default:
          {
          int v34 = 3;
          int v35 = v3 % v34;
          int v36 = 1;
          int v37;
          v37 = v36;
          switch (v35) {
            case 0:
              {
              int v38 = 3;
              int v39 = v0 + v38;
              v37 = v39;
              break;
            }
            default:
              {
              v37 = v0;
              break;
            }
            case 1:
              {
              v37 = v0;
              break;
            }
          }
          int v40 = 3;
          int v41 = v0 + v40;
          v13 = v37;
          break;
        }
      }
      int v42 = 4;
      v9 = v13;
      break;
    }
    default:
      {
      int v43 = 0;
      bool v44 = v2 != v43;
      int v45;
      if (v44) {
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
          int v55 = 0;
          int v56 = v0 + v55;
          int v57 = 1;
          int v58 = v49 + v57;
          v48 = v56;
          v49 = v58;
        }
        int v59 = 0;
        v45 = v48;
      } else {
        int v60 = 0;
        bool v61 = v2 != v60;
        int v62;
        if (v61) {
          v62 = v0;
        } else {
          v62 = v0;
        }
        int v63 = 1;
        v45 = v62;
      }
      int v64 = 4;
      int v65 = v0 + v64;
      v9 = v45;
    }
    case 1:
      {
      int v66 = 0;
      bool v67 = v2 != v66;
      int v68;
      if (v67) {
        int v69 = 0;
        bool v70 = v2 != v69;
        int v71;
        if (v70) {
          int v72 = 1;
          v71 = v72;
        } else {
          int v73 = 1;
          v71 = v73;
        }
        int v74 = 1;
        v68 = v71;
      } else {
        int v75 = 0;
        int v76 = v0 + v75;
        v68 = v76;
      }
      int v77 = 1;
      v9 = v68;
    }
    case 2:
      {
      int v78 = 0;
      int v79 = 0;
      int v80;
      int v81;
      v80 = v78;
      v81 = v79;
      while (true) {
        int v82 = 4;
        int v83 = v3 % v82;
        int v84 = 1;
        int v85 = v83 + v84;
        bool v86 = v81 < v85;
        v80 = v80;
        v81 = v81;
        if (!v86) break;
        int v87 = 0;
        bool v88 = v2 != v87;
        int v89;
        if (v88) {
          int v90 = 4;
          v89 = v90;
        } else {
          int v91 = 3;
          int v92 = v0 + v91;
          v89 = v92;
        }
        int v93 = 3;
        int v94 = v0 + v93;
        int v95 = 1;
        int v96 = v81 + v95;
        v80 = v89;
        v81 = v96;
      }
      v9 = v80;
      break;
    }
  }
  bool v97 = true;
  int v98 = simt_wave_count_bits(v97);
  int v99 = 0;
  int v100 = v99 + v0;
  v1[v100] = v98;
  int v101 = 0;
  bool v102 = v2 != v101;
  int v103 = v102 ? v4 : v9;
  return;
}

kernel void kernel_main(device int* v104 [[buffer(0)]], device int* v105 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v106 = static_cast<int>(__simt_tid3.x);
  int v107 = 0;
  int v108 = v107 + v106;
  int v109 = v105[v108];
  int v110 = 4;
  int v111 = v110 + v106;
  int v112 = v105[v111];
  helper0(v106, v104, v109, v112, static_cast<int>(__simt_tid3.x));
  int v113 = 2;
  int v114 = 8;
  int v115 = v114 + v106;
  int v116 = v105[v115];
  int v117 = 0;
  bool v118 = v116 != v117;
  int v119;
  if (v118) {
    int v120 = 0;
    int v121 = 0;
    int v122;
    int v123;
    v122 = v120;
    v123 = v121;
    while (true) {
      int v124 = 4;
      int v125 = v123 * v124;
      int v126 = v125 + v106;
      int v127 = 12;
      int v128 = v127 + v126;
      int v129 = v105[v128];
      int v130 = 0;
      bool v131 = v129 != v130;
      v122 = v122;
      v123 = v123;
      if (!v131) break;
      int v132 = 0;
      int v133 = v106 + v132;
      int v134 = v122 + v133;
      int v135 = 1;
      int v136 = v123 + v135;
      v122 = v134;
      v123 = v136;
    }
    bool v137 = true;
    v119 = v122;
  } else {
    int v138 = 0;
    int v139 = 0;
    int v140;
    int v141;
    v140 = v138;
    v141 = v139;
    while (true) {
      int v142 = 4;
      int v143 = v141 * v142;
      int v144 = v143 + v106;
      int v145 = 32;
      int v146 = v145 + v144;
      int v147 = v105[v146];
      int v148 = 0;
      bool v149 = v147 != v148;
      v140 = v140;
      v141 = v141;
      if (!v149) break;
      int v150 = v140 + v141;
      int v151 = 1;
      int v152 = v141 + v151;
      v140 = v150;
      v141 = v152;
    }
    bool v153 = true;
    v119 = v140;
  }
  int v154 = 16;
  int v155 = v154 + v106;
  bool v156 = true;
  int v157 = simt_wave_count_bits(v156);
  v104[v155] = v157;
  int v158 = 52;
  int v159 = v158 + v106;
  int v160 = v105[v159];
  uint v161 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v162 = (int)(v161);
  int v163;
  v163 = v162;
  switch (v160) {
    case 0:
      {
      int v164 = 56;
      int v165 = v164 + v106;
      int v166 = v105[v165];
      int v167;
      v167 = v106;
      switch (v166) {
        case 0:
          {
          int v168 = 0;
          int v169 = 0;
          int v170;
          int v171;
          v170 = v168;
          v171 = v169;
          while (true) {
            int v172 = 4;
            int v173 = v171 * v172;
            int v174 = v173 + v106;
            int v175 = 60;
            int v176 = v175 + v174;
            int v177 = v105[v176];
            int v178 = 0;
            bool v179 = v177 != v178;
            v170 = v170;
            v171 = v171;
            if (!v179) break;
            int v180 = v170 + v171;
            int v181 = 1;
            int v182 = v171 + v181;
            v170 = v180;
            v171 = v182;
          }
          bool v183 = true;
          v167 = v170;
          break;
        }
        case 1:
          {
          int v184 = 80;
          int v185 = v184 + v106;
          int v186 = v105[v185];
          int v187 = 0;
          bool v188 = v186 != v187;
          int v189;
          if (v188) {
            int v190 = 3;
            int v191 = v106 + v190;
            v189 = v191;
          } else {
            int v192 = 0;
            v189 = v192;
          }
          v167 = v189;
          break;
        }
        default:
          {
          int v193 = 84;
          int v194 = v193 + v106;
          int v195 = v105[v194];
          int v196 = 0;
          bool v197 = v195 != v196;
          int v198;
          if (v197) {
            int v199 = 4;
            v198 = v199;
          } else {
            v198 = v106;
          }
          v167 = v198;
          break;
        }
        case 2:
          {
          int v200 = 88;
          int v201 = v200 + v106;
          int v202 = v105[v201];
          int v203 = 3;
          int v204 = v106 + v203;
          int v205;
          v205 = v204;
          switch (v202) {
            default:
              {
              int v206 = 3;
              int v207 = v106 + v206;
              v205 = v207;
              break;
            }
            case 0:
              {
              int v208 = 4;
              int v209 = v106 + v208;
              v205 = v209;
              break;
            }
            case 1:
              {
              int v210 = 0;
              int v211 = v106 + v210;
              v205 = v211;
              break;
            }
            case 2:
              {
              v205 = v106;
              break;
            }
          }
          bool v212 = true;
          v167 = v205;
          break;
        }
      }
      bool v213 = true;
      v163 = v167;
      break;
    }
    case 1:
      {
      int v214 = 92;
      int v215 = v214 + v106;
      int v216 = v105[v215];
      int v217 = 0;
      bool v218 = v216 != v217;
      int v219;
      if (v218) {
        v219 = v106;
      } else {
        int v220 = 96;
        int v221 = v220 + v106;
        int v222 = v105[v221];
        int v223;
        v223 = v106;
        switch (v222) {
          case 0:
            {
            v223 = v106;
          }
          default:
            {
            int v224 = 4;
            v223 = v224;
            break;
          }
        }
        bool v225 = true;
        v219 = v223;
      }
      v163 = v219;
      break;
    }
    default:
      {
      int v226 = 100;
      int v227 = v226 + v106;
      int v228 = v105[v227];
      int v229 = 0;
      bool v230 = v228 != v229;
      int v231;
      if (v230) {
        int v232 = 2;
        int v233 = v106 + v232;
        v231 = v233;
      } else {
        int v234 = 0;
        int v235 = 0;
        int v236;
        int v237;
        v236 = v234;
        v237 = v235;
        while (true) {
          int v238 = 4;
          int v239 = v237 * v238;
          int v240 = v239 + v106;
          int v241 = 104;
          int v242 = v241 + v240;
          int v243 = v105[v242];
          int v244 = 0;
          bool v245 = v243 != v244;
          v236 = v236;
          v237 = v237;
          if (!v245) break;
          int v246 = v236 + v237;
          int v247 = 1;
          int v248 = v237 + v247;
          v236 = v246;
          v237 = v248;
          break;
          ;
        }
        bool v249 = true;
        v231 = v236;
      }
      v163 = v231;
      break;
    }
  }
  bool v250 = true;
  int v251 = 32;
  int v252 = v251 + v106;
  bool v253 = true;
  int v254 = simt_wave_count_bits(v253);
  v104[v252] = v254;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
