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
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 3;
      int v10 = v3 % v9;
      int v11 = 4;
      int v12;
      v12 = v11;
      switch (v10) {
        case 0:
          {
          int v13 = 0;
          int v14 = 0;
          int v15;
          int v16;
          v15 = v13;
          v16 = v14;
          while (true) {
            int v17 = 4;
            int v18 = v3 % v17;
            int v19 = 1;
            int v20 = v18 + v19;
            bool v21 = v16 < v20;
            v15 = v15;
            v16 = v16;
            if (!v21) break;
            int v22 = 1;
            int v23 = v16 + v22;
            v15 = v0;
            v16 = v23;
            continue;
            ;
          }
          v12 = v15;
          break;
        }
        default:
          {
          int v24 = 0;
          bool v25 = v2 != v24;
          int v26;
          if (v25) {
            v26 = v0;
          } else {
            int v27 = 3;
            int v28 = v0 + v27;
            v26 = v28;
          }
          v12 = v26;
          break;
        }
        case 1:
          {
          int v29 = 0;
          bool v30 = v2 != v29;
          int v31;
          if (v30) {
            v31 = v0;
          } else {
            v31 = v0;
          }
          v12 = v31;
          break;
        }
        case 2:
          {
          int v32 = 1;
          int v33 = v0 + v32;
          v12 = v33;
          break;
        }
      }
      v8 = v12;
      break;
    }
    case 0:
      {
      int v34 = 2;
      int v35 = v3 % v34;
      int v36;
      v36 = v0;
      switch (v35) {
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
            int v47 = v0 + v46;
            int v48 = 1;
            int v49 = v40 + v48;
            v39 = v47;
            v40 = v49;
            break;
            ;
          }
          v36 = v39;
          break;
        }
        default:
          {
          int v50 = 0;
          bool v51 = v2 != v50;
          int v52;
          if (v51) {
            int v53 = 1;
            v52 = v53;
          } else {
            v52 = v0;
          }
          v36 = v52;
          break;
        }
        case 1:
          {
          int v54 = 0;
          int v55 = 0;
          int v56;
          int v57;
          v56 = v54;
          v57 = v55;
          while (true) {
            int v58 = 4;
            int v59 = v3 % v58;
            int v60 = 1;
            int v61 = v59 + v60;
            bool v62 = v57 < v61;
            v56 = v56;
            v57 = v57;
            if (!v62) break;
            int v63 = 1;
            int v64 = v57 + v63;
            v56 = v0;
            v57 = v64;
          }
          v36 = v56;
          break;
        }
      }
      v8 = v36;
      break;
    }
    case 1:
      {
      int v65 = 0;
      bool v66 = v2 != v65;
      int v67;
      if (v66) {
        int v68;
        v68 = v0;
        switch (v3) {
          default:
            {
            v68 = v0;
            break;
          }
          case 0:
            {
            int v69 = 1;
            v68 = v69;
            break;
          }
        }
        v67 = v68;
      } else {
        int v70 = 0;
        bool v71 = v2 != v70;
        int v72;
        if (v71) {
          int v73 = 3;
          int v74 = v0 + v73;
          v72 = v74;
        } else {
          int v75 = 1;
          int v76 = v0 + v75;
          v72 = v76;
        }
        v67 = v72;
      }
      v8 = v67;
      break;
    }
    case 2:
      {
      int v77 = 0;
      int v78 = 0;
      int v79;
      int v80;
      v79 = v77;
      v80 = v78;
      while (true) {
        int v81 = 4;
        int v82 = v3 % v81;
        int v83 = 1;
        int v84 = v82 + v83;
        bool v85 = v80 < v84;
        v79 = v79;
        v80 = v80;
        if (!v85) break;
        int v86 = 0;
        bool v87 = v2 != v86;
        int v88;
        if (v87) {
          int v89 = 4;
          v88 = v89;
        } else {
          int v90 = 1;
          int v91 = v0 + v90;
          v88 = v91;
        }
        int v92 = 1;
        int v93 = v80 + v92;
        v79 = v88;
        v80 = v93;
        continue;
        ;
      }
      v8 = v79;
      break;
    }
  }
  bool v94 = true;
  int v95 = simt_wave_count_bits(v94);
  int v96 = 0;
  int v97 = v96 + v0;
  v1[v97] = v95;
  return;
}

kernel void kernel_main(device int* v98 [[buffer(0)]], device int* v99 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v100 = static_cast<int>(__simt_tid3.x);
  int v101 = 0;
  int v102 = v101 + v100;
  int v103 = v99[v102];
  int v104 = 4;
  int v105 = v104 + v100;
  int v106 = v99[v105];
  int v107 = 0;
  bool v108 = v103 != v107;
  if (v108) {
  } else {
    int v109 = 8;
    int v110 = v109 + v100;
    int v111 = v99[v110];
    int v112 = 0;
    bool v113 = v111 != v112;
    if (v113) {
      int v114 = 4;
      int v115 = v100 % v114;
      int v116;
      v116 = v100;
      switch (v115) {
        default:
          {
          int v117 = 4;
          int v118 = v116 + v117;
          v116 = v118;
          break;
        }
        case 0:
          {
          int v119 = 2;
          int v120 = v116 + v119;
          v116 = v120;
          break;
        }
        case 1:
          {
          int v121 = 4;
          int v122 = v116 + v121;
          v116 = v122;
          break;
        }
        case 2:
          {
          int v123 = 1;
          int v124 = v116 + v123;
          v116 = v124;
          break;
        }
      }
      helper0(v100, v98, v103, v106, static_cast<int>(__simt_tid3.x));
    } else {
    }
  }
  int v125 = 12;
  int v126 = v125 + v100;
  int v127 = v99[v126];
  int v128 = 4;
  int v129;
  v129 = v128;
  switch (v127) {
    case 0:
      {
      int v130 = 16;
      int v131 = v130 + v100;
      int v132 = v99[v131];
      int v133;
      v133 = v100;
      switch (v132) {
        default:
          {
          v133 = v100;
          break;
        }
        case 0:
          {
          int v134 = 3;
          int v135 = v100 + v134;
          v133 = v135;
          break;
        }
        case 1:
          {
          int v136 = 0;
          int v137 = 0;
          int v138;
          int v139;
          v138 = v136;
          v139 = v137;
          while (true) {
            int v140 = 4;
            int v141 = v139 * v140;
            int v142 = v141 + v100;
            int v143 = 20;
            int v144 = v143 + v142;
            int v145 = v99[v144];
            int v146 = 0;
            bool v147 = v145 != v146;
            v138 = v138;
            v139 = v139;
            if (!v147) break;
            int v148 = v138 + v139;
            int v149 = 1;
            int v150 = v139 + v149;
            bool v151 = true;
            v138 = v148;
            v139 = v150;
          }
          v133 = v138;
          break;
        }
      }
      v129 = v133;
      break;
    }
    default:
      {
      int v152 = 40;
      int v153 = v152 + v100;
      int v154 = v99[v153];
      int v155 = 1;
      int v156 = v100 + v155;
      int v157;
      v157 = v156;
      switch (v154) {
        default:
          {
          int v158 = 0;
          int v159 = 0;
          int v160;
          int v161;
          v160 = v158;
          v161 = v159;
          while (true) {
            int v162 = 4;
            int v163 = v161 * v162;
            int v164 = v163 + v100;
            int v165 = 44;
            int v166 = v165 + v164;
            int v167 = v99[v166];
            int v168 = 0;
            bool v169 = v167 != v168;
            v160 = v160;
            v161 = v161;
            if (!v169) break;
            int v170 = v160 + v161;
            int v171 = 1;
            int v172 = v161 + v171;
            bool v173 = true;
            v160 = v170;
            v161 = v172;
          }
          v157 = v160;
          break;
        }
        case 0:
          {
          int v174 = 64;
          int v175 = v174 + v100;
          int v176 = v99[v175];
          int v177 = 0;
          bool v178 = v176 != v177;
          int v179;
          if (v178) {
            int v180 = 0;
            v179 = v180;
          } else {
            v179 = v100;
          }
          v157 = v179;
          break;
        }
        case 1:
          {
          int v181 = 68;
          int v182 = v181 + v100;
          int v183 = v99[v182];
          int v184;
          v184 = v100;
          switch (v183) {
            case 0:
              {
              int v185 = 3;
              int v186 = v100 + v185;
              v184 = v186;
              break;
            }
            default:
              {
              v184 = v100;
              break;
            }
            case 1:
              {
              int v187 = 1;
              v184 = v187;
              break;
            }
          }
          v157 = v184;
          break;
        }
        case 2:
          {
          int v188 = 72;
          int v189 = v188 + v100;
          int v190 = v99[v189];
          int v191 = 3;
          int v192;
          v192 = v191;
          switch (v190) {
            default:
              {
              int v193 = 0;
              v192 = v193;
            }
            case 0:
              {
              v192 = v100;
              break;
            }
          }
          bool v194 = true;
          v157 = v192;
          break;
        }
      }
      v129 = v157;
      break;
    }
    case 1:
      {
      int v195 = 76;
      int v196 = v195 + v100;
      int v197 = v99[v196];
      int v198 = 0;
      bool v199 = v197 != v198;
      int v200;
      if (v199) {
        int v201 = 2;
        int v202 = v100 + v201;
        v200 = v202;
      } else {
        int v203 = 2;
        v200 = v203;
      }
      v129 = v200;
      break;
    }
    case 2:
      {
      int v204 = 80;
      int v205 = v204 + v100;
      int v206 = v99[v205];
      int v207;
      v207 = v100;
      switch (v206) {
        case 0:
          {
          int v208 = 84;
          int v209 = v208 + v100;
          int v210 = v99[v209];
          int v211 = 4;
          int v212;
          v212 = v211;
          switch (v210) {
            default:
              {
              v212 = v100;
            }
            case 0:
              {
              int v213 = 1;
              v212 = v213;
              break;
            }
            case 1:
              {
              int v214 = 4;
              v212 = v214;
              break;
            }
          }
          v207 = v212;
          break;
        }
        case 1:
          {
          v207 = v100;
          break;
        }
        default:
          {
          int v215 = 3;
          int v216 = v100 + v215;
          v207 = v216;
        }
        case 2:
          {
          int v217 = 88;
          int v218 = v217 + v100;
          int v219 = v99[v218];
          int v220 = 3;
          int v221 = v100 + v220;
          int v222;
          v222 = v221;
          switch (v219) {
            case 0:
              {
              int v223 = 3;
              v222 = v223;
              break;
            }
            case 1:
              {
              v222 = v100;
              break;
            }
            case 2:
              {
              int v224 = 3;
              v222 = v224;
              break;
            }
            default:
              {
              v222 = v100;
              break;
            }
          }
          v207 = v222;
          break;
        }
      }
      v129 = v207;
      break;
    }
  }
  int v225 = 0;
  int v226 = 0;
  int v227;
  int v228;
  v227 = v225;
  v228 = v226;
  while (true) {
    int v229 = 4;
    int v230 = v228 * v229;
    int v231 = v230 + v100;
    int v232 = 92;
    int v233 = v232 + v231;
    int v234 = v99[v233];
    int v235 = 0;
    bool v236 = v234 != v235;
    v227 = v227;
    v228 = v228;
    if (!v236) break;
    int v237 = 3;
    int v238 = v100 + v237;
    int v239 = v227 + v238;
    int v240 = 1;
    int v241 = v228 + v240;
    bool v242 = true;
    int v243 = 16;
    int v244 = 4;
    int v245 = v228 * v244;
    int v246 = v243 + v245;
    int v247 = v246 + v100;
    bool v248 = true;
    int v249 = simt_wave_count_bits(v248);
    v98[v247] = v249;
    v227 = v239;
    v228 = v241;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 24; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 112; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
