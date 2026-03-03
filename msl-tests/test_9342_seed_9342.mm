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
  int v6 = 3;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 3;
      int v10 = v3 % v9;
      int v11;
      v11 = v0;
      switch (v10) {
        case 0:
          {
          int v12 = 2;
          int v13 = v3 % v12;
          int v14;
          v14 = v0;
          switch (v13) {
            case 0:
              {
              int v15 = 4;
              int v16 = v0 + v15;
              v14 = v16;
              break;
            }
            default:
              {
              int v17 = 3;
              int v18 = v0 + v17;
              v14 = v18;
              break;
            }
            case 1:
              {
              int v19 = 1;
              v14 = v19;
              break;
            }
          }
          v11 = v14;
        }
        case 1:
          {
          int v20 = 0;
          int v21 = 0;
          int v22;
          int v23;
          v22 = v20;
          v23 = v21;
          while (true) {
            int v24 = 4;
            int v25 = v3 % v24;
            int v26 = 1;
            int v27 = v25 + v26;
            bool v28 = v23 < v27;
            v22 = v22;
            v23 = v23;
            if (!v28) break;
            int v29 = 0;
            int v30 = v0 + v29;
            int v31 = 1;
            int v32 = v23 + v31;
            v22 = v30;
            v23 = v32;
          }
          int v33 = 3;
          int v34 = v0 + v33;
          v11 = v22;
          break;
        }
        case 2:
          {
          int v35 = 0;
          int v36 = 0;
          int v37;
          int v38;
          v37 = v35;
          v38 = v36;
          while (true) {
            int v39 = 4;
            int v40 = v3 % v39;
            int v41 = 1;
            int v42 = v40 + v41;
            bool v43 = v38 < v42;
            v37 = v37;
            v38 = v38;
            if (!v43) break;
            int v44 = 1;
            int v45 = v0 + v44;
            int v46 = 1;
            int v47 = v38 + v46;
            v37 = v45;
            v38 = v47;
          }
          int v48 = 0;
          int v49 = v0 + v48;
          v11 = v37;
        }
        default:
          {
          int v50 = 0;
          int v51 = 0;
          int v52;
          int v53;
          v52 = v50;
          v53 = v51;
          while (true) {
            int v54 = 4;
            int v55 = v3 % v54;
            int v56 = 1;
            int v57 = v55 + v56;
            bool v58 = v53 < v57;
            v52 = v52;
            v53 = v53;
            if (!v58) break;
            int v59 = 2;
            int v60 = v0 + v59;
            int v61 = 1;
            int v62 = v53 + v61;
            v52 = v60;
            v53 = v62;
            break;
            ;
          }
          v11 = v52;
          break;
        }
      }
      int v63 = 0;
      int v64 = v0 + v63;
      v8 = v11;
    }
    case 1:
      {
      int v65 = 0;
      bool v66 = v2 != v65;
      int v67;
      if (v66) {
        int v68 = 3;
        int v69 = v3 % v68;
        int v70 = 1;
        int v71;
        v71 = v70;
        switch (v69) {
          case 0:
            {
            int v72 = 2;
            int v73 = v0 + v72;
            v71 = v73;
          }
          default:
            {
            int v74 = 2;
            v71 = v74;
          }
          case 1:
            {
            v71 = v0;
          }
          case 2:
            {
            int v75 = 1;
            v71 = v75;
            break;
          }
        }
        v67 = v71;
      } else {
        int v76 = 2;
        int v77 = v3 % v76;
        int v78;
        v78 = v0;
        switch (v77) {
          case 0:
            {
            int v79 = 3;
            v78 = v79;
          }
          default:
            {
            int v80 = 4;
            v78 = v80;
            break;
          }
          case 1:
            {
            int v81 = 0;
            int v82 = v0 + v81;
            v78 = v82;
            break;
          }
        }
        v67 = v78;
      }
      v8 = v67;
    }
    default:
      {
      int v83 = 0;
      bool v84 = v2 != v83;
      int v85;
      if (v84) {
        int v86 = 3;
        int v87 = v3 % v86;
        int v88 = 4;
        int v89 = v0 + v88;
        int v90;
        v90 = v89;
        switch (v87) {
          case 0:
            {
            int v91 = 0;
            int v92 = v0 + v91;
            v90 = v92;
          }
          case 1:
            {
            v90 = v0;
          }
          case 2:
            {
            int v93 = 2;
            int v94 = v0 + v93;
            v90 = v94;
            break;
          }
          default:
            {
            v90 = v0;
            break;
          }
        }
        v85 = v90;
      } else {
        int v95 = 2;
        int v96 = v0 + v95;
        v85 = v96;
      }
      int v97 = 1;
      int v98 = v0 + v97;
      v8 = v85;
    }
    case 2:
      {
      int v99 = 1;
      int v100 = v0 + v99;
      v8 = v100;
      break;
    }
  }
  bool v101 = true;
  int v102 = simt_wave_count_bits(v101);
  int v103 = 0;
  int v104 = v103 + v0;
  v1[v104] = v102;
  return;
}

kernel void kernel_main(device int* v105 [[buffer(0)]], device int* v106 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v107 = static_cast<int>(__simt_tid3.x);
  int v108 = 0;
  int v109 = v108 + v107;
  int v110 = v106[v109];
  int v111 = 4;
  int v112 = v111 + v107;
  int v113 = v106[v112];
  helper0(v107, v105, v110, v113, static_cast<int>(__simt_tid3.x));
  int v114 = 8;
  int v115 = v114 + v107;
  int v116 = v106[v115];
  int v117 = 3;
  int v118 = v107 + v117;
  int v119;
  v119 = v118;
  switch (v116) {
    case 0:
      {
      int v120 = 12;
      int v121 = v120 + v107;
      int v122 = v106[v121];
      int v123 = 4;
      int v124 = v107 + v123;
      int v125;
      v125 = v124;
      switch (v122) {
        case 0:
          {
          int v126 = 4;
          v125 = v126;
        }
        default:
          {
          int v127 = 0;
          int v128 = 0;
          int v129;
          int v130;
          v129 = v127;
          v130 = v128;
          while (true) {
            int v131 = 4;
            int v132 = v130 * v131;
            int v133 = v132 + v107;
            int v134 = 16;
            int v135 = v134 + v133;
            int v136 = v106[v135];
            int v137 = 0;
            bool v138 = v136 != v137;
            v129 = v129;
            v130 = v130;
            if (!v138) break;
            int v139 = v129 + v130;
            int v140 = 1;
            int v141 = v130 + v140;
            v129 = v139;
            v130 = v141;
            break;
            ;
          }
          bool v142 = true;
          v125 = v129;
        }
        case 1:
          {
          int v143 = 0;
          int v144 = 0;
          int v145;
          int v146;
          v145 = v143;
          v146 = v144;
          while (true) {
            int v147 = 4;
            int v148 = v146 * v147;
            int v149 = v148 + v107;
            int v150 = 36;
            int v151 = v150 + v149;
            int v152 = v106[v151];
            int v153 = 0;
            bool v154 = v152 != v153;
            v145 = v145;
            v146 = v146;
            if (!v154) break;
            int v155 = v145 + v146;
            int v156 = 1;
            int v157 = v146 + v156;
            v145 = v155;
            v146 = v157;
            break;
            ;
          }
          bool v158 = true;
          v125 = v145;
          break;
        }
      }
      bool v159 = true;
      v119 = v125;
      break;
    }
    default:
      {
      int v160 = 56;
      int v161 = v160 + v107;
      int v162 = v106[v161];
      int v163;
      v163 = v107;
      switch (v162) {
        default:
          {
          int v164 = 60;
          int v165 = v164 + v107;
          int v166 = v106[v165];
          int v167 = 0;
          bool v168 = v166 != v167;
          int v169;
          if (v168) {
            int v170 = 0;
            v169 = v170;
          } else {
            int v171 = 2;
            v169 = v171;
          }
          v163 = v169;
          break;
        }
        case 0:
          {
          int v172 = 0;
          int v173 = 0;
          int v174;
          int v175;
          v174 = v172;
          v175 = v173;
          while (true) {
            int v176 = 4;
            int v177 = v175 * v176;
            int v178 = v177 + v107;
            int v179 = 64;
            int v180 = v179 + v178;
            int v181 = v106[v180];
            int v182 = 0;
            bool v183 = v181 != v182;
            v174 = v174;
            v175 = v175;
            if (!v183) break;
            int v184 = v174 + v175;
            int v185 = 1;
            int v186 = v175 + v185;
            v174 = v184;
            v175 = v186;
          }
          bool v187 = true;
          v163 = v174;
          break;
        }
      }
      bool v188 = true;
      v119 = v163;
      break;
    }
  }
  bool v189 = true;
  int v190 = 16;
  int v191 = v190 + v107;
  bool v192 = true;
  int v193 = simt_wave_count_bits(v192);
  v105[v191] = v193;
  int v194 = 84;
  int v195 = v194 + v107;
  int v196 = v106[v195];
  int v197 = 0;
  bool v198 = v196 != v197;
  int v199;
  if (v198) {
    int v200 = 88;
    int v201 = v200 + v107;
    int v202 = v106[v201];
    int v203 = 0;
    bool v204 = v202 != v203;
    int v205;
    if (v204) {
      int v206 = 92;
      int v207 = v206 + v107;
      int v208 = v106[v207];
      int v209;
      v209 = v107;
      switch (v208) {
        case 0:
          {
          int v210 = 1;
          int v211 = v107 + v210;
          v209 = v211;
          break;
        }
        case 1:
          {
          int v212 = 0;
          v209 = v212;
          break;
        }
        case 2:
          {
          int v213 = 1;
          int v214 = v107 + v213;
          v209 = v214;
          break;
        }
        default:
          {
          v209 = v107;
          break;
        }
      }
      bool v215 = true;
      v205 = v209;
    } else {
      int v216 = 96;
      int v217 = v216 + v107;
      int v218 = v106[v217];
      uint v219 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v220 = (int)(v219);
      int v221;
      v221 = v220;
      switch (v218) {
        default:
          {
          v221 = v107;
          break;
        }
        case 0:
          {
          int v222 = 1;
          v221 = v222;
          break;
        }
        case 1:
          {
          int v223 = 4;
          v221 = v223;
          break;
        }
      }
      bool v224 = true;
      v205 = v221;
    }
    v199 = v205;
  } else {
    int v225 = 100;
    int v226 = v225 + v107;
    int v227 = v106[v226];
    int v228 = 0;
    bool v229 = v227 != v228;
    int v230;
    if (v229) {
      v230 = v107;
    } else {
      int v231 = 104;
      int v232 = v231 + v107;
      int v233 = v106[v232];
      int v234 = 0;
      bool v235 = v233 != v234;
      int v236;
      if (v235) {
        uint v237 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v238 = (int)(v237);
        v236 = v238;
      } else {
        int v239 = 0;
        int v240 = v107 + v239;
        v236 = v240;
      }
      v230 = v236;
    }
    v199 = v230;
  }
  int v241 = 32;
  int v242 = v241 + v107;
  bool v243 = true;
  int v244 = simt_wave_count_bits(v243);
  v105[v242] = v244;
  int v245 = 0;
  int v246 = 0;
  int v247;
  int v248;
  v247 = v245;
  v248 = v246;
  while (true) {
    int v249 = 4;
    int v250 = v248 * v249;
    int v251 = v250 + v107;
    int v252 = 108;
    int v253 = v252 + v251;
    int v254 = v106[v253];
    int v255 = 0;
    bool v256 = v254 != v255;
    v247 = v247;
    v248 = v248;
    if (!v256) break;
    int v257 = v247 + v107;
    int v258 = 1;
    int v259 = v248 + v258;
    v247 = v257;
    v248 = v259;
    break;
    ;
  }
  bool v260 = true;
  int v261 = 48;
  int v262 = v261 + v107;
  bool v263 = true;
  int v264 = simt_wave_count_bits(v263);
  v105[v262] = v264;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 128; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
