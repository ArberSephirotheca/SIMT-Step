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
  int v6;
  v6 = v0;
  switch (v5) {
    case 0:
      {
      int v7 = 0;
      bool v8 = v2 != v7;
      int v9;
      if (v8) {
        int v10 = 4;
        int v11 = v0 + v10;
        v9 = v11;
      } else {
        int v12 = 0;
        bool v13 = v2 != v12;
        int v14;
        if (v13) {
          int v15 = 3;
          v14 = v15;
        } else {
          int v16 = 0;
          v14 = v16;
        }
        int v17 = 1;
        v9 = v14;
      }
      int v18 = 2;
      v6 = v9;
    }
    default:
      {
      int v19 = 3;
      int v20 = v3 % v19;
      int v21;
      v21 = v0;
      switch (v20) {
        default:
          {
          int v22 = 0;
          int v23 = 0;
          int v24;
          int v25;
          v24 = v22;
          v25 = v23;
          while (true) {
            int v26 = 4;
            int v27 = v3 % v26;
            int v28 = 1;
            int v29 = v27 + v28;
            bool v30 = v25 < v29;
            v24 = v24;
            v25 = v25;
            if (!v30) break;
            int v31 = 1;
            int v32 = v25 + v31;
            v24 = v0;
            v25 = v32;
          }
          v21 = v24;
          break;
        }
        case 0:
          {
          int v33 = 0;
          int v34 = 0;
          int v35;
          int v36;
          v35 = v33;
          v36 = v34;
          while (true) {
            int v37 = 4;
            int v38 = v3 % v37;
            int v39 = 1;
            int v40 = v38 + v39;
            bool v41 = v36 < v40;
            v35 = v35;
            v36 = v36;
            if (!v41) break;
            int v42 = 2;
            int v43 = 1;
            int v44 = v36 + v43;
            v35 = v42;
            v36 = v44;
          }
          int v45 = 0;
          v21 = v35;
          break;
        }
        case 1:
          {
          int v46 = 0;
          int v47 = v0 + v46;
          int v48;
          v48 = v47;
          switch (v3) {
            case 0:
              {
              int v49 = 1;
              v48 = v49;
              break;
            }
            default:
              {
              int v50 = 1;
              int v51 = v0 + v50;
              v48 = v51;
              break;
            }
          }
          int v52 = 2;
          v21 = v48;
          break;
        }
        case 2:
          {
          int v53 = 0;
          int v54 = 0;
          int v55;
          int v56;
          v55 = v53;
          v56 = v54;
          while (true) {
            int v57 = 4;
            int v58 = v3 % v57;
            int v59 = 1;
            int v60 = v58 + v59;
            bool v61 = v56 < v60;
            v55 = v55;
            v56 = v56;
            if (!v61) break;
            int v62 = 1;
            int v63 = v0 + v62;
            int v64 = 1;
            int v65 = v56 + v64;
            v55 = v63;
            v56 = v65;
            break;
            ;
          }
          int v66 = 0;
          v21 = v55;
          break;
        }
      }
      v6 = v21;
    }
    case 1:
      {
      int v67 = 0;
      bool v68 = v2 != v67;
      int v69;
      if (v68) {
        int v70 = 0;
        int v71 = 0;
        int v72;
        int v73;
        v72 = v70;
        v73 = v71;
        while (true) {
          int v74 = 4;
          int v75 = v3 % v74;
          int v76 = 1;
          int v77 = v75 + v76;
          bool v78 = v73 < v77;
          v72 = v72;
          v73 = v73;
          if (!v78) break;
          int v79 = 1;
          int v80 = v73 + v79;
          v72 = v0;
          v73 = v80;
          break;
          ;
        }
        int v81 = 1;
        v69 = v72;
      } else {
        int v82 = 0;
        bool v83 = v2 != v82;
        int v84;
        if (v83) {
          int v85 = 1;
          v84 = v85;
        } else {
          int v86 = 0;
          int v87 = v0 + v86;
          v84 = v87;
        }
        int v88 = 1;
        v69 = v84;
      }
      int v89 = 1;
      int v90 = v0 + v89;
      v6 = v69;
    }
    case 2:
      {
      int v91 = 4;
      int v92 = v3 % v91;
      int v93 = 4;
      int v94;
      v94 = v93;
      switch (v92) {
        case 0:
          {
          int v95 = 4;
          int v96 = v0 + v95;
          v94 = v96;
          break;
        }
        case 1:
          {
          int v97 = 2;
          int v98 = v3 % v97;
          int v99;
          v99 = v0;
          switch (v98) {
            case 0:
              {
              int v100 = 3;
              v99 = v100;
            }
            default:
              {
              int v101 = 3;
              v99 = v101;
              break;
            }
            case 1:
              {
              int v102 = 0;
              int v103 = v0 + v102;
              v99 = v103;
              break;
            }
          }
          int v104 = 0;
          int v105 = v0 + v104;
          v94 = v99;
          break;
        }
        default:
          {
          int v106 = 0;
          bool v107 = v2 != v106;
          int v108;
          if (v107) {
            int v109 = 2;
            int v110 = v0 + v109;
            v108 = v110;
          } else {
            int v111 = 2;
            v108 = v111;
          }
          int v112 = 2;
          v94 = v108;
          break;
        }
        case 2:
          {
          int v113 = 3;
          int v114 = v3 % v113;
          int v115 = 4;
          int v116;
          v116 = v115;
          switch (v114) {
            case 0:
              {
              int v117 = 2;
              int v118 = v0 + v117;
              v116 = v118;
            }
            default:
              {
              v116 = v0;
            }
            case 1:
              {
              int v119 = 4;
              v116 = v119;
              break;
            }
          }
          v94 = v116;
          break;
        }
      }
      int v120 = 3;
      int v121 = v0 + v120;
      v6 = v94;
      break;
    }
  }
  bool v122 = true;
  int v123 = simt_wave_count_bits(v122);
  int v124 = 0;
  int v125 = v124 + v0;
  v1[v125] = v123;
  return;
}

kernel void kernel_main(device int* v126 [[buffer(0)]], device int* v127 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v128 = static_cast<int>(__simt_tid3.x);
  int v129 = 0;
  int v130 = v129 + v128;
  int v131 = v127[v130];
  int v132 = 4;
  int v133 = v132 + v128;
  int v134 = v127[v133];
  helper0(v128, v126, v131, v134, static_cast<int>(__simt_tid3.x));
  int v135 = 8;
  int v136 = v135 + v128;
  int v137 = v127[v136];
  uint v138 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v139 = (int)(v138);
  int v140;
  v140 = v139;
  switch (v137) {
    case 0:
      {
      int v141 = 12;
      int v142 = v141 + v128;
      int v143 = v127[v142];
      int v144;
      v144 = v128;
      switch (v143) {
        default:
          {
          int v145 = 0;
          int v146 = 0;
          int v147;
          int v148;
          v147 = v145;
          v148 = v146;
          while (true) {
            int v149 = 4;
            int v150 = v148 * v149;
            int v151 = v150 + v128;
            int v152 = 16;
            int v153 = v152 + v151;
            int v154 = v127[v153];
            int v155 = 0;
            bool v156 = v154 != v155;
            v147 = v147;
            v148 = v148;
            if (!v156) break;
            int v157 = v147 + v148;
            int v158 = 1;
            int v159 = v148 + v158;
            v147 = v157;
            v148 = v159;
          }
          bool v160 = true;
          v144 = v147;
        }
        case 0:
          {
          int v161 = 0;
          int v162 = 0;
          int v163;
          int v164;
          v163 = v161;
          v164 = v162;
          while (true) {
            int v165 = 4;
            int v166 = v164 * v165;
            int v167 = v166 + v128;
            int v168 = 36;
            int v169 = v168 + v167;
            int v170 = v127[v169];
            int v171 = 0;
            bool v172 = v170 != v171;
            v163 = v163;
            v164 = v164;
            if (!v172) break;
            int v173 = v163 + v164;
            int v174 = 1;
            int v175 = v164 + v174;
            v163 = v173;
            v164 = v175;
          }
          bool v176 = true;
          v144 = v163;
          break;
        }
        case 1:
          {
          int v177 = 0;
          int v178 = 0;
          int v179;
          int v180;
          v179 = v177;
          v180 = v178;
          while (true) {
            int v181 = 4;
            int v182 = v180 * v181;
            int v183 = v182 + v128;
            int v184 = 56;
            int v185 = v184 + v183;
            int v186 = v127[v185];
            int v187 = 0;
            bool v188 = v186 != v187;
            v179 = v179;
            v180 = v180;
            if (!v188) break;
            int v189 = v179 + v180;
            int v190 = 1;
            int v191 = v180 + v190;
            v179 = v189;
            v180 = v191;
          }
          bool v192 = true;
          v144 = v179;
        }
        case 2:
          {
          int v193 = 76;
          int v194 = v193 + v128;
          int v195 = v127[v194];
          int v196 = 0;
          bool v197 = v195 != v196;
          int v198;
          if (v197) {
            int v199 = 4;
            int v200 = v128 + v199;
            v198 = v200;
          } else {
            v198 = v128;
          }
          v144 = v198;
          break;
        }
      }
      bool v201 = true;
      v140 = v144;
      break;
    }
    default:
      {
      int v202 = 0;
      int v203 = 0;
      int v204;
      int v205;
      v204 = v202;
      v205 = v203;
      while (true) {
        int v206 = 4;
        int v207 = v205 * v206;
        int v208 = v207 + v128;
        int v209 = 80;
        int v210 = v209 + v208;
        int v211 = v127[v210];
        int v212 = 0;
        bool v213 = v211 != v212;
        v204 = v204;
        v205 = v205;
        if (!v213) break;
        int v214 = 3;
        int v215 = v204 + v214;
        int v216 = 1;
        int v217 = v205 + v216;
        v204 = v215;
        v205 = v217;
      }
      bool v218 = true;
      v140 = v204;
      break;
    }
    case 1:
      {
      int v219 = 100;
      int v220 = v219 + v128;
      int v221 = v127[v220];
      int v222 = 0;
      bool v223 = v221 != v222;
      int v224;
      if (v223) {
        v224 = v128;
      } else {
        int v225 = 0;
        int v226 = 0;
        int v227;
        int v228;
        v227 = v225;
        v228 = v226;
        while (true) {
          int v229 = 4;
          int v230 = v228 * v229;
          int v231 = v230 + v128;
          int v232 = 104;
          int v233 = v232 + v231;
          int v234 = v127[v233];
          int v235 = 0;
          bool v236 = v234 != v235;
          v227 = v227;
          v228 = v228;
          if (!v236) break;
          int v237 = v227 + v228;
          int v238 = 1;
          int v239 = v228 + v238;
          v227 = v237;
          v228 = v239;
        }
        bool v240 = true;
        v224 = v227;
      }
      v140 = v224;
      break;
    }
  }
  bool v241 = true;
  int v242 = 16;
  int v243 = v242 + v128;
  bool v244 = true;
  int v245 = simt_wave_count_bits(v244);
  v126[v243] = v245;
  int v246 = 0;
  int v247 = 0;
  int v248;
  int v249;
  v248 = v246;
  v249 = v247;
  while (true) {
    int v250 = 4;
    int v251 = v249 * v250;
    int v252 = v251 + v128;
    int v253 = 124;
    int v254 = v253 + v252;
    int v255 = v127[v254];
    int v256 = 0;
    bool v257 = v255 != v256;
    v248 = v248;
    v249 = v249;
    if (!v257) break;
    int v258 = v248 + v249;
    int v259 = 1;
    int v260 = v249 + v259;
    v248 = v258;
    v249 = v260;
    break;
    ;
  }
  bool v261 = true;
  int v262 = 32;
  int v263 = v262 + v128;
  bool v264 = true;
  int v265 = simt_wave_count_bits(v264);
  v126[v263] = v265;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 144; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
