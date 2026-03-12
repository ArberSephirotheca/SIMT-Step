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
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 3;
      int v10 = v3 % v9;
      int v11 = 1;
      int v12 = v0 + v11;
      int v13;
      v13 = v12;
      switch (v10) {
        case 0:
          {
          v13 = v0;
          break;
        }
        default:
          {
          int v14 = 3;
          int v15 = v3 % v14;
          int v16 = 1;
          int v17;
          v17 = v16;
          switch (v15) {
            case 0:
              {
              v17 = v0;
              break;
            }
            case 1:
              {
              int v18 = 1;
              int v19 = v0 + v18;
              v17 = v19;
            }
            default:
              {
              int v20 = 4;
              int v21 = v0 + v20;
              v17 = v21;
              break;
            }
          }
          int v22 = 2;
          v13 = v17;
          break;
        }
        case 1:
          {
          int v23 = 0;
          int v24 = 0;
          int v25;
          int v26;
          v25 = v23;
          v26 = v24;
          while (true) {
            int v27 = 4;
            int v28 = v3 % v27;
            int v29 = 1;
            int v30 = v28 + v29;
            bool v31 = v26 < v30;
            v25 = v25;
            v26 = v26;
            if (!v31) break;
            int v32 = 3;
            int v33 = 1;
            int v34 = v26 + v33;
            v25 = v32;
            v26 = v34;
          }
          int v35 = 0;
          v13 = v25;
          break;
        }
      }
      v8 = v13;
      break;
    }
    case 1:
      {
      int v36 = 3;
      int v37 = v3 % v36;
      int v38;
      v38 = v0;
      switch (v37) {
        default:
          {
          int v39 = 2;
          int v40 = v3 % v39;
          int v41 = 2;
          int v42 = v0 + v41;
          int v43;
          v43 = v42;
          switch (v40) {
            default:
              {
              v43 = v0;
            }
            case 0:
              {
              v43 = v0;
              break;
            }
          }
          v38 = v43;
          break;
        }
        case 0:
          {
          int v44 = 3;
          int v45 = v3 % v44;
          int v46;
          v46 = v0;
          switch (v45) {
            case 0:
              {
              int v47 = 4;
              int v48 = v0 + v47;
              v46 = v48;
              break;
            }
            default:
              {
              int v49 = 3;
              v46 = v49;
              break;
            }
            case 1:
              {
              v46 = v0;
              break;
            }
          }
          int v50 = 3;
          v38 = v46;
          break;
        }
        case 1:
          {
          int v51 = 0;
          bool v52 = v2 != v51;
          int v53;
          if (v52) {
            int v54 = 3;
            int v55 = v0 + v54;
            v53 = v55;
          } else {
            int v56 = 2;
            int v57 = v0 + v56;
            v53 = v57;
          }
          int v58 = 2;
          v38 = v53;
        }
        case 2:
          {
          int v59 = 0;
          int v60 = 0;
          int v61;
          int v62;
          v61 = v59;
          v62 = v60;
          while (true) {
            int v63 = 4;
            int v64 = v3 % v63;
            int v65 = 1;
            int v66 = v64 + v65;
            bool v67 = v62 < v66;
            v61 = v61;
            v62 = v62;
            if (!v67) break;
            int v68 = 1;
            int v69 = 1;
            int v70 = v62 + v69;
            v61 = v68;
            v62 = v70;
            break;
            ;
          }
          v38 = v61;
          break;
        }
      }
      int v71 = 4;
      v8 = v38;
      break;
    }
    default:
      {
      int v72 = 3;
      int v73 = v3 % v72;
      int v74;
      v74 = v0;
      switch (v73) {
        case 0:
          {
          int v75 = 0;
          int v76 = 0;
          int v77;
          int v78;
          v77 = v75;
          v78 = v76;
          while (true) {
            int v79 = 4;
            int v80 = v3 % v79;
            int v81 = 1;
            int v82 = v80 + v81;
            bool v83 = v78 < v82;
            v77 = v77;
            v78 = v78;
            if (!v83) break;
            int v84 = 1;
            int v85 = v78 + v84;
            v77 = v0;
            v78 = v85;
          }
          int v86 = 2;
          v74 = v77;
          break;
        }
        default:
          {
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
          }
          int v98 = 0;
          v74 = v89;
          break;
        }
        case 1:
          {
          int v99 = 0;
          v74 = v99;
          break;
        }
        case 2:
          {
          int v100 = 3;
          int v101 = v3 % v100;
          int v102;
          v102 = v0;
          switch (v101) {
            default:
              {
              v102 = v0;
              break;
            }
            case 0:
              {
              int v103 = 2;
              int v104 = v0 + v103;
              v102 = v104;
              break;
            }
            case 1:
              {
              int v105 = 1;
              int v106 = v0 + v105;
              v102 = v106;
              break;
            }
            case 2:
              {
              int v107 = 2;
              v102 = v107;
              break;
            }
          }
          int v108 = 3;
          int v109 = v0 + v108;
          v74 = v102;
          break;
        }
      }
      int v110 = 4;
      int v111 = v0 + v110;
      v8 = v74;
      break;
    }
  }
  bool v112 = true;
  int v113 = simt_wave_count_bits(v112);
  int v114 = 0;
  int v115 = v114 + v0;
  v1[v115] = v113;
  return;
}

kernel void kernel_main(device int* v116 [[buffer(0)]], device int* v117 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v118 = static_cast<int>(__simt_tid3.x);
  int v119 = 0;
  int v120 = v119 + v118;
  int v121 = v117[v120];
  int v122 = 4;
  int v123 = v122 + v118;
  int v124 = v117[v123];
  helper0(v118, v116, v121, v124, static_cast<int>(__simt_tid3.x));
  int v125 = 0;
  int v126 = 0;
  int v127;
  int v128;
  v127 = v125;
  v128 = v126;
  while (true) {
    int v129 = 4;
    int v130 = v128 * v129;
    int v131 = v130 + v118;
    int v132 = 8;
    int v133 = v132 + v131;
    int v134 = v117[v133];
    int v135 = 0;
    bool v136 = v134 != v135;
    v127 = v127;
    v128 = v128;
    if (!v136) break;
    int v137 = v127 + v128;
    int v138 = 1;
    int v139 = v128 + v138;
    v127 = v137;
    v128 = v139;
  }
  bool v140 = true;
  int v141 = 16;
  int v142 = v141 + v118;
  bool v143 = true;
  int v144 = simt_wave_count_bits(v143);
  v116[v142] = v144;
  int v145 = 28;
  int v146 = v145 + v118;
  int v147 = v117[v146];
  int v148 = 3;
  int v149 = v118 + v148;
  int v150;
  v150 = v149;
  switch (v147) {
    case 0:
      {
      int v151 = 0;
      int v152 = 0;
      int v153;
      int v154;
      v153 = v151;
      v154 = v152;
      while (true) {
        int v155 = 4;
        int v156 = v154 * v155;
        int v157 = v156 + v118;
        int v158 = 32;
        int v159 = v158 + v157;
        int v160 = v117[v159];
        int v161 = 0;
        bool v162 = v160 != v161;
        v153 = v153;
        v154 = v154;
        if (!v162) break;
        int v163 = v153 + v154;
        int v164 = 1;
        int v165 = v154 + v164;
        v153 = v163;
        v154 = v165;
        break;
        ;
      }
      bool v166 = true;
      v150 = v153;
      break;
    }
    default:
      {
      int v167 = 52;
      int v168 = v167 + v118;
      int v169 = v117[v168];
      int v170 = 1;
      int v171 = v118 + v170;
      int v172;
      v172 = v171;
      switch (v169) {
        default:
          {
          int v173 = 2;
          int v174 = v118 + v173;
          v172 = v174;
          break;
        }
        case 0:
          {
          int v175 = 3;
          int v176 = v118 + v175;
          v172 = v176;
          break;
        }
      }
      bool v177 = true;
      v150 = v172;
      break;
    }
    case 1:
      {
      int v178 = 4;
      int v179 = v118 + v178;
      v150 = v179;
      break;
    }
  }
  bool v180 = true;
  int v181 = 32;
  int v182 = v181 + v118;
  bool v183 = true;
  int v184 = simt_wave_count_bits(v183);
  v116[v182] = v184;
  int v185 = 56;
  int v186 = v185 + v118;
  int v187 = v117[v186];
  int v188 = 3;
  int v189;
  v189 = v188;
  switch (v187) {
    case 0:
      {
      int v190 = 60;
      int v191 = v190 + v118;
      int v192 = v117[v191];
      int v193 = 0;
      bool v194 = v192 != v193;
      int v195;
      if (v194) {
        int v196 = 64;
        int v197 = v196 + v118;
        int v198 = v117[v197];
        int v199;
        v199 = v118;
        switch (v198) {
          default:
            {
            int v200 = 3;
            v199 = v200;
          }
          case 0:
            {
            int v201 = 4;
            int v202 = v118 + v201;
            v199 = v202;
            break;
          }
        }
        bool v203 = true;
        v195 = v199;
      } else {
        v195 = v118;
      }
      v189 = v195;
      break;
    }
    default:
      {
      int v204 = 68;
      int v205 = v204 + v118;
      int v206 = v117[v205];
      int v207;
      v207 = v118;
      switch (v206) {
        default:
          {
          int v208 = 72;
          int v209 = v208 + v118;
          int v210 = v117[v209];
          int v211;
          v211 = v118;
          switch (v210) {
            default:
              {
              v211 = v118;
              break;
            }
            case 0:
              {
              int v212 = 0;
              int v213 = v118 + v212;
              v211 = v213;
              break;
            }
            case 1:
              {
              int v214 = 3;
              v211 = v214;
              break;
            }
            case 2:
              {
              int v215 = 1;
              v211 = v215;
              break;
            }
          }
          bool v216 = true;
          v207 = v211;
          break;
        }
        case 0:
          {
          int v217 = 76;
          int v218 = v217 + v118;
          int v219 = v117[v218];
          int v220 = 0;
          bool v221 = v219 != v220;
          int v222;
          if (v221) {
            int v223 = 4;
            v222 = v223;
          } else {
            v222 = v118;
          }
          v207 = v222;
          break;
        }
        case 1:
          {
          int v224 = 80;
          int v225 = v224 + v118;
          int v226 = v117[v225];
          int v227 = 2;
          int v228;
          v228 = v227;
          switch (v226) {
            case 0:
              {
              int v229 = 2;
              v228 = v229;
              break;
            }
            default:
              {
              v228 = v118;
              break;
            }
            case 1:
              {
              v228 = v118;
            }
            case 2:
              {
              v228 = v118;
              break;
            }
          }
          bool v230 = true;
          v207 = v228;
          break;
        }
      }
      bool v231 = true;
      v189 = v207;
      break;
    }
  }
  bool v232 = true;
  int v233 = 48;
  int v234 = v233 + v118;
  bool v235 = true;
  int v236 = simt_wave_count_bits(v235);
  v116[v234] = v236;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 84; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
