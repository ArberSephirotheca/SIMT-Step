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
    int v7 = 1;
    v6 = v7;
  } else {
    v6 = v0;
  }
  bool v8 = true;
  int v9 = simt_wave_count_bits(v8);
  int v10 = 0;
  int v11 = v10 + v0;
  v1[v11] = v9;
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
    uint v21 = simt_subgroup_id(__simt_tid);
    int v22 = (int)(v21);
    int v23 = 1;
    int v24 = v15 + v23;
    v14 = v22;
    v15 = v24;
  }
  bool v25 = true;
  int v26 = simt_wave_count_bits(v25);
  int v27 = 16;
  int v28 = v27 + v0;
  v1[v28] = v26;
  int v29 = 0;
  bool v30 = v2 != v29;
  int v31 = v30 ? v6 : v14;
  int v32 = 4;
  int v33 = v3 % v32;
  uint v34 = simt_subgroup_id(__simt_tid);
  int v35 = (int)(v34);
  int v36;
  v36 = v35;
  switch (v33) {
    default:
      {
      int v37 = 3;
      int v38 = v3 % v37;
      int v39 = 2;
      int v40 = v0 + v39;
      int v41;
      v41 = v40;
      switch (v38) {
        default:
          {
          int v42 = 0;
          bool v43 = v2 != v42;
          int v44;
          if (v43) {
            int v45 = 2;
            v44 = v45;
          } else {
            int v46 = 4;
            v44 = v46;
          }
          int v47 = 0;
          int v48 = v0 + v47;
          v41 = v44;
          break;
        }
        case 0:
          {
          int v49 = 4;
          int v50;
          v50 = v49;
          switch (v3) {
            case 0:
              {
              v50 = v0;
              break;
            }
            default:
              {
              int v51 = 0;
              v50 = v51;
              break;
            }
          }
          int v52 = 3;
          v41 = v50;
          break;
        }
        case 1:
          {
          int v53 = 2;
          int v54 = v3 % v53;
          int v55;
          v55 = v0;
          switch (v54) {
            case 0:
              {
              int v56 = 2;
              int v57 = v0 + v56;
              v55 = v57;
              break;
            }
            default:
              {
              int v58 = 0;
              v55 = v58;
              break;
            }
          }
          int v59 = 4;
          int v60 = v0 + v59;
          v41 = v55;
          break;
        }
        case 2:
          {
          int v61;
          v61 = v0;
          switch (v3) {
            default:
              {
              int v62 = 0;
              int v63 = v0 + v62;
              v61 = v63;
            }
            case 0:
              {
              int v64 = 4;
              v61 = v64;
              break;
            }
          }
          v41 = v61;
          break;
        }
      }
      int v65 = 1;
      int v66 = v0 + v65;
      v36 = v41;
      break;
    }
    case 0:
      {
      int v67 = 3;
      int v68 = v3 % v67;
      int v69;
      v69 = v0;
      switch (v68) {
        case 0:
          {
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
            int v79 = 4;
            int v80 = 1;
            int v81 = v73 + v80;
            v72 = v79;
            v73 = v81;
          }
          int v82 = 3;
          int v83 = v0 + v82;
          v69 = v72;
          break;
        }
        default:
          {
          int v84 = 0;
          int v85 = 0;
          int v86;
          int v87;
          v86 = v84;
          v87 = v85;
          while (true) {
            int v88 = 4;
            int v89 = v3 % v88;
            int v90 = 1;
            int v91 = v89 + v90;
            bool v92 = v87 < v91;
            v86 = v86;
            v87 = v87;
            if (!v92) break;
            int v93 = 1;
            int v94 = v0 + v93;
            int v95 = 1;
            int v96 = v87 + v95;
            v86 = v94;
            v87 = v96;
            continue;
            ;
          }
          v69 = v86;
          break;
        }
        case 1:
          {
          int v97 = 4;
          int v98 = v3 % v97;
          int v99;
          v99 = v0;
          switch (v98) {
            case 0:
              {
              int v100 = 4;
              v99 = v100;
            }
            default:
              {
              int v101 = 1;
              int v102 = v0 + v101;
              v99 = v102;
              break;
            }
            case 1:
              {
              int v103 = 1;
              int v104 = v0 + v103;
              v99 = v104;
              break;
            }
            case 2:
              {
              int v105 = 3;
              v99 = v105;
              break;
            }
          }
          v69 = v99;
          break;
        }
        case 2:
          {
          int v106 = 0;
          int v107 = 0;
          int v108;
          int v109;
          v108 = v106;
          v109 = v107;
          while (true) {
            int v110 = 4;
            int v111 = v3 % v110;
            int v112 = 1;
            int v113 = v111 + v112;
            bool v114 = v109 < v113;
            v108 = v108;
            v109 = v109;
            if (!v114) break;
            int v115 = 1;
            int v116 = v109 + v115;
            v108 = v0;
            v109 = v116;
          }
          v69 = v108;
          break;
        }
      }
      v36 = v69;
      break;
    }
    case 1:
      {
      int v117 = 0;
      int v118 = 0;
      int v119;
      int v120;
      v119 = v117;
      v120 = v118;
      while (true) {
        int v121 = 4;
        int v122 = v3 % v121;
        int v123 = 1;
        int v124 = v122 + v123;
        bool v125 = v120 < v124;
        v119 = v119;
        v120 = v120;
        if (!v125) break;
        int v126 = 4;
        int v127 = v3 % v126;
        int v128 = 4;
        int v129 = v0 + v128;
        int v130;
        v130 = v129;
        switch (v127) {
          default:
            {
            int v131 = 0;
            int v132 = v0 + v131;
            v130 = v132;
            break;
          }
          case 0:
            {
            int v133 = 4;
            int v134 = v0 + v133;
            v130 = v134;
            break;
          }
          case 1:
            {
            v130 = v0;
            break;
          }
          case 2:
            {
            int v135 = 0;
            int v136 = v0 + v135;
            v130 = v136;
            break;
          }
        }
        int v137 = 3;
        int v138 = v0 + v137;
        int v139 = 1;
        int v140 = v120 + v139;
        v119 = v130;
        v120 = v140;
        break;
        ;
      }
      v36 = v119;
      break;
    }
    case 2:
      {
      int v141 = 0;
      bool v142 = v2 != v141;
      int v143;
      if (v142) {
        int v144 = 0;
        bool v145 = v2 != v144;
        int v146;
        if (v145) {
          int v147 = 4;
          int v148 = v0 + v147;
          v146 = v148;
        } else {
          int v149 = 4;
          v146 = v149;
        }
        v143 = v146;
      } else {
        int v150 = 0;
        bool v151 = v2 != v150;
        int v152;
        if (v151) {
          int v153 = 0;
          int v154 = v0 + v153;
          v152 = v154;
        } else {
          int v155 = 3;
          v152 = v155;
        }
        int v156 = 4;
        int v157 = v0 + v156;
        v143 = v152;
      }
      v36 = v143;
      break;
    }
  }
  bool v158 = true;
  int v159 = simt_wave_count_bits(v158);
  int v160 = 32;
  int v161 = v160 + v0;
  v1[v161] = v159;
  int v162 = 0;
  bool v163 = v2 != v162;
  int v164 = v163 ? v31 : v36;
  return;
}

kernel void kernel_main(device int* v165 [[buffer(0)]], device int* v166 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v167 = static_cast<int>(__simt_tid3.x);
  int v168 = 0;
  int v169 = v168 + v167;
  int v170 = v166[v169];
  int v171 = 4;
  int v172 = v171 + v167;
  int v173 = v166[v172];
  helper0(v167, v165, v170, v173, static_cast<int>(__simt_tid3.x));
  int v174 = 0;
  int v175 = 0;
  int v176;
  int v177;
  v176 = v174;
  v177 = v175;
  while (true) {
    int v178 = 4;
    int v179 = v177 * v178;
    int v180 = v179 + v167;
    int v181 = 8;
    int v182 = v181 + v180;
    int v183 = v166[v182];
    int v184 = 0;
    bool v185 = v183 != v184;
    v176 = v176;
    v177 = v177;
    if (!v185) break;
    int v186 = 0;
    int v187 = 0;
    int v188;
    int v189;
    v188 = v186;
    v189 = v187;
    while (true) {
      int v190 = 4;
      int v191 = v189 * v190;
      int v192 = v191 + v167;
      int v193 = 28;
      int v194 = v193 + v192;
      int v195 = v166[v194];
      int v196 = 0;
      bool v197 = v195 != v196;
      v188 = v188;
      v189 = v189;
      if (!v197) break;
      int v198 = 0;
      int v199 = 0;
      int v200;
      int v201;
      v200 = v198;
      v201 = v199;
      while (true) {
        int v202 = 4;
        int v203 = v201 * v202;
        int v204 = v203 + v167;
        int v205 = 48;
        int v206 = v205 + v204;
        int v207 = v166[v206];
        int v208 = 0;
        bool v209 = v207 != v208;
        v200 = v200;
        v201 = v201;
        if (!v209) break;
        int v210 = v200 + v201;
        int v211 = 1;
        int v212 = v201 + v211;
        v200 = v210;
        v201 = v212;
      }
      bool v213 = true;
      int v214 = v188 + v200;
      int v215 = 1;
      int v216 = v189 + v215;
      v188 = v214;
      v189 = v216;
    }
    bool v217 = true;
    int v218 = v176 + v188;
    int v219 = 1;
    int v220 = v177 + v219;
    v176 = v218;
    v177 = v220;
    break;
    ;
  }
  bool v221 = true;
  int v222 = 48;
  int v223 = v222 + v167;
  bool v224 = true;
  int v225 = simt_wave_count_bits(v224);
  v165[v223] = v225;
  int v226 = 0;
  int v227 = 0;
  int v228;
  int v229;
  v228 = v226;
  v229 = v227;
  while (true) {
    int v230 = 4;
    int v231 = v229 * v230;
    int v232 = v231 + v167;
    int v233 = 68;
    int v234 = v233 + v232;
    int v235 = v166[v234];
    int v236 = 0;
    bool v237 = v235 != v236;
    v228 = v228;
    v229 = v229;
    if (!v237) break;
    int v238 = v228 + v229;
    int v239 = 1;
    int v240 = v229 + v239;
    v228 = v238;
    v229 = v240;
  }
  bool v241 = true;
  int v242 = 64;
  int v243 = v242 + v167;
  bool v244 = true;
  int v245 = simt_wave_count_bits(v244);
  v165[v243] = v245;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 88; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
