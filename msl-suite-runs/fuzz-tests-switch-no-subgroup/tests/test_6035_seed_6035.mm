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
  int v4;
  v4 = v0;
  switch (v3) {
    case 0:
      {
      int v5 = 1;
      int v6 = v0 + v5;
      v4 = v6;
    }
    default:
      {
      int v7 = 1;
      int v8 = v0 + v7;
      v4 = v8;
      break;
    }
  }
  int v9 = 0;
  bool v10 = v2 != v9;
  int v11;
  if (v10) {
    bool v12 = true;
    int v13 = simt_wave_count_bits(v12);
    int v14 = 0;
    int v15 = v14 + v0;
    v1[v15] = v13;
    v11 = v13;
  } else {
    bool v16 = true;
    int v17 = simt_wave_count_bits(v16);
    int v18 = 16;
    int v19 = v18 + v0;
    v1[v19] = v17;
    v11 = v17;
  }
  int v20 = 0;
  bool v21 = v2 != v20;
  int v22 = v21 ? v4 : v11;
  int v23 = 0;
  bool v24 = v2 != v23;
  int v25;
  if (v24) {
    int v26 = 2;
    int v27 = v3 % v26;
    int v28;
    v28 = v0;
    switch (v27) {
      default:
        {
        int v29 = 0;
        bool v30 = v2 != v29;
        int v31;
        if (v30) {
          int v32 = 2;
          v31 = v32;
        } else {
          int v33 = 2;
          v31 = v33;
        }
        v28 = v31;
      }
      case 0:
        {
        int v34 = 3;
        v28 = v34;
        break;
      }
    }
    v25 = v28;
  } else {
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
      bool v44 = true;
      int v45 = simt_wave_count_bits(v44);
      int v46 = 32;
      int v47 = 4;
      int v48 = v38 * v47;
      int v49 = v46 + v48;
      int v50 = v49 + v0;
      v1[v50] = v45;
      int v51 = 1;
      int v52 = v38 + v51;
      v37 = v45;
      v38 = v52;
    }
    v25 = v37;
  }
  int v53 = 0;
  bool v54 = v2 != v53;
  int v55 = v54 ? v22 : v25;
  return;
}

kernel void kernel_main(device int* v56 [[buffer(0)]], device int* v57 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v58 = static_cast<int>(__simt_tid3.x);
  int v59 = 0;
  int v60 = v59 + v58;
  int v61 = v57[v60];
  int v62 = 4;
  int v63 = v62 + v58;
  int v64 = v57[v63];
  int v65 = 0;
  bool v66 = v61 != v65;
  if (v66) {
  } else {
    int v67 = 8;
    int v68 = v67 + v58;
    int v69 = v57[v68];
    int v70 = 0;
    bool v71 = v69 != v70;
    if (v71) {
    } else {
      helper0(v58, v56, v61, v64, static_cast<int>(__simt_tid3.x));
    }
  }
  int v72 = 12;
  int v73 = v72 + v58;
  int v74 = v57[v73];
  int v75;
  v75 = v58;
  switch (v74) {
    case 0:
      {
      int v76 = 3;
      int v77 = v58 + v76;
      v75 = v77;
      break;
    }
    case 1:
      {
      v75 = v58;
      break;
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
        int v83 = v81 * v82;
        int v84 = v83 + v58;
        int v85 = 16;
        int v86 = v85 + v84;
        int v87 = v57[v86];
        int v88 = 0;
        bool v89 = v87 != v88;
        v80 = v80;
        v81 = v81;
        if (!v89) break;
        int v90 = v80 + v81;
        int v91 = 1;
        int v92 = v81 + v91;
        bool v93 = true;
        v80 = v90;
        v81 = v92;
      }
      v75 = v80;
      break;
    }
    default:
      {
      int v94 = 36;
      int v95 = v94 + v58;
      int v96 = v57[v95];
      int v97 = 0;
      bool v98 = v96 != v97;
      int v99;
      if (v98) {
        int v100 = 0;
        int v101 = 0;
        int v102;
        int v103;
        v102 = v100;
        v103 = v101;
        while (true) {
          int v104 = 4;
          int v105 = v103 * v104;
          int v106 = v105 + v58;
          int v107 = 40;
          int v108 = v107 + v106;
          int v109 = v57[v108];
          int v110 = 0;
          bool v111 = v109 != v110;
          v102 = v102;
          v103 = v103;
          if (!v111) break;
          int v112 = v102 + v103;
          int v113 = 1;
          int v114 = v103 + v113;
          bool v115 = true;
          v102 = v112;
          v103 = v114;
          break;
          ;
        }
        v99 = v102;
      } else {
        int v116 = 60;
        int v117 = v116 + v58;
        int v118 = v57[v117];
        int v119 = 0;
        bool v120 = v118 != v119;
        int v121;
        if (v120) {
          v121 = v58;
        } else {
          int v122 = 0;
          v121 = v122;
        }
        v99 = v121;
      }
      v75 = v99;
      break;
    }
  }
  int v123 = 64;
  int v124 = v123 + v58;
  int v125 = v57[v124];
  int v126;
  v126 = v58;
  switch (v125) {
    case 0:
      {
      int v127 = 68;
      int v128 = v127 + v58;
      int v129 = v57[v128];
      int v130 = 0;
      int v131 = v58 + v130;
      int v132;
      v132 = v131;
      switch (v129) {
        case 0:
          {
          int v133 = 72;
          int v134 = v133 + v58;
          int v135 = v57[v134];
          int v136 = 0;
          bool v137 = v135 != v136;
          int v138;
          if (v137) {
            int v139 = 1;
            int v140 = v58 + v139;
            v138 = v140;
          } else {
            v138 = v58;
          }
          v132 = v138;
          break;
        }
        case 1:
          {
          int v141 = 76;
          int v142 = v141 + v58;
          int v143 = v57[v142];
          int v144 = 0;
          bool v145 = v143 != v144;
          int v146;
          if (v145) {
            v146 = v58;
          } else {
            int v147 = 1;
            int v148 = v58 + v147;
            v146 = v148;
          }
          v132 = v146;
        }
        default:
          {
          int v149 = 4;
          v132 = v149;
          break;
        }
      }
      v126 = v132;
    }
    case 1:
      {
      int v150 = 0;
      v126 = v150;
      break;
    }
    default:
      {
      int v151 = 80;
      int v152 = v151 + v58;
      int v153 = v57[v152];
      int v154;
      v154 = v58;
      switch (v153) {
        case 0:
          {
          int v155 = 84;
          int v156 = v155 + v58;
          int v157 = v57[v156];
          int v158 = 0;
          bool v159 = v157 != v158;
          int v160;
          if (v159) {
            int v161 = 4;
            int v162 = v58 + v161;
            v160 = v162;
          } else {
            int v163 = 4;
            int v164 = v58 + v163;
            v160 = v164;
          }
          v154 = v160;
          break;
        }
        default:
          {
          int v165 = 88;
          int v166 = v165 + v58;
          int v167 = v57[v166];
          int v168 = 3;
          int v169;
          v169 = v168;
          switch (v167) {
            case 0:
              {
              int v170 = 2;
              int v171 = v58 + v170;
              v169 = v171;
            }
            default:
              {
              v169 = v58;
              break;
            }
          }
          bool v172 = true;
          v154 = v169;
          break;
        }
        case 1:
          {
          v154 = v58;
          break;
        }
        case 2:
          {
          int v173 = 92;
          int v174 = v173 + v58;
          int v175 = v57[v174];
          int v176 = 3;
          int v177;
          v177 = v176;
          switch (v175) {
            case 0:
              {
              int v178 = 4;
              v177 = v178;
            }
            case 1:
              {
              v177 = v58;
            }
            default:
              {
              int v179 = 4;
              int v180 = v58 + v179;
              v177 = v180;
            }
            case 2:
              {
              int v181 = 0;
              v177 = v181;
              break;
            }
          }
          bool v182 = true;
          v154 = v177;
          break;
        }
      }
      bool v183 = true;
      v126 = v154;
      break;
    }
  }
  int v184 = 96;
  int v185 = v184 + v58;
  int v186 = v57[v185];
  int v187;
  v187 = v58;
  switch (v186) {
    case 0:
      {
      int v188 = 0;
      int v189 = v58 + v188;
      v187 = v189;
      break;
    }
    case 1:
      {
      int v190 = 0;
      int v191 = 0;
      int v192;
      int v193;
      v192 = v190;
      v193 = v191;
      while (true) {
        int v194 = 4;
        int v195 = v193 * v194;
        int v196 = v195 + v58;
        int v197 = 100;
        int v198 = v197 + v196;
        int v199 = v57[v198];
        int v200 = 0;
        bool v201 = v199 != v200;
        v192 = v192;
        v193 = v193;
        if (!v201) break;
        int v202 = 120;
        int v203 = v202 + v58;
        int v204 = v57[v203];
        int v205 = 0;
        bool v206 = v204 != v205;
        int v207;
        if (v206) {
          v207 = v58;
        } else {
          int v208 = 2;
          v207 = v208;
        }
        int v209 = v192 + v207;
        int v210 = 1;
        int v211 = v193 + v210;
        bool v212 = true;
        v192 = v209;
        v193 = v211;
      }
      v187 = v192;
      break;
    }
    default:
      {
      int v213 = 124;
      int v214 = v213 + v58;
      int v215 = v57[v214];
      int v216 = 0;
      int v217 = v58 + v216;
      int v218;
      v218 = v217;
      switch (v215) {
        default:
          {
          int v219 = 128;
          int v220 = v219 + v58;
          int v221 = v57[v220];
          int v222 = 3;
          int v223;
          v223 = v222;
          switch (v221) {
            case 0:
              {
              int v224 = 0;
              v223 = v224;
              break;
            }
            default:
              {
              int v225 = 2;
              int v226 = v58 + v225;
              v223 = v226;
              break;
            }
          }
          bool v227 = true;
          v218 = v223;
          break;
        }
        case 0:
          {
          int v228 = 132;
          int v229 = v228 + v58;
          int v230 = v57[v229];
          int v231;
          v231 = v58;
          switch (v230) {
            default:
              {
              int v232 = 4;
              v231 = v232;
              break;
            }
            case 0:
              {
              int v233 = 1;
              v231 = v233;
              break;
            }
          }
          bool v234 = true;
          v218 = v231;
          break;
        }
      }
      v187 = v218;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 42; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 136; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
